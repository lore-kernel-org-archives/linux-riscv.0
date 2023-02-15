Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DD6C636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 13:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lwOeQWeyXuBWYe20OxR6aFG3rID4/NCbYziLAjMbtxc=; b=YYdDUViBSEnkRe
	JSkSAjjrwL0zBzVVG2fUWs1BQuh/bUbX0nBqBDdGiHX32Cm04OJWxaMGVflKsx7vX66CpC+8M8LWt
	9/3b/CnT3zS5R0shyjpvfCptIuwKjInwNZPtiE99ZryT1jNBc11GYKBY2Pf/eJAxkEqwxznFBy+us
	ckhp4G29ZL7RqninS0rArir7fuK8CWqGNMKW551MO5lTSgXCZy+YHAkIi+Ye/8ZKuXmBCUdKJKYVd
	C+IzWed+8M8m4Mg/xFelsi1bru/Oaarv0EFePJMc1CsyponQoyUsBM+aNSKBQeqmschnKS9VBqj74
	d9X6QfSAlV6daoNKA4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHZk-005w5p-4S; Wed, 15 Feb 2023 13:11:56 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHZY-005w1k-Mf
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 13:11:46 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 473833F57F
	for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 13:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676466701;
	bh=1XdYb1DRbOmlAI6DRkBJIyrIK+/5tdCGTTdbxhb+wmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=mBoW16fVkEwXTxRnSNlMI4i0CwJNHPgXgs9XoZ3Gz52zAbyHNX7xo7E9/g3ZSCshY
	 JCVik0cxPmdu+1CpkzlBRYX1OVC/nToz3fwt7OVKVjnA8ZoEk1KDEpAy9ts+0R0kaR
	 N4HlRKOR/1xp5oCHzmnb3Hor+3nHAGPQK4tP5RRFqNBk+1htCtgdxOod4IvvjYl6F+
	 0AUeBBlYK6ICVh6V/VhYfXUk+YwAWUD7jhcknezEZI+p1VmzAi3xNpT1H/Sjp3ybtl
	 UEQ6aBxNVrUBny8sni+5C8hQXi17rCyRXqI2quJLe539sTK8mdAUnFzQhmiT9iPo/x
	 BqPTO+GEk3jDg==
Received: by mail-qt1-f199.google.com with SMTP id cr22-20020a05622a429600b003b694a9f291so11051802qtb.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 05:11:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1XdYb1DRbOmlAI6DRkBJIyrIK+/5tdCGTTdbxhb+wmw=;
        b=dCsFQiqrUN48JQ/6THGUHwHLb4HZBK8usdEG30bBdVN5sTI5fykvaNcMqHyiWtp+cw
         ikwzCgMOiXLdANj6KwePCFQ0mMu/S9L1c6zDB0hyCJoSKkRuqgwf4MhVb2fabjBqina4
         uwsiqczEBWnL29SS0KPml49GiuC4pDapuOvKKnSzb7voPzb7pmeGL9MUNq7Trfm2s3j+
         aZOTscnea9HGGxR7D80FchCaF07No2h6ozmXGdZ6nFm0KcRrl583u5rblSxLmTBLzATz
         Ifg5I4jaH32tqTitJfIZYowsngeR783HOSvtoCKEHgKpbRQLTPOqSbBlZLuGW+mSNjcc
         5SLw==
X-Gm-Message-State: AO0yUKWoGiaJkUQziBlJIXA5CFo4Z5WmYMRURv1dEQwyyUoYhhm4cmhM
	dbjWzyskggH21AdiNtMgj3yOBbiyHZXpTclor5J1nFPMznZMq7bN007NjyviCzouhzSPQAiP4fB
	gnQgDgy4/j0sTBbKSwv6wQH+7D1/38GykRhkci2HrO+C82nIbRz1p90r2/fI7/A==
X-Received: by 2002:a05:622a:164f:b0:3bc:e3a8:d1d6 with SMTP id y15-20020a05622a164f00b003bce3a8d1d6mr228741qtj.229.1676466699837;
        Wed, 15 Feb 2023 05:11:39 -0800 (PST)
X-Google-Smtp-Source: AK7set+4/1NxoBcvUdWQnW9B5yPBwHcyWHA8dOVvJArdaItgCToDNjAmHnj0L1BgI9mhCHcGqlTdul+lrgFnVADu40o=
X-Received: by 2002:a05:622a:164f:b0:3bc:e3a8:d1d6 with SMTP id
 y15-20020a05622a164f00b003bce3a8d1d6mr228728qtj.229.1676466699567; Wed, 15
 Feb 2023 05:11:39 -0800 (PST)
