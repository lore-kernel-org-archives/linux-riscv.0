Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A7DEB64DD
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 20:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1JZR+t5Oneejh/le5EUV8Bbsks+2ZzIJ+2ZFrIb0Cc=; b=vD2sV268+q6MjM
	gNS1rj9vrhuJOMgQ84YVB17RSPXSUt/5TfxwDchbxsAHDNUrGD06ej1GAm0Bnf0kHEgg/RQ2Isi5O
	o5l2SG4iMPK7Gg5WadkZl7vxuSjuc0E4uX8vrCdMyaHJyLlsOylGyDxouRhsaG8jRfPm0A2lwUM0r
	6rEQMiXrl3cDOhAn1LFc9RFn0yW/OwcBFU+EE8vfdI0nAYiJtxvnD+yZ/lBVZ3/zrDSobkgGv91bk
	Czp7YUOlwfebUX9jTe06RO8qDy2k6cZuQVCvaTwjtiCad/iUAV97snSDi49kSvVtkE60fPGo4rsbv
	KCKKIemvhk9aZSiQNWtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVeC0-000I7C-1T;
	Mon, 14 Aug 2023 20:29:36 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVeBx-000I6P-3A
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 20:29:35 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fe12baec61so42888825e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 13:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692044970; x=1692649770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgES1U2rAJt0vkuQ5rZJ9UhsIJ2P8NX/YjkPZttVOXs=;
        b=cmKgegzaVqNxEVWiR+prIVGiodpzFr31luuavYINSMhzPNf0kg/2oheiHveCXdOsTM
         2EIfOD017s+20lW79kUrZfcIDOCar7OwuHJ8bei6vYZxv7lEwooIJjS8FapzdcwnoBDt
         S2AfbR+QPq3H3ny4W1/2uhxAxuzlnzM3Kuh0j977bM9+IX8Q/4eCso1fia1z2YwwK4w+
         XF5cb6AsvOkBALOVgaQ3ZcpJ6nrjx7RGhxIX+Yk8UfAczVKwq4LaRHCSb+U7EiQoWz42
         uVOdvp7wdtKUhdQi0YfT3FHut/qI9HYbFKroI3djWyhQz/G0vxyJp2GGM8qzyvlsClX1
         3Ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692044970; x=1692649770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgES1U2rAJt0vkuQ5rZJ9UhsIJ2P8NX/YjkPZttVOXs=;
        b=YkSYhMCJZVKC2dzx0Eid9x5sVxsK6FBonIxnsC+ggJQEfGozZhf7GaE22V81vhsbbk
         tOOuKua/nuptp4UU0OMdbcg0G5YBaTYh8uD2QOiQeMD6sJ5VbkJJdiNf+NoOaUrEk/eO
         fD0d5NlF+f0bK38zOzVK4zLv3dXX6Op6T6wxEbL0yZGvTqlcN9bZBJProbAqT6MTynYH
         yoF9XGPcExmatmTLNMlDGs6Fim/X6o8y2hi8ON9p25S5fhXoZkAKAOIcP+4pwG7QIHaz
         140CetUkUxr3MvM//i0A5slBP0jQ0DiirJbnQxZM9TL9E1Xsr6ocAYOpNlQLjQ+55gEM
         y44w==
X-Gm-Message-State: AOJu0YwBMePmOlSECJAAi0pDJCO10LjMo9pyb9+9M9BrAFDc4kkOQMCU
	dFTam8FSFA4QahfFdcvP8Yg=
X-Google-Smtp-Source: AGHT+IE5AyDcYJd4G1UT7NTo1tKSeic6cgBusYnNxNedxa7HhjLy9CDCy4a8k4YcD2ORKou12eQPoA==
X-Received: by 2002:a7b:c4d0:0:b0:3fd:3006:410b with SMTP id g16-20020a7bc4d0000000b003fd3006410bmr8182828wmk.34.1692044969972;
        Mon, 14 Aug 2023 13:29:29 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:20e9:baea:a4f7:d880])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c024800b003fd2d33ea53sm15181223wmj.14.2023.08.14.13.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 13:29:29 -0700 (PDT)
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
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [(subset) PATCH v2 1/3] riscv: dma-mapping: only invalidate after DMA, not flush
Date: Mon, 14 Aug 2023 21:28:19 +0100
Message-Id: <20230814202821.78120-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230814202821.78120-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230814202821.78120-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_132934_021381_B4080F3A 
X-CRM114-Status: GOOD (  13.24  )
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

No other architecture intentionally writes back dirty cache lines into
a buffer that a device has just finished writing into. If the cache is
clean, this has no effect at all, but if a cacheline in the buffer has
actually been written by the CPU,  there is a driver bug that is likely
made worse by overwriting that buffer.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
* Fixed typo drive->driver
* Included RB and ACKs
---
 arch/riscv/mm/dma-noncoherent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index d51a75864e53..94614cf61cdd 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -42,7 +42,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		break;
 	case DMA_FROM_DEVICE:
 	case DMA_BIDIRECTIONAL:
-		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
+		ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
 		break;
 	default:
 		break;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
