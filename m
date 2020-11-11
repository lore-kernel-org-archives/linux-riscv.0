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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3A1C5517A
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 13:35:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E703206D9
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 13:35:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1Gmlh+RY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8D/Y+HZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E703206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e/RVWutMdYiJg8k2vhpN6A+KxEnz3WmPh6DVvNYagew=; b=1Gmlh+RYtwoJtdJS4vydgFSog
	su3znJCkBcuMW+JYbsyXqCpQIGTNcTanxUTOzu+4Xms2Hb7rSXaLjBVtmZCEgkLWYJB8j863uTUnj
	WT0/vNM5hXb9DAuoAwSt1g6bxUcU6ym89K4F9dGBJbVlMJKoEtdYol3dWrABAMISlQm/VPzgsLlbo
	CR7okRHGZh7+ca1e30fpoQSp0sixI/yS9irkVCzut3LEfQrUlxEDP7TPApBsHb7vypZE6czVASM8I
	8wM2a15UCUpjnxbUJIa3AACoROh0wIFP8bGnderlACnIYSgb14dF+zQQ4X0cWi93DiLBjCFzPL6tM
	U3FYu4TSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcqGz-0007DQ-8i; Wed, 11 Nov 2020 13:34:53 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcqGr-00077Z-0x
 for linux-riscv@lists.infradead.org; Wed, 11 Nov 2020 13:34:48 +0000
Received: by mail-qk1-x744.google.com with SMTP id d9so1593339qke.8
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 05:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KyUFBIsp7WG/ZlJY7JJxE8NR9eUIpLAxO9Zr6R0PBAI=;
 b=F8D/Y+HZfrpZoxY1WSpU1XD08FGxbbmSRvBeCuS4pVYlmDmDfHK+86TEUz2GSieEB6
 /G826gCZaufPpqw9yqU3gNUSRCTgM9O12K4UhmNyeNdIkVTjqwPtJI9Lf+tvkb9Fg8+c
 qRpmL5clJ5CA1S+ea2Ab7oCBQhLxWEhivtggHkttRUxU6H+6bwKCbKQw40vyQeowP2ps
 XMXoUoPJxCmgod7Htt5aWIQRnBxAeBFeM00worN++PmF2dIyJGX4tB4Z/JpSdxEQSkmp
 0SlWBQ6C7R2fx7uyThUkfX85xTr/0pRg1d8IYFbC/KQ5PAYWXyryWS92ixdQ2PxoggBD
 zMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KyUFBIsp7WG/ZlJY7JJxE8NR9eUIpLAxO9Zr6R0PBAI=;
 b=eicWBzlDjmlnT8eDY1Br2eM1/KKayvQT9w3GGI1TEzfNLAjGzhRllaEgVjZpiB0pFk
 FnkrFerDLhtKeW+eJMZfo99H5ZtmJ1YD+nkvcSUu++lyMjJkT39Xz3Gc6ATTKAb/1g+z
 Z9Izefz41fdpRV0OS0wDcSmENRiFkFd9BZ2/6p4Z0fEDsdSRK1FBxgsNElygSNWdxLVS
 L3YS6/Us6yTI323wHqPvm5+R3tUhrempzG5LlMyMFxBhVfnm5Pc85ZzfMGvImLrywU+Z
 OnprhaeaTmuNQzwhUDNKAmyBCAlSnNSpBrbeUp9Ugp6ql7R7JcKXjrmcx5WcZ5KHI7Qj
 fMoA==
X-Gm-Message-State: AOAM532MSkJAe+JHrm6QHPcvlafh+Rhi49CXvU+9rA7hOHRVjPcBTo+y
 skDOaGKLGsD1P5F2zQlGHeQ=
X-Google-Smtp-Source: ABdhPJz84XkbzmcCHTc2+SdZFUqORQfeEggNtVRT4ylMevKQ8zIMjt4i44s0v7vCLpX1u6c6tS/Tlw==
X-Received: by 2002:a37:4145:: with SMTP id o66mr19607495qka.426.1605101683404; 
 Wed, 11 Nov 2020 05:34:43 -0800 (PST)
Received: from localhost.localdomain
 (host-173-230-99-154.tnkngak.clients.pavlovmedia.com. [173.230.99.154])
 by smtp.gmail.com with ESMTPSA id r190sm1997814qkf.101.2020.11.11.05.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:34:42 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp v2 7/8] xtensa: Enable seccomp architecture tracking
Date: Wed, 11 Nov 2020 07:33:53 -0600
Message-Id: <79669648ba167d668ea6ffb4884250abcd5ed254.1605101222.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1605101222.git.yifeifz2@illinois.edu>
References: <cover.1605101222.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_083445_310573_945744C6 
X-CRM114-Status: GOOD (  14.10  )
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
for xtensa.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/xtensa/include/asm/Kbuild    |  1 -
 arch/xtensa/include/asm/seccomp.h | 11 +++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 arch/xtensa/include/asm/seccomp.h

diff --git a/arch/xtensa/include/asm/Kbuild b/arch/xtensa/include/asm/Kbuild
index c59c42a1221a..9718e9593564 100644
--- a/arch/xtensa/include/asm/Kbuild
+++ b/arch/xtensa/include/asm/Kbuild
@@ -7,5 +7,4 @@ generic-y += mcs_spinlock.h
 generic-y += param.h
 generic-y += qrwlock.h
 generic-y += qspinlock.h
-generic-y += seccomp.h
 generic-y += user.h
diff --git a/arch/xtensa/include/asm/seccomp.h b/arch/xtensa/include/asm/seccomp.h
new file mode 100644
index 000000000000..f1cb6b0a9e1f
--- /dev/null
+++ b/arch/xtensa/include/asm/seccomp.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_SECCOMP_H
+#define _ASM_SECCOMP_H
+
+#include <asm-generic/seccomp.h>
+
+#define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_XTENSA
+#define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+#define SECCOMP_ARCH_NATIVE_NAME	"xtensa"
+
+#endif /* _ASM_SECCOMP_H */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
