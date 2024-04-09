Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DCFCD1297
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 06:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kcf/rmBPK+aoS/CkT2umnf/a8BHtXArit/mPaffQFKI=; b=Gj4G+mXeW//9wp
	8r0jX3S+leAZuPAt0NvCP4OmkvBoUhtcvbTWT00Q3kTiEvcNzmAAv1ONDd2k236EeatGosAM3FLyL
	cjvQkVh/UyPuOuR/ycnZSrvvuRf2YXQa6og+L6AtDDitmbTTEKTDeBKghn//o9zdRdeKqPW+wneS2
	M+Do7qE4KpBlNodFdMHpYMMnnSpK60GVx0VqnfeOmJRkrGsCOb89UD1eb6BKd/ticirR+rq09ydbO
	Hayr2021B+mq2N5O1wv1CWJ9naxb03JaVYb+fKIkBLfH8tDXCIUh44rd9HHjC14lOh/pVn0GQKuHl
	z6PgRpXtxym1lbN8JfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4iu-00000000WKu-2JJD;
	Tue, 09 Apr 2024 06:12:48 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4iW-00000000Vxx-1HXz
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 06:12:29 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1e3e84a302eso16537445ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 23:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643141; x=1713247941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eyLRloSfAm4VAbw2mb0vtlUweaMWaSGQ+4ZLH4p8KE=;
        b=JorLVqcsNzz7rcf1mpSTBfPvRw8h/KatMC6zwiQvMb2zR6R8wUw11MUfSa7Znrmihs
         kQEFMMXczL4X1NDoF15M1gBIq7acMlg78aoj+u3goWqbnZ4ESzerKNcM/VCn+R4i3cGo
         nZ+r4JvG0vBdKoeIZRiTvl2VE+ArWJQsV3mdkC+5nGvzdCIBPLGoUA22lmViUaGo0WBX
         s2lskyxdZTC+QEiOaAva5uH0Hvpgm8NjWl3ps2feWCdHG73t4CUlgCWzfembtaFro8T4
         R2gLDSAp+VJDPxAxGlNtSH951TX0N5xbcpl4MQGTLSEjwwl3g9jv1Fk9ysIjjCUkLfdJ
         QgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643141; x=1713247941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5eyLRloSfAm4VAbw2mb0vtlUweaMWaSGQ+4ZLH4p8KE=;
        b=HdKUgerho4AEBeTQ56YVbpuuK9zxDr/suSEDZ22taR0CWilvGDGqA+mUDSfCsKSeW+
         ub3xLTEWchPZoahL2mMCh7+H2B1l2VAk3cDr7anvfI6jrUA3mpBMpY1OLXV+Cfas1Q7P
         FRIoJR0o6AkjmOiK2SscfNpEh75J9jZgXmMcL4ZSCfQAearooK+Jzl4SwUI+H4b1cVCg
         GX7fINpn5ExUKPBXnhLvQzRxr+Bxqj4YT80Iij8tlnkaTOb7OCFT64r/kExPFYVZjPGF
         yeM5KueHkjb/6QvowC5B42TcgxeXzm8GiSAN5VHD8xnnqwumuTZglIpuP8Eh1bF9dJG4
         3Ocg==
X-Gm-Message-State: AOJu0YwV7Kae3dd5xjimxvJ9cXZUIeSXdWeZt/1tG9ae7Cti8qKVM5Ej
	o3Ux/LRbNqazpR6UaomFJNvf3GZWTSEZGt7bw/MczaWOwUKxtLq89sv152Qbz/ID3oEsdgZfUa1
	C
X-Google-Smtp-Source: AGHT+IF/+B5dCZZ2fDAsFsANYw0fpAWmmT/lMg64J6EsXmicMtuMSgnbMt5ZcKKjDaAElTdglXn3vA==
X-Received: by 2002:a17:903:2d2:b0:1e4:1f86:88d6 with SMTP id s18-20020a17090302d200b001e41f8688d6mr5701471plk.17.1712643141573;
        Mon, 08 Apr 2024 23:12:21 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:12:21 -0700 (PDT)
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
Subject: [RFC PATCH 12/12] riscv: enable kernel shadow stack and landing pad enforcement
Date: Mon,  8 Apr 2024 23:10:43 -0700
Message-Id: <20240409061043.3269676-13-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409061043.3269676-1-debug@rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_231224_646505_4355A0E7 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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

This patch enables kernel shadow stack and landing pad enforcement by
invoking a SBI call. As of now it just issues a SBI_EXT_BASE and a hacked
up opensbi implementation sets the LPE/SSE bits in menvcfg

Eventually, we should have fwft [1] interface using which kernel should be
able to set this enforcement properly

[1] - https://lists.riscv.org/g/tech-prs/message/833

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/head.S | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index bc248c137c90..1e5bc7b2ee75 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -164,6 +164,13 @@ secondary_start_sbi:
 	call relocate_enable_mmu
 #endif
 	call .Lsetup_trap_vector
+	/*
+	 * Temp hack to get menvcfg.SSE=1 and menvcfg.LPE=1 by invoking
+	 * SBI_EXT_BASE
+	 */
+	li a6, 0
+	li a7, 0x10
+	ecall
 	scs_load_current t0
 	lui t2, 0x1
 	tail smp_callin
@@ -313,6 +320,13 @@ SYM_CODE_START(_start_kernel)
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	addi sp, sp, -PT_SIZE_ON_STACK
+	/*
+	 * Temp hack to get menvcfg.SSE=1 and menvcfg.LPE=1 by invoking
+	 * SBI_EXT_BASE
+	 */
+	li a6, 0
+	li a7, 0x10
+	ecall
 	scs_load_current t0
 
 #ifdef CONFIG_KASAN
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
