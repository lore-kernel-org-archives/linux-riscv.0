Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFA7CCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 15:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hG6Bq/IBht7LWwoDQaYTEhnW+BVRFtRiVoKqVabz+2E=; b=wTxhiKW/rtaKjZ
	qUefaF4LIssZjf9LZKSYD1ejZA2h2yzc/2ecXUUwQA1/gJ6m8qvHFgCPpvgQQ0cuSrj3WpqAw1UO+
	eSZzm7k8xyBsO+g4E1JRsp7Myyt59pCL8BOobSgdv05B9M1qWJPcn/7FHX6bvfUABfG5bDnVKHpn1
	VAPeThmzYEvMYpXx3Gp8aYdif5w8spkYt63A10E6NeBU9Gb5BEGuvTMIJLi4WKEfdoGn5A+Ce4nW/
	SJL8tC1Jan88jvYN55S/73l10rM5QOPZzbW9IZ8ywXFoYNGFMiB8YOmq+S0Xc8YK2lmsDZV9ypfh6
	CoxdoSnkH3Mq4LlNc2YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArt3-0000000E9HG-19QS;
	Mon, 20 Oct 2025 15:33:29 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArt0-0000000E9FK-2YIK
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 15:33:28 +0000
Received: from Mobilestation.localdomain (unknown [183.6.59.216])
	by APP-01 (Coremail) with SMTP id qwCowABHoaM4VvZoynsZEg--.39132S2;
	Mon, 20 Oct 2025 23:33:21 +0800 (CST)
From: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
To: zihong.plct@isrc.iscas.ac.cn
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
	alexghiti@rivosinc.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com,
	evan@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	shuah@kernel.org,
	zhangyin2018@iscas.ac.cn,
	zihongyao@outlook.com
Subject: [PATCH v3 1/2] riscv: hwprobe: Expose Zicbop extension and its block size
Date: Mon, 20 Oct 2025 23:33:08 +0800
Message-ID: <20251020153309.68267-1-zihong.plct@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251020152924.64551-1-zihong.plct@isrc.iscas.ac.cn>
References: <20251020152924.64551-1-zihong.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowABHoaM4VvZoynsZEg--.39132S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGFWkXrWkWF45GryDKw4DArb_yoWrAF18pF
	4DZrsxWFs8Cw4xCFWxt3WkZrn5J3Z7Kw43KF1Uu3yUJFW7trWrXr9xtFsIyr1DtFyFya92
	gF4SgrZYya9rAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUZYFZUUUUU=
X-Originating-IP: [183.6.59.216]
X-CM-SenderInfo: p2lk00vjoszunw6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_083327_017021_E74E92D9 
X-CRM114-Status: GOOD (  13.53  )
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

- Add `RISCV_HWPROBE_EXT_ZICBOP` to report the presence of the
  Zicbop extension.
- Add `RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE` to expose the block
  size (in bytes) when Zicbop is supported.
- Update hwprobe.rst to document the new extension bit and block
  size key, following the existing Zicbom/Zicboz style.

Signed-off-by: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
---
 Documentation/arch/riscv/hwprobe.rst  | 8 +++++++-
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
 4 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 2f449c9b15bd..52f12af43b9d 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -275,6 +275,9 @@ The following keys are defined:
        ratified in commit 49f49c842ff9 ("Update to Rafified state") of
        riscv-zabha.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOP`: The Zicbop extension is supported, as
+       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
      :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
      mistakenly classified as a bitmask rather than a value.
@@ -369,4 +372,7 @@ The following keys are defined:
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
         vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
-	Instruction Extensions Specification.
\ No newline at end of file
+	Instruction Extensions Specification.
+
+* :c:macro:`RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE`: An unsigned int which
+  represents the size of the Zicbop block in bytes.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 948d2b34e94e..2f278c395af9 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 14
+#define RISCV_HWPROBE_MAX_KEY 15
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 5d30a4fae37a..9cc508be54c5 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -82,6 +82,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
 #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
 #define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
+#define		RISCV_HWPROBE_EXT_ZICBOP	(1ULL << 59)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
@@ -107,6 +108,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE	12
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0	13
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0	14
+#define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 000f4451a9d8..7a6ae1327504 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -113,6 +113,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOM);
+		EXT_KEY(ZICBOP);
 		EXT_KEY(ZICBOZ);
 		EXT_KEY(ZICNTR);
 		EXT_KEY(ZICOND);
@@ -293,6 +294,11 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOM))
 			pair->value = riscv_cbom_block_size;
 		break;
+	case RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE:
+		pair->value = 0;
+		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOP))
+			pair->value = riscv_cbop_block_size;
+		break;
 	case RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS:
 		pair->value = user_max_virt_addr();
 		break;
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
