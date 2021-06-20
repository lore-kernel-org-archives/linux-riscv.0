Return-Path: <SRS0=Y/ze=LO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF63C48BDF
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Jun 2021 12:01:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 941EA60FE5
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Jun 2021 12:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 941EA60FE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=feSfAzJ598Hv92wu8IKBIZAo6WYaf1yCKTAEd/sCexM=; b=4gxs9Y+lBCqUWs
	AF66+xIr+yNLB2wwT+S+2p5INi7oAEqnAllwVpYMv3pYn9SDeZKRK+JQDWODxmlibSWwXVB5TYRs/
	+QANS46zZjYnzqkuwm/WHC5Er/6e0aYHH1+xJJeGkpwXMD9XpHAMzSpSak/86aoZECUnuRROh9CKU
	nIOQIiXfXN1InFPdgxSF2m2gs3xbM89R04LcgnCVHXzrnpdpe8QtvFhLYSqnVEu88YIPRklCyoQfL
	3uBPLlNKMMiNbGkpMZVwzzV9idpM6zBl9TpGnb3Z/fTx0hNI7RHGuwB/9qw4jdv+aKo4cS6AUJuNq
	2IANtMJxspjKzvQ9qvxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luw8Y-000wlU-R9; Sun, 20 Jun 2021 12:01:14 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luw8V-000wks-9E
 for linux-riscv@lists.infradead.org; Sun, 20 Jun 2021 12:01:12 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so8577276pjn.1
 for <linux-riscv@lists.infradead.org>; Sun, 20 Jun 2021 05:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6RZ0t+nLN/zgwczUvk1xBr9Y/vtc658j2K3feiC0sNo=;
 b=tvDau5NQHMgBjXtOi7u5ORM6VPuv3odxHKJVjJrovv+8UHr8iEWC3eynFLeG3eMACG
 YThJzEn5kf2v4OqYYn6pWDFqh7HRqFMRqI/465tgrgk6GHaBh4ui0NhMaUfzO8hlAXGx
 9fNwsPC9MhMKKs/R4nAk8nDAR99TARH39Kx9ZJyoeO+BoSUVBsoHzRRsKiLrE5jzznM0
 Ud2XqNdMok1U9czZknWSXU9xVCfkCDWjbmlRS6ouIb/lm9CAv2BEGclVpFe8ni8mXvLt
 EipLBxOkfb9bCKm0UbcGCl1TDg1JVQoSAldRcPfO0aAP5vqBzz5ApIaDlMG5713K8xTg
 Rwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6RZ0t+nLN/zgwczUvk1xBr9Y/vtc658j2K3feiC0sNo=;
 b=K/pD1PKdsSn+IoypaypnxRPvAVbsoAme3Jd+MOlnTOqzEAK2btmxoSXkbRQ2UJXSOG
 ZScBVlJ1GH20cHqv7+DoQfEyEIqLhZcy1Wc5yecu8DOxrN/tvWEuoi6s1Pyx4Mr/EWhO
 UQRPkGcBweK17IkwinMOtrxwcS6tsjfmn0kcql7VFnZ3FJS27O+FooeoNT/1wO+K3D0w
 VilyfUwFbrLTmTIf9rPsDojPxnQFif3VC7Zdtpplh3vOjBPL5njP9lmq5g5iPfcddFzD
 VLXjt8zW2vMUAAKLxOa4OFB2UZH2IgpW4qs8ksz0bqCGSkwvUEKDWBPOjO7/BzsWf54P
 whQw==
X-Gm-Message-State: AOAM531Ey3Uwjhk8lhUt18PBDUvtLXGvJ9P2jnvJrX3rxIzPCXoQLhiV
 e63Z5DwZd8T7MZm0BKJS9Vg=
X-Google-Smtp-Source: ABdhPJwruwTRhScqZpEyG4BVAu40s7oKqSw2bbKGu2EIdq8sgtyU+3LoY1ROsiZ+/4RM9EZGZo+hXg==
X-Received: by 2002:a17:90b:4b49:: with SMTP id
 mi9mr20849030pjb.187.1624190469012; 
 Sun, 20 Jun 2021 05:01:09 -0700 (PDT)
Received: from localhost.localdomain.localdomain
 (n058152081086.netvigator.com. [58.152.81.86])
 by smtp.gmail.com with ESMTPSA id z18sm9899893pfq.196.2021.06.20.05.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 05:01:08 -0700 (PDT)
From: Jeff Xie <chongguiguzi@gmail.com>
X-Google-Original-From: Jeff Xie <huan.xie@suse.com>
To: oleg@redhat.com
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, caou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 chongguiguzi@gmail.com, huan.xie@suse.com
Subject: [PATCH] riscv: ptrace: add argn syntax
Date: Sun, 20 Jun 2021 20:01:51 +0800
Message-Id: <20210620120151.17860-1-huan.xie@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_050111_365992_C6B08471 
X-CRM114-Status: UNSURE (   9.22  )
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

This enables ftrace kprobe events to access kernel function
arguments via $argN syntax.

Signed-off-by: Jeff Xie <huan.xie@suse.com>
---
 arch/riscv/Kconfig              |  1 +
 arch/riscv/include/asm/ptrace.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 18ec0f9bb8d5..f9246a7d0a31 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -88,6 +88,7 @@ config RISCV
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_REGS_AND_STACK_ACCESS_API
+	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select IRQ_DOMAIN
diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index 09ad4e923510..fdb59ee405ee 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -141,6 +141,37 @@ static inline unsigned long regs_get_register(struct pt_regs *regs,
 
 	return *(unsigned long *)((unsigned long)regs + offset);
 }
+
+/**
+ * regs_get_kernel_argument() - get Nth function argument in kernel
+ * @regs:       pt_regs of that context
+ * @n:          function argument number (start from 0)
+ *
+ * regs_get_argument() returns @n th argument of the function call.
+ *
+ * Note you can get the parameter correctly if the function has no
+ * more than eight arguments.
+ */
+static inline unsigned long regs_get_kernel_argument(struct pt_regs *regs,
+						unsigned int n)
+{
+#define NR_REG_ARGUMENTS 8
+	static const unsigned int argument_offs[] = {
+		offsetof(struct pt_regs, a0),
+		offsetof(struct pt_regs, a1),
+		offsetof(struct pt_regs, a2),
+		offsetof(struct pt_regs, a3),
+		offsetof(struct pt_regs, a4),
+		offsetof(struct pt_regs, a5),
+		offsetof(struct pt_regs, a6),
+		offsetof(struct pt_regs, a7),
+	};
+
+	if (n < NR_REG_ARGUMENTS)
+		return regs_get_register(regs, argument_offs[n]);
+	return 0;
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PTRACE_H */
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
