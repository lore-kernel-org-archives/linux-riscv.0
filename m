Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB52C47DDF
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 06:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpksWeWmidaU7oTWcKjHGFYhLRbs1g7F1ZGemXHxIms=; b=kUtjFQ+74/h1T+
	onSFHV0i5GACV15+r3nf2i/sELQMi5boUrLBEKe5VWr8IsLk/n3U+eZkWekm+R8BZ0PSjMdRHRked
	LdF4kOVj7OK/Shs1TpyrxQeWvwcJQw4AaFiMZ3EZtJ2ux2htbdlChSafKpWZ26dreb6k3M31zyLCX
	HMAa3vPuRLS2K4SNWdEy+LzvSMnGd7lH1riYjNeln0xnD0JLPagSdazITfy6C2oB220elpQ6mYpWn
	RYb7KEyVNeAG/MBRBAv7FaVmsrEYlFb6RTt340GTa95EIJRzSveGjODY7z5/jn/ikk9CbMO3LOwu7
	RC61WC6spPXZ8odONnPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rStFv-006m3o-2w;
	Thu, 25 Jan 2024 06:30:31 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rStFp-006lwz-38
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:30:27 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6db599d5cb8so5184012b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706164225; x=1706769025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6BBG9hVElQCtGiSKaNMQBT766TrVfR9hP9RPboZviE=;
        b=NAQ7hZ+3vEBtmnHkFsLg01HoyHtJOhlcZZ6kU/8ssWZH6qTPmuQmt9z0P7+15Sp8O1
         lBC+En90Fv7a+VAvN7q9mdS7Iid08Jt3dmRdNPuy/VQT1WJIHWpFa2+zLfPDkzZJzb8m
         3KoN1M5YZ/AQzRN3IpBpX5AxeTaQn//bs03CLlB45vO0f4F94IQnY3AQu54wO650bXcO
         9K6DY7OnoP/Hh4OFFknpzmaFZLhKSRa80KwHiq84wSlRH11tlQHIhvmjpCm6oSMAIbZN
         PFObIjQ6XHxSNGjcnBkwnKAYNbMfGzlAulJrPdw/DuoCybnuqD/0yWcAVFytMhPxyfnd
         0PRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164225; x=1706769025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6BBG9hVElQCtGiSKaNMQBT766TrVfR9hP9RPboZviE=;
        b=Fzvr2Q+T3gtn52F66x1dTX8LfKtmbUULAL5wu1xGSq+MYSibKOCBJkwvHjxfNBwuBQ
         Rz8PmvXO+OH9dvzXPC0O2HstDeRu6iCAVlOUG0cQOEYrdmQPCSNNUSgX5MKzn1uI635q
         50/cDKff+Gg/UK3Nk4ZStQG3XjEDF1LsCPEkhmR9cOfNOiYbjgVV2GPYxn8spHg51/+y
         kzydP6Wzdl83NXJ6lH8e1mSmP3isOwnmC83VESZeCWRzYBxnLoth2CB78snUw1t7juHi
         ucOrueCzP5cVEM6lZqqHrv297gZalL+2ze8/H4JzSCFWt+lKygpoLbZpOO79sK7EjgiJ
         OXtQ==
X-Gm-Message-State: AOJu0YxXJuNSGyI+wLD4NYTXzlLp8TvySRyz+y8CW6OkyCvY/vYwbtA7
	H0dkHfgAeucgjnuYsappVa5dWsFozFckrnuTMHGR6WSmYaSl+XuyzuVMxqBNUlw=
X-Google-Smtp-Source: AGHT+IGPdTEWV7DVpyBSBSm0VXEKez0sh3BLdrU06vyzOddQ2bIPsNpxM7VseJi4GIrXrQhafpjvgg==
X-Received: by 2002:aa7:88c5:0:b0:6d9:9afd:82f9 with SMTP id k5-20020aa788c5000000b006d99afd82f9mr284323pff.51.1706164225355;
        Wed, 24 Jan 2024 22:30:25 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a00139300b006dd870b51b8sm3201139pfg.126.2024.01.24.22.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:30:25 -0800 (PST)
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
Subject: [RFC PATCH v1 24/28] riscv: select config for shadow stack and landing pad instr support
Date: Wed, 24 Jan 2024 22:21:49 -0800
Message-ID: <20240125062739.1339782-25-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125062739.1339782-1-debug@rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_223026_083348_2A957FB6 
X-CRM114-Status: UNSURE (   8.02  )
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

From: Deepak Gupta <debug@rivosinc.com>

This patch selects config shadow stack support and landing pad instr
support. Shadow stack support and landing instr support is hidden behind
`CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wires up path
to enumerate CPU support and if cpu support exists, kernel will support
cpu assisted user mode cfi.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 9d386e9edc45..437b2f9abf3e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -163,6 +163,7 @@ config RISCV
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
+	select RISCV_USER_CFI
 	select UACCESS_MEMCPY if !MMU
 	select ZONE_DMA32 if 64BIT
 
@@ -182,6 +183,20 @@ config HAVE_SHADOW_CALL_STACK
 	# https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e6eeb51f0cb7b8819e50da6d2444d769
 	depends on $(ld-option,--no-relax-gp)
 
+config RISCV_USER_CFI
+	bool "riscv userspace control flow integrity"
+	help
+	  Provides CPU assisted control flow integrity to userspace tasks.
+	  Control flow integrity is provided by implementing shadow stack for
+	  backward edge and indirect branch tracking for forward edge in program.
+	  Shadow stack protection is a hardware feature that detects function
+	  return address corruption. This helps mitigate ROP attacks.
+	  Indirect branch tracking enforces that all indirect branches must land
+	  on a landing pad instruction else CPU will fault. This mitigates against
+	  JOP / COP attacks. Applications must be enabled to use it, and old user-
+	  space does not get protection "for free".
+	  default y
+
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
 	default 8
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
