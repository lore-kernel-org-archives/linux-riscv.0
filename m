Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFD0C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 21:06:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E128B20823
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 21:06:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aMv16XVE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZVs3+0yz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E128B20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=WKXwbPt6+yddZMHiNOHGffewX/M6N7mAILgR2VeRN14=; b=aMv16XVEWhYwjlSIslb5XUxGB
	OWElTqiYNO4UQMLzcpkfhRA7VBOuEFEqac9l8hrtxC3WtIZAmfJovecixKJC1rwC6GIUo3SvOU3eI
	W2VLalE8cg5PV08reeRtAux5HpJIXQcXT7SQlFyXHoqU49zoIGPDcEYJeAzROw1qXmaoBL3Xb1zqp
	LoP0ZmPUpsFSlTSlxmS02Q/3Hr67v7A5/hPOSsKWEJ6YGJyT2AW46b4qmiSO+O4jH7DL+MOCaQJkk
	XamEeqVJhyVUcCx4VE6EPmTo+3zyzTgCWZxQM2f/DhA/9YFb8QwY0SNFa/3zRdLvc6D8ChvR7vUvG
	svJ2E7dsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOqkD-0002hH-B3; Mon, 19 Nov 2018 21:06:09 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOqk6-0002Td-NW
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 21:06:04 +0000
Received: by mail-pg1-x544.google.com with SMTP id 17so14103224pgg.1
 for <linux-riscv@lists.infradead.org>; Mon, 19 Nov 2018 13:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=BtD4svlrQqGPV0Kw06sYaPGAZsYJA/DL+P+MY8Zh6bw=;
 b=ZVs3+0yz24g5ilrdLRprldRnG6fD1XKKU8hp5uBIm7Xfh6C1QuEa/YqqgQKH34xqmL
 y2wD9IItCp3wlu3KUFk+O5i1YpDScO3aMkpfD3ebIrn4livcU2tsQ0itmOfGGTMsJGyV
 swKOtEj/s8f65JkvSpBHaECZLc4StG3lpblOYI716FhPR6OuM3J1/vz4iQpVchYiTr4s
 A+WNKxMWyj8VBCGXY6DkW3qdhHB21W0ALnr6W3nSjv69WMmauglw2VizsKwxqiwp/FJU
 lMoAr6RDZL0vWKWs5hd+K75bH45KLMjP2cjNnS3CnJ5n3ZPK+p/lIX5fm2cw0e7xsTRQ
 NnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=BtD4svlrQqGPV0Kw06sYaPGAZsYJA/DL+P+MY8Zh6bw=;
 b=TNUPQIWBFt+obHZ3WrC9ZRORAmFHBYkMck4yXl3lFbsS1k9PobmCUFu9E0f0JAuEnY
 Rs0Nw8Vq/a9YgN2cc5glYlWYzFdFkC/B/qiFpjGVxkuV4zMqXmFsdIfdMhHHUZNVWC5y
 xCfzrUN77/2mFAPsMwH7yELdRO5Iuazs99rxFWyAHGu+uNoKx0CnkXApa0DG4IVftRng
 YiAJvsZO+OeHUCPDocsJVWRWFHZ1YQa5qSEtJhFfV4ZLhyuPwNVygc4azIkSST6LDtzY
 Yl5Y7aHPzk31Ix60YJnyYczs5oI9CfAQK8UBAfUCThPhzOx11n+CKsA8/fFa24ECv1Ak
 YV3Q==
X-Gm-Message-State: AGRZ1gKuurY1h+Zv8n2pp5jJpmip5vvvR+Muo26kMpKfkJ4pcQ68/Ha9
 SnTu46SfseEwPavRBee1KAqOtPRuvNw=
X-Google-Smtp-Source: AJdET5ev+zHT+05kMNSCFndFkEvUz00cQFfUoPrXGOf01BY2SrXMYCRBgzCZAGi/1NknJI1bkm78AA==
X-Received: by 2002:a62:2292:: with SMTP id p18mr21991399pfj.9.1542661551459; 
 Mon, 19 Nov 2018 13:05:51 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id k38sm90303617pgb.33.2018.11.19.13.05.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Nov 2018 13:05:50 -0800 (PST)
Date: Mon, 19 Nov 2018 13:05:50 -0800 (PST)
X-Google-Original-Date: Mon, 19 Nov 2018 13:05:40 PST (-0800)
Subject: Re: [PATCH v3] RISC-V: Update Kconfig to better handle CMDLINE
In-Reply-To: <20181118000656.15656-1-mick@ics.forth.gr>
From: Palmer Dabbelt <palmer@sifive.com>
To: mick@ics.forth.gr
Message-ID: <mhng-236f884c-259b-4653-8aa0-5af7ffc205f7@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_130602_773570_3D476D26 
X-CRM114-Status: GOOD (  27.97  )
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
Cc: mick@ics.forth.gr, dmaliotaki@gmail.com, linux-riscv@lists.infradead.org,
 aou@eecs.berkeley.edu
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119210550.drltEi5JfyXo3d1brFGhJw99nmutQqgwz5l-lYMhw-U@z>

On Sat, 17 Nov 2018 16:06:56 PST (-0800), mick@ics.forth.gr wrote:
> Added a menu to choose how the built-in command line will be
> used and CMDLINE_EXTEND for compatibility with FDT code.
>
> v2: Improved help messages, removed references to bootloader
> and made them more descriptive. I also asked help from a
> friend who's a language expert just in case.
>
> v3: This time used the corrected text
>
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> Signed-off-by: Debbie Maliotaki <dmaliotaki@gmail.com>
> ---
>  arch/riscv/Kconfig | 57 +++++++++++++++++++++++++++++++-----------------------
>  1 file changed, 33 insertions(+), 24 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 55da93f4e..808624f6b 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -227,39 +227,48 @@ endmenu
>
>  menu "Boot options"
>
> -config CMDLINE_BOOL
> -	bool "Built-in kernel command line"
> +config CMDLINE
> +	string "Built-in kernel command line"
>  	help
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
> +	bool "Fallback"
>  	help
> -	  Supply command-line options at build time by entering them here.
> +	  Use the built-in command line as fallback in case we get nothing
> +	  during boot. This is the default behaviour.
> +
> +config CMDLINE_EXTEND
> +	bool "Extension"
> +	help
> +	  The command-line arguments provided during boot will be
> +	  appended to the built-in command line. This is useful in
> +	  cases where the provided arguments are insufficient and
> +	  you don't want to or cannot modify them.
> +
>
>  config CMDLINE_FORCE
> -	bool "Built-in command line overrides bootloader arguments"
> -	depends on CMDLINE_BOOL
> +	bool "Forced"
>  	help
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
>  endmenu

Thanks, but I still don't like the names of the options.  I've just gone ahead 
and sent a v4, let me know if that looks OK to you -- that's what I was trying 
to say the first time.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
