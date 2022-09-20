Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19038ECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 12:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odR7MvxkJBXKPlTTrBHkRjWvakUPK4KnsNZcIfpzMzc=; b=HkwfGF2bvcN1Ts
	A0vfZK+Pv5heOKj4UABQwdjE4Xzi7Nf4m0VuOEWAD53u58lmhS4gopHwYnQ4qFspmYImbKYDvu5Gr
	IMSvNn1V9LEhcP524MBaZwbKdrXKbrw6nzF8zPI+KmzKp6mWXmQbb1nYi59IntSAF6lNBhA78hszD
	FqNrmhsIJJVA//x2N+33gAr9TD/giw4VpPx62kS2/YixRy6QwIT19CLYVXbn2rGpdrfwKwwc0zdLP
	BhSKcp1g7XRah7qrHGPwKSDw2ySggeuBJAwkVyP1Bdi+8Ruhd3moVUElXN9M48DAUaQnhGz0CseQn
	OxgkdTOScXH9+5yezVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oacCa-003dXl-JD; Tue, 20 Sep 2022 12:18:12 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oacCX-003dTg-7Y
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 12:18:11 +0000
Received: by mail-qv1-f45.google.com with SMTP id ml1so1862319qvb.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 05:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=PCXGt1AyalYiTT3XoklrKq/gCYb3QTPuawn05s9CgfU=;
        b=Oim2ZY3vfjkkD0XmwJ2KzovaevC65eYshED5kqGPQZD5j5CjLDgagqTsKQ8bewvIhB
         V1KlY7HDnKZf04I6AAE5otSkPeQsI9CmYrsP9PxwzDaPECSdyKu6U/zaMS2yBtwxb0Ku
         GWFluoPu5dNn6O/yIgm+xea6OQR5Dq58DS5IgpDRVLfS2A9yB2k+QDh6h71mL08wWZyY
         UpIpPlJ52MeMSZtbiBVgF3oZbLCe/SLN0vCODROzCnfH0hHFfxBjWQp5Az5TpsktqNBc
         oyFPQTRDaMbqBgZlAKy86qsNWDCOgM9SSSus/Be8cE5VAGahxyzIQsdMEri364bJ2Itz
         s50w==
X-Gm-Message-State: ACrzQf1ztC5JA9tYxpv53Re3nJaLROZPP9bQLfRsE5Zm/H1QawpFeJuX
	4n+ETqy5Pbgif8gyi+UWfdwX7r+KoajIcg==
X-Google-Smtp-Source: AMsMyM4LNhaQTg7RCIN4Zpr/OkGIq/6hwFwIka3nBXtZpkbZKhIuEd+0tOCkpAOSm5f2DDLhge4lfQ==
X-Received: by 2002:a05:6214:27cb:b0:4ad:1a90:61c9 with SMTP id ge11-20020a05621427cb00b004ad1a9061c9mr14878750qvb.110.1663676283444;
        Tue, 20 Sep 2022 05:18:03 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id k15-20020ac8474f000000b00343057845f7sm824864qtp.20.2022.09.20.05.18.01
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 05:18:02 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id c9so3097895ybf.5
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 05:18:01 -0700 (PDT)
X-Received: by 2002:a05:6902:45:b0:6ae:ce15:a08d with SMTP id
 m5-20020a056902004500b006aece15a08dmr18526994ybh.380.1663676281670; Tue, 20
 Sep 2022 05:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220915181558.354737-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <3693a3a1-5a2a-4cc5-fb55-f6ad9a4b3f72@microchip.com> <CA+V-a8u87tqhC69qGD2zq_gT9jc_cSWd+NRn_u0bPTdmmk+j4A@mail.gmail.com>
 <e15f3e2a-2761-84d9-c5c9-118717e0bb83@conchuod.ie>
In-Reply-To: <e15f3e2a-2761-84d9-c5c9-118717e0bb83@conchuod.ie>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Sep 2022 14:17:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGD9s96JJafsYdfnPqvg6KLvmC9GUS4yjaaXi2hYrJYQ@mail.gmail.com>
Message-ID: <CAMuHMdUGD9s96JJafsYdfnPqvg6KLvmC9GUS4yjaaXi2hYrJYQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] riscv: boot: dts: r9a07g043: Add placeholder nodes
To: Conor Dooley <mail@conchuod.ie>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Conor.Dooley@microchip.com, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	heiko@sntech.de, atishp@rivosinc.com, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_051809_296580_5AE486F0 
X-CRM114-Status: GOOD (  29.68  )
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

On Fri, Sep 16, 2022 at 12:40 AM Conor Dooley <mail@conchuod.ie> wrote:
> On 15/09/2022 23:26, Lad, Prabhakar wrote:
> > On Thu, Sep 15, 2022 at 10:36 PM <Conor.Dooley@microchip.com> wrote:
> >> On 15/09/2022 19:15, Prabhakar wrote:
> >>> riscv: boot: dts: r9a07g043: Add placeholder nodes
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>> Add empty placeholder nodes to RZ/Five (R9A07G043) SoC DTSI.
> >> Can you explain why do you need placeholder nodes for this and
> >> cannot just directly include the other dtsis?
> >>
> > Since the RZ/G2UL SoC is ARM64 where it has a GIC and on RZ/Five SoC
> > we have PLIC for interrupts. Also the interrupt numbering for RZ/Five
> > SoC differs from RZ/G2UL SoC hence we are not directly using the
> > RZ/G2UL SoC DTSI [0].
> >
> > [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/r9a07g043.dtsi?h=v6.0-rc5
> >
> > For the RZ/Five SMARC EVK I am re-using the below files [1] (SoM) and
> > [2] (Carrier board) as the RZ/Five SMARC EVK is pin compatible.  Since
> > I am re-using these when trying to compile the RZ/Five DTB I get
> > compilation errors since the nodes dont exist (and there is no way
> > currently we can delete the node reference when the actual node itself
> > isn't present) hence these place holders.
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi?h=v6.0-rc5
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi?h=v6.0-rc5
>
> If this method is acceptable to Geert, this explanation 100% needs to
> go into the commit message.

We've been using these placeholders a lot in Renesas SoC-specific
.dtsi files, as they allow us to introduce gradually support for a new SoC
that is mounted on an existing PCB, and thus shares a board-specific
.dtsi file.  Hence I'm fine with this.

However, I think more properties can be dropped from the placeholders.
There is no need to have e.g. 'reg-names' and 'status = "disabled"'
(there is no compatible value, so no matching is done).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
