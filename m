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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90193C2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:45:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C8E12224E
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 13:45:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CsZpNIqO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQlGQ9Jd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C8E12224E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O5STci+UU0ZGtHC4nrdkjEVMauQwQZ/C6OXOBnuLNAQ=; b=CsZpNIqOVlthVZakTXi8dwd8B
	8OaW/AoBM0Z8xmIxWvvEvOqctKbz+1qTLQr6HFx7Lc5+34NCJUgFcB76S27YbKVeTFJpq98rTKL5j
	kfaoAMFmPMliBsAkN0sKRjLz5vQvhI2VLQ8NIquHQiEtcJrris4vx9ix0B10MAe/E7ogi3aV3bBG7
	vn4kXHWyhnNS+obEnMFpydH3FPSs3yLnPwZl5tnjNTarvD+hgv+7SvRX7lvxdhM6HN9yCZbI+sJZx
	gRbU5RZNyvUnKRjHzY1yx4wQlgTX63UjYubULOZMCdMBY8efAS1R//k4J6PQnrzjk0cqlbK7w9Po9
	MvbMZ7hTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZwco-0007YH-2U; Tue, 03 Nov 2020 13:45:26 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZwce-0007T1-UL
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 13:45:18 +0000
Received: by mail-qk1-x741.google.com with SMTP id a64so11234590qkc.5
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 05:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+eMXBOnvKPM7N/Eu0cs4UA1I6FeurfdgB6uFLVTMPX8=;
 b=WQlGQ9Jd6IJQey7nb9UMUDYsL+DEjmMTVkMHPOOrYSdV926tvA93ywvzKvPW9EdJzQ
 xWYruju83XXsh1i6XxcvxRg6hDqU6tq8BaNfGIDHsg2pgJYtsAkvynEeGwGPRGe+ZPsx
 biGcniO7POm0x08s1Iwq88HHNGiqadVQYcORh5b/WkN2ytRV8n2H7zXHbG9CyN36/TNs
 CvFVpr4PvgANBbzTT2RtpSiuCEWpI/CT6RmO+Fk+zaNRO64hUzWUoNMlpPKDi4ZwlNos
 6rRlllg7BYoJdX53s9pkkLBvkmTEqozVXkK0+PARPMrbpsjLaiSLI/uef0UWqLlg9En5
 LfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+eMXBOnvKPM7N/Eu0cs4UA1I6FeurfdgB6uFLVTMPX8=;
 b=B2dXYzNcOFhiiQdWwADRj04TO9oJ2INVZTh4xXy197XjcJKuPqv0M9tOWJcXSahEdk
 mDEuJwY5wdOgVuLhwsu85p3Aat9Vw9TYK2bQciYbjMXlySQsnb+Z6DcRgS963jj3lKXr
 MV2T/EBMnahjBQ5eCyykZmulNneMXSoZgQ5rUIHv8m8KtuvzHzxc512QOBUQh5H1Fp3H
 REENHqArnVOwrstaze7JiAKKs4oO4M4HirSnlnmbcV3+PD2sqacuKZ5G5w04KYrv/ReI
 6YEDn+ZNVaNF2ZsBJ4DvfkowfyDApuhfMfzM7LF9h73y0s6UgTC4KcwgDms06J4h1DfR
 DmPQ==
X-Gm-Message-State: AOAM532QzwcMkCd9b4wG2kErHEwYLjRodsmz73nAtOrhaCijFITSm3F1
 zQwOL6ysEBrVMGhwb30FwFQ=
X-Google-Smtp-Source: ABdhPJwPGCoGB0mzNqbRbE7eqaQrs2dVEZ+ysMN9iFWpphI5Jv582QKy4aIVAjZqImUIW48ZcJyckw==
X-Received: by 2002:a37:6187:: with SMTP id v129mr8374191qkb.31.1604411115473; 
 Tue, 03 Nov 2020 05:45:15 -0800 (PST)
Received: from zhuyifei1999-ThinkPad-T480.gw.illinois.edu
 ([2620:0:e00:400f::31])
 by smtp.gmail.com with ESMTPSA id a206sm7356568qkb.64.2020.11.03.05.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 05:45:14 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp 5/8] s390: Enable seccomp architecture tracking
Date: Tue,  3 Nov 2020 07:43:01 -0600
Message-Id: <0fbe0c14d598e18effad3b648ab4808f9cd95eba.1604410035.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1604410035.git.yifeifz2@illinois.edu>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_084517_074955_76C813FA 
X-CRM114-Status: GOOD (  10.12  )
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
for s390.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/s390/include/asm/seccomp.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/s390/include/asm/seccomp.h b/arch/s390/include/asm/seccomp.h
index 795bbe0d7ca6..71d46f0ba97b 100644
--- a/arch/s390/include/asm/seccomp.h
+++ b/arch/s390/include/asm/seccomp.h
@@ -16,4 +16,13 @@
 
 #include <asm-generic/seccomp.h>
 
+#define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_S390X
+#define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+#define SECCOMP_ARCH_NATIVE_NAME	"s390x"
+#ifdef CONFIG_COMPAT
+# define SECCOMP_ARCH_COMPAT		AUDIT_ARCH_S390
+# define SECCOMP_ARCH_COMPAT_NR		NR_syscalls
+# define SECCOMP_ARCH_COMPAT_NAME	"s390"
+#endif
+
 #endif	/* _ASM_S390_SECCOMP_H */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