MIME-Version: 1.0
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-2-cristian.ciocaltea@collabora.com> <Y+vxw28NWPfaW7ql@spud>
In-Reply-To: <Y+vxw28NWPfaW7ql@spud>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 15 Feb 2023 14:11:22 +0100
Message-ID: <CAJM55Z_x3omY9DQtxPUgLX0NKEm3PCXDkFFDVAzG7opFLsZX+A@mail.gmail.com>
Subject: Re: [PATCH 01/12] dt-bindings: riscv: sifive-ccache: Add compatible
 for StarFive JH7100 SoC
To: Conor Dooley <conor@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>, 
	Yanhong Wang <yanhong.wang@starfivetech.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_051145_164590_93FC7407 
X-CRM114-Status: GOOD (  30.21  )
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

On Tue, 14 Feb 2023 at 21:42, Conor Dooley <conor@kernel.org> wrote:
>
> Hey all,
>
> On Sat, Feb 11, 2023 at 05:18:10AM +0200, Cristian Ciocaltea wrote:
> > Document the compatible for the SiFive Composable Cache Controller found
> > on the StarFive JH7100 SoC.
> >
> > This also requires extending the 'reg' property to handle distinct
> > ranges, as specified via 'reg-names'.
> >
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
> >  .../bindings/riscv/sifive,ccache0.yaml        | 28 ++++++++++++++++++-
> >  1 file changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> > index 31d20efaa6d3..2b864b2f12c9 100644
> > --- a/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml
> > @@ -25,6 +25,7 @@ select:
> >            - sifive,ccache0
> >            - sifive,fu540-c000-ccache
> >            - sifive,fu740-c000-ccache
> > +          - starfive,jh7100-ccache
> >
> >    required:
> >      - compatible
> > @@ -37,6 +38,7 @@ properties:
> >                - sifive,ccache0
> >                - sifive,fu540-c000-ccache
> >                - sifive,fu740-c000-ccache
> > +              - starfive,jh7100-ccache
> >            - const: cache
> >        - items:
> >            - const: starfive,jh7110-ccache
> > @@ -70,7 +72,13 @@ properties:
> >        - description: DirFail interrupt
> >
> >    reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  reg-names:
> > +    items:
> > +      - const: control
> > +      - const: sideband
>
> So why is this called "sideband"?
> In the docs for the JH7100 it is called LIM & it's called LIM in our
> docs for the PolarFire SoC (at the same address btw) and we run the HSS
> out of it! LIM being "loosely integrated memory", which by the limit
> hits on Google may be a SiFive-ism?
>
> I'm not really sure if adding it as a "reg" section is the right thing
> to do as it's not "just" a register bank.
> Perhaps Rob/Krzysztof have a take on that one?

Yes, this seems to be a leftover I didn't manage to clean up yet. The
"sideband" range is called L2 LIM in the datasheet and seems to be a
way to use the cache directly. The Sifive docs read "When cache ways
are disabled, they are addressable in the L2 Loosely-Integrated Memory
(L2 LIM) address space [..]". This feature is not used by Linux on the
JH7100, so can just be removed here.

/Emil

> >
> >    next-level-cache: true
> >
> > @@ -89,6 +97,7 @@ allOf:
> >            contains:
> >              enum:
> >                - sifive,fu740-c000-ccache
> > +              - starfive,jh7100-ccache
> >                - starfive,jh7110-ccache
> >                - microchip,mpfs-ccache
> >
> > @@ -106,12 +115,29 @@ allOf:
> >              Must contain entries for DirError, DataError and DataFail signals.
> >            maxItems: 3
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: starfive,jh7100-ccache
> > +
> > +    then:
> > +      properties:
> > +        reg:
> > +          maxItems: 2
> > +
> > +    else:
> > +      properties:
> > +        reg:
> > +          maxItems: 1
> > +
> >    - if:
> >        properties:
> >          compatible:
> >            contains:
> >              enum:
> >                - sifive,fu740-c000-ccache
> > +              - starfive,jh7100-ccache
> >                - starfive,jh7110-ccache
> >
> >      then:
> > --
> > 2.39.1
> >
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
