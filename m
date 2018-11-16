Return-Path: <SRS0=ssm3=N3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D29C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Nov 2018 16:52:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6903C2086B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Nov 2018 16:52:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MF8pkpu4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZhlQYGZ1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6903C2086B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Qxm6mxNMdsKDIaEqitrwkHEdY0ZaHTkWIwv8eTYgpS8=; b=MF8pkpu4naJwSBXsq/Ab2ZDkv
	MOG6VNmaVizmqVAPeJdEhfvogLtDlaTx3oOOJwtxSifrcTwGPYRcRqStZ4scmyChkAfvwG3tw3GgG
	O9+zhd6hd2w4upHVIXcvgO2Xi/ptXByKGnUjOAssrJK6I1CDXZWCpztggfUGgQEwJ0Xo283yXEJyt
	WD2I3Xc0fC1U+C4LjA2iQLw7WFbhYdpGE+2tEUnHMnMdI441wDn+Xj2bL+AmyKOmVsPSC99EYp1o9
	z7OSTSKczcf0lSLMNE9gH3+qzvX+EKmma1lChmEAiG73CuCQ70lLlFb/HrO/UGNLh1nsZWA+zzHEF
	Nd6KT6/0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gNhM9-0007Ot-RS; Fri, 16 Nov 2018 16:52:33 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNhM6-0007MP-E1
 for linux-riscv@lists.infradead.org; Fri, 16 Nov 2018 16:52:31 +0000
Received: by mail-pl1-x644.google.com with SMTP id z23so179492plo.0
 for <linux-riscv@lists.infradead.org>; Fri, 16 Nov 2018 08:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=l+hzjrrouaoKxc/DyJ99g1Ns1B7+nd1ku5HPqDhalzg=;
 b=ZhlQYGZ1+4zE+Lrp7tKjDyt518KCSI5Xhvtu4tT38eM8PcuP7cChayXPOBo865edzN
 hdGZRU/inpfjl87gkFD6caCrParUtWcLJFPjFafyNDXrxtEWgL50Uq1/MV9iYkUXW53q
 5UiIYNNERwu+HvgHkQ/K9++cJt7w+HO9J6c8dd558YAXdhEekLSnb3C5Ra2+jV6K/jOO
 +xpUO9mhCeSNz7Nm3pvaiwJIAtEkkQ+4HMGaPACRHyE45pvoWy1nzTFAjDs88UQH9xWH
 ezkSfsFze4Uz5m7DsZ1S72euh8ogzWVPVMjgdoCTh0PnfVJZN1V1AtUklUW+L3nnQOTI
 pUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=l+hzjrrouaoKxc/DyJ99g1Ns1B7+nd1ku5HPqDhalzg=;
 b=oXmhPf15mJbHO6CeYtTRECChb/FKk7eLQlvOQQ1BhetwHeXOVpEhGS5UbtnqX+ByH2
 Em0FkTViGjW/pgxvcoewpPjaFR8XHbMSPxiE0rddO9ZERPKpO6zzkf8WnmpAbs8b3W6t
 fWgciAxI7d7LQia7wwq+zW0IAyGANgK1jjkLKD73eHLYX4glbM73dNtvDs2BaoOiGiXJ
 hI8wDkShshgJ0lmcdLMBy2dJCuwIO0DrdXgY8JRLImqA2qZ+uH04X2addrA24Xa3MOej
 5j+ef6JMHjNxxpt5wwl/98tDR+SdVAl4OcROJl7d6+//xQnvoT0yL37Jc5vjlziY2UeD
 oZAg==
X-Gm-Message-State: AGRZ1gLF42ZLciUuDoTDtObzI1aLCDBJyX/YGW3KI8iPJIhauP/o0nt4
 TbUh4/+qmI23xba/B49Mr2lw8TASurkuBA==
X-Google-Smtp-Source: AJdET5eS6ICeowKvySPIms2U5mJByTw7KtpHqkhrhVuREsC1Lz4MxSIndBHHy7mqkVi+FafZmVCezg==
X-Received: by 2002:a17:902:a9c4:: with SMTP id
 b4mr11616384plr.298.1542387138916; 
 Fri, 16 Nov 2018 08:52:18 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id u9-v6sm32673414pfm.175.2018.11.16.08.52.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Nov 2018 08:52:18 -0800 (PST)
