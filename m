Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56BDCD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 17:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5AiNSr1Szpq+7X+rhqi+TPRfjZ4q+f12kJ5G7YjBbYI=; b=O1AdvqkOjBs1iD
	1IX/48gxl7ebqP4+XDmuBHTRD5p+CC4pBayWQ51o0RT0GpvPwYTylbb+q5OIPgPncG6lx3JPV1V1K
	xzXc2qG5F1ZZJiK3pZMmw3LxyFTN+s0cKRNlsuy8SvMIepTRLpew/hmk1DtfbWefmCQHI7lNsj6VM
	Nh+sqLx6CI319LBcCnNa+BEcOBw8yEximbd8QvxFtgK/YxtfK+gkkhg7ws1K8pwgVI82JN9SmLxOI
	aAd2oglkPHhH5bkFCaLh+7bNbFJRDcKcRo7hAyXcM1KzfEHtJkd7Pl61LsPNo2KVPiG91yfwaR5yf
	MDRG9UJTZBNEw/KhvT6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNuD-00000002Kav-3b2c;
	Tue, 19 May 2026 17:06:57 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNuA-00000002KZ1-2zyy
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 17:06:56 +0000
Received: from localhost.localdomain (unknown [223.166.95.230])
	by APP-03 (Coremail) with SMTP id rQCowAAHKN+kmAxqeRCREQ--.741S2;
	Wed, 20 May 2026 01:06:44 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Song Shuai <songshuaishuai@tinylab.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Breno Leitao <leitao@debian.org>,
	Kees Cook <kees@kernel.org>,
	Han Gao <gaohan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH] riscv: kexec_file: Constrain segment placement to direct map
Date: Wed, 20 May 2026 01:06:41 +0800
Message-ID: <20260519170641.123517-1-gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAHKN+kmAxqeRCREQ--.741S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw43GrWUAr15Zw47CF1DAwb_yoW8Aw4rpa
	n8CF18XrZ5ZrySyFWxZr109345Wws5Gw42qrWUuryFv3ZxKw1DJr4q93ZIqr1UKFsY9FnY
	qryakFZIkrs5JaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
	W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUFg4SDUUUU
X-Originating-IP: [223.166.95.230]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBwsMDGoMfGlJ3gAAso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_100655_130424_E0B596AA 
X-CRM114-Status: GOOD (  10.86  )
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

When kexec_file_load places segments with buf_max=ULONG_MAX and
top_down=true, they land at the highest available physical addresses.
On RISC-V the size of the linear mapping is determined by the active
VM mode: SV39 caps the direct map at roughly 128GB, while SV48/SV57
extend the range substantially further. When the installed physical
memory exceeds the direct map size of the active mode, top-down
placement puts DTB/initrd at physical addresses outside the linearly
mapped region. The kexec'd kernel cannot reach them during early
boot, triggering a page fault at memcmp in start_kernel.

Fix by constraining buf_max to PFN_PHYS(max_low_pfn), which reflects
the runtime direct map boundary for the active VM mode (SV39/SV48/
SV57). This keeps all kexec segments within the linearly mapped
region while preserving the upstream top_down allocation strategy.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/kernel/machine_kexec_file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 54e2d9552e93..59d4bbc848a8 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -13,6 +13,7 @@
 #include <linux/libfdt.h>
 #include <linux/types.h>
 #include <linux/memblock.h>
+#include <linux/pfn.h>
 #include <linux/vmalloc.h>
 #include <asm/setup.h>
 #include <asm/insn.h>
@@ -266,7 +267,7 @@ int load_extra_segments(struct kimage *image, unsigned long kernel_start,
 
 	kbuf.image = image;
 	kbuf.buf_min = kernel_start + kernel_len;
-	kbuf.buf_max = ULONG_MAX;
+	kbuf.buf_max = PFN_PHYS(max_low_pfn);
 
 #ifdef CONFIG_CRASH_DUMP
 	/* Add elfcorehdr */
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
