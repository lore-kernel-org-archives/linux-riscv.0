Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EFAC43218
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 20:00:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44403206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 20:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SsCLHsnd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mj7u0XCT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44403206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Zqc6wpHo68Zyl88qH5fwK/s6rFx+rL52IlSuRdprhQ=; b=SsCLHsndCjJfOX
	+U2TZsumbUaU4YXX7jkBr6CStok1D4rDSzW00LVJfPq26GnFoSbn0Q26exw8A4LREPkCCVVuCEVaV
	JDz0GUoBSlpYNUloCwK9/va6OFG272/s+H4NPeAB8IhYDXRDNM1Mnf3jjnxCiWktwOMrfHMy2X9qE
	p6v5zbbBi7frIMgzCWWpg+wh7a9iEzKvg+FKuXW0W5exXoTN6r7Ct4jr/uUbiOHltEplFvMr79NaX
	yTxOMFxuZ1WoSU8L1pmda7I6lgGAjY3Pm4MfCHqNe8hVO5teY7+YbQC+LkOh0gViqGvtUc89a36Z+
	I+aeHSfoYqg4nhTlnrTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJkXS-0000pP-1o; Thu, 25 Apr 2019 20:00:10 +0000
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJkUb-0004aC-Ud
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 19:57:33 +0000
Received: by mail-it1-x141.google.com with SMTP id x132so2159677itf.2
 for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2019 12:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=gvwc2z4S6BD6uWlEMi4IucZ2NoOc2SvZD8TjjoytUcY=;
 b=mj7u0XCTY89HpkX0rB6pEM6G9cN6dFJV7R66tTAw7uYiAQtFjBSVi9RLv6syTFdrnY
 YLUwYsQhOY7lyffrxcjZSQOZRcNQH09RuuG+25zPhuTKCmzkYfiC0txxsoyV/knfI8Nm
 mKKoAJTXoikIsAV4Ei8d4YW3PHr/tPNZc2CbzRJBkILzC4/3OchxfNDU9tbm9GH4KHOK
 RvT8z24Nha/ML2F/mkcPW1+YBgCyg3xi4q2EqEJUswisH59HQ5G6rP7/XsdBw0dYMJaX
 pukbWyejRCZWSheiE83PzWJjqKY1+th3lCOH33QEV5y5Ad7HsEomdNC3Um7p5kIsefoH
 Qdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=gvwc2z4S6BD6uWlEMi4IucZ2NoOc2SvZD8TjjoytUcY=;
 b=N/oypyr0UAmoLQ8gJGpXmhDLX+ddlodnFI2cvcD0Hy/M/O8XWnqJrwkD1tvz2tZcsX
 VWJXAXlrsSZc81Wh2fXy7mUetcfcy/aV69vepoHl0eJ9XTAYmrsavHmJleOWTv/2IL/v
 pH8Nvb7ZN9JwhG51KUleJSV0nDhoM+lenzuWX1pe6JungPpA1tXNm5RqRJH/RCCR+vEY
 /uUnKi957kkvwb3YbFPCkYUcEWnlq/Ng4QUMaoxk3Ek+kRLAkayuopt0cK1qsEe8Y1Cw
 HLHc5waVtwLXMoqjvRgK9Sok30ZAn4ZhgTC5RLSI+5aKbIS7IYmCyL+Hx+Sq2veOQOww
 Rvew==
X-Gm-Message-State: APjAAAV5MVCK0FsqlZKekWf/DM3lxZUwjhGGXjo2Ty/6BUsFG/vY/PYK
 b0Gr0rCWRnoR/DcdA6s+8xohkA==
X-Google-Smtp-Source: APXvYqwZ/YflD4xyz9LUJg/gRo5Ytqr+BO/vOnfgsaQnT15Lt7D91H3JJVgMIt7YTQxhP4jEcCWaMQ==
X-Received: by 2002:a05:660c:3c7:: with SMTP id c7mr4972199itl.2.1556222232601; 
 Thu, 25 Apr 2019 12:57:12 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 t67sm11013344ita.35.2019.04.25.12.57.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Apr 2019 12:57:11 -0700 (PDT)
Date: Thu, 25 Apr 2019 12:57:11 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 9/9] riscv: call pm_power_off from machine_halt /
 machine_power_off
