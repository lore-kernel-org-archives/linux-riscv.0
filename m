Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2A0C27C7A
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 23:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jODcD0j9bG2XR5ujBo+1BO41hCYdVMFUlo2RC4qTZB8=; b=BPU9EUwVjGGPrB
	Vz5zbCace+zvTT4TewyKmuc5ZeaYT5AIy2GT/vv9dkK4ahs3zYPPMsyueMUhmV0H4Tduzo+mpQ3BR
	ElQK03TM+FXWB24F5rOpwDqI19yljH0CF1OTH86m37Lh7chlEJTZdDsktaQh0Q0MO6l9kycvxkgcV
	APj7y72ezEe8KYUhzLIwnMhz7JqK5TX6bj4AescrOorHjnVeUGQO2nsEmtGD/Kf/+RDIqNwlDmTZp
	nH8J4f0f1TtbfJzRAYMZ8T0N1tUfNUy3WbCzFb0+2uNfM2myC49WaJjVf1jCELWr3vRO5kWduBSRV
	WLn8opA1XaLefDHAGnbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWPrj-005A9U-1N;
	Wed, 16 Aug 2023 23:23:51 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWPrf-005A8G-2B
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 23:23:49 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fe426b8583so71994815e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Aug 2023 16:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692228226; x=1692833026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3QZb2R3EdSRGjNldFEi1fV9QVZELOWJSDHH54gUih4=;
        b=lxO1UAr4NneU+P6Ihb8bkx/VGrROmaqowPU14iRlhaBcEsBBUdJxksJxlCRA9CwkWj
         0K7pbCpiUVKHSucjlDfysFP9QM7lhCmB3z93KBLq0ivmXhN5CHHoCpwFQ1TXGaRbZeaW
         HAm3YcHxdA3UWYYSAeCVwP5sBve3HbXdjGQIcXUiD5My1JU0+nEdoGu3gzv5WH95S4dl
         n+qxFbotzHG4sAsD8mfY7mQwTSAunSbjRE2Y3HT+JvZcZ7qSLV2UVa05X82kLCtEGv/S
         OwdbKJ6X9Zj6/LKSLYRBCKveneRYhLxhLY6mAy5UfKaY0iqZGd5eIWRmcAjQARJWqQLd
         U0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692228226; x=1692833026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3QZb2R3EdSRGjNldFEi1fV9QVZELOWJSDHH54gUih4=;
        b=l3uZy0ttQthvakjb7J9QKcu8YNS8RzTprUA6JaQkYpjT+88r4tMMOPxONgK9ktaab3
         aVmslVK2zaPPsgMS/RynCajVDLyN79+KjnIZCETLpZZ+tVCaQ7zufSEjDdQC30a24bUy
         OJ0FdJCnwLnCJssZa7PhAFnedI4HX9xFWONEukGnwTJQORyhyaWJ+wOu1ky+8GJEb0D6
         vpTAnwfnnys8sSIUmOqZ0Wi/IA6pfMhs/rwKv1lpZoiIuU9SynndestP9guxOffrpFBP
         Jb77kiQPkAG3Rvs5pYCWbk8Q21jV/a4naq6HXag19m5GI0oSswAoTpC7hIER0ETOoqd1
         /vmA==
X-Gm-Message-State: AOJu0YxDQ9J18fe/rQiuwerTvE/fOk5P8niou4rygaZhfp9TqWdlVW7I
	C2pogk4+mHAQpCKWSgD44Hw=
X-Google-Smtp-Source: AGHT+IEJnRIZ1RA+2A8XOGo4qJdGXnm7sLvGhrm0Oh2ZgRs2v30ncOfTStpL4pgYtbcwGDoCsAU2Qg==
X-Received: by 2002:adf:f7c9:0:b0:315:a32d:311f with SMTP id a9-20020adff7c9000000b00315a32d311fmr277540wrq.14.1692228225599;
        Wed, 16 Aug 2023 16:23:45 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:aeb8:832b:ebc0:1bbf])
        by smtp.gmail.com with ESMTPSA id q4-20020adff944000000b003143c9beeaesm22752617wrr.44.2023.08.16.16.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 16:23:44 -0700 (PDT)
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
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 1/3] riscv: dma-mapping: only invalidate after DMA, not flush
Date: Thu, 17 Aug 2023 00:23:34 +0100
Message-Id: <20230816232336.164413-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230816232336.164413-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230816232336.164413-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_162347_713768_F33D5BA1 
X-CRM114-Status: GOOD (  13.54  )
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
v2->v3
* No change

v1->v2
* Fixed typo drive->driver in commit message
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
