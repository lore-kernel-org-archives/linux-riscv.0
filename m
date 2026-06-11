Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2CDCD8CB9
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 07:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S/OeparZVHLAj9pOZ3tKPm3rcw4ySk3wGtGfMv7pXy4=; b=joPQGbOEuJ4b+4
	zYceNEqqV3EUOJSp/yODoygZz74gm69DEKg28395bwiIKIDTg6dja2SQN06AFZExiagLT3tDxmE6b
	hG8//7XuHXM3ggAHfi/2o/xLy+ojPPnM8gUwpxYuu7pEfR6ZC47AF8zgRX3wn3yEydpWyNABGz6Ex
	FDMI6n9dnOcUS3TtolzPt8YZBwiJjGMPWG38jYTiHt6ulyymvPaMc8Yft6gO9ivi9bgvJIOVmFa7i
	TEJbYywWdyJtMRweCgQxd62SR8wQ7IgOfghrch0TJqyx7NchpPAtRBcUCIznFHGrnsu+3HToTuqdb
	neAPAKfQpBabOlhC7ITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZrW-00000008sUd-2cqi;
	Thu, 11 Jun 2026 07:30:02 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZrT-00000008sTo-2kar
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 07:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1781162962;
	bh=tXwNWGOOumPfnfOExtCjj1A+ApEBHFbhZpzx7F0Nykc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kPUPwVySZMqiuG04aTeDdngzZ8VBrEfoCzQmkf1gC5+nZLlUJmtoVsoEdMfuuFlOI
	 wG07rIGtS39S877IWhyCcItkK4+43/gK2djrW+MSEv/L/V5BDy5RGCBQ2Ox0zCNEhC
	 927q87yHJSGxFzAHdPuurfGTJxEqDbyinPTAvQLPslaAKh3EMCB3J4FOroTWuqMXq2
	 S/iCDUQv3aM55kyi1pBYM76l9p32AutS4xOuD5UdDIItOBNaeG9SZ9a8wj/jxgPatK
	 QAVPXOXrUbGVSZ3rX6vLtnyCNd7jhR/Vflia/IMjotm9fOJ5p+oyfiTqGJ7Y7y0Vho
	 ZNqLG8KfYVLMA==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id A534AB2213AB;
	Thu, 11 Jun 2026 09:29:21 +0200 (CEST)
Message-ID: <77a48b81-7906-4e18-9229-48643a67f402@freeshell.de>
Date: Thu, 11 Jun 2026 00:29:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional
 ethernet TX timing
To: Andrew Rembrandt <kernel@rembrandt.dev>,
 Inochi Amaoto <inochiama@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260608182358.170489-1-kernel@rembrandt.dev>
 <aiemGajqcQeY9avz@inochi.infowork> <aihYftGNcpUd4UUR@mcmanus>
 <aiid4Y6x6Dbbwszf@inochi.infowork> <aikmOfazxdrhpty7@mcmanus>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <aikmOfazxdrhpty7@mcmanus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_002959_834889_3E540224 
X-CRM114-Status: GOOD (  12.16  )
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

Hi Andrew,

On 6/10/26 02:05, Andrew Rembrandt wrote:
> On Wed, Jun 10, 2026 at 07:14:56 am Inochi Amaoto wrote:
>> Do not do this, just leave the rx-internal-delay-ps untouched.
> 
> Sounds good, I'll leave v1 as-is. Many thanks for the review.
> 
> Regards,
> 
> Andrew
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

I do not notice any difference with or without this property present,
tested Linux -next with U-Boot modification to devicetree:

load usb 0:1 $fdt_addr_r /dtb/spacemit/k3-pico-itx.dtb
fdt addr $fdt_addr_r
fdt resize
fdt header get filesize totalsize
fdt set /soc/ethernet@cac80000 tx-internal-delay-ps <400>
load usb 0:1 $kernel_addr_r /EFI/BOOT/BOOTRISCV64.EFI
# throwaway use of ping is workaround for broken vendor U-Boot
ping 127.0.0.1; bootefi $kernel_addr_r $fdt_addr_r

Aside, there is still some problem with the driver which does cause it
to fail. This can be reproduced by unloading the module and then loading
the module; built from -next with 'olddefconfig' of debian Kconfig for
kernel 7.1, no patches.

# modprobe -r dwmac_spacemit
# modprobe dwmac_spacemit
[   61.469745] spacemit-dwmac cac80000.ethernet end0: cannot attach to
PHY (error: -ENODEV)

[   91.544646] spacemit-dwmac cac80000.ethernet end0: cannot attach to
PHY (error: -ENODEV)

If not reloading the module then I don't see any difference, traffic
passes (ping 1.1.1.1) with or without your suggested
tx-internal-delay-ps property. Is there a specific test to run to
observe expected difference?

Thanks,

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
