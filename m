Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36ED3C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 14:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9fm6hV4v4wGfD66xvWhLNZVtnHs6H6IRLR4WSfyoDA=; b=1Y0lrdUHQ66zup
	5iul9FvbWB7XZaygM3WAnLnOWFjcTfoxVO6a3M+WKgE7oGbor0tV9A1Ux/VJa8VFgxwSz7hqgRTl8
	XWycwqWBaDfsZRTex8WKkIwzy7lCKqwwiyWcBpH3Aq2whNKOKVj8mQcQBHjUOeVq9bTRO4qx7JEJp
	B3YkPlEyy13rdBp9L7Rx7xjB5PvcV5DWO8yu6wyPVOa3dTeUB7Zo3stzQtaduf6gWwLigMJAGroPi
	HhZ5qSbT+yrUqbKUJmj+Rg11lbgP26CpK5oXRc0Q1U/VWgQKNr58Xr7ImoO26XQVqwwJyYLCYzvvX
	zISVfEqoHiN1nD7N+gRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OEy-00GyXq-FO; Wed, 30 Nov 2022 14:39:12 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OEr-00GyJv-3S
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 14:39:09 +0000
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5421E3F330
	for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 14:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1669819127;
	bh=yJuPcYaDmRotD++RbdlV7xUD6m84JuqaQZoAA3YlHoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=D2w3JM+8UR1ozUGGWW2KivNRdIJa/2joK7WID1sV6kURIeG0T8ti9SVJRCzUtgTzm
	 o8k56MDqN/7AnEYDjA81VSvBkvwDhhrxpAmlaJDVlFSjMfL59Z9QGu5MZXI4LNpy/a
	 9wwxP+3YJ7aqMLE93KAIUoUJxdGWOs8nZZltr7TjJUfgcODTE9LoDPbuxT/+t4VN2e
	 uB1yWh6LLvlvsZDbfRB1W5ypwK+cxaCPRJ3ukrczMfEuPY4j7ODvZti249KE862ZMy
	 YI20i0ebkjV1asYScB2coT/SyVpL9iq/u4Yt0K2m+GrGETvalevrNXwSihEsdphWnW
	 RrHo97v6Zoqcg==
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-3d2994e2d7dso34794557b3.9
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 06:38:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJuPcYaDmRotD++RbdlV7xUD6m84JuqaQZoAA3YlHoQ=;
        b=QuKxhDQjihMEdmIDRWn4AkHcsxhRrFheQC2A2CkA6d1jM9m747msKTG2DzcVxPHk/P
         cZ0jilyddMZlG2s2dI+Q2cYYg5Az9RymRzHhwGKOCdyNP3AV7jUUCLf5bgndjdWKMl0j
         ylHjsOxKEkeDG50CKPom8DHXo2K8oSqDlyAB+LyLPV5PJBJSfV9F3KXw9rlvF63Eye/s
         BSmCCoAuFjWxUzUxCl2NK6U8DLa0dh6XhIr5dd7bkGc8wVv/x6OFAmDlKUVxRXUA/AA2
         CrNoNeXXyXtJW3u5k5VY2h0B8s6sZdK/E9VfsWsp0TfPc1fecSkU/IhpH1jsz0QcNYbP
         uASQ==
X-Gm-Message-State: ANoB5pmyRgFH/EmzgmfKqQ9oEwJ7YCcHeKxSbzljVbw/YwAHiZQM0vyU
	d/cPXBcKON43crLW4FrjVl/+KZ+DmGR8Ub4wMZ5wh2jhN1vXyUPw3bmCIAjeeWntWbP1pd1qKnN
	LYxwgPGCXqqgXBR3y6JBTz37wak5pU3BqYyfbDhDn+IxtfvMmkDolrGUil+lp2Q==
X-Received: by 2002:a25:d24b:0:b0:6f1:e822:14e8 with SMTP id j72-20020a25d24b000000b006f1e82214e8mr27924564ybg.467.1669819124623;
        Wed, 30 Nov 2022 06:38:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5h/y9Ufc7p86Pb9tYohSEhT0Ol5lHnhilFhXj6V/t+wLileZuNKNQC9L+9a86g1iFspQXp7Tl/67+u+EK8RTE=
X-Received: by 2002:a25:d24b:0:b0:6f1:e822:14e8 with SMTP id
 j72-20020a25d24b000000b006f1e82214e8mr27924544ybg.467.1669819124392; Wed, 30
 Nov 2022 06:38:44 -0800 (PST)
MIME-Version: 1.0
References: <20221118133216.17037-1-walker.chen@starfivetech.com>
 <20221118133216.17037-5-walker.chen@starfivetech.com> <CAJM55Z9bJqpEGbbx1=EBXhmhigxuHw=ObBdTJ7xy+QY=pTJyoQ@mail.gmail.com>
 <f794e9fb-7ce0-2649-9839-b9ce36b80d1d@starfivetech.com>
In-Reply-To: <f794e9fb-7ce0-2649-9839-b9ce36b80d1d@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 30 Nov 2022 15:38:27 +0100
Message-ID: <CAJM55Z8=eTY+i+ggLSiUEKwnPrKgOybKJP5sNFwRNpx_t35HUA@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] riscv: dts: starfive: add power controller node
To: Walker Chen <walker.chen@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_063905_599230_FD52F4E9 
X-CRM114-Status: GOOD (  22.81  )
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

On Wed, 23 Nov 2022 at 03:12, Walker Chen <walker.chen@starfivetech.com> wrote:
>
> On 2022/11/19 2:36, Emil Renner Berthing wrote:
> > On Fri, 18 Nov 2022 at 14:35, Walker Chen <walker.chen@starfivetech.com> wrote:
> >>
> >> This adds the power controller node for the Starfive JH7110 SoC.
> >> The pmu needs to be used by other modules such as ISP, VPU, etc.
> >>
> >> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> >
> > Hi Walker,
> >
> > You called the driver jh71xx which suggests it also applies to the
> > jh7100. Are you missing a node in the jh7100 device tree?
>
> No, there is no power domain controller on the jh7100. Our next generation of chips jh7120 will
> still use this power management unit, so here this driver name is called jh71xx_pmu.c or changed
> to jh71xx_power.c , do you think such a name is appropriate ?
> Your reply will be highly appreciated!

I see. In that case jh71xx seems appropriate, thanks.

> >
> >> ---
> >>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> >> index c22e8f1d2640..fa7b60b82d71 100644
> >> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> >> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> >> @@ -356,6 +356,13 @@
> >>                         #gpio-cells = <2>;
> >>                 };
> >>
> >> +               pwrc: power-controller@17030000 {
> >> +                       compatible = "starfive,jh7110-pmu";
> >> +                       reg = <0x0 0x17030000 0x0 0x10000>;
> >> +                       interrupts = <111>;
> >> +                       #power-domain-cells = <1>;
> >> +               };
> >> +
> >>                 uart0: serial@10000000 {
> >>                         compatible = "snps,dw-apb-uart";
> >>                         reg = <0x0 0x10000000 0x0 0x10000>;
> >> --
> >> 2.17.1
> >>
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
