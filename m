Return-Path: <SRS0=mtPM=MQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C992C64EBC
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Oct 2018 18:54:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F7DB21470
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Oct 2018 18:54:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cm+gI6cN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="OLpwL+X8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F7DB21470
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9bRIElYCMUGZUVHW7POed0PHPerpBb/YWEyOW7QyBgA=; b=cm+gI6cNxsO9kpfkBSHLG7DA3
	4hRIwTihn9ZAYvVCty5pih1HkFc4A1kIAZYxWVnePmenbpngZsLyNSFt3ZOaxICWxSHoF3NxlMHGY
	DJDqh2cdWN2w82UQ9hctcckGETnK9PZBvzxWzkyCWni7pHIalM8Xxs9/ZX3HMI1lutFlzwz3gjH65
	8QcedNYmbZR51QdU8sJ8ZyGMXlCyXo4ghUIiADsjFAZeI6QS+vq0fox1nvoRUMyXwcPldbS+KOsGU
	81rLW93N23BHjgwCuKdo71oAu+84KZBeDHEqzy8xFIPbtNux36Kh5sqc62TIx0CYKNYW0s6PDGuuD
	1fBQ1/FvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g88lR-000443-Rk; Thu, 04 Oct 2018 18:54:21 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g88lO-00041J-IV
 for linux-riscv@lists.infradead.org; Thu, 04 Oct 2018 18:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1538679264; x=1570215264;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=j+F4E0P4FLVxCUvw0zNY5VP4WC7I+NOLx9lXglXC3ns=;
 b=OLpwL+X8wHUa66WBUaw0p/w+TqrUNw/JNMFrwGPPHCi7u79i1J6l5Yv7
 /Ui8jvrQ934Cz7NARrE2cFXPmiBIX4+wmGTb9NkfcUkiE2ACUdmStgNAQ
 Hm50MBr+EpS/qILDNDOkNywk6KNkGtMQTBzjCAt9WEnQHo2aLOEej1xqx
 NiBU1AvSpHeE1E9rSzXPf4x63vf5XBhA0eR2TNpeQMhucPLHKpFmCblW8
 zAijaC6Id0u+pNS9xAr5b3SiG2oNVaSK8kBUGWxrd72J8yHUKJIwClKPB
 qldxJ0PMCzfht4XT/3qUK5MeOW05YlioAh4++Z1fBeooUsDOG8FsK1Wjg g==;
X-IronPort-AV: E=Sophos;i="5.54,341,1534780800"; d="scan'208";a="188911669"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 05 Oct 2018 02:54:28 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 04 Oct 2018 11:39:40 -0700
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.73.114])
 ([10.111.73.114])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Oct 2018 11:54:07 -0700
Subject: Re: [PATCH] OF: Handle CMDLINE when /chosen node is not present
To: Nick Kossifidis <mick@ics.forth.gr>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20181004123110.8487-1-mick@ics.forth.gr>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <fdd03e2e-4c1e-e89d-a336-ab4a716e7abc@wdc.com>
Date: Thu, 4 Oct 2018 11:54:05 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181004123110.8487-1-mick@ics.forth.gr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181004_115418_677930_8A89C4E6 
X-CRM114-Status: GOOD (  25.25  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "frowand.list@gmail.com" <frowand.list@gmail.com>,
 "palmer@sifive.com" <palmer@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181004185405.1UlUSDVgDIv2smkBUP1Uf4aPSFxi_ueF1ZfMDIhgLR8@z>

On 10/4/18 5:46 AM, Nick Kossifidis wrote:
> The /chosen node is optional so we should handle CMDLINE regardless
> the presence of /chosen/bootargs. Move handling of CMDLINE in
> early_init_dt_scan() instead.
> 
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> 
> ---
>   drivers/of/fdt.c | 69 +++++++++++++++++++++++++++++++++++++++-----------------
>   1 file changed, 48 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 800ad252c..868464b0b 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -31,6 +31,14 @@
>   
>   #include "of_private.h"
>   
> +#ifdef CONFIG_CMDLINE
> +#ifdef CONFIG_CMDLINE_FORCE
> +static const char fixed_cmdline[] __initconst = CONFIG_CMDLINE;
> +#else
> +static char builtin_cmdline[] __initdata = CONFIG_CMDLINE;
> +#endif
> +#endif
> +
>   /*
>    * of_fdt_limit_memory - limit the number of regions in the /memory node
>    * @limit: maximum entries
> @@ -1088,28 +1096,10 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>   
>   	/* Retrieve command line */
>   	p = of_get_flat_dt_prop(node, "bootargs", &l);
> -	if (p != NULL && l > 0)
> +	if (p != NULL && l > 0) {
>   		strlcpy(data, p, min((int)l, COMMAND_LINE_SIZE));
> -
> -	/*
> -	 * CONFIG_CMDLINE is meant to be a default in case nothing else
> -	 * managed to set the command line, unless CONFIG_CMDLINE_FORCE
> -	 * is set in which case we override whatever was found earlier.
> -	 */
> -#ifdef CONFIG_CMDLINE
> -#if defined(CONFIG_CMDLINE_EXTEND)
> -	strlcat(data, " ", COMMAND_LINE_SIZE);
> -	strlcat(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
> -#elif defined(CONFIG_CMDLINE_FORCE)
> -	strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
> -#else
> -	/* No arguments from boot loader, use kernel's  cmdl*/
> -	if (!((char *)data)[0])
> -		strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
> -#endif
> -#endif /* CONFIG_CMDLINE */
> -
> -	pr_debug("Command line is: %s\n", (char*)data);
> +		pr_debug("Got bootargs: %s\n", (char *) data);
> +	}
>   
>   	/* break now */
>   	return 1;
> @@ -1240,6 +1230,43 @@ bool __init early_init_dt_scan(void *params)
>   		return false;
>   
>   	early_init_dt_scan_nodes();
> +
> +	/*
> +	 * The /chosen node normaly contains the bootargs element

/s/normaly/normally

> +	 * that includes the kernel's command line parameters.
> +	 * However the presence of /chosen is not mandatory so
> +	 * in case we didn't get a command line when scanning
> +	 * nodes above, we should provide one here before we
> +	 * return, if possible.
> +	 *
> +	 * The built-in command line can be used as a default
> +	 * command line in case we received nothing from the
> +	 * device tree/bootloader. It can also be used for
> +	 * extending or replacing the received command line.
> +	 */
> +#ifdef CONFIG_CMDLINE
> +#if defined(CONFIG_CMDLINE_EXTEND)
> +	/*
> +	 * Order of parameters shouldn't matter for most cases,
> +	 * so prepending or appending the built-in command line
> +	 * shouldn't make a difference. In cases where it does
> +	 * it's up to the user to configure the kernel and/or
> +	 * the bootloader properly.
> +	 */
> +	if (builtin_cmdline[0]) {
> +		strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
> +		strlcat(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE)
> +	}
> +#elif defined(CONFIG_CMDLINE_FORCE)
> +	if (fixed_cmdline[0])
> +		strlcpy(boot_command_line, fixed_cmdline, COMMAND_LINE_SIZE);
> +#else
> +	/* No arguments from boot loader, use kernel's cmdline */
> +	if (!boot_command_line[0] && builtin_cmdline[0])
> +		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
> +#endif
> +#endif /* CONFIG_CMDLINE */
> +

Any specific reason for doing this in early_init_dt_scan instead of 
early_init_dt_scan_chosen?
I think keeping all boot command line modifications at one place makes 
more sense.

Regards,
Atish
>   	return true;
>   }
>   
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
