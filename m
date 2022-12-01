Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9608DC4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 17:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rf9+reM4Zxe98I39wpzObmaeUE3T/uhaXvBQ/9nOFh4=; b=kpXJMQM8Sqg2oT
	LCX4Ka0wuznzuyc6GU92ND4zkVf2ITodeadxPZw6EaFkM5T623R3Qr/q9OfKKoBPnDMvPPQ5LxZdr
	ZT4ndMMSuVCIs/7f6Xc5gUvJ9AdK9u58CfEk/kouC3+jqsW13CSWRuhbnC2idQlT0J5YPr9YYKqU3
	o4owAIef25444Xz45YS9eK2yCWg5dgrM14fTnl3HBOWJYnkyYOjQnzIemctZbtUjRfz98sE8Zvf5o
	Z8Jgo+ORrMnLqndH388p2ipvCy6WrdKreISLtxOLGMAC/F3pqyt0c/G8TEQJEKIogOADexFcm/UBr
	Wo8vK0oIRmbvfI05js8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0n2d-008pLR-VL; Thu, 01 Dec 2022 17:08:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0n1j-008p1b-9v
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 17:07:12 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0n1e-0002pm-Fd; Thu, 01 Dec 2022 18:07:06 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, conor@kernel.org, philipp.tomsich@vrull.eu, emil.renner.berthing@canonical.com, ardb@kernel.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH v3 01/14] RISC-V: fix funct4 definition for c.jalr in parse_asm.h
Date: Thu, 01 Dec 2022 18:07:05 +0100
Message-ID: <4345992.BddDVKsqQX@diego>
In-Reply-To: <20221201170537.mb3o6lybg25muf3n@kamzik>
References: <20221130225614.1594256-1-heiko@sntech.de> <20221201170023.tocmgewlwjrc7t6d@kamzik> <20221201170537.mb3o6lybg25muf3n@kamzik>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_090711_553911_BC373EFD 
X-CRM114-Status: GOOD (  24.97  )
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

Am Donnerstag, 1. Dezember 2022, 18:05:37 CET schrieb Andrew Jones:
> On Thu, Dec 01, 2022 at 06:00:23PM +0100, Andrew Jones wrote:
> > On Wed, Nov 30, 2022 at 11:56:01PM +0100, Heiko Stuebner wrote:
> > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > 
> > > The opcode definition for c.jalr is
> > >     c.jalr c_rs1_n0  1..0=2 15..13=4 12=1 6..2=0
> > > 
> > > This means funct4 consisting of bit [15:12] is 1001b, so the value is 0x9.
> > 
> > I presume kgdb c.jalr stepping was broken before this patch and, if so,
> > then we should add a comment stating that and also
> > 
> >   Fixes: edde5584c7ab ("riscv: Add SW single-step support for KDB")
> > 
> > and maybe to help keep me motivated :-)
> > 
> >   Reported-by: Andrew Jones <ajones@ventanamicro.com>
> >
> 
> Oh, and,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

as I need another round for the purgatory thing anyway, I've added all 3
of the things above :-)

> > > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > ---
> > >  arch/riscv/include/asm/parse_asm.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/riscv/include/asm/parse_asm.h b/arch/riscv/include/asm/parse_asm.h
> > > index f36368de839f..7fee806805c1 100644
> > > --- a/arch/riscv/include/asm/parse_asm.h
> > > +++ b/arch/riscv/include/asm/parse_asm.h
> > > @@ -125,7 +125,7 @@
> > >  #define FUNCT3_C_J		0xa000
> > >  #define FUNCT3_C_JAL		0x2000
> > >  #define FUNCT4_C_JR		0x8000
> > > -#define FUNCT4_C_JALR		0xf000
> > > +#define FUNCT4_C_JALR		0x9000
> > >  
> > >  #define FUNCT12_SRET		0x10200000
> > >  
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
