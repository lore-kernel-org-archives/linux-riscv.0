Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A857C47422
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 15:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5BwxzARSSdiW8Eq0UECy/YvVjrxlon/dncz9T6SAB+8=; b=vrT+hqjLD0rItyH9+bs4O+dz0t
	ONuGrDUSwiBnV+7z3LpBiWnDfJMxur2dnpdmDvGpfLxm/K0Tv/Z+vzv21a+gBbyaHzRh1agK13vO1
	ntSTlSIJgC4Pz4sp97eL+b6dxhhYgJuL4Ss7uBbhlqRC79uOLPTQptuVqlGZGJDccFT447aG6miu5
	AJsdE2BtNH1hAr2jL9+oZpHLt7nOkROBZND16CCSytPsOPBKz42BzWzHL+JPKjyU7AvBPaYAQml1H
	WdIH5aDV/y5sFv3w9eCT1Ooknf8hE06rTOzXuhje5q2UNghawWi2epWl+dmbkPOLoqZbUVITkOwlv
	TdFIqIYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNx5m-000SX5-1R;
	Thu, 11 Jan 2024 15:35:38 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNbSD-00CuAs-1m
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 16:29:23 +0000
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5137F3F741
	for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 16:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1704904155;
	bh=uv9EP/w/9lKiqxJDFswe5iRGGwCnnVkmNEold/I0ZHc=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=glZGQqaXBD4oKJYeWFxkmEMQnxEa4jXgMMVyXdrshZJeItnwZgpkdnL7zNeXYVakP
	 VuB24rAqXF0ob99aNVbqrtY6BTjrRpquv7gGKe8tU9+A8R+f5APLa8KGpPpXMSQPxF
	 g0NHjbNEXNCT9A4cdy4e5O3F8ldM/SEWLF6fTt5nVD9adix4fR8BxvTVqU8S3Z9o2o
	 uDkfO8O9iCDulYe1VhBaa3yGZwW/aVpB9y0HlxtiiHVJDsu7AqJsSPk9rsV2S52/jO
	 GaHQ9NyyJQ5tX/di9FjDyRhjUgMqRFjcqVLc74WXy8PiDZP7b/MTVcuNtMvnoSq8WD
	 F1eawYtRLtgqg==
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6de353881d7so522860a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 08:29:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704904154; x=1705508954;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uv9EP/w/9lKiqxJDFswe5iRGGwCnnVkmNEold/I0ZHc=;
        b=vdnyCJqEteRgZewTFruBmNBjF5Jg2eIBHdOyDVi8epP7IyqV1PAtGP7cXlvnBknmJ4
         LG7g4VOI/R2zD+0PqbYTcAcV8KfBoodg8JeEcim5lGFGuylgWl81A3RKbK5PwcmIcRwD
         I6JGHEtuf1haqoVmIbO55f/ATmKyQKpmi5OZb0xG191ojkUz9/nybS5T4bTeILClQ0yF
         6ppoaQiCpOYPUOlN2KKwnUrG/US5CZRk4LxCuWqhCwZ0lu99WmyWJm1dCrhlq8pRZ4VO
         3Q0qfV8c92+DZw2rGJB9g1XHG6e7xHzC1t/My2VzFCKHLnyF3z4TxBlgrOnGxqCuuZTD
         9cCA==
X-Gm-Message-State: AOJu0YyxMPK79ppdqpaWjpkoNhwDnU4cGouqpJUYuZCR4MhqZla4KQ2F
	9INDa8L6nkqO6C1ZqBLX9QS8iesTOuxW9o7GkEP3pfLr4A8N7HUv/RVZ37OEWzJ7EJSATwoJgkl
	8sfBUvLpNDQijVhaOcaqP2N7GvfqZenrg0Z9Yd4Qdp0jtJJmadjhXyZ1izmlev7VADJ0l
X-Received: by 2002:a05:6830:1184:b0:6dd:e1a7:985c with SMTP id u4-20020a056830118400b006dde1a7985cmr853571otq.64.1704904154046;
        Wed, 10 Jan 2024 08:29:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbHlXIe2CrSKgMXB12cTUPD3lT7PL5ZyJdEPF2+t0EcSUNyc5cEMlt0ZMzdAuC3C3APnreiaTINaV7wsxklKM=
