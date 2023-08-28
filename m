Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A99DC71153
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 15:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XkXqcrgpwBJEB/vI+vNl3EoUYMDBYpJcOTRrn1/Um9w=; b=YM2/RW1cM7a7SE
	3DggoSF0fAQMyTPnGyVW6lRDYK742LGbOdn8e8qGjnC9EQ5WfdeXgEgneCxcy1/K9FX0kI/nUfQEZ
	oh/jx9I3MsokddA9Aa80Q14JzIWDXpuw4S+/xn0u8lEswKB5vMY8UE9dOR8FC/tDJ47Grfa9piEHX
	o0g3Q1K8iNgOXfgfTV7V/Xg6XtoQ2DWOm92env2mIQeVx5scl8VoefJzuBok1UZdpgZI5N/Hoqh/s
	aSEEDxgLI5JnO/wTbUR1/qkU2FLqkEP+YcZQ7ujtGjIjwxeaLNFTPfGwOkf1Mdzvl0+HvydXYicic
	zUvRAlttVDtBkTS8jUww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaeX2-009pLN-0r;
	Mon, 28 Aug 2023 15:52:00 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaeWy-009pKr-1i;
	Mon, 28 Aug 2023 15:51:58 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50078eba7afso5337919e87.0;
        Mon, 28 Aug 2023 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693237913; x=1693842713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B0Xz3WZebS/wvt47ASnAX+cx3LpJDfQJgrj01eUj9Aw=;
        b=LoUmZsrBrhdLXul+MyKhiug6e+IU93kUVAYIV6wYrBXK55lDznI3Ard62QcL9bxgov
         Pp5EXI6ZXGUanY7sxJwdIfAnATolNLTpS2gvE7XgKzI+jFWwWwymjdOIrVT1a2hkra8X
         0lR51CLfxgVmEIordgak1XqkdGfl45oB+jmv7PmQgIZKqar847Ff+tjMmsF9cV/9BOsE
         NtsIHrC/ao+kmIIqTrd4OiNjHcSX79ldD89yERA2UMkNUhNoNtHs8HdRnjSS4stNu98t
         Lb2DVfoC7ZLJwdIkqVcEul9XdZLo2nXl+LzSgr9BV+i3cRMaQZtLidOWZ3hSFsaHTwDV
         +ZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693237913; x=1693842713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0Xz3WZebS/wvt47ASnAX+cx3LpJDfQJgrj01eUj9Aw=;
        b=EcHPhfnAnVsvw/CYc867aVj4nohaht68peiYGo3TY9gfQVf8RsFQZ4Nb36TZ1eebln
         vYvspka20nONUZskXgBBExMsCX2i7XEiPusuW2UNW+r2J8YxhJ4n41wtWq6+3t2HVBAc
         9ow0E2k2qFytoCGTV57CnlgnPzRCgI5SzPOkCxZEvc0OnPcmSpGAfvqq0eWy6WdoaO6+
         BabxYebUihTj778+ccGqDknC9uWZzJjDw+pmlpsU/Fvxvl49PcKMvsYNXd8b3uPd4Rm6
         YBrEiOaoSXz3LFK4i7b6cwGgkjoN/I6gvcZmZCpUBvLodBT6jvppiLpP7NmXFHbmSfem
         uaYA==
X-Gm-Message-State: AOJu0YzdCugoRe/nJox91Uy7VNBg4PYPh1eQiqIo3QP+Nbbu+IQObf4O
	iWJ17Y6+rnlD5MzUN3whTrM=
X-Google-Smtp-Source: AGHT+IGESVAn33u8cHgk2LFaFrWwav4zBU3fETTCbT3G6GJWd4vMRsBEFMW0OZS2hECrKF9bJ7YR0Q==
X-Received: by 2002:ac2:504c:0:b0:500:aa41:9d69 with SMTP id a12-20020ac2504c000000b00500aa419d69mr6179093lfm.66.1693237913366;
        Mon, 28 Aug 2023 08:51:53 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id a6-20020ac25206000000b004fb74dbbd98sm1639159lfl.246.2023.08.28.08.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 08:51:52 -0700 (PDT)
Date: Mon, 28 Aug 2023 18:51:49 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime@web.codeaurora.org, Coquelin@web.codeaurora.org, 
	Simon Horman <simon.horman@corigine.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH net-next v2 2/3] dt-bindings: net: add T-HEAD dwmac
 support
Message-ID: <pbh7gh7fkfis7zqqmmug5wtosq3xsx7z3ktsfg3jy6jthm6qva@a3wy7knv2vcr>
References: <20230827091710.1483-1-jszhang@kernel.org>
 <20230827091710.1483-3-jszhang@kernel.org>
 <qc2nyqmuouig6qww2q7orlwzvcprjyruyeuyr5dqdpxysajjpv@6fzsgjgokry7>
 <ZOy6kLGZ1lR0I2sC@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZOy6kLGZ1lR0I2sC@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_085156_571787_7CDF007E 
