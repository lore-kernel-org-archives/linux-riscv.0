Return-Path: <SRS0=gmBF=KD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85AA3C43460
	for <linux-riscv@archiver.kernel.org>; Sat,  8 May 2021 15:49:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D48161152
	for <linux-riscv@archiver.kernel.org>; Sat,  8 May 2021 15:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D48161152
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ukq6M3dhI/l3UEz2XPwuCa48hjlmlGvjYWZKtCKBwFI=; b=OaluTMfdRHoINFNoXMTFe6twVg
	SaAeC9gxMnk7TbCkva6ra6H4yT27mz0eoOa+5fPlCXmrPvinLZj7K4w9jTHgKSx9MHdz/dRrnnEBE
	SUOJdhd6ck4U3BZ6gY/4jxofdqjxVv9OcwQX8uDZkm5qZ2p+Y1J+GcXltv7xqKzFtftPeeyuEhInR
	JDs8FLvd4fI+RXeoAAsxTKw91Ivk7/9+QC8piCD8vcaNdeLoDyiF2P4Srx+AT6uJcLgEGmFyPlveO
	zis9YlA3dNDtyNwj6X501n7NLXVIMlj4q0wq1Hb62f15M7nguim68HxFercJQsQgZMmUiTtJ1MTWO
	ilMJn7ZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lfPCo-009roK-ME; Sat, 08 May 2021 15:49:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfPCm-009rnK-Ec
 for linux-riscv@desiato.infradead.org; Sat, 08 May 2021 15:49:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=30943O0R59jxDTzI32LnwOuhF+THVYq4XlJ4VEaU5rQ=; b=3YFgDT565z1ycPYNa0+SRmYyKS
 H4rtx6h+8olTH2OPrKEMmndhMTEwHVpKCrkXnNe+1QCVGbi8LLSMFDip7bzqflFTLKP3HT411faec
 NR90dB3/SrA1mx9xg7/08SKFaMp+TyLcwO9t7WkRGQ+DM6FOltJXXGPkSPxAxWZBn5xYWY8ISCKGc
 4No3R6FIVftOCFNwiaTXa2MzOs2uV1pgaLnIKfuffCzezzzzfE+I0Thljc5u+cRneXkD0AaNJcJvc
 8sFfHYDf6UAn0bigOzm8vUsXfaBdeNFunkpBMx0/taySmApnFrdo1CTKk/MHOT5NMVA4+QNbr3Ptd
 mAEfNGCw==;
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lfPCf-007cZy-KV
 for linux-riscv@lists.infradead.org; Sat, 08 May 2021 15:49:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=30943O0R59jxDTzI32LnwOuhF+THVYq4XlJ4VEaU5rQ=; b=npbcOiaRYb1+B
 qgVIWLHBmMfZZ10JnR52+YsRVQiYemB/kvwrOdcF7DzFbL1kV4R4s9Yw8ZElPgNH
 PV9ePKeGbfHIULzRHAfXbOwEmSsTIgNaRPHIUcb3cuvWc2KflYzhRLqmUOhRYVbB
 DTfYmWTvq7YJdUZz8LEWnsIBeqUFvk=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygBXXZ3wspZg7YCmAA--.28038S2; 
 Sat, 08 May 2021 23:49:05 +0800 (CST)
Date: Sat, 8 May 2021 23:43:47 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: kprobes: Fix build error when MMU=n
Message-ID: <20210508234347.0b40b94a@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygBXXZ3wspZg7YCmAA--.28038S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyxArWDtFy8KFW8AFWrKrg_yoW8GrWfpF
 4DCws8ArWrJw4fG3y3tw4kuw10van8Ww43KrWDJr15Aw15Jr4DAws2grWxXrn0gryYkrWf
 Cr4DZrWFyayxA37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyYb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
 s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
 1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
 JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
 W3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8
 JbIYCTnIWIevJa73UjIFyTuYvjxUcDDGUUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210508_084918_368200_4F4C73AF 
X-CRM114-Status: UNSURE (   7.46  )
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

From: Jisheng Zhang <jszhang@kernel.org>

lkp reported a randconfig failure:

arch/riscv/kernel/probes/kprobes.c:90:22: error: use of undeclared identifier 'PAGE_KERNEL_READ_EXEC'

We implemented the alloc_insn_page() to allocate PAGE_KERNEL_READ_EXEC
page for kprobes insn page for STRICT_MODULE_RWX. But if MMU=n, we
should fall back to the generic weak alloc_insn_page() by generic
kprobe subsystem.

Fixes: cdd1b2bd358f ("riscv: kprobes: Implement alloc_insn_page()")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
---
 arch/riscv/kernel/probes/kprobes.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 10b965c34536..15cc65ac7ca6 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -84,6 +84,7 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
 	return 0;
 }
 
+#ifdef CONFIG_MMU
 void *alloc_insn_page(void)
 {
 	return  __vmalloc_node_range(PAGE_SIZE, 1, VMALLOC_START, VMALLOC_END,
@@ -91,6 +92,7 @@ void *alloc_insn_page(void)
 				     VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
 				     __builtin_return_address(0));
 }
+#endif
 
 /* install breakpoint in text */
 void __kprobes arch_arm_kprobe(struct kprobe *p)
-- 
2.31.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
