Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399DEC43217
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 18:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08TrlUX/2LedNvzhM0NNqwSfdk4rI/4IVcorWfdn6Ao=; b=acMvMGdbE1n7Um
	8C9+EKXRuTX481vDyz0F/zBS1InoiXCyOG+QLO0tXYkXa7ehz/YtHDylUvNV4rH1PNT/giXwJEBmw
	IPc2NxXdMOfbqniu4tF38kSP4sIBe148EGLbgH9FyYtchcCjT2hX1vFg40gBF4prfCAxMUAK8QLAM
	z/J7cWL78USPWckbHjl+PrZQ5d6CrQx06FzBJa1zVAaLsdaU9aRMYtYisRD+/dEj579LzN7FkrepL
	N6UrZyOu0Y/mQ9jdhZvWFAAE06uHzrry6L3Tp50Z1Fza7z8kyGpAr3PLnz2VUqXZc0gyP8DCjK93R
	ll+SJnM9ee2ZxbLkjYHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6YQ-00H3io-Os; Mon, 07 Nov 2022 18:09:02 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6Tk-00H1bk-Rr
	for linux-riscv@lists.infradead.org; Mon, 07 Nov 2022 18:04:14 +0000
Received: by mail-ej1-x630.google.com with SMTP id n12so32248751eja.11
        for <linux-riscv@lists.infradead.org>; Mon, 07 Nov 2022 10:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sg0lwZYTU9JWcjNHK3+96CsLpgsQAQHMbXUOoXcTWAw=;
        b=VgvQeRKGXjpN7rsFy94zWCr9OA0dpnIfL2CawpFJYijveycNO8+9xWYnPS7ZVKjqsJ
         QU94MOffg+97/ZUT1HNpEf0h9rVGh7CXC3zjQbTVmpbY0SQC0tVZYJlGaGr5M3O8trva
         iHeRGHHGEoBD9/8ZjrZtiIUElt7yj7rKO/WgaxbUi2XLbns2vr0dej9wz8FmY2oT2GHe
         IibTpgRZF1ZIPO+acBn94a/vy7DZx0xmBwJ1tyiZr8g3X96PHURRJV7seC/Y7ZTnlYtC
         7+dkOAoUHGL8DGNPkklXkPipQ5gv9b119vAovISr39kdgAIS+T8h7Q4xDbTQny5dRg/K
         gQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sg0lwZYTU9JWcjNHK3+96CsLpgsQAQHMbXUOoXcTWAw=;
        b=KAOb3fE+yYkutwzb8xoYEaTRD7ZyJ+1AKLRCpDFoEM6OWmbdDdUdviT4AM4d842n5h
         nohTPU9dn4f6kfSRjhm18L8TOYS7bM3cmFDVlKZzU5JnXTg6n6mssQa14BvJAEVx0+m1
         8iw9Yu/a1Lf2AyoyGqCVUSOlC8iyIXRp6NvmIWq0KlZyo7jVubsjRnLcLdplvfUtHqmw
         NLXC2/XmQOFvje6vpZiMl4xFSqku3foq2QW+UKptTXjwt7ZWRvb/bxXuWC1Q9ccZ9446
         tMgoRHDrbwp7JxSlBNe0KGxJxeijqobjV8LlOqpkFSt2LumvpSeat0d4VNthRIxFUeBt
         e/Yg==
X-Gm-Message-State: ACrzQf1867hngk9zN99AQdROXN8Vqr2nkrQRB3WscB9ACywJNOGcjmrc
	6/gcpgtTJ2tLkffC89ktJ3mZDcuMGXXfol95CPY=
X-Google-Smtp-Source: AMsMyM7n2WA+ZnLi0QcBe9sJOWeOu60VDFD0EZ1jJifo/fM9/FZPKUKady57RAJ7Z/vjacnBySXxjJd0TDPhpih5svc=
X-Received: by 2002:a17:907:270b:b0:7ad:ae01:e0d9 with SMTP id
 w11-20020a170907270b00b007adae01e0d9mr46374041ejk.196.1667844248212; Mon, 07
 Nov 2022 10:04:08 -0800 (PST)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y17BWPuEcmY7Bba3@spud> <CA+V-a8uKQ8QvYi5qLC9O=QAQN5CxNB7cOTmw4vk+ndB2R8d3nQ@mail.gmail.com>
 <Y17+pHAg/SBJAEXq@spud> <CA+V-a8t-niCHSWo_CSRSkPS4ND12DAkiwxWxOM1vNn=oBKKd_w@mail.gmail.com>
In-Reply-To: <CA+V-a8t-niCHSWo_CSRSkPS4ND12DAkiwxWxOM1vNn=oBKKd_w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Nov 2022 18:03:41 +0000
Message-ID: <CA+V-a8utoDSKcZFdtJ0BKwvPfcvf0WVH2Va-Fv_-pKC1FOOVsQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Add support for Renesas RZ/Five SoC
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_100412_949957_0B102039 
X-CRM114-Status: GOOD (  29.22  )
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

Hi Conor,

On Sun, Oct 30, 2022 at 11:01 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Conor,
>
> On Sun, Oct 30, 2022 at 10:46 PM Conor Dooley <conor@kernel.org> wrote:
> >
> > On Sun, Oct 30, 2022 at 10:37:01PM +0000, Lad, Prabhakar wrote:
> > > Hi Conor,
> > >
> > > On Sun, Oct 30, 2022 at 6:24 PM Conor Dooley <conor@kernel.org> wrote:
> > > >
> > > > On Fri, Oct 28, 2022 at 05:59:14PM +0100, Prabhakar wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Hi All,
> > > > >
> > > > > The RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP Single)
> > > > > 1.0 GHz, 16-bit DDR3L/DDR4 interface. And it also has many interfaces such
> > > > > as Gbit-Ether, CAN, and USB 2.0, making it ideal for applications such as
> > > > > entry-class social infrastructure gateway control and industrial gateway
> > > > > control.
> > > > >
> > > > > This patch series adds initial SoC DTSi support for Renesas RZ/Five
> > > > > (R9A07G043) SoC. Below is the list of IP blocks enabled in the initial
> > > > > board DTS which can be used to boot via initramfs on RZ/Five SMARC EVK:
> > > > > - AX45MP CPU
> > > > > - CPG
> > > > > - PINCTRL
> > > >
> > > > Hey,
> > > > Looks like you've got a pair of warnings here from dtbs_check. I tested
> > > > this on top of 20221028's next, with the three branches below merged in,
> > > > hopefully my merges aren't the source of them:
> > > >
> > > > linux/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: pinctrl@11030000: 'interrupt-controller' is a required property
> > > >         From schema: Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> > > > linux/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: pinctrl@11030000: '#interrupt-cells' is a required property
> > > >         From schema: linux/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> > > >
> > > Thanks for the review and test. The warnings above are coming from [0]
> > > as support for IRQC is missing, once that is added the warnings should
> > > go away.
> >
> > Right. I merged in the stuff in Geert's trees & I don't think I saw any
> > pending patches in the cover that I missed. Is there something else that
> > adds the support that's not going to make v6.2? I got rid of all the
> > dtbs_check warnings for v6.1 and I'd really like to keep things that
> > way!
> >
> Sorry that pacth wasn't posted yet so I hadn't mentioned it in the
> cover letter. I'll make sure I get it posted asap and merged for v6.2.
>
I have got the patches out [0] which will fix the warnings seen above.

BTW on the riscv patchwork I see status as fail "Patch does not apply
to for-next" does that mean I need to resend re-basing on your tree?

[0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20221107175305.63975-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
