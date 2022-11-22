Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E525AC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 10:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hafNTveii9LkzYvlTPdjD+rBXBQ8cON76GL7e5u/1u8=; b=BtH48O9w9RQ+Y+
	btpgdRw7WqXPaYwLozMGrdN82dDtfrWkX82Sldtwjcvm4YqLQYBm7mzWkluCcXjDQrsoaVnhJqibv
	78mGUozlwfB6al6hn+bQYl5hMlY1T9IymfxeWOYMBUf31gMWnrFYR3Q1EGmwsEQ8l+s1jfoSVJb3u
	EX8axxj0ePCDYy5aSUpKSkG5oLpAyIoLJ43KrcXGVlvOg2SJPqMtK7pGruuJi69PLRvnznOGDX0Kg
	K/ZxgDCVj5oM3N8oJpfDXNXqpnegip7MZY0Mk/c8qgvO6E3sgBcGuxDxF5vB718XIZCd5Vr4J0cro
	fjuYzqjm+N2S76ivkvNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxQd7-007v23-3V; Tue, 22 Nov 2022 10:35:53 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxQd3-007ulZ-Ep
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 10:35:51 +0000
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 10EEC3F479
	for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 10:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1669113346;
	bh=5zJKgeVGZmLVAXevDGlsNfSshltWSGYw3d8eMnb+lIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=pR0iPF1enR7Jq9/RDdOxOf1jYD5l1wvWmsz16U0qqUWVlmHvYzZFC7bX0hqNHpJqU
	 Y/VowcpNaADz6osxPwpWFyfkxgKZGW714yr+ot64/jNj81HUTDOpKSsKR48Bq3W0cZ
	 +yaIh05OJdtTnzF8sPx0D0kOd6aAZHA/5nWHNSB8YVm1KV3TLH2EjYp0r4EIceX/2a
	 HHdAllHgPpSrSmGFISjsk8p47ZiIat+FxcyiMaLbNt3woCGIQfLdto4MfoLr1Y6GUR
	 L7lXKSPfg1z3FQFTX5dWiNNXMvqw3lEt4hK/fqA7e+BHCrMvP1EO5kgCKf25e6qOyP
	 YZVe6IbAZ3F9A==
Received: by mail-yb1-f200.google.com with SMTP id i10-20020a25f20a000000b006ea4f43c0ddso7393981ybe.21
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 02:35:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zJKgeVGZmLVAXevDGlsNfSshltWSGYw3d8eMnb+lIA=;
        b=Ph1ui7jJzoGmVqy2Ob9SwlpJ/C0l9Yg4fgM4r+WVPnG7EgK5qNmAox/yZXc7ynINX7
         wmpSk9Syu1cYJg6vQXMPO+pj9JQ+Xq4rbKbIEI3Cd1G8ayoP9LFilM7b/qV4DHxHehXn
         dm8YrmlV43WfipT7M4aC+8FEFT+63h8UtEzGWzFFHsdfiRsxJJlwaQNL4/hYm7ThyXLk
         vfpSP2isVbiz+xx5IkgzD3lCAV+AbVZEb3Z+KhMacy/DM1ijTGbmm/uZEbi/NbiMpwhv
         XvfC/4x3wkNGm8Fji6/mTKpv8MiwUix7XDJVMIYzmn5OQrvzeo/XfmePgQvGkSMxpAXj
         turw==
X-Gm-Message-State: ANoB5pnxwIh90dCt3rKSqSYGxdoQ2G3T2Bw3dWBfv3Oav5c9w/4q5GEK
	HNhfKfEz8DYbSCT8AEEJUIBWfsuappY6EBV3tEgpVMNYCj8j7R6ylWVWmjazkZE5Wsmwma7LUo0
	IiLGR6W42TAPNg7HNt4AZPUzyjS8MLjkss/tjqM/yzNWBCwWq+6OxCa5ILe1hvQ==
X-Received: by 2002:a81:4ed0:0:b0:39b:2705:501 with SMTP id c199-20020a814ed0000000b0039b27050501mr6707276ywb.326.1669113344954;
        Tue, 22 Nov 2022 02:35:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5vKLtUztzm9gaB/lzhK2k8U2ZuZGMCv5M6kPMPlh1R0C7N1egHiQAH8o2IMhW9OMm3sahzXcklxwXcPjKUzns=
