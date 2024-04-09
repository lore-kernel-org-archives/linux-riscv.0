Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78166CD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 06:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N0nLtLNMvYXtDyBQWYRHQ1RbI2RruYX8Qijn9ctigSQ=; b=PRTVSdKj2L3K2e
	u9rLL+BUnI4zsE3JwQH5haxw1N+CcvEikOWKfDZ0zep5aOhtSrmm5Td4L4+fMzzuTugPpkpW7EACp
	7kbesmQvU9dVwOT71k30ImLuhOVAZD4u48b7k8TB9jZJHlRVWxPRTuiNdpnS0pnIhh1FBu3BsR+xn
	ErUF1lrYtBhoIgO955VO1TmRfKyqIw9kw3pbqo9k+86DuT+Djx8jg64xXTBvIPlFoPYwEBm3BXkhx
	Fi5J/kmvj2pLZUr8g7f66zrNdA5Rl0u+7kOqmhyEh5jL5dduH4XNpgeb/rjuS0QuA/31wODCiBwHB
	Toy74nUyLfbHXN/ZLJSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4jC-00000000WYZ-1ZN1;
	Tue, 09 Apr 2024 06:13:06 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4iV-00000000Vv0-3xxj
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 06:12:28 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5e152c757a5so3254496a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 23:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643137; x=1713247937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Dd+qicqNqOTXPUN+vfB0pN9kY+D/OYBSctt1TBOZeY=;
        b=amie0gc4085Dej45Q/7xoj+YE6Zdb9K3HkWMg3834kVZqrwzmPEC6hqrMAozZrxWU9
         n6Rx2xjbOFImBt0/VtQtA49sQ1zDSJ69ZBtYVEUz0FDni7M4lg83WGjDtKGplmEpFQLt
         KNg5SnKuFn3VG8GFSeEKbYFKT5rYF5kznJFJFoxbD8f2lQGBM2vhMvYs8DvakATL+RAo
         xzoUCT5ZsXl+Dn1RVq2mlj8YnK2/79r5IaKhNgA1dyhv4Xr+oYPImhmuzdD7hay8Diaw
         XksRPphgX9KU6UsOLsm6NXsKdXept/2kx2omTsNSCiJkxeLlc2EmYVUMcv94W4wk99L5
         zavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643137; x=1713247937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Dd+qicqNqOTXPUN+vfB0pN9kY+D/OYBSctt1TBOZeY=;
        b=Q9MyRmRjo+p+Ldphcsvx5+j6dyy+5KYKuNapnw0kCZf5b3RjPVNKNWuF3liC3cd778
         7IBElp9RQdoTrhd6tIKfKFmNGuqwR+QLpvzHfd7GsgkqvbiZQ7Ktis2uKyBmBh+MFT5n
         nju3UAHusArRFszt8Jab4F5HSgXSKOCavYGyMvoJoSvFG/h+tXhAkLCTgtxkRNsdCJ2E
         iJHndwlhlOm5aIwVg12RyAHWXqlmkkKOH5pAA9H++HxkKLuNyu+L0O4Bgb4qRDudu4cI
         uqZu/Ij78jSoqI9aNGjrgKUAQX+IbJLWcyAesTsnzytd/hGRzmxsKFEG/HR/gePClnry
         bPwg==
X-Gm-Message-State: AOJu0YzXvBqy2ZJnezNIlst60QES6MILvvMZE3QBMLnX0GHKG4tQfQTn
	JSdWADB3UaBSfjgxxWE8eUss4jHYlKADwV1aQil4gcZ7isjMvZpnuTWQs35zPihA7fAJSpSW9Hn
	a
