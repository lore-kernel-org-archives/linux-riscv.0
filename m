Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACE9C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 14:56:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1A282083F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 14:56:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GxFa1Tob";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Ck0mUwvp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1A282083F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=OWIT1wGxNbFC6mVYcrW3rkG2Ol2Bvd+beq+M2SPPOek=; b=GxFa1TobIdcnIbOazPZaYZykx
	X467aTvf5dmUHb55tynQlIUzBPVKt1DrYyZmSz0YaRrs7NMKmh/aW9gX7cPEBcyNq0CPW8QnbeS3A
	9MYjRUOBKvqIfZo6TCHXJ58EoMiqVh+nnSxTMTE9GExvDyLkKEJnD+erT/DdoYkZFrrPoBBWWK6q1
	TPQ/zUor2pxIkPOClbfU5hMsAR+06JzcWUciCySs2B5D9cSzfYM5TwrnuctmhjO9zwhUgcxkaxIah
	U09q3qbcFnm0wLXfhd2fQS+CZMnpFPnCAPnJDhj4ROq9jOLKruSUZxwjYRZp9knMPKNd78su0Mhi/
	rf8ptsNJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7M6a-0005Hf-C6; Tue, 02 Oct 2018 14:56:56 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7M6W-0005Fq-Jr
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 14:56:54 +0000
Received: by mail-pl1-x642.google.com with SMTP id w14-v6so1817256plp.6
 for <linux-riscv@lists.infradead.org>; Tue, 02 Oct 2018 07:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=bBIjwjsyUd5X++17QsPc4Y31OjnzeO5+HTdK4YTj3h4=;
 b=Ck0mUwvpwRC/GOSh6x3MnBqJewe0iGLSPhRtCow0GriyXOEJlWvd0UegTQoiIh8ydm
 +ipENis0DjJdqmy5XuZTI/mjWXtfWbLnalUPA9G4Ll9oxsj9MyfNvaEsmBRK35uoOLTw
 /OeyBZu/BOCCnWy1q6MxXotYK9OB+/tPUp6TpF6kgYDK5OeMD7zRqvZ4nf6NMOG44qDE
 ROjcbzwgbTPm01sKC1lZp3fm05ENwodK2krZrHOumgFuvQGom72NloXwdv+YdzJBSshp
 pLOi/d+t9vtbN9tV7buhqS/JbmrurEplSUenE+11+NeNesSR9eqt9AL2vnd40sVOw624
 Fjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=bBIjwjsyUd5X++17QsPc4Y31OjnzeO5+HTdK4YTj3h4=;
 b=At0ryjaDit02HNEw7d9MO00jWKZWLeL7WAJLX+VFnI+wrvevyBFp0X/ie2mUCmTpZd
 5f/KXMGbUXOHnDM9SGbPNcarnBgWONNT0pjfj6iZD5P3K0IjIcB2mN2Z5PIO+7IyCeFK
 wN0H0HaRX4GZXKv5N9G/mEvP8PzmKSedxIXkhrQP1/lcnZ9Av8KvQ1xmbMYIsm2hQNo8
 /johvoLtGbuGmwLHJM0LGp3SEH2HPETDfUDDp7x1o8DXugtPctkF+/5WCtwuq1oAaO8V
 mqdvBG3xo2Vvw0EFx8xY8P0vKEPBU5cv/EogzFFTBEs7hzfRZj3PjFR2aAqsY2/PPATo
 /dnQ==
X-Gm-Message-State: ABuFfojdhqLk/4PRo5VM8qzUtQLn8dD689VGv+Zx90kf3sX6JCFNvfwz
 fPktR/jFoCC+c4X7is/h5NBEMgIXggM=
X-Google-Smtp-Source: ACcGV63G2HOz47je04okkfV4Fwf5x8jpihagUsYAIsJJdlUOpy7jaxyWAMPDJ5iH/cLfSuNzaI0exQ==
X-Received: by 2002:a62:3942:: with SMTP id
 g63-v6mr16945978pfa.170.1538492201545; 
 Tue, 02 Oct 2018 07:56:41 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id r1-v6sm12530829pfb.41.2018.10.02.07.56.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Oct 2018 07:56:40 -0700 (PDT)
