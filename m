Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D47C47DB3
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 15:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bRhKLFjKDRj+As5JeqwaY6N7Am8EFKTvRCWqRVYPN8Q=; b=Jiu0AYoDSKAhgc
	KdJPkf341Hzz2xHcx6UmsQzePJSvxipSZQc090skKW6c2v2yuwU7fXsprUZzjx3BUOzjtT3+gVvx0
	LiXWh7ijXB7hDuYBb9BlkmkwkM6pcT4gGglImJKSLpjHEHYd5VofAnZUnNc/CiylFqmaQIaMGbb0Q
	OSfMTYXtY9m+x/ToQ1DmjfRS5vgTkNod7/TsMxWve8tJk3WcOdPyiYCmCZBF+4VJ0BdgG1ZLnwWxB
	VjDlOwUoetvTfYnGAjl2RwjbWiamRCezBuk88etfoUZEzL0WojEzfNWJR1GA/v25po92xhi/k6E5d
	koiJCx5kGaI6cRdiHGuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTN9-0000000DE2M-49Xo;
	Mon, 29 Jan 2024 15:16:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTN6-0000000DE0x-3ZSa
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 15:16:30 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40e775695c6so25311365e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 07:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706541387; x=1707146187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BlMepFvcNokAhr6dcB9591xxdL8lwl4Op8N8VH8FV0Y=;
        b=b9xXTdWBb/1TXh4XlQDKBBQoCLKOvIz9ai6muFBbeLbzkmgsPbUuWiluo3ikE4xhYc
         hN/1/cFTOGXQ/0dsZ2TlQXcFzUcltUcB4V7u3TGgaawjsgHSFgTPB6mCp1NtPzk751lN
         aNyqyXJqWlQG6uQItD98+ZsOz8MEpv2ERqj4J9yKbYf+eKd09CCitLjNJiBAiHJ1U3ap
         uukKU/MsETr30KWpL6omOI3oqHOqli04t459fwdV2d9a5TkYKe3jx3ThlkaKd7Rt5cvv
         1bmqi8S+frW/Pj7Uh2etnteDScPRSunwhDRQlFHkRE64HIkAd2r1Frn0VrFwnAHC+kvQ
         7TZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706541387; x=1707146187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BlMepFvcNokAhr6dcB9591xxdL8lwl4Op8N8VH8FV0Y=;
        b=sIDx0WtXe9JnL8VfZb4nW9j5LNwHxo9r/XVekc3w0+gpdLGEqBaOCp/OMIm4et8U7d
         EsXmiY2ha2mKccnLPrl2QiE2kxYzEJO68hVjHyup0EMwvmcQLUA9/D3aTRRHRhrBorX2
         1L/S+WZxaFYBVoF0iiNNWvHes1cfshgZaWoBV2mjCOKXFNouXjwiwZUcfli3k8v/GhBJ
         8vskvgQoV3r6vh+E1XrFOB4/S2nkNb8FiI+4IwUhQR9/ZNv14qsavjAG/arGN3b1WnY2
         f2UrkbGr3uYMn6riovpLrIEX1lzqd9X5w9aBHNnseWNrCMUJjMPCYH6/uh4ZwA+/V3zw
         CPSg==
X-Gm-Message-State: AOJu0Yz7muWh79ymt4KSwAOu9SZTsLJVqwvOD4tMCeUVZ2sbruYOEiO0
	spUI1bvNhA3xSj6jP8yE9GVb76F6NwJgvlghsFDCAwz/YKX6QWEX
X-Google-Smtp-Source: AGHT+IG8u6AlgJhTdcVceOQs8uggWZYdkfIwd2mlmvgTfSMVf0Gxx8DqXCyGTBKtRenyr+Cw+lv1hQ==
X-Received: by 2002:a05:600c:4507:b0:40e:f632:723d with SMTP id t7-20020a05600c450700b0040ef632723dmr3177999wmo.16.1706541386860;
        Mon, 29 Jan 2024 07:16:26 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:5616:a18c:ea50:2995])
        by smtp.gmail.com with ESMTPSA id h4-20020adfa4c4000000b00337d4eed87asm8397774wrb.115.2024.01.29.07.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 07:16:26 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/5] Add IAX45 support for RZ/Five SoC
Date: Mon, 29 Jan 2024 15:16:13 +0000
Message-Id: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_071628_919364_027B2657 
X-CRM114-Status: GOOD (  12.13  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

The IAX45 block on RZ/Five SoC is almost identical to the IRQC bock found
on the RZ/G2L family of SoCs.

IAX45 performs various interrupt controls including synchronization for the
external interrupts of NMI, IRQ, and GPIOINT and the interrupts of the
built-in peripheral interrupts output by each module. And it notifies the
interrupt to the PLIC.
- Select 32 TINT from 82 GPIOINT.
- Integration of bus error interrupts from system bus.
- Integration of ECC error interrupts from On-chip RAM.
- Indicate interrupt status. (NMI, IRQ, TINT, integrated bus error interrupt
  and integrated ECC error interrupt)
- Setting of interrupt detection method. (NMI, IRQ and TINT)
- All interrupts are masked by INTMASK.
- Mask function for NMI, IRQ and TINT

This patch series adds support for IAX45 in the IRQC driver and enables this
on RZ/Five SoC.

Cheers,
Prabhakar

Lad Prabhakar (5):
  dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document
    RZ/Five SoC
  irqchip/renesas-rzg2l: Add support for RZ/Five SoC
  riscv: dts: renesas: r9a07g043f: Add IRQC node to RZ/Five SoC DTSI
  arm64: dts: renesas: r9a07g043: Move interrupt-parent property to
    common DTSI
  riscv: dts: renesas: rzfive-smarc-som: Drop deleting interrupt
    properties from ETH0/1 nodes

 .../renesas,rzg2l-irqc.yaml                   |  27 ++++
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   |   4 -
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   |  76 ++++++++++
 .../boot/dts/renesas/rzfive-smarc-som.dtsi    |  16 ---
 drivers/irqchip/irq-renesas-rzg2l.c           | 132 +++++++++++++++++-
 6 files changed, 232 insertions(+), 24 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