X-Google-Smtp-Source: AGHT+IGcPqN2fScaedBq3ewRagrgaPjfyc3cvTGWCEiCpjBURAFRRAm2I2dL0qDPjIDkD3S3Bq2SLQ==
X-Received: by 2002:a05:6a20:de15:b0:1a3:e2ed:62af with SMTP id kz21-20020a056a20de1500b001a3e2ed62afmr8155980pzb.34.1712643137498;
        Mon, 08 Apr 2024 23:12:17 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:12:17 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	andy.chiu@sifive.com,
	debug@rivosinc.com,
	hankuan.chen@sifive.com,
	guoren@kernel.org,
	greentime.hu@sifive.com,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	apatel@ventanamicro.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	waylingii@gmail.com,
	sameo@rivosinc.com,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	shikemeng@huaweicloud.com,
	rppt@kernel.org,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	willy@infradead.org,
	jszhang@kernel.org,
	leobras@redhat.com,
	songshuaishuai@tinylab.org,
	haxel@fzi.de,
	samuel.holland@sifive.com,
	namcaov@gmail.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	falcon@tinylab.org,
	viro@zeniv.linux.org.uk,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	hca@linux.ibm.com,
	arnd@arndb.de,
	kent.overstreet@linux.dev,
	boqun.feng@gmail.com,
	oleg@redhat.com,
	paulmck@kernel.org,
	broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: [RFC PATCH 10/12] riscv/traps: Introduce software check exception
Date: Mon,  8 Apr 2024 23:10:41 -0700
Message-Id: <20240409061043.3269676-11-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409061043.3269676-1-debug@rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_231224_423818_F1577F13 
X-CRM114-Status: GOOD (  12.65  )
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

zicfiss / zicfilp introduces a new exception to priv isa `software check
exception` with cause code = 18. This patch implements software check
exception.

If sw check exception was triggered while in usermode, unknown trap is
triggered for usermode. If sw check exception was triggered for kernel
mode, kernel dies.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  1 +
 arch/riscv/kernel/entry.S               |  3 +++
 arch/riscv/kernel/traps.c               | 20 ++++++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index cd627ec289f1..5a27cefd7805 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -51,6 +51,7 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_u);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
 DECLARE_DO_ERROR_INFO(do_trap_break);
+DECLARE_DO_ERROR_INFO(do_trap_software_check);
 
 asmlinkage void handle_bad_stack(struct pt_regs *regs);
 asmlinkage void do_page_fault(struct pt_regs *regs);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 0262b46ab064..89aeae803702 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -353,6 +353,9 @@ SYM_DATA_START_LOCAL(excp_vect_table)
 	RISCV_PTR do_page_fault   /* load page fault */
 	RISCV_PTR do_trap_unknown
 	RISCV_PTR do_page_fault   /* store page fault */
+	RISCV_PTR do_trap_unknown /* cause=16 */
+	RISCV_PTR do_trap_unknown /* cause=17 */
+	RISCV_PTR do_trap_software_check /* cause=18 is sw check exception */
 SYM_DATA_END_LABEL(excp_vect_table, SYM_L_LOCAL, excp_vect_table_end)
 
 #ifndef CONFIG_MMU
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 05a16b1f0aee..b464355f62b2 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -354,6 +354,26 @@ void do_trap_ecall_u(struct pt_regs *regs)
 
 }
 
+/*
+ * software check exception is defined with risc-v cfi spec. Software check
+ * exception is raised when:-
+ * a) An indirect branch doesn't land on 4 byte aligned PC or `lpad`
+ *    instruction or `label` value programmed in `lpad` instr doesn't
+ *    match with value setup in `x7`. reported code in `xtval` is 2.
+ * b) `sspopchk` instruction finds a mismatch between top of shadow stack (ssp)
+ *    and x1/x5. reported code in `xtval` is 3.
+ */
+asmlinkage __visible __trap_section void do_trap_software_check(struct pt_regs *regs)
+{
+	if (user_mode(regs)) {
+		/* deliver unknown trap to usermode */
+		do_trap_unknown(regs);
+	} else {
+		/* sw check exception coming from kernel is a bug in kernel, die */
+		die(regs, "Kernel BUG");
+	}
+}
+
 #ifdef CONFIG_MMU
 asmlinkage __visible noinstr void do_page_fault(struct pt_regs *regs)
 {
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
