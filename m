Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CDFEB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 09:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CvQdR3RB+6tYM85kmeCu9ZLbFoZcA7to7ZVNOdTz4d8=; b=3AzQjhx3m3hP6j
	1e5eT/dpxrTUp4IMBWIBA9yrbOKBVGMs1gBSPZOO8Y0DU5VR8Csel0ETgLgm2j3FMFE2C1E2wyv8N
	QvrzWCPOuk2FeOkTYrgVZN+8WtTYVjBO//k3RNQeuYPO0yeVutEcvsz+LusIPILHGp3wkpib5yGRc
	SKLwpmjJ6YRRZsv75vmh1F5LMnUXEJA5LrZ7m/3Bpd9G8HvEISzhGPW8ehXS8SsVq9q6ExhKGG+ex
	nUW1bq2MPBMfq77G3aIJGKZOdAzgnz+09abT2W+XracwkokTKlSZpDvJI5uY0oXxuHDnH5e9qNi0o
	uRPvht9/Xdge7VHaan/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKy19-00AR7O-13;
	Sun, 16 Jul 2023 09:26:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKy16-00AR5P-0q
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jul 2023 09:26:13 +0000
Received: from i53875a6a.versanet.de ([83.135.90.106] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qKy0y-0005uT-Ub; Sun, 16 Jul 2023 11:26:04 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com
Cc: vineetg@rivosinc.com, bjorn@kernel.org, greentime.hu@sifive.com,
 paul.walmsley@sifive.com, guoren@linux.alibaba.com, anup@brainfault.org,
 atishp@atishpatra.org, heiko.stuebner@vrull.eu,
 Andy Chiu <andy.chiu@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [v1, 0/6] riscv: support kernel-mode Vector
Date: Sun, 16 Jul 2023 11:26:03 +0200
Message-ID: <4216859.NG923GbCHz@phil>
In-Reply-To: <20230715150032.6917-1-andy.chiu@sifive.com>
References: <20230715150032.6917-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_022612_323136_2FB0CDF4 
X-CRM114-Status: GOOD (  21.13  )
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

Am Samstag, 15. Juli 2023, 17:00:26 CEST schrieb Andy Chiu:
> This series provides support for running Vector code in kernel mode. The
> implementation is based on the v12 series of the Vector series, but with
> some additions. First, we introduce a mechanism to defer restoring
> Vector context for userspace programs (patch 1). This is similar to
> arm64 and x86's approaches when dealing with extra userspace register
> context. And it is benefitial to both Vector in user and kernel-mode.
> Then, patch 2, 3 add the kernel-mode Vector patch from v12 with minor
> modifications. At the end of the series, patch 4, 5, 6 add supports for
> making kernel-mode Vector code preemptible. We do this by adding
> kernel-mode Vector context, and keeping track of the frame where V
> context is last valid. We believe that enabling preemption of running V
> is a critical path for getting V more generally available in the
> kernel-mode. Besides, with status.VS, we can easily tell if
> saving/restoring V is required. This reduce the level of cost when
> running SIMD in kernel mode as compared to other arches. Other arches
> usually do not have a way to tell if extra context is dirty. Thus, if
> they also want to support running preemptible code with extra registers,
> then they must save/restore extra context at each context switch even if
> registers are not dirty.
> 
> The series is tested by loading a kernel module on a preemptive kernel.
> The module launches multiple kworkers which run Vector operations and
> verifies with scalar code. Also, the module provides userspace intefaces
> via fops to verify if we can run Vector code on syscall path.
> 
> Changes from the vector v12 series (for patch 2, 3):
>  - return a failure code when kernel_rvv_begin() fails.
>  - Do not immediately restore user's V context.

This works nicely with my vector crypto patchset rebased on
top of it:

Tested-by: Heiko Stuebner <heiko@sntech.de>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
