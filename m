Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8953C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 22:48:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B85C420840
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 22:48:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SuZeHKBk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uAW4X13b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B85C420840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qdoVu5pDsPCp1L43YPdi4Ed1gokBbDGBT6qYZW104PU=; b=SuZeHKBk1/5+Ta
	/fGvsgBLAMcnMjTMA+2aA6DGFqgNwgYfSzfHRhscWQGLykj2QL9MGY/ReIxh4391tG18gnD9JdBs3
	cvCi9FonbBSLF3U6Lz9FxoJwmbBqzsnxiTqcsPygTtjdPcott4Z+FV1rSTMrVguT+Qww6ETlcvtKl
	byPc7UXjEsTxTncJ2qLPt535G4e8rQiaHEGCLOnTDc+fBc0KDuW1kR+qoKp0GoYbQ87/NlXAMKnDK
	SDw7Bebr3HT4flViMfTV2OVXciv9HDxfxhF1C/V7OH54RD3sIzdRsy8HipbI0TYnRmw7KiAFTrR/s
	j+lhfRx/9J+2IvhICfuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLFa4-0001v5-P6; Fri, 09 Nov 2018 22:48:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLFa3-0001ut-BV
 for linux-riscv@bombadil.infradead.org; Fri, 09 Nov 2018 22:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AK1CPM5m3LTeFfu0kIElAveArLDKrlXa9XuFUmVQwOs=; b=uAW4X13bbmGTN2Vh1FHzp0QIW
 tEGejs33Kvk/DZAtzyj1Gkpp/IZniqzstEF5Mj4WT6OChG1gLEtyVra7VHXlFUDnNH6CSBZaLmnuD
 XoU5aAKFZ9Gs8JhVe8Zt25fN+dHKFsMtBJ81Xr3LtKW6Mz1m7yDH7P1ea3uJe6AuuuNKnd/dACdH9
 1OOeO3n9oVWsDNCL8YjgHyQlxqu87u+hkGluweNOI2UV4CNdztgTjeNxdiXZEO1XKUASkNnlj88ya
 lpJ9uqqe5aMH6gLsSLNO2EDZBXSOPK5se8p7lW4uCQdCZYCpjT7+dhvnol+WivNMpFXfKOYyN4aXj
 Ya7nq8LAA==;
Received: from vmicros1.altlinux.org ([194.107.17.57])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLFa0-0007xY-H7
 for linux-riscv@lists.infradead.org; Fri, 09 Nov 2018 22:48:46 +0000
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id AC65272CBF9;
 Sat, 10 Nov 2018 01:48:33 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 9F1157CD1FF; Sat, 10 Nov 2018 01:48:33 +0300 (MSK)
Date: Sat, 10 Nov 2018 01:48:33 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 12/13 v2] riscv: define syscall_get_arch()
Message-ID: <20181109224833.GA2710@altlinux.org>
Mail-Followup-To: Palmer Dabbelt <palmer@sifive.com>,
 Andy Lutomirski <luto@kernel.org>,
 Elvira Khabirova <lineprinter@altlinux.org>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Moore <paul@paul-moore.com>,
 Eric Paris <eparis@redhat.com>, linux-riscv@lists.infradead.org,
 linux-audit@redhat.com, linux-kernel@vger.kernel.org
References: <20181109031712.GL21511@altlinux.org>
 <mhng-2fa4cce8-2365-4f36-a07e-5f9ad61cfb88@palmer-si-x1c4>
 <20181109213128.GA1907@altlinux.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181109213128.GA1907@altlinux.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_224844_648763_1EB7FFA1 
X-CRM114-Status: GOOD (  10.28  )
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
 Elvira Khabirova <lineprinter@altlinux.org>, Andy Lutomirski <luto@kernel.org>,
 linux-audit@redhat.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181109224833.Fx3GQHTw8-zNJz8nJ4EvT05neG8zDrj6eBP7Y7rsRpU@z>

syscall_get_arch() is required to be implemented on all architectures
that use tracehook_report_syscall_entry() in order to extend
the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.

Based-on-patch-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
---
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
index c4c8b131af48..1b199a77a6b9 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -405,6 +405,8 @@ enum {
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
