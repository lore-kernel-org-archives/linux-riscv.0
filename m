Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190DEC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 00:59:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8ABD61284
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 00:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8ABD61284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oC1oN+1x9BjVGZ0QZ6kQcDQjkES/hdZ+Xglf19SDUBk=; b=yb7OW9SZoSEhqI
	5Utds0/I+uuJBW7Gdzl3mgrfGfjwyvmVmrK8cS3SnNSKHJDJTG/KYs+rRIYI/fCalo5RKOntwWCjm
	vsTuXNmRafJ2JaucWUBg5PwT6psBN4qyJFe4KKGey2PfKfjALrfRCqkEwoK0eUhWNn29C9z2nq3rN
	Qo62c3zLOdx5eTgnbwDEVElmohAfbsmV1romZZnVUWrhAWS9+L0s9NQ57K5kiUvOSKRecbDPYiwgY
	+3J2EPwNgZaT1qfMPMTyzYKvEnILoXTo0Dkgv36DjKg/BbaEY58i9hOPOFEHMxdWbDmVan16TQGmE
	qBvSf6voX1dKp2Jkkz0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkFUD-000A9r-RX; Tue, 09 Nov 2021 00:59:41 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkFH5-0006UW-P1
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 00:46:09 +0000
Received: by mail-ot1-x329.google.com with SMTP id
 z2-20020a9d71c2000000b0055c6a7d08b8so16150726otj.5
 for <linux-riscv@lists.infradead.org>; Mon, 08 Nov 2021 16:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bG3Y/BqnxEVlePdqiSugZ7Hd/V/NSxSTAbSGa+VvoRs=;
 b=M6szQqyTjFsganR9sNUTE9fnidl9uukXt7LqnK2czDeOY6OBN5fgOVflmA10HlXbqT
 lSXjpwutL+GQALNCuC1yLgmH/Tw4T4hOVVXH6wSaiVbh7ge7Uq04DuVUfZalIDcXFKc/
 FiSxguiMBIMljRGqkcw0wu2bdV1c5njLZhxFNcDf/bQBeEwcbCZKb+fS2xr+Ux+0IQ6/
 eKPVPOTG5dWftFTBl6lnooe3AvycKpiY0cRbyr8cM/sArSde0d779fPCKd8hd6RWvG6T
 aEsfRwwfb8ze7Lk/2Gfjkfn5+tm9deonu5TsIItVbE2PAQBRdIvCtpxQl0bN18se165b
 GQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bG3Y/BqnxEVlePdqiSugZ7Hd/V/NSxSTAbSGa+VvoRs=;
 b=0qEBINrHsKfllpYdtNoEvIpBDZPl+TMHx7TOWXEKK3TwmRT08bHMLLNOruKgIRVEjo
 kUXQf+yMqoVheM5AQWo2ISFCXbr42as2h3iYOwXXH268mX+7CJzBdJbyhA+x98ZWb5Po
 i4QpLWvPCLYRiRcyCpI6ho0Yy4h4q8yvhq7Yq6bbHTBl5O65qJ49pFbThyuRgL7bddpm
 uUOTbwT/j3rQpnrPyPbCDinYo8eprJsf4iQPSV/izfiQcwWm9UWqXtz9Niah96rG4EbP
 cnlbvyFaej99OxTnY1D4etuqiK5KMOVHmOuDWTz0kHisY3Xmwe7sah50QioWM5S+O597
 FXLw==
X-Gm-Message-State: AOAM532s61c/+OTizNk2/q8y0F1eQVLlU08RP3EdAch8Nv+lxtVoLAGa
 awY5M7afwNJndWofHhLU+3uokiFVfwxNPx64ZF9C9w==
X-Google-Smtp-Source: ABdhPJyys3qfTJGPVjeVT/HCn3VkOqbY3GVCdzVh24eOXr7uLVD857f62jht8jhypUUWDkrPmq/NlW044n5qV03SLYA=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr2580722otj.35.1636418766697;
 Mon, 08 Nov 2021 16:46:06 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-12-kernel@esmil.dk>
In-Reply-To: <20211102161125.1144023-12-kernel@esmil.dk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Nov 2021 01:45:55 +0100
Message-ID: <CACRpkdb0CrJ_uTbtfg-xGq8uu0AKoqfAB03mF2CA_G8ys_8Lzg@mail.gmail.com>
Subject: Re: [PATCH v3 11/16] dt-bindings: pinctrl: Add StarFive JH7100
 bindings
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-serial@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_164607_857275_50587814 
X-CRM114-Status: GOOD (  13.46  )
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

On Tue, Nov 2, 2021 at 5:12 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

> Add bindings for the GPIO/pin controller on the JH7100 RISC-V SoC by
> StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>
> @Linus: I'm really struggling to find a good way to describe how pin
> muxing works on the JH7100. As you can see I've now resorted to
> ascii-art to try to explain it, but please let me know if it's still
> unclear.

This looks perfectly acceptable to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

As it appears to have some cross dependencies I assume
it will be merged through the SoC tree?

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
