Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B7DC5B549
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 07:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJoUsxk1aWlwXpzcfba6f/mluHQKEEH7IO0L1taoKV4=; b=SAImN00lkboDwp
	qYKV5urw1PBnA6ks5ptp/XObv8EcRAGutUcGkOH6Thquvlv5Xb+uVfCiskdxUUolhzXvOIiqfFXgw
	Linexi+eP/fKNJioRWrjkpamUZIr5zBTAKQnTUwQ+j+r3EzmwVDY2d5xuD4Vaw//+qgZm9CpJqMtm
	zvDDQKHy/LKa5R+6vlPhP569tW/Dn4AkkR3+VZtGwBL1GmknBsBJviPkbFRb9F1e0fdSoLdZaGMMs
	4LM3hzbQMqBTKnacabrUDFsXYu2/Pd2XVZiJyLmRzc1mgUBD7iBTSTWpryW04Q1FAbfpCO6O5FGMC
	TRJoL0gF32EN/aM/Tapg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNRDS-0000000HGTr-06fg;
	Fri, 06 Jun 2025 07:10:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNRDP-0000000HGRj-3UsR
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 07:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749193811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KuePHXfM3UKI4Kv8fQkBuRMJ48F3aL7s6VW16J3fp60=;
	b=cMQohtniOUd3hV9WpwGUR9Xz6Ip6djiqLdsft4cWjEE8dvxmP3JU9GjonvgPHcw4JGBIzq
	pAbyD/7jgapQunHoZn6k1kQ1/bUJHL9Iw4hrDkQo4lRj3GwO9EhylQ/SezsAOt3hk/FXAm
	R9jmm+1O4gH3CmPZeSKeRpPO5tIo2Es=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-581-AqZ7nWUuNr2BV3nZFgTHwQ-1; Fri,
 06 Jun 2025 03:10:04 -0400
X-MC-Unique: AqZ7nWUuNr2BV3nZFgTHwQ-1
X-Mimecast-MFC-AGG-ID: AqZ7nWUuNr2BV3nZFgTHwQ_1749193803
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E50111956096;
	Fri,  6 Jun 2025 07:10:02 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.225.83])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2384F18002B1;
	Fri,  6 Jun 2025 07:09:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] riscv: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
Date: Fri,  6 Jun 2025 09:09:51 +0200
Message-ID: <20250606070952.498274-2-thuth@redhat.com>
In-Reply-To: <20250606070952.498274-1-thuth@redhat.com>
References: <20250606070952.498274-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_001011_951826_0B2236E5 
X-CRM114-Status: GOOD (  14.11  )
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

From: Thomas Huth <thuth@redhat.com>

__ASSEMBLY__ is only defined by the Makefile of the kernel, so
this is not really useful for uapi headers (unless the userspace
Makefile defines it, too). Let's switch to __ASSEMBLER__ which
gets set automatically by the compiler when compiling assembly
code.

This is a completely mechanical patch (done with a simple "sed -i"
statement).

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/riscv/include/uapi/asm/kvm.h        | 2 +-
 arch/riscv/include/uapi/asm/ptrace.h     | 4 ++--
 arch/riscv/include/uapi/asm/sigcontext.h | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 5f59fd226cc57..5364c7141b4ee 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -9,7 +9,7 @@
 #ifndef __LINUX_KVM_RISCV_H
 #define __LINUX_KVM_RISCV_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/types.h>
 #include <asm/bitsperlong.h>
diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index a38268b19c3d3..beff8df80ac9c 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -6,7 +6,7 @@
 #ifndef _UAPI_ASM_RISCV_PTRACE_H
 #define _UAPI_ASM_RISCV_PTRACE_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/types.h>
 
@@ -127,6 +127,6 @@ struct __riscv_v_regset_state {
  */
 #define RISCV_MAX_VLENB (8192)
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _UAPI_ASM_RISCV_PTRACE_H */
diff --git a/arch/riscv/include/uapi/asm/sigcontext.h b/arch/riscv/include/uapi/asm/sigcontext.h
index cd4f175dc8376..748dffc9ae194 100644
--- a/arch/riscv/include/uapi/asm/sigcontext.h
+++ b/arch/riscv/include/uapi/asm/sigcontext.h
@@ -15,7 +15,7 @@
 /* The size of END signal context header. */
 #define END_HDR_SIZE	0x0
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct __sc_riscv_v_state {
 	struct __riscv_v_ext_state v_state;
@@ -35,6 +35,6 @@ struct sigcontext {
 	};
 };
 
-#endif /*!__ASSEMBLY__*/
+#endif /*!__ASSEMBLER__*/
 
 #endif /* _UAPI_ASM_RISCV_SIGCONTEXT_H */
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
