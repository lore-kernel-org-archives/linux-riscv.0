Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1876AC55174
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 14:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aS3zNVPeeRULW1NgF/vDlvl8GPCBfObVxBjOM3ph9bA=; b=oo6l9KFaXQU2ak
	zZqau0BiuxlAQDAKciwJ4YKH2dtCG6Jtm5cVF4Lp5RC6dWo2bSA18qQ8jI9EN5xyffQAZiByWLGmJ
	yGSSCkL+XEDQn6AZiHiaU6SP3I3QpNvUeZfes1pByL7I3LzhBEX9Y9Z8vMFhtXjmGEz6I8nd4K74Q
	vtPH0rSIe1gAUGUA1k8Vy79qJVNdE2HoRDHY/pNttF8u2mgMh0BB+PA9ZtmXkTm6MgawrrNmpOO2b
	XGVJ4qh/mFvR7poPv/dshlchMTCE/FJwJogastuUpKiqMhe+LWTN2bVMCQCqguuN9fblaSERl33Gv
	37S8mNMu+V9Sd8cQu2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsi3I-00000009S5a-38Rx;
	Sat, 08 Aug 2026 14:29:32 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsi3F-00000009S4m-4AYT
	for linux-riscv@lists.infradead.org;
	Sat, 08 Aug 2026 14:29:31 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-c96739a46acso246391a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 08 Aug 2026 07:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786199369; x=1786804169; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7CZYGhkXjoLPOZDdCP+ZBeQkJbqW9Nm3A99Ju9rkXbI=;
        b=iFdfmy3Hv5a1iGrOwZ0N3sqqOZojeHaW+HI/OTgZQ8Y9IPeILYRm1njJmuxFgIsJVq
         rBEEXTzQosCPftHdPu89k9ZywHAOfjc/nDGy+gQbK2ZXgEyh6R7rO9pfGLoosRX4Oc2T
         ONxPu4Jg2WTbca42jEUwzByF1DQE98+N1fT8s8AbkPBUAnroTFz00jS81p20MTo1AHga
         Y79CkoC7gX1RyQipMctoa5CKeK0Ym0wxvG60zSmNXpSaHNhceM4EHak2Sn72POLZ8gq0
         gBvYHp4clm2F0KCFi+eMDPzky7Ixi2B+nQOs2xwlqpnMCqY0sAUmVW633OhinJyI68LS
         aNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786199369; x=1786804169;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CZYGhkXjoLPOZDdCP+ZBeQkJbqW9Nm3A99Ju9rkXbI=;
        b=pKFV90gJsg3/dSYxoZAQquSRPqFgyZME1I9VAWX2SI10ee+6V4IG7x5V4PLDYcdRyu
         IgKEIG9pmRW/n2KqyJICrOXcibbbFPUv/3maMaRkrfl/QVI7GpzwOcJSjmNK3xBC0pit
         ILBWVOhA2CfruL66LXeJktXiqYYdcPZQXAfRJDLU1UoqUq1nrwl7/8kKs+AGfleSB+R3
         CNsfjcibv8ceev65K/koKPe8H5ZHsufONPWjowWrnxRpPDia7mJUTnoCokx5W2F/4KDH
         ku/PnxW6pIidcnv7UpXHx+dxEYHp3dk6p9S2uTu5KJ7achk3ZPvqyn+9Oobx6iMKOdNS
         BIiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr727sAd1vBw/4uJBQuL27iahuWmlZegOAjIUb7Ge24IPHOt9Of+q0b9KZp1WirgUbgO6vo6d0xPsbPbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGfxsTadSNydpIUMl/2oBo295CBCYRNxzKxbRVGRE+3FK178C6
	twRQuUkU6zao7X3HuTTmZrPtAQ0A/bW0e0G3UtXTXZqalpsqKLsuXyvs
