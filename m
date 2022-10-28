Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB362ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 17:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHXv3m7voQW5rIMZVnRVMY5SrNPa2QnAO4dhh5Z3NZg=; b=vPqX6IWCOXkJLU
	sRp0tTRbKoLM4MOVtuRsUcXuq2d/69sv61jrTYu5xZgxFXHNpu5cx9qG9PL9Y1ieGmndvBwW9P3U9
	X6JhD/Lx4Hr6LahnfonDSXlMsvD1mITKyJEpW4yT+mUSFjwNJ0yvMQx1h9YyqDd9avlXZ+O8baHMd
	FbJI3w9zXI/LUc/pBMWiI76R5nFvAUGwxXjUQQqKOQVKY8ENrbLacICNad2g75m/QkPBglQnVKf9n
	u354pGKGOuWgcOm+js60PlMT3p/ZG6/rLblsdk9L9qkR/EHVkGraeSxpmfCbVBA73r09dYXHI0hxK
	di/f4z6aQ+txsrj0O51Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooTBj-001Jhs-Ki; Fri, 28 Oct 2022 17:30:35 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooShj-0015hB-AL
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 16:59:38 +0000
Received: by mail-wr1-x42b.google.com with SMTP id y16so7379204wrt.12
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 09:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Ku5lF3CTU+uK+oU1JYQf2lS5QXHn/wjM4We6ht5jRA=;
        b=HWshL2JJrihm1Gcnitlj9oBwqZbG7dBrNPu2swm/BttlGesn2PbwoludpIRmUqu/c2
         u+0/lEsEtreics+jk1lNEkNPjhSw5mGVmG2QSDOHoxlSEz0ifhRdpu4uWhF+MEkjtmq/
         04vDzTVzawaOTdfjoJuDrVR2oY9jHtBU3HBPCDwVkjFC3f8Dxqhpj0AVZSQU5GfS4j5R
         FPi6r3ZTA9vXDzWqsawkQMZ7ubdJBKiAP11uCgLSxDvzd4O99NaZaFOPers0C0iGlf8U
         m0ETAFo43FIj0Cp/iqz/bCurJahrqxEnLcpf7SlMoVldil5UWxZPIp1Cv89lOrUMzzPF
         HBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Ku5lF3CTU+uK+oU1JYQf2lS5QXHn/wjM4We6ht5jRA=;
        b=seYsF63rlLumjV9JAqNwyttealSvQo65ANz7ov0be8Yy1xAvALBCzrMBEzSxztDFes
         TgmrnDTecsPTkpaw1BNrucJs/OttkeCyB/2g+pPFX4jLRdS0tBIZI63Ie7od2lFhWFNH
         Q4zJ416WvArtjYEWqt2+6b0AeCPlGf41zD2Kankzuzxwz/jWJ5sv1AJi9cEJDNx9UqmM
         0/oumtnhsbt8W7Vc5ShWh0MrGwL3XEEvXQsPaXuPGoCXCCUzbpAdEKmaM04yaEMM+RSp
         ZHKrsbNNApyZxUlN1/XPsHQw3pQHU1K6/qIznkwZaely8pblTriaCQvWDXieCqQu7NbI
         3zOg==
X-Gm-Message-State: ACrzQf2P5AImINVl7ja1DM1CbK2xEW0H5zFWEC21cmeq7M1s8aAYQreM
	WG8hNnlL/h6rIex3GYoSi64=
X-Google-Smtp-Source: AMsMyM7YfKk37OhTqU4Uwb40+Crqw2aD9y6NIgO4b4+pbNGOImXNB90OVt2tI03m3Zvh2mLQC+OLRw==
X-Received: by 2002:adf:aa8d:0:b0:236:588f:71f with SMTP id h13-20020adfaa8d000000b00236588f071fmr170388wrc.205.1666976371539;
        Fri, 28 Oct 2022 09:59:31 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:d53b:eaf9:15f:6a8a])
        by smtp.gmail.com with ESMTPSA id h2-20020adfe982000000b002322bff5b3bsm4939689wrm.54.2022.10.28.09.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:59:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/7] dt-bindings: riscv: Sort the CPU core list alphabetically
Date: Fri, 28 Oct 2022 17:59:15 +0100
Message-Id: <20221028165921.94487-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_095935_469861_57FE67BE 
X-CRM114-Status: GOOD (  10.21  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v4 -> v5
* Included RB tag from Conor

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
index 90a7cabf58fe..ae7963e99225 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -28,17 +28,17 @@ properties:
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
