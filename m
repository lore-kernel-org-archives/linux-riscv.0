Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15D7C4451B
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 03:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mn7o0bPCqwG0n2gLwOKMJG65mbQpOlnkmFBO4FMeUlA=; b=1cufpgSBFe6VLJ
	aL8rNYivuG8esZWTz7C0nnxFd4u9RfETH4a/4L/e2ivlsyhpm3cr6n57EJJ+YqYbyuBoAqICqbOEV
	ivhww2EoitboDuXJaM782r8yZxRIF0XjV3TRJtA81hvDTVdMeim0qE62PIvWUQaJKYN6KfziX2b4T
	a/X74h8YneOiImaeeo3lY3iigJeEPyAvNp24IA1MIbq1ZRa4iBXHa+uuKx9EUh+I3iEqFxmn8VH5B
	PrP/yAAcAJU7ENXId3bENNAHmkPkZo+NJL8u/zM3rslH3PT3gtsl7MzcdjuffhVOuHQZjawHhkHBl
	xaXSRW1svl+07ATfceTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlebT-00000005kwP-3Voj;
	Mon, 20 Jul 2026 03:23:39 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlebQ-00000005kvH-2xzy
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 03:23:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=5U
	kUr8RuelSHMMnVvP5mpx/Yb4/yO3VgsdZyG7QnLwM=; b=IIYkWQwCO4Ls5jXYrP
	Tb4+oj96r5TjsaL2NszGZnvrvRbFbUN/oockCbz2LzJn83LXI6t6Q3/lYmdS7h47
	uA7OseJCf2ZmtCEsjUKlsj85/G9limsmke6BPxDbkWQAG6rUF4Hlj6DOnO+Lt6XH
	qrwLnI8zIESwvBRorobmuHZLo=
Received: from Ubuntu.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBH+wKTlF1qrd2XIg--.2654S4;
	Mon, 20 Jul 2026 11:23:02 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiaofengmian@163.com
Subject: [PATCH v4 2/2] riscv: patch: skip fixmap mapping when kernel text is already writable
Date: Mon, 20 Jul 2026 03:22:57 +0000
Message-ID: <20260720032258.5188-3-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720032258.5188-1-xiaofengmian@163.com>
References: <20260720032258.5188-1-xiaofengmian@163.com>
MIME-Version: 1.0
X-CM-TRANSID: PigvCgBH+wKTlF1qrd2XIg--.2654S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF1xuw4UGF43Kr17ZFWxtFb_yoW8GFyDpF
	s7JF1rZFW5JF4Fv39Fkw1kuryYywnxtrsxGFnrXFyavwsIq34rXwn3W3y2qF10gr1j9w47
	uFsxArZI9a4UG37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziebyZUUUUU=
X-Originating-IP: [223.104.164.77]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbC5RY8P2pdlJaH-wAA39
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_202337_157894_697FD5EB 
X-CRM114-Status: UNSURE (   8.42  )
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

Currently patch_map() always creates a temporary writable mapping via
fixmap for kernel text addresses, even when CONFIG_STRICT_MODULE_RWX
is disabled and the kernel text is already mapped with _PAGE_WRITE.

This is unnecessary overhead at best, and on minimal configurations
it can cause page faults.

Skip the fixmap path for kernel text when CONFIG_STRICT_MODULE_RWX
is not enabled, since the text pages are already writable in this case.

Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
---
v2: add commit description
v3: early return when !CONFIG_STRICT_MODULE_RWX (per Nam Cao's suggestion)
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
