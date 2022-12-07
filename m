Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA914C352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 10:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oG7iJ2RkLNyakElKYC/H6Z3Y5mfQQolk7jEdz7FlpmU=; b=mgncq12r7HFycZ
	J5wl56E9Yf1xmBI/tJzztiFtnyoBeLsiWlaroZTFGcjI+zgUyhL7IwxcY3PTJQ13QIDKcBGx8R2EG
	0cfMD1rkMMNvCPgyiVypnJw7srMotMsmOW2lS/Il/bHM3Pp5iRwmkjP7MqrCI5xYpYvKMByC31wXh
	YEXyh1hm3MpBHqQ+DGC+yYN1r8Vw3hWKMfeVT9P9xJdNfFrtJnJ4GwuZM3oivDFL2ojqoKq635SZ2
	pOyysyHmuS31ugtv4D+dVMvCv3XZVhj/0Kddj/3XmDSGqOF0rqL+2dYM3XCwdUi5dOYhm7Pq5wXh8
	zQiSOpsZiZC0x2oigJ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rvD-00HXVr-Do; Wed, 07 Dec 2022 10:45:03 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rv8-00HXFF-DZ
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 10:45:01 +0000
Received: by mail-ed1-x52d.google.com with SMTP id a16so24273606edb.9
        for <linux-riscv@lists.infradead.org>; Wed, 07 Dec 2022 02:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WIyyFsEDdJszW+QGVtD/j+P/QpHLN0kh1fUvi+pqVbc=;
        b=I28zWxSyXTcoSYTHDDfPv93ax7S7OjkjD8G+LsBSLP/R975lnprvMKqA4lVMvq9FAc
         q52dORUYVC6Np2cnUBLJqQ/9koGYZ6xZW36xgGkxLyz45BqPGJv+zy+G/BeF2Vqnc7Ka
         XNwHywy2U1MC/plRKvWOqQsznQTdIe3I3Jjy+6CzY6MphkSRdgRq+rBu2Is0MKdiG619
         cZ/1tgObehulegAm40GMo0xhNTjsFLWDfggj+FO1V/7EWpsXj9+eU6ZOtqNqtwpivD34
         sXlZC7eqeX36OCRiLwzxdB7Kw8zVaEJdUp6zwIB5fa7O57m68Iz3znGW5WTE4Q3tMF9k
         AS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WIyyFsEDdJszW+QGVtD/j+P/QpHLN0kh1fUvi+pqVbc=;
        b=LNxNLfSx3dNJI9C2MpnKLelQFo/LWKHc6yX45BEHeyz+68cThqLiAFcCKB0C79XVkU
         c5sQqHCCqWmBUc6TJ6F7GPIeENVTQDUKDJuQyvBjSp909/R1ROTsz3zVS9YXIuTyW0Cp
         /vWGXAXwgyODPMeEY7v1D3z1pxkvKrJIRbccMHo8A9TwAxjGWcbP6OOQ1BRKLGKLCBEP
         jbi1mf9KoR9IKu54M7UK/hi6G5Kqn1Fg89oUTnc2aD9lAFmUrXMmybJ1hkOhrr/ZxMs2
         tfR6y3SvdOr2EYrv8U27KBw647R3VZGuPnQH9GGJgDVV/wO49fh2YU+OForbV1s6H0r5
         cMYQ==
X-Gm-Message-State: ANoB5pkMOumJSo8FnTtr/6Ib8s9pU6D3uINiLoz6ctB+9asXKJyqRoAQ
	tWAjzg+3sDOArMjnjVdzqOXsZQ==
X-Google-Smtp-Source: AA0mqf6mUjK024A8sixt5aDOMvR7TrM0k1pBECHMFi/ndvD0TyLcxWe4HW70fW8i6r1uI5ACMbfC6Q==
X-Received: by 2002:a05:6402:5406:b0:467:4b3d:f2ed with SMTP id ev6-20020a056402540600b004674b3df2edmr293577edb.101.1670409895739;
        Wed, 07 Dec 2022 02:44:55 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id 5-20020a170906310500b0073d81b0882asm8284525ejx.7.2022.12.07.02.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 02:44:55 -0800 (PST)
Date: Wed, 7 Dec 2022 11:44:54 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	conor@kernel.org, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com, ardb@kernel.org,
	linux-efi@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 11/14] RISC-V: fix auipc-jalr addresses in patched
 alternatives
Message-ID: <20221207104454.7r3sx37mvlfc73jq@kamzik>
References: <20221130225614.1594256-1-heiko@sntech.de>
 <20221201193353.7rtpqrkk7ws34e3k@kamzik>
 <3628021.R56niFO833@diego>
 <2256630.NgBsaNRSFp@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2256630.NgBsaNRSFp@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_024458_525047_7D4A5C6E 
