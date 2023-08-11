Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8222DC001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 10:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sySKMHWiYIeXFK1/AA/KA8uq2gWKQL1VJUIU8CbfAqo=; b=cvpDbpa7l2ItjI
	w1f5S46+Mn2zyPiXFm0P3KVegDfbW+/jxa9KYkmINjz02yMHDiBAhmGLU6fzB/lmpMHlh+HHPJDB6
	FFAxT5J1ETC+rbR8Vd6pDSzljqRAuG2+tjq06nibUdEpschomptLBGkL4GqLRVxw4FjHSneqAt9QD
	ZHUAeFlOfVqAbnQay+IE9g1IPJ9fEVKPI4jfDnXJAjhYIQALKPzzEBoR7MAIV2sffMERmYASFwS32
	fa/VJ5oNzUnDQiaVLk7tewt8XhnTos0W7no9Gv0fFTBy9UPTlCA+HvzJYu3M2cFArGjBRTUhUPMRE
	uvflBNiyw86xbg6JmXdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUPd9-00AJS3-19;
	Fri, 11 Aug 2023 10:44:31 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUPd4-00AJPF-0H;
	Fri, 11 Aug 2023 10:44:28 +0000
X-QQ-mid: bizesmtp74t1691750628twnppqc9
Received: from localhost.localdomain ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Aug 2023 18:43:47 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: KvvwR/hcPA3wDrxxoGx7Hw85J4fbnAHT/H6ppnRFPhsFCSqdab+/VWSV20sET
	2xTPGfF6DrfqK+G/9RdWT5MQe9YPAnRe22ySVL5ii6heLXHTiRtulaER7hAO20H/4XkFaAs
	xbaIFkoka/Z/i7T1yyro55Gg36dNsCvC9+vVaUqtrewO47s1w0m+Kj9wELTU94or9xZ1uB7
	BPpS2YO1+ilDno1p3uy6VDS+QDVuydK//5LDKWBMXeWXoE+cPAivKsS2sdZbXAN6t0nFPfB
	TBUalr/SY822ZptygsBHhrL71qm1kvMZYBqhBL7+prbeyZ7BPJvcyqFV8oxtrviO5hGfVyX
	fO7+6CYYu0RR8Wheh5v/lXw0IAMGkfSSg9PxzDx
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3284283975334745037
From: Song Shuai <songshuaishuai@tinylab.org>
To: xianting.tian@linux.alibaba.com,
	guoren@kernel.org,
	horms@kernel.org,
	huanyi.xj@alibaba-inc.com,
	mick@ics.forth.gr,
	yixun.lan@gmail.com
Cc: kexec@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Song Shuai <songshuaishuai@tinylab.org>
Subject: [PATCH 1/2] RISC-V: Use linux,usable-memory-range for crash kernel
Date: Fri, 11 Aug 2023 18:41:16 +0800
Message-Id: <20230811104117.91406-1-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_034426_469300_774EFA5C 
X-CRM114-Status: GOOD (  10.17  )
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

Now we use "memeory::linux,usable-memory" to indicate the available
memory for the crash kernel.

While booting with UEFI, the crash kernel would use efi.memmap to
re-populate memblock and then first kernel's memory would be corrputed.
Consequently, the /proc/vmcore file failed to create in my local test.

And according to "chosen" dtschema [1], the available memory for the
crash kernel should be held via "chosen::linux,usable-memory-range"
property which will re-cap memblock even after UEFI's re-population.

[1]:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/chosen.yaml

Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
 kexec/arch/riscv/kexec-riscv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kexec/arch/riscv/kexec-riscv.c b/kexec/arch/riscv/kexec-riscv.c
index fe5dd2d..5aea035 100644
--- a/kexec/arch/riscv/kexec-riscv.c
+++ b/kexec/arch/riscv/kexec-riscv.c
@@ -79,20 +79,20 @@ int load_extra_segments(struct kexec_info *info, uint64_t kernel_base,
 		}
 
 		ret = dtb_add_range_property(&fdt->buf, &fdt->size, start, end,
-					     "memory", "linux,usable-memory");
+					     "chosen", "linux,usable-memory-range");
 		if (ret) {
-			fprintf(stderr, "Couldn't add usable-memory to fdt\n");
+			fprintf(stderr, "Couldn't add usable-memory-range to fdt\n");
 			return ret;
 		}
 
 		max_usable = end;
 	} else {
 		/*
-		 * Make sure we remove elfcorehdr and usable-memory
+		 * Make sure we remove elfcorehdr and usable-memory-range
 		 * when switching from crash kernel to a normal one.
 		 */
 		dtb_delete_property(fdt->buf, "chosen", "linux,elfcorehdr");
-		dtb_delete_property(fdt->buf, "memory", "linux,usable-memory");
+		dtb_delete_property(fdt->buf, "chosen", "linux,usable-memory-range");
 	}
 
 	/* Do we need to include an initrd image ? */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
