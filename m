Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48ECACA5FB1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 07:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0EOPL+p7xwzZ6P0RRCtwipcvO338UaqRpxovq8XunFs=; b=niDs35941DFjcL
	08n4JPRWIqUtkCCjXzWXXeIkJcVBqeKlgwbBl62c/tGTrT27gfy42LlPAYz/K70IPNX7Aa3aavTtp
	Z2zR+RoOjDfbGxBC6hxtlDY3LF4tdDxLdOqIbk0mBuys+AmxnxfX7PyUoXlHaD5tjjFafXY/ikB7b
	pMrGJXs9NPerBwIuX+WnezFCBEONbTo8iLIU85waSleOs/gAHX16gw9tfogrg9OU5lN9+5vJdNdt9
	WvAQyPXw6nynb9DCfcvEK0QzWHwYDpjT/KXbCgCp8PJK4Qa9eOhUMb9NHznJAlIjS8wuHlDIr/NJS
	uI58j5xqPZYpYCMTJ9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBor0-00000005HiW-41wt;
	Wed, 30 Sep 2026 07:35:50 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoqx-00000005Hgm-0ILx
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 07:35:49 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.54])
	by APP-05 (Coremail) with SMTP id zQCowABHtD7Eu7xqdFHBCQ--.5968S3;
	Wed, 30 Sep 2026 15:35:35 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Dominique Belhachemi <domibel@debian.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [RFC PATCH 1/2] drm: add a helper function to check availbility of coherent mapping
Date: Wed, 30 Sep 2026 15:35:27 +0800
Message-ID: <20260930073528.3369325-2-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930073528.3369325-1-zhengxingda@iscas.ac.cn>
References: <20260930073528.3369325-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowABHtD7Eu7xqdFHBCQ--.5968S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uw1rAFyxuF1fur4UGFW7urg_yoW8Xw1UpF
	Z7CFyrJFsYqa1fCF13A3WSvFWrC397WFWxJ34avw4xZr4fKw1vqrWkJF4avFyrJrWkKw4a
	qFZakr98uryUZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUjrHUDUUUUU==
X-Originating-IP: [112.94.101.54]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_003547_715790_BBC937D1 
X-CRM114-Status: UNSURE (   9.86  )
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
Cc: linux-riscv@lists.infradead.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On some early SiFive RISC-V cores, there're no architectural way to map
the framebuffer coherently (bypassing the cache).

Add a helper function to check this situation for drivers to enable
dirty-tracking-based cache maintenance, which is more than returning
true currently on all architectures other than RISC-V.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 include/drm/drm_cache.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/drm/drm_cache.h b/include/drm/drm_cache.h
index 08e0e3ffad131..001a6d89afead 100644
--- a/include/drm/drm_cache.h
+++ b/include/drm/drm_cache.h
@@ -34,6 +34,9 @@
 #define _DRM_CACHE_H_
 
 #include <linux/scatterlist.h>
+#if defined(CONFIG_RISCV)
+#include <linux/pgtable.h>
+#endif
 
 struct iosys_map;
 
@@ -80,6 +83,24 @@ static inline bool drm_arch_can_wc_memory(void)
 #endif
 }
 
+static inline bool drm_arch_can_map_coherent(void)
+{
+#if defined(CONFIG_RISCV)
+	/*
+	 * Early ratified versions of RISC-V privileged architecture manual
+	 * lacks any standardized way to override the cacheability of the
+	 * main memory region, from which framebuffers are allocated.
+	 *
+	 * In this case pgprot_writecombine() would just be a noop and manual
+	 * cache maintenance is required.
+	 */
+	return pgprot_val(pgprot_writecombine(PAGE_KERNEL)) !=
+	       pgprot_val(PAGE_KERNEL);
+#else
+	return true;
+#endif
+}
+
 void drm_memcpy_init_early(void);
 
 void drm_memcpy_from_wc(struct iosys_map *dst,
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
