Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82719C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 00:16:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B7B52089F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 00:16:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="evAcc0VR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hk7EUp70"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B7B52089F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ZSZkn+9y/I7QvX/Q+IgG8sHKEyzbZRk4v1nil6rrsrQ=; b=evAcc0VRvrT4hf
	R57s0BSUOtniQb1oT8tRJEgWo8mQ0X+W1iVDUDt64WBuyfrPsmVgYsgOdJ19I+kodqyMCTRQpobZV
	9EhfDhFkM6qoiEXJTNDGWroANq6ZnyyBNWdldjp32JBqOjhwY8m4Itm1Kq+gS6lSKbjeSBUALQ1ue
	SoZyPF/IH1yHpvBDXgqPxAlRWt8I285GhBshQIi/IfMMyPJ0mvbSuUZDyGNdNxPWx3L3G93C2akCF
	VAK6pkosll7kH67oK+kdTzDL/pFzzFiRvlXrfViZdNLaXfZUHXt9JbEL+An+dts7Aq+DW5JUGRD8i
	Lhp602t3YAgfIqlTD4tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOtir-000838-AV; Tue, 20 Nov 2018 00:16:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOtip-00082z-DS
 for linux-riscv@bombadil.infradead.org; Tue, 20 Nov 2018 00:16:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ehTRxzukPmODtpRsfdRxOlXwC3M/fCALbPJAOOE6THY=; b=hk7EUp70zoRnvyKEMk8Qi4Bk8F
 YsRaHNBVE/RTdEqQ0xGJMbIvJdN8Jmh4vX4K1VGkQol40zCEASIaDTXurR1B09ZRXzxVC6f1sl1gm
 BxUIGYqBEIbBQqrZdSwfpQoh/Wsm+ht22NNUHOWh42mm1FxNeWh/7PhXIKAW33dvXGI4pkXcHhD7C
 piMhThT0Qf78+BqEYvEQ8eS6dqiOhQDNekDX7XsZE0H5SolrerBvIBEmZnK3PZKzTqEACSPnxMju9
 Pz3GU2HNHgqxDXmefdP1XbVku5oNiar1GfqpOW5cX+Cy24DPYA0YsTz/2H32NZctW7pAfD0GxlEHJ
 Hr7Bv3Zw==;
Received: from vmicros1.altlinux.org ([194.107.17.57])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOtim-00067y-3O
 for linux-riscv@lists.infradead.org; Tue, 20 Nov 2018 00:16:53 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 6D2E172CA65;
 Tue, 20 Nov 2018 03:16:41 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 359517CD1FF; Tue, 20 Nov 2018 03:16:40 +0300 (MSK)
Date: Tue, 20 Nov 2018 03:16:40 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Andy Lutomirski <luto@kernel.org>, Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH v2 13/15] riscv: define syscall_get_arch()
Message-ID: <20181120001640.GM11387@altlinux.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181120001128.GA11300@altlinux.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_001652_185638_145E382A 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Paul Moore <paul@paul-moore.com>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>,
 Elvira Khabirova <lineprinter@altlinux.org>, linux-audit@redhat.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181120001640.LYve_PGyNh5pFpdd3kpPmGiYF8bKrdGu1ULU9aDFuZ0@z>

syscall_get_arch() is required to be implemented on all architectures
in order to extend the generic ptrace API with PTRACE_GET_SYSCALL_INFO
request.

Based-on-patch-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
---
v2: added Reviewed-by to [PATCH 12/13 v2]

 arch/riscv/include/asm/syscall.h | 10 ++++++++++
 include/uapi/linux/audit.h       |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index 8d25f8904c00..bba3da6ef157 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -18,6 +18,7 @@
 #ifndef _ASM_RISCV_SYSCALL_H
 #define _ASM_RISCV_SYSCALL_H
 
+#include <uapi/linux/audit.h>
 #include <linux/sched.h>
 #include <linux/err.h>
 
@@ -99,4 +100,13 @@ static inline void syscall_set_arguments(struct task_struct *task,
 	memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
 }
 
+static inline int syscall_get_arch(void)
+{
+#ifdef CONFIG_64BIT
+	return AUDIT_ARCH_RISCV64;
+#else
+	return AUDIT_ARCH_RISCV32;
+#endif
+}
+
 #endif	/* _ASM_RISCV_SYSCALL_H */
diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index 205aa32d81ed..a97a29922de0 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -410,6 +410,8 @@ enum {
 /* do not define AUDIT_ARCH_PPCLE since it is not supported by audit */
 #define AUDIT_ARCH_PPC64	(EM_PPC64|__AUDIT_ARCH_64BIT)
 #define AUDIT_ARCH_PPC64LE	(EM_PPC64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
+#define AUDIT_ARCH_RISCV32	(EM_RISCV|__AUDIT_ARCH_LE)
+#define AUDIT_ARCH_RISCV64	(EM_RISCV|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
 #define AUDIT_ARCH_S390		(EM_S390)
 #define AUDIT_ARCH_S390X	(EM_S390|__AUDIT_ARCH_64BIT)
 #define AUDIT_ARCH_SH		(EM_SH)
-- 
ldv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
