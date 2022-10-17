Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2EEC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 09:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tl80LCwWy5wkA4xOeoDUI4tXVdBK79YO9bZEQIjUa+A=; b=GqFVrLINp44BMJ
	rYe4fGS8OdERjnWYFOKoaf9sROrie9q0A9zpvva64mgkPezmml8+KxOG0YRlqbCYIFlYd7wefNMKG
	bMQhP7R2nGZFzP0/hvZ5CFapUMwiP7xx2/MGDs1cHRQSLrI+nl3PUUd5Jiik+9LzJQ+JD7TNtzAv8
	abkoRC8JiQ1JHurhrtow+rfbbnFa0jhf+IKheP2baWL0XsYolPABIxyfkk8UTe9SkKGrrFANOv99L
	9FHhawQihe5ZoS+4lkHnSZ4ZPyddWfIaUfwDhv2oiPGEN0WwqwqYOBNvzV9IljN/uVWxLis1d5vRf
	8TsR9hufJr+4IZzloAsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMAk-009bXG-FM; Mon, 17 Oct 2022 09:12:34 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMAX-009bSb-Hm; Mon, 17 Oct 2022 09:12:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id bv10so17472156wrb.4;
        Mon, 17 Oct 2022 02:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uXahj3ItpGR0T2qFyurrngY0xMNOuQK04rAbGGKXwg8=;
        b=T1YEkzHbvBFPw6bVHeAtex0uCKQnDI8cVLHbej+rFZDjaj8k0w6de65Z/eZYN99O/q
         yRGdzP7R32VWRwcJy2R6jcIA81/wPVUBQgwXiqyvGU9ry/dpbdxm+3iPPPAwUTPcDfKM
         DxxtrA+m4vsH7dnp7ILArBYf1h9BU1S2uJmyqFbTYzm4rumhAkWBDkqV1y8EZpAI2gL1
         5bNKfbu3q4fQIjCr0MV4HW+Z1UJoEdzQRDOjw0NMUt0ogFpHRdIaR+MOzIegaojUqaLu
         e45zoL0+0IFBum2N4+0A1D8JZeV2fNPaiHvRjrpeDR9JnoIK7/0kKXMzQaWW7K2lXc3B
         S+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXahj3ItpGR0T2qFyurrngY0xMNOuQK04rAbGGKXwg8=;
        b=JKxRyZ4yRLuiBJTi/lgBRtUB2QECriRYMhalL/iP49wgxkryvOTKBAIGygkXAJZSy2
         n0LB0kz6wq5oWjhJRw0e068lxcJkTrrozeW6Egl5J2wGjX/Cuat7BtCrEajyMsh24gcp
         ZG+aa4FkrBDfWai7t1NrJAuf2C4bY4YyWjhazM2vf4thWOAVkCgoIGW3O879+v+ZqmRt
         n7Ix1qBhuQmGNstTXZF7IDTADvv7fYAQKwEehrv54roFkjooAJv7xmihuVsQNsx0rT0q
         19gTONZ8/R4cZHrcjDnIVN7pB6BVfyr4rdfss+t5RokSDOv2r61HBGcTeeoFLMBjOXUM
         ghhw==
X-Gm-Message-State: ACrzQf3VA36pU1jOrfV4kZTNlpRmYu219sVLC/fEn84deNm2tgZKAaLI
	ZCDbVRBQNdz/9Uyx20IjKOoJP209v8yXwg==
X-Google-Smtp-Source: AMsMyM7EgRpR3UtNzunxY9ssX+lJSt0/yeLT9iytC+8eoVn8Tr4Ffx7ttEuYsZLaBvGT8n3LJWBdwA==
X-Received: by 2002:adf:de8f:0:b0:22e:361b:6a05 with SMTP id w15-20020adfde8f000000b0022e361b6a05mr5773321wrl.311.1665997937143;
        Mon, 17 Oct 2022 02:12:17 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:fc4d:6548:d8bd:5bd])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d400e000000b0022ae401e9e0sm7921503wrp.78.2022.10.17.02.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 02:12:16 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC RESEND PATCH 0/2] RZ/G2UL separate out SoC specific parts
Date: Mon, 17 Oct 2022 10:11:59 +0100
Message-Id: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_021221_615115_1A27D4B3 
X-CRM114-Status: GOOD (  11.07  )
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

This patch series aims to split up the RZ/G2UL SoC DTSI into common parts
so that this can be shared with the RZ/Five SoC.

Implementation is based on the discussion [0] where I have used option#2.

The Renesas RZ/G2UL (ARM64) and RZ/Five (RISC-V) have almost the same
identical blocks to avoid duplication a base SoC dtsi (r9a07g043.dtsi) is
created which will be used by the RZ/G2UL (r9a07g043u.dtsi) and RZ/Five
(r9a07g043F.dtsi)

Sending this as an RFC to get some feedback.

r9a07g043f.dtsi will look something like below:

#include <dt-bindings/interrupt-controller/irq.h>

#define SOC_PERIPHERAL_IRQ_NUMBER(nr)	(nr + 32)
#define SOC_PERIPHERAL_IRQ(nr, na)	SOC_PERIPHERAL_IRQ_NUMBER(nr) na

#include <arm64/renesas/r9a07g043.dtsi>

/ {
   ...
   ...   
};

Although patch#2 can be merged into patch#1 just wanted to keep them separated
for easier review.

RFC-> RESEND RFC
* Patches rebased on [1]

RFC: [2]

[0] https://lore.kernel.org/linux-arm-kernel/Yyt8s5+pyoysVNeC@spud/T/
[1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20221009230044.10961-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[2] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20220929172356.301342-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a07g043: Introduce SOC_PERIPHERAL_IRQ() macro
    to specify interrupt property
  arm64: dts: renesas: r9a07g043: Split out RZ/G2UL SoC specific parts

 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    | 347 ++++++++----------
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   |  72 ++++
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   |   2 +-
 3 files changed, 220 insertions(+), 201 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
