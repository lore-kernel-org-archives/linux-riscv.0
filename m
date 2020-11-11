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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD890C5517A
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 13:34:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 479E8206D9
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 13:34:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WIeEv456";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vNGoRE4T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 479E8206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fy87lpEIUSFo1A1T3Nt3lUzWcjQ4woHU+e/QUm+6zUg=; b=WIeEv456S9RXBdmTid7euPTQP
	2EbBD8kk8aNCo/O4j8YwKgzMqff3be+Z9BjWBL1Ew/BPMBlrCTTB2jIhzGOFZ0FJrbKHjihgadmG4
	AaL2V3OTgl01iYOdnwx85VddFK9oI/NYZGr+0WDjs/vTw7Rq+jpubX4ZYUDgXVWyg0kpS47isxV7M
	SZW5KkYrsIvUKoOcU3rw1eviiZLxojyXcv1nBE9CiaWqIbsgGc0vLyjH1Bmiw8WU1zqgya+AzhRmk
	UtqkRDFB+zGWIsQi8lqmx07yVD84nJVsbX6QgHfRdBIYnIvN8qLMhi06chkt8jfbgAMQSFHTrwlDt
	yZ5gTvPSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcqGm-000759-Ja; Wed, 11 Nov 2020 13:34:40 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcqGk-000743-6t
 for linux-riscv@lists.infradead.org; Wed, 11 Nov 2020 13:34:38 +0000
Received: by mail-qt1-x842.google.com with SMTP id 7so1260773qtp.1
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 05:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p4ug0/ujexdr5eX2KHZwXV+5OEEE0LQ6CHuZfwOYci4=;
 b=vNGoRE4T2vueWtMyfIqsMJnHQf5sexlSfNm5+JYWvZrbhr28FRAtAv3lFmTY0+4W0Y
 WcYZoYHknNJQqlmA5lKA2IjQ5N2wYEjtpuzYl7OO06EsiIGv6XJZ3Kb9UjRl3/b7/1X8
 XfCjrkryG0QaqerFaC1fcQ9Tr2HyAB4KKtxuVtQp0xutUOI57AMaDr4CA2MgmoE4mjCv
 KB12O8KYoI95e70wD3aaXcRNbfK6zccMr68ebqQN7E8uk7S2TR1coNLaubqwUvBts/Lv
 zorqhisqngJ2ZuCEG1/njxhxTc7yrzx1m99VyQR+bb/RgHndyJV5i+iGi1vdeZUV7FdW
 piDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p4ug0/ujexdr5eX2KHZwXV+5OEEE0LQ6CHuZfwOYci4=;
 b=o1Q4jRFEs00jAhpokyjOgGOvynVdZXov4HVzCTwN3i3tbtWhtvSPaxXnnEDSIbXZZo
 Ivk0GsswXl0ajoW2JKkdhO7/U4eXcz38fu1AmLuFedzPiVSjJ1O6l70SpfMpndgAGazt
 /V2ghIF/3nQdvaCo9xdhzZJrSCQp6mZ8Izr2oJc4SrKc+mALeEnodNuFUpLJPfP3V/E4
 waaBQ3zcHqKdwRHRbgxCDaKXkknl4THYFIe675rbVrTRZq+lg9gW5jq9QS5OvfD9gnKB
 E6MuRKCO6SRLhCHti9S4uwGf/Dkr/jIik1/xnnFI6pQM1XY+k1zVE46xb0k7e7lF/r+p
 Z89A==
X-Gm-Message-State: AOAM53261tvr9P/5yynA+xa8eIUryz61DK2qEEJ2DWg/jofSv8CiNxTm
 j0Vg7X7FfXxu5k6kSbaxf2g=
X-Google-Smtp-Source: ABdhPJyVXjxkJWplKVPB4NFyM0YLYj5IP428vFSUkWNwwyzA8cf7e/mXCgVyvFukKTHkEaORyR7aHQ==
X-Received: by 2002:aed:39c2:: with SMTP id m60mr12461442qte.206.1605101676823; 
 Wed, 11 Nov 2020 05:34:36 -0800 (PST)
Received: from localhost.localdomain
 (host-173-230-99-154.tnkngak.clients.pavlovmedia.com. [173.230.99.154])
 by smtp.gmail.com with ESMTPSA id r190sm1997814qkf.101.2020.11.11.05.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:34:36 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp v2 3/8] powerpc: Enable seccomp architecture tracking
Date: Wed, 11 Nov 2020 07:33:49 -0600
Message-Id: <0b64925362671cdaa26d01bfe50b3ba5e164adfd.1605101222.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1605101222.git.yifeifz2@illinois.edu>
References: <cover.1605101222.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_083438_315862_07B8514E 
X-CRM114-Status: GOOD (  10.84  )
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

__LITTLE_ENDIAN__ is used here instead of CONFIG_CPU_LITTLE_ENDIAN
to keep it consistent with asm/syscall.h.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/powerpc/include/asm/seccomp.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/powerpc/include/asm/seccomp.h b/arch/powerpc/include/asm/seccomp.h
index 51209f6071c5..ac2033f134f0 100644
--- a/arch/powerpc/include/asm/seccomp.h
+++ b/arch/powerpc/include/asm/seccomp.h
@@ -8,4 +8,27 @@
 
 #include <asm-generic/seccomp.h>
 
+#ifdef __LITTLE_ENDIAN__
+#define __SECCOMP_ARCH_LE		__AUDIT_ARCH_LE
+#define __SECCOMP_ARCH_LE_NAME		"le"
+#else
+#define __SECCOMP_ARCH_LE		0
+#define __SECCOMP_ARCH_LE_NAME
+#endif
+
+#ifdef CONFIG_PPC64
+# define SECCOMP_ARCH_NATIVE		(AUDIT_ARCH_PPC64 | __SECCOMP_ARCH_LE)
+# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+# define SECCOMP_ARCH_NATIVE_NAME	"ppc64" __SECCOMP_ARCH_LE_NAME
+# ifdef CONFIG_COMPAT
+#  define SECCOMP_ARCH_COMPAT		(AUDIT_ARCH_PPC | __SECCOMP_ARCH_LE)
+#  define SECCOMP_ARCH_COMPAT_NR	NR_syscalls
+#  define SECCOMP_ARCH_COMPAT_NAME	"ppc" __SECCOMP_ARCH_LE_NAME
+# endif
+#else /* !CONFIG_PPC64 */
+# define SECCOMP_ARCH_NATIVE		(AUDIT_ARCH_PPC | __SECCOMP_ARCH_LE)
+# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+# define SECCOMP_ARCH_NATIVE_NAME	"ppc" __SECCOMP_ARCH_LE_NAME
+#endif
+
 #endif	/* _ASM_POWERPC_SECCOMP_H */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
