Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66E3C83F10
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 09:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sR8qNrPjE9wxc1CTS9qKnXN2T7N5ZvTN702u5iwaItY=; b=tf14wZoiEvdKZF
	XA8CWf6oP8AGnfU/Oy1DaW2/2vTosLq4B9ZBMTYFdiEsMMh7+L8z3tzpwIHgyD7eVx0+ewhX4Kb7M
	SMjETZG/OHYmYenWrfpmRgrEpQEWpfrTcENETGd4jrpf2ZGd9h3mbb+wi5hXIKek5tDkdtiIG0q6h
	k/Hb4xjLtl4u2zqVdZVkYPNetxoGGMRLlrzJdgpjluSHRNQXBSbtclWj03Tv/j/oQ+M2Xhzu725OG
	Q75gCrUjE2Nr/xZpApRrSPWQwTbCJrvRcodbJJKkvaAfbL1wvDLSWbBEL8xiIteSIgum4qKZXt+vw
	8U/eXWIKjhVRTH4fDfDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaBwU-007ifi-2z;
	Sun, 27 Aug 2023 09:20:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaBwR-007ieG-0s
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 09:20:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9458E6144B;
	Sun, 27 Aug 2023 09:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4964DC433C9;
	Sun, 27 Aug 2023 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693128018;
	bh=Ibu7OZXmFF1/tmfUzC1QszDkKdxJxutlMYfydtDtkvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OeCRgMOdogG7W1AW/VS6qgIe7qwaMx9kWoBCGgkEbH6+sxJl8X216MNKabS6Bw+vg
	 UM97X5t7yxV+PrryitqcAJSBbZF5tia9snUfPZ/EC9iDXw59v+qZXOkUbdWWj/KWSt
	 5FtcgclCDM2u75WzRMVuRI8AbBZST+F6t4LrokgnV2kaztAvDy4vl4Q9pizUVj83D8
	 3M6QKXbwoo4wwe8DJCjAZuW2lQsN5lGDuLnUY0U6lL9Gt29EhMOQLS2C8iSNuTqSNn
	 6BHfcMh6tjszCuBuD65E9KXdGDfQvJzh3xFDQYJ156Pmgdk4rPkKc4RC+m+IA+G91+
	 3+bwOzkQ5tJRA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v2 2/2] riscv: errata: prefix T-Head mnemonics with th.
Date: Sun, 27 Aug 2023 17:08:13 +0800
Message-Id: <20230827090813.1353-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230827090813.1353-1-jszhang@kernel.org>
References: <20230827090813.1353-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_022019_353318_2303C5AF 
X-CRM114-Status: UNSURE (   8.48  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Icenowy Zheng <uwu@icenowy.me>

T-Head now maintains some specification for their extended instructions
at [1], in which all instructions are prefixed "th.".

Follow this practice in the kernel comments.

Link: https://github.com/T-head-Semi/thead-extension-spec [1]
Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/riscv/include/asm/errata_list.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index feab334dd832..98ecab053dd2 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -90,25 +90,25 @@ asm volatile(ALTERNATIVE(						\
 #endif
 
 /*
- * dcache.ipa rs1 (invalidate, physical address)
+ * th.dcache.ipa rs1 (invalidate, physical address)
  * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
  *   0000001    01010      rs1       000      00000  0001011
- * dache.iva rs1 (invalida, virtual address)
+ * th.dache.iva rs1 (invalida, virtual address)
  *   0000001    00110      rs1       000      00000  0001011
  *
- * dcache.cpa rs1 (clean, physical address)
+ * th.dcache.cpa rs1 (clean, physical address)
  * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
  *   0000001    01001      rs1       000      00000  0001011
- * dcache.cva rs1 (clean, virtual address)
+ * th.dcache.cva rs1 (clean, virtual address)
  *   0000001    00101      rs1       000      00000  0001011
  *
- * dcache.cipa rs1 (clean then invalidate, physical address)
+ * th.dcache.cipa rs1 (clean then invalidate, physical address)
  * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
  *   0000001    01011      rs1       000      00000  0001011
- * dcache.civa rs1 (... virtual address)
+ * th.dcache.civa rs1 (... virtual address)
  *   0000001    00111      rs1       000      00000  0001011
  *
- * sync.s (make sure all cache operations finished)
+ * th.sync.s (make sure all cache operations finished)
  * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
  *   0000000    11001     00000      000      00000  0001011
  */
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
