Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3B2C44523
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jul 2026 09:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HYdWRU4S5fMP4HERpbpwXqquoZh+TjFvZyUZjsnRzpc=; b=Fbk7BuoNVjJdHR
	x25gl4HnLrMPT1PwS8m00b91zFJ2YWQayYT2gESGhVaf+4qhrXpEoNdIHimNy48Dp4SE+Zeh8cj+a
	ASLhC4BtcH5ejP0eTXJO3A/j0AwA6oBMfPV1vvJDaaaDFUPDM9XAHQzwPbpNaRLqUz5DhYA4XGfty
	YeR4if7sG16bi3yfJEZ8JPDuEiIcrgihAN0GLDpxoez4qKg+BZKIg37psU5kKjZ2XY/ZBgyIgWozB
	1VCccbiuOtFx69g2n8uGKQS5Fq8xXXlCugt7kF4cYXdxLq2CLlSrYZeXkCRXdpSdMHf/IcnOV8Bk+
	UdeG0UxyJjHbpZt2Zpjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlNrl-00000004sqe-1Aw9;
	Sun, 19 Jul 2026 09:31:21 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlNri-00000004soP-0lGX
	for linux-riscv@lists.infradead.org;
	Sun, 19 Jul 2026 09:31:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=nN
	fRhaOga8yZmczg87holWW3UblLdJzQoSXQwr3yNc8=; b=f3GgDCUf9EkfvUeaGt
	PcXuB7wp8MCedOedA00blt4DU7OCEH35yFfHgVRapOEkoW5UuXByA7K5MGmkWtoY
	XTooAscENuIw8ehUNrGR5bVvBSdyEDQ+Nen1or5s+IfYP4l/DRkjbfza/6UI1Wxf
	DiI3UROcu7l+l/XvXHav3NiRg=
Received: from Ubuntu.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCnTyswmVxqbA0SIA--.60699S4;
	Sun, 19 Jul 2026 17:30:26 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] riscv: patch: skip fixmap mapping when kernel text is already writable
Date: Sun, 19 Jul 2026 09:30:24 +0000
Message-ID: <20260719093024.33351-3-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260719093024.33351-1-xiaofengmian@163.com>
References: <20260719093024.33351-1-xiaofengmian@163.com>
MIME-Version: 1.0
X-CM-TRANSID: PygvCgCnTyswmVxqbA0SIA--.60699S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF1xuw4UGF43Kr17Cry5XFb_yoW8XFy5pr
	s7GF1rZFW5JF4Fv3y2kwn5ury5Awn3trZxGF9rX34Svws8X34rXwn5W3y2qF10gr1j9w47
	uFsIyrWS9a4UJ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j64ENUUUUU=
X-Originating-IP: [39.187.244.72]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbDAhIkJ2pcmTIMvQAA3-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_023118_622530_AA7FB969 
X-CRM114-Status: GOOD (  11.00  )
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

Currently patch_map() always creates a temporary writable mapping via
fixmap for kernel text addresses, even when CONFIG_STRICT_MODULE_RWX
is disabled and the kernel text is already mapped with _PAGE_WRITE.

This is unnecessary overhead at best, and on minimal configurations
it can cause page faults.

Skip the fixmap path for kernel text when CONFIG_STRICT_MODULE_RWX
is not enabled, since the text pages are already writable in this case.

Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
---
v2: add commit description (per Nam Cao's review)

v3: early return when !CONFIG_STRICT_MODULE_RWX (per Nam Cao's suggestion)

 arch/riscv/kernel/patch.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 16b243376f..caef41d5ef 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -44,15 +44,16 @@ static __always_inline void *patch_map(void *addr, const unsigned int fixmap)
 	uintptr_t uintaddr = (uintptr_t) addr;
 	phys_addr_t phys;
 
+	if (!IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
+		return addr;
+
 	if (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr)) {
 		phys = __pa_symbol(addr);
-	} else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
+	} else {
 		struct page *page = vmalloc_to_page(addr);
 
 		BUG_ON(!page);
 		phys = page_to_phys(page) + offset_in_page(addr);
-	} else {
-		return addr;
 	}
 
 	return (void *)set_fixmap_offset(fixmap, phys);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
