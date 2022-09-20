Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F39C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 13:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SKfIIyGdYBOx2ErUCo8XXF28Jf2IeHZt3nzklEyYmuk=; b=h+JLbs0PyujtQf
	rKJgOTYdBQOODTysilfjWp3xpDtX2ZvPT9hzwBeapJsBqfROeLjssIvCo5LY9fZ4MDvGoRVjTuaDm
	G9PBQmc5lWwZ/SCHuYrE7RPNkQ8za4Pt3ey6h27jB64ba5BcAuW9hjSf2M8kCwspobOR2moWcAGJG
	d4/J3NMYi5/Di0DlISoK2xgFKzigL7N6KkxdCkJWrQYBz+H8p358AKaBbFYP4FiyoMkVODhmrQb/z
	30keFmiCMdRFsHzj/qX8T4ACGVA8mejExyd1iFqXrHW02HIgktRHF/bDU4vH+ssBt1NXys9ke0ejU
	pIOyuU9VELqbJy0IpD6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oadb1-004Dk6-99; Tue, 20 Sep 2022 13:47:31 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oadau-004DcY-04
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 13:47:28 +0000
Received: by mail-ej1-x634.google.com with SMTP id dv25so6191531ejb.12
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 06:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=FIfv7ldS0YkRlbgUcQzoAtfI4poeYBTKR3ilCVR4L44=;
        b=Ib4LtlPrWnMKsLSranL8+d9s8BraCoSk8vC38PSPG45HunaEjF8J+E7X0fZ87WYJ1T
         YexlNUct7PIKUbSlqgCUBv5ecfQOZpLeD7P1/K2BPLk+UTiBRGMsIRLtGti9asAtn/41
         6k5vyMnMTcb/o9pFgCacfYFq7yNJvXdYUYRy8NkOiBwlmYFVSOR6saJaJtjGE7RjSmBg
         U1B1HRDT8He6dxCAimHvMReIJOZoBlHIWYiQeITjAFS2zQs7+MBsSWP+OHJ69pTb28mT
         sG47+kawwNL6JJ6Lx4hgTLKH0ZssKBtnrcAku3GFT8Mizcf+D5Ogz6HE1OZCeSMwQtXA
         +ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=FIfv7ldS0YkRlbgUcQzoAtfI4poeYBTKR3ilCVR4L44=;
        b=NlQN7MzxMPFJ9QWPi5EWFC9EAI7/LCAsWixSwqEEzhC2ub4Syv6mlqyKDDxidxHh1f
         xI+QyLocfQ3itSdj4lMkePDzUSLCRkqijjFwosuFiEfS/hk5cecfdpJGtRXUXaRklwHc
         8320nwHoWBHpAHScO8zIXDfI+zAlvbmgCNS6PDG5dr7ITLZWZ8In8b5dcgbjvHQFESMI
         ugS27efu3n3RyOmIFvazklT8g3n6XXA7XoSNv4AXJsvFcd7evXfLmm5QyPGhZR5desPk
         UisHSpBQyMz5DvC3c9dv5ew0OgHb1Huh5Ni7vCxjmY2BAIkg17JnpcIWTDsYEvx3nfDC
         PzGw==
X-Gm-Message-State: ACrzQf1Y7JPgMZyStADSX+uuVtVzsNBEd45Ooz/qRZuUVlpBV23PB6tN
	3F1fSg4PsM1IU9xKWCyS+nTfCemMb76G0OtaXTk=
