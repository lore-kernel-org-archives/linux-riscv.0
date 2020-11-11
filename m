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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80902C55ABD
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 13:34:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05D2B206D9
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 13:34:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w5eWQZNq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNk+mHcn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05D2B206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qrcl1QoOj6O3bqjdQdHm2GGnWsbRTCvcPoiDUFqeEkY=; b=w5eWQZNqLWrfFovay+RLFdyc/
	NoE37UhcoVSVssZ0RMMMv/qEz6gLGPhWsestWVh8IHC9OZhkd5HE/8w2SNi2RDZrzOrKu4fWREpkr
	ids5X30Ov0GIM04z2YvrAoiWJ75sz7I849tY2BK6CDZn5Yf47ZTeUalLGH3j9qfoh74TkLsyW9fQs
	BDi6oAbovC/A7CZczmMKbjKO49Aizs+r/uMfpr0EFx1zWQ95cJc5zG3l3Fb5YFjA9SKjzO3eciH1r
	fKC+mWeB6IevuH/0dCW6P5Q9NgPeqSDfDKNpL67lZ0omDPUe2zEf8zYgooesOhAxUS/7KyzVCCvWW
	dHYUdivWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcqGl-00074s-LD; Wed, 11 Nov 2020 13:34:39 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcqGi-00073F-Nd
 for linux-riscv@lists.infradead.org; Wed, 11 Nov 2020 13:34:37 +0000
Received: by mail-qk1-x742.google.com with SMTP id n132so1624654qke.1
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 05:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LIHaRbcW33holGtLxAdu7MnC0XA7v48flZenL4Xa8vU=;
 b=dNk+mHcnxtrEMnoth+9YuSZp+YnaTGFIRKqb6ReOwm4fVp8t0mkh3bSdlUABRoAUlx
 tqquHCE17akyy8N/Nvpjg7Qp3AoZ+ubiA4cXGcr+8ulSr6YMzogVfYe8HW84FHb0lUm/
 /WtN9ZpC8VKXLz1L5tvxxFBda/OJbmO8xfmRMZm9yZjClDUw3ZscP+K5NBtyp4h7niez
 LHJ/nuWNzhr4vfD1yroJHXynte84EkEErCMxO2wU7yBLkN2zhT/krvfPoB2KZrvmREHc
 mmIHwwl9ZlD8hTh+jTTrb+HdoDQ4CsYqasWnyeceqpG0wekPMdPvQ3VXOB/H33Sm4FEB
 Rwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LIHaRbcW33holGtLxAdu7MnC0XA7v48flZenL4Xa8vU=;
 b=ba/FZhrozshpslU1wl+yTedXCctqdGNJJs1pjadtX3wLtiqIIrzrBY0fGvRaBwPFoi
 UUZG2ZyciuUMN+PZYUFUOGj++m/EztlSkq0bfKTz0KmsDJ56mOCYgRFcRWq05w+/tyVv
 MBIA5V/JJyC1sx6mkOT7VTizOtT0wNVZmuHbUUFeDcwTXUb0rtVEgO3wBm1aohMR7lcA
 EOOHEf3goGWJGYLRmfJHsqi9AfSep9sPBgWiZ+ZY7/b2lMQw6Xa0ToKGSSndYzDhNq0E
 xrH1mFzoFXm8wVaEbOZ2UxbipTeLVRyHg9EwsaqDVKHbrKg0AE4RJMDxbkmV8bH3wJIo
 6zug==
X-Gm-Message-State: AOAM5328dcUxcFNTfaljM1t0QvzpBt6kNyIfV5px6bUDW17LtydW5Bqi
 59nET76nMCsAQNE4X6VSuZY=
X-Google-Smtp-Source: ABdhPJwWi7mIj07jdzREPXg7rZ5J8YjabnB76CW+3UwHPeuu2d0EaLhFYKhjOvqP7+1Mxz1/dz90Iw==
X-Received: by 2002:a05:620a:142e:: with SMTP id
 k14mr24946158qkj.483.1605101675195; 
 Wed, 11 Nov 2020 05:34:35 -0800 (PST)
Received: from localhost.localdomain
 (host-173-230-99-154.tnkngak.clients.pavlovmedia.com. [173.230.99.154])
 by smtp.gmail.com with ESMTPSA id r190sm1997814qkf.101.2020.11.11.05.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:34:34 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp v2 2/8] parisc: Enable seccomp architecture tracking
Date: Wed, 11 Nov 2020 07:33:48 -0600
Message-Id: <9bb86c546eda753adf5270425e7353202dbce87c.1605101222.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1605101222.git.yifeifz2@illinois.edu>
References: <cover.1605101222.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_083436_828091_BAEB7619 
X-CRM114-Status: GOOD (  14.00  )
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
for parisc.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/parisc/include/asm/Kbuild    |  1 -
 arch/parisc/include/asm/seccomp.h | 22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 arch/parisc/include/asm/seccomp.h

diff --git a/arch/parisc/include/asm/Kbuild b/arch/parisc/include/asm/Kbuild
index e3ee5c0bfe80..f16c4db80116 100644
--- a/arch/parisc/include/asm/Kbuild
+++ b/arch/parisc/include/asm/Kbuild
@@ -5,5 +5,4 @@ generated-y += syscall_table_c32.h
 generic-y += kvm_para.h
 generic-y += local64.h
 generic-y += mcs_spinlock.h
-generic-y += seccomp.h
 generic-y += user.h
diff --git a/arch/parisc/include/asm/seccomp.h b/arch/parisc/include/asm/seccomp.h
new file mode 100644
index 000000000000..b058b2220322
--- /dev/null
+++ b/arch/parisc/include/asm/seccomp.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_SECCOMP_H
+#define _ASM_SECCOMP_H
+
+#include <asm-generic/seccomp.h>
+
+#ifdef CONFIG_64BIT
+# define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_PARISC64
+# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+# define SECCOMP_ARCH_NATIVE_NAME	"parisc64"
+# ifdef CONFIG_COMPAT
+#  define SECCOMP_ARCH_COMPAT		AUDIT_ARCH_PARISC
+#  define SECCOMP_ARCH_COMPAT_NR	NR_syscalls
+#  define SECCOMP_ARCH_COMPAT_NAME	"parisc"
+# endif
+#else /* !CONFIG_64BIT */
+# define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_PARISC
+# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+# define SECCOMP_ARCH_NATIVE_NAME	"parisc"
+#endif
+
+#endif /* _ASM_SECCOMP_H */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
