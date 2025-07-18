Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396A6C83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 07:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qskxqgiWUTDJhxplJbs/om/DYP+IDVCdgwZnnfPpNpQ=; b=yLf+Ddw6a5sC1T
	S7+NYFalHRtUU3Z/Kmp5QDFiL71dZFP72gGMAtIfHSObMTb1igvPLG0aeWIDiRsHB0+d+u7fiDhTa
	1u1WoMjkjZfrTt87C9zTe2Htx+EPoNgq9heChgYBaW2GVy6XUWJrdxxZ/X/E1nxT7Tr5Abohj114n
	qAj+J1K7IwdF3JDK6cMcx1hQqJdzoK7LdttVDEuLXAP917MYNxVmGEskr7IYpgh1qCaA7bmFIoHlq
	q+59ZgNLTyX/XEa5hFltUIQkdAqtAsQuDYm4LQdkLdcSQ4EfG3I/+viOgjEmG/zPMO1eo1MowmU+t
	dUzLV9HwdqZo13TnVCuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfWn-0000000BtAk-1faP;
	Fri, 18 Jul 2025 07:29:09 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfVJ-0000000BstX-1hAQ
	for linux-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 07:27:38 +0000
Received: from ubt.. (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowADnD6RT93loK4wdBQ--.27021S7;
	Fri, 18 Jul 2025 15:27:30 +0800 (CST)
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>
Cc: linux-riscv@lists.infradead.org,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH V3 5/5] raid6: test: Add support for RISC-V
Date: Fri, 18 Jul 2025 15:27:11 +0800
Message-Id: <20250718072711.3865118-6-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718072711.3865118-1-zhangchunyan@iscas.ac.cn>
References: <20250718072711.3865118-1-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADnD6RT93loK4wdBQ--.27021S7
X-Coremail-Antispam: 1UD129KBjvdXoWrurW8tr17GryUAF1kXF48tFb_yoWkCrc_Ca
	4Ikr92qr4xXay09anrZr9ayrs5Ar43tr1rC34rXr13JF17Kw1aga1UX3W3CFWYva15WayS
	9FWrZF18Z34jqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbB8YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
	IE14v26r126s0DM28IrcIa0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0
	c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2
	IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280
	aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
	Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S
	6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mx
	kF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
	s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
	CVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
	JbIYCTnIWIevJa73UjIFyTuYvjxUcJ5rUUUUU
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiCQ4HB2h5z-iMPAAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_002737_807358_C4F41A42 
X-CRM114-Status: UNSURE (   7.22  )
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

From: Chunyan Zhang <zhang.lyra@gmail.com>

Add RISC-V code to be compiled to allow the userspace raid6test program
to be built and run on RISC-V.

Signed-off-by: Chunyan Zhang <zhang.lyra@gmail.com>
---
 lib/raid6/test/Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/raid6/test/Makefile b/lib/raid6/test/Makefile
index 8f2dd2210ba8..09bbe2b14cce 100644
--- a/lib/raid6/test/Makefile
+++ b/lib/raid6/test/Makefile
@@ -35,6 +35,11 @@ ifeq ($(ARCH),aarch64)
         HAS_NEON = yes
 endif
 
+ifeq ($(findstring riscv,$(ARCH)),riscv)
+        CFLAGS += -I../../../arch/riscv/include -DCONFIG_RISCV=1
+        HAS_RVV = yes
+endif
+
 ifeq ($(findstring ppc,$(ARCH)),ppc)
         CFLAGS += -I../../../arch/powerpc/include
         HAS_ALTIVEC := $(shell printf '$(pound)include <altivec.h>\nvector int a;\n' |\
@@ -63,6 +68,9 @@ else ifeq ($(HAS_ALTIVEC),yes)
                 vpermxor1.o vpermxor2.o vpermxor4.o vpermxor8.o
 else ifeq ($(ARCH),loongarch64)
         OBJS += loongarch_simd.o recov_loongarch_simd.o
+else ifeq ($(HAS_RVV),yes)
+        OBJS   += rvv.o recov_rvv.o
+        CFLAGS += -DCONFIG_RISCV_ISA_V=1
 endif
 
 .c.o:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
