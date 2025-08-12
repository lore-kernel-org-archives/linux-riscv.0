Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D138CA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 16:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tabSuGYWco64thaJvva4/2ybrbyoSwdsZ5UFtm7A3BI=; b=YsWz12cgkvMrVw
	2ngWVKX+VpOjpy0ZGmBQGRiqWVReXXlEjSUUcL5NnAYwfsut+RrqRkqvKEdWAoxOB5jPkl/RprzUP
	2xxg1iwVqowQLZF47yAM1wJteSRRW4fTeGAk99Bf2RLsHPnGZ9PdjtshYfj+3L8cJuZpUHHF+TCCG
	nCqI7FFnZpkCfI4wdL2t5yIcHK/Om0SS03lIUL585HT54naV2V6pQ0LJStC7U6/UgJVgA4ev/ss4T
	mva4dNtCUX5JGaBhtbQkFUimEQfjicvyNRun4GtZXmo7GRXNVtmzeeQCIVFI+s87p5V5IepaPciZ2
	uvK0idSGGEJouqtLYrYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrla-0000000BMpy-1IMl;
	Tue, 12 Aug 2025 16:22:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulo09-0000000AgCp-1Wqm
	for linux-riscv@bombadil.infradead.org;
	Tue, 12 Aug 2025 12:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=IJasn0of4ZfgWpMaOoC43Fe95Yd9y8lE2HTzZQXa9Kg=; b=McoTJ6RZy3QL4RniwFNvq8djPc
	rGnue5uLaM8X+Lmgcb0ZwgHB2qrf7yLT/vTNnoU5kZ7Bc7oYwbF8TMHzlfRFPwtaKZgfgFtb9qHzC
	2OgB9g0+/DUDCc1/8cDDnkEHKK01CboJjiE8yRY71wjYOGivaB4WnPAO9O44GYHa/H/wNYmMz4Lp3
	APPAb8EkFcsOzYShFfHM2uABY1Mb+Iuj+pYKzTFX6k3qkllxKXK2dzFwGAKN/1ga8spVaeCbIXi/u
	C3/giJwT1THvj3LOp9Tws4FRySuxTgPLGYIB1zUVWPTDI9Q2GvcGVrR8vmfxoa7pTsOkw++26UY9k
	mc3lSONw==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulo03-0000000FxB9-0q7f
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 12:21:11 +0000
Received: from loongson.cn (unknown [111.207.111.194])
	by gateway (Coremail) with SMTP id _____8AxaeGhMZto2_M+AQ--.10741S3;
	Tue, 12 Aug 2025 20:20:49 +0800 (CST)
Received: from ubuntu.. (unknown [111.207.111.194])
	by front1 (Coremail) with SMTP id qMiowJCxH8KeMZtoQ5dGAA--.16281S2;
	Tue, 12 Aug 2025 20:20:47 +0800 (CST)
From: Ming Wang <wangming01@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ming Wang <wangming01@loongson.cn>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: lixuefeng@loongson.cn,
	chenhuacai@loongson.cn,
	Huang Cun <cunhuang@tencent.com>
Subject: [PATCH] LoongArch: Increase COMMAND_LINE_SIZE to 4096
Date: Tue, 12 Aug 2025 20:20:43 +0800
Message-ID: <20250812122043.2462836-1-wangming01@loongson.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: qMiowJCxH8KeMZtoQ5dGAA--.16281S2
X-CM-SenderInfo: 5zdqwzxlqjiio6or00hjvr0hdfq/1tbiAQEMEmia16IHHwAAsB
X-Coremail-Antispam: 1Uk129KBj93XoW7uw1kZry3trWktF13Kw47KFX_yoW8Ar13pF
	98ursrGa1rCr1fCrWSqa4xur1Fka97Ww1Yya4Ig3y8KFnaq34vkr4vgFZIkFyUXw47X348
	Z3ZYg34j9F1UX3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8ctx3UU
	UUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_132108_513738_1445BE43 
X-CRM114-Status: GOOD (  10.13  )
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

The default COMMAND_LINE_SIZE of 512, inherited from asm-generic, is
too small for modern use cases. For example, kdump configurations or
extensive debugging parameters can easily exceed this limit.

Therefore, increase the command line size to 4096 bytes, aligning
LoongArch with the MIPS architecture. This change follows a broader
trend among architectures to raise this limit to support modern needs;
for instance, PowerPC increased its value for similar reasons in
commit a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE to 2048").

Similar to the change made for RISC-V in commit 61fc1ee8be26
("riscv: Bump COMMAND_LINE_SIZE value to 1024"), this is considered
a safe change. The broader kernel community has reached a consensus
that modifying COMMAND_LINE_SIZE from UAPI headers does not
constitute a uABI breakage, as well-behaved userspace applications
should not rely on this macro.

Suggested-by: Huang Cun <cunhuang@tencent.com>
Signed-off-by: Ming Wang <wangming01@loongson.cn>
---
 arch/loongarch/include/uapi/asm/setup.h | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 arch/loongarch/include/uapi/asm/setup.h

diff --git a/arch/loongarch/include/uapi/asm/setup.h b/arch/loongarch/include/uapi/asm/setup.h
new file mode 100644
index 000000000000..d46363ce3e02
--- /dev/null
+++ b/arch/loongarch/include/uapi/asm/setup.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#ifndef _UAPI_ASM_LOONGARCH_SETUP_H
+#define _UAPI_ASM_LOONGARCH_SETUP_H
+
+#define COMMAND_LINE_SIZE	4096
+
+#endif /* _UAPI_ASM_LOONGARCH_SETUP_H */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
