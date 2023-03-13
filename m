Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A4AC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Mar 2023 08:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQ4+XaRyvgJZFGFwNJ2B/DGZUlNSvsaYKWIGRxC6WVU=; b=Y+RJrcZNHgX17W
	laKvTs0lOU8Y+MZFJtLyQEXgz66X5IKmUC6MUF+dt9mksmRK7+8lnWGaguZv7RsiciQuaKXkae7MX
	XgcI1o31Thygu6sk6I4CnXN84qNo+WnIPZTJBbh39y8G54aCBDfE1ebWcvrNuBYAMNM/ikFAxZzZP
	7MQ9QMV/Qy6y3bMQpowuiSrbANiBFz/kuVI+Psy7KFoG4jCYtNczfQt6WA52+XyBRVMH/44ZoXseN
	KBXIDEloW9Z/LaOF+gi2bX24pZvMUe6BxW4OQ/GFHdKuNxXwkpbVRMZqGUKufTHYxDUx2ENHt/znW
	3DZapl+HqN54lbu73EpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbdvu-004riZ-Az; Mon, 13 Mar 2023 08:53:30 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbdvq-004rg9-62
	for linux-riscv@lists.infradead.org; Mon, 13 Mar 2023 08:53:28 +0000
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7E92B40797
	for <linux-riscv@lists.infradead.org>; Mon, 13 Mar 2023 08:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678697599;
	bh=rdDSrE0VIq+XmHMRyMrdPIQatR30pRaMUhYB/xPPqz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=dRUkVaI76q9CPTpgxlSgLIfN4e3vgNOB02uAdgPMCpwRnqavAYzp25GQl+WpX1rS0
	 Sw1bRRtLl5SXKuVE27+UYAG8Cw1+tbsNWy49t29TwQvYGVeAcXEoAZtMHaAN0mrNhx
	 yhGNLbyc5+w2Q83MfACT8R3zb0ymOk9olWtDQv2qde79eRTjn1sqWl5BQahmvjD3L8
	 OnK+9NlqOBIRqGVYVoYgQjBrrcn2elM4Ol4x8QgOBsXMujTC5k3zgAiLjOKhUp7TQ/
	 To5mgY6XVkqUg/Uom4YGKXYHACx8L0z6NaIonii6dQEopthGcXLkU+lct6q0nR5W6p
	 0EgQ/1CYptxsw==
Received: by mail-qv1-f71.google.com with SMTP id d27-20020a0caa1b000000b00572765a687cso6657048qvb.19
        for <linux-riscv@lists.infradead.org>; Mon, 13 Mar 2023 01:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678697598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rdDSrE0VIq+XmHMRyMrdPIQatR30pRaMUhYB/xPPqz8=;
        b=RB/wXTzL9bpA3/TLpB2CAf6M84sxJJ8GGX7uXZUYifI2ZyqjzG+uvLkXoaArHwZeed
         eBrsSOYr4p6SxKeu1GQFRs5dtJhJaMsJ4F/ubRaE0WxV3gLh47HLUUAlumst/ceTY26+
         Oa1qQ85Pqgig/JaFDGckeLPjrm0bI7pTGFUUM9odGPN8tunWGwQXgTkfAZM35+Pfpxyw
         Hec5T14FvFqBuSD2UtcWWwWsuysoFA2pLAWo4HHJ8zQix1hJBJn0YIQLHQS+nXi078PX
         6r00KJmOH+093SD9z11f/VU6buPnWpH9MRksYwwZqymJlxWBegkfB2u7iI8db7gas/EQ
         EhWA==
X-Gm-Message-State: AO0yUKVGuL5A97Kj3w1vW+IcFmIsFpkpqKqgHURvpuxeiu5K35xjvHTd
	/C6y7Hn0EQFqnfJCOE8eVBVgzIIk9csxmxcHvZdQT7vDXbX061VI/f/YL2n+TCSKxey5CqqLnfc
	woPA58oAs+HvRKum1Sz7HvqI91Dloer1fUTohc/29VnZcKcVN1w++hzedawMn7g==