X-Received: by 2002:a05:6830:1184:b0:6dd:e1a7:985c with SMTP id
 u4-20020a056830118400b006dde1a7985cmr853563otq.64.1704904153819; Wed, 10 Jan
 2024 08:29:13 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Jan 2024 11:29:13 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <ZQ0PR01MB098182407F5F427D9A6C7CD9826BA@ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn>
References: <20231214072839.2367-1-minda.chen@starfivetech.com>
 <7hfrzeavmj.fsf@baylibre.com> <ZQ0PR01MB098128579D86207B4B9BA7D28266A@ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn>
 <7h34vbbsfj.fsf@baylibre.com> <ZQ0PR01MB098182407F5F427D9A6C7CD9826BA@ZQ0PR01MB0981.CHNPR01.prod.partner.outlook.cn>
Mime-Version: 1.0
Date: Wed, 10 Jan 2024 11:29:13 -0500
Message-ID: <CAJM55Z9HtBSyCq7rDEDFdw644pOWCKJfPqhmi3SD1x6p3g2SLQ@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IOWbnuWkjTog5Zue5aSNOiBbUEFUQ0ggdjEzIDAvMjFdIFJlZmFjdG9yaW5nIE1pYw==?=
	=?UTF-8?B?cm9jaGlwIFBDSWUgZHJpdmVyIGFuZCBhZGQgU3RhckZpdmUgUENJZQ==?=
To: Kevin Xie <kevin.xie@starfivetech.com>, Kevin Hilman <khilman@baylibre.com>, 
	Minda Chen <minda.chen@starfivetech.com>, Conor Dooley <conor@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo <mason.huo@starfivetech.com>, 
	Leyfoon Tan <leyfoon.tan@starfivetech.com>
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_082921_999158_4CAE5584 
X-CRM114-Status: GOOD (  31.86  )
X-Mailman-Approved-At: Thu, 11 Jan 2024 07:35:36 -0800
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

Kevin Xie wrote:
> > Kevin Xie <kevin.xie@starfivetech.com> writes:
> >
> > >> Minda Chen <minda.chen@starfivetech.com> writes:
> > >>
> > >> > This patchset final purpose is add PCIe driver for StarFive JH7110 SoC.
> > >> > JH7110 using PLDA XpressRICH PCIe IP. Microchip PolarFire Using the
> > >> > same IP and have commit their codes, which are mixed with PLDA
> > >> > controller codes and Microchip platform codes.
> > >>
> > >> Thank you for this series.
> > >>
> > >> I tested this on a VisionFive v2 board, and it seems to probe and
> > >> find my
> > >> M.2 NVMe SSD, but then gets timeouts when trying to use the NVMe (e.g.
> > >> 'blkid' command)
> > >>
> > >
> > > Hi, Kevin:
> > > Could you please provide the manufacturer and model of the M.2 NVMe
> > > SSD you tested?
> >
> > I have a 256 Gb Silicon Power P34A60 M.2 NVMe SSD (part number:
> > sp256gbp34a60m28)
> >
> Thanks, Kevin, we will buy one to test.
>
> Before doing this refactoring, we encountered the same bug with Kingston M.2 SSD,
> and we workaround the problem with the below patch, please have a try:
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index 507bc149046d..5be37f1ee150 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -1059,6 +1059,16 @@ static inline int nvme_poll_cq(struct nvme_queue *nvmeq,
>  {
>         int found = 0;
>
> +       /*
> +        * In some cases, such as JH7110 SoC working with Kingston SSD,
> +        * the CQE status may update a little bit later than the MSI,
> +        * which cause an IRQ handle missing.
> +        * As a workaround, here we will check the status first, and wait
> +        * 1us if we get nothing.
> +        */
> +       if (!nvme_cqe_pending(nvmeq))
> +               udelay(1);
> +
>         while (nvme_cqe_pending(nvmeq)) {
>                 found++;
>                 /*
>

Hi Kevin,

Thanks, this fixes the same problem on my WD Blue SN570 250GB.

Before this patch I found that CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y fixed the
problem, but it's now clear that this only slowed my kernel enough that this
wouldn't trigger as often.

/Emil

> > Also for reference, I tested the same SSD on another arm platform (Khadas
> > VIM3) and it works fine.
> >
> > Kevin
>
> Hi, Bjorn:
> Do you have any idea about the late CQE phase update condition as mentioned
> in the patch comments above?
> This is an issue that occurs with a small probability on individual devices in our
> platform.
> Thus, I suggest the refactoring patch set should go forward.
> Later we will try to find a more formal solution instead, and send a new patch.
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
