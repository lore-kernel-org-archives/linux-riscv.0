Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E972C54E71
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 11:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MdoyvHd3mAvmJwHKQ2bnmkImNJApEBjAp5W8iGbmZFU=; b=xX+CjzUSWT5ilG
	jNekyrR7078ppSR9I+a6sIqXCMz92JCzCScO1qhbhkEGxEy0GXxznnSd0P8/o341xhGy5insZmeAO
	CaeRFRh+7hbJ71EOTiNxyJEHQGO0VVYyPbAB2sB1H5KcPryaZNtb3Z2pstTaxZC74nrcDU1LuMn3V
	MtEwUbYI3jaDWq0JHK0bfM2XM1FpnqUWZUyyMRU+hDWQvGxSSR0dtbw75y4Wpajdw0kN/sOKKsB36
	dpsDsNMAmHeXtSoVtqQdZbXWMWhz+phdFMRWqJ5mk/hFvU34O8rC1FTUex9xUhN3+pO8OHq7mHlM1
	JTJUJD6x3hpMqR9VGmvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnd2k-00000006xbc-0c17;
	Fri, 22 Mar 2024 11:26:38 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnd2g-00000006xac-3lrr
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 11:26:36 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-513cfc93f4eso2135120e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 04:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711106792; x=1711711592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XNHkQfXINaqTHPg7WbnoP37edMIj0CzWXuWpl1CeMi4=;
        b=0gEeXpz459nrLjVkwcnGJ8d0yh7gs5qZfqyRzm1eWbLFRRDEIpQP+nHEGqE5o3qvxC
         4wbRvMFKqPlZxk7C/IgHhA0fC0124TgjU0GRqghq2lFZjOetjgYZ5t4wO9kIS0DDY3Rn
         bqY+3PR/0ORI/8Fcvt8B7HdbbsZrH2qJoFUIVSE9AbCXuTntW1yic57n5ieUSvbH/4Dw
         VdtHJAvCjorhDktWsM26AeG3STXSsJpXeRvxoCzc/ER4KXJwiL5HFK7Fvib2WneELDvB
         HuG+oTjuSHfmnYg+3SQmDOonZGg8Ot6ju/rA336HccaM+9iCL8PVFEhqlW22tO95zWwa
         W1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711106792; x=1711711592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNHkQfXINaqTHPg7WbnoP37edMIj0CzWXuWpl1CeMi4=;
        b=Ijs7d4ws5w8hS/AD+RIdeNhd7K0z4EHs5htNC0Sg16yaEXPMAcBka6pDohhCeNNJiO
         /+Skj/8tmSctlTisy1QnlN1v0Op5p9IenCGyYSSBSaE267Y0enrwYxvUYzlkhVj0lHbO
         kXEghste/o+YvL0RNiPD+oWWV5ParYrYFqnCMpD9xbxrlA15qxaoBqR2gOohg5KV4p3e
         YQz2RQ3mSBWGa3yRKUpNi8EuStqsfpR8O9+AQJ1y59ZXZ6WefuClM6/I8cUYJRDsoUzl
         FD51bYIxRV8pBMkmko5drtR/8cI7SW069JAN5RJVKBoPc7Qa7zzeQ5+PE77V0QOWjMJ2
         ngUw==
X-Forwarded-Encrypted: i=1; AJvYcCV/T2DEeEbgZKMlm2bk+fJhH8Pcr0q83x30Zh08KF69YWzgd4uYXGYfZicNGk6JDzk8lMIL3EvCwY/4SV2e5l0imCaDxdGpXLQ8FH02wURS
X-Gm-Message-State: AOJu0Yz8v6jk5LvNasQZYS6m/cgc+Q2IwWcX8IwgyFXwAqH2OqKMbePq
	+thkI03GG9VSO6o7dnFjj3LMyZCrx/og9WmNgRM1As8G8VrzN0qjZ4vTGMZ90C0=
X-Google-Smtp-Source: AGHT+IEGMU4YT59y0B8pwbmoCMSuhVbnY4eGqGuqjNiZTutlx+9D16LHoVml25LKrooAH5BVoBianA==
X-Received: by 2002:a19:6910:0:b0:513:2992:bd92 with SMTP id e16-20020a196910000000b005132992bd92mr1311861lfc.11.1711106791828;
        Fri, 22 Mar 2024 04:26:31 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id q12-20020a19430c000000b00513d82a8003sm317965lfa.160.2024.03.22.04.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 04:26:31 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Improve sbi_ecall() code generation by reordering arguments
