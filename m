Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C150CD8C85
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 00:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4XuWDN7t1I5G1sqdQ8rTaTSlqqor3pQBW17S5+OzPI=; b=dQDEPxVZa+YjCekRV0VgTGuggi
	BFeYu3ZHzIL4N7899MTcFI/6C+QrGbw6D+1h5gI+xX4vTrHy/aAjbEkt/IUJkEoOtpjrHBVbDeKSs
	OJY+Rpv6bRy9/eDVMcsp+Fi+4Aoi6ZaX0ZM2FmrigctiQEvKXFiJmmiUlzbU5zMEOsIDjgbGs1Kw1
	/BKyhBsZxnOvKvx+a1N3VJ3jc3xlycXtEZvb+LHOK3cl4+zux+kOVx5WLo/lThqoe1uCEjUnXXacE
	kwd1gO+/U6dWzwPg1epzU88apziX7V+ef/ksPuXMFrWqQiLUZ4DEV1D1/hrvgqlzPfJvSK24m5uRb
	d+u+4iLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW1jG-00000001xCC-2YY3;
	Sun, 07 Jun 2026 00:51:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW1jC-00000001xBZ-0YUf
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 00:51:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 88F5360008;
	Sun,  7 Jun 2026 00:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE571F00893;
	Sun,  7 Jun 2026 00:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780793459;
	bh=DBgS/IeCcJwTQBGQhv8ELU0KEo6N/7Ws5o60dsxB8Lg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=oMmoJEjKw0xCvmUahHG0oLab5Eko7Yg5SUOvguR1eJIvYLSbU2gIlU6BcJFcwHYan
	 FVn+47gECBhDwEf9tPwwPOVvYyLYYtrIyC/SKX0byIMM6xIJbu8dG17qfUQxbIZ93K
	 vLwLtjIrxtVmu0rS9AyoRrEUyJ11D/F/7H+DJOG4K7+D5mm3A0n2qGDdIImKHBxvOr
	 DCflpYTRgLkT0bBZbAoFuNjgaNhwitpR41+syjrxajpnoXUbtgdbKgG0qBzUG3BXXe
	 JT9m7pyLIIv7RXy9uLCMHITotL78jY+A6dTNKzSuilhtMF1luPnzn8iM8UIKCbOPOT
	 Ef63FyHb+7frA==
Date: Sat, 6 Jun 2026 18:50:55 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-15?Q?Miquel_Sabat=E9_Sol=E0?= <mssola@mssola.com>
cc: linux-riscv@lists.infradead.org, corbet@lwn.net, skhan@linuxfoundation.org, 
    pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, 
    linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] riscv: enable HAVE_CMPXCHG_{DOUBLE,LOCAL}
In-Reply-To: <20260605141247.253315-1-mssola@mssola.com>
Message-ID: <f63eefc9-769d-409c-4099-274254432129@kernel.org>
References: <20260605141247.253315-1-mssola@mssola.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-331715424-1780791531=:1833245"
Content-ID: <4f54938e-d337-ae77-26a3-588b02bb1cdf@kernel.org>
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

--8323329-331715424-1780791531=:1833245
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <d56e784a-c6ea-d849-a556-126111a2ab60@kernel.org>

Hi,

On Fri, 5 Jun 2026, Miquel Sabaté Solà wrote:

> Support for atomic Compare-And-Swap instructions has been in the RISC-V
> port of the Linux kernel for a long time. That being said, we apparently
> never bothered to set HAVE_CMPXCHG_DOUBLE and HAVE_CMPXCHG_LOCAL in the
> Kconfig, despite having all the framework to support them.
> 
> Signed-off-by: Miquel Sabaté Solà <mssola@mssola.com>
> ---
> This is a resend of [1], rebased on top of the latest commit from the
> for-next branch.
> 
> I have built this patch with multiple configurations and ran it with KVM
> (the VisionFive2 board that I have lacks the needed extensions). All seems
> to work, but I do wonder if we did not enable these for a reason or this
> just slipped through. So far in the code I believe everything is in place,
> and I haven't seen any commit in the git log stating otherwise.
> 
> [1] https://lore.kernel.org/all/20260220074449.8526-1-mssola@mssola.com/

Thanks for the patch.  Your comments above are why I've been hesitant to 
merge it.  I'm not aware of any publicly available hardware that supports 
Zacas/Zabha.  No one has stepped forward to provide any Tested-by:s on 
hardware that hasn't been released yet.  You mention that you tested on 
your VisionFive2 board, but it would not have exercised those code paths.

Of course, we already have Zacas/Zabha support, merged back in 2024, in 
cmpxchg.h.  I assume (?) that it was tested in QEMU, but I don't see any 
comments about that in the patch series.  No one sent any Tested-by:s 
then, either.

It would be good if you (and ideally others) could put this patch through 
some testing on QEMU with Zacas and Zabha enabled, before we merge it.  
The affected code paths for HAVE_CMPXCHG_LOCAL seem to primarily involve 
per-CPU counters and MM zone counters, so those would be the areas to 
focus.  HAVE_CMPXCHG_DOUBLE seems to do nothing useful other than 
preventing the AMD IOMMU driver from being selected if it's not present, 
so that part of the patch seems fairly useless.  In fact I'd suggest 
dropping that from the patch and just sending a separate patch to remove 
HAVE_CMPXCHG_DOUBLE from the kernel completely.


- Paul
--8323329-331715424-1780791531=:1833245
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-331715424-1780791531=:1833245--