X-Google-Smtp-Source: AMsMyM5HgTh+5QojTUeIrgHbwGkUKtpIcdqU9tP/gHB3cveUpRK1tcUB+nxOzNhlHbkx+N7yPSGymD5FZc6WqDCbsRo=
X-Received: by 2002:a17:907:6d90:b0:77c:68a8:a5b with SMTP id
 sb16-20020a1709076d9000b0077c68a80a5bmr17470946ejc.342.1663681639186; Tue, 20
 Sep 2022 06:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220915181558.354737-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <3693a3a1-5a2a-4cc5-fb55-f6ad9a4b3f72@microchip.com> <CA+V-a8u87tqhC69qGD2zq_gT9jc_cSWd+NRn_u0bPTdmmk+j4A@mail.gmail.com>
 <e15f3e2a-2761-84d9-c5c9-118717e0bb83@conchuod.ie> <CAMuHMdUGD9s96JJafsYdfnPqvg6KLvmC9GUS4yjaaXi2hYrJYQ@mail.gmail.com>
 <Yymyh+UlIICacxeV@wendy>
In-Reply-To: <Yymyh+UlIICacxeV@wendy>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 20 Sep 2022 14:46:49 +0100
Message-ID: <CA+V-a8u3LcDhOYqWSOJUUeSMX+o=12pAcFJ0xArYSPy+=uT9NA@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] riscv: boot: dts: r9a07g043: Add placeholder nodes
To: Conor Dooley <conor.dooley@microchip.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <mail@conchuod.ie>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	heiko@sntech.de, atishp@rivosinc.com, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_064724_110466_77D109E3 
X-CRM114-Status: GOOD (  31.59  )
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

Hi Conor and Geert,

On Tue, Sep 20, 2022 at 1:31 PM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> On Tue, Sep 20, 2022 at 02:17:50PM +0200, Geert Uytterhoeven wrote:
> > Hi Conor,
> >
> > On Fri, Sep 16, 2022 at 12:40 AM Conor Dooley <mail@conchuod.ie> wrote:
> > > On 15/09/2022 23:26, Lad, Prabhakar wrote:
> > > > On Thu, Sep 15, 2022 at 10:36 PM <Conor.Dooley@microchip.com> wrote:
> > > >> On 15/09/2022 19:15, Prabhakar wrote:
> > > >>> riscv: boot: dts: r9a07g043: Add placeholder nodes
> > > >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >>> Add empty placeholder nodes to RZ/Five (R9A07G043) SoC DTSI.
> > > >> Can you explain why do you need placeholder nodes for this and
> > > >> cannot just directly include the other dtsis?
> > > >>
> > > > Since the RZ/G2UL SoC is ARM64 where it has a GIC and on RZ/Five SoC
> > > > we have PLIC for interrupts. Also the interrupt numbering for RZ/Five
> > > > SoC differs from RZ/G2UL SoC hence we are not directly using the
> > > > RZ/G2UL SoC DTSI [0].
> > > >
> > > > [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/r9a07g043.dtsi?h=v6.0-rc5
> > > >
> > > > For the RZ/Five SMARC EVK I am re-using the below files [1] (SoM) and
> > > > [2] (Carrier board) as the RZ/Five SMARC EVK is pin compatible.  Since
> > > > I am re-using these when trying to compile the RZ/Five DTB I get
> > > > compilation errors since the nodes dont exist (and there is no way
> > > > currently we can delete the node reference when the actual node itself
> > > > isn't present) hence these place holders.
> > > >
> > > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi?h=v6.0-rc5
> > > > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi?h=v6.0-rc5
> > >
> > > If this method is acceptable to Geert, this explanation 100% needs to
> > > go into the commit message.
> >
> > We've been using these placeholders a lot in Renesas SoC-specific
> > .dtsi files, as they allow us to introduce gradually support for a new SoC
> > that is mounted on an existing PCB, and thus shares a board-specific
> > .dtsi file.  Hence I'm fine with this.
>
> Aye, if you're happy with it then I am too...
> >
> > However, I think more properties can be dropped from the placeholders.
> > There is no need to have e.g. 'reg-names' and 'status = "disabled"'
> > (there is no compatible value, so no matching is done).
>
> ...and this makes a lot of sense. I'd still like a comment in the
> commit message though explaining why placeholder nodes are needed as
> opposed to just leaving it blank etc.
>
I will drop the status and reg-names properties and also update the
commit message while sending the v4

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