Date: Fri, 16 Nov 2018 08:52:18 -0800 (PST)
X-Google-Original-Date: Fri, 16 Nov 2018 07:12:39 PST (-0800)
Subject: Re: [PATCH] RISC-V: Update Kconfig to better handle CMDLINE
In-Reply-To: <20181110010244.5837-1-mick@ics.forth.gr>
From: Palmer Dabbelt <palmer@sifive.com>
To: mick@ics.forth.gr
Message-ID: <mhng-314e946b-3b14-467c-ad23-85983b75cd8d@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181116_085230_473128_E7D68E23 
X-CRM114-Status: GOOD (  26.96  )
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
Message-ID: <20181116165218.Xnu-LSRbOh9yschVu6SeZ4qdZ3eM7X7ueeLItO2YxF8@z>

On Fri, 09 Nov 2018 17:02:44 PST (-0800), mick@ics.forth.gr wrote:
> Add a menu to chose how the built-in command line will be
> used and add CMDLINE_EXTEND for compatibility with FDT code.
>
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> ---
>  arch/riscv/Kconfig | 45 ++++++++++++++++++++++++---------------------
>  1 file changed, 24 insertions(+), 21 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 55da93f4e818..81f884164b52 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -227,39 +227,42 @@ endmenu
>
>  menu "Boot options"
>
> -config CMDLINE_BOOL
> -	bool "Built-in kernel command line"
> +config CMDLINE
> +	string "Built-in kernel command line"
>  	help
>  	  For most platforms, it is firmware or second stage bootloader
>  	  that by default specifies the kernel command line options.
>  	  However, it might be necessary or advantageous to either override
> -	  the default kernel command line or add a few extra options to it.
> -	  For such cases, this option allows hardcoding command line options
> -	  directly into the kernel.
> +	  the provided kernel command line or add a few extra options to it.
> +	  For such cases, it is possible to define a built-in command line
> +	  here and chose how the kernel should use it later on.
>
> -	  For that, choose 'Y' here and fill in the extra boot parameters
> -	  in CONFIG_CMDLINE.
> +choice
> +	prompt "Built-in command line usage" if CMDLINE != ""
> +	default CMDLINE_FALLBACK
> +	help
> +	  Chose how the kernel will handle the provided built-in command
> +	  line.
>
> -	  The built-in options will be concatenated to the default command
> -	  line if CMDLINE_FORCE is set to 'N'. Otherwise, the default
> -	  command line will be ignored and replaced by the built-in string.
> +config CMDLINE_FALLBACK
> +	bool "Fallback"
> +	help
> +	  Use the built-in command line as fallback in case we get nothing
> +	  from the boot loader.
>
> -config CMDLINE
> -	string "Built-in kernel command string"
> -	depends on CMDLINE_BOOL
> -	default ""
> +config CMDLINE_EXTEND
> +	bool "Extension"
>  	help
> -	  Supply command-line options at build time by entering them here.
> +	  Use the built-in command line as an extension of the command line
> +	  provided by the boot loader.
>
>  config CMDLINE_FORCE
> -	bool "Built-in command line overrides bootloader arguments"
> -	depends on CMDLINE_BOOL
> +	bool "Forced"
>  	help
> -	  Set this option to 'Y' to have the kernel ignore the bootloader
> -	  or firmware command line.  Instead, the built-in command line
> -	  will be used exclusively.
> +	  Use the built-in command line in place of the command line
> +	  provided by the boot loader.
>
> -	  If you don't know what to do here, say N.
> +endchoice
>
>  endmenu

It looks like this is functionally equivalent to what ARM has, but the polarity 
is a bit different and the help strings aren't as easy to read.  Is there a 
reason we can't just copy what they do?

    config CMDLINE
            string "Default kernel command string"
            default ""
            help
              On some architectures (EBSA110 and CATS), there is currently no way
              for the boot loader to pass arguments to the kernel. For these
              architectures, you should supply some command-line options at build
              time by entering them here. As a minimum, you should specify the
              memory size and the root device (e.g., mem=64M root=/dev/nfs).
    
    choice
            prompt "Kernel command line type" if CMDLINE != ""
            default CMDLINE_FROM_BOOTLOADER
            depends on ATAGS
    
    config CMDLINE_FROM_BOOTLOADER
            bool "Use bootloader kernel arguments if available"
            help
              Uses the command-line options passed by the boot loader. If
              the boot loader doesn't provide any, the default kernel command
              string provided in CMDLINE will be used.
    
    config CMDLINE_EXTEND
            bool "Extend bootloader kernel arguments"
            help
              The command-line arguments provided by the boot loader will be
              appended to the default kernel command string.
    
    config CMDLINE_FORCE
            bool "Always use the default kernel command string"
            help
              Always use the default kernel command string, even if the boot
              loader passes other arguments to the kernel.
              This is useful if you cannot or don't want to change the
              command-line options your boot loader passes to the kernel.
    endchoice
    
I'm not really opposed to your solution, I'm just trying to avoid being 
different without a reason.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
