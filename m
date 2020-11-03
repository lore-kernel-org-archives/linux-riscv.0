Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD48BC388F7
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:45:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 359A321D91
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:45:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kX8H9iQT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1UUt3QN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 359A321D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c/CbpT7AFpv3BrNJdxKTSB/RiPXrKGtNMCjzkOXSZ9E=; b=kX8H9iQTsHAbH+RcEiRAA8Vqt
	Dd6cmIjgW0F3oq82KRDMaT1d7KJGVz/b/MlBT/lTyOiKuFTmL5g6CKQP77vaoCq/vrjKK+RTf4X00
	jNLBFhwDcaZBmlzrZCMABqgOsiWVkk7cZGBR7jrIE0cQeRMSo+mRRlwNjlaq/stZ8WTp0AYHvGhAe
	Rb9sYFTnzviJdQai261sHGC+4iTSxef1Y4YHvXdbYZIsqNgOyY8SwSy3F9A+jWOJsm+TXfmwzHQyQ
	nY52bipZX8GSP43JvmmsArPuXbRtbqkyGa6Z4mqyZoar8tRfb6P7s6DADSFTptS9sfwlHrovgmtZ/
	4Am+tPm9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZwci-0007Uh-6r; Tue, 03 Nov 2020 13:45:20 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZwcb-0007RQ-Md
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 13:45:16 +0000
Received: by mail-qk1-x742.google.com with SMTP id a65so12371823qkg.13
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 05:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PCRJp91/82MIer7BGmfwt2GKdylAg2x5Gxk5MeSJA78=;
 b=l1UUt3QNH+lFGhcDNXPtNMRtkqffL4tl2O3N54zCmMcpor3j0kMgvLUkphpicH1DmA
 e9gal6RMIMfV24ZCzIyXif3axp17c+gJqxlt5Z8rdoWW187/XRB5yRLtrmSF3fnFNRa5
 Gz4l7hh+A/kcwK1wh/9J1YbL45kF8pUgj+gZr8qTNoaduXm4U4vFw5nLxuqYxEhO9TH3
 1FHIRwqPxk86OlrRsKwElUT5rJ7lTXmfKiLIj6+R7Jj+iIsstunlj+07tab+NwEeiDOI
 amlsHmXjmNf1MAZl7gdBl94TpeXtOXHhLIlLKkgT/Dq+j3UvNDfH9rBNln7RpPwBLiU5
 Oklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PCRJp91/82MIer7BGmfwt2GKdylAg2x5Gxk5MeSJA78=;
 b=RinZQUsJbIraTn4kv+OJbUraVGGH6O8CU40hzviwNdSYEAk05w+jhQkejDXzh4uweZ
 cQA/NmwZ/cGH3JBWW4a2Rq1/oRd9/AE0lrT06G2eTReFXpbxWCgzwFON+ymsHmujAUNh
 uIeJfsEjQHn0Pt3XdxurRvMN6RnG+Ctdo2yL1k+JI0ndemAYIuqCJaTzndKoWtG6UEX9
 VTNEAL2TAuhO+l5lTO3bU0Q91dXss+J9DC2O0pTySBtWh2UvEX2mcP9vRIz0EvWi1Egc
 GIiHnqDwrEFUQOJvNqVVtKXEW/Dj1jGk7WU/Em5nbHo1swgda2HiKBr8GdqzeWfWoUcF
 LQWA==
X-Gm-Message-State: AOAM5325XjaTg08R7iD+4Fm8PAd71nexyG3OdMYtNdjjkVgG8rusVfaM
 pBz876LS7shP93neT/uHfC0=
X-Google-Smtp-Source: ABdhPJwgqNLGy3G4kA2qMjuDmEfZ5jUgJ9Zn9b3TaNLMbOixzf8zLW3HI6CuhjtCYkEAnJi3PUqQiw==
X-Received: by 2002:a37:5002:: with SMTP id e2mr19533167qkb.453.1604411112117; 
 Tue, 03 Nov 2020 05:45:12 -0800 (PST)
Received: from zhuyifei1999-ThinkPad-T480.gw.illinois.edu
 ([2620:0:e00:400f::31])
 by smtp.gmail.com with ESMTPSA id a206sm7356568qkb.64.2020.11.03.05.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 05:45:11 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp 3/8] powerpc: Enable seccomp architecture tracking
Date: Tue,  3 Nov 2020 07:42:59 -0600
Message-Id: <4ec2970fcc819eb4d5dac2bd35233ccdadfda845.1604410035.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1604410035.git.yifeifz2@illinois.edu>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_084515_253126_DCD26B37 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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
for powerpc.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/powerpc/include/asm/seccomp.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/powerpc/include/asm/seccomp.h b/arch/powerpc/include/asm/seccomp.h
index 51209f6071c5..3efcc83e9cc6 100644
--- a/arch/powerpc/include/asm/seccomp.h
+++ b/arch/powerpc/include/asm/seccomp.h
@@ -8,4 +8,25 @@
 
 #include <asm-generic/seccomp.h>
 
+#ifdef __LITTLE_ENDIAN__
+#define __SECCOMP_ARCH_LE_BIT		__AUDIT_ARCH_LE
+#else
+#define __SECCOMP_ARCH_LE_BIT		0
+#endif
+
+#ifdef CONFIG_PPC64
+# define SECCOMP_ARCH_NATIVE		(AUDIT_ARCH_PPC64 | __SECCOMP_ARCH_LE)
+# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+# define SECCOMP_ARCH_NATIVE_NAME	"ppc64"
+# ifdef CONFIG_COMPAT
+#  define SECCOMP_ARCH_COMPAT		(AUDIT_ARCH_PPC | __SECCOMP_ARCH_LE)
+#  define SECCOMP_ARCH_COMPAT_NR	NR_syscalls
+#  define SECCOMP_ARCH_COMPAT_NAME	"powerpc"
+# endif
+#else /* !CONFIG_PPC64 */
+# define SECCOMP_ARCH_NATIVE		(AUDIT_ARCH_PPC | __SECCOMP_ARCH_LE)
+# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+# define SECCOMP_ARCH_NATIVE_NAME	"powerpc"
+#endif
+
 #endif	/* _ASM_POWERPC_SECCOMP_H */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
