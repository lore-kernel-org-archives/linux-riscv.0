Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE422C001DB
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 20:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CrLpJkad6CEATrXt9SYMHohNQVnPeRDpYhLwo/VQVUg=; b=CdGUIPtuJvOTlx
	cZ88G/9eRpnnW5pu+VBLSocUH235kWDqSCJ9OWU5f7z/aVhGUEveENJk5pmrNjRv+k+SMizU2Wiq0
	9jOKoAw09mvuE5SbQp97GJzuyIjwISny9hvDPce5ucl8GlnnQ2oRZfGoys5GoKRsZsd1s6F71qjv2
	CHdULY66OOw6VIexM4tje5LJfp2sBepU98aKP9osA+vS7MiaRett7/mTvUY/WAxBNZC/5m++7hLTH
	BhkOjK4xJAcB89D+/vOGmCSZtS/25HtUAZCSOrmS3NMlFS7x5ZKl0ARkK+qq3koU7Cj8vlSUb0D0/
	iqhbFRvEc5rnmQJPDqHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVeC5-000I8K-0O;
	Mon, 14 Aug 2023 20:29:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVeC2-000I75-0z
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 20:29:39 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31771bb4869so4450308f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 13:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692044975; x=1692649775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phGWQqQcUgpdnM6txJP29u6yPK67tIQiA1bCjq6RfTI=;
        b=TZi0hYLN362cjsZT1oNEzmhRnBOccQDBG0Y2mUBeEyo9+omFOgNs7ZKt1Zy6yRNp9P
         WTPnTBE9ktmy45z2SgdLdeEUNs2Ii50+16AWo7PdV0jIKpw6CSLj61BaBIot/UjbeWof
         utdsi/V6UDr85zbvxE6sgzrV0JPuNFBZy/SRI3t8ZUrTbpBlXdjwrRfSXU1QdTUQbwn1
         qAjrnsmfAx9zisuh+1gkweC/Ku3zLlGyiGzB1grpyZHdCwyIFvaLfCIySqHVFsYRATeg
         Q22bk235+2rC9v+7MG+zKgfsMrZWFYRpXXGRah2jgDCCrAZ8xJMDlLbSIMzpENsG/3+K
         wL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692044975; x=1692649775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=phGWQqQcUgpdnM6txJP29u6yPK67tIQiA1bCjq6RfTI=;
        b=Z/zBttyzFzjeV6pLJHQdJjEXS+tXQ8OJ14FRawaJj06xSb76qvuWOIodh7wbSoeBT8
         QNZzRlMemCkaPGOIHMg3+C4TrUHAiY2aq4un+uisXNFf/uTnxP7ue8qdmXCtZ2Wx6Xja
         yIZkLA7DkSjuZvwxsPK1Axw24N55TUBMeflftBqlHe7/ZlP4XUXsUcdHU69IEtAZTT6L
         SUlZ63+XFcBQCPNz/Fl+PBhNxybv3+O0seId8DhMFeWnQgTtAWhdvmh35fDoXXb9ehM8
         TibsRxdr4SsBrUmtkv51NabEMxmOMl2rCtpv/OIOd/x7TEDIufz/eozWbY8HIX5jRlMr
         l3NA==
X-Gm-Message-State: AOJu0YzK9eR7nWBRHaxx+ePtYakcEi8GMaAmc9UE9UTC0c821opNm45K
	jDiW7BMt40/S29A+dyt8FKw=
X-Google-Smtp-Source: AGHT+IFUyJg4cY4seE25ARQXiaapGP7j3LA7z8+pdyjsJsyW90DXEm0xU7PIeqvENYTBC0jJL23K+w==
X-Received: by 2002:adf:e88d:0:b0:317:5d1c:9719 with SMTP id d13-20020adfe88d000000b003175d1c9719mr8005347wrm.9.1692044975128;
        Mon, 14 Aug 2023 13:29:35 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:20e9:baea:a4f7:d880])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c024800b003fd2d33ea53sm15181223wmj.14.2023.08.14.13.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 13:29:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@lst.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Subject: [(subset) PATCH v2 2/3] riscv: dma-mapping: skip invalidation before bidirectional DMA
Date: Mon, 14 Aug 2023 21:28:20 +0100
Message-Id: <20230814202821.78120-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230814202821.78120-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230814202821.78120-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_132938_343078_3863015F 
X-CRM114-Status: GOOD (  12.67  )
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

From: Arnd Bergmann <arnd@arndb.de>

For a DMA_BIDIRECTIONAL transfer, the caches have to be cleaned
first to let the device see data written by the CPU, and invalidated
after the transfer to let the CPU see data written by the device.

riscv also invalidates the caches before the transfer, which does
not appear to serve any purpose.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
* Included RB and ACKs
---
 arch/riscv/mm/dma-noncoherent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index 94614cf61cdd..fc6377a64c8d 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -25,7 +25,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
 		break;
 	case DMA_BIDIRECTIONAL:
-		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
+		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
 		break;
 	default:
 		break;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
