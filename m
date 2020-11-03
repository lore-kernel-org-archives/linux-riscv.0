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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B501BC2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:45:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39C4A22243
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:45:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="McKOTZTV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUmeo8PK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39C4A22243
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+jekvr7imq7i5DagEmyU4EmOCTF2TyM98MUzjuySQ0U=; b=McKOTZTVooVzjZ+GFJ7oZdnHy
	6TEbCkC7VH+fr/TijDB2yfvUThOS0PBG/2s0tbPQ+8dfxDnddPurzjUpcA3HEJkp5zwqHyGSSZjtS
	CCZ8+eneZGonNuSYXumNHfbrWp1NOzrlIltHhoWOpxN4cyfxsbv/DZXVBczRotmKEArpU5cVIJG6G
	8gFiNCar9qUDlKMezX4OR7V4d3ERafTsJTWvMuwtnOXJG/MhvDnWFYBJjL7JwNENZDnW2n+TZZejp
	XujMRlHaQ44p7j3z85nGk0tsy5v6lxc9vq4x0opts8aJLWqwAzY7fhfUoeLIWlyH6/g2Ht7Bj6EO4
	FeGsR4Z1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZwce-0007SX-7p; Tue, 03 Nov 2020 13:45:16 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZwcX-0007Q3-Lx
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 13:45:12 +0000
Received: by mail-qk1-x741.google.com with SMTP id l2so14654041qkf.0
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 05:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/wWgXpwOKfWu89zfH4z55YdVS4FoKgsyU3KjhUPw2Xk=;
 b=HUmeo8PKFkCINZljvfRc+P6j2X0+0GOhvVUFZGwDVi5RBcL6yCRRP7JuB0zv9c9+Po
 E3+9kj9NX57UzwwDZNGdD8iaYBGU9wXX967tHeoCgvkJm1CovDmhTO1emhffrLi5usDF
 0oEzRtLhoIuA39ggcO6eQcTv/OGvRmPgCQX4sTZrzio50ODOqs0YICXq0MgBjQAfHPdz
 xl7tXTacq4qNhz9LC51MS1M++unu3TcfcbkGRzSQxWGdRezIwQbhQELfkQD+RH+S21A/
 sax7yhctLMgZTMGgygja3clLmsRRE7W8PkbbGI7EUIeZ8EaqV18ap7HIw7j/Z7WF3HJx
 8pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/wWgXpwOKfWu89zfH4z55YdVS4FoKgsyU3KjhUPw2Xk=;
 b=D7kkjkptNFAGwm4sPWUO9LH0BEqwkSXT5ctVYW0AOeH+ToNdpAAxgDpyrFLj4G4qVT
 RaemOQgI38M0p+lZA1h/tflT/I/5J1LpKhHsGQXLWSypsMH0P8ZAofzbotrb/t1FUc2g
 0iFKeKDtdcXYFH2oLf1vuWB/oEoa7qipwpiwsPjw2i/VI/qv7bWxEh8zX5iNX7UQiNTC
 Gtlqa0JYJfehsPUFbs/0nL2nDfqTtz+agDWghjWn1zG3nuIZmL3po2NoP5V/MJC6B7Wz
 1ZXA5DZucIKRduoJ+dC8XjSSPsQgglRa0gcuuPj8zqE3ZGMHAO0qRnPYS0oxMC4XpZRK
 HDSg==
X-Gm-Message-State: AOAM5307rLt0LHYeVDkrDQ4Y0JCOagnX1EZ6bi+WxkFGdyzfc/bxDbme
 W1F5/Ic3UVUYyaW4IiCMlpk=
X-Google-Smtp-Source: ABdhPJyHAHCGbEEm09WION+/UIzzZ/lrqbH487CGEGOVROPc59579zIEupD9GaMmhFNRyF9+2N11RQ==
X-Received: by 2002:ae9:dec5:: with SMTP id
 s188mr20227157qkf.250.1604411107951; 
 Tue, 03 Nov 2020 05:45:07 -0800 (PST)
Received: from zhuyifei1999-ThinkPad-T480.gw.illinois.edu
 ([2620:0:e00:400f::31])
 by smtp.gmail.com with ESMTPSA id a206sm7356568qkb.64.2020.11.03.05.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 05:45:07 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp 1/8] csky: Enable seccomp architecture tracking
Date: Tue,  3 Nov 2020 07:42:57 -0600
Message-Id: <f9219026d4803b22f3e57e3768b4e42e004ef236.1604410035.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1604410035.git.yifeifz2@illinois.edu>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_084511_375299_C13A250D 
X-CRM114-Status: GOOD (  13.55  )
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
for csky.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/csky/include/asm/Kbuild    |  1 -
 arch/csky/include/asm/seccomp.h | 11 +++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 arch/csky/include/asm/seccomp.h

diff --git a/arch/csky/include/asm/Kbuild b/arch/csky/include/asm/Kbuild
index 64876e59e2ef..93372255984d 100644
--- a/arch/csky/include/asm/Kbuild
+++ b/arch/csky/include/asm/Kbuild
@@ -4,6 +4,5 @@ generic-y += gpio.h
 generic-y += kvm_para.h
 generic-y += local64.h
 generic-y += qrwlock.h
-generic-y += seccomp.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/csky/include/asm/seccomp.h b/arch/csky/include/asm/seccomp.h
new file mode 100644
index 000000000000..d33e758126fb
--- /dev/null
+++ b/arch/csky/include/asm/seccomp.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_SECCOMP_H
+#define _ASM_SECCOMP_H
+
+#include <asm-generic/seccomp.h>
+
+#define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_CSKY
+#define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+#define SECCOMP_ARCH_NATIVE_NAME	"csky"
+
+#endif /* _ASM_SECCOMP_H */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
