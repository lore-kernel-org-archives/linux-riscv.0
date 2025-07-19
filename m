Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EB6C83F3D
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jul 2025 09:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/vvfZDbFgR0LeLCX3+TDtbUW/IaTYkZ6agFOKami08=; b=QPNy0nhSMb1Qk/
	Nud8ZyX+4TzKQXbUunE8dFOZ2cx78TSa946cgCDzP7BGUJny7GBZUUWmiCHhgk9+GLrg8og7ybskr
	uAMO80QGGOSjdq8+2GaaYSMeq8i88Xt2HRqYDXbj6ZxUbQMujgUnx7mN/KEwN3X4yl+FWha4xoZfW
	b7m9IQl4vb44auDETfJhHyedIpDbGwD6zHiQ+xscioMWtf6of2HaiWXjpW01ULlnDVrTi56qPrS9g
	f8yEAImeFDSCHOwiNR2zi6+pyZvEsRMbie7nkHCjvGyUhJLrGR8uenhmTcs4nHx98Nf+m5e9p8kC1
	xQgaTBP4ZC7Ym+pBB7KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud3eW-0000000E4gt-3B7e;
	Sat, 19 Jul 2025 09:14:44 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud3eQ-0000000E4Z2-0SNN
	for linux-riscv@lists.infradead.org;
	Sat, 19 Jul 2025 09:14:39 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bkgw11k9DzYQvFK
	for <linux-riscv@lists.infradead.org>; Sat, 19 Jul 2025 17:14:25 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id F2A5E1A17FA
	for <linux-riscv@lists.infradead.org>; Sat, 19 Jul 2025 17:14:23 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP4 (Coremail) with SMTP id gCh0CgCHURLuYXtopCAYAw--.54295S7;
	Sat, 19 Jul 2025 17:14:23 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next 05/10] riscv, bpf: Add rv_ext_enabled macro for runtime detection extentsion
Date: Sat, 19 Jul 2025 09:17:25 +0000
Message-Id: <20250719091730.2660197-6-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250719091730.2660197-1-pulehui@huaweicloud.com>
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgCHURLuYXtopCAYAw--.54295S7
X-Coremail-Antispam: 1UD129KBjvJXoWxCF4UJFyUWryUtF4kGFy7GFg_yoW5ZFykpF
	WDCr4S93s7tFyrKFWqyr13Jr1rAr4vqr17Grn2g3yDGayfZr1DG3Z3AF1jyFy5Zry8ZFyf
	AFW3GF1fuw4jk37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPvb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
	xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Y
	z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2
	AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6r
	W5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuY
	vjxUI-eODUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_021438_446838_14186C9C 
X-CRM114-Status: UNSURE (   9.70  )
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

From: Pu Lehui <pulehui@huawei.com>

Add rv_ext_enabled macro to check whether the runtime detection
extension is enabled.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit.h | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index e7b032dfd17f..0964df48c25e 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -13,21 +13,15 @@
 #include <linux/filter.h>
 #include <asm/cacheflush.h>
 
+/* verify runtime detection extension status */
+#define rv_ext_enabled(ext) \
+	(IS_ENABLED(CONFIG_RISCV_ISA_##ext) && riscv_has_extension_likely(RISCV_ISA_EXT_##ext))
+
 static inline bool rvc_enabled(void)
 {
 	return IS_ENABLED(CONFIG_RISCV_ISA_C);
 }
 
-static inline bool rvzba_enabled(void)
-{
-	return IS_ENABLED(CONFIG_RISCV_ISA_ZBA) && riscv_has_extension_likely(RISCV_ISA_EXT_ZBA);
-}
-
-static inline bool rvzbb_enabled(void)
-{
-	return IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && riscv_has_extension_likely(RISCV_ISA_EXT_ZBB);
-}
-
 enum {
 	RV_REG_ZERO =	0,	/* The constant value 0 */
 	RV_REG_RA =	1,	/* Return address */
@@ -1123,7 +1117,7 @@ static inline void emit_sw(u8 rs1, s32 off, u8 rs2, struct rv_jit_context *ctx)
 
 static inline void emit_sh2add(u8 rd, u8 rs1, u8 rs2, struct rv_jit_context *ctx)
 {
-	if (rvzba_enabled()) {
+	if (rv_ext_enabled(ZBA)) {
 		emit(rvzba_sh2add(rd, rs1, rs2), ctx);
 		return;
 	}
@@ -1134,7 +1128,7 @@ static inline void emit_sh2add(u8 rd, u8 rs1, u8 rs2, struct rv_jit_context *ctx
 
 static inline void emit_sh3add(u8 rd, u8 rs1, u8 rs2, struct rv_jit_context *ctx)
 {
-	if (rvzba_enabled()) {
+	if (rv_ext_enabled(ZBA)) {
 		emit(rvzba_sh3add(rd, rs1, rs2), ctx);
 		return;
 	}
@@ -1184,7 +1178,7 @@ static inline void emit_subw(u8 rd, u8 rs1, u8 rs2, struct rv_jit_context *ctx)
 
 static inline void emit_sextb(u8 rd, u8 rs, struct rv_jit_context *ctx)
 {
-	if (rvzbb_enabled()) {
+	if (rv_ext_enabled(ZBB)) {
 		emit(rvzbb_sextb(rd, rs), ctx);
 		return;
 	}
@@ -1195,7 +1189,7 @@ static inline void emit_sextb(u8 rd, u8 rs, struct rv_jit_context *ctx)
 
 static inline void emit_sexth(u8 rd, u8 rs, struct rv_jit_context *ctx)
 {
-	if (rvzbb_enabled()) {
+	if (rv_ext_enabled(ZBB)) {
 		emit(rvzbb_sexth(rd, rs), ctx);
 		return;
 	}
@@ -1211,7 +1205,7 @@ static inline void emit_sextw(u8 rd, u8 rs, struct rv_jit_context *ctx)
 
 static inline void emit_zexth(u8 rd, u8 rs, struct rv_jit_context *ctx)
 {
-	if (rvzbb_enabled()) {
+	if (rv_ext_enabled(ZBB)) {
 		emit(rvzbb_zexth(rd, rs), ctx);
 		return;
 	}
@@ -1222,7 +1216,7 @@ static inline void emit_zexth(u8 rd, u8 rs, struct rv_jit_context *ctx)
 
 static inline void emit_zextw(u8 rd, u8 rs, struct rv_jit_context *ctx)
 {
-	if (rvzba_enabled()) {
+	if (rv_ext_enabled(ZBA)) {
 		emit(rvzba_zextw(rd, rs), ctx);
 		return;
 	}
@@ -1233,7 +1227,7 @@ static inline void emit_zextw(u8 rd, u8 rs, struct rv_jit_context *ctx)
 
 static inline void emit_bswap(u8 rd, s32 imm, struct rv_jit_context *ctx)
 {
-	if (rvzbb_enabled()) {
+	if (rv_ext_enabled(ZBB)) {
 		int bits = 64 - imm;
 
 		emit(rvzbb_rev8(rd, rd), ctx);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
