Return-Path: <SRS0=lSM2=ML=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3626C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 01:45:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB28B20779
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 29 Sep 2018 01:45:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O9rstzX5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="e/pG8g0S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB28B20779
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=4Dfe9WoXn1iVE4lgM2eTQb4VW884FIlSY0KMRCGSm0g=; b=O9rstzX56dt5MjDQtsfkNTs0N
	A3f0+c9/CvmlmId9VE0rytlwsgj3sLJacbRjV1exWQv7Wnc8YJoy8eUD1H5q+C9r70EQ+ascwHtHw
	nVPsiaIYGT4L9L/olDJ+rhLQSVGCsireiKbM/vTH7JhI7CkUou9894iuu24nmOkdWEpO2/GiTecsb
	gbcelE0yzI5gVbPWqaayhzLlMXd/zu2rvPT5qZZlqk610C/650edGX/34We1fynIdqIFa4iXRnM9K
	8aM+5K9WvIoyv5sQJC2BJ6Dht/MjkV/lKNp6Id+c/XFCkqbJiHjfVplqi3kvJWXWi5A2Yrqu6EeFa
	4s/knV2ZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g64Jo-000398-RR; Sat, 29 Sep 2018 01:45:16 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g64Ji-0002KF-Ff
 for linux-riscv@lists.infradead.org; Sat, 29 Sep 2018 01:45:12 +0000
Received: by mail-pg1-x544.google.com with SMTP id y18-v6so5652197pge.0
 for <linux-riscv@lists.infradead.org>; Fri, 28 Sep 2018 18:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=jCWMUncnkoPMnXJTeYbjoS4jmFS7s6dJ/qJU+hBbIBI=;
 b=e/pG8g0SkPm9lWb1TEe5BRlzjNZUWnmwN0vbyMn2TkP/Ha4luVWPPxGevA7YoUxJdf
 rU7R1QXzqlJoym1cYtFRe7x2ueQ/a9VnkTJSlftsr4uz6VOuAHsDjBZZtFzCvXa6BUma
 pQHLKdZjtQRx8ZJ3taTNQIZmDjAlLPQUwbstpvN8FyYgsUCO5sGiXqQmTnjw+elbSFrX
 Ec1gHZj/dpfRcPj0feTHYTIORuT6a1CGyKcZGKA+iJ1Dry6x0W9s5yelANneZ20dyI19
 iwF0L8Q++nprq/rTCWNx8U7mqa0ukI+E6d5hn1c/1AzyE8F/J4gluZFOENcSbfCGe0H3
 QDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=jCWMUncnkoPMnXJTeYbjoS4jmFS7s6dJ/qJU+hBbIBI=;
 b=KrHMzORoiWUCrd4k6oApWobsSc/rq4aiIE+LLKz0CRDkLcoqJSMYh3Tyys9683PH9p
 A90D1TOByVV1MZBksad5I7OY1POqH4yGwjYfJh+xYJX4hXk7cmZuCQRD4J0/q36REsaU
 BZZQdBQu0tmkETE/bz/sHNix5iQHFvIyOM13z3X5Di796IO+Wa8L8qrGB1VbtfHyR83U
 1NCnCzW3f1gF7XUR1zmmviaJIamwK2jHJE0VMXzBzXoikZDcTvNODmxw7H6auzjGNMOc
 o7GywCqvXIbXd1ed98K230VcaGxXVr7ChaQpSzYyWBljP/of1Ua7n4080puL5um3oAD3
 Visg==
X-Gm-Message-State: ABuFfoj5OYaBZMTXFIQVltRQ9Lup6qtK7+BOiICABecPyvrd4p6QOqW9
 4E2s1gKKTbvBIiff68k5v9JDIKplb4Y=
X-Google-Smtp-Source: ACcGV60BTCbOwHZjgOoQzwBayw15i0JaQFzu98LnrkP+PXeKQ5k8l/fViPhuqWTwejXVWWL4wQj9xw==
X-Received: by 2002:a62:d5c7:: with SMTP id
 d190-v6mr1143755pfg.107.1538185498774; 
 Fri, 28 Sep 2018 18:44:58 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id v5-v6sm5446025pfd.64.2018.09.28.18.44.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Sep 2018 18:44:57 -0700 (PDT)
Date: Fri, 28 Sep 2018 18:44:57 -0700 (PDT)
X-Google-Original-Date: Fri, 28 Sep 2018 17:31:29 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Cosmetic menuconfig changes
In-Reply-To: <20180919224815.24688-1-mick@ics.forth.gr>
From: Palmer Dabbelt <palmer@sifive.com>
To: mick@ics.forth.gr
Message-ID: <mhng-4c7f23e6-3111-4b77-9cb9-87da815f14d7@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180928_184510_584627_456DAA48 
X-CRM114-Status: GOOD (  22.69  )
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
Cc: mick@ics.forth.gr, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180929014457.abR1h7MGRc-1APIivwq5bz9HKmYb-ntRmi_TPjzaK-s@z>

