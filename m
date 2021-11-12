Return-Path: <SRS0=QS6p=P7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33831C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 19:40:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F38DF60F45
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 19:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F38DF60F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qr79hqTbngDaTeBcLlGpYqzrqAOjf7e7mdNu/LqDG0=; b=0xVBCSUj5+6NRd
	cx6alatajcmBVkbNvrenkvvzmCEOtZ9jCH0wrj01vBuebargMID8XnTxyqu3+O59vg4/iRC4FViWR
	VX6MwbKmFdFd0FmzUaGQJtkAiyozmLwgvfnIDLs9AAax15SDF9iUlm8GZPAfHQGMKd3Jn529xZxo9
	tki1zPsbVyzK/DZ61/PdZqJ/H3VIauEOGK3wU1ft0rd0s0D+V9vlAPBAErjxs1LNdJAx6M/S8xJIh
	dL53LhNkBefup4XwvwcugkLy1qWp7dPk7q3ptaR7ZqFWxCVGhcxFmhu5LKQo5WNwhJxEpBh1z8d6H
	hwnWk0Dj68klaNlQMOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlcPU-00BUEw-1M; Fri, 12 Nov 2021 19:40:28 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlcPS-00BUEQ-33
 for linux-riscv@lists.infradead.org; Fri, 12 Nov 2021 19:40:27 +0000
Received: by mail-oi1-f178.google.com with SMTP id q124so19827603oig.3
 for <linux-riscv@lists.infradead.org>; Fri, 12 Nov 2021 11:40:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PHvtxKeuvizrVKUChLMEYf9ttqvWEszonrMmIlnzH2Y=;
 b=G4Rl5VkVFuuR1el2t38nfF1M3H7dMmT3bCGEm3aIsFf0wIyChrgRfv2HO3cTOlU2tO
 1Y50i99lUuApHi8sxb84k6x4g9NkIKVgwDf7iBUsw+fVeWloYyIfnPrptHua/HIor4U0
 Ir0wofxSJ0TQu0FmcRVSyhIqkPEYJP5DViAGYGsj2q0D5Berx++M8Um5lbcBy4nufw0q
 Wo40KrjaI1b2P9Pf0L8B28RRwn/QtukIvZBUWpUq10/l7epPYeEKh9lbmF4WJDCTrP26
 KDQTppi9Qhwmue76ZN1H5modrqAvHZBpQI5W/I4mYHmN290NwJDLvAoVxg0e33MFXVL2
 /50g==
X-Gm-Message-State: AOAM530V7cP3vTDWxzUZGMynEYPDfWXeXUcM1vu/m9eGyoP+dyX4KUmZ
 Obu29vho8pyJ9GjySMslDA==
X-Google-Smtp-Source: ABdhPJw0+YSksiYxgL3Bv+l4s6GecHQ17lz/teo2mb5Gzal8ZpdWy0P/wXLGm3MESOF9KB7+mjHEcA==
X-Received: by 2002:aca:bb45:: with SMTP id l66mr15340831oif.51.1636746025478; 
 Fri, 12 Nov 2021 11:40:25 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g26sm1431948ots.25.2021.11.12.11.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 11:40:24 -0800 (PST)
Received: (nullmailer pid 3241611 invoked by uid 1000);
 Fri, 12 Nov 2021 19:40:23 -0000
Date: Fri, 12 Nov 2021 13:40:23 -0600
From: Rob Herring <robh@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-serial@vger.kernel.org, 
 Anup Patel <anup.patel@wdc.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Atish Patra <atish.patra@wdc.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Marc Zyngier <maz@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Zhu <michael.zhu@starfivetech.com>, 
 Matteo Croce <mcroce@microsoft.com>, devicetree@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Sagar Kadam <sagar.kadam@sifive.com>, 
 Jiri Slaby <jirislaby@kernel.org>, Fu Wei <tekkamanninja@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Drew Fustini <drew@beagleboard.org>, linux-riscv@lists.infradead.org, 
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 10/16] dt-bindings: pinctrl: Add StarFive pinctrl
 definitions
Message-ID: <YY7DJ0awxzvBH6zm@robh.at.kernel.org>
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-11-kernel@esmil.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211102161125.1144023-11-kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_114026_150282_3EC1075B 
X-CRM114-Status: UNSURE (   9.59  )
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

On Tue, 02 Nov 2021 17:11:19 +0100, Emil Renner Berthing wrote:
> Add definitons for pins and GPIO input, output and output enable
> signals on the StarFive JH7100 SoC.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  .../dt-bindings/pinctrl/pinctrl-starfive.h    | 275 ++++++++++++++++++
>  1 file changed, 275 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-starfive.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
