Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC54C7115D
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 06:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oE9vWH9pZan/Eqchxx/0ogW6tmwEQ1OH/zFILD9eEFY=; b=hF/fgveYw5kKUq
	QwbKHKtlDnoUhX1gtM+aC11Jkg5D9JasYeAU3jr/LwsB31a+oGBn4FROX9640VfBC5huIVmkfonPA
	jLsFWBc+kyWEWZ6JoZrTF2xZZYIpVPlKrrOoZ2N6fjVzfb5vXQxd0wcEZ74QzBOYRJkjLKlqmjTR8
	XD+cSstVgvbpchV2U7eeWRPt5M+rS/XKe9Pv5cm4vXs0mGWqkAG1qWxQ6DofIzfEZVQBVFQ4EIVUs
	IPdLHMaGS1rjtVivcoUl3Pn9c/4w+eFYlfn6cXMlnJUX2qYaIEmH1E1GEKosmQBbxqR0CekAX8wgp
	YQ5N4hWbvnpk6snmZeWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTb5u-00000001opW-2sv0;
	Mon, 23 Jun 2025 06:55:54 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTb0U-00000001o07-0Iin
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 06:50:19 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-235ea292956so39153685ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jun 2025 23:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750661417; x=1751266217; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6pa7zdu2J08RltO7Fc5iu0znoovQ/LLzNNFFw4lTRcE=;
        b=MtCb+tbn4BZM3jaR2AZdHyh2VKGsr9JWAInajpX5W7RYJyhsQjSvZ4FiobswgvdDPb
         jdrk5JKQqWiOb1oHf+jEaXas6LAoswpP/Xuze1D2Dx4/bhyfNIxsyWs5dvD98oVLcjlW
         cRMEnM4Cr0R9JiWzM0J47WXrD/K4LxV4qHQUJwiYuUHwgqRmx8xcTkWsSKhZdpMmypBW
         7dULFyx7vXBppdoxbtD2yMhijgNkDXG4LJYZifzyiqpXRsfTNBIE8beALdp4O+DtfEt4
         azQN3uV0qaE7B+SEcPcLDOxLMS/dDhtyEQA7C/k/6r/ONJLHNjPzDboWdsx9fB8aQkzC
         Pljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750661417; x=1751266217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pa7zdu2J08RltO7Fc5iu0znoovQ/LLzNNFFw4lTRcE=;
        b=iD74XpQhiqQWAIkzxAFkp6CieRXpExBorvy/LN6SyHh9deZAXZT8fMaJnNyww8Gguv
         1Y/mcnmBAoEi2HrejJye6LnjN6Lk/a2Pi9xnOsrIsHdO6VpYDZoV2VOznRYEOkgbv93d
         nhNShSzkzjhqhiFOqfMPO60wwlkz5/mSYCnH1gaL9OQUtYJ2znbLGDWjHD8tpd9QYnz/
         40SBasnOeqQC4g59lss9kR9edWnfKEWJTlDjAzdOsqY+4Ioa3surjCsVLR7fyFMwkUXa
         mNUjDdKLdnb7+J8vOqJqTgr7ZJUaxl0U/Otzsmi3tPTLA0n6qdsoDFO3dksyTDwNr/LZ
         6Jzg==
X-Forwarded-Encrypted: i=1; AJvYcCXOTQvm0MPu5fHsQ9TIsbi5CeIQ3hO9EfSVJTjvfhuF9cvHgTgbpNMKecv68rE4t2C7Lj5zQt1YkZA6+A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yznp8qORKrHDyv/rpR4RpHCB7mUqCUFcq8P52QqozLVZoHrj/tN
	RtvdSf/wT8DT00SRUgM/7bo2phovF27bgg/SKC5Hh/JJiuiTuwcmLe4H
X-Gm-Gg: ASbGncvb9X4VeOzk9jrQRRF8Pcx1d6Q7KXbVl5QFq5meTJ8/aAzK29CeJb8v2U4ynMS
	BNw3s/CeZm3iLtQwQFEZY4kNwz4poERq/31LqLXtjSOgH76eaP/HnhNLUOoZRNjq40X14qEE39y
	y07hs+sAY2JUXQCXihRsjkYSEmn0T0MGW0Wu/2eCQBfR44zcZe2vEizNN6KRlq7NCxOmeI0gDm9
	Z9plwnndkcr7UuZ3NU7ozJVklPA2N/v53mQVPOQbZ1S6qSIa7bOXBZxHO02hF90Dk1HJEYTQoFd
	6f+w+mIPcUSfXLADNNRtrGIgeiJQhtVkJ06pUirwZSdtN/LSu4R/cx5d9wQVQg==
X-Google-Smtp-Source: AGHT+IHpm5rL2B+2lf3y7D/IeDkqmgR4hxP+AbO8ivmJka/IKdtwO1eRP/D1h74sTcLcDtCuBLdozA==
X-Received: by 2002:a17:902:ce85:b0:234:aa98:7d41 with SMTP id d9443c01a7336-237d9ab0977mr168116245ad.42.1750661417171;
        Sun, 22 Jun 2025 23:50:17 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237f7f87676sm17710635ad.122.2025.06.22.23.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 23:50:16 -0700 (PDT)
Date: Mon, 23 Jun 2025 14:50:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Maud Spierings <maud_spierings@murena.io>, inochiama@gmail.com
Cc: alex@ghiti.fr, alexander.sverdlin@gmail.com, andrew+netdev@lunn.ch, 
	aou@eecs.berkeley.edu, conor+dt@kernel.org, conor.dooley@microchip.com, 
	davem@davemloft.net, devicetree@vger.kernel.org, dlan@gentoo.org, edumazet@google.com, 
	huangze@whut.edu.cn, krzk+dt@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, looong.bin@gmail.com, 
	netdev@vger.kernel.org, pabeni@redhat.com, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	richardcochran@gmail.com, robh@kernel.org, sophgo@lists.linux.dev, 
	thomas.bonnefille@bootlin.com, unicorn_wang@outlook.com, yu.yuan@sjtu.edu.cn
Subject: Re: [PATCH net-next RFC v2 1/4] dt-bindings: net: Add support for
 Sophgo CV1800 dwmac
Message-ID: <2rqpe3f54peuuslzu2mtbqt2ee7atoa6j6xiudxrway32vzmui@2apefxcrdhpi>
References: <20250623003049.574821-2-inochiama@gmail.com>
 <4cb09d05-d1f2-4d34-b3f7-be523b900a9e@murena.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4cb09d05-d1f2-4d34-b3f7-be523b900a9e@murena.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_235018_115512_77534475 
X-CRM114-Status: GOOD (  15.89  )
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

On Mon, Jun 23, 2025 at 08:40:35AM +0200, Maud Spierings wrote:
> Inochi sent:> The GMAC IP on CV1800 series SoC is a standard Synopsys
> > DesignWare MAC (version 3.70a).
> > 
> > Add necessary compatible string for this device.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 113 ++++++++++++++++++
> >  1 file changed, 113 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
> > new file mode 100644
> > index 000000000000..2821cca26487
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
> > @@ -0,0 +1,113 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/sophgo,cv1800b-dwmac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo SG2044 DWMAC glue layer
> 
> This looks like a copy paste error
> 
> kind regards,
> Maud
> 

Yeah, I will fix this in the next version.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
