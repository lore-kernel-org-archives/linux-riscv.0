Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372C3C27C7A
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 23:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/J1v8VIikNj8CXWcNllkqjbEdo/19g2b6yIvGn8GblU=; b=YB23f6Ic7v57gu
	+QtohczO3xsceoMfd6/jnAy6DgrgSkn6bLpNpYzG0sMxocnoWGtVtBPFzuCdj1bu5TKtA2RLG0GlZ
	sRXLidLhIxaqmMe7QqvW4lm/DXz6VEpLgHxLQUbKCK9NbaDyT/yq0ElD2YZ5m4eNrp2iDogYrz2Bb
	syoxXHXr1JLmvVELfgwRhPO6OQmwJLSYTUya47ZyALXz5FsSTh2uc0Y6B9VL0xPK+JWT8W2KY5eJo
	/nUmUPKnlTEVjsCPFxP3XsYdNzPPz8wdLldPqy62k1xhe08TfKP5yzE+kEf+d/WoboFxcU8qq8HJ8
	f+Zr8Fw6R6CdnTGU8kBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWPrk-005A9w-1v;
	Wed, 16 Aug 2023 23:23:52 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWPrg-005A8R-2g
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 23:23:50 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3159d5e409dso236492f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Aug 2023 16:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692228227; x=1692833027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGdlWqc1rkzIUGoDyoTEaUD3c+T74fuHGIBlF6hhRXE=;
        b=i1rMqkAX0KYQmr3hX4gpHJcpZAnDSPY8FLQjmOcFH3IWzsZwip4k+YHeb5V/KxJnpF
         q4TAqYenmaiCEY3J97LGLYQGw7eJ2N/2/dohn9ZdiJpMRm8Bej5E6vNa/L/rNEbX4Pwd
         hGhjFUsAvEUj3b7xE3U1OtrsvSSninqiC2JU+tamUiDAcQOpP87MxwfCpaVsQCw8ymh2
         FztCPo83D2R4gVCMS/kU/XhbDdDdPFnhiNZu5FI4YCkQFkFJZycKAVLvazdTOH5OEmGn
         U7zf/orzzZgyY6Sn8ZjbSSglKNIJRoRTb6+PNjK87rFAEFx1Ou7YFmyFIlWI9PDI9iCM
         k+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692228227; x=1692833027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGdlWqc1rkzIUGoDyoTEaUD3c+T74fuHGIBlF6hhRXE=;
        b=HveXw8McbgCoBK+LcjKLL7Npuzi7rAv5U7n7PmCatoRqVT1KBnUPHG8HVp3ArQ8YHD
         RqqaXrCC37XTIzz9wGxYb8CqKPu/YTQ+34RPeiSUkuz++cfy+Q1JmyXRkDN8PvaG5biN
         FypXLaAxPN1Njs0R/QZkERp5j2p9iB6t3rb1qcJN2gUawb9f6EezgcLE+ns7RXaHhr81
         FlimRJKETKvybUo97V5kvS6jgrja1ouXDDYY40NCmI7ug6IuHTWJXZOFHg6hzEYt4sDo
         rdXk9e+woZK+lKYV6JtFaZ9LvTI95ID6s1wdmPi3pXxoe/uslsUAtlN6BV74zxRukLKi
         EXpw==
X-Gm-Message-State: AOJu0Yy0KWOkV7dFnCg1zs1SinYz4jSlT+vUUXdsTICX/pJoCjq9a+ig
	M8V+au3KBCfTpRpOH7zPNVA=
X-Google-Smtp-Source: AGHT+IHmS0dmKyTUvNIRhuKNUSwUXxoC4kjuGiODOZEK2LaKsTUEMw6dOQBcO1DBZTrwrVq3tbjfOg==
X-Received: by 2002:adf:e78e:0:b0:314:2f3e:dca5 with SMTP id n14-20020adfe78e000000b003142f3edca5mr791297wrm.28.1692228226969;
        Wed, 16 Aug 2023 16:23:46 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:aeb8:832b:ebc0:1bbf])
        by smtp.gmail.com with ESMTPSA id q4-20020adff944000000b003143c9beeaesm22752617wrr.44.2023.08.16.16.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 16:23:46 -0700 (PDT)
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
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v3 2/3] riscv: dma-mapping: skip invalidation before bidirectional DMA
Date: Thu, 17 Aug 2023 00:23:35 +0100
Message-Id: <20230816232336.164413-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230816232336.164413-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230816232336.164413-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_162348_867116_E6F12C74 
X-CRM114-Status: GOOD (  12.88  )
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
v2->v3
* No change

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
