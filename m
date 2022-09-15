Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E19C6FA86
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 18:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IDCkItETNLwAsTOLqr3g1CXOg7IhU6Jxajxn5UvT5s=; b=RAzddcvGY67BCC
	AapUzjBn5fqnozMjiYmeKZJZ2nZepxpNQyZwcsoJxHniagPL9mMJ7QCJOrAu/Pmv4MftXcSx0M3et
	mxzgTYS0QdocwPKMaIHv7qQa+23kXn6uwKY2irOSUCp0ztQq0ha3RCtYDjylRx6zG4X9jpkYMGAe9
	Rxj+bawQq1NKX/BhC9IQ0GnCsD3idf68lugs1dDEYBd8krdipA9cWKboeF/sY7Ohvm+NMtYddKYIK
	vAWjKL7B1tJyJyeWTTZ30ir95BOUsvC9OQBXZd6SADbNegvxOkC3CU3r8cf5YK8aY1fdFDGIQ0W6p
	BgXsy3QZQj+9ZyAqrtSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQh-00FU9y-9K; Thu, 15 Sep 2022 18:17:39 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQd-00FU6j-1f
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 18:17:36 +0000
Received: by mail-wr1-x434.google.com with SMTP id cc5so22279881wrb.6
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 11:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=DlfLNEnJzkppJftCUUhFQByphbHbOmAnWdcgiohRW60=;
        b=hM0I9QdqQtIUxR1qSRvsjFP2FzHyMjgIs+Ic+QKjwiZg/1fs8IwOb3pjMsL/OqwJ8l
         Inqnkukb8OvL2yqEynuvwieYpmgh8DDxvEUcCbqNSyf3Xd10mw2vlq4tMAIp1R3ovKfj
         TunWBD953JGKSahmnTCq2I2QCocacbvER871aKS4Twb44HwhdvDmI6LpCU/+OsrzE/7i
         qG5MUo6qBQj5zl+8/pSDwwnqIdnJkRZ/b+/EG6sOhPn55aD7WNY70g7t6rJ+epxdW7HJ
         LNqv8iOfzmfV6jIJZcJtXrSrnmsrt3t/oE1Sj8cjGHVmcZOlaDX5+ZZ66iK2oyBwDa/H
         RF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=DlfLNEnJzkppJftCUUhFQByphbHbOmAnWdcgiohRW60=;
        b=X8j0SZOoNw7KCl84U1dFrp1+DB/+PgVoken2EI2eU8ja6Wz7uGbKklG/+10rFU+rfk
         2WdGrii1GX6S1EfijBeZM1ZggDdMZNA2LISX2xfgtyrXnZVQ4+IiU7nT06p0mZBD+D4t
         M++LKjljcL+W7tWPMOAitB8IwYkjd1gl6ZC/rG3IdPIbIqA+hc/+h8DOLj3Rf3iDIMO6
         GxdhUP2m/+c9f/jzAMyg27EqxLtnZJmao5mygmlS00PttEsv8In8tM9D6/TyTmq/2JDe
         RXzkoTn7Q3W20H4IY8q8ipR4kOn6nEs/YVhIslhFAoQfaLlM6twrpfK6xeJHEbXfVnKZ
         TWog==
X-Gm-Message-State: ACrzQf2J36Fpv7ySbMeJUVbgP/K/R2UilIsX+5kD4bAUdqC0aUFBQGvV
	fhQVmSKw5m1GiLFIsbhPa7U=
X-Google-Smtp-Source: AMsMyM72fYaxbw/fQj9d07nNHvdmzMbmevob6z4j1zFc2p/Qm9ONBBcoYLu19erjaE+mJ0Qsua3FWg==
X-Received: by 2002:a05:6000:2ad:b0:228:cf8f:fe85 with SMTP id l13-20020a05600002ad00b00228cf8ffe85mr649664wry.94.1663265851515;
        Thu, 15 Sep 2022 11:17:31 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:d411:a48b:4035:3d98])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0a4b00b003b47e8a5d22sm4243151wmq.23.2022.09.15.11.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 11:17:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 04/10] dt-bindings: soc: renesas: renesas.yaml: Document Renesas RZ/Five SoC
Date: Thu, 15 Sep 2022 19:15:52 +0100
Message-Id: <20220915181558.354737-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_111735_114693_9984286B 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

Document Renesas RZ/Five (R9A07G043) SoC.

More info about RZ/Five SoC:
https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzfive-risc-v-general-purpose-microprocessors-risc-v-cpu-core-andes-ax45mp-single-10-ghz-2ch-gigabit-ethernet

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
* Dropped "(RISC-V core)" comment
* Included ACK and RB tags

v1->v2
* New patch
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index f51464a08aff..34050e7be637 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -431,11 +431,12 @@ properties:
               - renesas,rzn1d400-db # RZN1D-DB (RZ/N1D Demo Board for the RZ/N1D 400 pins package)
           - const: renesas,r9a06g032
 
-      - description: RZ/G2UL (R9A07G043)
+      - description: RZ/Five and RZ/G2UL (R9A07G043)
         items:
           - enum:
               - renesas,smarc-evk # SMARC EVK
           - enum:
+              - renesas,r9a07g043f01 # RZ/Five
               - renesas,r9a07g043u11 # RZ/G2UL Type-1
               - renesas,r9a07g043u12 # RZ/G2UL Type-2
           - const: renesas,r9a07g043
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