On Wed, 19 Sep 2018 15:48:15 PDT (-0700), mick@ics.forth.gr wrote:
> * Move the built-in cmdline configuration on a new menu entry "Boot
>   options", it doesn't make much sense to be part of the debuging menu.
>
> * Rename "Kernel Type" menu to "Kernel features" to be more consistent with
>   what other architectures are using, plus "type" is a bit misleading here.
>
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>

This seems reasonable to me.  I've added it to our for-next branch, we'll see 
if anyone else has comments.  Thanks!

Did you, by any chance, go and check to see if these boot options actually 
work?  We've got a bunch of subtly different boot methods and they've been 
broken in various ones at various times, so I always like to try and catalog 
what actually works now so at least I know where to look when testing things.

> ---
>  arch/riscv/Kconfig       | 40 +++++++++++++++++++++++++++++++++++++++-
>  arch/riscv/Kconfig.debug | 35 -----------------------------------
>  2 files changed, 39 insertions(+), 36 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a3449802..82172bf8 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -210,12 +210,50 @@ endmenu
>
>  endmenu
>
> -menu "Kernel type"
> +menu "Kernel features"
>
>  source "kernel/Kconfig.hz"
>
>  endmenu
>
> +menu "Boot options"
> +
> +config CMDLINE_BOOL
> +	bool "Built-in kernel command line"
> +	help
> +	  For most platforms, it is firmware or second stage bootloader
> +	  that by default specifies the kernel command line options.
> +	  However, it might be necessary or advantageous to either override
> +	  the default kernel command line or add a few extra options to it.
> +	  For such cases, this option allows hardcoding command line options
> +	  directly into the kernel.
> +
> +	  For that, choose 'Y' here and fill in the extra boot parameters
> +	  in CONFIG_CMDLINE.
> +
> +	  The built-in options will be concatenated to the default command
> +	  line if CMDLINE_FORCE is set to 'N'. Otherwise, the default
> +	  command line will be ignored and replaced by the built-in string.
> +
> +config CMDLINE
> +	string "Built-in kernel command string"
> +	depends on CMDLINE_BOOL
> +	default ""
> +	help
> +	  Supply command-line options at build time by entering them here.
> +
> +config CMDLINE_FORCE
> +	bool "Built-in command line overrides bootloader arguments"
> +	depends on CMDLINE_BOOL
> +	help
> +	  Set this option to 'Y' to have the kernel ignore the bootloader
> +	  or firmware command line.  Instead, the built-in command line
> +	  will be used exclusively.
> +
> +	  If you don't know what to do here, say N.
> +
> +endmenu
> +
>  menu "Bus support"
>
>  config PCI
> diff --git a/arch/riscv/Kconfig.debug b/arch/riscv/Kconfig.debug
> index 3224ff6e..c5a72f17 100644
> --- a/arch/riscv/Kconfig.debug
> +++ b/arch/riscv/Kconfig.debug
> @@ -1,37 +1,2 @@
> -
> -config CMDLINE_BOOL
> -	bool "Built-in kernel command line"
> -	help
> -	  For most platforms, it is firmware or second stage bootloader
> -	  that by default specifies the kernel command line options.
> -	  However, it might be necessary or advantageous to either override
> -	  the default kernel command line or add a few extra options to it.
> -	  For such cases, this option allows hardcoding command line options
> -	  directly into the kernel.
> -
> -	  For that, choose 'Y' here and fill in the extra boot parameters
> -	  in CONFIG_CMDLINE.
> -
> -	  The built-in options will be concatenated to the default command
> -	  line if CMDLINE_FORCE is set to 'N'. Otherwise, the default
> -	  command line will be ignored and replaced by the built-in string.
> -
> -config CMDLINE
> -	string "Built-in kernel command string"
> -	depends on CMDLINE_BOOL
> -	default ""
> -	help
> -	  Supply command-line options at build time by entering them here.
> -
> -config CMDLINE_FORCE
> -	bool "Built-in command line overrides bootloader arguments"
> -	depends on CMDLINE_BOOL
> -	help
> -	  Set this option to 'Y' to have the kernel ignore the bootloader
> -	  or firmware command line.  Instead, the built-in command line
> -	  will be used exclusively.
> -
> -	  If you don't know what to do here, say N.
> -
>  config EARLY_PRINTK
>  	def_bool y

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
