Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FFDC43219
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 20:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PIhngtia8j/j/F81V5uI1Xb1WHge2zx3Mp4pjdxhjS0=; b=SWZ85HtuQ56uLN
	Wj0Of5gA24Zy4Tr4+wzfZJyFl6woFYUPUFURSWHAjrNhkFuSJYxFmalt0goHVotO6CJvpljGFi7K5
	3HhKmGA40Dra55KHUkAH8j3olKPeIWwgo+ZNUCDo/lcEKH+AYk48YYpqaMK8I8C6IpIUcyerEu+V8
	HoF3R6L+ro4+67TckuCYSneYr7NXkoCLV+ujMnTrzMwtlsyJVvEOwHAV9C3VvB7mtuxksF4++MhTs
	5OCPG1FD000bHNUnQPlgBvvxDRVyFuQR4ajpwdCRAvQX4hynRcRqySkcJrQv77RXQjQFtHr67Tte1
	YTUriPXyEjrTUUcF2rtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyJ5K-00BVoX-7i; Thu, 24 Nov 2022 20:44:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyJ5H-00BVnQ-Ti
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 20:44:37 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oyJ59-0007px-11; Thu, 24 Nov 2022 21:44:27 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 1/7] riscv: asm: alternative-macros: Introduce ALTERNATIVE_3() macro
Date: Thu, 24 Nov 2022 21:44:25 +0100
Message-ID: <3307993.NgBsaNRSFp@diego>
In-Reply-To: <59aea5e5-25f1-de8c-9982-5db226f8bda5@kernel.org>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <Y3/OlKI1jyi0eoCJ@spud> <59aea5e5-25f1-de8c-9982-5db226f8bda5@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_124435_979804_C2DD3D9C 
X-CRM114-Status: GOOD (  30.40  )
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

Am Donnerstag, 24. November 2022, 21:08:17 CET schrieb Conor Dooley:
> On 24/11/2022 20:05, Conor Dooley wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> > =

> > On Thu, Nov 24, 2022 at 08:58:41PM +0100, Heiko St=FCbner wrote:
> >> Am Donnerstag, 24. November 2022, 20:52:33 CET schrieb Conor Dooley:
> >>> On Thu, Nov 24, 2022 at 05:22:01PM +0000, Prabhakar wrote:
> >>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>>
> >>>> Introduce ALTERNATIVE_3() macro.
> >>>
> >>> Bit perfunctory I think! There's a lovely comment down below that wou=
ld
> >>> make for a better commit message if you were to yoink it.
> >>> Content looks about what I'd expect to see though.
> >>
> >> Also both the comment on the original ALTERNATIVE_2 and the new ALTERN=
ATIVE_3
> >> should probably be merged into a single comment explaining this once f=
or all
> >> ALTERNATIVE_x variants.
> >>
> >> Especially with the dma stuff, I'm pretty sure we'll get at least an A=
LTERNATIVE_4
> >> if not even more ;-) . So we defnitly don't want to repeat this multip=
le times.
> > =

> > Oh I can promise you that there'll be a #4 ;) I do find the comment's
> > wording to be quite odd though..
> > =

> >> + * A vendor wants to replace an old_content, but another vendor has u=
sed
> >> + * ALTERNATIVE_2() to patch its customized content at the same locati=
on. In
> > =

> > In particular this bit about "at the same location" does not make all
> > that much sense. What "at the same location" means in this context
> > should be expanded on imo. Effectively it boils down to someone else is
> > already replacing the same things you want to replace - it's just the
> > word "location" that might make sense if you're an old hand but not
> > otherwise?
> =

> Or maybe I am just biased because I tried to explain this to someone
> recently and the language in the comments didn't make sense to them,
> and anyone meddling with this code should be able to understand it?

When I first looked at the whole alternatives / patching thing, the whole t=
hing
looked like dark magic to me ;-) .

But yeah, the comment here, but also the original one above ALTERNATIVE_2
could use improvements to explain better what it tries to do.


> >> + * this case, this vendor can create a new macro ALTERNATIVE_3() based
> > =

> > Also, using the word "can". Is it not a "must" rather than a "can",
> > since this stuff needs to be multiplatform?
> > =

> >> + * on the following sample code and then replace ALTERNATIVE_2() with
> >> + * ALTERNATIVE_3() to append its customized content.
> > =

> > =

> =

> =






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
