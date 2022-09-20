Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E680C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 18:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ly1KHz8bnlz36p8u5VMCEp+tcoJt7fCYx3lqok4G5tU=; b=lrKjV/auTZorCE
	v9qLMQQtgqVW8nFAnTlS+PzjdxOPM9epo6J97bd4rwplCfHtM6qNaDhDdpWgERikSUja9eVuyvQdX
	053j+rBamIOOzNKARHbMY5AEu2vN2uhr6FQ9bMXl0GMDRbgMQBiBxN1VU2KPue7s91izdhOtH3GMc
	25XvwfjwzPp+zJLh111T3Q6zS+2j8VxwrHmru8BE+JP+lj6OVC9Zi1XIrzq/n3WHXmcjv26nT4LMt
	S37/zO9fFqpal6em/c3ku01TRTMIuSvFbdURzRscCWV7AxG4vDgz2J+QKe3clCEaLyzgtBCCvte6B
	ECiD6CNBNYglfGX58sUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiK5-005pXz-Oq; Tue, 20 Sep 2022 18:50:21 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiJy-005pRQ-Cl
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 18:50:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id o20-20020a05600c4fd400b003b4a516c479so2336720wmq.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 11:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=i0mZzaQm6+l7tL7CHpRvjbgnVX+wPMwIm1qv0xCs4s8=;
        b=OEBmL0IbJg2zcJRYGPljfxLtxYeL6YJrqrfndtFclS9FAIyhmaJZ3zl8/WfjaHw8+z
         L/Kor5vnC1+IiEtHNY5L5EgQEIw4JLedb9pfqwvbBIXFemYh1qmCl9xE2rIdOw6wWkOr
         qP+ZkR+s/GM4xSSoIVS+WKm055sWd0EKPa/UsajIpCR2ZxzfQvE4Rl+aQDAVBUe4KaR3
         RicMais/DYLBk/nGCQzYIalPt+PjtSSje0B+JlRlQSMcV6L8EwB4cITUTDYrycdm2he/
         d9HdFj++ZOVP2rLb8xukP7Ao1aXtVI+Ys2LhId86b9dFcSjx+WLjWX3bup+OmtNgYltn
         0WAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=i0mZzaQm6+l7tL7CHpRvjbgnVX+wPMwIm1qv0xCs4s8=;
        b=0qqR9hYPionh3LG51VNFuErg9adMEHzsuBjS5L94dezsly30y14M1FgSe7+j40Yi5O
         zkNqIYzgQRr2Jj9vOY9jH1rRENcj4meinWbhRMd3yhl64W1JZ4kQHaGB0U3zQMTJ5OA4
         dsmLcSX2hazBILcjYe6/LlYIR3zMJCAlPGQULDk4Sc+QVW5u51MdWocQ/b0pqX9SQvWo
         MGknARfTGWjF7Snmf8iNseQ5khcBAw9YyAE+E/mkaDyTZB2eLGJ9KcpcTz4Dzp3afhBr
         GaQ0dkG2Th6456FeiH9UWhoo0yadyEsaKRrdtVs9kLbXkrPyi2cSrfY/+m8iUqIFWIL2
         oJ8w==
X-Gm-Message-State: ACrzQf1s7hgoPj0HcbOCzeeuG6D9LIA+r6HCcdgUS/bQhtpO4EUbU53O
	BbCGt7nlOcZ1cYYOKub4He4=
X-Google-Smtp-Source: AMsMyM52d4NzTqDtmW2Bvy/qewCqt1i/HUIQSyOLLldvhyGClnlQSHpWhiIESwW5LglFU3AM1rPD7A==
X-Received: by 2002:a05:600c:5028:b0:3a8:4349:153c with SMTP id n40-20020a05600c502800b003a84349153cmr3433382wmr.130.1663699810715;
        Tue, 20 Sep 2022 11:50:10 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:e9a4:d6c9:505d:20d0])
        by smtp.gmail.com with ESMTPSA id cc4-20020a5d5c04000000b00228de351fc0sm582722wrb.38.2022.09.20.11.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 11:50:10 -0700 (PDT)
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
Subject: [PATCH v4 02/10] dt-bindings: riscv: Sort the CPU core list alphabetically
Date: Tue, 20 Sep 2022 19:48:56 +0100
Message-Id: <20220920184904.90495-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_115014_485276_D68D23F2 
X-CRM114-Status: GOOD (  10.36  )
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

Sort the CPU cores list alphabetically for maintenance.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
v3 -> v4
* Included RB tag from Heiko

v2 -> v3
* Included RB tag from Geert

v1 -> v2
* Included RB tag from Krzysztof
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 873dd12f6e89..2a1c5ae5b0aa 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -27,17 +27,17 @@ properties:
     oneOf:
       - items:
           - enum:
-              - sifive,rocket0
+              - canaan,k210
               - sifive,bullet0
               - sifive,e5
               - sifive,e7
               - sifive,e71
-              - sifive,u74-mc
-              - sifive,u54
-              - sifive,u74
+              - sifive,rocket0
               - sifive,u5
+              - sifive,u54
               - sifive,u7
-              - canaan,k210
+              - sifive,u74
+              - sifive,u74-mc
           - const: riscv
       - items:
           - enum:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
