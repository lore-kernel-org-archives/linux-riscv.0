Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF79C433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 23:54:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D41E6187E
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 23:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D41E6187E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X8TEn77GWBzzy5Ua+RCwhdwKDvk8kWKodglP2tmsELg=; b=KSpJLG4T71UHbTY382oLgjOOH
	1/dhtIDYiP7WK8A8ozSWUBv4gJGHuQEoJwA/+4mY1EhuOXcZOWEYneb+ea3AAGOQdl8Mfqhzz0d7d
	KLTKBhz2HnvHMU9mZru+r/fFlIBdxCg2Tmg9ThmYX98/Yt+9Zt0oZU+zZKBlTT2XHt3uKM7BzsqdT
	SfUAcg0ygQbDUVJgi0YYwd0IgtENAq8LxIE3PWq7ecVXHyzdVOmk9RHP7OleWsnT1lE7PD+zHOGwI
	JYFfkbZhE0dHU0SwXS1m10O/DUb6gii00Bveefx5loLkSObwcK1BcVkG/LzLSpvLLZ/WfBGhf5BC/
	RkOsrVACw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lROBp-0059Mr-Hm; Tue, 30 Mar 2021 23:54:29 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lROBh-0059Lz-DH
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 23:54:25 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso283548pjh.2
 for <linux-riscv@lists.infradead.org>; Tue, 30 Mar 2021 16:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4eVDKwhdLmciP93KTCC0yDxL5KfIZeE8g1SyVsqOLkA=;
 b=AlKXlLsA5yjVpl1CX25zymbCDal6W0KEOLvxT4VwnOEYesq4ZDx+gAr/9NziioBh2d
 EBqtWpicZr/mamdSf7J+UaN2FceX+60I+T9RVpm0muefken1m/AuVKntCTSKN7f3EOtW
 XCnV6eRQfewJp0THXtwT2vxo10+wyU7BgTRMSYK2UVHaazCd1CWsG9NeoZb+SxzAbu6p
 4/EbRqAglhHPqRkoLWWwPkqn0LhmqFg5evzFxUeejxyoWBnNXtLO7ZvhuakYQNYqI8Tj
 Ddkz21c+cS5oD7gggWaFlzrQRHqqfzV0k22WBrx3lIY8ssKz0g3e4tEGLl2urNkAGEvF
 rHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4eVDKwhdLmciP93KTCC0yDxL5KfIZeE8g1SyVsqOLkA=;
 b=SmCsb9Nfu5TmPWe7ehsu0DfIpphfd454Q5+I1HTtJYAVfOxB7vDQX7NKQK7cPdsb8v
 S9IgKd3LRfb0tBE59yMpt+liqneWt7AfTAW/3J+uctY702PQBdO/DpspIOTFT324eoYf
 69DNmtFw9a3PRvx7iVrxtQ17aIFS3VWvdGUSo/jpfrJymiZbuhJqQnTKHkhl99+8mr8s
 ZF5N5LBB6Amk4mv1UPvpRn0BHHK6T7Ia9am/aGmBJgrUzRVWt8vZfOxtN6DxGoacnLvu
 g2iZYAJ/FepTJt726ENVcGr83afwcQ0HogHhT+Auc0kXylPBkIFsIbDhfrbZfbw2SVzY
 Dn3Q==
X-Gm-Message-State: AOAM533mK0CCExvjK4prMRZ2fyYVqLPx2RHL8bRjiVy7CQbQaw6AAigv
 +OoKKgRE0YjYSb72zZ9my+tA/g/bB7M8fEKgTu8=
X-Google-Smtp-Source: ABdhPJyv6Y/IWr85TsPhRhzUNvg49VdAa4O+NvEAVMjplZUTBY5Ax+gXoj0f79QdzyQQRKgKWYrz9Zyim4Cb6CEbMPc=
X-Received: by 2002:a17:902:be02:b029:e6:bb0d:6c1e with SMTP id
 r2-20020a170902be02b02900e6bb0d6c1emr680485pls.77.1617148458772; Tue, 30 Mar
 2021 16:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-1b7b4cb7-2f9a-4bdb-b00c-14ec1d7008b0@palmerdabbelt-glaptop>
 <1afc3d35-55ff-eefd-3fc9-6342f85fa887@microchip.com>
In-Reply-To: <1afc3d35-55ff-eefd-3fc9-6342f85fa887@microchip.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 30 Mar 2021 18:54:08 -0500
Message-ID: <CABb+yY2s+ovT4Dhbsy4Mjn2EtgEwYdezhmUcL3H8GWCdaO2bPA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add support for the PolarFire SoC system controller
To: Conor.Dooley@microchip.com
Cc: palmer@dabbelt.com, Rob Herring <robh+dt@kernel.org>, Damien.LeMoal@wdc.com,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, 
 Devicetree List <devicetree@vger.kernel.org>, linux-riscv@lists.infradead.org, 
 j.neuschaefer@gmx.net, Lewis.Hanly@microchip.com, Cyril.Jean@microchip.com, 
 Daire.McNamara@microchip.com, Atish.Patra@wdc.com, Anup.Patel@wdc.com, 
 david.abdurachmanov@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_005423_885499_1580FD20 
X-CRM114-Status: GOOD (  18.95  )
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

On Tue, Mar 30, 2021 at 6:06 AM <Conor.Dooley@microchip.com> wrote:

> >>  create mode 100644
> >> Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
> >>  create mode 100644 drivers/mailbox/mailbox-mpfs.c
> >>  create mode 100644 drivers/soc/microchip/Kconfig
> >>  create mode 100644 drivers/soc/microchip/Makefile
> >>  create mode 100644 drivers/soc/microchip/mpfs-sys-controller.c
> >>  create mode 100644 include/soc/microchip/mpfs.h
> >
> > The only problem I see here is that patch #3 (the driver for the system
> > controller) comes before patch #4 (the DT bindings for that driver).
> > That
> > triggers a checkpatch warning.  I can just reorder it, but it would be
> > great to
> > have some reviews from the DT and mailbox people.  If not I'll try and
> > find
> > some time to take a closer look.
>
> I've had a fair bit of back and forth with Rob about the dt bindings,
> hopefully this version he happy with - think all of his concerns have
> now been addressed. Haven't heard anything from Jassi Brar on the device
> tree side however
>
Nowhere is explained how the controller works, and the bindings seem
trivial, so I have no concern.

-j

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
