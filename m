Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5949C83F26
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 23:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tKb5O0skEb+glQub7UcVZ1FbspFwpiZt7zm9ofb4xvw=; b=zY5pnWqU9rvRm/
	qSniFsrA9kUI5hteGcWtxApzHYx/1y7AjHCL26tGZSPcleBgclr6SEi0zkGxxHCB9L5ZEh5k9QodZ
	YUk8dv/5pu2BDvu3NOZe3yWZfwyLZ6723eKbxJOQjTiJn110XqY09/15chQok950X25WnixNojNeG
	2vEKxWxVRtLVWHj2rnQEBnWsExXmriXDENpaVSrHwAU7798cv5OMrXH6GYHe+GOyYuK/uy60rU4Ia
	I2SZ7aOF/jZKd3BZXTE7L1f+XW9OLN03E5TXTyc+/eJXmTDLQ1W2pPcNcVOphnSfwGBgcaGN8u8Pi
	0qKdQlb0Ol28JvDXCiwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5f2-00000008iAS-1yHJ;
	Thu, 24 Jul 2025 23:47:40 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5Uq-00000008gxm-02go
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 23:37:09 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2350fc2591dso19146115ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 16:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400227; x=1754005027; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krQk4P3pfTRPUT5p9FwZ7J0ulZx2x20Cletpatu8lvU=;
        b=YN1S9Ycyt0vhb5/8XNuI5c3FE0OmubjGRsv+5KHzznunjJkocg3FCxvxK2LlT4l+Cb
         W29vJiAswrBzLNxG2Jf9D//9EohNpyudKTLW+FQmzNKnXSrhJ0k/cdQ6rY6Cb5L4n5xo
         XvrhcCL6K87Qd8ducFtiaPYURwoXXr8KS1eHWPE8b86sQfliNlTEVbICJLi0VQ2rv+8u
         AGiofopvnvx189fE20N2VRSfKV1Mh6ODer0YB1KvJBGlNArXbtimgzayZ1wDvSF8Zbzj
         jwA2Vi9eNiXIchH81eAknZd1hoC5pg25IGYimIFHQDgOj3akJaPBp7+Mn3hz7JAANHwM
         zc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400227; x=1754005027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krQk4P3pfTRPUT5p9FwZ7J0ulZx2x20Cletpatu8lvU=;
        b=IZaS8gqs1gXk7SE0Q4pPgZ/k2A/STNm+/THf/Nd9PtyDDQwSqBjKkI7D/Y/hG3jYOp
         AXWnccvJim96XA4s9lx+yPG+PfETVnw454olvTL485/Mct3xZoJtqPt83i09nTz+f5uD
         3rthrTXpkG8y/CvrigvbDY9dKY/2YcgBkDHfgztGKo8z53VFctYpt+RlZtoH3u+xUZLK
         sx10KSOxAkddjaAgoScCetUWRqM0qICsy2c49udM2yBNBpkYc3L9XvU2M6rpCruehmoY
         rO0BFltLG+M5v8Rvzwp5FLOlXdoCGg094q51HNxsGRAl3Pj/y9F1326VN+wdwYhzoTvd
         4Q7w==
X-Gm-Message-State: AOJu0YxudlyU8oB0c3LcjzjpbC6ju1x/sVaJnOfXnNh6hTnWiO7BjkMX
	Vy7LdzIiUSkTFBmbiyKtvU0m4AeBB1XPEl62lf7/U7yLKy1oU7vP0UrqTmRFbrdlwck=
