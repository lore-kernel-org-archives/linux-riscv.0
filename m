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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072B6C5517A
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 13:34:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81486206D9
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 13:34:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nqwAMErI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kqmci847"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81486206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=seMBl2r5zMUxidH6G9EgGq4udYGrBfI9xEp5H9jmSE0=; b=nqwAMErIGXFui+jZWNkGK1r3Q
	tSZXMDRDI251SGsoIr2WcFNMdrK/LLN/yrfmoF/BQIsXCSGCPx8jqUBysXj22txVnltJOjPa1q6Uu
	8BrZhQpkU9p/uW1PcgPXFh4yxFePH9gF6Y8SkufXOAvTjfDkGzjHNTY2t/53r9Dwu2Zn3WQeY9Rmn
	twe9GxUHPVQgCrE65cuJeDTEZwmzdn5/dn8rHIFY0V04GQ5Hy2bPo5HviJf9ju4QtglmvOH1RWNf0
	JVCLEjk1NOVhKaKdLv5LFtRbM660qE9kc7JRE4hRFMrvSIILIYDvRcnQ6s2FDs63Ncplqnf5Motxr
	STAOU1bkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcqGp-00077K-Pe; Wed, 11 Nov 2020 13:34:43 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcqGm-00074g-2u
 for linux-riscv@lists.infradead.org; Wed, 11 Nov 2020 13:34:41 +0000
Received: by mail-qv1-xf42.google.com with SMTP id e5so869214qvs.1
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 05:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=do2IkGTsgJZMce9dLCi5y9V7vjNX63EvX8bAUDpEGLM=;
 b=kqmci8479r1GmpSX/CsPK24jcw4ackZR09/fqBvzcYwOBOneuWx5PFapDrNR/y91zk
 ExAMU598dyHT/RcJ0vEsvLy4Ops+sFNh3zgqOE4JArPSyF7W9sja/hApRc2rC1Nwm2hJ
 u50FMSKsKEcagX5U7XeUcBUJxC1PhPsCIK1LzOF+1qxQDwvzDgWYavL+OHfPE2kcPPFp
 EApyeIYNOUYqsqaYXaV0Ji65m4GhaGRycYlamUWs8R5m/Eh5ESQ0qNfQZrDakTPeWfnR
 dkjvod65hl/fav16KIifE1cRgTcdlFaQ87PvVYqF5inQSFpWoASygEZjooid8wnIuGLL
 DptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=do2IkGTsgJZMce9dLCi5y9V7vjNX63EvX8bAUDpEGLM=;
 b=N+pp20WdJolI40FiHR5bluUmOErPU5bsktFynIgIhnasiHt9YBSoG9sDdMzSfbtZOQ
 G9dXQy3nlhyEufmkB97B507zyL/OT3AmF4BqQlbIY9eYe68oISbQGAWwn2SXgUEbbSz5
 BvKXVQzYxwet2R2He9FmLT6nPG/LZaAZugcnYqBCCZbZRnEqmLlZiG1lxnhHkE3YKXdU
 8AhbBMl++Wr0U2lAHXkcQQ+kDh4ZhwcFG4hAmouaIEqNOHkPy5anZ0LJ+cZsw32wmnmw
 8r/9cYDxtjBRrYbp01Ua5DpxwK2e/pnI8VsD8I1nbGPfva+fukOWMkI3ASM2ZXRUlPRd
 64aQ==
X-Gm-Message-State: AOAM532cUSA1ZPntOZMYikislpAf2+FdwFcaEn5Khlkqu+1i1tnT6PGv
 oxYJ2ml2MAxo13oqn4W1084=
X-Google-Smtp-Source: ABdhPJzFsUI0zV9/mJU71uSGXIEeuyYH9ZXGj+0WaVMtZXX0iy4+DwFsWuBQL0cgOtuNbH4AHKgOyQ==
X-Received: by 2002:a0c:e443:: with SMTP id d3mr13987966qvm.18.1605101678476; 
 Wed, 11 Nov 2020 05:34:38 -0800 (PST)
Received: from localhost.localdomain
 (host-173-230-99-154.tnkngak.clients.pavlovmedia.com. [173.230.99.154])
 by smtp.gmail.com with ESMTPSA id r190sm1997814qkf.101.2020.11.11.05.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:34:37 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp v2 4/8] riscv: Enable seccomp architecture tracking
Date: Wed, 11 Nov 2020 07:33:50 -0600
Message-Id: <58ef925d00505cbb77478fa6bd2b48ab2d902460.1605101222.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1605101222.git.yifeifz2@illinois.edu>
References: <cover.1605101222.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_083440_191884_3060BCDF 
X-CRM114-Status: GOOD (  10.35  )
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
for riscv.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/riscv/include/asm/seccomp.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/seccomp.h b/arch/riscv/include/asm/seccomp.h
index bf7744ee3b3d..c7ee6a3507be 100644
--- a/arch/riscv/include/asm/seccomp.h
+++ b/arch/riscv/include/asm/seccomp.h
@@ -7,4 +7,14 @@
 
 #include <asm-generic/seccomp.h>
 
+#ifdef CONFIG_64BIT
+# define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_RISCV64
+# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+# define SECCOMP_ARCH_NATIVE_NAME	"riscv64"
+#else /* !CONFIG_64BIT */
+# define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_RISCV32
+# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+# define SECCOMP_ARCH_NATIVE_NAME	"riscv32"
+#endif
+
 #endif /* _ASM_SECCOMP_H */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
