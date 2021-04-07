Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D5CC433ED
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 08:38:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AB9B61029
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 08:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AB9B61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LWPogRFrcGWoHytyLkRHvzMTyIynTSpHld4wrcI88OM=; b=P+MK072ijc6v3lyfGgwWAbxsW
	eQQu2bY84SiQYSQ6xLJSFQcBRslXwn/HBXW0fDVkng5mm/4m2KafSGtHlpTMLAlKW5AFpq1BZiP7W
	UbaPS/Zq7IgA3YOtv107bqz6LtGzmQ/elh6PhDoTrXFDyuGb6hJAAaCTU8Cyugxgo687GiSLXihgD
	rve/FAZfnjjC5u9GQIXP3CUD23/9GBXYAFXANw6JfH3pZaOsjqz+Mz43DzfeLfHVQEdvCiPnvnGr0
	NRWBKh8YY1tqEU6XlwednL/FTpix3Mv3LkO8okFuL43y6c2IZC7ajxocOdHOIpB3h63JmMpq4pX2O
	2OsSddu8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU3hd-004W89-Au; Wed, 07 Apr 2021 08:38:21 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU3hY-004W7V-Cm
 for linux-riscv@lists.infradead.org; Wed, 07 Apr 2021 08:38:18 +0000
Received: by mail-lj1-x234.google.com with SMTP id u9so19680352ljd.11
 for <linux-riscv@lists.infradead.org>; Wed, 07 Apr 2021 01:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AuFjkA3Te0yYWflgJfKxzh4S0jAnT6+PkWv6Iu0MWs0=;
 b=LFBuJUeg1Jml0D8sr6mXbhoYwJrV9La5vY9YIOdtk1QHn1VxCrm3R79qeO2S7/V8K3
 oGwlpk/zgnt8mPc1OYznR4jxUkYrkLqaHcn3+9VD6tFS5BH0zMC1EDBRoVoNRT9qpSty
 Odpw+Ebo/Gh0YXEPE58CYA9+oyvJwwM+nOo2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AuFjkA3Te0yYWflgJfKxzh4S0jAnT6+PkWv6Iu0MWs0=;
 b=cYXXo02ppl1UFN3Lk3Dnj4NZkhuzL0xZvGborhYSomcmY4PKOJiMudtD/1i+2+6F8V
 saP+dsCr422fCZL5Xs5kgbP1eGJaFAUMEvjBnxhrkNVITke9mD8IsMfnNwsG/ht/lXA5
 TYbOjiPYUH2yfBR+4dxGNc6wk3pj2OFIs2h7n/bCptYLPAqFkRGGCuPbhfOjgsi1WAfn
 cH+LUuohjXMBVCyKYcwbVKfxZVQ5736hSig2qsnpKQM8mqvGyldDQ/qoIVpmCi5D7YJt
 lZ8ld2pJjp7Vga1uhWUWVGuUxQL4Okvu+GNWNOTiDoPQLKx+ZmnthfZTd7C+dTlrhtnW
 QsrQ==
X-Gm-Message-State: AOAM530y8Fx9zbWjOWT24qQx7sJ0VRiCmr5ZFrojPFUz9pNxrfuBDRqT
 yq+sx1HCnnz+utCIGNQ/PFaf/+/p2mTv6j6MmR7JxgRlgHTalqDg
X-Google-Smtp-Source: ABdhPJyVLN3dn/GmaH9hhtE4TjLlahmNOWaMUoB6H3PcFErj/DDYE9Jhz3XRT4oPDAAfjRr41PabX1ZzBi/rJMDpc+c=
X-Received: by 2002:a2e:924f:: with SMTP id v15mr1542585ljg.172.1617784694327; 
 Wed, 07 Apr 2021 01:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-add8fe77-f966-42ee-97b7-3d78f48fb103@palmerdabbelt-glaptop>
 <ac54f74d-adab-e844-ad46-733b1560ece1@ghiti.fr>
 <324299b7-eef4-0961-239c-ee72100f2e85@ghiti.fr>
 <CAM4kBBL8pDrZT0aGygsjVLTKfRf8y2-YQeyGPDEBcujmaOZCyg@mail.gmail.com>
 <32a6ac11-f274-71ee-e5d0-dc60ba841495@ghiti.fr>
 <b9fe823e-5e7e-9f0d-3540-784dbf9480e1@ghiti.fr>
 <CAM4kBBJcb0fBnAGFJQTVoT2HDMks3mzg0_-DWrHVPhMk8Mf8dQ@mail.gmail.com>
 <CAM4kBBL0U25xyGbdxtQXu+O+E8KEghyr8iT1sH2JuGiG=udiFg@mail.gmail.com>
 <27b0ae72-bc84-a2f3-bae9-da6995d38058@ghiti.fr>
 <CAM4kBBJQ9g2Fbpcjp+--vCMZggBM3WOGqM1N0jJwwfHKjDM_KA@mail.gmail.com>
 <dd303c4c-713f-c68c-879d-f4212cc305ee@ghiti.fr>
In-Reply-To: <dd303c4c-713f-c68c-879d-f4212cc305ee@ghiti.fr>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Wed, 7 Apr 2021 10:38:05 +0200
Message-ID: <CAM4kBBLsWPVfL20Py=QVSUCT4QW6pDbJR_TVR=LtTVgMLqL1QQ@mail.gmail.com>
Subject: Re: [PATCH v6] RISC-V: enable XIP
To: Alex Ghiti <alex@ghiti.fr>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 LKML <linux-kernel@vger.kernel.org>, Bin Meng <bin.meng@windriver.com>, 
 Anup Patel <anup@brainfault.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
 Nicolas Pitre <nico@fluxnic.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_093817_248737_26539F87 
X-CRM114-Status: GOOD (  13.70  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Alex,

<snip>
> > All in all, I am quite sure now that your take on XIP is working fine.
> > The issue with single-core boot under QEmu seems to be  less
> > reproducible on slower machines running QEmu and more reproducible on
> > higher performance ones. It's not clear to me if that is a QEmu
> > problem or an in-kernel race, but it's hardly a XIP problem: I was
> > able to reproduce it once on a non-XIP kernel too, by copying it to
> > RAM in u-boot and giving it a 'go'.
>
> Ok then I'll post a v7 of your patch soon hoping it will go to for-next.
> I'll add my SoB to yours as I modified quite a few things and I thin
> people need to know who to yell at, if you don't mind of course.

No, absolutely not. :) Thanks for digging into this!

Best regards,
   Vitaly

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