X-Received: by 2002:a81:4ed0:0:b0:39b:2705:501 with SMTP id
 c199-20020a814ed0000000b0039b27050501mr6707261ywb.326.1669113344732; Tue, 22
 Nov 2022 02:35:44 -0800 (PST)
MIME-Version: 1.0
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-5-hal.feng@starfivetech.com> <Y3duiJguYE6VrVLP@spud>
 <Y3dvCPP1g0LzzHFO@spud> <a5193e23-efe1-fa65-15de-d53b80b87d63@starfivetech.com>
 <Y3yRTuo69JUsfLqk@wendy> <0f9e423e-37c0-a838-bf25-f9b6784a31d0@starfivetech.com>
 <Y3yd+tfFl4yvXOx6@wendy> <b57bdf1c-19f4-3d70-7618-16817669abc5@starfivetech.com>
In-Reply-To: <b57bdf1c-19f4-3d70-7618-16817669abc5@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Tue, 22 Nov 2022 11:35:28 +0100
Message-ID: <CAJM55Z-aQfvUZXNtaorAk4acpbbVsj-f-8TQn6uZXQosD=MORA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] dt-bindings: sifive,ccache0: Support StarFive
 JH7110 SoC
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ben Dooks <ben.dooks@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_023550_144249_4C9598FF 
X-CRM114-Status: GOOD (  30.90  )
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

On Tue, 22 Nov 2022 at 11:16, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> On Tue, 22 Nov 2022 10:01:30 +0000, Conor Dooley wrote:
> > On Tue, Nov 22, 2022 at 05:55:57PM +0800, Hal Feng wrote:
> > > On Tue, 22 Nov 2022 09:07:26 +0000, Conor Dooley wrote:
> > > > On Tue, Nov 22, 2022 at 04:40:23PM +0800, Hal Feng wrote:
> > > > > On Fri, 18 Nov 2022 19:39:52 +0800, Conor Dooley wrote:
> > > > > > On Fri, Nov 18, 2022 at 11:37:50AM +0000, Conor Dooley wrote:
> > > > > > > On Fri, Nov 18, 2022 at 09:17:10AM +0800, Hal Feng wrote:
> > > > > > > > From: Emil Renner Berthing <kernel@esmil.dk>
> > > > > > > >
> > > > > > > > This cache controller is also used on the StarFive JH7110 SoC.
> > > > > > >
> > > > > > > "... and configured identically to that of the FU740"?
> > > > > > > Anyways,
> > > > > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > >
> > > > > > Actually, after looking at the next patch - why can you not fall back to
> > > > > > the fu740 one since you appear to have the same configuration as it?
> > > > >
> > > > > Right, I will drop this patch and use "sifive,fu740-c000-ccache" as
> > > > > compatible in dts.
> > > >
> > > > Uh, that's not quite what I was suggesting. Rather than using that one
> > > > in isolation, you can do the following in your dt:
> > > > "starfive,jh7110-ccache", "sifive,fu740-c000-ccache"
> > > >
> > > > And then in the driver we need to make no changes - unless down the line
> > > > we find some sort of issue that requires special handling etc. There's
> > > > no harm in having a "starfive,jh7110-ccache" IMO.
> > >
> > > Just like what microchip did as blow?
>
> below
>
> > >
> > > Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml:
> > > properties:
> > >   compatible:
> > >     oneOf:
> > >       - items:
> > >           - enum:
> > >               - sifive,ccache0
> > >               - sifive,fu540-c000-ccache
> > >               - sifive,fu740-c000-ccache
> > >               - starfive,jh7110-ccache
> > >           - const: cache
> > >       - items:
> > >           - const: microchip,mpfs-ccache
> > >           - const: sifive,fu540-c000-ccache
> > >           - const: cache
> >
> > No, I don't think this is correct either. You'd do something like:
> >
> > >       - items:
> > >           - const: starfive,jh7110-ccache
> > >           - const: sifive,fu740-c000-ccache

For the record I don't think the line above should be there. The
fu7400-c000 is a specific tapeout and pretending the JH7110 is that
tapeout is not right. Especially when there is already the
"sifive,ccache0" string for the generic IP.

> > >           - const: cache
>
> Yeah, this is what I mean. Thanks.
>
> Best regards,
> Hal
>
> >
> > And then the driver needs no changes.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
