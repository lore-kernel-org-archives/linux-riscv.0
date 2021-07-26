Return-Path: <SRS0=HVPl=MS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2B7C4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 07:11:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B71C604DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 07:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B71C604DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MV2ktLYyTTHvxyV7puFDgUqP4xq4bf3jKZRRLyv6UM=; b=wLBVJQkyFRrxls
	prC4RQOOwuhhvbbMHD1CLh5tGADHD5vsr4OWgasX/sD4EN9Tpubdh/L1nyF1VuWvDIx5r8zljhB4P
	DxdcDFPAj6pTzuKnIAgQ+SLrx7dAU2gVWeThYLzrhwJs74oLpnOiX+m31zeJ0dfyTNS6W6Qr6Asps
	HSNX6/s835SiDwVkFwTFJF8H46bzSsodmXYTIg+nmF7n+9ciCnleBBSjZqiEjBCovSVaGCQDgdBeO
	Yn56yVETOU/7DyHnjgoij5uCn75r/luZ3cdQ6XVH5fpDCvkt666wJKccbDL6u9AzsJXOdwlZtlXkF
	TPoVOHlhxTah9biVxsjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7ulx-009qE4-N5; Mon, 26 Jul 2021 07:11:33 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7ult-009qDI-SR
 for linux-riscv@lists.infradead.org; Mon, 26 Jul 2021 07:11:31 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d1so3212931pll.1
 for <linux-riscv@lists.infradead.org>; Mon, 26 Jul 2021 00:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+5p8Aei7IrZs3alqaJKEyL3k4NRbSzzZGcPcbzf/ZKM=;
 b=nsFEEqxuhHH0w55xR+qWi6/8JTZFD+CjXaMMEmRxPwhw2+t/dxlIOoeHh6BpICM3mq
 gNT4qD6yRd/mY6jEACPu0YsvzhLNNFAflHc0uWnAC/j7XT9FAhDDBCx7p9j2vtIs0vCd
 y111+bounbY/WPKSDg7zqY0suEQPOzJntP/Vsa+De7Dkj5L32jI5icyEcWzyEnJAzCq7
 aA3xdsgUDt0CbErUbVFasdkp2E1dn6c8e9+j7u0uDTyc57FJVgyU+uLeZDcPrd8Ti2RV
 /XdKYIyowWMIT/h8pOCMmIrI//hpZnh5WqTho6WOgON21kM/nrs6WNASFxgJQAX9f9zF
 DaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+5p8Aei7IrZs3alqaJKEyL3k4NRbSzzZGcPcbzf/ZKM=;
 b=l1T1IfFlstGtImzZLLhPYCuLD7/+VV0oX5Z5D7YpSdU4lK3PySK2ONC4fdV4M69dt1
 V7ULchqUj62FnzAkt2U3WCx8v+FVF6PMKildfDGDPsWppDQjTjTpbtnCwRCk//lCCkjQ
 sBbbl/VHxVW/YkNJvLSUxUAUAp406UVPtbGblLFr7cFkh5GME+FfcD/zQKInR2sPLPVc
 pMHOubE4Q70MYWESc9VDmhOOHIs638RLBObzaqz8oV2+zMnWfmlUscxaCLaNzSxEYJQP
 j2lnAVIUAW67EJ4pXFAolZ7cndbwWlURHwNPGPkoevcH8Xhf/SeJAJSCvKpvayboUP29
 tLYg==
X-Gm-Message-State: AOAM533FVaovbeAEr18FEz90iCiyEhK00fZfV4DZfoMu/0lN2qv+ECiz
 nj55UMrBBIjtmqP7ugjKuqm3Ig==
X-Google-Smtp-Source: ABdhPJz/DGTo2HlVZORTFeTFS3UbYQ8fKSzvDp+CtRgvg+g+iWcVQ+dYYlu8pI/PRW+yWU/1lhgXHg==
X-Received: by 2002:a17:90a:6482:: with SMTP id
 h2mr24182383pjj.24.1627283486888; 
 Mon, 26 Jul 2021 00:11:26 -0700 (PDT)
Received: from x1 ([174.127.163.79])
 by smtp.gmail.com with ESMTPSA id o134sm43060098pfg.62.2021.07.26.00.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 00:11:26 -0700 (PDT)
Date: Mon, 26 Jul 2021 00:11:24 -0700
From: Drew Fustini <drew@beagleboard.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Walle <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Fu Wei <tekkamanninja@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
Message-ID: <20210726071124.GA9184@x1>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
 <8c59105d32a9936f8806501ecd20e044@walle.cc>
 <CACRpkdbhKsuXZiLCh_iajJQWDdQQOZ87QF3xDr5Vc66SoVCnxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdbhKsuXZiLCh_iajJQWDdQQOZ87QF3xDr5Vc66SoVCnxQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_001130_013273_CBB563D9 
X-CRM114-Status: GOOD (  18.85  )
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

On Fri, Jul 23, 2021 at 11:04:41PM +0200, Linus Walleij wrote:
> On Thu, Jul 1, 2021 at 8:39 AM Michael Walle <michael@walle.cc> wrote:
> > Am 2021-07-01 02:20, schrieb Drew Fustini:
> > > Add GPIO driver for the StarFive JH7100 SoC [1] used on the
> > > BeagleV Starlight JH7100 board [2].
> > >
> > > [1] https://github.com/starfive-tech/beaglev_doc/
> > > [2] https://github.com/beagleboard/beaglev-starlight
> > >
> > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> >
> > Could this driver use GPIO_REGMAP and REGMAP_IRQ? See
> > drivers/gpio/gpio-sl28cpld.c for an example.
> 
> To me it looks just memory-mapped?
> 
> Good old gpio-mmio.c (select GPIO_GENERIC) should
> suffice I think.
> 
> Drew please look at drivers/gpio/gpio-ftgpio010.c for an example
> of GPIO_GENERIC calling bgpio_init() in probe().

Thank you for the suggestion. However, I am not sure that will work for
this SoC.

The GPIO registers are described in section 12 of JH7100 datasheet [1]
and I don't think they fit the expectation of gpio-mmio.c because there
is a seperate register for each GPIO line for output data value and
output enable.

There are 64 output data config registers which are 4 bytes wide. There
are 64 output enable config registers which are 4 bytes wide too. Output
data and output enable registers for a given GPIO pad are contiguous.
GPIO0_DOUT_CFG is 0x50 and GPIO0_DOEN_CFG is 0x54 while GPIO1_DOUT_CFG
is 0x58 and GPIO1_DOEN_CFG is 0x5C. The stride between GPIO pads is
effectively 8, which yields the formula: GPIOn_DOUT_CFG is 0x50+8n.
Similarly, GPIO0_DOEN_CFG is 0x54 and thus GPIOn_DOEN_CFG is 0x54+8n.

However, GPIO input data does use just one bit for each line. GPIODIN_0
at 0x48 covers GPIO[31:0] and GPIODIN_1 at 0x4c covers GPIO[63:32].

Thus the input could work with gpio-mmio but I am not sure how to
reconcile the register-per-gpio for the output value and output enable.

Is there way a way to adapt gpio-mmio for this situation?

Thanks,
Drew

[1] https://github.com/starfive-tech/beaglev_doc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
