Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249CDC6FA89
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 18:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/0eGE/2gCgrMul18A3uG5wlf09vuk60gy29kTJTjgc=; b=wZYwCn85pM36DS
	evSCTKNlok/+sYUct6Cwu8oxfr9ovEs5B8GmRsOoqq/mTGBVMci5e0kmrvp9usVwa+fjrW19E7PIq
	2HVNRmPn2YD8VZjx7Duy17fEoDANAAAFqSGjElukbznNeyVac4JXVpaFmC5Zb2B55XxHqq+zhAYsv
	AD4JuCKFUj7rQ7mzyqid8ODxyDNCDyBPjmEOEEqp5+CGgwGH/A+gzKCM1eECphQ1Pp1Y5HDdsZFZ8
	fDNYxKdbp9FXoEN0XD3lDvt9NF5/Bl6J0AVqAzcUZfkHFOlkJMBI1XIszN+egVNA3cuBeOe1K3ppX
	KgBpCn/elEEBPFFkLTCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQe-00FU88-CV; Thu, 15 Sep 2022 18:17:36 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtQY-00FU5w-GN
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 18:17:31 +0000
Received: by mail-wr1-x42e.google.com with SMTP id h8so25148253wrf.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 11:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=VByNharHGLanOsbOdnpEOJCaC2XQblJhvKILKud7IVA=;
        b=CNodDYGGDRF3F57AByDk6llGUtw61Azz9Xq6nwQaUhcHiZ2tazzJDQ7qUf/62wrxMQ
         cjMEKadtZLluRnMFQ2beQJ0rw7DLn30gjdXrZaZlsrLS2439dcwXpu8yOFb1czRz3ZbQ
         Ea+kbhjzm+Lo4TO3W2VoaJ4VdISG3aO/b2n/MZSjDxnh7Ng+Ox/lPvFpoQAZKyt9In8z
         VAZRZhuPsHDxcThdULcmiMNVpBeukbHO7hPaVJckfAsWDklyGKwKmnrU4isWfvHRv0VO
         VQtnc/X1KlZ2RL2Z6ecXc6qKLL+aMiui+kh1rvNUgKSnwe6k9jYfM+Ovao0ve9LoMVeD
         xbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=VByNharHGLanOsbOdnpEOJCaC2XQblJhvKILKud7IVA=;
        b=YscBO8lGkGdHzXsZU9qh7WDzb5ETlDbdANZtkgYN4weT5lDUO0DI+xwTZnkwLejMDd
         tviPQRejIrURCo7+fCixi8TWs3OY04M58tid2pOgtSLfSX78lgzEaJvB8ADiYxvWMEHf
         UNGJjbmw8F3G2Xs8e40b1tqYJM1oj+HaAnPaYOpnYH1EJVWDZFgimwRwFDqWWJwkEVMH
         xdXBCrM7lS1HLcSqEzMPJ+1buVSdO1+m1r73MnpSTWtIZI2Mdh57MF5hYzcsIPWonrf0
         rVYWuCpITftYrNoU2/Ju5c67/nxzUyFTOaNuA9g4STBmURgNskr8YXr4rwya/+pRG/JY
         bW0A==
X-Gm-Message-State: ACrzQf1xFADMnvLuW9P5/yjE/NG+ZWdY0HarKrzVEAxCK1lpXC2UEoX3
	W1/jW+jJtEkKs2lthqREYVc=
X-Google-Smtp-Source: AMsMyM43hky2saxYh9NecZIEnEeUAsq5+QGjHuAYvAfC9WBt5PlYgNayB8FrH5f1QV3njyHRioEy2w==
X-Received: by 2002:a5d:5150:0:b0:22a:43a8:145b with SMTP id u16-20020a5d5150000000b0022a43a8145bmr636108wrt.170.1663265849318;
        Thu, 15 Sep 2022 11:17:29 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:d411:a48b:4035:3d98])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0a4b00b003b47e8a5d22sm4243151wmq.23.2022.09.15.11.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 11:17:28 -0700 (PDT)
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
Subject: [PATCH v3 03/10] dt-bindings: riscv: Add Andes AX45MP core to the list
Date: Thu, 15 Sep 2022 19:15:51 +0100
Message-Id: <20220915181558.354737-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_111730_562980_760C91CD 
X-CRM114-Status: UNSURE (   9.53  )
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

The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
Single) from Andes. In preparation to add support for RZ/Five SoC add
the Andes AX45MP core to the list.

More details about Andes AX45MP core can be found here:
[0] http://www.andestech.com/en/products-solutions/andescore-processors/riscv-ax45mp/

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
* Included RB tag from Geert

v1->v2
* Included ack from Krzysztof
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 2a1c5ae5b0aa..1681767790c5 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -27,6 +27,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - andestech,ax45mp
               - canaan,k210
               - sifive,bullet0
               - sifive,e5
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
