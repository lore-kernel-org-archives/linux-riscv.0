Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2FFC433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 17:21:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4B5761222
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 17:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4B5761222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vedyql2P5bruJMChbzxgCKRSrNs3UgX+4wF0rQ//knQ=; b=Wp834+e1TH5nq8hnZivkSwpNE
	aP5JRP731RXVuDi/G5E1soiVCxBiJIB9FU5nCLpnvcdccnm9kHbeKaSRM3NOgIyv/ZjWJAIoO+UiG
	AxIpcsiygVI5vfU6uuwcmP9OnZgCEQj7nRcwJx8cs3ZPqUpV6o3zBT3F88cYSEnZ6kh5JQoM5SOkg
	rML/gudoWyJEvcmOwgaOK3xYOxxMwi5fsz0fi0JuzO7nlmdazDXapg0r6epEIefy46o+zn4guzh4G
	j9JdmA/kWmkZwImkI+0CcoQC+k5iA+G70wN9pG5We1zHxQ7LDQdmFmiZFWhkaRhaW4htH5TG4+W4D
	joCvZyKqA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lW0FO-007L7Z-MI; Mon, 12 Apr 2021 17:21:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW0FL-007L7L-2u
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 17:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Fk0FLPeMMiJckCaWO2h64AWj3iFF63ZHx4bCCRoxZF4=; b=2ZscnXMtAgcEiKQ7RRGEAmF4P3
 icvI9AXQVFxGeMFClGSobDSmPYb6DzffatrvVJEJlt/ZrKdTmx0r4hxWjc8z6wpxD8O9AspU72MBa
 7S22Q/k2/Jb4OnFBoaq4NeaPHdlLTHgN6SnuOrQoBYxDZRvhjuD51wsQcXsreWTqU2UEYkB6gM6Gu
 a9w6psq5LeuD4Vwq2I5xUjF1g+nqWq12HK/xOs+qm68tvHunRjbj0RKKVwHHdY6xZKNEJuDWW8tkK
 riGNs1Hw7Iv9FvwStdcoXfpfIA8heOuKn5jp/OCehNDz5vQEl2VvMkbP9pLbetrbtsCFXGjHqoHGz
 /b/GudUg==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW0FI-006Ruy-Ad
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 17:21:09 +0000
Received: by mail-pg1-x532.google.com with SMTP id p12so9920692pgj.10
 for <linux-riscv@lists.infradead.org>; Mon, 12 Apr 2021 10:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fk0FLPeMMiJckCaWO2h64AWj3iFF63ZHx4bCCRoxZF4=;
 b=EPvswoY7R5iinyT5EKxqT3IT0VZIIQ7kt8d2ZvWR5qcd7vaRbtzW0dMRIU9ekAFyIw
 z8rtUPoY3S41/eoU/2m3XhjSMTPIgmtje+gOxJ2ds/mApI5MzFUjChjE58STzFBeF10s
 BIC05lKEEwZlejHFVrw4plxHiKA87ZsoYsLf1dRWDb+p9uSgbpCAJZaC77cBqvsqbux2
 DKqmljZgau/99+StcUcgVkgysAT73SSgxXtj9uXyjwCqD4fUMKXiu4bDxojcQenypk3f
 LTPEajzZ1UdfRXAQnLZJ7LOQ1SqPiJheiKwEdwbUCYPDLyGrViz7Z0EXP6pdNqN09f/r
 FCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fk0FLPeMMiJckCaWO2h64AWj3iFF63ZHx4bCCRoxZF4=;
 b=h69gcyEPyjt8Jtp7yefrHMc5z9jup8keyo3hqJ74Z1hYtDXHpOQdyY3/RCuY1a+MH4
 lMztxQlK7mxcyP82Y6G7uFJANbhfSDqY04TsRpUhxguOvB2JLHPKu9DbbkqZ1+vVrgKe
 e8iIqt+qPx0Koq6kJnVTKYpHTXX5PlHqBSHxwNG4tTg4RD6Nl7zy9ARmhy3LbXDwK77K
 YgNI1Goxa8VIoa7taQTbtaAfGUYXJDcuRfnncT/2gEXcqR3OhvACYjaKrjh2SD5xkCuC
 eWdMBhCWIBFSdqDR+N3bYAtaurlSWIeLNmMzq7C5qii877/15DsTljDtMwAAykfTZIC3
 MZEw==
X-Gm-Message-State: AOAM533AUp3oHoys302Wyyiu6RxXnPp88zQZjr7XRmIcmdDEsk9dJyAa
 HG4oGAiEO1/2DshOx5ZG2LGFv8J2Vmnc5e6atPc=
