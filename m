Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD484CDD1DC
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2024 20:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GavHwNRQcDX2rfF6DQRgSnDHu0NUV0qMpW1JhyQk/rA=; b=mvWBlx5dZAXi47
	U5NZ4iI+DV6W7fnMQmuVdKPDRxdhjgGeLuGpixcikZnC7aPGoeZBHjHfmk63t96t0rRUOFsVMwaG1
	pdbNwScMh49UtK+qCMuGxWgX0+rj6uBqr1BN1KF6Sjo0x3vQZoCOCWBsPiCEGcYcRwj3fCEdOlfUS
	92xralSr2m4P2c/rE1w8dDXlwmDDwn5AUT+/ZW+ZZNhY446nF4vEUyK+c6KofnS+6U4ygkLwuCA/z
	kFT5q5M164LdfDLL1Q8e/zJaazxXYKDeUqs6gA16bk/QvO8kQi2nN2lOpp+O4+PL4DxcmIsThL17w
	+BhZ3ZKccKOWkY8CtzsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suHvr-0000000C5nq-44tQ;
	Fri, 27 Sep 2024 20:51:19 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suHvo-0000000C5mc-22hn
	for linux-riscv@lists.infradead.org;
	Fri, 27 Sep 2024 20:51:18 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-656d8b346d2so1690353a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Sep 2024 13:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727470275; x=1728075075; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bRdgVrabZHhxovBskXyfa2tZhEPgLz1eNAdYEQ47v4A=;
        b=EDzUMJuTy0nCGBVwG86VFaHtSMR3W7iYlo09nQEgkYMyX0T/UyAM6NOzPjnWBMoY1O
         tLPKDzB69U8+vc1HQuBeoX3sKfMTq8rpjHzthwsNA4nTEPndJyjrZtgy9id3RBkZhx+T
         R2pan1HYTCE4I3wUZMzFbkS1nTp0HcAzXxXC2Eg/9FE/XrAHqKQPIJZc8SlSf49QCgja
         Ym6GD7VWpzaDjqcbXwRMjOpUpujP6NEaDgV1LjEUkAqlkMwDz/FobXJ25qJW291UGH3L
         6KSRx1zLRkGYHbv4yfYjXWPDKtuKg53QvavxPuSRZM2dks7dcguLMz4Nuqi7OkULEUhk
         a+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727470275; x=1728075075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRdgVrabZHhxovBskXyfa2tZhEPgLz1eNAdYEQ47v4A=;
        b=LKrQywxHrt0DMQg3dquPE2JMN+GpgPYpfKP+zynDK3LghHmu1oXuoZ2Th/TgIieGFn
         4WCfmNK29M40uylik3rOP2VOciwDHfcg1EmqI08peD6sFluce/QmVv6kdzjwLp/ui545
         vX2QRrWcahvpMGz3Ftg6du1kakcnDREnYoYZfdLU2JaBLOJJgHlGyi4L4ZLIVttX8gwM
         2Q0hUf42gdB5Yyn0uSslGMVIJW9l5y3P2vjJw4FqyXRyOUOzNlYKptiUSG4kqJP7V4Bu
         OA9g1uzM69XP21bpxrX4Wg6UUaaUsA+gyQqyjGhVcsxMmuo31p9q+y28Hd6aIuDKIxAG
         AdUw==
X-Forwarded-Encrypted: i=1; AJvYcCWDirYWfM0Wh7D6sMczTJhtVmulegjk5g1L5SoARxlAdbQn2HzoYRVTIgxp4SeKoaTbMI8NFISyu3wP6w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz85hX5/bmxyWbgrQNoc4hmYEcfUnQdEV4AvAV2da6TOmLvnLt
	VK3GvaqvEqdirnEIGa7Lb8oLxvFWDTYFR/ZJ4FEAvm7tIzCgd+r3fN1/rhSRycI=
X-Google-Smtp-Source: AGHT+IFG7leoR14jtfC3q5GGKEHjsTA70H4zEAbpBSmxJ/3keC3i6/61ObBCaup/qbxMFhZgbbqM5Q==
X-Received: by 2002:a17:90a:ec11:b0:2e0:6cd4:973a with SMTP id 98e67ed59e1d1-2e0b887184amr5335905a91.5.1727470275087;
        Fri, 27 Sep 2024 13:51:15 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0e4ca7019sm336000a91.18.2024.09.27.13.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 13:51:14 -0700 (PDT)