X-CRM114-Status: GOOD (  37.09  )
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

On Wed, Dec 07, 2022 at 10:35:50AM +0100, Heiko St=FCbner wrote:
> Am Dienstag, 6. Dezember 2022, 23:10:01 CET schrieb Heiko St=FCbner:
> > Am Donnerstag, 1. Dezember 2022, 20:33:53 CET schrieb Andrew Jones:
> > > On Wed, Nov 30, 2022 at 11:56:11PM +0100, Heiko Stuebner wrote:
> > > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
...
> > > > +#define to_auipc_imm(value)						\
> > > > +	((value & JALR_SIGN_MASK) ?					\
> > > > +	((value & RV_U_IMM_31_12_MASK) + AUIPC_PAD) :	\
> > > > +	(value & RV_U_IMM_31_12_MASK))
> > > =

> > > I know RV_U_IMM_31_12_OPOFF is 0, but it looks odd not shifting
> > > RV_U_IMM_31_12_MASK when we do shift RV_I_IMM_11_0_MASK.
> > > =

> > > So, it looks like to_auipc_imm() is doing
> > > =

> > >    offset[31:12] + ((value & BIT(11)) ? (1 << 12) : 0)
> > > =

> > > but the spec says the auipc part of the 'call' pseudoinstruction shou=
ld be
> > =

> > can you point me to that part of the spec?
> > =

> > For educational purposes, because in the main riscv-spec I only found
> > the main auipc + jalr descriptions, but nothing about the actual
> > "call" pseudoinstruction.
> > =

> > [and I'm probably just looking at the wrong document]
> > =

> > =

> > >    offset[31:12] + offset[11]
> > >  =

> > > which I think would be written as
> > > =

> > >  ((((value) & RV_U_IMM_31_12_MASK) << RV_U_IMM_31_12_OPOFF) + ((value=
) & BIT(11)))
> > > =

> > > or what am I missing?
> =

> So far I've found the riscv-asm-manual [0], which only states for call
> 	auipc x1, offset[31:12]
> 	jalr x1, x1, offset[11:0]
> =

> and the psABI spec [1], neither mention your "offset[31:12] + offset[11]"=
 ?
> =

> But [1] does contain that tiny sentence
> "The successive instruction has a signed 12-bit immediate so the value
>  of the preceding high 20-bit relocation may have 1 added to it."
> =

> =

> I.e. the lower 12 bits become themself a signed number [-2048:2047]
> =

> Take an example:
> - address is 1862116 ( 0b 111000110 100111100100 )
> - address[31:12] becomes 1859584 (as 0b 111000110 000000000000)
> - while address[11:0] is 2532 as part of the bigger number
> - as lone 12bit signed IMM it becomes -1564
> - so you need to add this 4096 to the auipc IMM to compensate
> =

> =

> Heiko
> =

> =

> [0] https://github.com/riscv-non-isa/riscv-asm-manual/blob/master/riscv-a=
sm.md
> [1] https://github.com/riscv-non-isa/riscv-elf-psabi-doc/releases/tag/v1.0

Yeah, I got this figured out yesterday and sent another mail confirming
the way you had it was right. Did you receive that mail?

Where I see =


 call offset     auipc x1, offset[31 : 12] + offset[11]
                 jalr x1, offset[11:0](x1)

is in chapter 25 of the unprivileged ISA.

> =

> > =

> > that whole thing came from the ftrace parts, also doing call fixup vood=
oo
> > And I can't really say that I understand every nook and cranny of it.
> > =

> > But for practical purposes, the addresses generated now work,
> > and also seem to work for the ftrace counterpart (see include/asm/ftrac=
e.h)
> > =

> > [another place that will profit from more generalization :-) ]
> > =

> > =

> > > > +
> > > > +void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int =
len,
> > > > +				      int patch_offset)
> > > > +{
> > > > +	int num_instr =3D len / sizeof(u32);
> > > > +	unsigned int call[2];
> > > > +	int i;
> > > > +	int imm;
> > > > +	u32 rd1;
> > > > +
> > > > +	/*
> > > > +	 * stop one instruction before the end, as we're checking
> > > > +	 * for auipc + jalr
> > > > +	 */
> > > > +	for (i =3D 0; i < num_instr - 1; i++) {
> > > =

> > > If we change riscv_instruction_at() to just take a pointer then we ca=
n do
> > > the math in the for() and actually just use pointer arithmetic.
> > > =

> > >         uint32_t *p =3D alt_ptr;
> > >         for (i =3D 0; i < num_instr - 1; i++, p++) {
> > =

> > Wasn't not using uint32 pointers the whole point of going with the acce=
ssor?

Oh, right. So maybe stick to the offsetting, but still do the math in the
caller.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
