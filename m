Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00582C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 09:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omGFHkBrYUfj5Ih+8on9C0aXmXSD9S10dNbNPBCIqV4=; b=L47/qegyKLt1+t
	j8dbqA6+wolbZ9r1vnlkN43L4GPIYyk7YtupaRO0i+1yBYdrWezntvOL9Z5lYeR/nFE2Bt7lBiXCH
	w0wAOyCsrZ8AIhU4IthLg7Fahfysl+2sgabMg6gr3u5H8cqc3b3u03xyJLxDfUh1PJ/jA20rZJ9V9
	tmHPV7gXagHXJZVkCr9hG+Xn1cl6iZ5ZfS/AVJcj8XvaXxF/muHjhtba8is03G/y7/2JarGuPhIRd
	DlIjBe8alS0uYLXLCDRFPIIDyhGsxntl3c2ZCXTiLNWNaAA6CJiRcL4xlbiXsihCilza6a72+dGnp
	x2UP0kxqPdgytVR7lv8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohpIX-000ES7-Et; Mon, 10 Oct 2022 09:42:09 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohpIV-000EQW-1H; Mon, 10 Oct 2022 09:42:08 +0000
Received: by mail-ed1-x52a.google.com with SMTP id u21so15082007edi.9;
        Mon, 10 Oct 2022 02:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6+VUqgiuTjQeU7l/kUlUaXroa9OGkZIBVKyyM//tCkE=;
        b=cOlIQVEPtsG0/kS92o9AAxQRvGADlegSQ8wMhpusAZLn/yq6ZeAZvk5NUIH98Cm1dc
         ez1l5+ixbepOhoYD2hHYoRkHY7OX/oJeFwwOuHCfk+syJUKWrmzQXPD4KZS3Sb6Ahzz8
         nmMyQSsdd1hZ0tEOESMtoa5/UXcLtlujg82xYx9mVSx6OzQ99H3pY8O1LdRi76ud3DCq
         r6WudUjHXXTMmrFcFFeC+Tav2r8dai0EEdNia0uLalEgz9NoOLQjGEKZYnkk2Jh3VP5x
         hcTrlnRq4vM27T38cOqY/5vy82whi3VQxHfQSYjTVk5oh6pIhZGd3xkVUYVMlmZgU+g4
         CSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+VUqgiuTjQeU7l/kUlUaXroa9OGkZIBVKyyM//tCkE=;
        b=qtn1CBwYzjEmML2MC/0MUvsvVvphZiSiBZiAMlgK+nI9jQTOF9urBx0L8qDuZsxIG1
         JWt1RbWvaIOLk5R/uz8ahBXd78XKNvbmgrlm39ATnzyPTaI/AcJ0S4kqS66fE2uNR94j
         LFUbMZCmaTJ7crFH0Z53N6NIPG0KeIujP7GiUykNg6ghHiXhL9DPbBQL1NzWm9ThPCEr
         s5gXt4xIZo2wC0BT+roVWMFvmklmIJ1TtN+AOiVZxoGpPqI6I9duomY3VjkZ24MvygDF
         fefXkZQcHKBhpbL/xGYgUAP63eftdhCsE+hpUF/ZelYrKVcNPZX9HBQpc398EtxryTUC
         F0Ng==
X-Gm-Message-State: ACrzQf1jU02Tuq6N7rYTpYiJB0/5/sHiee1QJDrpjOax0P0oT99jTBvY
	b9vR6KfQpFNX99Di03/SlzSfRrrIPMuEXiS3Yu8=
X-Google-Smtp-Source: AMsMyM5uf3VBi7wDQS52pr75/TL9qL/dFM8EyIsrXPwepN7iHNubY9D8z0yViEy8YHNOHkmbJ1lJGMTwWDU1EbB6m/Q=
X-Received: by 2002:a05:6402:40c6:b0:459:6749:9e1f with SMTP id
 z6-20020a05640240c600b0045967499e1fmr17085133edb.319.1665394921761; Mon, 10
 Oct 2022 02:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220929172356.301342-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220929172356.301342-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 10 Oct 2022 10:41:35 +0100
Message-ID: <CA+V-a8vD1+kbby8rbZqYv2Ux1GaT=7n7V9qHJS3Djv-fKdWrAQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] RZ/G2UL separate out SoC specific parts
To: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, DT <devicetree@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_024207_114920_E2A3E177 
X-CRM114-Status: GOOD (  19.46  )
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

Hi Rob, Krzysztof,

On Thu, Sep 29, 2022 at 6:24 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi All,
>
> This patch series aims to split up the RZ/G2UL SoC DTSI into common parts
> so that this can be shared with the RZ/Five SoC.
>
> Implementation is based on the discussion [0] where I have used option#2.
>
> The Renesas RZ/G2UL (ARM64) and RZ/Five (RISC-V) have almost the same
> identical blocks to avoid duplication a base SoC dtsi (r9a07g043.dtsi) is
> created which will be used by the RZ/G2UL (r9a07g043u.dtsi) and RZ/Five
> (r9a07g043F.dtsi)
>
> Sending this as an RFC to get some feedback.
>
> r9a07g043f.dtsi will look something like below:
>
> #include <dt-bindings/interrupt-controller/irq.h>
>
> #define SOC_PERIPHERAL_IRQ_NUMBER(nr)   (nr + 32)
> #define SOC_PERIPHERAL_IRQ(nr, na)      SOC_PERIPHERAL_IRQ_NUMBER(nr) na
>
> #include <arm64/renesas/r9a07g043.dtsi>
>
> / {
>    ...
>    ...
> };
>
> Although patch#2 can be merged into patch#1 just wanted to keep them separated
> for easier review.
>
> [0] https://lore.kernel.org/linux-arm-kernel/Yyt8s5+pyoysVNeC@spud/T/
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (2):
>   arm64: dts: renesas: r9a07g043: Introduce SOC_PERIPHERAL_IRQ() macro
>     to specify interrupt property

Can either of you please review patch #1.

Cheers,
Prabhakar

>   arm64: dts: renesas: r9a07g043: Split out RZ/G2UL SoC specific parts
>
>  arch/arm64/boot/dts/renesas/r9a07g043.dtsi    | 362 +++++++-----------
>  arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   |  87 +++++
>  .../boot/dts/renesas/r9a07g043u11-smarc.dts   |   2 +-
>  3 files changed, 235 insertions(+), 216 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
>
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
