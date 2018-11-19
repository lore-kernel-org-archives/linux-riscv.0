Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE6BC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 22:38:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FA5520851
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 22:38:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ucOiadgs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oFbcN4qp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="kbEqnje4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FA5520851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lmEKlHYIvnsvm0bfUIAyxuG2iGBczk5zKwKkVPWtMsc=; b=ucOiadgs/fcY4FeirUsfdHTVy
	rEmFBi8PyKn4MjuD9RSZuPgaqFuNgkOVI6s8pjBETTQsRvekfqg+NCb2BkMDN4Ux4p4mvIsKjpn/1
	x+utUNBRgC0wb0CO3SUAqqYTq17EG5Qu/LKHBzhJh3HvqCF7fKy19dnaCP/xeQa4dyIUY8WSrP45G
	9h/JnO256NMakOqPusCCwTDZZC4AEMQ1xCtzj/HIaJBGmSNpmYtBTqhnhCLhFKYAsh/Px3aFgru7G
	vtTW6jL286G8Ki2oCrVxfu7+ej6ylkg1hsAtwz/FrF5MqEh/Ea41jGQ15bMOyDXbFVtgbMnO62V+0
	+IH4+r+2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOsB5-0005Ed-NK; Mon, 19 Nov 2018 22:37:59 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOsB3-0005EX-KD
 for linux-riscv@bombadil.infradead.org; Mon, 19 Nov 2018 22:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YoUN3OnMQfBCW2n8EVowWZz5tDVLo2rOx+RrbtlV4LY=; b=oFbcN4qpSymXGtwtmnsEiwy/lQ
 Dk6Y3223BhinEwk4/3pxnbDHOiR4GgyMtrz40hkk1BcQgzryjwE/RESZenvWeJQap3eEvjFi3AMby
 ZMrM2V7N5HxhhU3EbJCm0NJoA840Q5fJs4GmLaF5c/DF5kOJ4QWJVHgi/nB21S+9WZL/sNuL9Zc/r
 8WUavaR6Z65cSQb1irkXY630LjVbCiIR/CHRlQ9c5M6thdBQ41v5w/I8Unjj7bOHuivt3XRr4jbOl
 7gR+KCxvEG1xY6DVv+QnC9vOY8MNzaviPSzD/3gKlA3/4ZUiZ7vrTYhx/SCKCIna2RKXMikWO0gck
 N4ygDU9g==;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOsB0-0006gh-Og
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 22:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1542667075; x=1574203075;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=6JgcAIPdaKuQvFhVCLNmgWKVCPIory/EkvU4FW6GZpQ=;
 b=kbEqnje4xXEOdbyLJLqAQY4/d486LPLLebrPjXsYAWYClLfZKhKYzOrN
 kOoKf28lirR8qn9e1bx0rxKqI2pOKyAey0pNftnjlQlcXn9Jfe2aHSl1o
 RQAAjf4pfEfSvmuQ1Yy+thEKHHH3GrVVRcIla8/aN039Bjl90dE87pV9t
 qWhH2ypKktgXaaDpF0acV1LIeeBL1mJw0RlJTz080fbLnvJMZujz9si1j
 MODmXMn/VcTgyz6k1gU8i9ixKIMMIZxxxduDwja2VtlLS1scUxRPYaXCz
 3b0yv0iTKbmZ2ztjMVfgcpNF0dcdVOmWjae8LaXZS703cKgSvBT4B5hu8 A==;
X-IronPort-AV: E=Sophos;i="5.56,254,1539619200"; d="scan'208";a="96354540"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Nov 2018 06:37:42 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 19 Nov 2018 14:20:57 -0800
Received: from cnf003109.ad.shared (HELO [10.86.54.248]) ([10.86.54.248])
 by uls-op-cesaip01.wdc.com with ESMTP; 19 Nov 2018 14:37:41 -0800
Subject: Re: [PATCH v5] RISC-V: Update Kconfig to better handle CMDLINE
To: Palmer Dabbelt <palmer@sifive.com>, "mick@ics.forth.gr"
 <mick@ics.forth.gr>, "dmaliotaki@gmail.com" <dmaliotaki@gmail.com>
