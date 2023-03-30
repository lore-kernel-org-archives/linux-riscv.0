Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4871FC7619A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 20:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CMF2ysoVCsb3VJ0gF2JfmAr9ESiHXsRPjwGffsRRnOo=; b=DuwkEGlFOsfD91
	SerLAzgRF6ttcKQ287KrDRny0m7iOCiZiZ0g2kVWPi+a2NC/W7z6aEdsHrjFqabjLvNld3BwBbVCP
	5GwQptr4b6EPigum7TpSt9gDNeqcD4ZKG35L0x6kBEDvVkGlo+p/YofU9SSt86bWtVOcVxdvl21Z/
	qf73r+YMypbKwALyUuuO+ZQwQfdz6SuDfyeAVifdbrwJfB0dQeM7nNF+QUXlviARMSDkkpnWWRfQB
	BwLpW77thrIIXEpAdP3VJchrLb6M4rf2Wy7C6DiJcr/JA8kC2qKYVv/ZAfHh2juWOyrxWqpRziFwN
	M0+BTFx+8F2otBONtZpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phz6e-0051vm-23;
	Thu, 30 Mar 2023 20:42:48 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phz6b-0051sh-14
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 20:42:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso12624316wmo.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Mar 2023 13:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680208962; x=1682800962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7kxFEuDvqvRsu/15YqHcVl/pTqu+171A8GL2tXTVtE=;
        b=nekpz3TVzSg19iWdmhaU8wFQz//KdLZ1tLIPifgqOIKPBqc56TEbYZERbamq6zeqB4
         J4TfE3JyeVi/m2nUGwDC4Yt4CvqDziYoQOyLMRqfAVAnghdVKplKpnoZbENB9yXg1e9Q
         nnAqSqUde+6lVADQKlLsZG0Y6JD6iIVhuxrLevzxmilHaAZyMhXA7Oe5VBO6RJJtA8W1
         dySWTg3pC8j05fis10Y4YjGBsNnxL62+yLk1emP0SLIopZoMDylYMGs3+ujxtb0ojaU+
         0JODgnX27CODaQ4Lir72dZmoEJeCFgLjjKFgYxPSXwefHo5F7oy2nH+EV/unujA2EQjK
         0DTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680208962; x=1682800962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7kxFEuDvqvRsu/15YqHcVl/pTqu+171A8GL2tXTVtE=;
        b=cmptPMcRBm08tcyqHHi6meSIA8tJ3XmeWZPAQrQhgUxKHUQy2a4iPX5DjLYyMbUsdf
         vGcHEeKpSb1s1jEMaTeiyrjnIfZhSdxy2OpuRGPX6pSEumwonTpBQP1knAqTO0jE2QUX
         ErpVHONRCfS5qjYF5Ms3l+Dg3X7H77S3+75/0yDdhrbJp5bdzHgNFEBsXqMqRt+WaPcD
         QWg14cVig4Ii/xxgm8OFWLw14eaFA8bh361Fv8nZA7R9XrepBSXhrxEiCN3oI/zSIzaV
         nt+6ANFRdkEJMGL/PuKfCLt2S1G41x6XGedM/JLrwBw77e4bb4p+gaMui5vrSpgC4Yt2
         N7XQ==
X-Gm-Message-State: AAQBX9csI6Hph4hDibCyULvkYHHabOJpNK7d5KUsQozTgx07kQVQPjc6
	6gaf2FliheAsyCBDXgKBu7A=
X-Google-Smtp-Source: AKy350YExm3QsmDb5bKqs2Q8NH9RSHthiIzr4tXraGH9J/z7WwEbDgWlW7+6BcMnPHzhbkypOpBl1g==
X-Received: by 2002:a05:600c:220c:b0:3ee:3fd7:5f85 with SMTP id z12-20020a05600c220c00b003ee3fd75f85mr5007343wml.11.1680208961876;
        Thu, 30 Mar 2023 13:42:41 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:30f2:5b7:ab32:c3f])
        by smtp.gmail.com with ESMTPSA id v12-20020a5d4b0c000000b002cfed482e9asm297981wrq.61.2023.03.30.13.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 13:42:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 2/6] riscv: asm: vendorid_list: Add Andes Technology to the vendors list
Date: Thu, 30 Mar 2023 21:42:13 +0100
Message-Id: <20230330204217.47666-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_134245_369543_57625B1D 
X-CRM114-Status: UNSURE (   8.83  )
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

Add Andes Technology to the vendors list.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v6 -> v7
* No change

v5 -> v6
* No change

v4 -> v5
* Included RB tags

RFC v3 -> v4
* New patch
---
 arch/riscv/include/asm/vendorid_list.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index cb89af3f0704..e55407ace0c3 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -5,6 +5,7 @@
 #ifndef ASM_VENDOR_LIST_H
 #define ASM_VENDOR_LIST_H
 
+#define ANDESTECH_VENDOR_ID	0x31e
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
