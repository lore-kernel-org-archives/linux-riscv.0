Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A245DC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 19:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SAlOrCHY3UXCSgyr7mzkC1vctkQQBZBuK/nCXdGYmKc=; b=rSt+3cFlYpDWGk
	azSljTSh78L+P4qx66avoyHIibHdpdLsWniCcAB+lPDfKgnH/1p8fCz0+TIrwBjuNR9e9Vn3ozRqP
	wuD6GQS6hLXTZC+5wt3HrzKTykuOtK7PtKFVcN0bPmu2o0I2IW5LwsNCZBCJsDSZ7OuS9XSgzw/Xr
	OkkTjda3OWbzXwfK98ynD2ZhVtmIjFI1fpXzW59kAQkIdUbr0Q2q41S/Oa/ER/xPptWSNLrdyfU9O
	zGPWv0MTNWMx8Igw38eOvlJhSE1DqZOuTV8di2FSjqzGN40rQ93VIJdIQEPHr2lU8hV4YkUg9e9Kx
	DF2bMcr15SecMukdFhpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oigyF-0095Aw-9q; Wed, 12 Oct 2022 19:00:47 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oigy9-00957t-TP; Wed, 12 Oct 2022 19:00:43 +0000
Received: by mail-ej1-x62c.google.com with SMTP id q9so35408222ejd.0;
        Wed, 12 Oct 2022 12:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kjhsuI/Z6GQOe2e/zNEe4d946JQ/hFUZIJZDiMDxcZs=;
        b=bNLW2l8ZMkxoyhYaq/Mh1uMqzXmJxJtVWWJVYc7im0ysg8sZLPjdPL+JqnFO9w6yJL
         8gA8FKterjujW3nNQ1TK8O6+q/qiZ5TKcUN+TwQo4qBthHSuRknFmXe37lSwUWA/qN6o
         qpV6/4+nz7C+B/DJ6vYCbcmNrDHEMXeaqc3Hok+m4aAwU1ttq67pZ1J11niOlgrJMI5e
         IsIrmMwQYxWO5EavIq8r6ueId/+VBxRd+UDClg2ci/LC5fU1FWjWomcGY8VDjNFytlb0
         ZzMgJfMqilLz+ACVZ6MgDEF1FEaAK09pz5xZQ6OO7qzyNFS/XfcXT99oSs6lCRS13R10
         WVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjhsuI/Z6GQOe2e/zNEe4d946JQ/hFUZIJZDiMDxcZs=;
        b=RE0vfZvxs83ESBV8wD/JX0X/Tc78/S0BlsfHpnGNMeNn+QTjvuh9fO3HMi8Ey0QEvf
         nQFeIl2uIINjICrkSVmkdBfan97anQj+YBQJBTp8W8QRj7IqWwL/cnxYftpD5Rl9xbwM
         lXberB+HWSxMQCnzI5sY/ysqAeaZ1XThh5N8PoYbhYM5ZzsXixUWtcEqp8P+Vi6g/5hH
         pPOp+D1baQReQ4URY4kjkj41rUHvHaWQUghRYUWAuvVGI74+rknOvvW6xb016dCuru+u
         QYPH+2SXvy7i71FLFxPWgy4dqKh6u8lidZtB7icEkjiBPWLDm3ZjybvH/dVGDdSNNjLK
         gEYQ==
X-Gm-Message-State: ACrzQf1MmwBVqXuMXFwhSXryKC+HTzP9wQt45e8hSe08ACMff8/AMvQg
	vNtX1Bu6AaLLM39zP9bzgqPWJIQ4h2WJpKwWJIE=
X-Google-Smtp-Source: AMsMyM4GRmbcLMxX+m/5cASM72GTHHI1Fm/kjxgLgJL5/pKlhwbCuKt0BVYY1gUEJsvJuYijKhRBe5x/wZc5wD8GsFg=
X-Received: by 2002:a17:907:b07:b0:78d:ce2b:1999 with SMTP id
 h7-20020a1709070b0700b0078dce2b1999mr9976482ejl.267.1665601238329; Wed, 12
 Oct 2022 12:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220929172356.301342-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8vD1+kbby8rbZqYv2Ux1GaT=7n7V9qHJS3Djv-fKdWrAQ@mail.gmail.com> <57e454f4-6767-bf42-8337-ce1f486137ca@linaro.org>
In-Reply-To: <57e454f4-6767-bf42-8337-ce1f486137ca@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 12 Oct 2022 20:00:11 +0100
Message-ID: <CA+V-a8sfhHeFa=NAUvZH+DDUjRbdFoCqr4itiYHzxv_jSY9HWg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] RZ/G2UL separate out SoC specific parts
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, DT <devicetree@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_120041_993509_CBA34241 
X-CRM114-Status: GOOD (  22.31  )
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

On Wed, Oct 12, 2022 at 4:38 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/10/2022 05:41, Lad, Prabhakar wrote:
> > Hi Rob, Krzysztof,
> >
> > On Thu, Sep 29, 2022 at 6:24 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> >>
> >> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>
> >> Hi All,
> >>
> >> This patch series aims to split up the RZ/G2UL SoC DTSI into common parts
> >> so that this can be shared with the RZ/Five SoC.
> >>
> >> Implementation is based on the discussion [0] where I have used option#2.
> >>
> >> The Renesas RZ/G2UL (ARM64) and RZ/Five (RISC-V) have almost the same
> >> identical blocks to avoid duplication a base SoC dtsi (r9a07g043.dtsi) is
> >> created which will be used by the RZ/G2UL (r9a07g043u.dtsi) and RZ/Five
> >> (r9a07g043F.dtsi)
> >>
> >> Sending this as an RFC to get some feedback.
> >>
> >> r9a07g043f.dtsi will look something like below:
> >>
> >> #include <dt-bindings/interrupt-controller/irq.h>
> >>
> >> #define SOC_PERIPHERAL_IRQ_NUMBER(nr)   (nr + 32)
> >> #define SOC_PERIPHERAL_IRQ(nr, na)      SOC_PERIPHERAL_IRQ_NUMBER(nr) na
> >>
> >> #include <arm64/renesas/r9a07g043.dtsi>
> >>
> >> / {
> >>    ...
> >>    ...
> >> };
> >>
> >> Although patch#2 can be merged into patch#1 just wanted to keep them separated
> >> for easier review.
> >>
> >> [0] https://lore.kernel.org/linux-arm-kernel/Yyt8s5+pyoysVNeC@spud/T/
> >>
> >> Cheers,
> >> Prabhakar
> >>
> >> Lad Prabhakar (2):
> >>   arm64: dts: renesas: r9a07g043: Introduce SOC_PERIPHERAL_IRQ() macro
> >>     to specify interrupt property
> >
> > Can either of you please review patch #1.
> >
>
> Why? This is a DTS patch, isn't it? You should CC rather platform
> maintainers, architecture maintainers and SoC folks (the latter you
> missed for sure). You missed them, so please resend.
>
Mainly because we are using the SOC_PERIPHERAL_IRQ() macro while
specifying the interrupts property and just wanted to make sure the DT
maintainers are OK with that.

Sure I'll resend the patches CC'ing ARCH maintainers after v6.1-rc1.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