References: <20181119210907.12040-1-palmer@sifive.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <95449dce-5bca-1034-e6ed-947055a37abd@wdc.com>
Date: Mon, 19 Nov 2018 14:37:40 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181119210907.12040-1-palmer@sifive.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_173755_038881_50E43AF7 
X-CRM114-Status: GOOD (  36.65  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119223740.S5MZD3Zhc6QNaIs3SSe1VN2K1Or-cF9HYPG3VW2ZOxk@z>

On 11/19/18 1:10 PM, Palmer Dabbelt wrote:
> From: Nick Kossifidis <mick@ics.forth.gr>
> 
> Added a menu to choose how the built-in command line will be
> used and CMDLINE_EXTEND for compatibility with FDT code.
> 
> v2: Improved help messages, removed references to bootloader
> and made them more descriptive. I also asked help from a
> friend who's a language expert just in case.
> 
> v3: This time used the corrected text
> 
> v4: Copy the config strings from the arm32 port.
> 
> v5: Actually copy the config strings from the arm32 port.

Why not use CMDLINE_FROM_BOOTLOADER instead of CMDLINE_FALLBACK in that 
case? To my ears, CMDLINE_FROM_BOOTLOADER made more sense given the 
description. If CMDLINE_FALLBACK is retained intentionally, then it's ok.

Regards,
Atish
> 
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> Signed-off-by: Debbie Maliotaki <dmaliotaki@gmail.com>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>   arch/riscv/Kconfig | 57 +++++++++++++++++++++++++++-------------------
>   1 file changed, 33 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 55da93f4e818..23ac6d6f9ab2 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -227,39 +227,48 @@ endmenu
>   
>   menu "Boot options"
>   
> -config CMDLINE_BOOL
> -	bool "Built-in kernel command line"
> +config CMDLINE
> +	string "Built-in kernel command line"
>   	help
> -	  For most platforms, it is firmware or second stage bootloader
> -	  that by default specifies the kernel command line options.
> -	  However, it might be necessary or advantageous to either override
> -	  the default kernel command line or add a few extra options to it.
> -	  For such cases, this option allows hardcoding command line options
> -	  directly into the kernel.
> +	  For most platforms, the arguments for the kernel's command line
> +	  are provided at run-time, during boot. However, there are cases
> +	  where either no arguments are being provided or the provided
> +	  arguments are insufficient or even invalid.
>   
> -	  For that, choose 'Y' here and fill in the extra boot parameters
> -	  in CONFIG_CMDLINE.
> +	  When that occurs, it is possible to define a built-in command
> +	  line here and choose how the kernel should use it later on.
>   
> -	  The built-in options will be concatenated to the default command
> -	  line if CMDLINE_FORCE is set to 'N'. Otherwise, the default
> -	  command line will be ignored and replaced by the built-in string.
> +choice
> +	prompt "Built-in command line usage" if CMDLINE != ""
> +	default CMDLINE_FALLBACK
> +	help
> +	  Choose how the kernel will handle the provided built-in command
> +	  line.
>   
> -config CMDLINE
> -	string "Built-in kernel command string"
> -	depends on CMDLINE_BOOL
> -	default ""
> +config CMDLINE_FALLBACK
> +	bool "Use bootloader kernel arguments if available"
>   	help
> -	  Supply command-line options at build time by entering them here.
> +	  Use the built-in command line as fallback in case we get nothing
> +	  during boot. This is the default behaviour.
> 
> +config CMDLINE_EXTEND
> +	bool "Extend bootloader kernel arguments"
> +	help
> +	  The command-line arguments provided during boot will be
> +	  appended to the built-in command line. This is useful in
> +	  cases where the provided arguments are insufficient and
> +	  you don't want to or cannot modify them.
> +
>   
>   config CMDLINE_FORCE
> -	bool "Built-in command line overrides bootloader arguments"
> -	depends on CMDLINE_BOOL
> +	bool "Always use the default kernel command string"
>   	help
> -	  Set this option to 'Y' to have the kernel ignore the bootloader
> -	  or firmware command line.  Instead, the built-in command line
> -	  will be used exclusively.
> +	  Always use the built-in command line, even if we get one during
> +	  boot. This is useful in case you need to override the provided
> +	  command line on systems where you don't have or want control
> +	  over it.
>   
> -	  If you don't know what to do here, say N.
> +endchoice
>   
>   endmenu
>   
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
