Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552DFC83F22
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 18:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U00jFwO/F9WpdRGWe1Td8xnr0znGaUtkNm7ZrcBzR+w=; b=PRb1tlAIBx2N3D
	a5yfK5b3GIVdD+sxmpRBp/7P5PU4s7B/BLS8cGA2zM1m/R4lsQGWKTv43R9pu4/81Lo+dJUYAHHdD
	INQZFDqpaJlNbFj6jm+8l1s4gTCVaekUlbEQl4iLQ6dUYc0/MSTNtRverrZENo86BNELRvpoAVccl
	2MakKRvZlBg6NQQfsuQKkZgJzYZrw8y18Xthy3lDhCSRmad/m7w8VFhnZLOtRyA0GOgYhaWp0xqvy
	JSl+NLRKzOBW3faTMrgOPYl9zFUxczEOt/nFti8kEIk9Sx1J3dLcG0RsrZFlJqB1YEL5sJ+vd0mgU
	EbCRriybc/4IYZEzJx9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc6dn-00000008Mvv-0dVq;
	Wed, 16 Jul 2025 18:14:03 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc6dk-00000008MvS-2Own
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 18:14:02 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-235ea292956so1074295ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 11:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1752689640; x=1753294440; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=1RvwBwtJVyTmMt2LMMTRx+8yHauaoCchAjl1DdxGaHE=;
        b=DgNG82DN1WoIPUcnMSQQYhVmiscwz8CdLWntzwLJNKdcldjhF5FGzIaBWuacnkkb35
         kBLj9z/KNHY8GJc9D2U7++623AG510vBXzDXsUpOxTaIz98X8yvbpBPtyvXKIcKcUfn3
         HlKgZzi8rWaNXhZKpHVJwNYTh3gI/dGocsrrF83b0Lt/o4TnCM1YFMfV4C2+tDOWT7Jo
         M4ne+WCMTXvOOXQrlwWhnyysP4qy452TgkoBJZfCj2dBlLV4kY8SDD6RuJUYj2iJYFsI
         SKmsUao+9Twshxkbaj65pXvQFJjARPzYe9OwWXbgdh0EJCMMzOHo5171kXYOk2jWrFHq
         wgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752689640; x=1753294440;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1RvwBwtJVyTmMt2LMMTRx+8yHauaoCchAjl1DdxGaHE=;
        b=dUWk7NJkRcNU7kMCMBLSn1fSRmvdlb+x4Kse7yk83R5npasPyLBT2mpzv3oV104UD2
         Kt+LpvvBauW5D+hVPW/LZEK1fBE+47s3uEnzTkPvzhRunfDOapCDsRN4/RG5yuV0jGCO
         7dFltipyTtGNPUc9XCUMmWhydDNuNldHsjD/a3nxK9TigC+XOnYz3PXy5zq2CglD/ChB
         ChDWAI25kjVk4YmIBYP/aH0KEE4RiN8Z+JHxTng0H1BCjxO79dHHbzB/kR2yZU7cvVVI
         HarP+lv+Wc77BfzRSlMdmZFRglGlFpy2Uht6JX0oTp/iqDyIvUb6/B/Sw820JWiTHLiw
         rszQ==
X-Gm-Message-State: AOJu0YxZDIIPh+pIN2TVxh6vrhxzUJmsEjORjp2xd+P8u3Ek/mcU2ldQ
	e2ijGhIhlihNrWNztZyK8aOPGVvSaz1PUojGJcq9W2A7ZB6gQQzIZFtoxGB0efSqfvm0GWZYyis
	TNLpU3AY=
X-Gm-Gg: ASbGncsh9MzlJV5e2/7bSd1wkHHqROLhs8Crv9PHaamdhG5Yy6vfkPDNafBHjimN06w
	iQtCPn/UF3lreSXjJwCTp5MFjwoaG3roVC1Nn5p7Q5bja7j7raNqfWJpvntjO86fWgs3ToAmZTX
	2ewwLIPXUlnVQTCjsWIKRsHUUKgL3tEEfdZPfQ8TmK2Kas83IhoKPp/yZyhoQJukKahAjfvavwg
	jYeu+bY/FsiM+V/yfmwBCiqMwV01aNb6+aCWHDqiqsksXHkmM4lc+9XlMSCSbRgd3V85DL5JZji
	4JP0M2UmdujdP7x1qzHirFOFFE9LsKppmgysJ9elnOl86holNmles/Ra0tqEfOjRv+8IGkE/ivu
	2TRLpmn9cPDTazpB9Doey
