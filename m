Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7A0C54E71
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 19:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjWuWnLNMDAg928Oq4r31h1tX/ZLPdysAzkmoZ/uPsg=; b=eTm3mV+ZNQhAh0
	Xope6SUDrTdtEfzWXqup9VYK3Mp0LQXFCf71+8agjgl1J7aGS6doW5WQdbwCsy88TAUHipDriOkxM
	nHSsHQC/rKiR43dXuGX2MDKJCy5H6iTV8sAXN+MHR96Rwgcq4LvQReyhgjmknGn2NG0P+D3rpXzM7
	d/7QnRZ2hZnXJ6N25NWCICT8nALm8MHevJs5lWtORD/lt1pSFfQPukS0JhxmrIiOYmko1TWeetiMg
	5b6d0pcEXjT5dqKv3XNQ8cgiZ3zDsY3ES2MTwTcHltAjYwusWresz8+CmLYWfNIpMjKCjHLo8RGqu
	N2+j5Ojqc7aHfizKrNfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmelg-0000000DvNX-0uwF;
	Tue, 19 Mar 2024 19:05:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmelT-0000000DvGr-2rw4;
	Tue, 19 Mar 2024 19:04:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 570AECE0EE1;
	Tue, 19 Mar 2024 19:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A3EC433F1;
	Tue, 19 Mar 2024 19:04:42 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] perf: starfive: fix 64-bit only COMPILE_TEST condition
Date: Tue, 19 Mar 2024 19:04:40 +0000
Message-Id: <171087507362.45404.9535094447088311477.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318-emphatic-rally-f177a4fe1bdc@spud>
References: <20240318-emphatic-rally-f177a4fe1bdc@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_120447_944476_29D02DB9 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 18 Mar 2024 15:35:04 +0000, Conor Dooley wrote:
> ARCH_STARFIVE is not restricted to 64-bit platforms, so while Will's
> addition of a 64-bit only condition satisfied the build robots doing
> COMPILE_TEST builds, Palmer ran into the same problems with writeq()
> being undefined during regular rv32 builds.
> 
> Promote the dependency on 64-bit to its own `depends on` so that the
> driver can never be included in 32-bit builds.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] perf: starfive: fix 64-bit only COMPILE_TEST condition
      https://git.kernel.org/arm64/c/1d63d1d9e5c5

-- 
Catalin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