Date: Fri, 22 Mar 2024 12:26:29 +0100
Message-Id: <20240322112629.68170-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_042635_091690_90BDB271 
X-CRM114-Status: GOOD (  11.42  )
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

The sbi_ecall() function arguments are not in the same order as the
ecall arguments, so we end up re-ordering the registers before the
ecall which is useless and costly.

So simply reorder the arguments in the same way as expected by ecall.
Instead of reordering directly the arguments of sbi_ecall(), use a proxy
macro since the current ordering is more natural.

Before:

Dump of assembler code for function sbi_ecall:
   0xffffffff800085e0 <+0>: add sp,sp,-32
   0xffffffff800085e2 <+2>: sd s0,24(sp)
   0xffffffff800085e4 <+4>: mv t1,a0
   0xffffffff800085e6 <+6>: add s0,sp,32
   0xffffffff800085e8 <+8>: mv t3,a1
   0xffffffff800085ea <+10>: mv a0,a2
   0xffffffff800085ec <+12>: mv a1,a3
   0xffffffff800085ee <+14>: mv a2,a4
   0xffffffff800085f0 <+16>: mv a3,a5
   0xffffffff800085f2 <+18>: mv a4,a6
   0xffffffff800085f4 <+20>: mv a5,a7
   0xffffffff800085f6 <+22>: mv a6,t3
   0xffffffff800085f8 <+24>: mv a7,t1
   0xffffffff800085fa <+26>: ecall
   0xffffffff800085fe <+30>: ld s0,24(sp)
   0xffffffff80008600 <+32>: add sp,sp,32
   0xffffffff80008602 <+34>: ret

After:

Dump of assembler code for function __sbi_ecall:
   0xffffffff8000b6b2 <+0>:	add	sp,sp,-32
   0xffffffff8000b6b4 <+2>:	sd	s0,24(sp)
   0xffffffff8000b6b6 <+4>:	add	s0,sp,32
   0xffffffff8000b6b8 <+6>:	ecall
   0xffffffff8000b6bc <+10>:	ld	s0,24(sp)
   0xffffffff8000b6be <+12>:	add	sp,sp,32
   0xffffffff8000b6c0 <+14>:	ret

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 10 ++++++----
 arch/riscv/kernel/sbi.c      | 10 +++++-----
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 6e68f8dff76b..9041b009d3b5 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -292,10 +292,12 @@ struct sbiret {
 };
 
 void sbi_init(void);
-struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
-			unsigned long arg1, unsigned long arg2,
-			unsigned long arg3, unsigned long arg4,
-			unsigned long arg5);
+struct sbiret __sbi_ecall(unsigned long arg0, unsigned long arg1,
+			  unsigned long arg2, unsigned long arg3,
+			  unsigned long arg4, unsigned long arg5,
+			  int fid, int ext);
+#define sbi_ecall(e, f, a0, a1, a2, a3, a4, a5)	\
+		__sbi_ecall(a0, a1, a2, a3, a4, a5, f, e)
 
 #ifdef CONFIG_RISCV_SBI_V01
 void sbi_console_putchar(int ch);
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index e66e0999a800..5719fa03c3d1 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -24,10 +24,10 @@ static int (*__sbi_rfence)(int fid, const struct cpumask *cpu_mask,
 			   unsigned long start, unsigned long size,
 			   unsigned long arg4, unsigned long arg5) __ro_after_init;
 
-struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
-			unsigned long arg1, unsigned long arg2,
-			unsigned long arg3, unsigned long arg4,
-			unsigned long arg5)
+struct sbiret __sbi_ecall(unsigned long arg0, unsigned long arg1,
+			  unsigned long arg2, unsigned long arg3,
+			  unsigned long arg4, unsigned long arg5,
+			  int fid, int ext)
 {
 	struct sbiret ret;
 
@@ -48,7 +48,7 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 
 	return ret;
 }
-EXPORT_SYMBOL(sbi_ecall);
+EXPORT_SYMBOL(__sbi_ecall);
 
 int sbi_err_map_linux_errno(int err)
 {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
