Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0199C606A325
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 16:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JH3FTShl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=cBzRIq3k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SojR89R5uE8hxRk45nCpxxJ5pZqVkHgnhA3viATOc94=; b=JH3FTShlsIt57pzt198UNQi8K2
	oAArc+hHB+Fy8rQfQDGcMVc9pHy9cMtfBiwoEtioKfbakdoOtIOMG3xv9rjQk25BW3CItpdcxADdn
	msN9+SfzqLYpD4SggsmK78lP1uUA36WBojfSI/k6avFT8RFeybStK559ieV9zGxWloXbIAAUQT/Ev
	nH7Y3X1s6Hs35+qrIwXjtbnk9LphvB92BIE+CFQCpoYRabcdshUUtR9RKHDWFuMWBRWKPufMHM37d
	tIhGa97YBZE/GPoRR70QMB+KezGMrp2MsPQWnG0aspJb2zV45spEU/LwqKXuTyQeu9YfFM1DPJ60G
	MaC7Kriw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTi80-00000009Otl-45jS;
	Wed, 18 Nov 2026 16:03:20 +0000
Received: from sender5-op-o15.zoho.com ([165.173.182.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTi7y-00000009OtF-067f
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 16:03:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795017777; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DSGObvRuVfYHe9SPWi3DqDIgiYIldCXNqh1t+Zl00inX7x7i4f+eV1cq4wzsvlo86V17Dn23wGvSW1t07EXrholfCFxxPKGaij/5zbn70TAJEb0LBkpdLmQiXDDKQgFHprfMLaziAnTTKCZVVASEMI7uO4iuJvVIVSlFkGWx/h0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795017777; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SwGyqM8fKkj7sRpo7lsvMTTp7Ch2ClbA8Qn5X5Zgelw=; 
	b=ZYWXKgyx53JzR0+YODEWbeooFlcwA6c/+xMowA+BxuljXu5YPCzBy6l0pF1y+zb8kI7UTln+6jbKfSEWLrJcAzQYZuQHc3tngfPr6j18V8KfaXfQlLCiYjqqC6f4EAMuw548RDPc36yF3DBDCnKW5ifBohM7I1mjvuSLNdIDkf8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=cBzRIq3kEbo4izYjricXxCxci6PaCtbycrEGqIvCAEKBY0o6AKexzsYMH6bqRdVYgmH6sSUxhWB9tVf5agQD9OynAuwPmFKzxrcP1TcpFUrlEsg2aQsfOczSvBqk1zepyamp4NpdJ7Yl7Eh368529V7T2mO4VzWMvM0oLcZYZIg=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=lvK9tuIpxKgDgpYO7x8VbuolpPM0n5OGltXSZRjUgJ8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795017774093467.4763197419518;
	Wed, 18 Nov 2026 08:02:54 -0800 (PST)
Date: Wed, 18 Nov 2026 16:02:43 +0000
From: Yao Zi <me@ziyao.cc>
To: =?iso-8859-1?Q?Fr=E9d=E9ric_Mah=E9?= <frederic.mahe@cirad.fr>,
	Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.co>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH 0/6] riscv: spacemit: k1: RCPU2 PWM clocks and the BPI-F3
 fan
Message-ID: <av3MI0wgou3pbab8@pie>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261117205951.140146-1-frederic.mahe@cirad.fr>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.994.34
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_080318_107974_79F382AB 
X-CRM114-Status: GOOD (  18.00  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 09:59:45PM +0100, Fr=E9d=E9ric Mah=E9 wrote:
> The BPI-F3 fan header (J27) has a PWM line driven by an RCPU2 PWM
> (GPIO 79). This series adds the RCPU2 PWM clocks and DT nodes and
> enables the fan on the BPI-F3.
> =

> Patch 2 keeps pll1_aud_245p7 enabled: once clk_disable_unused() gates
> it, accesses to the RCPU2 block hang the CPU (the vendor kernel keeps
> it on through its RCPU firmware). It may be better tied to a power
> domain once the K1 power domain driver lands; comments welcome.
> =

> Tested on a BPI-F3 on v7.4-rc1 (no fan with a PWM input at hand, so
> with a multimeter on J27 pin 3): 0.86, 1.76, 2.74 and 4.66 V at 25,
> 50, 75 and 100% duty (0.04 V off), as with the vendor kernel, and
> the fan goes to level 1 when the package reaches 40 C under load.
> =

> Trees: 1-3 clk, 4-5 SpacemiT DT (4 needs the IDs from 1), 6 riscv
> defconfig. Depends on "reset: spacemit: Fix the RCPU2 PWM reset
> registers" (reset/fixes).
> =

> Written with help from Claude (Anthropic); reviewed and tested on
> hardware.
> =

> Signed-off-by: Fr=E9d=E9ric Mah=E9 <frederic.mahe@cirad.fr>
> =

> =

> Fr=E9d=E9ric Mah=E9 (6):
>   dt-bindings: clock: spacemit: k1: Add RCPU2 PWM clocks
>   clk: spacemit: k1: Keep pll1_aud_245p7 enabled
>   clk: spacemit: k1: Add RCPU2 PWM clocks
>   riscv: dts: spacemit: k1: Add RCPU2 PWM nodes
>   riscv: dts: spacemit: k1-bananapi-f3: Add PWM fan
>   riscv: defconfig: Enable PWM fan support
> =

>  .../boot/dts/spacemit/k1-bananapi-f3.dts      | 63 +++++++++++++
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  7 ++
>  arch/riscv/boot/dts/spacemit/k1.dtsi          | 91 +++++++++++++++++++
>  arch/riscv/configs/defconfig                  |  1 +
>  drivers/clk/spacemit/ccu-k1.c                 | 45 ++++++++-
>  .../dt-bindings/clock/spacemit,k1-syscon.h    | 12 +++
>  6 files changed, 218 insertions(+), 1 deletion(-)

I think spacemit,k1-syscon.yaml should probably be updated to make
'#clock-cells' property mandatory for rcpu2 node? And probably also
the other blocks capable of clock stuff as fix...

-- =

Thanks,
Yao Zi

Meow-mrrp-mrow, I'm a cat.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