In-Reply-To: <20190411115623.5749-10-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1904251227220.17442@viisi.sifive.com>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-10-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_125714_439590_EB9193F2 
X-CRM114-Status: GOOD (  17.70  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 11 Apr 2019, Christoph Hellwig wrote:

> This way any override of pm_power_off also affects the halt path and
> we don't need additional infrastructure for it.
> 
> Also remove the pm_power_off export - at least for now we don't have
> any modular drivers overriding it.

I'd propose that we keep the pm_power_off export - both to align with 
other architectures:

$ fgrep -r pm_power_off arch/ | grep EXPORT
arch/s390/kernel/setup.c:EXPORT_SYMBOL_GPL(pm_power_off);
arch/m68k/kernel/process.c:EXPORT_SYMBOL(pm_power_off);
arch/hexagon/kernel/reset.c:EXPORT_SYMBOL(pm_power_off);
arch/ia64/kernel/process.c:EXPORT_SYMBOL(pm_power_off);
arch/sparc/kernel/process_32.c:EXPORT_SYMBOL(pm_power_off);
arch/sparc/kernel/reboot.c:EXPORT_SYMBOL(pm_power_off);
arch/sh/kernel/reboot.c:EXPORT_SYMBOL(pm_power_off);
arch/um/kernel/reboot.c:EXPORT_SYMBOL(pm_power_off);
arch/openrisc/kernel/process.c:EXPORT_SYMBOL(pm_power_off);
arch/nios2/kernel/process.c:EXPORT_SYMBOL(pm_power_off);
arch/arc/kernel/reset.c:EXPORT_SYMBOL(pm_power_off);
arch/arm/kernel/reboot.c:EXPORT_SYMBOL(pm_power_off);
arch/nds32/kernel/process.c:EXPORT_SYMBOL(pm_power_off);
arch/csky/kernel/power.c:EXPORT_SYMBOL(pm_power_off);
arch/alpha/kernel/process.c:EXPORT_SYMBOL(pm_power_off);
arch/arm64/kernel/process.c:EXPORT_SYMBOL_GPL(pm_power_off);
arch/unicore32/kernel/process.c:EXPORT_SYMBOL(pm_power_off);
arch/c6x/kernel/process.c:EXPORT_SYMBOL(pm_power_off);
arch/xtensa/kernel/process.c:EXPORT_SYMBOL(pm_power_off);
arch/h8300/kernel/process.c:EXPORT_SYMBOL(pm_power_off);
arch/powerpc/kernel/setup-common.c:EXPORT_SYMBOL_GPL(pm_power_off);
arch/mips/kernel/reset.c:EXPORT_SYMBOL(pm_power_off);
arch/riscv/kernel/reset.c:EXPORT_SYMBOL(pm_power_off);
arch/microblaze/kernel/process.c:EXPORT_SYMBOL(pm_power_off);
arch/x86/kernel/reboot.c:EXPORT_SYMBOL(pm_power_off);
arch/parisc/kernel/process.c:EXPORT_SYMBOL(pm_power_off);
$

and to make sure there's no hassle with the drivers that expect to assign 
something to it:

$ fgrep -r pm_power_off drivers/ | fgrep =  | cut -f1 -d:  | sort -u | wc -l
39
$

For what it's worth, I agree with the implied criticism that reassigning 
pm_power_off is not a good interface.  There is the obvious problem that 
more than one chunk of independent code could all try to assign to 
pm_power_off.  However, to avoid creating a RISC-V-specific mess when 
someone uses a TI PMIC driver on a RISC-V board, or tries to use ACPI with 
RISC-V, fixing that seems best done as a separate tree-wide series.

...

Replacing machine_power_off() with a call to your default_power_off() 
looks fine to me.  However I think it makes sense to change our existing 
machine_halt() (which was not added by your patch).  Looking at other 
major architectures - x86, ARM64, and ARM - they don't actually try to 
power down the system in machine_halt(), instead just entering an 
infinite loop, WFI, or calling into firmware or a hypervisor.  I'd propose 
that we align with that approach.


- Paul

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/kernel/reset.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
> index 2a53d26ffdd6..ed637aee514b 100644
> --- a/arch/riscv/kernel/reset.c
> +++ b/arch/riscv/kernel/reset.c
> @@ -12,11 +12,15 @@
>   */
>  
>  #include <linux/reboot.h>
> -#include <linux/export.h>
>  #include <asm/sbi.h>
>  
> -void (*pm_power_off)(void) = machine_power_off;
> -EXPORT_SYMBOL(pm_power_off);
> +static void default_power_off(void)
> +{
> +	sbi_shutdown();
> +	while (1);
> +}
> +
> +void (*pm_power_off)(void) = default_power_off;
>  
>  void machine_restart(char *cmd)
>  {
> @@ -26,11 +30,10 @@ void machine_restart(char *cmd)
>  
>  void machine_halt(void)
>  {
> -	machine_power_off();
> +	pm_power_off();
>  }
>  
>  void machine_power_off(void)
>  {
> -	sbi_shutdown();
> -	while (1);
> +	pm_power_off();
>  }
> -- 
> 2.20.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