X-Google-Smtp-Source: AGHT+IEQVjp0p8iVh5aDlCe4YhcoEItp+zVRxE+iQVRhWtx0bHhMY1uU5CGpWyLjhXD7lLHaDYWVKw==
X-Received: by 2002:a17:902:f601:b0:234:cb4a:bc1b with SMTP id d9443c01a7336-23e2577851fmr58350425ad.49.1752689639698;
        Wed, 16 Jul 2025 11:13:59 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:b02a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23de433e05asm128960025ad.178.2025.07.16.11.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 11:13:59 -0700 (PDT)
Subject: [WIP] RISC-V: Add the mising clobbers while probing vector misaligned access
Date: Wed, 16 Jul 2025 11:12:48 -0700
Message-Id: <20250716181248.43443-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_111400_847289_51D82216 
X-CRM114-Status: GOOD (  18.45  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

There was a comment left behind in
check_vector_unaligned_access_emulated() describing the need for a
clobber in the asm block we're using to probe for vector misaligned
access support.  This only mentions V0, but we should clobber whatever
that vsetvli clobbers as well.  That all likely requires poking through
the compilers and figuring out which clobbers are legal in which
configurations, so I'm sending this as a WIP for now.

I doubt it's possible to actually manifest this as a bug in practice, as
we'd need the compiler to generate some vector code in a routine that
doesn't have any business being vectorized and can't be inlined.

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
This probably can't actually manifest as a bug and it requires a bunch of
compiler version hunting, so I'm parking it for now.  If someone wants to pick
it up they're welcome to, otherwise I'll try and remeber to go dig around...
---
 arch/riscv/include/asm/vector.h      |  3 +++
 arch/riscv/kernel/traps_misaligned.c | 10 +---------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index b61786d43c20..0264d37dc839 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -40,6 +40,8 @@
 	_res;								\
 })
 
+#define CLOBBER_V0 "v0"
+
 extern unsigned long riscv_v_vsize;
 int riscv_v_setup_vsize(void);
 bool insn_is_vector(u32 insn_buf);
@@ -423,6 +425,7 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_thread_free(tsk)		do {} while (0)
 #define  riscv_v_setup_ctx_cache()		do {} while (0)
 #define riscv_v_thread_alloc(tsk)		do {} while (0)
+#define CLOBER_V0
 
 #endif /* CONFIG_RISCV_ISA_V */
 
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index f760e4fcc052..7e0f33523f0d 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -602,14 +602,6 @@ void check_vector_unaligned_access_emulated(struct work_struct *work __always_un
 	*mas_ptr = RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN;
 
 	kernel_vector_begin();
-	/*
-	 * In pre-13.0.0 versions of GCC, vector registers cannot appear in
-	 * the clobber list. This inline asm clobbers v0, but since we do not
-	 * currently build the kernel with V enabled, the v0 clobber arg is not
-	 * needed (as the compiler will not emit vector code itself). If the kernel
-	 * is changed to build with V enabled, the clobber arg will need to be
-	 * added here.
-	 */
 	__asm__ __volatile__ (
 		".balign 4\n\t"
 		".option push\n\t"
@@ -617,7 +609,7 @@ void check_vector_unaligned_access_emulated(struct work_struct *work __always_un
 		"       vsetivli zero, 1, e16, m1, ta, ma\n\t"	// Vectors of 16b
 		"       vle16.v v0, (%[ptr])\n\t"		// Load bytes
 		".option pop\n\t"
-		: : [ptr] "r" ((u8 *)&tmp_var + 1));
+		: : [ptr] "r" ((u8 *)&tmp_var + 1) : CLOBBER_V0 );
 	kernel_vector_end();
 }
 
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
