Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC88C64EB1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 18:30:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D43B20672
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 18:30:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AHcxJ4sU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="02Isdm3G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GFcDAW/h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D43B20672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=vjI9eM9+hcxoZWbTkRWZ8N6UF1hqP+f6I4rKWVxs1AY=; b=AHcxJ4sUbkIizXw7xJ+DXU4kP
	rP6o7hATdM7coLVa5M97P84AbVP3CU4iIicIuGNotRXxgLsxuzUk8RyGEt+SDLqqphU5S4xKu0ZbL
	AflFan7vvRY0sa1iRGBAUSuaemFIzVbBQ+DXbcStHQ+FZuOMIicUE4tUGs90omVO7pOQEliUAYYQP
	B/u8/2pvw9z8PABQqx13GmJ2iDHCpUytxjIaPYb6GcWE3Wa7FXALUfmgKKO43KfKMjNVUlLHJYPp+
	rsEfkzRzaYVOtNTFHk1UdvDd1NNfcjFO8m7Cj8Rt+log7GK3PhgdFkpY6BfNmffxMlj7bEHIQRwZo
	gV/HUKK1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVKto-00064l-7q; Fri, 07 Dec 2018 18:30:52 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVKtm-000639-Qj
 for linux-riscv@bombadil.infradead.org; Fri, 07 Dec 2018 18:30:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w45WFGc5WHZjrvRR2qUEQHnRZeD5KN/awL+SD2+Lq9k=; b=02Isdm3GZgZd6DNUrqpIEml3Zg
 l1uW/BTVJZnnrW3gkPqR9ogXnx0VYTk9itHfn7Z1DZYJXoE+rxuzY9VIFYZaJHL56q1EjC0NufRji
 iRVP/EJOD2PWo43/8w6CrtKkz7pp0zgYsnt39oJ3koLv1UdJwSCf3cipXvEwKz4BfrV38Q0JM1UGS
 ty1XoQ9gH82OMCjrX8wobyqG2fXVWsfQgzynEWhfB7H33AeXxKM3Sjy/9/tnG5U6xhubyLeKkWNs0
 ucTdA+jH80dwoMJ3Ga88SC15rJix+grDh2aWQnbjDkMcQzsX/PFI4ov2UR8fwCxYOAjtUJNQ0HrpK
 i7e9BUrQ==;
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVKtj-00083J-Gz
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 18:30:48 +0000
Received: by mail-pg1-x544.google.com with SMTP id 17so2083961pgg.1
 for <linux-riscv@lists.infradead.org>; Fri, 07 Dec 2018 10:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=w45WFGc5WHZjrvRR2qUEQHnRZeD5KN/awL+SD2+Lq9k=;
 b=GFcDAW/hHKqxzPJLVGy83GWnQ8oufMB8VRQy4pg4ErWwbCKnCNfG5U57Zk7R6z+sJB
 j8kHhZ57UwCKSzxKJ1PbaYvLrMqzc/Dfyjks9moI5hjvyUim9RYyyutlSl88dn9B6oYy
 jQ2a2TgWNgAqdTp95D3H/R1dqoolFSt/T8u1UOBdvPKHFQ/ooa0N3EMbfIKXwpBbByGo
 gbpW8ESVyDQbYejrzw5BA5L2ZxTfeYjIbpq2cs+BTP+wz6+gU0Y3tFFqFg0yIODJjocK
 2qyIsJJA0CSdRa8+V6RPtdFK/ukmf6EBp/lcNrn3sye+PGP8tTkoDik3KHCZPnvghnPk
 p8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=w45WFGc5WHZjrvRR2qUEQHnRZeD5KN/awL+SD2+Lq9k=;
 b=jnWK1U1R6459KdkFRm1eGbAwyvnwTeZmKfwhgx2cXyx3KCHYv1kW6oNTpcLbiMW6R9
 0pjEhosx+zcvD39pzhjNQEfZKdtMndGkSPHhvWlguyG3lf8ClGPuCjvCau9Bqblbl8c9
 o0zK03BWAgWaJLFoAwoNrwpXojPomcnx6AYm32oU6OecsmO6ABryG1LJgCrOo50Lqydq
 Od8ETcUNzHbiplIrQCDBOHJ0tul3l93uA/qhxoWt9tKQiau6u9A/ZatwMUxJMryQN7fn
 e8ZkK6Ks/bNw3tP7ZIs98kudO0iS5MeqUcDs7aLodLD5LFAJ01mTA1xekXTj1WDPg9DD
 ZY9g==
