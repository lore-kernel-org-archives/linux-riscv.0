Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99875CD1283
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 04:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=THjR/LJjISutHhS4+DLfg22JfMLz88JAGz3sVNZHPk8=; b=E2bTkqtVxN13p4
	nL8IOIjLbkpsdkNzFQoBVqbC6k5KHUDfr9PHasm5MTvaWSrbE89BTXji+XvYFnrOm1j4LPbkliO1C
	DhcY7i+obvcByIr9Axr3giHmLj4QMGUFlpxXBg1/TV3Bjx7lAik/qGz3Lw9SE6OSE2LNTsw3qZGeF
	d1l5aHFc98LsArwNPIvg9rRr/zpgMzfGOHs6W+cT9Ss106tnNZGys9zWixd8CovwHphZznKBbdfZb
	vm/HJC2Rl4qOepLqMXh3RYUw7lDC2NqlTx/M2M9f2gZE3hhvlVa2NGX2NVRNcfmh2/NMusPv8rukF
	CeA5I/tQupkFQIY7tA3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq49e-0000000GoV1-2Isf;
	Fri, 29 Mar 2024 04:47:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48y-0000000GnzZ-1uAO
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 04:47:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hGZuEOPDrPSpE9XmexYpP1TU1T3x9oK+sun0qc4e7DM=; b=QBcNI7LCPY9rgpP8GjhgSGL1Pq
	jBPUYMpklT4Ak8593Sg+WwJMdqMvcWP1a11oE/sed+77sz++bv/w1guwiB27Pbq8gqt7gGviKqUIX
	8dEGrUJgDQ8k2XdysmrlbhwGc0q05hQgB+/q6SQhND0GqOVPRX8dxHcjRVSMxsWK18UYTmjtqn66V
	I+p37B7L/Zzfg4g/NO/L18BDrWS03v302BwvabqDO1jMOhH6CNoaeMRtyeNIQ4f6+LXgKHvnDFPE7
	Eb+RwxoK5d965TPioy5Jc+dCSiZTVbe6tjvQ4kfABTZouhB7mvvrsKZ653Wc8FVtyXk2hw6mI9Yf+
	/yGrPvUQ==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48t-00000001MdW-3wlZ
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 04:47:05 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6e6ca2ac094so1581618b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687622; x=1712292422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGZuEOPDrPSpE9XmexYpP1TU1T3x9oK+sun0qc4e7DM=;
        b=JJbAKG95rA836/qQ5yIzZnxQwaHhpbt3+WRu4SP7jJjeaJzVP5I0mIUgMfYOSIAIrL
         HC/X95YTrM+zj0gkPyOFC2RYnaj1YUcvVArfDUnHn4UxlqJ0rB5JwQ0Ns2d3Jlc5ZGES
         wUsKuBVNgW5iHmqpHX1YK+9fnFqKB+QmBWHS0qs5D79wpqNvUB78Xd0ywPtsG1vfuovp
         FX0rrUr96jv7ooHTAnBJSCHNPKWxzEb61p+qVFB2iIN7VAplG1HKZPYM5p0Y92hdKE3M
         9tLw4ihVwEa1EXW4VruPEcwjEsZ6rRIm7/3Gk73v5Jfz/21yns3+rKTxM7aP2coAim78
         G+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687622; x=1712292422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGZuEOPDrPSpE9XmexYpP1TU1T3x9oK+sun0qc4e7DM=;
        b=Q0EFy3DKLsxTv409gkwO8UdsMc5Tk3bOK+Of7f8+NRnMTm6wWOpCtnwZ34VrLth9oJ
         vgfocAJI9qlTB2BlZ5T8k1RiZXt+moi89BFhLGb1lapz7a3CMGnwIuHmkKPnn+PJDosl
         lIS/z5Kc6xS26rD5ydxeyaeCYRoc1uHwL7ZzAtnFY2f5zAHtyXp7TjVHYOVRBqVT4PWb
         aMGK7nHJiPskwUJWRxI9u4B+tsCc97z/jUTmd8RrP0n09UGdnehc0S3V+DMAXefwOyqX
         Wk+BX0LGgVppNOuHkWiK3LLfDdCgIIl91oT2oK/UW1oksHfghctoAhCE5EY184C9sGpR
         jcXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3Pnppn0lWCL5CjYTafG1XVuYzmD+3I31XzxGnk+LxLNKh1EfyAmOeOYTWX6UrsVFdq+pK2KIzjVWQtbTNWbVGqi0mJFacKm1E9XtPs0R7
X-Gm-Message-State: AOJu0YydQpvOt8X/SxZ6ZNy6knZTMt8k4siaAHuYcRgDjakfhaxCxZiB
	EdFnPpeYHlwa5sZIZpxyXsS1hsxV3IAgQBgtoMJlYoyHA+Q9zX8HqrUD3Wpt7ok=
X-Google-Smtp-Source: AGHT+IGVNl5i8Vrjt70n++oCEY2675qx+nSiOe/0hD9dLIqDDPWOmm3HrHLeaGTRiVH879DeLLhxrQ==
X-Received: by 2002:a05:6a00:a82:b0:6ea:d10d:c96d with SMTP id b2-20020a056a000a8200b006ead10dc96dmr1470360pfl.19.1711687622313;
        Thu, 28 Mar 2024 21:47:02 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:47:02 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	tech-j-ext@lists.risc-v.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v2 24/27] riscv: create a config for shadow stack and landing pad instr support
Date: Thu, 28 Mar 2024 21:44:56 -0700
Message-Id: <20240329044459.3990638-25-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_044704_128984_9F9C616C 
X-CRM114-Status: UNSURE (   8.46  )
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

This patch creates a config for shadow stack support and landing pad instr
support. Shadow stack support and landing instr support can be enabled by
selecting `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wires
up path to enumerate CPU support and if cpu support exists, kernel will support
cpu assisted user mode cfi.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7e0b2bcc388f..d6f1303ef660 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -203,6 +203,24 @@ config ARCH_HAS_BROKEN_DWARF5
 	# https://github.com/llvm/llvm-project/commit/7ffabb61a5569444b5ac9322e22e5471cc5e4a77
 	depends on LD_IS_LLD && LLD_VERSION < 180000
 
+config RISCV_USER_CFI
+	def_bool y
+	bool "riscv userspace control flow integrity"
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss)
+	depends on RISCV_ALTERNATIVE
+	select ARCH_USES_HIGH_VMA_FLAGS
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
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
