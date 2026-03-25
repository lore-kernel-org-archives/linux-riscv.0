Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A024FEA82F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 08:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XYdZGZmYOJ3IFwMsO4NdiWDTJUMyUgdAAJlPkQUIdYM=; b=VNhDiuPXBRPb4c
	f3U/xyHCsqzCtFZZbOgvsjvqVI+xVCnZWxcVY4F+ui3jIGnm+anMeqA2Ppg3c4YfdoeBTEMtMnilj
	VW0H6yhQk2Dq8UlegQ9LIlyav+PSTf1j3PFXgb9i8/Df1GPWkmOUkiXaVu/n2Xv12/YuzO3L/HD8F
	nBQC2Cjtf2urzBSvcKl0KKwHVcnq94v/aicXpQkZND2He4thR/R1Qhuk2Tpff6HzQ4J5PjmL2r2tn
	0UErRDxG3eVDUP9rs1T/Gn3gun1Y10xlVksYjTPcd9cif9/cRQywPhaFhwIDn49D/nS9OY5SeJfD3
	LhLAcIoezYMYWbULJOmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Jed-00000002xT1-3J46;
	Wed, 25 Mar 2026 08:31:55 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JeZ-00000002xQl-465X
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 08:31:54 +0000
Received: from yzs (unknown [115.196.70.212])
	by APP-03 (Coremail) with SMTP id rQCowAAnSeBtncNpwkXDCw--.21076S2;
	Wed, 25 Mar 2026 16:31:43 +0800 (CST)
From: Zishun Yi <vulab@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zishun Yi <vulab@iscas.ac.cn>
Subject: [PATCH] riscv: Fix typo in purgatory end label
Date: Wed, 25 Mar 2026 16:31:39 +0800
Message-ID: <20260325083139.15638-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAnSeBtncNpwkXDCw--.21076S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKrWUCr1xAw4xXF4kXFykGrg_yoW3tFcEqa
	1rWrsFgr17Kr4kJr4UJr1Fyry5tw18Xryktas7uryUG34UW3W3tFWrXw17Zr13AFZ7WFWx
	JrZ8AFWavr47tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUYCJmUUUUU
X-Originating-IP: [115.196.70.212]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRARA2nDXPDs2wAAs6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_013152_391093_6FF420BF 
X-CRM114-Status: UNSURE (   7.42  )
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

Fix the spelling of 'purgatory' in the .Lkexec_purgatroy_end label.

Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>
---
 arch/riscv/purgatory/kexec-purgatory.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/purgatory/kexec-purgatory.S b/arch/riscv/purgatory/kexec-purgatory.S
index 0e9188815718..32c53581b8f2 100644
--- a/arch/riscv/purgatory/kexec-purgatory.S
+++ b/arch/riscv/purgatory/kexec-purgatory.S
@@ -6,9 +6,9 @@
 kexec_purgatory:
 	.globl	kexec_purgatory
 	.incbin	"arch/riscv/purgatory/purgatory.ro"
-.Lkexec_purgatroy_end:
+.Lkexec_purgatory_end:
 
 	.align	8
 kexec_purgatory_size:
 	.globl	kexec_purgatory_size
-	.quad	.Lkexec_purgatroy_end - kexec_purgatory
+	.quad	.Lkexec_purgatory_end - kexec_purgatory
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
