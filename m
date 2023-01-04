Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32323C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nrZTkhuVZHoh2CuTf3wClMC2KrPuTsN269c/nh9vUvo=; b=QWCYoDnoEPFU9h
	/GtkskV0to7FSyNLtU0SWIJgxthfWzGGo8aPgRkxiuQmCsX2ufM4YSvEBYAIAJfDVa1qLUzwB1vxw
	i6qpmeIEHmp7EfvDzR7QtET7HFfnwfCsWdzxMioa4Ym7gimLevnHG6aAzyoaXy8JW9luw8+QYCWcK
	FL+WztdWmuKU7hyk85/Ay5su6Nwe70S2a/7xi5f56K4GHnOS4btO0L1Ax96isQjkHbd7QEJR1cjy0
	IeLziwLRcyIryeZpQxpWCjizoPp2R7Ab5V3hAp/6+nerPhtcTCAbLTSbN4TzANAlxpPCJqjkG2VT7
	FtwXmgyKgev7C1+2tKyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5T7-00A0VV-KZ; Wed, 04 Jan 2023 15:14:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD4Yt-009d9r-2U
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 14:16:13 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pD4Yr-00076l-HJ; Wed, 04 Jan 2023 15:16:09 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu
Subject: Re: [PATCH] RISC-V: fix compile error from decuplicated __ALTERNATIVE_CFG_2
Date: Wed, 04 Jan 2023 15:16:08 +0100
Message-ID: <5083878.31r3eYUQgx@diego>
In-Reply-To: <5923098.DvuYhMxLoT@diego>
References: <20230103214228.841297-1-heiko@sntech.de> <20230104100629.oyfn6ns7ezhpc6ek@orel> <5923098.DvuYhMxLoT@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_061611_169460_83779230 
X-CRM114-Status: GOOD (  37.58  )
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

Hi again,

scratch this mail, I just saw the other one from 15:08 :-)

Heiko

Am Mittwoch, 4. Januar 2023, 15:11:38 CET schrieb Heiko St=FCbner:
> Hi Andrew,
> =

> Am Mittwoch, 4. Januar 2023, 11:06:29 CET schrieb Andrew Jones:
> > On Tue, Jan 03, 2023 at 10:42:28PM +0100, Heiko Stuebner wrote:
> > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > =

> > > On the non-assembler-side wrapping alternative-macros inside other ma=
cros
> > > to prevent duplication of code works, as the end result will just be a
> > > string that gets fed to the asm instruction.
> > > =

> > > In real assembler code, wrapping .macro blocks inside other .macro bl=
ocks
> > > brings more restrictions on usage and the optimization done by
> > > commit 2ba8c7dc71c0 ("riscv: Don't duplicate __ALTERNATIVE_CFG in __A=
LTERNATIVE_CFG_2")
> > > results in a compile error like:
> > > =

> > > ../arch/riscv/lib/strcmp.S: Assembler messages:
> > > ../arch/riscv/lib/strcmp.S:15: Error: too many positional arguments
> > > ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "=
886:"
> > > ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "=
887:"
> > > ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "=
886:"
> > > ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "=
887:"
> > > ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "=
886:"
> > > ../arch/riscv/lib/strcmp.S:15: Error: attempt to move .org backwards
> > =

> > Ouch. I thought I had tested that, but looking now at my test code I se=
e I
> > only bothered to test ALTERNATIVE(), not ALTERNATIVE_2(). Adding the
> > ALTERNATIVE_2() test, I can reproduce this.
> > =

> > It appears the issue is that as macro arguments may be separated by com=
mas
> > or spaces, the old and new instruction macro arguments, which have spac=
es
> > between their instructions and operands, get interpreted as extra macro
> > arguments. There's probably no way to convince the macro otherwise,
> > unfortunately.
> > =

> > > =

> > > Going back to the original code for the non-assembler-part makes that
> > > code work again. So this reverts the #ifdef ASSEMBLY part of that com=
mit
> > > to the previous variant with duplicated base.
> > > =

> > > Fixes: 2ba8c7dc71c0 ("riscv: Don't duplicate __ALTERNATIVE_CFG in __A=
LTERNATIVE_CFG_2")
> > > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > ---
> > > I was of two minds about either to revert the full patch, or doing ju=
st
> > > this partial one for the ASSEMBLY part. I did go with this variant, a=
s I
> > > still like the idea of deduplicating as much as possible :-)
> > > =

> > >  arch/riscv/include/asm/alternative-macros.h | 13 ++++++++++++-
> > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > > =

> > > diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv=
/include/asm/alternative-macros.h
> > > index 7226e2462584..e7bdb2a510a4 100644
> > > --- a/arch/riscv/include/asm/alternative-macros.h
> > > +++ b/arch/riscv/include/asm/alternative-macros.h
> > > @@ -44,9 +44,20 @@
> > >  	ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, \new_c
> > >  .endm
> > >  =

> > > +/*
> > > + * Using ALTERNATIVE_CFG inside ALTERNATIVE_CFG_2 results in compile=
 errors.
> > > + * So the common code needs to stay duplicated.
> > > + */
> > >  .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, e=
nable_1,	\
> > >  				new_c_2, vendor_id_2, errata_id_2, enable_2
> > > -	ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enab=
le_1
> > > +886 :
> > > +	.option push
> > > +	.option norvc
> > > +	.option norelax
> > > +	\old_c
> > > +	.option pop
> > > +887 :
> > =

> > We could still share this by creating another macro which only takes ol=
d_c,
> > and then invoke that from both ALTERNATIVE_CFG and ALTERNATIVE_CFG_2, I
> > think.
> =

> hmm, so I was trying the change below, but then even ALTERNATIVE_CFG fail=
s.
> I was looking for quite a while for some sort of typo I may have in that
> change, but so far haven't found any.
> =

> Did you have a different solution in mind that may work?
> =

> =

> Heiko
> =

> ------------- 8< -------------
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/inc=
lude/asm/alternative-macros.h
> index e7bdb2a510a4..49c67fd94c57 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -33,13 +33,17 @@
>         .endif
>  .endm
>  =

> -.macro ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, enable
> -886 :
> +.macro ALT_OLD_CONTENT old_c
>         .option push
>         .option norvc
>         .option norelax
>         \old_c
>         .option pop
> +.endm
> +
> +.macro ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, enable
> +886 :
> +       ALT_OLD_CONTENT \old_c
>  887 :
>         ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, \new_c
>  .endm
> @@ -51,11 +55,7 @@
>  .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enabl=
e_1,   \
>                                 new_c_2, vendor_id_2, errata_id_2, enable=
_2
>  886 :
> -       .option push
> -       .option norvc
> -       .option norelax
> -       \old_c
> -       .option pop
> +       ALT_OLD_CONTENT \old_c
>  887 :
>         ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
>         ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
> =

> =






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
