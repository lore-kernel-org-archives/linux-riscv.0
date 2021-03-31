Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF0AC433C1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 00:43:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C521619BD
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 00:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C521619BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gbQnJirHBm0ZfGVzzhNoy2YmfJcsVoG1hoURGwIwfyI=; b=bC+urfT+bPow2ux3nELuEm54t
	mMQ2zH/+4yDRcDOHyZLmoRYciaRRA7mCEDgq6otUsC7me7hV4TD6p8gSwVOy4kbp/daxz5Fk9IYLZ
	L78wcjyOlt71C6oBL/YcDgXOeOLHZ36ULkfKJsMO/isp+6IiY7/tox1W7xdJtKemI66knG+439/bv
	t9ZXblH2e3v1fGyGY8cez78BuLrIgExWALL6oIfgtwYcrOWMyaq1Dw+u9mrKU46kIQqJkxF7+udpr
	mf/6NqXG0hHLzb1cYqtxOkMZcP/ZnK98KKYEy6Ii7skR+K7h/2+tkO9pI+O9pRB3EbA2qJx9/Ii0M
	cLkgDthtQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lROwo-005Ce8-T8; Wed, 31 Mar 2021 00:43:03 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lROwj-005Cdh-4a
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 00:42:59 +0000
Received: by mail-pg1-x52b.google.com with SMTP id v10so12919523pgs.12
 for <linux-riscv@lists.infradead.org>; Tue, 30 Mar 2021 17:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xiW5jawOlQ76P4FWk0YbQQAu/W4APliv2SXCnO1FSOk=;
 b=W4aAjNrNmDfvwAuqOPd6gDGxwWuYV6QtwKbfDN+I3vVXBUPODzBQ5RSjDCJe+vWUrE
 LCG7AmJ948RfbKzE+iiNChEci2WglLEi299qReDK9pRGY0NdjvLxgmvftIZwKX4zunXi
 pIIWR/SquaGnxGdLrCDKvRfylJuaCQpeuBooNIZ+frdTr6b0aQ7rqeWyM6hbS/+X0FKm
 w14bI73n5ASc8SGjn6U58xOfTtA1MFXbuc5K8TRsMDl5+Y6H10m+J9f4dXFJHb5EFCT9
 6iMw3/CQs/rKmDweMkiRrgfeikKPEEqh3++wxEnMoOoin8MtngzACyzQC9ejAFiQFuPM
 3OBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xiW5jawOlQ76P4FWk0YbQQAu/W4APliv2SXCnO1FSOk=;
 b=lmzqtYE+G+c8v+sfVHdXh+rRswsp8KT6OvsbDSnDG+YgXTFpuA8VWnAx7ACDfpUr51
 r9dEEC280CHBcRYyZU3oReZu/BuTFmOavuELzxDuGBBKIjUeUwehOYSEyjnDHDucNyrn
 GzyX6vAc9iU/+pYyItZazFuDWbiM3Q3sBMCwPrdpDo1IV2x1+E/zCwv2UgL5zsxQmdFK
 gp4zzK4/IvxveIxLcGehnIB0lBcvV1kCXexnsz8lUTyp0VUP4z0xtsokJNtrZ4Gf1sE8
 49z9vYYyn8xpRguNu/heFFm1qsXBs+KoT9kkY7UFy8NOCemLhGMEeaZBnmJqnxXCNqpv
 hZTw==
X-Gm-Message-State: AOAM530r4vYms2d4TCDGEIg+luqWbM++5ywisdDeP53TGHTdLdsdcEr1
 wfkyfTESfxymY2R3HDoVmUhGLvrCWpcnODy7Lwc=
X-Google-Smtp-Source: ABdhPJyEA9P2SjMFHNXzeYqlV4szqur3iLVrl0D8GCxO8dj4gYOdm5RcjCA49JmLS3eF02Cs+6igrU+HTh7yNQUWVA0=
X-Received: by 2002:a62:68c4:0:b029:226:5dc5:4082 with SMTP id
 d187-20020a6268c40000b02902265dc54082mr501620pfc.48.1617151375532; Tue, 30
 Mar 2021 17:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210311113439.15458-1-conor.dooley@microchip.com>
In-Reply-To: <20210311113439.15458-1-conor.dooley@microchip.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 30 Mar 2021 19:42:44 -0500
Message-ID: <CABb+yY0uYf1C3SRmEtTxsvfqwJ-4Qt=G7jWVMnE_3giJ0siF4A@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] mbox: add polarfire soc system controller mailbox
To: conor.dooley@microchip.com
Cc: Rob Herring <robh+dt@kernel.org>, damien.lemoal@wdc.com,
 aou@eecs.berkeley.edu, paul.walmsley@sifive.com, palmer@dabbelt.com, 
 Devicetree List <devicetree@vger.kernel.org>, linux-riscv@lists.infradead.org, 
 j.neuschaefer@gmx.net, lewis.hanly@microchip.com, cyril.jean@microchip.com, 
 daire.mcnamara@microchip.com, atish.patra@wdc.com, anup.patel@wdc.com, 
 david.abdurachmanov@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_014257_402428_FE28110E 
