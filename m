Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52607C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 18:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgHYf9zc3VqPF7Qr+u6VHdsWsF2vHDcl8VdVpwHKNfo=; b=d3JQbybC4gIpWZ
	bISJG3d771ZQyOaMxqyY+XJsPBZtRhWWZdGKFzNqtqUh+35FY87fLFafHtrVqirms233wPBCcJleU
	eIqiiK7ILzuqqWeC2Woj+FWAG1U1bnx86ZW6wyIEqdsDCYS/56grR/TUE68Ysf2xFkEhJxzHV/d+7
	SOKTlk8Pu+j0oRfOQKCxi32dtZNIWqQe2ZpOR6pfIvR9U/4zkbOUjyzSAbFLqud4Q1zjgeesXj/7+
	gbe9SzyQP2sreDk0GhbraFyj7rXum/We5ZplR42H10qQZiSM0EUZ0xhpEFRy5EveissBfKL3BqX1D
	+Q2UvOzPRY2k0y3jOZSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiKB-005pb7-JH; Tue, 20 Sep 2022 18:50:27 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiJz-005pSF-73
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 18:50:16 +0000
Received: by mail-wr1-x436.google.com with SMTP id z6so6000170wrq.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 11:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=PIml5h9yfGZM8hFj0DM2cpSK5N9+Jc9EevGrYn1++vQ=;
        b=LR7YtcMxhe3P0sEoEbJcH+IkBqrOkuc6o8e6zFaIH3s6hCMkvbaoX0KeIil8ejenWE
         jddSYjFaJ1eXffm98pgu4B8UsyZ3805SytCXEvlU6HFY19IQ7wytoXQTYtdMNXR4Y4Uu
         UF5heYpMAZWUxTsPfNc6mi7iecR8SCO5gWsBBj9bx6hDhVa7XaVvwM+PjpYm+xPqH5gS
         pYjljuCUtbgOc9W5YnW7gRo+HwpDSbwKNODmxr3vhnfntwpf4hKvY30l7Wu7TuprisUh
         i4Kd079fwNxBqMniHL9S35KyW5pU6OA999s+81FLD1xOQhNKhq2NDzXlh2ISaDAE5aJL
         9c8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PIml5h9yfGZM8hFj0DM2cpSK5N9+Jc9EevGrYn1++vQ=;
        b=ICtuabqbbfNjUtDQxc7uPGnxkP8v2RT+Qy70JbkTpgzHo+GiIcATCM86xdj/kz0Kx/
         BKRKDb/Sc/Am36yJnuTb5SAVXZuHxiUty5VfJlpZP7Bp25YvLBhpUrTYNv9eNn5SjR7x
         66nG0m8sArC6iZbmWo1tHVImtFPJ874lGQV2qu2Omn9dIdKqwcaYNEArNKpBCBJsE11n
         nfdDoWz1iAnj4q3+TY+cy7AL7c0Z3IxREcJ41zu+NcGPwijSVJMQSVKLMea8zlzbhSxc
         PgGbDoMQVCGHQeHLgiuWhGpBi8IRP7h31K/yHPzD29kvzyuT/1cbUdW+OS/mhslxGnBX
         QmsQ==
X-Gm-Message-State: ACrzQf0V7slGMqaNLp7A7ZHwI+r5U8WgIiZZYrImFZ6J4K5/pAqre2Hi
	C2LqkyeJiwLsEHZU/bv40TA=
X-Google-Smtp-Source: AMsMyM5YuEsIkz/ZbwCy+LfECoAJ6wOTpSpMRW2lh6ErlpsbZS7wKSEoBVSfZwsTS9ij5ivNi33RTg==
X-Received: by 2002:a05:6000:1689:b0:22a:a66d:1f37 with SMTP id y9-20020a056000168900b0022aa66d1f37mr15201522wrd.197.1663699812700;
        Tue, 20 Sep 2022 11:50:12 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:e9a4:d6c9:505d:20d0])
        by smtp.gmail.com with ESMTPSA id cc4-20020a5d5c04000000b00228de351fc0sm582722wrb.38.2022.09.20.11.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 11:50:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Atish Patra <atishp@rivosinc.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 04/10] dt-bindings: soc: renesas: renesas.yaml: Document Renesas RZ/Five SoC
Date: Tue, 20 Sep 2022 19:48:58 +0100
Message-Id: <20220920184904.90495-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_115015_302525_EA451366 
X-CRM114-Status: UNSURE (   9.94  )
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
v3 -> v4
* No change

v2 -> v3
* Dropped "(RISC-V core)" comment
* Included ACK and RB tags

v1 -> v2
* New patch
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 07c5e6ebd5a0..2789022b52eb 100644
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
