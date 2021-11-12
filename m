Return-Path: <SRS0=QS6p=P7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3302C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 19:39:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7606360F45
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 19:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7606360F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8RGi3A5Mnc6Rx4T3lkWpygo4mf/t0UKLmIU4QxAlog=; b=WIVgunC50XNR93
	e4+i0xXvI2CMwkueHxcJ+72nGbKrJDks6g7HxiNV2dBKXBiDJAW56RseYbuD151o65mEPNqVr7y8v
	cK34jG4jPlDw53KX0x+sNlJG/GHHRKbg0DhDK8c33CgnogCZPvuV+/68wIy4/r4bVMaslyqivFdPw
	ZPE3NoGxl21PApl3hOMFdyJzC3/CptKR1sfElhSOeF59ypeEb0ICstwVUlBY6NTE2JS9Ke4M+kMD0
	tO6mYyeHxrBcXD52P3uHn5A69VzO1KWRJolO59vxkAkIpAxtjHuJELk6LJnAMdR11SPAePJvRYGMy
	ZWNGZPLQ0glFTRqjHcAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlcOZ-00BU6Z-8i; Fri, 12 Nov 2021 19:39:31 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlcOW-00BU6B-Fu
 for linux-riscv@lists.infradead.org; Fri, 12 Nov 2021 19:39:29 +0000
Received: by mail-oi1-f175.google.com with SMTP id 7so9660902oip.12
 for <linux-riscv@lists.infradead.org>; Fri, 12 Nov 2021 11:39:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HjdsaSpAmewvozo7q/CGdIoUTCTor2nmJMCGv/Gt4Yk=;
 b=6lm5bbiatMZXxwJn1R+nbENnULeiW3TgW2InxI0SLHCZIn/d1nMI6fLuHtyXYbzo5M
 xBq2Q+FJ+z6axEVHSbk4QMXMxtOysvSEK27jPusy1yvYWLX2QY+gdwMtXqNDCWcs+53s
 1NLpgFjmNThTEQVxcLpuBT046oiP3t4B35FGkxl3KOonLV+riQecKMRl7mgIn0yQ07Y+
 7lSjVtlnBfo+m2kuAqyyRnO3TSjNrxA5mrE0E162HaMb4yq5aDIhMJ22qobDaMLXJFzV
 ElZ+VM3LO4xFKF2+1cNDYXavg5iDrQez9OZbb5gAKiYCYhSxzbH6ExFaINIpJj1UsfC0
 Fziw==
X-Gm-Message-State: AOAM533ZN5+U4sX0CCUgZ/cQSAR8qvGTNTel1RxeIcqVs2OL+bkhfb6n
 sibWC39BCWiJxI4gDRtpCQ==
X-Google-Smtp-Source: ABdhPJzS4fugKbkP1CBDpp1RTVDCjfbOlPki/eQgoV/X4tVZGm+outEJC2MgziwERrcTwP0OXE6Dvg==
X-Received: by 2002:a05:6808:f01:: with SMTP id
 m1mr1962790oiw.166.1636745967654; 
 Fri, 12 Nov 2021 11:39:27 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t12sm1240395oor.21.2021.11.12.11.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 11:39:27 -0800 (PST)
Received: (nullmailer pid 3240277 invoked by uid 1000);
 Fri, 12 Nov 2021 19:39:25 -0000
Date: Fri, 12 Nov 2021 13:39:25 -0600
From: Rob Herring <robh@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-kernel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Marc Zyngier <maz@kernel.org>, 
 Matteo Croce <mcroce@microsoft.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, Atish Patra <atish.patra@wdc.com>, 
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Drew Fustini <drew@beagleboard.org>, Fu Wei <tekkamanninja@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
 Sagar Kadam <sagar.kadam@sifive.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Michael Zhu <michael.zhu@starfivetech.com>, Rob Herring <robh+dt@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
 linux-serial@vger.kernel.org, 
 Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, Maximilian Luz <luzmaximilian@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v3 08/16] dt-bindings: reset: Add Starfive JH7100 reset
 bindings
Message-ID: <YY7C7R/vER5FrtVg@robh.at.kernel.org>
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-9-kernel@esmil.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211102161125.1144023-9-kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_113928_556202_3B25DA6B 
X-CRM114-Status: GOOD (  10.53  )
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

On Tue, 02 Nov 2021 17:11:17 +0100, Emil Renner Berthing wrote:
> Add bindings for the reset controller on the JH7100 RISC-V SoC by
> StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  .../bindings/reset/starfive,jh7100-reset.yaml | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
