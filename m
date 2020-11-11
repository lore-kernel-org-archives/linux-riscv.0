Return-Path: <SRS0=0ydX=ER=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A43DC388F9
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 13:34:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FBBD206D9
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 13:34:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F3ltlxyl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiHrWEt1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FBBD206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=62z+sDdnbsmK6PsuKPE5f5GX6zgUdIGpIqURufJPF00=; b=F3ltlxyl9BoVhLumqqhYWoc8P
	vv7BylPkjnXgeR0OolX62DAX6VlX7p7QWkX9+Dt+zT73sApClifiRh2AfdwjiJe9zoczTCPadl5Tt
	5DlJwEc/sy8sB+pX+ykBYZcBXAXkz8gf/jbHyKuPkMCy0S2qe4lVphbT5oEaMEcmFAvwuEWKbWg53
	iZ5SU7iVyFREkn51mYKrirYFAJrseHO0+DMETUAA9/tzfZ4+sKpqn+bJXkpvOdngioOTsp/JHNyLj
	LMtQc95N13HC8IU4QydVIbZASQDOeaaCBBxa0XbIxBsdN5YP+B/LVW4iLZWlLOEu7fvDr2P0nSZMc
	z8Q2qxYkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcqGu-0007Af-IY; Wed, 11 Nov 2020 13:34:48 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcqGr-00076e-1p
 for linux-riscv@lists.infradead.org; Wed, 11 Nov 2020 13:34:46 +0000
Received: by mail-qt1-x844.google.com with SMTP id g17so1244796qts.5
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 05:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z8BEo0x7DBxygVu3ezyut+Q+/5lHQFyLMFsea6yH4dY=;
 b=AiHrWEt19R14SjvDJPKLr7v7i72FmAs7tKIcKGMSWFQwQ/DIoBrkASCkncBIALbImW
 ovXjCz0vPL0IwyG05D0ScobV3buaYwTntzRWG4DvErPgobGS3lP6aF57Y5z/ROppbM15
 U5alV4hGDTuqamCbUCRSnEElgLlyHQqyfApA9IFdiByMiEgJ9T5aChZZ8FuOLffq7taE
 8RCryXNGD6+QzxN4QWCFwCmheQXdMAr5LaXXLZuZJoit1BPXhkYBBltSg8ODItIgxHp4
 ULkURkvuGrMOziExOLhaMa/N/5bMiNtXHKjvWx5fTW5xKcw7pTxjO4xz/fvpWPD8dS5Q
 jWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z8BEo0x7DBxygVu3ezyut+Q+/5lHQFyLMFsea6yH4dY=;
 b=bbNSgn5lkJ/KIhH3XcNAcnVtf2qFmXpsw+lmjUO9sT69xgdsR5hP5EvAicEKqxa4uG
 TDhcZXnj53jFfzNeYu8meKsfskaiUQgjYAgN511sJ3ISe/lIpC1wePYkC327D74/Fsl9
 lauGtgnCxfCXrtkvPhfdNTsVs28/ZozdeV6h2fXu2Rr2nLvL50Gd5CTXgGzqm6OI1lai
 6vs/MNAfbmGlxCJ69hjen/r5NzfKjv4aPaqbiDCzoDBq4FHuXiqN1s0KIhzLdlOj4yJx
 7MDjkQeAnXlbdC/jMDb+sgF8y74LUZOAP03IiGW7gRqmVBEnaFF2C2XS/FMexrQBdJrS
 7F9Q==
X-Gm-Message-State: AOAM532dcLO3vuIsXzz/zLH/Js+nbF1xS6rRCTIk5jo/DBVBCSCnkfje
 rKE2RXlYhcYaGomC55aICzI=
X-Google-Smtp-Source: ABdhPJyZWAhNIXxg3LfT4oElO/X43US70dnQmIy4NoyGeM0Dg949Sb1UtyuDuo3lMLZdX0WTBziFrQ==
X-Received: by 2002:aed:2744:: with SMTP id n62mr24170273qtd.67.1605101681720; 
 Wed, 11 Nov 2020 05:34:41 -0800 (PST)
Received: from localhost.localdomain
 (host-173-230-99-154.tnkngak.clients.pavlovmedia.com. [173.230.99.154])
 by smtp.gmail.com with ESMTPSA id r190sm1997814qkf.101.2020.11.11.05.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:34:41 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp v2 6/8] sh: Enable seccomp architecture tracking
Date: Wed, 11 Nov 2020 07:33:52 -0600
Message-Id: <61ae084cd4783b9b50860d9dedb4a348cf1b7b6f.1605101222.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1605101222.git.yifeifz2@illinois.edu>
References: <cover.1605101222.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_083445_291547_07351C26 
X-CRM114-Status: GOOD (  10.74  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-sh@vger.kernel.org, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Jack Chen <jianyan2@illinois.edu>,
 linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, YiFei Zhu <yifeifz2@illinois.edu>,
 linux-csky@vger.kernel.org, Tianyin Xu <tyxu@illinois.edu>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Valentin Rothberg <vrothber@redhat.com>,
 Aleksa Sarai <cyphar@cyphar.com>, Josep Torrellas <torrella@illinois.edu>,
 Will Drewry <wad@chromium.org>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
 Dimitrios Skarlatos <dskarlat@cs.cmu.edu>,
 David Laight <David.Laight@aculab.com>,
 Giuseppe Scrivano <gscrivan@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Tycho Andersen <tycho@tycho.pizza>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: YiFei Zhu <yifeifz2@illinois.edu>

To enable seccomp constant action bitmaps, we need to have a static
mapping to the audit architecture and system call table size. Add these
for sh.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/sh/include/asm/seccomp.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/sh/include/asm/seccomp.h b/arch/sh/include/asm/seccomp.h
index 54111e4d32b8..d4578395fd66 100644
--- a/arch/sh/include/asm/seccomp.h
+++ b/arch/sh/include/asm/seccomp.h
@@ -8,4 +8,14 @@
 #define __NR_seccomp_exit __NR_exit
 #define __NR_seccomp_sigreturn __NR_rt_sigreturn
 
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
+#define __SECCOMP_ARCH_LE		__AUDIT_ARCH_LE
+#else
+#define __SECCOMP_ARCH_LE		0
+#endif
+
+#define SECCOMP_ARCH_NATIVE		(AUDIT_ARCH_SH | __SECCOMP_ARCH_LE)
+#define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+#define SECCOMP_ARCH_NATIVE_NAME	"sh"
+
 #endif /* __ASM_SECCOMP_H */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
