Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03920C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 16:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pv0pbhNx2iF//iL/y1X0uAY/H7MZsFgaAr1SOHLIzRY=; b=KLyf4OOFlkXXPq
	Z20OwwVlOkeMBI3YC5solyWqYrZUugG2i82tVXEUoF6igpgnmVOtJq4vxuQD+tzmFRD1Kvvnb8+SK
	q8JXoiHWWkm97oWvjJ6vr/XcU6wrWa+2h0lNVjcpj8eYNLlfwZhVQam2GngRTf8nLiOa7OAbKk+rI
	gGcUYHrnsQAQLBrNQfwzp3E0qWXnpZJ4GPE7l8gcln7n2cR8iBdQB/1D+rYh1TY8mBnCXEjo7QodS
	1cvRzaSGnd3WJwsXCT5K6DH5kmg44ZfcmjC6AMLsEnOFqqJN9VzUX289KnMoEsx9oIl6BK2jtU/mp
	jGPJud/A1rLFhHjtjFFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeIq1-00AZlu-HN; Fri, 30 Sep 2022 16:26:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeIpr-00AZjM-C4; Fri, 30 Sep 2022 16:26:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A48CE622AB;
	Fri, 30 Sep 2022 16:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733BEC433D6;
	Fri, 30 Sep 2022 16:25:55 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	maz@kernel.org,
	alexandru.elisei@arm.com,
	will@kernel.org,
	Liao Chang <liaochang1@huawei.com>,
	palmer@dabbelt.com,
	guoren@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org
Subject: Re: (subset) [PATCH V4 0/3] kprobe: Optimize the performance of patching ss
Date: Fri, 30 Sep 2022 17:25:53 +0100
Message-Id: <166455513411.3737568.2438972272060446845.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220927022435.129965-1-liaochang1@huawei.com>
References: <20220927022435.129965-1-liaochang1@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_092559_464996_F5AF2DA6 
X-CRM114-Status: UNSURE (   9.99  )
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

On Tue, 27 Sep 2022 10:24:32 +0800, Liao Chang wrote:
> Single-step slot would not be used until kprobe is enabled, that means
> no race condition occurs on it under SMP, hence it is safe to pacth ss
> slot without stopping machine.
> 
> v4:
> 1. Add Acked-by from Will Deacon
> 2. Mark Rutland provides some subtleties on arm64 micro-architecture
>    that needs to follow.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[3/3] arm64/kprobe: Optimize the performance of patching single-step slot
      https://git.kernel.org/arm64/c/a0caebbd0460

-- 
Catalin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
