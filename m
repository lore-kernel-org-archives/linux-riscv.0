Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F908C38A2D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NIKn2Dlr5rwJbHEASiAkVJz2aiyuRihVRkPE0JR+l28=; b=JritZti7RLAPBb
	u2Oo4XVy1loEpuJ0SD5qDNFiYnxBPZM1Zr31PaYBkO7dS+IK6wQ/GI7ijIlDyFl6NaWJomoTgxUZR
	nnDk5NFex6309HUI/Xb4ruWNqsT4atwIGAv9G3/sMUt7/ykTTjJCfzXtBHeGexAfvrGpXOtUYyfqf
	Fzp7KY64ElbQZ/rodmarq5CwmS43oJHdSckrMCk7RZmJqi3gIGLBeJNVXzXiwD/9sZrvf810THc/J
	6fesZDUk1xP1Bm3VYxzFntgSYeW/NVlCiurwZXO94AGAZ63iNsYbnlfK69P1mgYB1IgHo7vsYocbZ
	ia+QqwGBZ1VE9INTpxNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onMZ1-006Fcj-Dz; Tue, 25 Oct 2022 16:14:03 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onMYp-006FYL-0b; Tue, 25 Oct 2022 16:13:53 +0000
Received: by mail-ej1-x62a.google.com with SMTP id k2so13893230ejr.2;
        Tue, 25 Oct 2022 09:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8k5UyCJg2NMPP4g60YtwffYqOC0aHgrkKd8pUxsWhgY=;
        b=owRTX5/ShqCDoM8DYtFu07eYMwO7yrFql7qZ690fVlPcCRqqcGQAJXFI3ewpdN3F/e
         n7rU+r3Lt0GIXJ1nacsBmjYp+fiZv5KD2U3M/hCJ1qCHu3FOYfodErRQv3JJfwmZtgC3
         oMMNX7BGcndu5E1gXP6U6nPojUZo2FhkaNeIXuazK3oyKKnarISJ/5mPrfaUPYtVrCEN
         5G0ujzTL6j7tNKHfM3yNKn49i7p5gk+yV0Kr9PTAdFFJd2mLLVgadtKKdE5+ra7I20z1
         ctP++yM9vlyiu9v4C8dqnTc6Ov6RZQKvVF6oG1vndty9jsIXU3jj3hPwo5ARAwN9M2X9
         zlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8k5UyCJg2NMPP4g60YtwffYqOC0aHgrkKd8pUxsWhgY=;
        b=5kxdDXhGeJjXoV6VcEIvhW1Q2fePy9x3gJGJyWe3HeAnsDUjx/Yp3Wc3C4JDtVc1f6
         z0aXYzHsegH18aeS6k/VqpM/gv0r7Uml7mmMFJICartldLeyIrnAP9O91+d9zcA15QzA
         gHSviFlmOhR9bDUKBi1iC4M9Aip9p4JX+FLSwbjz7mF3MC9wO1OlOLIyACJ3+47KhEfd
         90neY6dA8iQWFXbVIxY+r7QAIf6My705wqstZe3nA7b3safDgzR8l+huBLTKd+bYTKun
         OlEAcjx9b4mLkxmg1rSHbGhWYCk56c5QFMSYcKAum0fgrnNO82euSdqItpDA2BetQzBF
         wt/A==
X-Gm-Message-State: ACrzQf34U1K8INrk0FthqfYjpBxzMOviPlj/DdRvmamClmATSy5xCpp5
	bCxK1s3hrR7Ssh3s4Rn0x82Z23vF4khhgKTpVNM=
X-Google-Smtp-Source: AMsMyM7emL6MbHVHmI1HuBgGTnzWTCjyKfPkCHMUYmk40cRiSKsI1GbMCGWs0NZiBfecUTAMefnzbVLT4+u2uByPAGk=
X-Received: by 2002:a17:907:847:b0:77f:f489:cc25 with SMTP id
 ww7-20020a170907084700b0077ff489cc25mr32981078ejb.80.1666714427234; Tue, 25
 Oct 2022 09:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221017091201.199457-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXuiCne2NvCzu8x9LeM_W8rxwLX-0w=kHnGa30bdzFaDQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXuiCne2NvCzu8x9LeM_W8rxwLX-0w=kHnGa30bdzFaDQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Oct 2022 17:13:20 +0100
Message-ID: <CA+V-a8tm18pckkbquK+HHxV2tHAUTwdKZjwWOAiGS-GKKtbQsg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20221025_091351_075510_E74CE4B4 
X-CRM114-Status: GOOD (  18.51  )
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

Thank you for the review.

On Tue, Oct 25, 2022 at 1:37 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Oct 17, 2022 at 11:12 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Move RZ/G2UL SoC specific parts to r9a07g043u.dtsi so that r9a07g043.dtsi
> > can be shared with RZ/Five (RISC-V SoC).
> >
> > Below are the changes due to which SoC specific parts are moved to
> > r9a07g043u.dtsi:
> > - RZ/G2UL has Cortex-A55 (ARM64) whereas the RZ/Five has AX45MP (RISC-V)
> > - RZ/G2UL has GICv3 as interrupt controller whereas the RZ/Five has PLIC
> > - RZ/G2UL has interrupts for SYSC block whereas interrupts are missing
> >   for SYSC block on RZ/Five
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> This assumes the operating points tables are the same for both variants?
> I guess that's OK.
>
Ive asked the HW team to confirm this. For the v2 I'll keep it as is
and later move it if required.

> Overall, LGTM.
>
\o/

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
