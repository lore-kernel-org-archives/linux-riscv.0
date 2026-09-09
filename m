Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460EBC79FB6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 15:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=poCaD9laZs84P2jc8tvIFX0QVeB269PbomVambpQAl4=; b=Ta3MMC3ODYqPTO
	0sXCOVPBbzXa6lfDvDm2wAoVSy8E92WMe9CctiT2PsiL4mbRrui5zdcEgX2NnCobzHT9au1todLw+
	pc1S2HC9JcjEMBW+eMVAMXX4wE0e26ddDHEltFqGAHG29eFtiam4pkUBZ0sRhfpL3jH+Bmw88S2Ev
	n1sr9u0Y4+JQ4iy1NRJNIWftqDzVLG3YYPOuvknOwRa+CIjWDVqjLatQKnFxMHp4sdsgHHwx0g4Wv
	OsaEFwvYBhjwmlaL+PaLxFpcsBq6poD8Fq8SWYtsyQkIjhlyD2Ua2mCfF6rgC2+RdFYfRmh4ypn2A
	R5gzeJ4yY94rKcV15N3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4K7o-0000000C8I4-2OaD;
	Wed, 09 Sep 2026 15:22:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4K7n-0000000C8HK-418g
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 15:22:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 65E1B60200;
	Wed,  9 Sep 2026 15:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37FE1F00A3A;
	Wed,  9 Sep 2026 15:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788967331;
	bh=pWhYf/PBAlBJrtYtS9eILNv9A1vD0y9OBe4mhmHYg8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EK9BNkKZtVqYRYh4He/z6D+YLRADtblBeHfMl/W2EBp98Z61ChVdNf1IJku3p7oPT
	 XhAlMaVJgxX0NSTfg4q9DeQlfw+2MgQqgk6rb3zd9bxKD14EEeiifsACWaCd82NDWd
	 1w4nha37zTveERLr5uM72s1P3ci4ZkPbmS+br6EoaM1pnGtu3HBFEPhaqolfZuHR93
	 DXCe0IuFhz4eHoLxxTBP8niFzjQw4/l6ZNwfu4sy+LtVb7TqkrDy+0vofBTL21SVj4
	 yPMqg4jQNdKCJgKOku5dC20HzHS8vahxebPQIv3ZG4h2cN0vvzGwRl5AH7WxX2QXD9
	 oZwL1D+3Lpgxg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: [PATCH v3 5/5] riscv: mm: unexport _pgtable_l4_enabled and _pgtable_l5_enabled
Date: Wed,  9 Sep 2026 23:01:58 +0800
Message-ID: <20260909150158.9313-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260909150158.9313-1-jszhang@kernel.org>
References: <20260909150158.9313-1-jszhang@kernel.org>
MIME-Version: 1.0
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

Now, these two vars are only used by kernel itself, especially the code
before MMU on. No modules users any more, unexport them.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 6f51f265fb85..0d409acf9be0 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -59,8 +59,6 @@ EXPORT_SYMBOL(satp_mode);
 #ifdef CONFIG_64BIT
 bool _pgtable_l4_enabled __ro_after_init = true;
 bool _pgtable_l5_enabled __ro_after_init = true;
-EXPORT_SYMBOL(_pgtable_l4_enabled);
-EXPORT_SYMBOL(_pgtable_l5_enabled);
 #endif
 
 phys_addr_t phys_ram_base __ro_after_init;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