X-CRM114-Status: GOOD (  18.65  )
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

On Thu, Mar 11, 2021 at 5:34 AM <conor.dooley@microchip.com> wrote:

> diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
> new file mode 100644
> index 000000000000..7aa6c8c87ea0
> --- /dev/null
> +++ b/drivers/mailbox/mailbox-mpfs.c
> @@ -0,0 +1,277 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Microchip PolarFire SoC (MPFS) system controller/mailbox controller driver
> + *
> + * Copyright (c) 2020 Microchip Corporation. All rights reserved.
> + *
> + * Author: Conor Dooley <conor.dooley@microchip.com>
> + *
> + */
> +
> +#include <linux/io.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/mailbox_controller.h>
> +#include <soc/microchip/mpfs.h>
> +
> +#define SERVICES_CR_OFFSET             0x50u
> +#define SERVICES_SR_OFFSET             0x54u
> +#define MAILBOX_REG_OFFSET             0x800u
> +#define MSS_SYS_MAILBOX_DATA_OFFSET    0u
> +#define SCB_MASK_WIDTH                 16u
> +
> +/* SCBCTRL service control register */
> +
> +#define SCB_CTRL_REQ (0)
> +#define SCB_CTRL_REQ_MASK BIT(SCB_CTRL_REQ)
> +
> +#define SCB_CTRL_BUSY (1)
> +#define SCB_CTRL_BUSY_MASK BIT(SCB_CTRL_BUSY)
> +
> +#define SCB_CTRL_ABORT (2)
> +#define SCB_CTRL_ABORT_MASK BIT(SCB_CTRL_ABORT)
> +
> +#define SCB_CTRL_NOTIFY (3)
> +#define SCB_CTRL_NOTIFY_MASK BIT(SCB_CTRL_NOTIFY)
> +
> +#define SCB_CTRL_POS (16)
> +#define SCB_CTRL_MASK GENMASK(SCB_CTRL_POS + SCB_MASK_WIDTH, SCB_CTRL_POS)
> +
> +/* SCBCTRL service status register */
> +
> +#define SCB_STATUS_REQ (0)
> +#define SCB_STATUS_REQ_MASK BIT(SCB_STATUS_REQ)
> +
> +#define SCB_STATUS_BUSY (1)
> +#define SCB_STATUS_BUSY_MASK BIT(SCB_STATUS_BUSY)
> +
> +#define SCB_STATUS_ABORT (2)
> +#define SCB_STATUS_ABORT_MASK BIT(SCB_STATUS_ABORT)
> +
> +#define SCB_STATUS_NOTIFY (3)
> +#define SCB_STATUS_NOTIFY_MASK BIT(SCB_STATUS_NOTIFY)
> +
> +#define SCB_STATUS_POS (16)
> +#define SCB_STATUS_MASK GENMASK(SCB_STATUS_POS + SCB_MASK_WIDTH, SCB_STATUS_POS)
> +
Please run checkpatch with strict option on the patchset.


> +
> +static int mpfs_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +       u32 mailbox_val = 0u;
> +       u16 options_select;
> +       u32 tx_trigger;
>
just a nit... here and elsewhere, can the variables be lesser verbose?


> +
> +static void mpfs_mbox_rx_data(struct mbox_chan *chan)
> +{
> +       struct mpfs_mbox *mbox = mbox_chan_to_mpfs_mbox(chan);
> +       u32 i;
> +       u16 num_words = ALIGN((mbox->response_size), (4)) / 4U; //TODO better way?
> +       struct mpfs_mss_response *response;
> +
> +       response = kmalloc(sizeof(*response), GFP_ATOMIC);
> +       response->response_size = mbox->response_size;
> +       response->response_msg = kcalloc(num_words, sizeof(response->response_msg), GFP_ATOMIC);
> +
> +       if (!response->response_msg) {
> +               dev_err(mbox->dev, "failed to assign memory for response %d\n", -ENOMEM);
> +               return;
> +       }
> +
response_size is provided by the client driver.
So why not simply get the buffer from the client and just fill it
here? That is simpler and better (avoid alloc in isr) and the right
thing to do.


> +
> +static int mpfs_mbox_probe(struct platform_device *pdev)
> +{
> +       struct mpfs_mbox *mbox;
> +       struct resource *regs;
> +       struct mbox_chan *chans;
> +       int ret;
> +
> +       mbox = devm_kzalloc(&pdev->dev, sizeof(*mbox), GFP_KERNEL);
> +       if (!mbox)
> +               return -ENOMEM;
> +
> +       chans = devm_kzalloc(&pdev->dev, sizeof(*chans), GFP_KERNEL);
>
You may simply embed the mbox_chan in mpfs_mbox.

cheers.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
