Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15F2CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4UNdg8j4LJEtoYC8hf6jzijSdNK/prXALzAiAU/Uq4=; b=MLm4O/ZDZPwtNf
	1WAY9Y4yL6fjxan9/7oocXO5jccOk9qRC/2kPR2EunLXo+wSMpq6LOE/oZkoI1wMMxxdYKBP1QK/N
	TVM8aVzJ6kND9aKtzdKneVC/Pj7D+fswtl8c5gGLXat6harU8qx5qo9hiul1wG4IkA0VdaPENIEFt
	9ad4vIvOLTjJFApwENDdlXppaeAcw91mxcZZDAoSqi5NLdKfs3dBfc3leAIbsTdqFtZNu8mQSUlmG
	CYGsvqQUQLgs9oEVPDMPeRdP898M2dXNG1Lern19JGE599FI3N7W2hp5P26B6jpngFWFnyejUML5o
	rl3SdU6yf3u78kYSUzag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAHe-00000000bys-2aQ7;
	Wed, 03 Apr 2024 23:44:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAHd-00000000bx9-0QiG
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Apr 2024 23:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9DtlDgd/GAT0EKcB2AjZTXvg/KwB3A8UKH6yER0NyfA=; b=qylpXLg7LX9iYfEMvB72eRP6tz
	JP2nDmy3iZyQq2cNhJhEJuBNfy089KFRx8FDb0q9+MYb4tJ7DzuKzx6Kwysk2eXBg+sTfWvwRKNE1
	egFSyG4N8huTu4ONjIGpJd3AqRObOLDmlNsnJxy6OxOzluGQRdMX3GN2ABov8RgOpABxrR3lpfWeO
	kvLz1TQpMDz1nmf1COMAnt0rLe05wMvXEb8fXGb0naXO+s2wBjHwlVcuWPyyuUksMHkHXzO1a+WFq
	5KIx0HsfvjqMUeIhVKXFlE/ME0cLmE3FFubdHxZj7+i8+uhYZCEeRpjBllbxjw5vhDND9PqxRAsHe
	zA89meHw==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAFs-00000004U26-2nzC
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:43:46 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6eac64f2205so302175b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187767; x=1712792567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DtlDgd/GAT0EKcB2AjZTXvg/KwB3A8UKH6yER0NyfA=;
        b=QBo35FV6JI7LQcwC44sxGBCDbGbDOHo6pkRc9sZmrjzO5yeoxHwdg19IqvrYZSH9lz
         YpDzBmcyhyK+vFrQfHedkM+h8Tslt/Gt4d4ysKDkwoCqe3vwLmQNaSCkrMjei+hiAXNT
         dDHwKWNP3lZtzzh81O0QW36C0kSOjDDTP4SPKgycRg69Z4c4OWGhn1eAXLKN/tiJSH8p
         clGL9ABdxWS+gP1YnsKOY3JuVT8q8NDmXxmMr3qofVKvOQKs8d2hNUnjZpQdW3M5q4Ld
         hyL4rIa+UPcj5aWtIIEU8pz9pDqhHQNhAKPo3LafNEqGLgCbblE15g8l/wcnxnYehRJS
         qUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187767; x=1712792567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DtlDgd/GAT0EKcB2AjZTXvg/KwB3A8UKH6yER0NyfA=;
        b=Kc0hqwPwoW4iaNV735cYDJB2HeDGtwxg62rS7qPQEo9MUZP+k2B/wVpaLIBTFqayi3
         fPn4zeiiWrIVQT58Nz4WGHCu5OBf6c5KPbDwnfkCWKo+lpIqtXQaJ5Y1npIDxMldjHLJ
         T5e4+cHd0x3ZQVskDJCecOXcjR77wWhmbZGfBy2yxpaE50WgZI7SDYpjpWIKOqg/Jf7v
         KAvi+9riPeE1Y5VQdHGw0vCpese0I5+NMiQzoTZl7AHpc8+Hd8+M2yIGQqyeDOaPOTl+
         tfx34k2EQSqXvH2ulN0XkwOirkjZVwxMUf8/FdixuTFJ0JMRYOHPM2ABHlPXQ+H99eXm
         EnaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpo0gNr2D3VL3rbPsypbCzVkgVi9M1vhIDeQJSuunA3GwPHdl/esCIX/WPCq3Cf5GKsmed1f18kflWCm36kouPzeoFdSo4nIn+G3JAeHnA
X-Gm-Message-State: AOJu0YyWaY+zyrdLSwGVXVLvbc4JjroNb2VU1xgk7+Qi+JeNkc6CCVZG
	MOEGbxPf6K67slaTz/5/aFC8anDy8fnVmKvZNkZIHdmf5bemxInshMcKS+HGz0w=
X-Google-Smtp-Source: AGHT+IGTlfFxuJFVldaZ8jYPJUINkZRKqV1i5a/wExLO9N1TqU40XTAEu7HYkbstJURl0N5AQEsIcg==
X-Received: by 2002:a05:6a20:7285:b0:1a7:2437:3d58 with SMTP id o5-20020a056a20728500b001a724373d58mr1369671pzk.13.1712187767375;
        Wed, 03 Apr 2024 16:42:47 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:42:47 -0700 (PDT)
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
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
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
Subject: [PATCH v3 26/29] riscv: create a config for shadow stack and landing pad instr support
Date: Wed,  3 Apr 2024 16:35:14 -0700
Message-ID: <20240403234054.2020347-27-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_004326_080407_F99DE1BC 
X-CRM114-Status: UNSURE (   8.36  )
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
up path to enumerate CPU support and if cpu support exists, kernel will
support cpu assisted user mode cfi.

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
