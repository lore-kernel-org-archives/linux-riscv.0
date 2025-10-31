Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE013CCF9E3
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 03:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+LZ0xptqopCstM2tfULp5c0GiTSMORnUtcLDwuu89d0=; b=tedqMZtOgIosms
	e/7y67k3rKN++bGBz4vV39EpmKFTumPjc2jzKJXHqWdTp3XUnMqDsjmir0VyaQ+WUWXnv0d1nDKAp
	0Q2ixAvVBPhNyoV8Q990H+lREY3UrjMwB3rLu4QJGhmNkKWz9iptKkA9AOpgiWreMrE+muiwuZ6iz
	6ULw+LNkM2B6SnLI4s0AxvKiM677Y0z7xFm488tIYn4CCZgOBu2IY6hgFJWbhm5XB2ROuPGIvzFVA
	15jKqAaTiIez5FGm8HHzpF6aONhLi/Wtqq1NTHnM24lYRJm4hXCcKAe68m2r+1nahJzYqLBFkTxkv
	ZhTs0dW8OoqM/J8Ii0Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfaA-00000005Jnc-3bu4;
	Fri, 31 Oct 2025 03:13:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEfa8-00000005Jml-03p6
	for linux-riscv@bombadil.infradead.org;
	Fri, 31 Oct 2025 03:13:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7i+kxisvGj0fEhetC1Xsjl+vm0I5vez643Yzlgga+j4=; b=iNKG+tWJghtDPx/23XICS3XDra
	68DW2Ua+ka02sGCIsrLUzL1aGcnwrrASildXgLW/QFKb1KDI1y4dN1Uv7GI6duB5dWnHIAKaMh0Bd
	y6BMgPb9scAcj9I83GjBVV17dsx/T5CC7LQjl6LLdYlIkhBgYfv/ptEM4KBNVVwuZ/mK9Iv5N1U9b
	F99/KHcwqPtL3kn7HA6+DNq4an/w9+INMMNDCiv93ryB3zNTHIJt2rjxBDUUL7NA3KIN1HxNJjHvQ
	LVxVIv+lwXrHPpde3/hgIwkQBZ+MFPXXC5KPBVpC7dYdhWy+MXyZCuiDDjwM2Ma2aVs9Xxp3pXmBD
	qrbmG2MA==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEehY-0000000ARZQ-43Os
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 02:18:06 +0000
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8CxL9MhKQRpk+wcAA--.61953S3;
	Fri, 31 Oct 2025 11:12:33 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJBxysAbKQRpGMkeAQ--.13727S3;
	Fri, 31 Oct 2025 11:12:31 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/6] KVM: LoongArch: selftests: Add system registers save and restore on exception
Date: Fri, 31 Oct 2025 11:12:22 +0800
Message-Id: <20251031031227.4020738-2-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20251031031227.4020738-1-maobibo@loongson.cn>
References: <20251031031227.4020738-1-maobibo@loongson.cn>
MIME-Version: 1.0
X-CM-TRANSID: qMiowJBxysAbKQRpGMkeAQ--.13727S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_021803_217790_D0B40AAA 
X-CRM114-Status: UNSURE (   7.91  )
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

When system returns from exception with ertn instruction, PC comes
from LOONGARCH_CSR_ERA, and CSR_CRMD comes LOONGARCH_CSR_PRMD.

Here save CSR register CSR_ERA and CSR_PRMD in stack, and restore them
from stack. So it can be modified by exception handler in future.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 tools/testing/selftests/kvm/include/loongarch/processor.h | 5 ++++-
 tools/testing/selftests/kvm/lib/loongarch/exception.S     | 6 ++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/loongarch/processor.h b/tools/testing/selftests/kvm/include/loongarch/processor.h
index 6427a3275e6a..374caddfb0db 100644
--- a/tools/testing/selftests/kvm/include/loongarch/processor.h
+++ b/tools/testing/selftests/kvm/include/loongarch/processor.h
@@ -124,18 +124,21 @@ struct ex_regs {
 	unsigned long pc;
 	unsigned long estat;
 	unsigned long badv;
+	unsigned long prmd;
 };
 
 #define PC_OFFSET_EXREGS		offsetof(struct ex_regs, pc)
 #define ESTAT_OFFSET_EXREGS		offsetof(struct ex_regs, estat)
 #define BADV_OFFSET_EXREGS		offsetof(struct ex_regs, badv)
+#define PRMD_OFFSET_EXREGS		offsetof(struct ex_regs, prmd)
 #define EXREGS_SIZE			sizeof(struct ex_regs)
 
 #else
 #define PC_OFFSET_EXREGS		((EXREGS_GPRS + 0) * 8)
 #define ESTAT_OFFSET_EXREGS		((EXREGS_GPRS + 1) * 8)
 #define BADV_OFFSET_EXREGS		((EXREGS_GPRS + 2) * 8)
-#define EXREGS_SIZE			((EXREGS_GPRS + 3) * 8)
+#define PRMD_OFFSET_EXREGS		((EXREGS_GPRS + 3) * 8)
+#define EXREGS_SIZE			((EXREGS_GPRS + 4) * 8)
 #endif
 
 #endif /* SELFTEST_KVM_PROCESSOR_H */
diff --git a/tools/testing/selftests/kvm/lib/loongarch/exception.S b/tools/testing/selftests/kvm/lib/loongarch/exception.S
index 88bfa505c6f5..616d1905097d 100644
--- a/tools/testing/selftests/kvm/lib/loongarch/exception.S
+++ b/tools/testing/selftests/kvm/lib/loongarch/exception.S
@@ -51,8 +51,14 @@ handle_exception:
 	st.d   t0, sp, ESTAT_OFFSET_EXREGS
 	csrrd  t0, LOONGARCH_CSR_BADV
 	st.d   t0, sp, BADV_OFFSET_EXREGS
+	csrrd  t0, LOONGARCH_CSR_PRMD
+	st.d   t0, sp, PRMD_OFFSET_EXREGS
 
 	or     a0, sp, zero
+	ld.d   t0, sp, PC_OFFSET_EXREGS
+	csrwr  t0, LOONGARCH_CSR_ERA
+	ld.d   t0, sp, PRMD_OFFSET_EXREGS
+	csrwr  t0, LOONGARCH_CSR_PRMD
 	bl route_exception
 	restore_gprs sp
 	csrrd  sp, LOONGARCH_CSR_KS0
-- 
2.39.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
