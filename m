Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB82C61DFD
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 09:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Subject:To:References:
	Message-Id:Date:Cc:In-Reply-To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPmMA52TXQCZPMsEInTKAaI6ceQ2bbUo0EAZqGPkM80=; b=CscwQAGjhRVTPY
	p4mJtDMKjhXg4rZvX7dehAvM5gUGo8QFx7wSI6rOz5CPLKZtcCs+3fcypGGtxdeJnk8UgJQRIiQXy
	HrJ296XJWDXwkDqJQAQf2SwXZsNHScsny4An6CMiG+60riNa734UiT1rMEg76tism6HRyhAb3xzC7
	mPh5CSWmTSh6FG5d6XeNHggjWwLaXfWfGpUxQFdqCTHUdymshjkSIIvbg18wXvCMdyHccM/vgRuJs
	tWaQSrS6Z3y/uY7Ak2sif/cCnQtFzP6EXOGWa+5S1gKFSD+m32tgj5rN/6VeRP1my4+EJ84UJ+QqO
	gPwuArX4sIssOfjpx8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gxx-0000000EBHd-0DKB;
	Wed, 02 Sep 2026 09:09:09 +0000
Received: from va-2-27.ptr.blmpb.com ([209.127.231.27])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gxr-0000000EBFz-2GCj
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 09:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1788340138; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=C50quJcwO5XVGyYBcmo1hG+o10dNM+2wEjOwukPtWwY=;
 b=HWXaBiVjdiuaIE60TfJ0uL5CZSkuKEf91ukIJA48qPEUONASvLZW1AbDXyUtES6gVLqyKc
 9kunO4rCl25aCi3e7TJJrYjhsGMXjM0m+FCdnC4/H1yEGz8Z2KAq52NL97PYAl6URbiTKP
 J6MfXxW0vs7hoRRHG5bjMvMiEZRH9rNllujVlEIHtTZjSxHSSujLv321cC4Gcu5X0wEoP7
 TnM4XptPqV5hh+83MBuMO1B1w2TyD93jImZO8eRMGsikujtkoDLMw5z1vCbVyp0ZSmZ3KW
 zcz9zi0ygH61yJ6Q8wN1CqL4/onDBDsBRJG1fIZDEf/wyr+wzGlJ7gZjDA932Q==
From: "Yufan Dou" <douyufan@picoheart.com>
X-Mailer: git-send-email 2.53.0
Received: from 5CG30262N9-QAP.localdomain ([120.234.49.250]) by smtp.feishu.cn with ESMTPS; Wed, 02 Sep 2026 17:08:55 +0800
X-Original-From: Yufan Dou <douyufan@picoheart.com>
X-Lms-Return-Path: <lba+26a97e7a8+64409f+lists.infradead.org+douyufan@picoheart.com>
In-Reply-To: <20260902090850.2601-1-douyufan@picoheart.com>
Cc: <alex@ghiti.fr>, <leitao@debian.org>, <akpm@linux-foundation.org>, 
	<ajones@ventanamicro.com>, <lizhengyu3@huawei.com>, 
	<liaochang1@huawei.com>, <songshuaishuai@tinylab.org>, 
	<bjorn@rivosinc.com>, <gaohan@iscas.ac.cn>, <douyufan@picoheart.com>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<yang.yicong@picoheart.com>, <weidong.wd@picoheart.com>, 
	<geshijian@picoheart.com>
Date: Wed,  2 Sep 2026 17:08:48 +0800
Message-Id: <20260902090850.2601-2-douyufan@picoheart.com>
References: <20260902090850.2601-1-douyufan@picoheart.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
Subject: [PATCH RESEND 1/3] riscv: kexec_file: constrain extra segments to the Sv39 direct map
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_020903_770734_179DE63A 
X-CRM114-Status: GOOD (  14.59  )
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

When an Sv48 or Sv57 kernel loads an Sv39 kernel, top-down allocation
can place the initrd and other extra segments above the direct-map
range supported by the next kernel.

During early boot, setup_bootmem() limits usable memory to
phys_ram_base + KERN_VIRT_SIZE. Any segment placed above the Sv39 limit
is therefore unreachable by the next kernel. In particular, an initrd
outside this range is disabled during boot.

The max_low_pfn limit only reflects the direct map of the loading kernel
and is insufficient when the next kernel uses a narrower address space.

The paging mode of the next kernel is not known at load time, so apply
the Sv39 limit unconditionally. On a machine with more than 128 GiB this
also constrains a next kernel that would run in Sv48 or Sv57.

Limit extra segment placement to the smaller of the loading kernel's
direct-map limit and the end of the Sv39 direct map. The next kernel
derives its direct map from the start of the memory it is given, which
is the crash kernel region for a crash image, so use that region as the
base in that case. A NOMMU kernel has no direct map and keeps the limit
of the loading kernel.

Fixes: b67a1ee0db00 ("riscv: kexec_file: Constrain segment placement to direct map")
Co-developed-by: Yicong Yang <yang.yicong@picoheart.com>
Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
Signed-off-by: Yufan Dou <douyufan@picoheart.com>
---
 arch/riscv/kernel/machine_kexec_file.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 26cd2a8bd0cd..15a3c180c558 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -239,6 +239,29 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 }
 
 
+/*
+ * The next kernel may run in Sv39 even when the current kernel runs in Sv48 or
+ * Sv57, in which case the direct map of the next kernel is narrower. Any
+ * segment placed above it is unreachable by the next kernel during early boot.
+ * The next kernel derives its direct map from the start of the memory it is
+ * given, which is the crash kernel region for a crash image. A NOMMU kernel
+ * has no direct map, so only the limit of the current kernel applies.
+ */
+static unsigned long kexec_segment_limit(struct kimage *image)
+{
+	unsigned long limit = PFN_PHYS(max_low_pfn);
+#ifdef CONFIG_MMU
+	unsigned long base = phys_ram_base;
+
+#ifdef CONFIG_CRASH_DUMP
+	if (image->type == KEXEC_TYPE_CRASH)
+		base = crashk_res.start;
+#endif
+	limit = min(limit, base + BIT(VA_BITS_SV39 - 2) - 1);
+#endif
+	return limit;
+}
+
 int load_extra_segments(struct kimage *image, unsigned long kernel_start,
 			    unsigned long kernel_len, char *initrd,
 			    unsigned long initrd_len, char *cmdline,
@@ -252,7 +275,7 @@ int load_extra_segments(struct kimage *image, unsigned long kernel_start,
 
 	kbuf.image = image;
 	kbuf.buf_min = kernel_start + kernel_len;
-	kbuf.buf_max = PFN_PHYS(max_low_pfn);
+	kbuf.buf_max = kexec_segment_limit(image);
 
 #ifdef CONFIG_CRASH_DUMP
 	/* Add elfcorehdr */
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
