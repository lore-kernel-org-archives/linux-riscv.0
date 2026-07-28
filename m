Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EC2C54F4C
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 09:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Cc:In-Reply-To:
	Mime-Version:Message-Id:From:To:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/uwaNStwHqvCYUOOS/5vlmG8ZBk8BIdQ+cwKEuhkSSQ=; b=0s3koSNlD7Ht8himz/Vgikp7OO
	UvaeRhCEGNU3SD2DUhKaZMsrp+YnNme23GjtAFBhf2mMbymjlF77hizAwitbaTQAiyi9qV3MjR+Py
	KmtXGqHEf6rw7K0ppQISfW+tXlU8fP0oj2JyQxf8s+OdFTYK+vi6JFU7BkHQyC1I8HY1/uZp81n52
	9ssUUlN8DWOSWG8XosxJAvAKOMVy8I1cB//0I1hBRkPPJ0H4EAGF7+WWgAfjgQjCAImVxHFGBzHWW
	4SHZeyCEdLS87ebu9fm/iKh8zfpoAhOpcsLKZWdhnEgB8bg6seQOnAro+bj6LfJxjPq+e4elCoeDp
	j3XJp6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeOd-00000004s1p-0EEx;
	Tue, 28 Jul 2026 09:46:47 +0000
Received: from va-2-28.ptr.blmpb.com ([209.127.231.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeOY-00000004rz3-1qAE
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 09:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1785231994; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=4oWoCZaH3rI14mjPhf0xTXdM7Tg0/nk3tpRdahAoMZw=;
 b=E/FEXajvoQ9AzDYcV1vMYhu3ntbRD96SoCqBU+Ou0/xDUUf5euYgaRTCEQ2Ot3ysBzjRwG
 fbvTVyQ5j+OuwFiMvJ8H5f9LoXOXxm65f9TfjJI6yQZx/hYvByn5xqqmEMBrIG1wTRjUK9
 SuD94etDPyOqzE7djXP7c4DGlFLX0dK8Yv0PRocKFtOzWWzJpV5vRR6v+IDigUkchdfeAj
 84MQDoPy99ts93ZLYVC8f+dfXfzAk3pu6risiWmVaoOVtVKXvHR4OnL7tOzhOFbSOekUzl
 lsvNMgTlbcE/+ZM7DPrRVmo7dJetympP2YGPghKl5YD7CJt2riAVHWCirB1sJg==
References: <20260728094627.94975-1-yang.yicong@picoheart.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Message-Id: <20260728094627.94975-2-yang.yicong@picoheart.com>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26a687a78+b8ba3f+lists.infradead.org+yang.yicong@picoheart.com>
In-Reply-To: <20260728094627.94975-1-yang.yicong@picoheart.com>
Cc: <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>, <yang.yicong@picoheart.com>
Subject: [PATCH v2 1/6] riscv: Make get_insn public for instruction fault handling
Date: Tue, 28 Jul 2026 17:46:22 +0800
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-Mailer: git-send-email 2.50.1
Received: from G9WYR9K0VW.bytedance.net ([58.250.106.101]) by smtp.feishu.cn with ESMTPS; Tue, 28 Jul 2026 17:46:31 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_024642_576330_EBCBCB9C 
X-CRM114-Status: GOOD (  14.23  )
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

Currently two places (vector and misaligned load/store) need
to get fault instructions for handling and they implement the
function separately. This is a common function so make
get_insn() public in asm/insn.h for doing this job to make it
less fragile and improve the maintainability.

Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
 arch/riscv/include/asm/insn.h        | 53 ++++++++++++++++++++++++++++
 arch/riscv/kernel/traps_misaligned.c | 52 ---------------------------
 arch/riscv/kernel/vector.c           |  6 ++--
 3 files changed, 56 insertions(+), 55 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index c3005573e8c9..5f60367c2abc 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -600,4 +600,57 @@ static inline void riscv_insn_insert_utype_itype_imm(u32 *utype_insn, u32 *itype
 	*utype_insn |= (imm & RV_U_IMM_31_12_MASK) + ((imm & BIT(11)) << 1);
 	*itype_insn |= ((imm & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF);
 }
+
+#define __read_insn(regs, insn, insn_addr, type)			\
+({									\
+	int __ret;							\
+									\
+	if (user_mode(regs)) {						\
+		__ret = get_user(insn, (type __user *) insn_addr);	\
+	} else {							\
+		insn = *(type *)insn_addr;				\
+		__ret = 0;						\
+	}								\
+									\
+	__ret;								\
+})
+
+static inline int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn)
+{
+	ulong insn = 0;
+
+	if (epc & 0x2) {
+		ulong tmp = 0;
+
+		if (__read_insn(regs, insn, epc, u16))
+			return -EFAULT;
+		/* __get_user() uses regular "lw" which sign extend the loaded
+		 * value make sure to clear higher order bits in case we "or" it
+		 * below with the upper 16 bits half.
+		 */
+		insn &= GENMASK(15, 0);
+		if ((insn & __INSN_LENGTH_MASK) != __INSN_LENGTH_32) {
+			*r_insn = insn;
+			return 0;
+		}
+		epc += sizeof(u16);
+		if (__read_insn(regs, tmp, epc, u16))
+			return -EFAULT;
+		*r_insn = (tmp << 16) | insn;
+
+		return 0;
+	} else {
+		if (__read_insn(regs, insn, epc, u32))
+			return -EFAULT;
+		if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32) {
+			*r_insn = insn;
+			return 0;
+		}
+		insn &= GENMASK(15, 0);
+		*r_insn = insn;
+
+		return 0;
+	}
+}
+
 #endif /* _ASM_RISCV_INSN_H */
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 6e8ae6c66322..f10f14001480 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -129,58 +129,6 @@ static unsigned long get_f32_rs(unsigned long insn, u8 fp_reg_offset,
 #define GET_F32_RS2C(insn, regs) (get_f32_rs(insn, 2, regs))
 #define GET_F32_RS2S(insn, regs) (get_f32_rs(RVC_RS2S(insn), 0, regs))
 
-#define __read_insn(regs, insn, insn_addr, type)	\
-({							\
-	int __ret;					\
-							\
-	if (user_mode(regs)) {				\
-		__ret = get_user(insn, (type __user *) insn_addr); \
-	} else {					\
-		insn = *(type *)insn_addr;		\
-		__ret = 0;				\
-	}						\
-							\
-	__ret;						\
-})
-
-static inline int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn)
-{
-	ulong insn = 0;
-
-	if (epc & 0x2) {
-		ulong tmp = 0;
-
-		if (__read_insn(regs, insn, epc, u16))
-			return -EFAULT;
-		/* __get_user() uses regular "lw" which sign extend the loaded
-		 * value make sure to clear higher order bits in case we "or" it
-		 * below with the upper 16 bits half.
-		 */
-		insn &= GENMASK(15, 0);
-		if ((insn & __INSN_LENGTH_MASK) != __INSN_LENGTH_32) {
-			*r_insn = insn;
-			return 0;
-		}
-		epc += sizeof(u16);
-		if (__read_insn(regs, tmp, epc, u16))
-			return -EFAULT;
-		*r_insn = (tmp << 16) | insn;
-
-		return 0;
-	} else {
-		if (__read_insn(regs, insn, epc, u32))
-			return -EFAULT;
-		if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32) {
-			*r_insn = insn;
-			return 0;
-		}
-		insn &= GENMASK(15, 0);
-		*r_insn = insn;
-
-		return 0;
-	}
-}
-
 union reg_data {
 	u8 data_bytes[8];
 	ulong data_ulong;
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index b112166d51e9..1e37810035a9 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -184,8 +184,8 @@ EXPORT_SYMBOL_GPL(riscv_v_vstate_ctrl_user_allowed);
 
 bool riscv_v_first_use_handler(struct pt_regs *regs)
 {
-	u32 __user *epc = (u32 __user *)regs->epc;
-	u32 insn = (u32)regs->badaddr;
+	unsigned long epc = regs->epc;
+	unsigned long insn = regs->badaddr;
 
 	if (!(has_vector() || has_xtheadvector()))
 		return false;
@@ -200,7 +200,7 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
 
 	/* Get the instruction */
 	if (!insn) {
-		if (__get_user(insn, epc))
+		if (get_insn(regs, epc, &insn))
 			return false;
 	}
 
-- 
2.50.1 (Apple Git-155)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
