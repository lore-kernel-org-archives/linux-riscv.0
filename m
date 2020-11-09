Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2BBC2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 23:08:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54803206ED
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 23:08:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eR3PTesx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7Ruxrb4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54803206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2C6cPJMsWCdBd4RQMxOa0plxP2oQziEreSPBJTcwakY=; b=eR3PTesxPtVXZnBiLBWYCx1Mx
	8fEmjMubPrA544LcgVX4+X5xltv6BtOzV0OC3kFDDOZbKc8i8lJA5067UupX0k0jPyley2yzP2iwz
	KI46crXflXYSZLjFBJ7ZAsVRkxLPQ1fFUJCg6fR6CYtY0PNKxkBcWPeJDCKBcgK0q/C29EPxB6Ihr
	gob9Wy0ZRzyr87Vzu/qFk2K4qMPvEMdRFhef4ukCS9nu3QYl4X60UfXntrPVsfbyh0P0+fJzhn0ry
	uMhPSf5xSPBf1yiLOGjkP1rQoqAV+it9Qk8KYDtaxeI70AzPwTPjiWZHq8/TuIcOm9rMuShohD8ZU
	Emufhtvlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcGGf-0004By-4g; Mon, 09 Nov 2020 23:08:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcGGc-0004BN-Hk
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 23:08:07 +0000
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 638B82074F
 for <linux-riscv@lists.infradead.org>; Mon,  9 Nov 2020 23:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604963285;
 bh=TtA6XfDWGkO1ZpolVZxKGc7rOK5jKrZrF/7cl/97B3I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=M7Ruxrb4g9hCtLGGAaHn6aJyb0EILCuvhH1AjbFnKL4F3FG+OC/iSbY5xBclWesHl
 OOyS+qobcFAIyVuJnsbkCnhZRPidr4pO3ZIYxpNqKq/OMx/7rsYQv7YhDHxBkrmn0r
 FYYiSberE/DqiVodBOwh0bllkcoRO3O0RjZnBxqw=
Received: by mail-ot1-f51.google.com with SMTP id k3so10669863otp.12
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 15:08:05 -0800 (PST)
X-Gm-Message-State: AOAM530Fe0WuojuLlNNA0hq/oFrJIc+/s9hTOAvtMhfxsXG5tIMzx9FL
 +rpmxfclPYLCG972QfGLUCTGxYjfOB/2NnREig==
X-Google-Smtp-Source: ABdhPJyMSwvg+BHKJ896W4R1H5ymsArUEqZd5rnKA6qYg/lKQd4xN012ccSn4YoWRqazbSj9RXxPWb/J+Nic/bsRyJM=
X-Received: by 2002:a05:6830:2f8:: with SMTP id
 r24mr12017928ote.129.1604963284584; 
 Mon, 09 Nov 2020 15:08:04 -0800 (PST)
MIME-Version: 1.0
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-7-damien.lemoal@wdc.com>
 <20201109212158.y34otj3uy2hev75c@mobilestation>
 <BL0PR04MB6514111AE633C1E53B6F08A3E7EA0@BL0PR04MB6514.namprd04.prod.outlook.com>
 <20201109215524.GA1819368@bogus>
 <BL0PR04MB6514C9D94E2098EEA0A8462FE7EA0@BL0PR04MB6514.namprd04.prod.outlook.com>
