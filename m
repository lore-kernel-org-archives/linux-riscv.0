Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B24606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 03:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ajlbnURC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=Pw5gut4s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ptnuPGZ/b4g0XjmnzUaswuGXSQFxENPZFIhMreYLGYQ=; b=ajlbnURCCxrj4bUeB4hsaA5ASz
	D4vkoWoHG/DdUubkXMjNOzy9T80QRvVgKXzmwY/hd8hLe1Kt9/QHFHKHIcppcRE22yR660WyH+tQd
	pgsQUqjJVV5JrPVYvc7+PJPKDFQfh007Kz7qugnJiH4wbxPhXclIZdYVQxytz9MqHAaPy4cOh0ARt
	pVJTO8j5MqpfRrMn7XMf0b3LYrW1atfLsUbMnugLL5/6cLlnNubIWCcO2owO2GwlhHkRwC335b6hb
	NqF4JKfIvRQH+8nghWXOJ0I4v2VjAYh8ftFx9p/f/NNIpmARnimSMt2fHsHqxY+9Bx/DR9SMSE3ot
	LtZEvsNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRL8N-00000008aKN-21mD;
	Thu, 12 Nov 2026 03:05:55 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRL8H-00000008aIs-03gw
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 03:05:53 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jQ4yX5lV2z8XrrM;
	Thu, 12 Nov 2026 11:05:40 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794452740;
	bh=kxCgMxQPw7zcLOOhcHpi7uXta8VoUq1BGHVf6nXNGqc=;
	h=Date:From:To:Cc:Subject;
	b=Pw5gut4srzbBmc4DquuhsUXRyLRKi0FL0Hts0vbduFOt+2gNwLEFqp4e72tyd6nE8
	 6DDXU+mEhfkTTjIYJWdjjCnI03jIPl8mYqimVk9uFNY8/D9xU4y0uossUkJ+qFQLF8
	 e+z83man3qRhXb+/NxBTwkuge1j4xPHJfqmVa7tW3fDjBBP5hVaQuitnuyqgT1+iOu
	 cjuY7JKxic1Mce3I8NONe5By+JRVBqmpCbP6ccShlECH6drwCQKHz/Wr/DVdjTEjkR
	 oWdLJ+23K2rxJcsrm5jVpVPeCJC8NmpUAmZjpXPwtM4pBgK3JEg/MPuUD9gumeAra7
	 6FJJhXAd1GQ2g==
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 6AC35OT8083980;
	Thu, 12 Nov 2026 11:05:24 +0800 (+08)
	(envelope-from hu.shengming@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 12 Nov 2026 11:05:25 +0800 (CST)
X-Zmail-TransId: 2afb6af52cf5c07-cf787
X-Mailer: Zmail v1.0
Message-ID: <20261112110525378dgDlKhA-G74_y3b6ZeZkz@zte.com.cn>
Date: Thu, 12 Nov 2026 11:05:25 +0800 (CST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
From: <hu.shengming@zte.com.cn>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
Cc: <alex@ghiti.fr>, <akpm@linux-foundation.org>,
        <baolin.wang@linux.alibaba.com>, <wangruikang@iscas.ac.cn>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <zhang.run@zte.com.cn>, <luo.haiyang@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSByaXNjdjogbW06IExpbWl0IHBlci1wYWdlIFRMQiBmbHVzaGVzIGZvciBsYXJnZSBQVEUgYmF0Y2hlcw==?=
X-MAIL: mse-fl2.zte.com.cn 6AC35OT8083980
X-TLS: YES
X-ENVELOPE-SENDER: hu.shengming@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Thu, 12 Nov 2026 11:05:40 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF52D04.002/4jQ4yX5lV2z8XrrM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_190549_576951_8027C973 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shengming Hu <hu.shengming@zte.com.cn>

On systems without Svvptc, update_mmu_cache_range() performs one local
TLB invalidation per PTE. With 4 KiB pages, installing a PTE-mapped
1 MiB anonymous folio requires 256 SFENCE.VMA instructions, or 256
SINVAL.VMA instructions bracketed by SFENCE.W.INVAL and
SFENCE.INVAL.IR.

Apply the existing local TLB range-flush policy to PTE batch updates.
When nr exceeds tlb_flush_all_threshold, use local_flush_tlb_all_asid()
to replace per-page invalidations with a single ASID-wide SFENCE.VMA.
This orders the PTE writes before subsequent implicit page-table
accesses and invalidates translations for the entire batch. As with
range flushes, this may also evict unrelated translations for the same
ASID.

Benchmark results from will-it-scale's page_fault1_processes under
QEMU 9.1.93 (qemu-9.2.0-0.3.rc3.fc40), with svvptc=false and
CONFIG_TRANSPARENT_HUGEPAGE=y (higher is better):

Folio size      Before       After     Change
=============================================
4 KiB           116537      113503      -2.6%
512 KiB        1431962     1977519     +38.1%
1 MiB          1528457     2208209     +44.5%

Signed-off-by: Shengming Hu <hu.shengming@zte.com.cn>
---
 arch/riscv/include/asm/pgtable.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 2ebd5fa5adc5..ebe42fcf35ae 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -571,6 +571,11 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC))
 		return;

+	if (nr > tlb_flush_all_threshold) {
+		local_flush_tlb_all_asid(asid);
+		return;
+	}
+
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)) {
 		local_sfence_w_inval();
 		while (nr--)
-- 
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
