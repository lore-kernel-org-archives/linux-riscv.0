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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C7FC388F7
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:45:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 737CC21534
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:45:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eN7MOmJV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4PJS/xa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 737CC21534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e/RVWutMdYiJg8k2vhpN6A+KxEnz3WmPh6DVvNYagew=; b=eN7MOmJVvyohoRU+Gx/rVLHh0
	kISBnxCF/jiqaKgVvxLO5XsTM01vvSbyiL7ooi8GtF3sh4ceANMdsTNU69pY6kHLWvwPEqs+PNoS6
	9YUXlH9LjZjOMrJPg4SBzX5RRP5cj9DkJudwt9MvZyWp/QdFHGuKLjl8SVHlg6lOBzwZqLjP8133V
	QdWAEeMYyko/3V91ssCq4OieS/xb1yU203lBXvbwhWXuyLgDx7izwqNvTSDpYjlxwvbRQBz4xY3K7
	s05mBAvn7RWs2a492CDRv9PFOEWL4eDbkR1Jq8I8oyghIoM5vcJj+AytDOFyeklLVdUH77TqUD3Hp
	Uws7gBUvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZwct-0007aW-69; Tue, 03 Nov 2020 13:45:31 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZwci-0007UV-8V
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 13:45:23 +0000
Received: by mail-qk1-x744.google.com with SMTP id a64so11234759qkc.5
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 05:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KyUFBIsp7WG/ZlJY7JJxE8NR9eUIpLAxO9Zr6R0PBAI=;
 b=b4PJS/xarNSgluAWCDQQJdu5ZZO0VU1I/CVu92i5vqJojdmesNzdpHU7yArgmVQ/E0
 ssbV0IRGKePz0hLGbtulnwYnTx5COwyQyc9m5w6wHYmkYcfAi0KMHRRx7s4bial5QlHm
 FvgIq+A4dw+gBa8aET875i6MrhNYYoEziVxW0mYaQlwHJjIC17MKQQffriRcRcrqbvIZ
 E0DUUKInWpAcW0rkp9bF5XrHmo61/Wt1H/vsEPSTiCc6yDtBv1y+2E2shnOXWuZJykAv
 qixeNSrBN1O663ndDaowUg7ftIsFgDEFacIeZyHTHWsjCEpnDR4tkoP+lBgPM5gFOtbX
 RUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KyUFBIsp7WG/ZlJY7JJxE8NR9eUIpLAxO9Zr6R0PBAI=;
 b=Ev745sOtr82RHHfgWFLb6AcUlfDuFCJcN/s6b3LaZXHX0Z2BCl69H/HyIuwamYAEV7
 DRN0DxeM9HX7kEy4NJ6RaurOFfXgyDWc1d3Mdv1xTi7Wb++MFA3POo28ekRZbRmnJ/XV
 Ms2fwn2I+Z7A9Q5uTIA4hfmUV/VIJtzsPqpz4hqFGh0ZGJ+1iJhXEZmaTosTFseu4FIs
 hmH5hPRJPsnd30nQyjD3t+xWwAnCkx7yPw1laD5PGX3ggXm5zMwmYcEWchKymn5Sjn15
 WFGZOwjzbO2CRUGEf1XTckZ20KxbqLMiNd+ZrqzRn7okbH/4xCbnHr0/lj41jnDKcljj
 /Msw==
X-Gm-Message-State: AOAM531vWQ/7R1zlEN7OeGuDCF93z15U7NcYGR4GvXVSYe0jlaUi0GGB
 5jJEYVMgoobW06KJciy9e7I=
X-Google-Smtp-Source: ABdhPJxjlZ3tKnk2e7vxZIf8aOb5eHzCPcpqw48aBWIjBaLIjY56iC7mD5NkhJDWu4rwTzCntUVI8A==
X-Received: by 2002:a05:620a:62b:: with SMTP id
 11mr20584746qkv.229.1604411118944; 
 Tue, 03 Nov 2020 05:45:18 -0800 (PST)
Received: from zhuyifei1999-ThinkPad-T480.gw.illinois.edu
 ([2620:0:e00:400f::31])
 by smtp.gmail.com with ESMTPSA id a206sm7356568qkb.64.2020.11.03.05.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 05:45:18 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp 7/8] xtensa: Enable seccomp architecture tracking
Date: Tue,  3 Nov 2020 07:43:03 -0600
Message-Id: <eab25a03fbf296e65e5292c7a25d15285e93e6de.1604410035.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1604410035.git.yifeifz2@illinois.edu>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_084520_449355_B9E35CC2 
X-CRM114-Status: GOOD (  13.63  )
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
