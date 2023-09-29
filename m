Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC88E743D0
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 00:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqM1GCaJ0J4YTwNC873t3GA4jmbjlX4A8vksxpd4kpA=; b=WPBaQknaEYtqGq
	MFbCpdIMrsgng8/ZuLH6/ZisUu9DjvMbkeiy6VXSMMVlQ71iqTRQxssy0TS1V2nEQkMTkNJlfW60B
	DJAcgocZN+pQAx+dxKuCR0al1q6kOXuhspYqP6QlEPJGIA5UGQeJ838beEvEmBssCHy9/iWgl+OtW
	VAtjBxzP6vm7AM1DCqHEEOOsTFrxW/48PEPF6AhRGq7DUl2699akrfpCJTioGBVif65KZ4E6R/EHC
	2wrWGrdPN8N92jYlBgk0YSY++pv5sk5U9pahN2E6T/G/EI11gSvaURmMyX/QH9HDzcFYcKkOLkUzd
	8SMQkCBzAVllT3BC1oCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm1PB-006vTP-0w;
	Fri, 29 Sep 2023 00:30:53 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm1P9-006vT0-0I
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 00:30:52 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-65afd8af8bbso61223486d6.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 17:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1695947447; x=1696552247; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=atEB7wjnfyIdR+cI94PXlHFbCfo6brMiQMFpy3s241U=;
        b=HCPG6lqGvUb0SaLQxGAPCZOrZDnJ3xC30HPExu1bdqvUpKLyLvPBFI7oIDi3gCG0/M
         EBrew69CzuUnbna/gD67WYod7GTWYyH/zuJp0QgIdFcDqWgBmv5PNZrK3smkXXNAX66/
         8HPSOTPq1AgxqSGediXmmYetirZoU4gO4F+uYJKG0VLpha1fDbwBFKjM7DG4xr/DSFXE
         YcKy4gd+NE2XNsoN8K7KmFBgXv8NmkcSqBB6VQtk1G0cjstm4xL7Ku71nesAeQOgQYHv
         2ftVI6hpQRG5D8pWC1n2K976H2e0R/gT8QJosfp/527joCZ5TNt8715OIx1CzrenMjku
         gbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695947447; x=1696552247;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=atEB7wjnfyIdR+cI94PXlHFbCfo6brMiQMFpy3s241U=;
        b=S78Jx/Hx4Mq025T+yGCoNvgHkVulgD+BwfD3Fz5WAgexSNJ+ebzE0Bb9x4AXN2wY8A
         vzoIfnDoEtLMbaRhPA9i9RKW2g/QlNh+Ed4JEsXgoP0ReSvC+yoZFUXvia3kYBCNf/Um
         JkWy74miUTD6LN8m/bOfw7OrUaWKxuO7/XuEktb6GHdMrgfQq+67UG244Q9gXMTBzIVN
         u3ksc6+mSJlI6CxYHMNcvYrIgnHlwQ/i/wRfXZOcgjaqxZ7EpmfWiJzlSDldiBgWWj8z
         mcalAYWBCpeh/UfNNxBtI7NuOd/s83kz0nXDWDCP7LbL9QdX8fCmwQH2q17XjGP/fMmP
         83Qg==
X-Gm-Message-State: AOJu0YwvJouE3K+EQdoX/IaUOrMVKRXDx+RX4xZ31S5ZHg5kjY3pVKwV
	pzNvKFyw4W+9DXajc87Qz4vuZg==
X-Google-Smtp-Source: AGHT+IEYm7+id3//cfxcIDRfW/DYDioXQBn/ZqKu09zqWg0PZQxdEAy8zuztSY5h7LmqGu3r0JstLg==
X-Received: by 2002:a0c:cb88:0:b0:65b:1468:8210 with SMTP id p8-20020a0ccb88000000b0065b14688210mr2774211qvk.23.1695947447439;
        Thu, 28 Sep 2023 17:30:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:5086:8bae:a4b0:bdad? ([2600:1700:2000:b002:5086:8bae:a4b0:bdad])
        by smtp.gmail.com with ESMTPSA id q5-20020a0cf5c5000000b0065d105f6931sm759933qvm.59.2023.09.28.17.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 17:30:47 -0700 (PDT)
Message-ID: <3d9eb660-e255-4477-a04b-6db8d249a20d@sifive.com>
Date: Thu, 28 Sep 2023 19:30:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] riscv: dts: renesas: rzfive-smarc: Drop dma
 properties from SSI1 node
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230929000704.53217-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20230929000704.53217-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_173051_169055_2A9766EA 
X-CRM114-Status: GOOD (  13.14  )
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

Hi Prabhakar,

On 2023-09-28 7:07 PM, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> With DMA enabled audio capture/playback has some echo noise. So for
> now switch to PIO mode until fixed.

Is it really appropriate to work around a Linux software bug with a DT change
like this? Remember, the devicetrees are used by software other than Linux.

Regards,
Samuel

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
> index a8573fdfd8b1..85f96e24a96e 100644
> --- a/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
> +++ b/arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi
> @@ -6,3 +6,8 @@
>   */
>  
>  #include <arm64/renesas/rzg2ul-smarc.dtsi>
> +
> +&ssi1 {
> +	/delete-property/ dmas;
> +	/delete-property/ dma-names;
> +};


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
