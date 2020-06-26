Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A840EC433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 21:57:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75CBD2089D
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 21:57:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0hNyLm88";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="qL1iJ7bZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75CBD2089D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M0wUsHY04m0QDag/mcC+WdqIzQPSID1C/xcDwaUo5CE=; b=0hNyLm88Hu9PaaBx5gXbUE6Ju
	D3wXbNDJkCqQ3w+fk1jsPo5nErlI+agbFNAjytu8zRjh7jTv7JO8g7hwCEjQ+uxMjt/16dHKpPbNt
	fXIHVWDGuwLBfNz80Vpui79L3MujyXGU6YKGhO9Sr/wi+J1V2tY5FEIjiKQeE3PZgq4AKBUpnFvI/
	wD/HHYE82/ef8h0CigGBC+WNnPf8+VywVtsBn3032+b72HTgWjlekkLAX2Gklef48++RnVDE3dehf
	qQsQ/zVjZEVIKiwiAXFhgT4DM2BGUmTcHmXZ2Jrkv0R1+cxCZh3JOUXzRXBRVge3zURdFjqnYnZ//
	7Tq7Yyurg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jowM1-0007pF-9u; Fri, 26 Jun 2020 21:57:49 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jowLx-0007o5-HG
 for linux-riscv@lists.infradead.org; Fri, 26 Jun 2020 21:57:46 +0000
Received: by mail-wr1-x441.google.com with SMTP id f7so7846228wrw.1
 for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2020 14:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GaefEko3kEAOd19TubqWqNAf+AVqFUJ4Wq5QM8k6oA0=;
 b=qL1iJ7bZpKKnvVKjD187zlZlhBdctCIOERlzFxD2/eUC+EigcNn9fFXpSLUQiHsyPM
 J2GyHAN1uXx0fDpU6ax3Q+zfqDjOXSEV4Imh/Rr/W9vmTL3sHKRmaPqoKv/uCzOoM5xe
 jnSN/Kniwd9tOv+pNM5FyqOtdLSjaqdhl1eCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GaefEko3kEAOd19TubqWqNAf+AVqFUJ4Wq5QM8k6oA0=;
 b=HFKqQVYUdDaN+V/uLTSOI0hR74iHJfw93ZvXpgRCTL2P1TVEU4BkoctLpH4ILqjRH4
 o7GBmCfDu5YzdwJlUSpoQzQ5Hs+/GQCKhsWwiForpd33tIQ0wGRDFqhw3oP+XbESvs4w
 B8iNECHNZU3BjuTImT/ihkYhXdnIKY4gkSAnswpu6SXZ8dyU79gWV188wVe5lhVrLL4u
 kpeu9s+3E4S2yMqSiB+jOeIfKut7teT6qmqM4h2LSpF28CpYPhpUUytVg9bktSv5mmT6
 jKOVXsDLZx8sVbbFeaui4sf+/hI4ECN7hLcYYQ0U8C/GPfMcZT6unquM4yeRhz4RB66e
 b81A==
X-Gm-Message-State: AOAM5303qloTjV7kPp8RpxehCwFaxeIoXtiSi1MA+4rT2xpZmKw7rw3w
 2I/SkZ3yUW9XcCtplHUKik7P3Ftm/L1bym+KMOpl
X-Google-Smtp-Source: ABdhPJyOcljMPyApSrrEvUL7seEvgR6bpWPbI+cLBCYQT1ljE7hdK0sJpijoILYe0Ntw+U/b51zVLnq6pnDNP2TU1tE=
X-Received: by 2002:a5d:62d1:: with SMTP id o17mr5616423wrv.162.1593208664289; 
 Fri, 26 Jun 2020 14:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200625234516.31406-1-atish.patra@wdc.com>
 <20200625234516.31406-11-atish.patra@wdc.com>
 <8b71b663-8a68-26f3-c806-a2873a6d8923@gmx.de>
In-Reply-To: <8b71b663-8a68-26f3-c806-a2873a6d8923@gmx.de>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 26 Jun 2020 14:57:33 -0700
Message-ID: <CAOnJCU+=0Ozz=qfMULsN4-4rq_q4UFYsnkH50Bo5PfzUU45e6g@mail.gmail.com>
Subject: Re: [RFC PATCH 10/11] efi: Rename arm-init to efi-init common for all
 arch
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jun 25, 2020 at 8:00 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> On 6/26/20 1:45 AM, Atish Patra wrote:
> > arm-init is responsible for setting up efi runtime and doesn't actually
> > do any ARM specific stuff. RISC-V can use the same source code as it is.
> >
> > Rename it to efi-init so that RISC-V can use it.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  drivers/firmware/efi/{arm-init.c => efi-init.c} | 0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename drivers/firmware/efi/{arm-init.c => efi-init.c} (100%)
> >
> > diff --git a/drivers/firmware/efi/arm-init.c b/drivers/firmware/efi/efi-init.c
> > similarity index 100%
> > rename from drivers/firmware/efi/arm-init.c
> > rename to drivers/firmware/efi/efi-init.c
> >
>
> After each patch we should have code that builds. This helps when

Absolutely.

> bisecting. Therefore I would have expected an adjustment of
> drivers/firmware/efi/Makefile in this patch and not in patch 11/11:
>
> -arm-obj-$(CONFIG_EFI)                  := arm-init.o arm-runtime.o
> +arm-obj-$(CONFIG_EFI)                  := efi-init.o arm-runtime.o
>

I think I messed it up while rebasing. My bad. I will fix it in the
next version.

> Best regards
>
> Heinrich
>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