X-Google-Smtp-Source: ABdhPJzTLGfVlP0G2W1PH3mllZ9zSk1h2aXi0coVJCWMJF2D492xgmOhoDNa3+R+Y+W7tyMKQZnIursqZyFOdArD22c=
X-Received: by 2002:aa7:9dcd:0:b029:246:6209:5c22 with SMTP id
 g13-20020aa79dcd0000b029024662095c22mr17786304pfq.62.1618248067446; Mon, 12
 Apr 2021 10:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210412160402.19394-1-conor.dooley@microchip.com>
In-Reply-To: <20210412160402.19394-1-conor.dooley@microchip.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 12 Apr 2021 12:20:56 -0500
Message-ID: <CABb+yY1D4Z_vCXMYqHMhisJFZ9F8RPzaKUnTPhkFW=o5BEWfNg@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] mbox: add polarfire soc system controller mailbox
To: conor.dooley@microchip.com
Cc: Rob Herring <robh+dt@kernel.org>, damien.lemoal@wdc.com,
 aou@eecs.berkeley.edu, 
 paul.walmsley@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>, 
 Devicetree List <devicetree@vger.kernel.org>, linux-riscv@lists.infradead.org, 
 j.neuschaefer@gmx.net, lewis.hanly@microchip.com, cyril.jean@microchip.com, 
 daire.mcnamara@microchip.com, atish.patra@wdc.com, anup.patel@wdc.com, 
 david.abdurachmanov@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_102108_393999_A775D714 
X-CRM114-Status: GOOD (  14.23  )
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

On Mon, Apr 12, 2021 at 11:04 AM <conor.dooley@microchip.com> wrote:

> diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c

> +
> +struct mpfs_mbox {
> +       struct mbox_controller controller;
> +       struct device *dev;
> +       int irq;
> +       void __iomem *mbox_base;
> +       void __iomem *int_reg;
> +      struct mbox_chan *chans;
>
As I said previously ....  struct mbox_chan chans[1]  ?


> +static bool mpfs_mbox_busy(struct mpfs_mbox *mbox)
> +{
> +       u32 status;
> +
> +       status = readl_relaxed(mbox->mbox_base + SERVICES_SR_OFFSET);
> +
> +       return status & SCB_STATUS_BUSY_MASK;
> +}
> +
> +static struct mpfs_mbox *mbox_chan_to_mpfs_mbox(struct mbox_chan *chan)
> +{
> +       if (!chan)
> +               return NULL;
> +
The return value is not always checked before use in the caller.
And I don't see how could 'chan' ever be null. So, maybe just discard
this function ?


> +       return (struct mpfs_mbox *)chan->con_priv;
> +}
> +
> +static int mpfs_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +       u32 val = 0u;
> +       u16 opt_sel;
> +       u32 tx_trigger;
> +       struct mpfs_mss_msg *msg = data;
> +       struct mpfs_mbox *mbox = mbox_chan_to_mpfs_mbox(chan);
> +
> +       mbox->response = msg->response;
> +       mbox->resp_offset = msg->resp_offset;
> +
> +       if (mpfs_mbox_busy(mbox))
> +               return -EBUSY;
> +
This check should be unnecessary because the api won't call
send_data() unless the last one is done.


> +static inline bool mpfs_mbox_pending(struct mpfs_mbox *mbox)
> +{
> +       u32 status;
> +
> +       status = readl_relaxed(mbox->mbox_base + SERVICES_SR_OFFSET);
> +
> +       return !(status & SCB_STATUS_BUSY_MASK);
> +}
> +
Isn't this  !mpfs_mbox_busy() ?


> +static void mpfs_mbox_rx_data(struct mbox_chan *chan)
> +{
> +       struct mpfs_mbox *mbox = mbox_chan_to_mpfs_mbox(chan);
> +       u32 i;
> +       u16 num_words = ALIGN((mbox->response->resp_size), (4)) / 4U;
> +       struct mpfs_mss_response *response = mbox->response;
> +
Usually the decs are in ascending or descending order. Please choose one.

> +
> +static int mpfs_mbox_startup(struct mbox_chan *chan)
> +{
> +       struct mpfs_mbox *mbox = mbox_chan_to_mpfs_mbox(chan);
> +       int ret = 0;
> +
> +       if (!mbox)
> +               return -EINVAL;
> +       ret = devm_request_irq(mbox->dev, mbox->irq, mpfs_mbox_inbox_isr, 0, "mpfs-mailbox", chan);
>
scripts/checkpatch should catch missing newline before  "ret =" ?

cheers.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
