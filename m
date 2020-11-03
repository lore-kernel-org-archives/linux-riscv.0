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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D83FC388F7
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:45:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2614421534
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:45:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JqIqFNa9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuwgpDk+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2614421534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qrcl1QoOj6O3bqjdQdHm2GGnWsbRTCvcPoiDUFqeEkY=; b=JqIqFNa9VzQzOx06HoxtNuHoL
	sfyr4wkFpGXaTeXoBjac0Ca+2YNf+bWAWuselUiqqt+uwNJQWS+ROq5STssfhc2RRaiHEPDn8W1hf
	exOMHK0n7pAnpdZULCwx7yL3sqY4zmyRh45DQi10R3MS3bsDBaTberpmZHSDV3fcL7B949Yoy4cbj
	9ts4T0Kr2Z3mTno8v4pxu/hWb+1JS1O1byCk87a7nz37CkAuQk0pmf4D2RwmKqmRMCfvvVuo3YLrf
	xplWrCNwBaMAuGH/3db5aTGyONvERl/S2Dc6tDlHApfoSvDcaQgj6x2Bth8edRKS2yRzEVb6dWtvX
	clOu7B9tQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZwcf-0007TS-90; Tue, 03 Nov 2020 13:45:17 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZwcZ-0007QO-Sn
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 13:45:13 +0000
Received: by mail-qk1-x744.google.com with SMTP id z6so14642252qkz.4
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 05:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LIHaRbcW33holGtLxAdu7MnC0XA7v48flZenL4Xa8vU=;
 b=iuwgpDk+ywyZuJVS5CkkW+UWoj8ZeMu3W2DRLryyvnrW+Yalap3GJHVoD8C4+cBD+7
 i0mlc7ylUKWR3VTM8HUiGkrSd6GfEzWHDrKM2Yi/EUh4SUeQJGC5iWhdIlHg1FwsfmU7
 5j2mbRcAQ+Kabs4nK6b2QlwboR4cF7QiMu8M72ms85+IdB3oy7S+KkgeNASKDc+esvNS
 rxHPsuHmxZd6k2hEmZ4gnCaD4zMtAJepsCqvCTOJcS3RDl0yqGmQrE1llfApvK0RDGby
 kEpnD+/cchNFssyPLLdYRHqwyzAWUPNEyXHCd8X+DCF/NW6Ni9L1BESHJg76npfZXeog
 1pWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LIHaRbcW33holGtLxAdu7MnC0XA7v48flZenL4Xa8vU=;
 b=UBShoomCQb+SMjKqWkKUGV3hP/BmKFQlx1fzMQt2HpETBgow9u/Bg0aMkhxtZmINCl
 8JLQz9BooRPzZmnh8FIC/uLcNG1p8mXVC0Zx+Wkx+rshuUeMxImyf7fqRpOFZeFNzRkg
 X8dKLCXIROofSO0MWl5d9c0zKXhH2Fy2BbT5y6OkVzduwD+kXHKzuD58tMRl0VIA3Bin
 BnjE1LLg5t8KgxzZIEFWHJe9qQrSFkSNOaUKLMBCz40B6AzdgKNRKmoIjnr4TjVOi/TV
 fE8iajjSE7JnLZsSJ3vri/y5X2sz+eKXVonXKcNaoDishw+rtSHJLgeWmiTiWEkWGEeL
 vOkw==
X-Gm-Message-State: AOAM530Djn9A5yWqVnd6RzxS4hA6rP8qHpTWWE+nrNjq+R5WV+dROpEY
 Oox7Ox25ihDxt1D/Mm+ZeMo=
X-Google-Smtp-Source: ABdhPJza/Al4BmaaKLSE3M46BZOoXGqpH/lMostTkMqGorYeqXkDTUPky+7rUNYdGBfTqt+ibTx7dg==
X-Received: by 2002:a05:620a:492:: with SMTP id
 18mr20260926qkr.149.1604411110339; 
 Tue, 03 Nov 2020 05:45:10 -0800 (PST)
Received: from zhuyifei1999-ThinkPad-T480.gw.illinois.edu
 ([2620:0:e00:400f::31])
 by smtp.gmail.com with ESMTPSA id a206sm7356568qkb.64.2020.11.03.05.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 05:45:08 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp 2/8] parisc: Enable seccomp architecture tracking
Date: Tue,  3 Nov 2020 07:42:58 -0600
Message-Id: <9bb86c546eda753adf5270425e7353202dbce87c.1604410035.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1604410035.git.yifeifz2@illinois.edu>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_084512_024748_2DF410EC 
X-CRM114-Status: GOOD (  13.56  )
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
