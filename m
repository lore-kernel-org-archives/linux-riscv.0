Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05910C47DDF
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 06:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/ey7cuX1xPNq0PNNF2BdjaNPXCqoRyR1ecS7Y/f+zM=; b=ZdN/70DFu9Sxkn
	i7mlIuHHuhaphVCWM3xc7xMgsaAnVaGio9SXGXzophMLH56ye0yy+jh1qnfSSuv+n0eBzTPL4aUu8
	Q/aDU8qzPfE0/ZOh0TylrmiSOPeIF4Ix4gzbhcBxLBTCk7Ufa1bBpoBe+056beqMAsrvXWnU3pLlq
	DHh9DhwEFU1yBDpmsXlqDCnuCs3d6uJzo1aYu9dxGnOwoANsaGniLn281b+iSJRqFugTeSTjnBk/X
	TDOLt/i6NH90wmDwfKsRH0wU/X9Ub/hVKcvEL8AJk9Z+zlsiXOycBqYmcQs/PHk56tePYq/YfdV8R
	zuWRKeQTH+O7EurOfMqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rStDq-006kMs-1r;
	Thu, 25 Jan 2024 06:28:22 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rStDl-006kHZ-3A
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:28:20 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-595ac2b6c59so3881956eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706164095; x=1706768895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3e2cTh56cG2GGWTE4NSzcFXiqv/NB8pwrDQ1nq4c+Tw=;
        b=1pjMPdOX7pkbFkg6aUxkjZO8ZKWWs0Ev6v6bYGAMX4xV69qj25p+JKR58aEKtze88B
         tuLB/nE75Ly0d7QSv83Fe0RuzbjAAHEphxsFkpOwizlRFuCcV5JQo+ZPbxnZH8BHCON3
         sQyHHQgFiMK6v/P4B5/9K1YgvH+NQFeq53YJqXVPG8ZiJcI57jWo146xxwyFxaW1aEsY
         GLYFTe2GQgs4pP9fk7dKAyE68HNmWcfDEoTfLQXlXd+4c3xWAIqIZHOUDHVne1lzQXag
         +R/MQ+fpecsN/0EjJ4zSSjYEYa8oGdss6hBJ7rNU4WneSpjo43Rm4poGonm6hZWI2Xz4
         0mNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164095; x=1706768895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3e2cTh56cG2GGWTE4NSzcFXiqv/NB8pwrDQ1nq4c+Tw=;
        b=U/s11zlImf1pSX4s7nC8DG3a0GdGnR8GH+x6drI95ewxJr84FsnaXMYIOjYQRUOs2o
         Oz6Yd+Asjou2eG6BLAAhYloxeF3jH4ThYPgi6KZz/WzIYygm7g5y9V7xySyN+afyHEI2
         21RIj9dVoaWMonFvZDKGTkLvx8aPv6ZozTSCLhXX7HL5MI4wKecp9gPj688c7/Fwp59B
         Ar6Q/97j729jOxN0ojfhBQi56DHr16hBGCvFIvecsMueI7yNN1L2oKvJyvJXtbLjJYI3
         qXcAgg5+f3FvYNqgKkhP+4OU9WGtsEFC9C6ek3beVf5L6Wymr4zl4bQveIejEV7w4Qw2
         H6xQ==
X-Gm-Message-State: AOJu0Yy6V87D4wpx+Oaj9GOyC9tfz9eZXJFLs32caFIIabyEUfFKc/PE
	FrUPFsm6efmESgSsJ2AopKxtlLGgL0KvezgX49wCAcm4+M3SdVTTaHiu7LZ1TZg=
X-Google-Smtp-Source: AGHT+IHCIEsJoIeVNjGK2Jx0Div0w47akcVOGWIMmQ12q7OuC1Yo4rjhD3STlwvv6dFXihLIPTns6w==
X-Received: by 2002:a05:6358:8404:b0:176:5d11:3071 with SMTP id b4-20020a056358840400b001765d113071mr519801rwk.12.1706164095683;
        Wed, 24 Jan 2024 22:28:15 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a00139300b006dd870b51b8sm3201139pfg.126.2024.01.24.22.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:28:15 -0800 (PST)
From: debug@rivosinc.com
To: rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com
Cc: corbet@lwn.net,
	aou@eecs.berkeley.edu,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	waylingii@gmail.com,
	greentime.hu@sifive.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	shikemeng@huaweicloud.com,
	david@redhat.com,
	charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn,
	willy@infradead.org,
	vincent.chen@sifive.com,
	andy.chiu@sifive.com,
	gerg@kernel.org,
	jeeheng.sia@starfivetech.com,
	mason.huo@starfivetech.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	ruscur@russell.cc,
	bgray@linux.ibm.com,
	alx@kernel.org,
	baruch@tkos.co.il,
	zhangqing@loongson.cn,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	joey.gouly@arm.com,
	shr@devkernel.io,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH v1 01/28] riscv: abstract envcfg CSR
Date: Wed, 24 Jan 2024 22:21:26 -0800
Message-ID: <20240125062739.1339782-2-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125062739.1339782-1-debug@rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_222818_030758_34C51B64 
X-CRM114-Status: GOOD (  10.67  )
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

From: Deepak Gupta <debug@rivosinc.com>

This patch abstracts envcfg CSR in kernel (as is done for other homonyn
CSRs). CSR_ENVCFG is used as alias for CSR_SENVCFG or CSR_MENVCFG depending
on how kernel is compiled.

Additionally it changes CBZE enabling to start using CSR_ENVCFG instead of
CSR_SENVCFG.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/csr.h   | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 306a19a5509c..b3400517b0a9 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -415,6 +415,7 @@
 # define CSR_STATUS	CSR_MSTATUS
 # define CSR_IE		CSR_MIE
 # define CSR_TVEC	CSR_MTVEC
+# define CSR_ENVCFG CSR_MENVCFG
 # define CSR_SCRATCH	CSR_MSCRATCH
 # define CSR_EPC	CSR_MEPC
 # define CSR_CAUSE	CSR_MCAUSE
@@ -439,6 +440,7 @@
 # define CSR_STATUS	CSR_SSTATUS
 # define CSR_IE		CSR_SIE
 # define CSR_TVEC	CSR_STVEC
+# define CSR_ENVCFG CSR_SENVCFG
 # define CSR_SCRATCH	CSR_SSCRATCH
 # define CSR_EPC	CSR_SEPC
 # define CSR_CAUSE	CSR_SCAUSE
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b3785ffc1570..98623393fd1f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -725,7 +725,7 @@ arch_initcall(check_unaligned_access_all_cpus);
 void riscv_user_isa_enable(void)
 {
 	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
-		csr_set(CSR_SENVCFG, ENVCFG_CBZE);
+		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
