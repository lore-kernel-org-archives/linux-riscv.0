Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C85DC04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 09:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ar3s/vfHHYrrS8wz4eGmjYh4W3lKfLLoweDoBQB4/YU=; b=4fJgHOKncIEsOS
	UF601BeTVCWYS/bd5iPsvenqe61vcOt3RKnj1cCTy+xLN5ACBu45PFawvaYQCsOe9gsE1a9XZXqgT
	BxdaM00CCw9ACX3m9GPjTWYy0qKA+9vqsbUvCJISRDKKEDsbIb2Xg+kN3yzK6rorAR5foO4YUiLXa
	Gy5z+At1642hvMrlcSfcT+mQYBznJAV4UOZKt8r1abEzOG57x2BLYxrnTG+w2+TFeu6mpkgDjTZ/L
	b9InZXFY+O44SIlldlnbm+pT/0DcTBPrD2sfLHP2ZU4Bxg4OkWztyIoA+oYR3n/EzGrId8oKMTk0y
	uhIAAWjQVZHlvy+3BS+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGd2k-00BaX5-Ts; Wed, 27 Jul 2022 09:09:27 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGd2f-00BaRh-D2
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 09:09:23 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-31e47ac84daso168784757b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 02:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LhOsBRxXhz/t+ynGnqroYsLAyuJRf45b+7ao/a2EGuY=;
        b=c7FL5tPiXWhbsDJZV/iYKyhXsFCX/uy+ALzeJHW7nG4yf+fPeB2Sq979Z7EjnlXwso
         Ks8EK0Dzk7FOkIfmbGdQQAGDXGKnSBTf8Tkic46zYcWQxKnrQb+EH9ci65YEO/4/awYf
         6gEu7zPxqln4XZJ2n8h4h04dV3TbIlSJaeNioctaJJ22eczAJzT88aRLvSWDaqjtoRhP
         Vwep7v+cxLjnEQC4hxv+F4/AGjEFzdPD8kxPTArdpjOpgWJjFqPc+EAp8ZkHQqYvMqAI
         3I/EZaxwwgyhSsJbHOQN51jrwtmwTccx0Zb7wVwzZcHPadMoKjqqY6pbGuL5bprxyDMI
         YMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LhOsBRxXhz/t+ynGnqroYsLAyuJRf45b+7ao/a2EGuY=;
        b=zss/ojzNN5H9dgyxs7lCvLjMHZ0/PD47Cqe7yrtK4cXg0MHQVvnfl6tNb9BKtaJa/I
         XhajhSrGtz8XuudiBV44YqGZiZSXsQlFhLkmp13a+YsAT7PaPwF0tH2wHaovjSFleodF
         x6BzMCJLLO6jDwkMzo1HckSFWbUWzIi+npqKKUM7J4qHe1nRNGArww2MSfn3U6eVYAXx
         YA44EWEcfxFHBmTnar72gd9403b2yP72dIb5mrVKTI1vLPZcRx58cAnzCJSAb8AYaWsH
         T+cIRou/oofLxow1+0vcTrBF1AQJ5V+5iN1rWVcNUbyldSyVq6YEE236VQ2KjJDyvswS
         /HfQ==
X-Gm-Message-State: AJIora+Rv6vEJ7Ncv2pPq6wczttd+87vZVFbiWmAR/UPxIUDTjUP/IS4
	Yl7x4Oy1i9XUvwsyKoKbaZ5rK0MO5R4UvKnfQRo=
X-Google-Smtp-Source: AGRyM1scO33sgcG8wgcvvA8weDtTskLR++MoDbmJLJDGl2d+NtRAl68cuEVh+81ylmZbjQ7jLFt7jVoQ2Veb6yn9hXw=
X-Received: by 2002:a81:1d09:0:b0:31d:a40:8332 with SMTP id
 d9-20020a811d09000000b0031d0a408332mr19291445ywd.138.1658912959232; Wed, 27
 Jul 2022 02:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <6a87ee9b-f944-ab8c-cc00-fd8bbb22cad8@linaro.org>
In-Reply-To: <6a87ee9b-f944-ab8c-cc00-fd8bbb22cad8@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 Jul 2022 10:08:52 +0100
Message-ID: <CA+V-a8uAcqGt6SP3jdJ9dPrV+rQdconfft41U+VdGXC8yFMByQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_020921_483017_02264CA5 
X-CRM114-Status: GOOD (  18.01  )
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

Hi Krzysztof,

On Wed, Jul 27, 2022 at 9:55 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/07/2022 20:06, Lad Prabhakar wrote:
> > Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
> > Single).
> >
> > Below is the list of IP blocks added in the initial SoC DTSI which can be
> > used to boot via initramfs on RZ/Five SMARC EVK:
> > - AX45MP CPU
> > - CPG
> > - PINCTRL
> > - PLIC
> > - SCIF0
> > - SYSC
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  arch/riscv/boot/dts/Makefile               |   1 +
> >  arch/riscv/boot/dts/renesas/r9a07g043.dtsi | 121 +++++++++++++++++++++
> >  2 files changed, 122 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> >
> > diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> > index ff174996cdfd..b0ff5fbabb0c 100644
> > --- a/arch/riscv/boot/dts/Makefile
> > +++ b/arch/riscv/boot/dts/Makefile
> > @@ -3,5 +3,6 @@ subdir-y += sifive
> >  subdir-y += starfive
> >  subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
> >  subdir-y += microchip
> > +subdir-y += renesas
>
> What are you building there? There is no DTS.
>
My plan was to get the initial minimal SoC DTSi and then gradually add
the board DTS, but it looks like I'll have to include it along with
this series.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
