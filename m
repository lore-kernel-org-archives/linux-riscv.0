Return-Path: <SRS0=MdyL=PH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA66C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 22:48:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AD15604DB
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 22:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AD15604DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K41KFuzFsWBjudWY55A4p0m0+IQU33pJWr2/oDxBRhk=; b=VxvA3l61f5zMty
	ohMLbu8qUsAlVRHrQUxBnncDwqhbww7F4l8ql4vsspxf4dtwnlH6RFKGHpeAt58d7BtnD6SEiW8oI
	ARtU0yy4G7DOA9B82tqQkr5tj7ZLYfg+W8aYgCQQbNw1mRKSvVfFBrSIxrSPpR8WNfHWtdhd9IPPt
	Z9CLm/BW2IiV2b9SqdX/kMN2KYK99UhM8zaCDSKuSRibfoUPgmUH1row8odV/DSXqPS8L1uJkYvTh
	chKQcso8d3jtwpj1uFSCZEB53Peg2a1Gx9Q1VE3o1N+vmbTLX8/BdDXxVGG45km4eoPTYLvoXBuPf
	cXafoARphKWbjjK0KorA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcxtx-002tUj-JN; Tue, 19 Oct 2021 22:48:09 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcxtu-002tTy-UV
 for linux-riscv@lists.infradead.org; Tue, 19 Oct 2021 22:48:08 +0000
Received: by mail-oo1-f41.google.com with SMTP id
 w9-20020a4adec9000000b002b696945457so1205867oou.10
 for <linux-riscv@lists.infradead.org>; Tue, 19 Oct 2021 15:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qy225hlqYwRXCtGLKyscMysC+wuepXd23D/7I3vqNfc=;
 b=VIug7sG8CKS9KBUm6OQ1UDZLfy1w13ks9xrO39pDR6JH4LqGjS6PxHqTb4tgrigvvE
 WobuxOe3GW76sTqJMuqHJlNkhJLC5A3TkUCbZA/RvSPRDkCHrwbBGC42p8mW/OdnSRYa
 EVai3pwAPjUmA7ppDrUinzzTVI1HvjiWkVGpbsE2iG+Amf7KL0RDCoLfCgcMMMHRGJOh
 sCGIaITcheV24ouvg5hhNVtkvKcQ2oK8BO+lNHP7rP27PiB2mFN6Xo9q/KWzvvR8+nKq
 lAG2lADDzfJbgBRgyDgxPuPgsUmmAc9sdbdgg7Gz6e/Ov7y8blrVy5Ye+J7X3a5wGcXL
 b4hw==
X-Gm-Message-State: AOAM533n4YVUAOcpMoA5hLVj+l2W/Pf7fYkknOt025vuDkjkJVTP6gWA
 3YJsgy4u20jsEgctrzgX0w==
X-Google-Smtp-Source: ABdhPJx+7M3+gwkvEccdiQLtE6ApfeIIiJPnK81zPl6XyOGFDwaQcsleOmnfmF9OVJFcsgizIss55Q==
X-Received: by 2002:a4a:ca0f:: with SMTP id w15mr6869426ooq.39.1634683685422; 
 Tue, 19 Oct 2021 15:48:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id n17sm82181oic.21.2021.10.19.15.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 15:48:04 -0700 (PDT)
Received: (nullmailer pid 968061 invoked by uid 1000);
 Tue, 19 Oct 2021 22:48:03 -0000
Date: Tue, 19 Oct 2021 17:48:03 -0500
From: Rob Herring <robh@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org,
 Sagar Kadam <sagar.kadam@sifive.com>, linux-gpio@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Drew Fustini <drew@beagleboard.org>,
 linux-kernel@vger.kernel.org, Matteo Croce <mcroce@microsoft.com>,
 Rob Herring <robh+dt@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 02/16] dt-bindings: timer: Add StarFive JH7100 clint
Message-ID: <YW9LI/scFZtyczt2@robh.at.kernel.org>
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-3-kernel@esmil.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211012134027.684712-3-kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_154807_009922_85C75F75 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

On Tue, 12 Oct 2021 15:40:13 +0200, Emil Renner Berthing wrote:
> Add compatible string for the StarFive JH7100 clint.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