X-Gm-Message-State: AA+aEWYRXZW4jPOGhFuJJVtXt9LGQVW9o4fBc3x+7Lzflz3R8MOxvHam
 RGubz/kAK9igT1tx4iTCriWLsQ==
X-Google-Smtp-Source: AFSGD/UCeYLPcYkJqEmd5IQoY6ryuAxXERoJCloowyV3FdFBpqI0uimetaOcI/ey8lC+UYFDlR0kHQ==
X-Received: by 2002:a63:f047:: with SMTP id s7mr2858590pgj.441.1544207432846; 
 Fri, 07 Dec 2018 10:30:32 -0800 (PST)
Received: from localhost ([216.3.10.7])
 by smtp.gmail.com with ESMTPSA id s21sm9626847pfk.133.2018.12.07.10.30.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 10:30:32 -0800 (PST)
Date: Fri, 07 Dec 2018 10:30:32 -0800 (PST)
X-Google-Original-Date: Fri, 07 Dec 2018 10:21:43 PST (-0800)
Subject: Re: [PATCH 3/3] RISC-V: Remove EARLY_PRINTK support
In-Reply-To: <20181204135507.3706-4-anup@brainfault.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-4b39b504-3f5e-4c66-afaa-7929e92a14f7@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_133047_582661_14AD1AEB 
X-CRM114-Status: GOOD (  18.27  )
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
Cc: robh@kernel.org, aou@eecs.berkeley.edu,
 Greg KH <gregkh@linuxfoundation.org>, anup@brainfault.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 atish.patra@wdc.com, linux-serial@vger.kernel.org, jslaby@suse.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 04 Dec 2018 05:55:07 PST (-0800), anup@brainfault.org wrote:
> The EARLY_PRINTK using SBI console calls is not required
> any more because we now have RISC-V SBI support in generic
> earlycon framework.
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/riscv/Kconfig.debug  |  2 --
>  arch/riscv/kernel/setup.c | 28 ----------------------------
>  2 files changed, 30 deletions(-)
>
> diff --git a/arch/riscv/Kconfig.debug b/arch/riscv/Kconfig.debug
> index c5a72f17c469..e69de29bb2d1 100644
> --- a/arch/riscv/Kconfig.debug
> +++ b/arch/riscv/Kconfig.debug
> @@ -1,2 +0,0 @@
> -config EARLY_PRINTK
> -	def_bool y
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 2c290e6aaa6e..fc8006a042eb 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -35,31 +35,9 @@
>  #include <asm/sections.h>
>  #include <asm/pgtable.h>
>  #include <asm/smp.h>
> -#include <asm/sbi.h>
>  #include <asm/tlbflush.h>
>  #include <asm/thread_info.h>
>
> -#ifdef CONFIG_EARLY_PRINTK
> -static void sbi_console_write(struct console *co, const char *buf,
> -			      unsigned int n)
> -{
> -	int i;
> -
> -	for (i = 0; i < n; ++i) {
> -		if (buf[i] == '\n')
> -			sbi_console_putchar('\r');
> -		sbi_console_putchar(buf[i]);
> -	}
> -}
> -
> -struct console riscv_sbi_early_console_dev __initdata = {
> -	.name	= "early",
> -	.write	= sbi_console_write,
> -	.flags	= CON_PRINTBUFFER | CON_BOOT | CON_ANYTIME,
> -	.index	= -1
> -};
> -#endif
> -
>  #ifdef CONFIG_DUMMY_CONSOLE
>  struct screen_info screen_info = {
>  	.orig_video_lines	= 30,
> @@ -219,12 +197,6 @@ static void __init setup_bootmem(void)
>
>  void __init setup_arch(char **cmdline_p)
>  {
> -#if defined(CONFIG_EARLY_PRINTK)
> -       if (likely(early_console == NULL)) {
> -               early_console = &riscv_sbi_early_console_dev;
> -               register_console(early_console);
> -       }
> -#endif
>  	*cmdline_p = boot_command_line;
>
>  	parse_early_param();

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
