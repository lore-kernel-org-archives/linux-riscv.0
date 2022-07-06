Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC6AC43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 16:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ju+VGGFfe6AST3ypkA+gnGACWHmIfJ+pt6yhIjrWjdY=; b=Zv8fEnneGM55T4
	sSJ8iBQGT1Ktp6N1HE+Z1v2STEbTqyvNlLhhqmM5LpErcKDVd4nRLKPCghU7jdSP5vbl1e2o+v3Yv
	aMQCbp8eF1AzvF4aEMZNoNk2Pek861GZQ46CkvGtwC0yPpR+/o4UKeJEfBwPNtlv/aEJqLnUGupC0
	crR4Qg29EvcIJrRiL8ItWkgBCha8Ncb8oriVfb2qwL08yyYw7me1ncbK1gpeNBE4wd+IswJ4i2VcH
	fERX/jWSCO9I2HAzZQ7Vuwl0AQ+dAEsi39na5j5jTlhGWUTpl2owqLbvPZ0XQjqieFXAMd7XSi+xZ
	N5V7XSJb0VtLhD15I7Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o98HN-00BUhx-Bk; Wed, 06 Jul 2022 16:53:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o98Eh-00BTkN-4j; Wed, 06 Jul 2022 16:50:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 74B3E61CF8;
	Wed,  6 Jul 2022 16:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252E7C341CB;
	Wed,  6 Jul 2022 16:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657126245;
	bh=huZALYPFKBr4Np8d7D2qyaWr0GwXSIislDPcn8eFpkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aBzQlPV1dZT3PFatvoynD8ldDTQl8Zwj3jb35ihkPVgvSTGXYsDDh7SCKL0KwQPmY
	 8jTUHHXrFDW6apWQjBCeMA3a5xVkpFhcr32fac4VWuVLUm8X6WkD74juqSm26iPVLZ
	 MGUt9RCQD8DGJV1f7hLnHQuJNZ8LiXBbuCo1gMvA2m0U/SRJuTjwEYoeqJQ8CmPDMi
	 6bv+Q+hUpqKadeTymHbyjPAUbiCaeZR7Ja6iP0YlmHCArxo9tA3jW9aRvA+0Wncgap
	 wrgvORyVScpUecTMCevWM0Z6xnS45DvYqOkIFob9w/xic2n+0OKl6+/Gw/mWtYGQbh
	 aoRzEkAUyhzBg==
From: Will Deacon <will@kernel.org>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	Eric Lin <eric.lin@sifive.com>,
	atishp@atishpatra.org,
	atishp@rivosinc.com,
	mark.rutland@arm.com,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	greentime.hu@sifive.com
Subject: Re: [PATCH] drivers/perf: riscv_pmu: Add riscv pmu pm notifier
Date: Wed,  6 Jul 2022 17:50:31 +0100
Message-Id: <165710145080.2497812.7883037173076290820.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220705091920.27432-1-eric.lin@sifive.com>
References: <20220705091920.27432-1-eric.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_095047_253802_239E656E 
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

On Tue, 5 Jul 2022 17:19:20 +0800, Eric Lin wrote:
> Currently, when the CPU is doing suspend to ram, we don't
> save pmu counter register and its content will be lost.
> 
> To ensure perf profiling is not affected by suspend to ram,
> this patch is based on arm_pmu CPU_PM notifier and implements riscv
> pmu pm notifier. In the pm notifier, we stop the counter and update
> the counter value before suspend and start the counter after resume.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] drivers/perf: riscv_pmu: Add riscv pmu pm notifier
      https://git.kernel.org/will/c/e9a023f2b73a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
