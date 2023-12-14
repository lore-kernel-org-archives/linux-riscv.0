Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09842C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 19:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Z+q24IWF645xvgGggVOU+JAkl5wF5BE1yFk7QwjAlE=; b=zHsuOtd/Q4idgF
	H0BFMzH37C30HHdFbwAffvzcaFv7dS/WcaFJE1BEcN7j0Ya0572SOM3yTSvdyCTMxsPf+1V3xc/33
	RhiFZc+nCSPHx0GMUTo3tld3/tYWq5rg4kFBVSCVrNVK05UQkEglS03Xbn9lUS7rp98JqZEnzJRSl
	MW/JkJGQhiyMtLuVc9MnWds2KZ1+KlRm4qacUx6V1RKg3lfSiwsF7yDqNQXpOQ/wsNEw0c5inMWNz
	G7V51VfshEszPM9WOpXAcsKBsqXes1NLPgwvpNiiObBSB+AYDd1Wke07LMGCbFdTTF6+WyRBbN0F8
	bEGR4KZWJMG2BV8pAGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDrF7-0016Zj-3B;
	Thu, 14 Dec 2023 19:19:33 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDrF4-0016XM-1p
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 19:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=tfDVMsbNa4w00pdK8vUVga454qxEb5JI8QDBCCDEerc=; b=UwchfG7L6XMFvifmq8MnQGV0Xg
	vBkceTQPh0vqiImKqDcqRgWh0lIgjxqRNF3RUxT8OS3kUSczdfAmHQV5U283bVQP+ef1hS7QgFh5A
	qVKbNDvTJQtJFgLC2zs1kOQIQOxXo1OQAFxj9APv4ARlsaVtSRn7+8e/tvaQ3czGfelUYqxGKZeZu
	ZQkzXvYPkztN0sTXZjw1kOR5fAvyu8yacuNTNX78waIC4qAuKWa3dD02NuZFVwUXElLS7XRNKNOAz
	3Ftns6r9p25suI+/E+HVhIxAGJWEEPB9wO0gwUsiDY3YoqB7KxEIM0T0KkH1+l8NFUU6JdVGR/CvV
	8x/JEY+w==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rDrEw-00CPLX-1l
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 19:19:22 +0000
Date: Thu, 14 Dec 2023 19:19:22 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-riscv@lists.infradead.org
Subject: [PATCH][riscv] use linux/export.h rather than asm-generic/export.h
Message-ID: <20231214191922.GQ1674809@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_111930_600534_A92D6F2B 
X-CRM114-Status: UNSURE (   6.63  )
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

asm-generic/export.h is a wrapper for linux/export.h, with explicit request
to use linux/export.h directly.
    
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index 58dd96a2a153..79dc81223238 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -3,12 +3,12 @@
 
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <linux/export.h>
 #include <asm/asm.h>
 #include <asm/csr.h>
 #include <asm/unistd.h>
 #include <asm/thread_info.h>
 #include <asm/asm-offsets.h>
-#include <asm-generic/export.h>
 #include <asm/ftrace.h>
 
 	.text
diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index b4dd9ed6849e..d7ec69ac6910 100644
--- a/arch/riscv/kernel/mcount.S
+++ b/arch/riscv/kernel/mcount.S
@@ -4,12 +4,12 @@
 #include <linux/init.h>
 #include <linux/linkage.h>
 #include <linux/cfi_types.h>
+#include <linux/export.h>
 #include <asm/asm.h>
 #include <asm/csr.h>
 #include <asm/unistd.h>
 #include <asm/thread_info.h>
 #include <asm/asm-offsets.h>
-#include <asm-generic/export.h>
 #include <asm/ftrace.h>
 
 	.text
diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
index b22de1231144..20ff03f5b0f2 100644
--- a/arch/riscv/lib/clear_page.S
+++ b/arch/riscv/lib/clear_page.S
@@ -4,9 +4,9 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/export.h>
 #include <asm/asm.h>
 #include <asm/alternative-macros.h>
-#include <asm-generic/export.h>
 #include <asm/hwcap.h>
 #include <asm/insn-def.h>
 #include <asm/page.h>
diff --git a/arch/riscv/lib/tishift.S b/arch/riscv/lib/tishift.S
index ef90075c4b0a..c8294bf72c06 100644
--- a/arch/riscv/lib/tishift.S
+++ b/arch/riscv/lib/tishift.S
@@ -4,7 +4,7 @@
  */
 
 #include <linux/linkage.h>
-#include <asm-generic/export.h>
+#include <linux/export.h>
 
 SYM_FUNC_START(__lshrti3)
 	beqz	a2, .L1
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 3ab438f30d13..a9d356d6c03c 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -1,5 +1,5 @@
 #include <linux/linkage.h>
-#include <asm-generic/export.h>
+#include <linux/export.h>
 #include <asm/asm.h>
 #include <asm/asm-extable.h>
 #include <asm/csr.h>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
