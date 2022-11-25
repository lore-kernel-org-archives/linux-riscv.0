Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97B5C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 10:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzYAUT/OWQ8Do71cRLEz6qI5x/ty1nffbwwFm9O8NNk=; b=dewgPPH5Y/z64S
	0xYaWe8tYNjiOm2lTI4Ccd43fo0qG1dMZ+W9N3ef8NqYccaarrJZWThUPqpms+e/tetMGGDS0FS3W
	wTSwdbWSrXn4TE+xyjXPSYWs+dHfUfufor3bWBif6JR3CroiIbkRCdiSJetsWFEYgSjlIHZT8uAo+
	Zd30CFHv7sOAmFnwMofV0Izx3vIcTnKhWcojrQRShjomWzMqwXMLQEVft5y4uHwwlcwW4eKSnKsQy
	G7UYgZ0m+k1vM4PJmUi+4E9BfiTHPG27E83u4CYJMTx2v5O7I9BJJ62tNF/8a9nFAN+cxY0H/uCyP
	2ymVDitfBsh76y8Ylyiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyW6Q-00FY3b-Ag; Fri, 25 Nov 2022 10:38:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyVod-00FKvX-85
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 10:20:17 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oyVoT-0002Rt-7A; Fri, 25 Nov 2022 11:20:05 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 1/7] riscv: asm: alternative-macros: Introduce ALTERNATIVE_3() macro
Date: Fri, 25 Nov 2022 11:20:04 +0100
Message-ID: <3217756.bB369e8A3T@diego>
In-Reply-To: <CA+V-a8sT8VxpeM=eBgmDeojOka-LDmvP4JkhVfEDKi3D3VOsmw@mail.gmail.com>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <4801607.MHq7AAxBmi@diego> <CA+V-a8sT8VxpeM=eBgmDeojOka-LDmvP4JkhVfEDKi3D3VOsmw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_022015_390283_4FCA5F90 
X-CRM114-Status: GOOD (  20.76  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Freitag, 25. November 2022, 11:02:21 CET schrieb Lad, Prabhakar:
> Hi Heiko,
> =

> On Thu, Nov 24, 2022 at 7:58 PM Heiko St=FCbner <heiko@sntech.de> wrote:
> >
> > Am Donnerstag, 24. November 2022, 20:52:33 CET schrieb Conor Dooley:
> > > On Thu, Nov 24, 2022 at 05:22:01PM +0000, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Introduce ALTERNATIVE_3() macro.
> > >
> > > Bit perfunctory I think! There's a lovely comment down below that wou=
ld
> > > make for a better commit message if you were to yoink it.
> > > Content looks about what I'd expect to see though.
> >
> > Also both the comment on the original ALTERNATIVE_2 and the new ALTERNA=
TIVE_3
> > should probably be merged into a single comment explaining this once fo=
r all
> > ALTERNATIVE_x variants.
> >
> > Especially with the dma stuff, I'm pretty sure we'll get at least an AL=
TERNATIVE_4
> > if not even more ;-) . So we defnitly don't want to repeat this multipl=
e times.
> >
> Do agree. How about the below?
> =

> /*
>  * Similar to what ALTERNATIVE_2() macro does but with an additional
>  * vendor content.
>  */
> =

> So the other ALTERNATIVE_2+() macros will keep on building on it.

My idea was more like having _one_ comment block of something like

-----
/*
 * ALTERNATIVE_x macros allow providing multiple replacement options
 * for an ALTERNATIVE code section. This is helpful if multiple
 * implementation variants for the same functionality exist for
 * different cpu cores.
 *
 * Usage:
 *   ALTERNATIVE_x(old_content,
 *	new_content1, vendor_id1, errata_id1, CONFIG_k1,
 *	new_content2, vendor_id2, errata_id2, CONFIG_k2,
 *	...
 *	new_contentx, vendor_idx, errata_idx, CONFIG_kx)
 */

#define ALTERNATIVE_2(...)
#define ALTERNATIVE_3(...)
etc
-----

So this would include dropping the old comment over ALTERNATIVE2


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
