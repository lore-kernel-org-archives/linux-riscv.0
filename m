Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434C6D1714E
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 01:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8isty1Uf99DO9tSAF+dKwAWwlYqah99ntH989TCZq8=; b=QflvgYDlJ9OaG1
	4FoqU3KEXJCai3dJgWJSY3oYK/Tg0vJIyUPJjfZSkhZYB+RwsqtcGJR3yIGb9RK810Bw/tVSiN9Jc
	Ldq5lHxHhqWsKK+uCTxR4Qv2b4mRPmjbE+g7XgB3erXDu7Mgd78+l65ssC7fripnrpjDNunOFTIog
	Ga/xn1T4rSqyni2GHVbI6ZHLHW35euTt+cxEbxmd4uNcdQEkRnj1H4SpzQpYT0JVoUQg6Mi+REQ5v
	aoEX4DW7eEYHh+wMusZnu+OKWTf89XwkUa8w84YRFQos04U6zLeXsIptNYTG5oYIA6TEy5X3zrQ3j
	HcHBvtfzF4wzgQEERgRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t33K9-00000009978-3nRI;
	Tue, 22 Oct 2024 01:04:37 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t32v2-000000095x0-3DGd
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 00:38:43 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so4160687b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 17:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729557520; x=1730162320; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=magtwdh/LfBPRMtVpw+N0PEp+2NPatDBY6KH3mR8XnA=;
        b=HRosCrY+tsllpNTkgNfVkNVwB062rC7neG7Lx4FxEJeIBxWZ0G3+PNEOpSp/VlL6p5
         SAImMlS0WJ7q/OCjrfZ0q4qjR3StwHDI6RHRBe6SVlJSrEoyXfWVJSYjDoByl2BBLt8K
         7/OaN5xTO/St5RJE02Ky8A/KpchMzrojuk69yGowPLWe2AweyMwcrNtTw4G6G1nFy/JT
         SHgFDAP8YezjGuabtHeXiymjJFBxyi/luh+70rxJIgAtUDBnm7NZp6GpC/l5dy18Nn62
         U28JWKGXKAzxeQp8FpijO/kriRE/KWZl76dm6oHiuXpv/p3IYO6lBbS/qGbBYnQGiGz7
         XBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729557520; x=1730162320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=magtwdh/LfBPRMtVpw+N0PEp+2NPatDBY6KH3mR8XnA=;
        b=Q+DI7KLY1DWPHWozt/WfJzV7ArW0ssmDYqPwkkvtnKDSnDsNsvvvCpFGNffc1agMKE
         bENFrZ3Pq3SA2KgfP2bWkuRboS8HVeGoMMdN4aNadjXkbhJV/d4xAN02upyrEu7dd72e
         78DwBStlZcPpztfq9rWla9ln4dN2XBMdFPBY9iUwokVeM8Wn1yosx2GOoOFeoeaUHlW8
         Mzj1XcAuU3dJ9SLsFD1IDjhFL/P8jxpa8aqhVnTX3oji4BvyLChetiMJAdi3IU5Lkj9P
         c78k1XAISE6iWQtS+8vL5zQcz55dygoIUWEiz4dCg5SnIxWHCV/Lif2EaslXgaqwGfy7
         Hjzg==
X-Forwarded-Encrypted: i=1; AJvYcCW7cEjzaLJ19hqQTI56E5yIHaJCl1ydcqroirk4BRzPRp1seW42wwJeXMQ5c8p0SjYuN9mlqfjat1YNUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNOQOywfDiZwQdk5513kkrFqSkzEMiOk3+m09+xzXMLnB25Ebi
	NzWgSLXJD7PwDP+lIBBM3SlBffQTHw4zl6Zq6/B3NklKcLOb89Yy
X-Google-Smtp-Source: AGHT+IHV8M9cBXnFbidcYyHefhv6RPjbtsN8XZLPfnMQLKyzNP9kmzIyA20Jtvdd6EaL6arRZgb+1w==
X-Received: by 2002:a05:6a00:270f:b0:71e:591d:cb4c with SMTP id d2e1a72fcca58-71edc132de9mr2016686b3a.1.1729557519596;
        Mon, 21 Oct 2024 17:38:39 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132ff7fsm3517619b3a.71.2024.10.21.17.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 17:38:39 -0700 (PDT)
Date: Tue, 22 Oct 2024 08:38:04 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@outlook.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v5 3/3] riscv: dts: sophgo: Add SARADC description for
 Sophgo CV1800B
Message-ID: <b2dtsxyae5d4pueaz2ar5pl5b3c2mjg75hvj7rljtxgfd5wxer@bkxe2uls4en4>
References: <20240829-sg2002-adc-v5-0-aacb381e869b@bootlin.com>
 <20240829-sg2002-adc-v5-3-aacb381e869b@bootlin.com>
 <IA1PR20MB495323339EFB06E194204904BB902@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB495323339EFB06E194204904BB902@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_173841_583868_8190F9C3 
X-CRM114-Status: GOOD (  18.65  )
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

On Sat, Aug 31, 2024 at 08:49:22PM +0800, Inochi Amaoto wrote:
> On Thu, Aug 29, 2024 at 02:31:52PM GMT, Thomas Bonnefille wrote:
> > Add SARADC node for the Successive Approximation Analog to
> > Digital Converter used in Sophgo CV1800B SoC.
> > This patch only adds the active domain controller.
> > 
> > Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > index 891932ae470f..da1ac59e976f 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> > @@ -133,6 +133,28 @@ portd: gpio-controller@0 {
> >  			};
> >  		};
> >  
> > +		saradc: adc@30f0000 {
> > +			compatible = "sophgo,cv1800b-saradc";
> > +			reg = <0x030f0000 0x1000>;
> > +			clocks = <&clk CLK_SARADC>;
> > +			interrupts = <100 IRQ_TYPE_LEVEL_HIGH>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			status = "disabled";
> > +
> 
> > +			channel@0 {
> > +				reg = <0>;
> > +			};
> > +
> > +			channel@1 {
> > +				reg = <1>;
> > +			};
> > +
> > +			channel@2 {
> > +				reg = <2>;
> > +			};
> 
> I think it may better to move channel definition to board file.
> 

It seems OK, let's drop my previous comment.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

> > +		};
> > +
> >  		i2c0: i2c@4000000 {
> >  			compatible = "snps,designware-i2c";
> >  			reg = <0x04000000 0x10000>;
> > 
> > -- 
> > 2.46.0
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
