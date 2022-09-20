Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF04C6FA90
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 18:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfG6V9UVxw2Ouei8BBoKCQWgquPCG0GZYr0bgfGGpPo=; b=bMZUCNqa3Qqhg0
	LxErAHKRRUvQESZ2IP0qyxLRA8OPze1ASTtskbvH2N28YKLXwFMpyej+LVbiCVmHroIChsvnBhVr1
	p11s0tngVJyLG8jpGu55u1LD71N51HsFTUIMEpjvnVcoU4vLgBhDQK9X3agXU2/WL7w48y//o5RqX
	hGpZq0oJR6E/Plhtvfat7eohRTlxl+xuaN6FjnEp4oe9VVcPsSicw+qucluil3aBON0sZ4KgyLCi0
	O/XWnYSNNEXVbKzGq8imOevKizopIdj+j3qBBGeK3NXM0pZlesCdaN3eOTtvAH0a9egPUfh7JIUGx
	VOMijHMwIsbP3jFMrnjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiKF-005pdr-1n; Tue, 20 Sep 2022 18:50:31 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiJz-005pRk-BI
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 18:50:17 +0000
Received: by mail-wr1-x42e.google.com with SMTP id s14so4007249wro.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 11:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=PvYfwd2nPuMUYkxu6YqzbYYwaZvTVZWZRcfAOAojG1g=;
        b=XvqfCxUWw7Ob93m1pCW+Yo3ZDVF8JTbPLKM+69O0aP8qjXz8rQoXy9zm9mAboPkuDs
         wFptWyweOJhrxbhrsloM2xwYI2b8pGPhzbIxJKL9X0rvGNf3z/VJ5eD7WQyzGxSran5c
         fQlS67sZZUYeAtrT5VYuopmyaAASMcZ7EPQPoNv0ugP8hxMAE7OCuM3Dlkq1ocROp3VL
         d2Dn8OGyXQTMi2gbGPBg5lgtDlwyDqdO05ohE9Hv1gdkt7khCjd+3Xwiv2Enr6C8lf9r
         mR3vfwHlK6h837Oe8tchU7jJLWdFYrhsK2G8MW+yQbzVuS20p/1LltM5U+1vwCo/VQI/
         rRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PvYfwd2nPuMUYkxu6YqzbYYwaZvTVZWZRcfAOAojG1g=;
        b=fEmHcVEhCHYba7XIo3MGRPzRHiqsVojmNrHpfQlP7wEy1BMph0RvLzxWbmTRO4xmO9
         nyy1xVUZkBl+t8aNBaQGCkYN/J+kEavW8ZEoUhv7K7/b1wugD0k/b4NUqa+BTsH3l2TH
         MwWPNC3nJDgtg90gLC2krKkul3WKtkM/N/3emufUm6B0TZ3p2h1Pm5buZcm0dqYjMWNC
         rMozgYTCw3aWHayEdzkObOz4Cq/XEeJ7E4GHWlMYqHZk3lOUxq4UEs4oN7Wz6ZMPEInO
         3kAIEfdplLanuLwnWk4Lvx+ZHUxcyBx7SRuzVY4WAOsomnTLTfzvMs+NdndR6w4Lg33p
         3RlQ==
X-Gm-Message-State: ACrzQf0zCj1ZPzhUJOyOHJkEnaZB7ZshOI4hdkGTo/26Zes67nNbEuKh
	aHnsn0apuv2qLOQlkRMjhUg=
X-Google-Smtp-Source: AMsMyM76OQSXwK5sY+9A35aBFOAgfcDsYqF2PChfuGlLLSZuTZZv7QbLJ2jvApEs1oRsa52efQYETQ==
X-Received: by 2002:a5d:598f:0:b0:22a:f77e:869a with SMTP id n15-20020a5d598f000000b0022af77e869amr9719128wri.357.1663699811661;
        Tue, 20 Sep 2022 11:50:11 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:e9a4:d6c9:505d:20d0])
        by smtp.gmail.com with ESMTPSA id cc4-20020a5d5c04000000b00228de351fc0sm582722wrb.38.2022.09.20.11.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 11:50:11 -0700 (PDT)
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
Subject: [PATCH v4 03/10] dt-bindings: riscv: Add Andes AX45MP core to the list
Date: Tue, 20 Sep 2022 19:48:57 +0100
Message-Id: <20220920184904.90495-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_115015_427572_C2346F86 
X-CRM114-Status: GOOD (  10.01  )
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
v3 -> v4
* No change

v2 -> v3
* Included RB tag from Geert

v1 -> v2
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
