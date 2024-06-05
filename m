Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F8FC25B76
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 20:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTY/hysU8YE4BKbAkUnaI1//Cet9FDy2Jo7o5EMFeTI=; b=w2fLKJPw48qBH6
	DYNhiieQ1cZ4aih+m3uR8SNm1h8Z7MDS8bkRWGUpE/E1d73QCCS1vA7oC7Cc1pNvirR4DP7JOEYHF
	g1RhPZxwowmqWgeTX7NikqLtnULqGQSOaHGDFoq1pWtf+H2J6BFLYyC+M1Dw3pXSCRjPqfMxEeeel
	CT6iWbq0/8HmqTctjkzhrR5MLyNssqfLUd1KKxDvCsb2WMKM9oAz6LGngykNJU2aQQX1kvMsnprLz
	Zzx5h8KuYErib4yKevxvqpRKkVk9dDZohv619TgCv0WUXA1YAEctH1g+YFjE9LA1rVtGDMrwhjS3s
	W4WClKLzDs0Ku5XSW3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sExgz-00000007Wjz-2RAZ;
	Wed, 05 Jun 2024 20:57:09 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sExgv-00000007Wgx-17lv
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 20:57:06 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1f6262c0a22so9967625ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jun 2024 13:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717621023; x=1718225823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3r1mxtMIe36MczsOX0LoCkPpmMGMczt9refp0xJPcqI=;
        b=CQMox/1XVZqKFfBU1EdYdnAGWGv5ptDBz/K42WIYLpIw2q/Tid3z31S+JowVPzT3YL
         mGAVRBKeMJkiA6UFoelkFxyvp4JPFxKzfk+2f1dS6F8O4RYfoGBYexii6vquPx7pr+j7
         igJYSWKdhh+EQMkmFJDsD15CnfJwAFE1z1OyCVSyxhPR9OQJM7xVwL+fUWcmslnQs56L
         Kr8Ip+o9wIQLJ3ogvoA3JFFTkljeM7Azsdyncrg1yDEozndL59v+O3uDeDZB2LdXsVLp
         A94jQ9+lS+Qw0TbSkskxdehdHoUKqGkgY3ljWHcnxevKFTXtpkvsr95EsUnk4qoqJsZN
         HRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717621023; x=1718225823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3r1mxtMIe36MczsOX0LoCkPpmMGMczt9refp0xJPcqI=;
        b=YUjpbnxPsXQdnAYAaRcDQ8pXxBeqWSKIRnaEC4jiOEnf2jcIB3WX5SPBn+dZ3Jyep7
         9j5fn33RlnbeKWD194E3ryhppVpM23aL2vqUvT28lriBpsMmDbq9u0ZWx10NGqtCL+Ci
         nMXyYHpTQOzzRN5pFpi2pwOmOPSe80AgpoUyn4UxScJmplShtjlHaN6+I3F/CmmHwNap
         ZPpOtI9uVnMrYqTSvX4kQ8GmSb7XqZAseVQWa6QUrAJE7ANIHPe3g4mA77MIJdlsVRJN
         aDSYojz/NAFujCI2iJODbKTaQSj9GQMn85PJ82AY5a2Y9KaluDJ8+L89cdYW+M9EscVH
         zjEg==
X-Gm-Message-State: AOJu0Ywaoc7Ge310AG3hXvL4qjSQTtF2ZqYLgqsno96OGQfYV6dY+Wl7
	h3mFROd5UWdDqJpwb1W9GAxLnSyqYZ5G5zuZS4Wr95KPd5Re7kdMUua0qaHWdWgjO9sptJ6O+u9
	qmWcpcx7UOOafREf5WilJ6WXDN2uVKT2uHCW/Wm1Ab/AIYHZTKCRQWVID6b42Bz3fLotvE2SHqT
	QXx46noOdPoL47yBNv/FKFrdW1ixMdU+MyXbYofUfpMInIKqXtmB/XIKsI
X-Google-Smtp-Source: AGHT+IGYEMlz2TI2K028q2R9LiSsS1U83s3xkaZ3dDH4PwwxuERT+O3HCrcKeci9losqt5I2efFSAQ==
X-Received: by 2002:a17:902:dac9:b0:1f4:808e:9f6e with SMTP id d9443c01a7336-1f6b8ee5023mr9974405ad.21.1717621022907;
        Wed, 05 Jun 2024 13:57:02 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323dd86esm107332135ad.121.2024.06.05.13.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 13:57:02 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	linux-kernel@vger.kernel.org,
	Deepak Gupta <debug@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 2/3] riscv: Add support for per-thread envcfg CSR values
Date: Wed,  5 Jun 2024 13:56:46 -0700
Message-ID: <20240605205658.184399-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240605205658.184399-1-samuel.holland@sifive.com>
References: <20240605205658.184399-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_135705_409783_AD998C95 
X-CRM114-Status: GOOD (  16.23  )
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

Some bits in the [ms]envcfg CSR, such as the CFI state and pointer
masking mode, need to be controlled on a per-thread basis. Support this
by keeping a copy of the CSR value in struct thread_struct and writing
it during context switches. It is safe to discard the old CSR value
during the context switch because the CSR is modified only by software,
so the CSR will remain in sync with the copy in thread_struct.

Use ALTERNATIVE directly instead of riscv_has_extension_unlikely() to
minimize branchiness in the context switching code.

Since thread_struct is copied during fork(), setting the value for the
init task sets the default value for all other threads.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/processor.h | 1 +
 arch/riscv/include/asm/switch_to.h | 8 ++++++++
 arch/riscv/kernel/cpufeature.c     | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 68c3432dc6ea..0838922bd1c8 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -118,6 +118,7 @@ struct thread_struct {
 	unsigned long s[12];	/* s[0]: frame pointer */
 	struct __riscv_d_ext_state fstate;
 	unsigned long bad_cause;
+	unsigned long envcfg;
 	u32 riscv_v_flags;
 	u32 vstate_ctrl;
 	struct __riscv_v_ext_state vstate;
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 7594df37cc9f..9685cd85e57c 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -70,6 +70,13 @@ static __always_inline bool has_fpu(void) { return false; }
 #define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
+static inline void __switch_to_envcfg(struct task_struct *next)
+{
+	asm volatile (ALTERNATIVE("nop", "csrw " __stringify(CSR_ENVCFG) ", %0",
+				  0, RISCV_ISA_EXT_XLINUXENVCFG, 1)
+			:: "r" (next->thread.envcfg) : "memory");
+}
+
 extern struct task_struct *__switch_to(struct task_struct *,
 				       struct task_struct *);
 
@@ -103,6 +110,7 @@ do {							\
 		__switch_to_vector(__prev, __next);	\
 	if (switch_to_should_flush_icache(__next))	\
 		local_flush_icache_all();		\
+	__switch_to_envcfg(__next);			\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 2879e26dbcd8..1153b96346ae 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -728,7 +728,7 @@ unsigned long riscv_get_elf_hwcap(void)
 void riscv_user_isa_enable(void)
 {
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
-		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
+		current->thread.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
 		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
 }
-- 
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