X-Gm-Gg: AR+sD132RgSR5pNey1G/5c34SwJGQcDTMdTdHPA8//lBK0r/d6FktmMyRPr6yrLUUGz
	NwF2hhKJK266t2QJr0yXN16c5rkCGBOBl9BnrvYse4NPuAi/4i6xW7i98M2PH3iL+MgJM7ZFtXC
	Vlt5ZJP3SlnAwhni77cB8EeuKdLVz6NyNlmjbLS5QALBxC8YYE2WZsPircm+r8H63t55KDJ9siv
	nvCZCH9+lPIoBMIgKn92Im7EyaSgKKnX2MgVJGDajEDgLgcLMdJAh0jF8qJl8T3wd09/s+BFiIZ
	+1rRO+BgYfsw++Mr/Syp75LTgXEJ8DKgY2BjPuF7GSyXdr6opkvODZYqa0UDn9zTU1J/LLnIIeo
	oYcZl3Y55MtPedtmZ5vqm4L/MKsgW4GwaLuVuXqOZaArGYHTukQRc3fKIWz2urP2fPeHtTaiLFN
	VFWXEoZt7fkphAF2QAUHC6HSiMwLNYsFz4MxJFWWU=
X-Received: by 2002:a05:6a00:278b:b0:848:7b92:8e74 with SMTP id d2e1a72fcca58-84f2e0dc994mr36524222b3a.39.1786199369200;
        Sat, 08 Aug 2026 07:29:29 -0700 (PDT)
Received: from localhost ([2403:2c80:17:1e::20db])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cad9dsm2140077b3a.23.2026.08.08.07.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 07:29:28 -0700 (PDT)
Date: Sat, 08 Aug 2026 22:29:25 +0800
Message-ID: <2b3c661bf7e1d437f81e4b7da13be25d.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 04/17] dt-bindings: soc: spacemit: allow eDP/DP PHY
 PLL pixel clocks on K3 APMU
In-Reply-To: <20260807230824.GA2220945-robh@kernel.org>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-4-6de34d80e86c@gmail.com>
 <20260807230824.GA2220945-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_072930_032701_DD9CA1F4 
X-CRM114-Status: GOOD (  16.90  )
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

Hi Rob,

On Fri, 07 Aug 2026 18:08:24 -0500, Rob Herring wrote:
> On Sat, Jul 25, 2026 at 12:51:13AM -0400, Cody Kang wrote:
> > The APMU's eDP pixel-clock muxes select the DP PHY PLLs as parents, so the
> > K3 syscon takes two clock inputs the other variants do not have.
> >
> > Gate them behind the K3 compatible instead of widening the shared clock
> > list, so a non-K3 syscon cannot silently accept clocks it has no mux for.
> >
> > Signed-off-by: Cody Kang <codykang.hk@gmail.com>
> > ---
> >  .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  | 30 +++++++++++++++++++++-
> >  1 file changed, 29 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> > index d3a7c93c3c54..b8fc6632a392 100644
> > --- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> > +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> > @@ -31,14 +31,18 @@ properties:
> >      maxItems: 1
> >
> >    clocks:
> > -    maxItems: 4
> > +    minItems: 4
> > +    maxItems: 6
> >
> >    clock-names:
> > +    minItems: 4
> >      items:
> >        - const: osc
> >        - const: vctcxo_1m
> >        - const: vctcxo_3m
> >        - const: vctcxo_24m
> > +      - const: edp0_pll_pxclk
> > +      - const: edp1_pll_pxclk
> >
> >    "#clock-cells":
> >      const: 1
> > @@ -95,6 +99,30 @@ allOf:
> >          - clocks
> >          - clock-names
> >          - "#clock-cells"
> > +  # Only the K3 APMU exposes the two eDP/DP PHY PLL pixel clocks as extra
> > +  # inputs (parents of its eDP pixel-clock muxes); every other variant has
> > +  # the four base oscillator inputs only.
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: spacemit,k3-syscon-apmu
> > +    then:
> > +      properties:
>
> > +        clocks:
> > +          minItems: 4
> > +          maxItems: 6
> > +        clock-names:
> > +          minItems: 4
> > +          maxItems: 6
> > +    else:
> > +      properties:
> > +        clocks:
> > +          minItems: 4
> > +          maxItems: 4
> > +        clock-names:
> > +          minItems: 4
> > +          maxItems: 4
>
> 4 is already the minimum, so it can be dropped on all of these.

Thanks for the review. Will drop them in v2.

Cody

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