Date: Fri, 27 Sep 2024 13:51:12 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: net: Add T-HEAD dwmac support
Message-ID: <ZvcawOIcufEHXCHU@x1>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-1-f34f28ad1dc9@tenstorrent.com>
 <4pxpku3btckw7chyxlqw56entdb2s3gqeas4w3owbu5egmq3nf@5v76h4cczv4z>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4pxpku3btckw7chyxlqw56entdb2s3gqeas4w3owbu5egmq3nf@5v76h4cczv4z>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_135116_555548_FD3AD7FC 
X-CRM114-Status: GOOD (  29.05  )
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

On Fri, Sep 27, 2024 at 11:34:48AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Sep 26, 2024 at 11:15:50AM -0700, Drew Fustini wrote:
> > From: Jisheng Zhang <jszhang@kernel.org>
> > 
> > Add documentation to describe T-HEAD dwmac.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > [drew: change apb registers from syscon to second reg of gmac node]
> > [drew: rename compatible, add thead rx/tx internal delay properties]
> > Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
> >  .../devicetree/bindings/net/thead,th1520-gmac.yaml | 109 +++++++++++++++++++++
> >  MAINTAINERS                                        |   1 +
> >  3 files changed, 111 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 4e2ba1bf788c..474ade185033 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -99,6 +99,7 @@ properties:
> >          - snps,dwxgmac-2.10
> >          - starfive,jh7100-dwmac
> >          - starfive,jh7110-dwmac
> > +        - thead,th1520-gmac
> >  
> >    reg:
> >      minItems: 1
> > diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> > new file mode 100644
> > index 000000000000..1070e891c025
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> > @@ -0,0 +1,109 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/thead,th1520-gmac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: T-HEAD TH1520 GMAC Ethernet controller
> > +
> > +maintainers:
> > +  - Drew Fustini <dfustini@tenstorrent.com>
> > +
> > +description: |
> > +  The TH1520 GMAC is described in the TH1520 Peripheral Interface User Manual
> > +  https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
> > +
> > +  Features include
> > +    - Compliant with IEEE802.3 Specification
> > +    - IEEE 1588-2008 standard for precision networked clock synchronization
> > +    - Supports 10/100/1000Mbps data transfer rate
> > +    - Supports RGMII/MII interface
> > +    - Preamble and start of frame data (SFD) insertion in Transmit path
> > +    - Preamble and SFD deletion in the Receive path
> > +    - Automatic CRC and pad generation options for receive frames
> > +    - MDIO master interface for PHY device configuration and management
> > +
> > +  The GMAC Registers consists of two parts
> > +    - APB registers are used to configure clock frequency/clock enable/clock
> > +      direction/PHY interface type.
> > +    - AHB registers are use to configure GMAC core (DesignWare Core part).
> > +      GMAC core register consists of DMA registers and GMAC registers.
> > +
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - thead,th1520-gmac
> > +  required:
> > +    - compatible
> > +
> > +allOf:
> > +  - $ref: snps,dwmac.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - thead,th1520-gmac
> > +      - const: snps,dwmac-3.70a
> > +
> > +  reg:
> > +    items:
> > +      - description: DesignWare GMAC IP core registers
> > +      - description: GMAC APB registers
> > +
> > +  reg-names:
> > +    items:
> > +      - const: dwmac
> > +      - const: apb
> > +
> > +  thead,rx-internal-delay:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      RGMII receive clock delay. The value is used for the delay_ctrl
> > +      field in GMAC_RXCLK_DELAY_CTRL. Units are not specified.
> 
> What do you mean by "unspecified units"? They are always specified,
> hardware does not work randomly, e.g. once uses clock cycles, but next
> time you run it will use picoseconds.
> 
> You also miss default (property is not required) and some sort of constraints.

I should have stated that I don't know the units for delay_ctrl. The
5-bit field has a max value of 31 which seems far too small for
picoseconds. Unfortunately, the documentation from the SoC vendor does
not give anymore details about what the value represents.

Andrew Lunn replied [1] to my cover letter that it is best to hard code
the field to 0 (which is the hardware reset value) if I don't know what
the units are for delay_ctrl. The hardware that I have works okay with
delay_ctrl of 0, so it seems these new vendor properties are not needed.

Thanks,
Drew

[1] https://lore.kernel.org/lkml/5e379911-e3de-478c-b785-61dbcc9627b1@lunn.ch/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
