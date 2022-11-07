Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE6EC433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 18:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bROmlUSSfXZ2VfdOZvgm78vW3aN5LpA8hJtIl8eq6CA=; b=jSjL/04nqKcV16
	PgD9J3Flgcgbc37NLgDn2oJgYxp5/6aiRUmcw68APRf1GA5K4gbIwWLfaxuah+T7/zzxQ+YhSKTLd
	//DYMWxaPSvLG1hWNRqvmVDccqppr7OOx4yRa2ZEcQtDOt7qmkGuvfqqeSJOHeMuQ9D4XI76CFTSn
	Pe4lJ/0z2F+keTQ80JI9+QANkrsIjdpWU3l1OPMNQSIC3SJsPsoxacpco32Hmzcv42VCGzken5om7
	/cInoRa+WW6KQBedE7/jZfKJ4cJpXuyHlLKm8D+Pz7aRNuHkO0pW1LAE2XeKhyj7c8O4LVGN0J02d
	/hXpJ9rSJ2AjiLYJgIfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6hK-00H7U6-BD; Mon, 07 Nov 2022 18:18:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6gP-00H7BE-L4
	for linux-riscv@lists.infradead.org; Mon, 07 Nov 2022 18:17:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C79861234;
	Mon,  7 Nov 2022 18:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B856CC4347C;
	Mon,  7 Nov 2022 18:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667845034;
	bh=xe7fMo4Kua9n3JiLpB5ttddzY6yu64WGLoSwGcPiCaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vLd3QwnadAoxekjEhecUkcubKyn+7O5Rt7XZQia/an8wm6y9aAtiYEQj0UyUFWl2e
	 fApn5rCpI1+Ha7mg3o8TJIyngLDhzU5/H4qZ32MkidfILXPZviAskPnndZvb+jnLvu
	 haXFY+DBmHkUi4/Jx1QoW+GXiTOz6NnGuUE9c3W7/SpDiThcV4dYNtp8nFSEmyLhFC
	 5C08PbeMoe0R4rxoKr2f1hsPyU4K2W3fjTQaph8ZDKadq8VuQuXUYGTjq91g8qSPxI
	 gQ4f0ip6B4ELkYf0GhcfGBTvebMvTSfVL96ITPTfFM9EDTPU7Yj/5NSuKzJK1ebHTO
	 LlvI8pC8M+Tbw==
Date: Mon, 7 Nov 2022 18:17:08 +0000
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, geert+renesas@glider.be
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 0/7] Add support for Renesas RZ/Five SoC
Message-ID: <Y2lLpCRpTQL+0dsR@spud>
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y17BWPuEcmY7Bba3@spud>
 <CA+V-a8uKQ8QvYi5qLC9O=QAQN5CxNB7cOTmw4vk+ndB2R8d3nQ@mail.gmail.com>
 <Y17+pHAg/SBJAEXq@spud>
 <CA+V-a8t-niCHSWo_CSRSkPS4ND12DAkiwxWxOM1vNn=oBKKd_w@mail.gmail.com>
 <CA+V-a8utoDSKcZFdtJ0BKwvPfcvf0WVH2Va-Fv_-pKC1FOOVsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8utoDSKcZFdtJ0BKwvPfcvf0WVH2Va-Fv_-pKC1FOOVsQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_101717_822238_54A0B1DF 
X-CRM114-Status: GOOD (  33.65  )
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

On Mon, Nov 07, 2022 at 06:03:41PM +0000, Lad, Prabhakar wrote:
> Hi Conor,
> 
> On Sun, Oct 30, 2022 at 11:01 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> >
> > Hi Conor,
> >
> > On Sun, Oct 30, 2022 at 10:46 PM Conor Dooley <conor@kernel.org> wrote:
> > >
> > > On Sun, Oct 30, 2022 at 10:37:01PM +0000, Lad, Prabhakar wrote:
> > > > Hi Conor,
> > > >
> > > > On Sun, Oct 30, 2022 at 6:24 PM Conor Dooley <conor@kernel.org> wrote:
> > > > >
> > > > > On Fri, Oct 28, 2022 at 05:59:14PM +0100, Prabhakar wrote:
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Hi All,
> > > > > >
> > > > > > The RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP Single)
> > > > > > 1.0 GHz, 16-bit DDR3L/DDR4 interface. And it also has many interfaces such
> > > > > > as Gbit-Ether, CAN, and USB 2.0, making it ideal for applications such as
> > > > > > entry-class social infrastructure gateway control and industrial gateway
> > > > > > control.
> > > > > >
> > > > > > This patch series adds initial SoC DTSi support for Renesas RZ/Five
> > > > > > (R9A07G043) SoC. Below is the list of IP blocks enabled in the initial
> > > > > > board DTS which can be used to boot via initramfs on RZ/Five SMARC EVK:
> > > > > > - AX45MP CPU
> > > > > > - CPG
> > > > > > - PINCTRL
> > > > >
> > > > > Hey,
> > > > > Looks like you've got a pair of warnings here from dtbs_check. I tested
> > > > > this on top of 20221028's next, with the three branches below merged in,
> > > > > hopefully my merges aren't the source of them:
> > > > >
> > > > > linux/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: pinctrl@11030000: 'interrupt-controller' is a required property
> > > > >         From schema: Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> > > > > linux/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: pinctrl@11030000: '#interrupt-cells' is a required property
> > > > >         From schema: linux/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> > > > >
> > > > Thanks for the review and test. The warnings above are coming from [0]
> > > > as support for IRQC is missing, once that is added the warnings should
> > > > go away.
> > >
> > > Right. I merged in the stuff in Geert's trees & I don't think I saw any
> > > pending patches in the cover that I missed. Is there something else that
> > > adds the support that's not going to make v6.2? I got rid of all the
> > > dtbs_check warnings for v6.1 and I'd really like to keep things that
> > > way!
> > >
> > Sorry that pacth wasn't posted yet so I hadn't mentioned it in the
> > cover letter. I'll make sure I get it posted asap and merged for v6.2.
> >
> I have got the patches out [0] which will fix the warnings seen above.

Cool, thanks :)

> 
> BTW on the riscv patchwork I see status as fail "Patch does not apply
> to for-next" does that mean I need to resend re-basing on your tree?

Nah, I though that Geert would be applying this patchset, no?
If that's the case, it only needs to apply to his tree.

Geert, are you waiting for an ack from Palmer?

> [0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20221107175305.63975-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> Cheers,
> Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
