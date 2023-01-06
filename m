Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C342FC54EBD
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 18:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kcV4e/lXDsgA7wqjb8x/r/Xg2pR7kOJxN8FyktB6i5U=; b=N1jZqaXykd50lL
	BBHzzLzRH2mSAqk+R4wcTQmeIj1PUYRDauKR32wTtcnGSkS4bgtPtzElQLXGm3jkaV2RM9fMC+PUM
	TPMz7HJQ3JTLRZuvEeOVojM/VL4Aq/AzeqUO+hXu04VkmZuCUlh8mNrj6KBhUcCEoqzEF6xP4zr53
	p1arBIm2lRq4Dgap3EklDr2C+kIF+KmA3v15G/V/eXLP4v19JF0wWScQXV1Ym3d9nd7cpZAyLUbi6
	kmrM+5AHQQLjX9ZlQryQE2OxNrG9Mse7EpdAGitPZRtHtuO+8NZyP/30doIU72t9Z9rA6zuWecwEp
	cy/KyO6NO6asvq/W2M9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDruO-00EV6O-2s; Fri, 06 Jan 2023 18:57:40 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDruL-00EV4H-Kz
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 18:57:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id l26so1680769wme.5
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jan 2023 10:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEkrytvYO0Kgixzwv9PuoddkSJ/AseExslie7bV/gg8=;
        b=XvlebBkmccSZ4Wtc06NfVKZ3QqG3DFsombHDUfu3iiH15+CV4RSgypDQZ7XxQNuyuq
         GcxZszQg7V8bjlbfi0hTih6O3V8h+qCeBk6vTcMsuLzY8SmW3GASRtH7fR6zsMj0C7nW
         L2xzgobhVP1kGw5wdG4RvJL9R+S/SlGln44DHpAmn719JY0gkkIWTFB2LVlmXL4cO2fy
         KFk/hRsrXX1N1uXvT/5TW/RCOQ/hYg8VFgxf52Q78K0TrgdnRmjXbv5p6zzCcHbSn6os
         aszyTUnRczp2Tu1/u30hDo1bclvZYuKNiAq9pJYAjD7i2tCYSmC92KyPLmnZaqYaxA1o
         WQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEkrytvYO0Kgixzwv9PuoddkSJ/AseExslie7bV/gg8=;
        b=aI+ASrx/psCad6Dcx7i3IENLY9dxqEBJe7Pdj0APKxkb4QiL57u5g2KH0SG5JbkvOX
         quiQZyW5eS9kDhcUwrOjBq2hU3DtUimt3LDxwQz7njHV9OE2Z3E23gtSSWIlXrtzGYwo
         FnZRzkGY/JrEXo4/NMi8Awv7zMPM/k2bi34xVxoWI+wqfSyZZJnwXoghnzHrQY66GVIH
         V8NPzgW4dD71wQTFzxYtc3Aaoy9VtQ4u2af88fyhFvlVx77NTUiqBG7tnaUm3Bvm/X2a
         +nC/AhCqmltOWe6zJ2JB3A2MIAjPu69POYjkc0/6dwJyhD6/uBHZY5iVNO3IMFjRssuS
         xpuQ==
X-Gm-Message-State: AFqh2krA9f8hITxu9VRmL9/Nz/Y6YT6DSN5cWmkBQNTcCdsphCI6KCVd
	pPhRl0vEEjj7Np6yp+4Dpiw=
X-Google-Smtp-Source: AMrXdXssof9nprooU5Qdtkk2RP44RVZGyzbXaLx0Yy7Q3HpYsZuEx8E1Evx4wBJLinOJlyD3ft7TLg==
X-Received: by 2002:a05:600c:3ba7:b0:3d3:4dac:aa69 with SMTP id n39-20020a05600c3ba700b003d34dacaa69mr39890733wms.36.1673031453955;
        Fri, 06 Jan 2023 10:57:33 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:79e8:5b4e:615a:91cd])
        by smtp.gmail.com with ESMTPSA id d8-20020a05600c34c800b003c5571c27a1sm3162773wmq.32.2023.01.06.10.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 10:57:33 -0800 (PST)
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
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 2/6] riscv: asm: vendorid_list: Add Andes Technology to the vendors list
Date: Fri,  6 Jan 2023 18:55:22 +0000
Message-Id: <20230106185526.260163-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_105737_714806_71775398 
X-CRM114-Status: UNSURE (   8.78  )
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
