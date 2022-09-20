Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88980C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 21:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dRxf2LcW6S3sGIE257ZijSpr85jLszWwcNn15yljOLw=; b=Gkn0ANFWhV1AhY
	WejlM5lf/s3WpZglJJOJu3v1m+joXom0Evhbw09jh7Ov2RvK95KH2XHHqICMeAMEwhaig+lfH1qKE
	QrQbrnTwFYtcv/w9ElZrOk4sPdAXwWE661/8YBnk5hVzdip4C/WccptfyWnvrT3UOjgwQNlOUGYt+
	lDVGlwDYNJj+nHOHvTBcfzlDqSMx9+V375ur8EMTIB8IHnIOnj9p3LOitoMm67L0E7PjCVAt7ocPJ
	eL64n2InsACOaV4NH/gQuFiatn3NrlfxEBhMP925sfWfQXfLHt2H/bGOls02J7CjScY90ydCLP9TZ
	jIfLPEGdTkd0UKIBTcbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oakQ4-006bHY-4e; Tue, 20 Sep 2022 21:04:40 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oakQ0-006bEs-40
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 21:04:38 +0000
Received: by mail-ej1-x635.google.com with SMTP id y17so9198243ejo.6
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 14:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=LQKJvmVCX4rlGOfpYSKHs7yHs8plwdYfuIGRLcR33M0=;
        b=VIQDoyBGKzhGzQsobeQrVMEAFCPorZ0mbt1iKUUX8YCQ9Nm31UsWaLEhMuZkz8ZU6k
         oeQyg3z03Qd8841DMo3hnAKxYF41CS7MuNeLdFqNCF8jixRL5oSQCNJYwSKA/hDseHtU
         t09vJ1RNlqxvF0WLiAfRahLtIso5sy4QcDlr8551WQGIU08jk9hg+DGP2g2t1vMjAu9n
         v908BdOJGlAgf4SrY+EAJPOLuh48n4tWfiNf0pgEN0UUV9b5vKBaicMce8OkGdoZS3Gr
         pyIn4EgwrR4ZL2WqSMx9DHQN3lRMhl7GHvSPSStF0nLSMJTgVSUcPOEU55bw21jsE44i
         3+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=LQKJvmVCX4rlGOfpYSKHs7yHs8plwdYfuIGRLcR33M0=;
        b=Y3WTjBveaHYbWC3XSaWjbnDK30N+lHlYh6DFpdC0nLuu/CW7Z6gsKnZd7ndxDbnueR
         1tdS4ebtHQRFRVFeQwctdxme0Tf7jrkFa7X0d1qQq51dDrW7VPMHOoAYU4Ap3sCMnvcF
         W+/c+2pSJXK4Wfv0iiRznbXtJO6F8Ja7r9J6+4FAzjFDol6IFBASpb0/cMTuaCQ6Jsip
         0u2nrEqOTrMEHoCDpkdhqZ1aOrhfXMAceXHIug7LIz7/rxYqcRa+8nfbn122ZotEdyqw
         cocmWA3YLGCX4GumoGjUsuhYfWaZxw7KC/d20RofpftmRHCD11WEcq7iLb4sYYk9dYnX
         QM4A==
X-Gm-Message-State: ACrzQf1ZchZhkzi4G5+9syd4CtrA/0ScmQm9BI/ZY87gCZdF/7IQvyaW
	82CVssBQELaxL9ta7keXwaHDNbO/r5cKr+p2s78=
X-Google-Smtp-Source: AMsMyM7JokOCPlBoWvkF7CKtlvIFY7k7VeHz/+DBFNANwsdIaa9+wtHP74h8vZeP8b8D2W3XEgQajMWwmTNFmvwgHGc=
X-Received: by 2002:a17:907:847:b0:77f:f489:cc25 with SMTP id
 ww7-20020a170907084700b0077ff489cc25mr18164724ejb.80.1663707873691; Tue, 20
 Sep 2022 14:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220920184904.90495-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <YyoOv9Jx+h0JzfX0@spud>
In-Reply-To: <YyoOv9Jx+h0JzfX0@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 20 Sep 2022 22:04:06 +0100
Message-ID: <CA+V-a8s8Nr-RUabiLA5PhHLVQQxsBPpjX_7f7ANZoGGFfOGJVQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/10] riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Atish Patra <atishp@rivosinc.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_140436_884334_50A2A8D7 
X-CRM114-Status: GOOD (  20.54  )
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

Thank you for the review.

On Tue, Sep 20, 2022 at 8:04 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Tue, Sep 20, 2022 at 07:48:59PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add ARCH_RENESAS config option to allow selecting the Renesas RISC-V SoCs.
> > We currently have the newly added RZ/Five (R9A07G043) RISC-V based SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3 -> v4
> > * Dropped SOC_RENESAS_RZFIVE config option
> > * Dropped explicitly selecting SOC_BUS/GPIOLIB/PINCTRL configs
> >   under ARCH_RENESAS
> > * Updated commit message
> > * Dropped RB tag
> > * Used riscv instead of RISC-V in subject line
> >
> > v2 -> v3
> > * Included RB tag from Geert
> >
> > v1 -> v2
> > * No Change
> > ---
> >  arch/riscv/Kconfig.socs | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 69774bb362d6..5c420ed55ef9 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -80,4 +80,9 @@ config SOC_CANAAN_K210_DTB_SOURCE
> >
> >  endif # SOC_CANAAN
>
> I am not asking for a respin for this since no-one likely cares, but
> I think a future goal would be to sort the file alphabetically. I'll
> probably do it with the other 30-something patches my Kconfig.socs
> rework series has got to now - but if you *are* respinning sorting
> alphabetically (ignoring the CANAAN) would reduce future churn.
>
To clarify, shall I add ARCH_RENESAS to the beginning of the file or
after the SOC_MICROCHIP_POLARFIRE config?

As rest of the configs start with SOC and for Renesas it starts with
ARCH, so to avoid another re-spin hence this query.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