X-CRM114-Status: GOOD (  36.16  )
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

On Mon, Aug 28, 2023 at 11:17:36PM +0800, Jisheng Zhang wrote:
> On Mon, Aug 28, 2023 at 04:13:00PM +0300, Serge Semin wrote:
> > On Sun, Aug 27, 2023 at 05:17:09PM +0800, Jisheng Zhang wrote:
> > > Add documentation to describe T-HEAD dwmac.
> > > 
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
> > >  .../devicetree/bindings/net/thead,dwmac.yaml  | 77 +++++++++++++++++++
> > >  2 files changed, 78 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/net/thead,dwmac.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > index b196c5de2061..73821f86a609 100644
> > > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > > @@ -96,6 +96,7 @@ properties:
> > >          - snps,dwxgmac
> > >          - snps,dwxgmac-2.10
> > >          - starfive,jh7110-dwmac
> > > +        - thead,th1520-dwmac
> > >  
> > >    reg:
> > >      minItems: 1
> > > diff --git a/Documentation/devicetree/bindings/net/thead,dwmac.yaml b/Documentation/devicetree/bindings/net/thead,dwmac.yaml
> > > new file mode 100644
> > > index 000000000000..bf8ec8ca2753
> > > --- /dev/null
> > 
> > > +++ b/Documentation/devicetree/bindings/net/thead,dwmac.yaml
> > 
> > see further regarding using dwmac in the names here.
> > 
> > > @@ -0,0 +1,77 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > 
> > > +title: T-HEAD DWMAC Ethernet controller
> > 
> > Additionally would be nice to have a brief controller "description:"
> > having the next info: the SoCs the controllers can be found on, the DW
> > (G)MAC IP-core version the ethernet controller is based on and some
> > data about the synthesize parameters: SMA (MDIO-bus), Tx/Rx COE, DMA
> > FIFOs size, perfect and hash MAC-filters size, L3L4 frame filters
> > availability, VLAN hash filter, SA/VLAN-tag insertion, ARP offload
> > engine, PHY interfaces (MII, RMII, RGMII, etc), EEE support, IEEE
> > 1588(-2008) Timestamping support, PMT and Wake-up frame support, MAC
> > Management counters (MMC). In addition to that for DW QoS
> > ETH/XGMAC/XLGMAC the next info would be useful: number of MTL Queues
> > and DMA channels, MTL queues capabilities (QoS-related), TSO
> > availability, SPO availability.
> > 

> > Note DMA FIFO sizes can be also constrained in the properties
> > "rx-fifo-depth" and "tx-fifo-depth"; perfect and hash MAC-filter sizes -
> > in "snps,perfect-filter-entries" and "snps,multicast-filter-bins".

BTW plus to this you may wish to add the "rx-internal-delay-ps" and
"tx-internal-delay-ps" properties constraints seeing they device
supports internal Tx/Rx delays.

> 
> Hi Serge,
> 

> Thank you for your code review. I have different views here: If we
> only support the gmac controller in one specific SoC, these detailed
> information is nice to have, but what about if the driver/dt-binding
> supports the gmac controller in different SoCs? These detailed
> information will be outdated.

First they won't. Second then you can either add more info to the
description for instance in a separate paragraph or create a dedicated
DT-bindings. Such information would be very much useful for the
generic STMMAC driver code maintenance.

> 
> what's more, I think the purpose of dt-binding is different from
> the one of documentation.

The purpose of the DT-bindings is a hardware "description". The info I
listed describes your hardware.

> 
> So I prefer to put these GMAC IP related detailed information into
> the SoC's dtsi commit msg rather than polluting the dt-binding.
> > 
> > > +
> > > +maintainers:
> > > +  - Jisheng Zhang <jszhang@kernel.org>
> > > +
> > > +select:
> > > +  properties:
> > > +    compatible:
> > > +      contains:
> > > +        enum:
> > 
> > > +          - thead,th1520-dwmac
> > 
> > Referring to the DW IP-core in the compatible string isn't very
> > much useful especially seeing you have a generic fallback compatible.
> > Name like "thead,th1520-gmac" looks more informative indicating its
> > speed capability.
> 

> This is just to follow the common style as those dwmac-* does.
> I'm not sure which is better, but personally, I'd like to keep current
> common style.

It's not that common. Half the compatible strings use the notation
suggested by me and it has more sense then a dwmac suffix. It's ok to
use the suffix in the STMMAC driver-related things because the glue
code is supposed to work with the DW *MAC generic code. Using it in
the compatible string especially together with the generic fallback
compatible just useless.

-Serge(y)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
