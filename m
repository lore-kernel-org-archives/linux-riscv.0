Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8305C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 14:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GIW/47UEf01WPj+lXfzMJB4gUWWoEGaSxQ7LstU1w5k=; b=KrORe3lLvYfTOX
	WbD8xL9YVrY3w54WdYvVe1baGG1BPhhuC9abQQuhB/BcepqzHkOy93wDDw0HE/WH1rfIXdfAZjj7S
	1volT8jG7HL0R4GRxdgbSGvIyFa+pMQyP2h7c0LbXqEjaG4iGH+qMOhxethEfj9ng6asxwCgn5/G6
	QjdHu193na4MsIp1wQdKWUnxxDQORVstWA8ZnJxGyZ2ivNULy/lOgxVBqrdsvfdT9xZ9yD+nx07HG
	HzGhRBohHpXB9QGaMJ0TF8TsrHaARr/bh+3/MjjKhQFjpP+505U5sMJhj8GgRfZVdSWDpIftVGJGs
	T3sRnjU4xQeCvT540yPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8MBO-00Ck7w-12; Thu, 22 Dec 2022 14:04:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Luc-00CZUN-OE
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 13:47:09 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p8LuV-0006fH-Es; Thu, 22 Dec 2022 14:46:59 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, conor@kernel.org, philipp.tomsich@vrull.eu, emil.renner.berthing@canonical.com, jszhang@kernel.org
Subject: Re: [PATCH v4 11/12] RISC-V: add helpers for handling immediates in U-type and I-type pairs
Date: Thu, 22 Dec 2022 14:46:58 +0100
Message-ID: <6487607.lOV4Wx5bFT@diego>
In-Reply-To: <20221208143811.tluvayxdc5g4bw3e@kamzik>
References: <20221207180821.2479987-1-heiko@sntech.de> <20221207180821.2479987-12-heiko@sntech.de> <20221208143811.tluvayxdc5g4bw3e@kamzik>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_054706_897381_C875BCE1 
X-CRM114-Status: GOOD (  22.49  )
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

Am Donnerstag, 8. Dezember 2022, 15:38:11 CET schrieb Andrew Jones:
> On Wed, Dec 07, 2022 at 07:08:20PM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > Used together U-type and I-type instructions can for example be used to
> > generate bigger jumps (i.e. in auipc+jalr pairs) by splitting the value
> > into an upper immediate (i.e. auipc) and a 12bit immediate (i.e. jalr).
> > 
> > Due to both immediates being considered signed this creates some corner
> > cases, so add some helper to prevent this from getting duplicated in
> > different places.
> > 
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > ---
> >  arch/riscv/include/asm/insn.h | 47 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> > index 2a23890b4577..bb1e6120a560 100644
> > --- a/arch/riscv/include/asm/insn.h
> > +++ b/arch/riscv/include/asm/insn.h
> > @@ -290,3 +290,50 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
> >  	(RVC_X(x_, RVC_B_IMM_5_OPOFF, RVC_B_IMM_5_MASK) << RVC_B_IMM_5_OFF) | \
> >  	(RVC_X(x_, RVC_B_IMM_7_6_OPOFF, RVC_B_IMM_7_6_MASK) << RVC_B_IMM_7_6_OFF) | \
> >  	(RVC_IMM_SIGN(x_) << RVC_B_IMM_SIGN_OFF); })
> > +
> > +/*
> > + * Put together one immediate from a U-type and I-type instruction pair.
> > + *
> > + * The U-type contains an upper immediate, meaning bits[31:12] with [11:0]
> > + * being zero, while the I-type contains a 12bit immediate.
> > + * Combined these can encode larger 32bit values and are used for example
> > + * in auipc + jalr pairs to allow larger jumps.
> > + *
> > + * @utype_insn: instruction containing the upper immediate
> > + * @itype_insn: instruction
> > + * Return: combined immediate
> > + */
> > +static inline s32 riscv_insn_extract_utype_itype_imm(u32 utype_insn, u32 itype_insn)
> 
> Might be nice to keep the interfaces of these two complementing functions
> consistent by taking a u32 *insn here, like below. Or, below, taking
> &utype_insn and &itype_insn, like here.

I did go with separating the instructions in the insert function, simply
because I think it's way nicer to not impose the fixed structure
(2 u32 array) on every possible caller .

Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
