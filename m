Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43FEC38A2D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 08:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nP5pstzongXDmT74/2qHlrhYy61Oz/Z4nZnG/267lTg=; b=F90/c/5YwMEPIC
	Ec5gVHgqnah9dv8j+ADYgf8GSFBMXyFjEz37c0duZ4NEuD0OuHkJtWBMkG1IzXzhlv7YSAc6nc+vL
	qR+5vaTULH9BOCb9sUpvFD8XEwKOkNnC+9KIeBJ7VUPGoeVv3LldaXPQPf4Al5qKfzhGjeKMlqznh
	m8SXRSc6eUCr+e6pYAxJHKWsl3XndqTVvjDoa4pAakNRjFBJw6XEno1JsTWQT5LrdVtbBqgHiHqRm
	3w5wzIYMFqz7zoDZCruwS2wb/QoGYGKOlpwgAw43Vm04Vhil2X3C/6eN+bA1AnY/YBLp7p2qBa7hM
	rXNe459lV6vDoK6vLWJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ony8S-00CLy8-NU; Thu, 27 Oct 2022 08:21:08 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ony8H-00CLwB-Un; Thu, 27 Oct 2022 08:20:59 +0000
Received: by mail-ej1-x631.google.com with SMTP id fy4so2380195ejc.5;
        Thu, 27 Oct 2022 01:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yLZb0eCEmPbt6XCImQLnWXa0g/D2mdCPENmM5h+0jwE=;
        b=BllIFPs/F79nlMLuFBJOgtM2ZQfMVvi6XS/8ah6Tjyu9Vq+Dm4PguQPqRyc/Cv67a3
         2PgTJZgqqNZbMRSJNVYRyW802BW1hkPwPggbWsOjdfSKUw6cw92OJTKu0R4ifOnoO5DT
         heWxsIXcTPSrE7IKJGumD+szEYrf0qE+hb6dfuzy4/pz8N2AWH3xyYavBOwZFKRXrIsu
         9JNpo1l2rz3KCYxARfdsxCFdbVknGjrAN63uYEWW80RcC17keEhk4P8FEep0OVpORf2e
         mLBbqLZRYY2LBzgfWisFsKHl5B4Tu6jufyHns8YurJrRwicDOOGDqbJv+6CVEt0iGSzJ
         SE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLZb0eCEmPbt6XCImQLnWXa0g/D2mdCPENmM5h+0jwE=;
        b=UvSiXPtPTtJK4A3OssOaVoxYkv04v2IxasmWZJo1eF6t0CYWyrN+/E4PBuuewUxEDI
         H/RimiC3cuyvKZbfP78Yb5Rb5mWVF0lir3WCKVuYqTk0oOEcQRTdu8z0SA6d09r/Omna
         4DjfrkNQOjwGqmkdk0FqO5FZOW/sWfDCThhnfl9BdlgYtjEUuTkqMUKG43ln3owlrdOd
         5SHtt4h5PA3YsuUc3dEennCn/qLDrL/yz43EZAr4eR5au+XWGP7BpesWT4AdYximjuAq
         TXlsOxAd0yP00eBPIgqVV7BZtpIkla5Ez+R9VP31gG5/pqgs+qQ5lyWFkc9QXfsMQ5At
         K2jw==
X-Gm-Message-State: ACrzQf2Mu50jF4JwiPyfLiZ8xsUtUCfC20RfWLhTUsvWLNTqggvyqBGq
	+fD2fC6BCFcIBYjtsWGhu5+cCWPqbjYROXbx/3HRLbAC1/8=
X-Google-Smtp-Source: AMsMyM49+SK4g8rI8Gl/M2IN/uHmlHyw2onhRC25Y/4JSKYZfGwLi0DI3dmFQymh9tnjoOsDrWoUXSmVKKL0amALrhI=
X-Received: by 2002:a17:907:b1c:b0:797:983a:7d97 with SMTP id
 h28-20020a1709070b1c00b00797983a7d97mr33693456ejl.267.1666858852484; Thu, 27
 Oct 2022 01:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221017091201.199457-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXuiCne2NvCzu8x9LeM_W8rxwLX-0w=kHnGa30bdzFaDQ@mail.gmail.com> <CA+V-a8tm18pckkbquK+HHxV2tHAUTwdKZjwWOAiGS-GKKtbQsg@mail.gmail.com>
In-Reply-To: <CA+V-a8tm18pckkbquK+HHxV2tHAUTwdKZjwWOAiGS-GKKtbQsg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 27 Oct 2022 09:20:24 +0100
Message-ID: <CA+V-a8tK8qQHNnwgvUiMMHOuBfVmbLyMvT4RZjq055nrda8yPw@mail.gmail.com>
Subject: Re: [RFC RESEND PATCH 2/2] arm64: dts: renesas: r9a07g043: Split out
 RZ/G2UL SoC specific parts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_012058_033949_5F460C4E 
X-CRM114-Status: GOOD (  20.57  )
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

Hi Geert,

On Tue, Oct 25, 2022 at 5:13 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Geert,
>
> Thank you for the review.
>
> On Tue, Oct 25, 2022 at 1:37 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Prabhakar,
> >
> > On Mon, Oct 17, 2022 at 11:12 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Move RZ/G2UL SoC specific parts to r9a07g043u.dtsi so that r9a07g043.dtsi
> > > can be shared with RZ/Five (RISC-V SoC).
> > >
> > > Below are the changes due to which SoC specific parts are moved to
> > > r9a07g043u.dtsi:
> > > - RZ/G2UL has Cortex-A55 (ARM64) whereas the RZ/Five has AX45MP (RISC-V)
> > > - RZ/G2UL has GICv3 as interrupt controller whereas the RZ/Five has PLIC
> > > - RZ/G2UL has interrupts for SYSC block whereas interrupts are missing
> > >   for SYSC block on RZ/Five
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > This assumes the operating points tables are the same for both variants?
> > I guess that's OK.
> >
> Ive asked the HW team to confirm this. For the v2 I'll keep it as is
> and later move it if required.
>
Ive confirmed with the HW team the OPP table is the same for both the variants.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
