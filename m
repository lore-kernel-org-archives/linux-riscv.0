Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06AD6C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 08:22:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FC0623131
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 08:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FC0623131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zmru9Uq8cmmmQ/4It8VvOG8DHWUKlLcoL45cS3nn2Ms=; b=fkiUUQPoeEuWySMj+7ngntaYQ
	gZ8Iv6qeMn5/61TrYATVGsB3J+wDOsjX1ZDmAdOyYkn3hL04TRBq8PBex41nMvYkJEfLM/aiCBqr9
	VQ75kiWs9lTbsClxFhs7s58loqAEUyzVCuqK7P8xi0TOcoXDGU7BjHFNfe+eskp8tUskvmbgI51YL
	OKZjYXDsw/fAYmWL7hn5MWAjCm1Ca7RodKljay6yUDtKWiHiW+wZr9o0+Z5BHtdzAYx9CHKTrZ3F2
	vZW1Meu9wDeYo8b6k1BCyxWTrSzhvWubojqOwa7eEnqSXwBHgqW4TowtHk0r3T0IqiLXWSYVgM/N9
	ZJCgkEDKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l28ki-0002nK-AV; Wed, 20 Jan 2021 08:22:08 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l28kf-0002la-Kl
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 08:22:06 +0000
Received: by mail-ot1-f53.google.com with SMTP id d1so2115755otl.13
 for <linux-riscv@lists.infradead.org>; Wed, 20 Jan 2021 00:22:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RTXeC5aayNTWG15s0puHZNF76pw0KopLItiiCJO0kOQ=;
 b=s3YHFVRM5D/lirV8rFHRIis+9rX0iMvabAlPmLM2ksG9Yiqh3Xm9uhF40S1eJN00XK
 6aIO1vkF+RuHvfzenKG8Trh734XiqPjuwKSJwFsCeROxYoHrbbtXdc9vO9MIbMyCEfz/
 AvijeR92nvUDu7VOVTYK3/ATbuqJ95CvlOiQCyZxMw7C5R2fXszOiQAktCaUn/8uowEA
 O7komaasYFEIc84e3MbjkJbuzRLMAoraaxwH7rrtL7u6F1I/c2ser24R2ffgp+XHX54h
 r7BzD2F9dPG1xHkKHzM5UxGuRV7vmhwmiOgON8FAS6UUTpnRbDlrQG08m/C7CMvLMLBc
 A/1w==
X-Gm-Message-State: AOAM533pzxwF37gq5CHQI6WDXw8W0SLfIEM+aG9X3qitDXSSoJIeiupU
 w+l9WG4OtoGfTsR93Ud/lCN4VPuMGZDwKh0SHjE=
X-Google-Smtp-Source: ABdhPJxL5N6wcJt6qVIc7MnWrCD+HV3MnF0jSYoMJDcejUYzcgd7QSTfMA5KTzHLd5LSmr1z299EJDfFUqtnk9s2zX8=
X-Received: by 2002:a05:6830:210a:: with SMTP id
 i10mr6283207otc.145.1611130924295; 
 Wed, 20 Jan 2021 00:22:04 -0800 (PST)
MIME-Version: 1.0
References: <20210119080938.1832733-1-geert@linux-m68k.org>
 <CAAhSdy3woKdo1=sZRO3ua=hK6M8NM7dp3nMFX99dKoUOC6+W5Q@mail.gmail.com>
In-Reply-To: <CAAhSdy3woKdo1=sZRO3ua=hK6M8NM7dp3nMFX99dKoUOC6+W5Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Jan 2021 09:21:53 +0100
Message-ID: <CAMuHMdXwrsgQNAF=7cObLw-j7jGvKERPaMd76FJaD2whhGSdrg@mail.gmail.com>
Subject: Re: [PATCH v4] drivers/soc/litex: Add restart handler
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_032205_686569_BEFD92D0 
X-CRM114-Status: GOOD (  12.77  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mateusz Holenko <mholenko@antmicro.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Gabriel Somlo <gsomlo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Karol Gugala <kgugala@antmicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Anup,

On Tue, Jan 19, 2021 at 9:18 AM Anup Patel <anup@brainfault.org> wrote:
> On Tue, Jan 19, 2021 at 1:40 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Let the LiteX SoC Controller register a restart handler, which resets
> > the LiteX SoC by writing 1 to CSR_CTRL_RESET_ADDR.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> We have SBI System Reset Extension (SRST) in upcoming
> SBI v0.3 spec. Using this SBI extension, you will not require a
> dedicated reboot driver for various projects such as Linux kernel,
> U-Boot, EDK2, FreeBSD kernel, etc.
>
> The OpenSBI v0.9 (released yesterday) already has SBI SRST
> extension implemented so we will just need platform hooks for
> LiteX.
>
> The Linux support for SRST extension is already available on
> LKML so far no comments: https://lkml.org/lkml/2020/11/25/6

Thanks, that would cover RISC-V.
But what about other users of LiteX, like openrisc and powerpc?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