X-Received: by 2002:ac8:56f7:0:b0:3bf:b9a4:6d41 with SMTP id 23-20020ac856f7000000b003bfb9a46d41mr9407550qtu.5.1678697598334;
        Mon, 13 Mar 2023 01:53:18 -0700 (PDT)
X-Google-Smtp-Source: AK7set8AA0sa2nCnrV8w1Osh5NxDD45ICECbteHeANn3sQWk04rh+36JVMJfWLEQ4krvOlUN6FZfm4pVyPz1TdTFshg=
X-Received: by 2002:ac8:56f7:0:b0:3bf:b9a4:6d41 with SMTP id
 23-20020ac856f7000000b003bfb9a46d41mr9407529qtu.5.1678697597999; Mon, 13 Mar
 2023 01:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
 <20230311090733.56918-12-hal.feng@starfivetech.com> <34b0473a-91bd-453b-91dd-01defde92d68@spud>
 <92306b73-d7d2-0d60-de15-87bcd71714ed@starfivetech.com>
In-Reply-To: <92306b73-d7d2-0d60-de15-87bcd71714ed@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 13 Mar 2023 09:53:01 +0100
Message-ID: <CAJM55Z-zps4gEohCGyia0nESWYWqQmoChnJZXkw2Zmi5TPV2Wg@mail.gmail.com>
Subject: Re: [PATCH v5 11/21] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_015326_585428_419AC1F1 
X-CRM114-Status: GOOD (  17.20  )
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

On Mon, 13 Mar 2023 at 04:22, Hal Feng <hal.feng@starfivetech.com> wrote:
> On Sat, 11 Mar 2023 13:11:38 +0000, Conor Dooley wrote:
> > On Sat, Mar 11, 2023 at 05:07:23PM +0800, Hal Feng wrote:
> >> From: Emil Renner Berthing <kernel@esmil.dk>
> >>
> >> Add bindings for the system clock and reset generator (SYSCRG) on the
> >> JH7110 RISC-V SoC by StarFive Ltd.
> >>
> >> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> >> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> >> ---
> >>  .../clock/starfive,jh7110-syscrg.yaml         | 104 +++++++++
> >>  MAINTAINERS                                   |   8 +-
> >>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 203 ++++++++++++++++++
> >>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 142 ++++++++++++
> >>  4 files changed, 454 insertions(+), 3 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> >>  create mode 100644 include/dt-bindings/clock/starfive,jh7110-crg.h
> >>  create mode 100644 include/dt-bindings/reset/starfive,jh7110-crg.h
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> >> new file mode 100644
> >> index 000000000000..84373ae31644
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> >
> >> +  clock-names:
> >> +    oneOf:
> >> +      - items:
> >> +          - const: osc
> >> +          - enum:
> >> +              - gmac1_rmii_refin
> >> +              - gmac1_rgmii_rxin
> >> +          - const: i2stx_bclk_ext
> >> +          - const: i2stx_lrck_ext
> >> +          - const: i2srx_bclk_ext
> >> +          - const: i2srx_lrck_ext
> >> +          - const: tdm_ext
> >> +          - const: mclk_ext
> >> +
> >> +      - items:
> >> +          - const: osc
> >> +          - const: gmac1_rmii_refin
> >> +          - const: gmac1_rgmii_rxin
> >> +          - const: i2stx_bclk_ext
> >> +          - const: i2stx_lrck_ext
> >> +          - const: i2srx_bclk_ext
> >> +          - const: i2srx_lrck_ext
> >> +          - const: tdm_ext
> >> +          - const: mclk_ext
> >
> > Assuming nothing else here is optional,
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> Yeah, nothing else here is optional. Thanks for your review.

Wait, what kind of optional are we talking about here? Surely all the
i2s and tdm external clocks are optional in the sense that you don't
need them on a board that never does any audio processing.

/Emil

>
> Best regards,
> Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
