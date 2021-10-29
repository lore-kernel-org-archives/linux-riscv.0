Return-Path: <SRS0=3Oe1=PR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596E5C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 01:37:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C9DE60F9C
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 01:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C9DE60F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZCY9cV/7hGwjekIbOeo466CU2PPcUEYIK8k4ktnHr8=; b=T0Oj77ZWw3KJDH
	UCTWfNV4GJXod/oZxi77O71S5YiUrW9CVTjZi6Awm1KjbeKVBXu7XNFvQRt3ucMcu0wBQrcTTgt4Y
	0PVEKBNW5tg/IH0l86xZ0s3fyKBBkJ+WOSrQhwc4IEa8EV5kdLJUsbgkZlVorJ6tB6Al6Obgd/a/V
	Mi5MbcTJxa7xLkxpcqUPvvICvziycGgYKpcOmohYF+6v6xrf0QCVSyO0byBNNwGB6eSTYCVSGQhM3
	GiIp576o8xXlS13K6nnH08rmeE+91GJrmU29YaEiUSb2SElwX52zu2zuquZrIhgyvWhwGpNp7ia9g
	qRMp/fVzn7rzlhXL5tFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgGpj-009TP0-3r; Fri, 29 Oct 2021 01:37:27 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgGpg-009TOQ-BL
 for linux-riscv@lists.infradead.org; Fri, 29 Oct 2021 01:37:25 +0000
Received: by mail-oo1-f53.google.com with SMTP id
 q39-20020a4a962a000000b002b8bb100791so2832985ooi.0
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 18:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PfowumfndLK5nYVoy8RPc3ruj7Nut9GNjhXXbRm7A70=;
 b=TKjXV5AU4/k8cIbA5BmVQZa8cNl24ybSVnq8ARQx+hsYOIGu7uiOkxT7FyOJzKenzj
 8+Opew1U1B74DTTMjnCF5IAzBtbhcuSEEJWOUlbrGArro5Kny8V51NDCoFziVXsUFM6S
 zueDJv8uLAMAEoi9S20g/yIv490NvgaHLWnGWplhoxgyxnCvXZdZwv8bBFdzB/ImfIED
 J6puA3Tpxq50OO035amfaxqK5Mhw1SREePRGa2vjWq7sI1+7OVxXbnpaa8GB5Gat100h
 3sj+ygyzave/A3BKWeSnPjP1X9kCV59FiWVRE/t0iVUXK0E4Tg/WyOoDMNUNC/c2fXXN
 KD9g==
X-Gm-Message-State: AOAM533zDVDck68u9SjVb/4kEQccRlEgSmUPruapjecBNhmcgNtuT2kJ
 KNikboUfxI02Zyxb6aEkoQ==
X-Google-Smtp-Source: ABdhPJwR8ig3tEdXtBL0iU/K9fusKlCVqxfGknYDMYCLCEPUbQI9R7STXg9I9RLwbuwCl5zs7lDh8w==
X-Received: by 2002:a05:6820:13c:: with SMTP id
 i28mr5611166ood.65.1635471443147; 
 Thu, 28 Oct 2021 18:37:23 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id m13sm394486ooj.43.2021.10.28.18.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 18:37:22 -0700 (PDT)
Received: (nullmailer pid 967920 invoked by uid 1000);
 Fri, 29 Oct 2021 01:37:21 -0000
Date: Thu, 28 Oct 2021 20:37:21 -0500
From: Rob Herring <robh@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Zhu <michael.zhu@starfivetech.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Fu Wei <tekkamanninja@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-riscv@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>, Anup Patel <anup.patel@wdc.com>, 
 Drew Fustini <drew@beagleboard.org>, linux-clk@vger.kernel.org, 
 Matteo Croce <mcroce@microsoft.com>, Atish Patra <atish.patra@wdc.com>,
 linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-gpio@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Marc Zyngier <maz@kernel.org>, Sagar Kadam <sagar.kadam@sifive.com>,
 linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 03/16] dt-bindings: interrupt-controller: Add StarFive
 JH7100 plic
Message-ID: <YXtQUcQDCfd6Q1PT@robh.at.kernel.org>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-4-kernel@esmil.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021174223.43310-4-kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_183724_430842_5B545712 
X-CRM114-Status: UNSURE (   9.58  )
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

On Thu, 21 Oct 2021 19:42:10 +0200, Emil Renner Berthing wrote:
> Add compatible string for StarFive JH7100 plic.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
