Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C513DC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 18:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XOpBuAst7VGK0G8a0lMZqeWCHfNbCM1hBDVNgNJgVU=; b=lXkh4zuNQ5pB/0GQyGBI/t1a0N
	65sa7BHaG6S8oCe7LQeOcGrAeUySywQF0CmkGGMs4bqnZvPWWgCWpzU9LLcfBuKmaqJRxi1NpGkSb
	pmMJjjxjle1djbW95b9hsNLO+ar02e+suM8kCuEv7ZKzwCUEjqPbS+9HvvL5PiwFEM8fKcPfLJ4Ip
	qPjyofGGHTPTba2Om1CknbeuVCjKjAvabwZ1c+lJAuy0VwcFcYIviKJvyBlNWflP3uOF6F09AzCH7
	0aZ582AuVCG3hK/Zje9Rxr8BKL8ULWQlaPBf7mO5lNow9+VOU+9ybSP6+dSd80nMxdQjOGdv7u6rx
	3Jd4E5rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjLBD-0000000ABiU-1RKe;
	Mon, 13 Jul 2026 18:14:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjLBC-0000000ABiG-15Po
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 18:14:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9232860103;
	Mon, 13 Jul 2026 18:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F1C1F000E9;
	Mon, 13 Jul 2026 18:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783966497;
	bh=JyASWAKAD6ak8FJcxWdDEg+sFNwuVoRQymBg/98oo+M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=byb5BROkJpBcOzvzYTSnccebRDOp9+OET/OpjUZrjGZHZfc9R2wq7LMXGJdJ4XIjM
	 5PRtd3cH6rYC9RmoqhiVrXGZjALT+HBoS6chP/efteMPq2MqXr4uLIWxbAy/tVcQSd
	 cOKktWOZjtp4JEMNgjY5Mm9iYDH7CwVeoQ+2m16MSP24r6FkMg6SdYj55by4peeO0f
	 fCwkbY6m2uGhHW6LX/kurmyI/FwWVvfY1/pUV1P9PeuiGIuOQnCPDWTXXoGnT38Ku4
	 4cI6pzCGcqW+gHcc5Dy+LN5iB02lqDx5uXBiWRAeKCrLeXW8xlfTzJNCN12S+N/s01
	 zVZUFJfR1v9/Q==
Date: Mon, 13 Jul 2026 12:14:53 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Nathan Chancellor <nathan@kernel.org>, 
    Conor Dooley <conor.dooley@microchip.com>, Wende Tan <twd2.me@gmail.com>, 
    Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
    kernel test robot <lkp@intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: vdso: Do not use LTO for the vDSO
In-Reply-To: <20260701-riscv-vdso-lto-v1-1-89db0cd82077@linutronix.de>
Message-ID: <541aed79-b153-726c-87f9-cfd9f9304c46@kernel.org>
References: <20260701-riscv-vdso-lto-v1-0-89db0cd82077@linutronix.de> <20260701-riscv-vdso-lto-v1-1-89db0cd82077@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1762691194-1783966497=:1536112"
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1762691194-1783966497=:1536112
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Wed, 1 Jul 2026, Thomas Weißschuh wrote:

> With LTO enabled the compiler assumes that the vDSO functions are not
> used and optimizes them away completely. Currently this happens to
> __vdso_clock_getres(), __vdso_clock_gettime(), __vdso_getrandom(),
> __vdso_gettimeofday() and __vdso_riscv_hwprobe().
> 
> Disable LTO for the vDSO, as these functions are hand-optimized anyways.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606301855.WvkSC4kD-lkp@intel.com/
> Fixes: 021d23428bdb ("RISC-V: build: Allow LTO to be selected")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Thanks, queued for v7.2-rc.


- Paul
--8323329-1762691194-1783966497=:1536112
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1762691194-1783966497=:1536112--

