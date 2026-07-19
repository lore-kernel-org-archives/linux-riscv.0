Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3320C44512
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jul 2026 08:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PYjzXSe+WOvwv7BaHtUbp6gsL7Z/lv4izc9aDScwohk=; b=ef0sbWm06xVoiq
	zYByicWOqF47YPr+vMyrdoiSMVGhd98ib5A/1XP6U/nb5+EOwqdxxVACxthYxIWwk3J7ilORTB6ig
	1CijV0rMXd6ujRmTFJE1PtNCTcP8BEj3uE7NIZy6GAmIjyuKzBWfaJ6q6Lou0S2bCz0JE+g8Ri8i8
	Uf14ww6kHIBXuJYJbGoXWnQLvmD6RfhxE+mXw0UEwhp/qXdF3NY+bPbF3WoiQi0rtD1zxhKT+cUWb
	MpEeD3CzZs7XRdyYFbXdl8rzHVvzWURTG4fE5KuSh4WBU+sd96e7j07KsR4VHhcMyPq6T3Cmsolaw
	yZwQnQ4RIPtR7BNrkXlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlMci-00000004piT-27ww;
	Sun, 19 Jul 2026 08:11:44 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlMcd-00000004pfK-2hWG
	for linux-riscv@lists.infradead.org;
	Sun, 19 Jul 2026 08:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=7u
	PGAuGCroD2PkKnEjROxwq4HpeTBaO4iXNgj+VVvB8=; b=XvtQPLCsfuyROmXbtI
	AD4kaLnURGzRRc9kY0LqIUqEWEahqeXdoB+Mnc5iUql4BK4FkY3Q4h/ux1TJ05id
	JvzlBaixey4yhFVukjzQGpmjV599mOucV9dOvEz83ZZ+EP5K7wt2sifqO1W5G1MI
	iSKmykrk5M8BNqyXx5p4NVXt0=
Received: from Ubuntu.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wC3z6F9hlxq+TAUKA--.58193S4;
	Sun, 19 Jul 2026 16:10:39 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: pjw@kernel.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	namcao@linutronix.de,
	alex@ghiti.fr,
	broonie@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiaofeng Yuan <xiaofengmian@163.com>
Subject: [PATCH v2 2/2] riscv: patch: skip fixmap mapping when kernel text is already writable
Date: Sun, 19 Jul 2026 08:10:36 +0000
Message-ID: <20260719081037.5749-3-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260719081037.5749-1-xiaofengmian@163.com>
References: <20260719081037.5749-1-xiaofengmian@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wC3z6F9hlxq+TAUKA--.58193S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF17tFWrAw13KryfuF4kWFg_yoW3KrX_Cw
	s7JrW5WryUCFy293WUJw4fXr1Dt3yFqF95Cw1avFWkGasxXry0q390qF13Awn5Arn3KFy3
	uasxG3savr1jqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRlPflPUUUUU==
X-Originating-IP: [39.187.244.72]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbC5h9ydWpchn+LFgAA3s
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_011140_501255_FFDCA921 
X-CRM114-Status: UNSURE (   8.91  )
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

...

Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
---
 arch/riscv/kernel/patch.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 16b243376f..b6e8e1e83e 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -44,7 +44,8 @@ static __always_inline void *patch_map(void *addr, const unsigned int fixmap)
 	uintptr_t uintaddr = (uintptr_t) addr;
 	phys_addr_t phys;
 
-	if (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr)) {
+	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) &&
+	    (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr))) {
 		phys = __pa_symbol(addr);
 	} else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
 		struct page *page = vmalloc_to_page(addr);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
