Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B224C43219
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 20:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hx0h1co8ixtA+ERSkPQIPzJ8XPC47ESAMApa0cJQ8KY=; b=l1t/+JQj93T7yP
	GDyT7YVM7QIM7WbiH107kwUOzC03QAF/sw3vN91kkF4XabYvw2U7rBWR4Y0zZMPVhsa8R2FsXOxdQ
	7RJH4aYVxOnfPNJfbR2Cyms37QFBgWFSZD0R4bVJekIKAl/G0FmekWWa2jFUfIt8EcKASZLXaa4VQ
	L3v6XoQf+vYyoCDiPRpCHfUZng6VCUnQQa6ASL5pfxOCJ3QkUPuwamM75sGXbyEzQf8eDW6GFA5oN
	sb7kv7iUyibDf3w6TnAgH/heSlxNcO9+dSXs3x69GGBvPaGG/C/B15pp/YWsAbNQXotgFKdlqFA9Q
	BxPteg4ocPcPqjdsk2dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyITs-00BOP3-2u; Thu, 24 Nov 2022 20:05:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyITo-00BONM-F3
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 20:05:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D6E6D62239;
	Thu, 24 Nov 2022 20:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A56BC433D7;
	Thu, 24 Nov 2022 20:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669320350;
	bh=f8Kaz8pUEg/+dRz3JXsCoWQ/hDv43xbv8M6GJX2jTMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f9PIyi1b28nJcBVnbuB52YKFjX9SgXxrw/smc+QNBcHKHwpDR0exAb/cuFUCBr9CQ
	 MwCHQnRO9ji2xHo6iJuFh0pSygN9gg7YkB0KGwiaX2XgVLPCO63PD3k/ygS4kAMvgg
	 EpWwmr4ABoTnMwLExgMauElADrxobvRX+7F+ziAjdRYOY1E/2xXiBX02CxJ63jdVta
	 QPWLG4PjEb9Td+S6E/payr/UPALGtERLV60ckexfjm9j2yRNPLuc9NE1AJOCJCOd1E
	 2zfZ884cqIbqZMVraME45p1jw/abfNa4Py1/mM1ObtSm5d/ULhLMkcLx20f6qWzulP
	 APCR+icwPFKqA==
Date: Thu, 24 Nov 2022 20:05:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 1/7] riscv: asm: alternative-macros: Introduce
 ALTERNATIVE_3() macro
Message-ID: <Y3/OlKI1jyi0eoCJ@spud>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y3/LgZkR1hkblJ8D@spud>
 <4801607.MHq7AAxBmi@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4801607.MHq7AAxBmi@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_120552_624435_E46E630E 
X-CRM114-Status: GOOD (  23.70  )
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

On Thu, Nov 24, 2022 at 08:58:41PM +0100, Heiko St=FCbner wrote:
> Am Donnerstag, 24. November 2022, 20:52:33 CET schrieb Conor Dooley:
> > On Thu, Nov 24, 2022 at 05:22:01PM +0000, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > =

> > > Introduce ALTERNATIVE_3() macro.
> > =

> > Bit perfunctory I think! There's a lovely comment down below that would
> > make for a better commit message if you were to yoink it.
> > Content looks about what I'd expect to see though.
> =

> Also both the comment on the original ALTERNATIVE_2 and the new ALTERNATI=
VE_3
> should probably be merged into a single comment explaining this once for =
all
> ALTERNATIVE_x variants.
> =

> Especially with the dma stuff, I'm pretty sure we'll get at least an ALTE=
RNATIVE_4
> if not even more ;-) . So we defnitly don't want to repeat this multiple =
times.

Oh I can promise you that there'll be a #4 ;) I do find the comment's
wording to be quite odd though..

> + * A vendor wants to replace an old_content, but another vendor has used
> + * ALTERNATIVE_2() to patch its customized content at the same location.=
 In

In particular this bit about "at the same location" does not make all
that much sense. What "at the same location" means in this context
should be expanded on imo. Effectively it boils down to someone else is
already replacing the same things you want to replace - it's just the
word "location" that might make sense if you're an old hand but not
otherwise?

> + * this case, this vendor can create a new macro ALTERNATIVE_3() based

Also, using the word "can". Is it not a "must" rather than a "can",
since this stuff needs to be multiplatform?

> + * on the following sample code and then replace ALTERNATIVE_2() with
> + * ALTERNATIVE_3() to append its customized content.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
