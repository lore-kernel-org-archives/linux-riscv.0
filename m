Return-Path: <SRS0=3Oe1=PR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC82C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 01:42:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AADF6058D
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 01:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9AADF6058D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k985xY+9y/VbkMWbKFu8+UD7KnWlFSQTXyU+9VFAVmI=; b=P+xbtwtcSaoTvS
	gBMiRVR0LZYE6ydwL/evdDtMQ+z8rVFNh0Rk5/2wWDWOsgZhBv8Hguhqm8Osmj5XRCS/sLlYSWyk8
	NN1DC44ieuoSxOlFY8vtTJWgUbdtNNr0iWQYxOMyOuuvtaLkRB4x17VPsPo9s83z3xPGQKLnWy7EY
	z94/FhnIvMPvMMLU2N9ubUNLRAbjovFSbx0lHnQZiZSLLPqB9raoqz1MXEjmWv94WGa71siq9nuqz
	v7iDbMFqd1JYXTkVfT2aVVZcpN+H1kVTDbtJQJXkf+yiMD46oy/PuCKrCvBSGseq3zufQ2bW9qbyY
	myFtgxWcf4llSb3K3wAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgGuM-009TcD-Lw; Fri, 29 Oct 2021 01:42:14 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgGuK-009TbW-Bf
 for linux-riscv@lists.infradead.org; Fri, 29 Oct 2021 01:42:13 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 t17-20020a056830083100b00553ced10177so11184677ots.1
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 18:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nrE/dUDgkUJtxS/u+bs8gFYC9d/J20NTT3aMpOlOEZ8=;
 b=QJdIhJyt+m3XPAdQj0ipSWgMjWolJniNpwFBp00bZPtlIJ42QeVmnFukRpLi5r1k6U
 Fo1wRaOOhMckovRq8Gddc45yatCp1ASR+ZcKip3uCJhe4CKm6uSmYLoo1DornfzMMACR
 gvUyQcv/+oeK1VVyy8q5NCzJGEGreboEopRZuvpyjiEjD9aSJAgFBKgDp76MM2VhK6Zj
 znNsmpTIM4M8zuDLBoqhwGMocGx+ePIaSpaFfbUiaFBpLnIYxKocFk/yxeuGk//g7Czm
 m3s9qj74W0wSoI4eo3i4JXMI4lQgtJZ2WDBZgNvYDH8YdmA+I7pzFK42Tf4+M+sxZ/bH
 Iw4A==
X-Gm-Message-State: AOAM533LzX2mhRNfn+6SO7U6ChenOqcAmKrsC26EDcN/sDmQIdUNi2yX
 SERyqk89jUg9O3CTJWda5g==
X-Google-Smtp-Source: ABdhPJwhxRTJ62lm0VCWUDSLn2wEWjgb7K6GdVyMf1vs1f8WW0ePf95n2pwgVOoJL8B+QIKQjy1VhQ==
X-Received: by 2002:a9d:5b7:: with SMTP id 52mr6126664otd.173.1635471730501;
 Thu, 28 Oct 2021 18:42:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j12sm1455604ota.47.2021.10.28.18.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 18:42:09 -0700 (PDT)
Received: (nullmailer pid 975019 invoked by uid 1000);
 Fri, 29 Oct 2021 01:42:08 -0000
Date: Thu, 28 Oct 2021 20:42:08 -0500
From: Rob Herring <robh@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matteo Croce <mcroce@microsoft.com>, 
 Atish Patra <atish.patra@wdc.com>, Drew Fustini <drew@beagleboard.org>,
 linux-serial@vger.kernel.org, 
 Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, 
 Maximilian Luz <luzmaximilian@gmail.com>, Fu Wei <tekkamanninja@gmail.com>, 
 linux-clk@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, Marc Zyngier <maz@kernel.org>,
 linux-gpio@vger.kernel.org, 
 Michael Zhu <michael.zhu@starfivetech.com>, Rob Herring <robh+dt@kernel.org>, 
 linux-riscv@lists.infradead.org, Anup Patel <anup.patel@wdc.com>, 
 Jiri Slaby <jirislaby@kernel.org>, Sagar Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v2 04/16] dt-bindings: clock: starfive: Add JH7100 clock
 definitions
Message-ID: <YXtRcMITCkEmESRz@robh.at.kernel.org>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-5-kernel@esmil.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021174223.43310-5-kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_184212_425733_CD9D3710 
X-CRM114-Status: GOOD (  11.63  )
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

On Thu, 21 Oct 2021 19:42:11 +0200, Emil Renner Berthing wrote:
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Add all clock outputs for the StarFive JH7100 clock generator.
> 
> Based on work by Ahmad Fatoum for Barebox, with "JH7100_" prefixes added
> to all definitions.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  include/dt-bindings/clock/starfive-jh7100.h | 202 ++++++++++++++++++++
>  1 file changed, 202 insertions(+)
>  create mode 100644 include/dt-bindings/clock/starfive-jh7100.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
