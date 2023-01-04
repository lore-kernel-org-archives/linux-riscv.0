Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F1CC4708E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 20:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qvVo2mL0aO6f6F2SDudZkgUM2+s5qastlrpBiPjGrc=; b=Gm1gUo9VCIyITY
	et45rPxZLEOne9WSdJDvIzE7Oj/wmV25ZWopTKPvo4iU7yo9EgHJOfVbm1NibRQotNMIOTqkRnQig
	8WcIVQn/4sALRJD6+/YyH7s0+UCChcRi18qonB4Xl9xYkhWdaZy/JCTj5dS8UbFbfxT9oNpfCr9ng
	DOOkKWE7J+QqrYx5ALBOvekz7poZNNrDRoBASgxpMPXD6xTwAwmz7rFNf1IXh7vqG2sLyIWDTu6Iz
	2LEgVoNpwTb1H5poe8ilxXnYwD5BOaExX+OcZx64WInhye6Z/KyLlDci3ha5Fc+5YFiISU+bfNoom
	0JkVrsCUOeAUZE5Kj2eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDX55-00Egkg-6j; Thu, 05 Jan 2023 20:43:19 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCyQE-007SAh-R0
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 07:42:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1672818162; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LWBZsZNGtqft8NGplbqQ0Zbx5EGFLiNbaCPFCae3dt1F1usqD8crcSHuKte+bh4AY5ruhOywciJpvA5h3t9EGFzJf2g5TcWoOhIEWIS+D7uJ8jZ4FZfn6AzrNPto9widpIp/8rA8e7EcZbvzOTCSh3bD70pX/5EiCp4Wil+nQ8g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1672818162; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=RuI7fSMf6gB0F04XaCXJZwuG0ebtSLQ7daj+iJ3r1gM=; 
	b=Bqc3rMwf+lvnAD2GuALx8Ly0j1FwPSV7V7uZFxJelMKtZu0+uIU2jpLluQg0vWBjBpMYqIPidCNjxzVMzGUTbX6PEhnEvEN+SQx57babGFSUoKHcmVOzVueh72/Q+B0wydAhs5sZDivfj1uU5ifH7nIdr+HzN2WcpZIDQTvsZZY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672818162;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=RuI7fSMf6gB0F04XaCXJZwuG0ebtSLQ7daj+iJ3r1gM=;
	b=Ahp3YZ7F6jx3o5n17e8RXFNqSRFDNXr6xVrAXyQ/l4FHHTV/yyXBSZtYjomoSfXH
	YuSkoi32vd4OLd+c5gJ1kq8DP46nbhYUvfU++8KH7TfmgR4S6In6sVF3fL5xn/j0VRX
	nfm66pXU8UptgssnmDZjpVuNuZ8Gi0iD6ZahSKL8=
Received: from edelgard.fodlan.icenowy.me (120.85.96.143 [120.85.96.143]) by mx.zohomail.com
	with SMTPS id 1672818161614931.0512332246188; Tue, 3 Jan 2023 23:42:41 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 2/3] riscv: use VA+PA variant of CMO macros for DMA synchorization
Date: Wed,  4 Jan 2023 15:41:45 +0800
Message-Id: <20230104074146.578485-3-uwu@icenowy.me>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104074146.578485-1-uwu@icenowy.me>
References: <20230104074146.578485-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_234253_575479_F84216DD 
X-CRM114-Status: GOOD (  10.07  )
X-Mailman-Approved-At: Thu, 05 Jan 2023 12:28:40 -0800
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

DMA synchorization is done on PA and the VA is calculated from the PA.

Use the alternative macro variant that takes both VA and PA as
parameters, thus in case the ISA extension used support PA directly, the
overhead for re-converting VA to PA can be omitted.

Suggested-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/riscv/mm/dma-noncoherent.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index d919efab6eba..a751f4aece62 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -19,13 +19,13 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 
 	switch (dir) {
 	case DMA_TO_DEVICE:
-		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
+		ALT_CMO_OP_VPA(clean, vaddr, paddr, size, riscv_cbom_block_size);
 		break;
 	case DMA_FROM_DEVICE:
-		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
+		ALT_CMO_OP_VPA(clean, vaddr, paddr, size, riscv_cbom_block_size);
 		break;
 	case DMA_BIDIRECTIONAL:
-		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
+		ALT_CMO_OP_VPA(flush, vaddr, paddr, size, riscv_cbom_block_size);
 		break;
 	default:
 		break;
@@ -42,7 +42,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		break;
 	case DMA_FROM_DEVICE:
 	case DMA_BIDIRECTIONAL:
-		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
+		ALT_CMO_OP_VPA(flush, vaddr, paddr, size, riscv_cbom_block_size);
 		break;
 	default:
 		break;
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
