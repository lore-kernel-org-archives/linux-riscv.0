Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2496AC3ABA5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 00:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XeW8+TUrWHCGaMghs8QC67QFneRsl9EsUU2hKqKM5K8=; b=2/40xql/oy01bm
	u3INICqUVnwx6IOrCEGHQUcBjzOQdsIEnH9RYwiFiVBNadXlqpdpj5YYHPo6N42elb44U4afAQ1An
	sYueOeVF3bEvhRltGiyKsAN8d0ZpApctu1idAjMnczJj+WJfISY3tRpqx3nrtmYBcaAQ88gkAIcJI
	pxeeaBev3G6bdfQEZZpVdlLLQqvUfrta6Jm4RGxdRg1esP4SSdWu9XVjlDfnTxcf7eMiMX5W5r/jl
	qscOBfKgP2yYssRhNKemSuDjTlcfk9oRIXA08G/Vgbpzr2RlZ+/K8n77fzfiP1bW8kOv+2q0RvYSb
	LEBCsfYHl+uVIUu2dRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v8l-0000000BGz2-2ZPP;
	Wed, 30 Apr 2025 00:17:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v8k-0000000BGx9-2a7K
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Apr 2025 00:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=puoahas2OCQQdRJkSX5kN4b6Bd2MCUgo7wt+1uTIqSI=; b=SO9M6xpBxiPGTPVM/MeCSy4Fpz
	5ubTr6J6x9MdUv7uUfKRQg5u7YMJiazB4soEKlB7g82p0gG+D/O8WJ1lenghwxI06ZvbXp1y78v+6
	ZMUPe5l3BDIY1kzq1rZa+kjvjcEtqtDpwYA5zdxgYhdZrlqoFgzDX5i3i1HTcH70f/KGM4Q6rR4Ei
	U3HReac6lLeJI+MkjP2Jdbm7Lb7ToWHi0luSKD5Lp7mjknmsKEf7MAuxsC78/cTWByuDizsb0nX23
	gjY6scAfo3hc3pkUd/y7ZMU55ijq8OHZ4xXx81ceC61x83PIntyeGwug0Sgyr2e7Mb5j9XDVNAJ7D
	qgdsmVqg==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v8h-000000085Oy-2S3p
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:17:29 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-227914acd20so3536255ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972243; x=1746577043; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puoahas2OCQQdRJkSX5kN4b6Bd2MCUgo7wt+1uTIqSI=;
        b=QQvysL4YKX/zVp+ak3rquGxALDOTQo1gHK0lVflE9N4bvCnJLaSUZc2wGC0zZuAiHz
         uCvusok1Mgl0BACmtA+VaLxDK9krql69WnKWitU9pue8w7eApzd6QfI2ooxFqepjU1x0
         NWhlEmwH08DMVlo5NDOJMdLpzSXGHAWxHFE+apna8FoPjLpfhtM3wXyPGXlGrJhUnWAb
         BPRbacTQyMffI9sLw51v412HA/yU+Lqd669hjBWy2v7pTAb7J6+tSOLslqx8b/vQ2XDF
         DAPChtBa7CUdLLJPtHQKpAnkw8WsykIScQ6zDz+1jf5PAa9JuMkKD2wwJyMR2ZjsxDQC
         DjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972243; x=1746577043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puoahas2OCQQdRJkSX5kN4b6Bd2MCUgo7wt+1uTIqSI=;
        b=oUP6VSlBLSfDY2SLtwnJ2lkU4eo4PV0JcRzcrHDjcyI8ET6l7ITiYrn/cfKcIIcgQE
         tDzoLiKGP0tCNTrO/MBMDaClEVmmyD2TgDwGTC0eElf/ggl+zjGj3oKumHgV2Uzv/MDd
         m5od5x79FDmNHCaUr15dYEQbPRThCsaScLto1sO2snyDbCc5hRMkGGsYaqzcCmrBlHYX
         fQ3u5ftECDRhF89NwdxQ0AoDbao0RiN/yQXWfpSjRcqgUu1qxK/MHtAHLXMb6PMoTbLR
         dBFVmodJN6P/eLGQcxxGaMWNZfZB7p6184g34rCYnEUcv663PZ0eRoY3xr9BBmCoQMGn
         2fjA==
X-Forwarded-Encrypted: i=1; AJvYcCUewUnGcaTaSR+tgwRj1Ss2/IEDM00g82KAFEzOlN/UmoGrtApzE8EAXfkwYJz7wXJR0m8UMAbqFjDhwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywoa8tcmodvrlgtIgRxw+et7dvz/EIFtv3KI9VSaZEQ6UjJ7ro6
	UpkTlDrpP1QWkgTOuDTe+CKJE2Yb9WfBNd+61Sah+jhXIjPhk4mOnEgaO/pWZEI=
X-Gm-Gg: ASbGncs49FG5skXm6Y8XhU3dFUt2WQB+ZDUmyldHwRHGXMmm0KFpAEmofbf1+zPH7fm
	xpeDXlf7+NU8grmT9UlfMG9jaQJy9u+4/DVhRAeot958Nlkvn4Y7BzOgGFVlJnI3+DZo4yEOgys
	Cos7D2U3UPnJbe7r+aBWullFD/OrWDcUQcxyM/iSZiHnGWsCWlLi3ypJkayvP6E3DRE4VdwAlWy
	qxyd0cvr9EJWn7Y+IfZrSg/Uu0uza7EanbY4xy2k5hJj6xLrgX3pzkQs9DqxGif/jPtMxzBH9ml
	vq0goQEO4+hXjqoLg3FBFF9aOmi+OBklBGg84p6J9kNmPrP0f5w=
X-Google-Smtp-Source: AGHT+IFjstEHD8QIZfy3Vcgu0xcBZf8foHmRSjeb/erLHfisACTJBjUsL08PsHqNuutlSch24CFTEg==
X-Received: by 2002:a17:902:f70d:b0:220:fe36:650c with SMTP id d9443c01a7336-22df4815c21mr14342955ad.23.1745972243456;
        Tue, 29 Apr 2025 17:17:23 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:17:23 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:35 -0700
Subject: [PATCH v14 18/27] riscv/kernel: update __show_regs to print shadow
 stack register
MIME-Version: 1.0
Message-Id: <20250429-v5_user_cfi_series-v14-18-5239410d012a@rivosinc.com>
References: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
In-Reply-To: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_011727_785657_B5A281F8 
X-CRM114-Status: GOOD (  11.41  )
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

Updating __show_regs to print captured shadow stack pointer as well.
On tasks where shadow stack is disabled, it'll simply print 0.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 4587201dd81d..6bb53ce72ed5 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -90,8 +90,8 @@ void __show_regs(struct pt_regs *regs)
 		regs->s8, regs->s9, regs->s10);
 	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
 		regs->s11, regs->t3, regs->t4);
-	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
-		regs->t5, regs->t6);
+	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT " ssp : " REG_FMT "\n",
+		regs->t5, regs->t6, get_active_shstk(current));
 
 	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
 		regs->status, regs->badaddr, regs->cause);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