Date: Tue, 02 Oct 2018 07:56:40 -0700 (PDT)
X-Google-Original-Date: Tue, 02 Oct 2018 07:48:56 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Implement built-in command line feature
In-Reply-To: <20181002140449.24147-1-mick@ics.forth.gr>
From: Palmer Dabbelt <palmer@sifive.com>
To: mick@ics.forth.gr
Message-ID: <mhng-d047a199-9994-4150-95b0-72ad6c1ec96a@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_075652_703372_D4820E64 
X-CRM114-Status: GOOD (  25.04  )
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
Message-ID: <20181002145640.4Nmp8dwbw_9BzK6dE0ZrDtDXiN2Z4TrBcab7eDAmYxg@z>

On Tue, 02 Oct 2018 07:04:49 PDT (-0700), mick@ics.forth.gr wrote:
> This patch enables the use of a built-in kernel command line, which can
> optionaly also override the command line provided by the boot loader.
>
> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>

Christoph's comments are valid, but I have a bigger one: our original plan was 
to fix the generic support for CONFIG_CMDLINE, and while I'd still prefer to do 
that our original attempt got hung up.  A working implementation trumps a clean 
one, but I'd still prefer the clean one if you have time to take a look.

The offending function is early_init_dt_scan_chosen() in drivers/of/fdt.c.  The 
issue is that this is only called when a chosen node is present, which doesn't 
get called (and therefor doesn't set boot_command_line) when there is no 
/chosen node.  The fix might be as simple as checking for a /chosen node in 
early_init_dt_scan_nodes(), and calling the CONFIG_CMDLINE handling if there's 
no /chosen node.

If that's too much work I can add it to my TODO list, but that never gets 
shorter :).  Given that last time we tried messing with this we broke things 
multiple times, I'd prefer to have this on for-next for a bit first either way, 
so there's no big rush on my end.

Thanks for the patch!

> ---
>  arch/riscv/kernel/setup.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index aee603123..fd171ca7f 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -30,6 +30,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/sched/task.h>
>  #include <linux/swiotlb.h>
> +#include <linux/string.h>
>
>  #include <asm/setup.h>
>  #include <asm/sections.h>
> @@ -39,6 +40,14 @@
>  #include <asm/tlbflush.h>
>  #include <asm/thread_info.h>
>
> +#ifdef CONFIG_CMDLINE_BOOL
> +#ifdef CONFIG_CMDLINE_FORCE
> +	static const char fixed_cmdline[] __initconst = CONFIG_CMDLINE;
> +#else
> +	static char builtin_cmdline[] __initdata = CONFIG_CMDLINE;
> +#endif
> +#endif
> +
>  #ifdef CONFIG_EARLY_PRINTK
>  static void sbi_console_write(struct console *co, const char *buf,
>  			      unsigned int n)
> @@ -215,6 +224,46 @@ void __init setup_arch(char **cmdline_p)
>                 register_console(early_console);
>         }
>  #endif
> +
> +	/* When we return, cmdline_p should point to a temporary
> +	 * buffer on the kernel's init section (that gets cleaned up
> +	 * later on) to be saved on static_command_line and parsed for
> +	 * parameters.
> +	 *
> +	 * That string may get tweaked during parameter parsing so we
> +	 * also want to keep an untouched version of the command line
> +	 * to display on dmesg, /proc/cmdline etc.
> +	 *
> +	 * At this point boot_command_line is a temporary buffer
> +	 * (also on the init section) that contains the command line
> +	 * string passed from the boot loader. After we return,
> +	 * it will be saved to saved_command_line that holds the
> +	 * untouched version of the command line.
> +	 *
> +	 * Since we won't be doing any parameter parsing here, we'll
> +	 * hold the initial/untouched command line string on
> +	 * boot_command_line and make cmdline_p point to it as well.
> +	 * This way boot_command_line will be copied to both
> +	 * saved_command_line and static_command_line.
> +	 */
> +#ifdef CONFIG_CMDLINE_BOOL
> +#ifdef CONFIG_CMDLINE_FORCE
> +	/* Built-in args override boot loader args and
> +	 * boot loader args are being ignored.
> +	 */
> +	strlcpy(boot_command_line, fixed_cmdline, COMMAND_LINE_SIZE);
> +#else
> +	/* Boot loader args override built-in args so we
> +	 * need to put built-in args before boot loader args.
> +	 */
> +	if (builtin_cmdline[0]) {
> +		strlcat(builtin_cmdline, " ", COMMAND_LINE_SIZE);
> +		strlcat(builtin_cmdline, boot_command_line, COMMAND_LINE_SIZE);
> +		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
> +	}
> +#endif
> +#endif
> +
>  	*cmdline_p = boot_command_line;
>
>  	parse_early_param();

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