X-Gm-Gg: ASbGncvfWahH0+3qbb+8xD6PMbgLUM/zn1kQ+CKhAYLwNfgBc3b3J9DHV1nnddZVPI5
	C56aGwlVg+0A8m15uFZ7s/S3KhziJzFdnHRzha8X5cTtplV3tVu5bFV9lvB4Qt9avC0dkqZhO0p
	mmGQegtYS3qKfU8FYjJ7Ve5yhSgTPPL1iCszPiyAYVPDIG76QFnG91NFY7xHrOrcfFn9ajNyWOX
	b+siOAnVsAp8O31QmIJpiWhg2N0sDnV+pKLXSs22hVvKe2YREMzDfH21PsLarHyohz8bqgwQR/z
	igpGLDfUyEbA6Sr7/iXaw+OCJS8NVS+oe0n4JtkaSvHblO8rIKmoD6PJPj6XlnuvEW6kkVRJgfI
	sT35esiJNV3Fa6FlZE/Q8563KDMgxvTEb
X-Google-Smtp-Source: AGHT+IHqqHjkrV1Y0AgUE/7okEjKgN0Xu4SqOAlTzo93EMsg5xWeC1nRyl3GBDs9U3ql1blBgoSqFg==
X-Received: by 2002:a17:902:ebc5:b0:23f:a1b5:e537 with SMTP id d9443c01a7336-23fa5ce4bf8mr55592815ad.3.1753400227208;
        Thu, 24 Jul 2025 16:37:07 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:06 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:36:54 -0700
Subject: [PATCH 01/11] riscv: add landing pad for asm routines.
MIME-Version: 1.0
Message-Id: <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com, 
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com, 
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com, 
 heinrich.schuchardt@canonical.com, andrew@sifive.com, ved@rivosinc.com, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_163708_053315_6E22BDA5 
X-CRM114-Status: GOOD (  10.98  )
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

SYM_* macros are used to define assembly routines. In this patch series,
re-define those macros in risc-v arch specific include file to include
a landing pad instruction at the beginning. This is done only when the
compiler flag for landing pad is enabled (i.e. __riscv_zicfilp).

TODO: Update `lpad 0` with `lpad %lpad_hash(name)` after toolchain
support.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/linkage.h | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/riscv/include/asm/linkage.h b/arch/riscv/include/asm/linkage.h
index 9e88ba23cd2b..162774b81158 100644
--- a/arch/riscv/include/asm/linkage.h
+++ b/arch/riscv/include/asm/linkage.h
@@ -6,7 +6,49 @@
 #ifndef _ASM_RISCV_LINKAGE_H
 #define _ASM_RISCV_LINKAGE_H
 
+#ifdef __ASSEMBLY__
+#include <asm/assembler.h>
+#endif
+
 #define __ALIGN		.balign 4
 #define __ALIGN_STR	".balign 4"
 
+#ifdef __riscv_zicfilp
+/*
+ * A landing pad instruction is needed at start of asm routines
+ * re-define macros for asm routines to have a landing pad at
+ * the beginning of function. Currently use label value of 0x1.
+ * Eventually, label should be calculated as a hash over function
+ * signature.
+ */
+#define SYM_FUNC_START(name)				\
+	SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
+	lpad 0;
+
+#define SYM_FUNC_START_NOALIGN(name)			\
+	SYM_START(name, SYM_L_GLOBAL, SYM_A_NONE)	\
+	lpad 0;
+
+#define SYM_FUNC_START_LOCAL(name)			\
+	SYM_START(name, SYM_L_LOCAL, SYM_A_ALIGN)	\
+	lpad 0;
+
+#define SYM_FUNC_START_LOCAL_NOALIGN(name)		\
+	SYM_START(name, SYM_L_LOCAL, SYM_A_NONE)	\
+	lpad 0;
+
+#define SYM_FUNC_START_WEAK(name)			\
+	SYM_START(name, SYM_L_WEAK, SYM_A_ALIGN)	\
+	lpad 0;
+
+#define SYM_FUNC_START_WEAK_NOALIGN(name)		\
+	SYM_START(name, SYM_L_WEAK, SYM_A_NONE)		\
+	lpad 0;
+
+#define SYM_TYPED_FUNC_START(name)				\
+	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
+	lpad 0;
+
+#endif
+
 #endif /* _ASM_RISCV_LINKAGE_H */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
