Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6975BC43334
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 19:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CrS0oF6QtBvCOD6F517X7OQdbilqzaWTycGzfC/t6Jw=; b=Wjydx6p8WEFwDc
	XvMvMqAoatKvjq1gc6PZLNXVH4QFojXtIr4TI0gDTziuBAyI0h8BuSbRMxYlfr2ABPfnVBTFLoCll
	92LZbaovHOhar6qiPbcPJsMYgK/mcDVksiRFdTkwde51Dj4iaDX88JNKSyWHHxLKENo6zDM1tlZC9
	mGsYKDd7QQWwmm084T+Fto4LF0KD51/hIFeIc755T0AsxT/3m2qEHUBQIXnS3Wr+sr07KofuyNpAQ
	TEsJ2Jlj5LIDOtSxhA3qXdAZT2IKprdGS6vAz82mOTB/fh6RH8IwoglcZJEnGlyvCNRUbhmZq4jbH
	q0xLgn/Ef4wLUyPTjf3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MgK-006hWd-Lv; Fri, 01 Jul 2022 19:52:00 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MgI-006hVo-IZ
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 19:51:59 +0000
Received: by mail-il1-f181.google.com with SMTP id h20so2012054ilj.13
        for <linux-riscv@lists.infradead.org>; Fri, 01 Jul 2022 12:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y2u7piwMP8WRoOkwcLwV3edsFIFKViwRNW8iJEcQlGY=;
        b=525uyt7rMHPROmsAmZ8vEFWiZj1qjqTbx++ehF0vGYVPsQIRApWNrsmiVm5Eh6CKdY
         XYm6QC+6BDBvbEh1w3DayYLXN4hHUguU5TkmRVKrQn4/IjQ798KfjP5nOYbY92OAijD4
         I4U6vHEsogb1U2BAJDxDJjfsidV8DI04rz71Yo3GFaMBQn0Obl/MKljJXBmnD9VFByRZ
         lUGgF20BkwPOiGk7CHnk87JhvF/L9WK8j+3dcbFL75dj9+LuhK7YaBYwVtqqjEP6cF9/
         oGJ9vG4/2MgDPHmNlrC6s0cMwKTIa4j7eOeKl6LLUg7uIxAhCveCAZogYl9TcyS1HyQH
         p/PQ==
X-Gm-Message-State: AJIora8WDvMS1M1xx1cvIuWN+v7L6MRvO+NkhjWv3CcHEAjh/sBfwKxF
	NPcavdPaMgzIkUsX41Q2hA==
X-Google-Smtp-Source: AGRyM1uCzukptXkjULJiVhiY7VNc7zMOwUSsnOp3OTAKsBWSKYNlI9cw6P3IxIahkJHGCw7J8sib6w==
X-Received: by 2002:a05:6e02:168f:b0:2da:72fc:feec with SMTP id f15-20020a056e02168f00b002da72fcfeecmr9308243ila.185.1656705115458;
        Fri, 01 Jul 2022 12:51:55 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id e2-20020a5d9242000000b006758cc4aa76sm3276380iol.29.2022.07.01.12.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 12:51:55 -0700 (PDT)
Received: (nullmailer pid 1407947 invoked by uid 1000);
	Fri, 01 Jul 2022 19:51:52 -0000
Date: Fri, 1 Jul 2022 13:51:52 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org, Daire McNamara <daire.mcnamara@microchip.com>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Eric Dumazet <edumazet@google.com>, linux-riscv@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>, "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org
Subject: Re: [PATCH v1 01/14] dt-bindings: clk: microchip: mpfs: add reset
 controller support
Message-ID: <20220701195152.GA1407913-robh@kernel.org>
References: <20220630080532.323731-1-conor.dooley@microchip.com>
 <20220630080532.323731-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220630080532.323731-2-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_125158_651568_234932A2 
X-CRM114-Status: GOOD (  10.82  )
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

On Thu, 30 Jun 2022 09:05:20 +0100, Conor Dooley wrote:
> The "peripheral" devices on PolarFire SoC can be put into reset, so
> update the device tree binding to reflect the presence of a reset
> controller.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/clock/microchip,mpfs.yaml          | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
