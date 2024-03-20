Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649BDC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 06:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FQbwo/AEw1zk36h4YuRtHws0lCrgV8f/p/D/3pP244=; b=iKqZORlRUgPadA
	zB7ighuV0E1G7G3wUf7dGrlQuVQKCaglVpnKhs+xGT/vQb4rxHbrOGsZTNqI0UlH726T48y+oHRT8
	4h6oLKSSBmssLgF1aWL1xHYb7CZtFTldn6VfkRQIJHOuhGU5bwl/wh8BQeBeHojITAhvCO41luVXq
	Rvusr/vxhmFleUtHu/4o9LWhW3CFDupB0wOPiec8LjGRX3NN+BVf3wAjZodTWNO3Kw9NaYpf9Qa8B
	qf4JfxJCdjU9rY05t7fcDP6k2fDNbu5zYGO9fUyhhjfP4hlGc8EH54cZGqIUpkFlLGWMXhqlv5pXz
	NGxXidQdfe+Jg5ACLd6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmpkh-0000000FlC7-0c5g;
	Wed, 20 Mar 2024 06:48:43 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmpke-0000000Fl7P-2eae
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 06:48:42 +0000
X-QQ-mid: bizesmtp64t1710917293tzxbl7od
X-QQ-Originating-IP: ohUIX+NpasMm5o4CUkl2cU8VjUo3qXs7Ck8cstz7sb4=
Received: from localhost ( [112.0.147.175])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 20 Mar 2024 14:48:12 +0800 (CST)
X-QQ-SSF: 01400000000000704000000A0001000
X-QQ-FEAT: 7jw2iSiCazp7OdgV2kHlLVP94HvjWqFTqFF7HjO8HPsCdrjz1HxdrCZMLFDQu
	Bv9LlqAGVSsV55LkGOHaFjJgUFzl/9cZoG9fzy2Ymr6Qk2Pq8nOt+TPtqojYEGG20eJkYBq
	jf4HTiIJGpdJCFjgxXm9ry9InHiIhGxI8QELXyxXP5uKPDk9c3Xxqh5BvX4broJfj9We0l+
	VnEs/hkWSLX4cwzAXufnWVF5N3Q9lwOw8Dgae+WdJuXxdknNjuPtYUBSxING0mpqkAjEy4j
	FyRMYdiiQzOIDFHP+MJyyucGR1xI5nYhrUbKgH/1VWu31IPAKd9Nm2ej+Gs4l/QbEAIWlLR
	q3DHQZ7TfxlCMXXX6i/YvzXJd8xm3BA7PUkRFPXDUCghT3QOmiEV3l1UhBS1OUbVgEE6BvA
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 6662747842115867711
From: Dawei Li <dawei.li@shingroup.cn>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alexghiti@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dawei Li <dawei.li@shingroup.cn>
Subject: [PATCH 2/2] riscv: Annotate pgtable_l{4,5}_enabled with __ro_after_init
Date: Wed, 20 Mar 2024 14:47:12 +0800
Message-Id: <20240320064712.442579-3-dawei.li@shingroup.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240320064712.442579-1-dawei.li@shingroup.cn>
References: <20240320064712.442579-1-dawei.li@shingroup.cn>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_234841_024215_83ABBA5C 
X-CRM114-Status: UNSURE (   6.86  )
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

pgtable_l{4,5}_enabled are read only after initialization, make explicit
annotation of __ro_after_init on them.

Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index bab3e9943bb5..204cdf5b829d 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -50,8 +50,8 @@ u64 satp_mode __ro_after_init = SATP_MODE_32;
 EXPORT_SYMBOL(satp_mode);
 
 #ifdef CONFIG_64BIT
-bool pgtable_l4_enabled = !IS_ENABLED(CONFIG_XIP_KERNEL);
-bool pgtable_l5_enabled = !IS_ENABLED(CONFIG_XIP_KERNEL);
+bool pgtable_l4_enabled __ro_after_init = !IS_ENABLED(CONFIG_XIP_KERNEL);
+bool pgtable_l5_enabled __ro_after_init = !IS_ENABLED(CONFIG_XIP_KERNEL);
 EXPORT_SYMBOL(pgtable_l4_enabled);
 EXPORT_SYMBOL(pgtable_l5_enabled);
 #endif
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
