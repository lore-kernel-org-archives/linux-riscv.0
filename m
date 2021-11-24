Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D34CC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Nov 2021 11:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/DTxxPL1K8g57fb6Wi7prYoVz4W3NGYG0NoGd6+Pa84=; b=tXinFSgPNYORhS
	0+u8fnVpnb5Gk/YiLkWFc84LwO0sIUHgLGXtILX8kU8iYibWBYWOHOO8xg0WCpODtvl6ck6Viddos
	2wKC5excqe6CQTCCP5g7WE8LKqs96JTnu8zOoLrcY4yG/gB/qTWNcv44Cqpwv9rCvtW75R2Vc4C62
	/7qIwV6qYOI4qjpFkihVfUC+Nl0slWCyYmlVBkeBMUuKGmcmYLWnsCb0e7hoQmn0cf/dwlJk+fqkm
	LMhcXlMLCGyrJgPRktl6pV9aKyRHNnoyzBn+qFN9NI6xr0FBtTc/Zdx7rRylIIQaAnVv+vi781318
	wX08ki+pBQwCIPaq5Gbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpqJ4-004ZEQ-HV; Wed, 24 Nov 2021 11:19:18 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpqIy-004ZC1-AM
 for linux-riscv@lists.infradead.org; Wed, 24 Nov 2021 11:19:14 +0000
Received: from localhost.localdomain (unknown [124.16.141.242])
 by APP-01 (Coremail) with SMTP id qwCowAB3QCOgH55hHGFRCA--.5713S4;
 Wed, 24 Nov 2021 19:19:04 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v1 2/2] Documentation, mm: Add Sv57 vm layout documentation
Date: Wed, 24 Nov 2021 19:18:29 +0800
Message-Id: <20211124111829.788114-3-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211124111829.788114-1-panqinglin2020@iscas.ac.cn>
References: <20211124111829.788114-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAB3QCOgH55hHGFRCA--.5713S4
X-Coremail-Antispam: 1UD129KBjvJXoWxXF1fuF4fAF1Dtr1fAr1DZFb_yoW5ZF43pr
 n8JryxGr48Jry7Jw1UJr15Jr1UAr18Aa1UJr1rJr1UJryUGr1UJr1UJr15Jr1DGr15Ar17
 Jr1DGrWUtr1UJw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPq14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2vY
 z4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
 02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
 4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4
 kE6xkIj40Ew7xC0wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s02
 6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF
 0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
 c7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
 v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x
 0JUoWlkUUUUU=
X-Originating-IP: [124.16.141.242]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_031912_822071_8FC3A306 
X-CRM114-Status: UNSURE (   7.41  )
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

From: Qinglin Pan <panqinglin2020@iscas.ac.cn>

This patch adds descriptions of Sv57 into vm-layout.rst. When using
Sv57, the kernel will use 0xff80000000000000 as PAGE_OFFSET.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
---
 Documentation/riscv/vm-layout.rst | 36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
index f10128e0a95f..5c115355a8f9 100644
--- a/Documentation/riscv/vm-layout.rst
+++ b/Documentation/riscv/vm-layout.rst
@@ -97,3 +97,39 @@ RISC-V Linux Kernel SV48
    ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules, BPF
    ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
   __________________|____________|__________________|_________|____________________________________________________________
+
+
+RISC-V Linux Kernel SV57
+------------------------
+
+::
+
+  ========================================================================================================================
+        Start addr    |   Offset   |     End addr     |  Size   | VM area description
+  ========================================================================================================================
+                      |            |                  |         |
+     0000000000000000 |    0       | 00ffffffffffffff |  64 PB  | user-space virtual memory, different per mm
+    __________________|____________|__________________|_________|___________________________________________________________
+                      |            |                  |         |
+     0100000000000000 |  +64    PB | feffffffffffffff | ~16M TB | ... huge, almost 64 bits wide hole of non-canonical
+                      |            |                  |         | virtual memory addresses up to the -64 PB
+                      |            |                  |         | starting offset of kernel mappings.
+    __________________|____________|__________________|_________|___________________________________________________________
+                                                                |
+                                                                | Kernel-space virtual memory, shared between all processes:
+    ____________________________________________________________|___________________________________________________________
+                      |            |                  |         |
+     ff00000000000000 |  -64    PB | ff1fffffffffffff |    8 PB | kasan
+     ff3bfffffee00000 |  -49    PB | ff3bfffffeffffff |    2 MB | fixmap
+     ff3bffffff000000 |  -49    PB | ff3bffffffffffff |   16 MB | PCI io
+     ff3c000000000000 |  -49    PB | ff3fffffffffffff |    1 PB | vmemmap
+     ff40000000000000 |  -48    PB | ff7fffffffffffff |   16 PB | vmalloc/ioremap space
+     ff80000000000000 |  -32    PB | fffffffeffffffff |   32 PB | direct mapping of all physical memory
+    __________________|____________|__________________|_________|____________________________________________________________
+                                                                |
+                                                                | Identical layout to the 39-bit one from here on:
+    ____________________________________________________________|____________________________________________________________
+                      |            |                  |         |
+     ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules, BPF
+     ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
+    __________________|____________|__________________|_________|____________________________________________________________
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