In-Reply-To: <BL0PR04MB6514C9D94E2098EEA0A8462FE7EA0@BL0PR04MB6514.namprd04.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 9 Nov 2020 17:07:53 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL6GuY01Fye6U8QsGMzz+TuMiVJF9r0cGXCsNPPJzWXEw@mail.gmail.com>
Message-ID: <CAL_JsqL6GuY01Fye6U8QsGMzz+TuMiVJF9r0cGXCsNPPJzWXEw@mail.gmail.com>
Subject: Re: [PATCH 06/32] spi: dw: Add support for the Kendryte K210 SoC
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_180806_836577_A09B5907 
X-CRM114-Status: GOOD (  34.81  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Sean Anderson <seanga2@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 9, 2020 at 4:00 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>
> On 2020/11/10 6:55, Rob Herring wrote:
> > On Mon, Nov 09, 2020 at 09:39:19PM +0000, Damien Le Moal wrote:
> >> On 2020/11/10 6:22, Serge Semin wrote:
> >>> On Sat, Nov 07, 2020 at 05:13:54PM +0900, Damien Le Moal wrote:
> >>>> The DW SPI master of the Kendryte K210 RISC-V SoC uses the 32-bits
> >>>> ctrlr0 register format. This SoC is also quite slow and gets significant
> >>>> SD card performance improvements from using no-delay polled transfers.
> >>>> Add the dw_spi_k210_init() function tied to the
> >>>> "canaan,kendryte-k210-spi" compatible string to set the
> >>>> DW_SPI_CAP_DFS_32 and DW_SPI_CAP_POLL_NODELAY DW SPI capability fields
> >>>> for this SoC.
> >>>>
> >>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> >>>> ---
> >>>>  drivers/spi/spi-dw-mmio.c | 9 +++++++++
> >>>>  1 file changed, 9 insertions(+)
> >>>>
> >>>> diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
> >>>> index 3f1bc384cb45..a00def6c5b39 100644
> >>>> --- a/drivers/spi/spi-dw-mmio.c
> >>>> +++ b/drivers/spi/spi-dw-mmio.c
> >>>> @@ -223,6 +223,14 @@ static int dw_spi_keembay_init(struct platform_device *pdev,
> >>>>    return 0;
> >>>>  }
> >>>>
> >>>> +static int dw_spi_k210_init(struct platform_device *pdev,
> >>>> +                      struct dw_spi_mmio *dwsmmio)
> >>>> +{
> >>>> +  dwsmmio->dws.caps = DW_SPI_CAP_DFS_32 | DW_SPI_CAP_POLL_NODELAY;
> >>>> +
> >>>> +  return 0;
> >>>> +}
> >>>> +
> >>>>  static int dw_spi_mmio_probe(struct platform_device *pdev)
> >>>>  {
> >>>>    int (*init_func)(struct platform_device *pdev,
> >>>> @@ -340,6 +348,7 @@ static const struct of_device_id dw_spi_mmio_of_match[] = {
> >>>>    { .compatible = "snps,dwc-ssi-1.01a", .data = dw_spi_dwc_ssi_init},
> >>>>    { .compatible = "intel,keembay-ssi", .data = dw_spi_keembay_init},
> >>>>    { .compatible = "microchip,sparx5-spi", dw_spi_mscc_sparx5_init},
> >>>
> >>>> +  { .compatible = "canaan,kendryte-k210-spi", .data = dw_spi_k210_init},
> >>>
> >>> Other than the comments from Sean and Mark regarding the DFS_32
> >>> feature runtime detectability, I couldn't find a patch with adding the
> >>> new new compatible string into the DW APB SSI DT schema. Have I missed
> >>> it? If I haven't could you add one to the next version of the series?
> >>
> >> Yes, I will. I forgot to change the DW DT binding doc for this. I did add a
> >> patch for the "polling" property but forgot the compatible string.
> >>
> >> In any case, I think that this new compatible string change can be dropped by
> >> switching to automatically detecting the DFS32 and using a different solution
> >> than the polling property change I sent for the RX fifo overflow problem.
> >
> > No, new SoC needs new compatible string. Especially if a new vendor.
>
> My apologies for the bad wording: I meant to say the change to the list of
> compatible strings that the DW SPI support would not be needed. So from the DW
> SPI point of view, there would be no new compatible string to add/document.

No, there is a need for a new compatible string to add/document. You
might not need it in the driver if you have a fallback.

Compatible strings should be SoC specific so you can handle quirks
without a DT change. Otherwise, it's a never ending stream of new
properties and DT updates.

> >> I am still going through all the emails trying to understand what to try next to
> >> avoid the polling "hack".
> >
> > Use compatible.
>
> Yes, that is what this patch used. Again, I think there is a chance this change
> can be dropped.

Looks to me like it used a 'polling' property...

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
