Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B86C54E68
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 21:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6SDsFTeZ+85HRjjLVFHS5RbhBW2k1PPaNU1l+euh0Nw=; b=o73V1ScBiLS9WE
	DifH+y9OkFXBnaTGEuAQQ02jCWke04ahD4q+ZuT3tzLv+YSHPXpgMNn1dcYiBsvg7dj+0aad+m/2M
	UlGpD3A8B1DF1O3we5hYBlOkGdh4jD2qKwKUkx+flRxEdTnzkXSKI1kjOdNFkXons9Va5EP0M/eg9
	uXjNH10wWiopc/VyJkJSc69Nxs170mA4+pB7GTRSHXla+QzUvjGVFXF7/AcXPDnFCfNlClLHB2FV3
	agIt8Xl/x7BVZUC9VzxFZuMza2DC56xb9POPZEzc0Nld8ulPYuRnmyBygJnR+LR+TjjuOhUaX6R1L
	Kv8gL4D71N5SZ0scYtCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhUY-0000000EMjK-3X2j;
	Tue, 19 Mar 2024 21:59:30 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmhUT-0000000EMey-2XuU
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 21:59:27 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e74aa08d15so725499b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 14:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710885563; x=1711490363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dz0gWVnpXPU7ElrUaImwHtbiCroEAM5Xe/I2DTavV7g=;
        b=ZHfSzQ9HSXn7L5lzsuL3DgweHkzOcUjkq+w4sMMBjUHCSwluihaT0W/RVqJhuI5aIe
         yiK1qah+cpd1W23luuNHUI4+NXmNj2tBU38UDm3WbVdVPjlsM6F+d/PxAifpnwDC5ifU
         b9nodf7qmDP7UeskUIYIJ5LTlPaB3le7sAX4FF3JDWzRXeTzgK48yT8/rTuec/ghHuWY
         mJEUn69twBL64x7Rt1WQwOHfuBGF3GjuDcYNoivn/8K0HpXwCorCQj74HT6h5nsOx7cj
         CMfMUpdhAhlmjWtsPqTyGcKXkXhc9sSepCNnfvkdP0SZNMXZOxsJJNxEruuuRARUbxpC
         Zblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710885563; x=1711490363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dz0gWVnpXPU7ElrUaImwHtbiCroEAM5Xe/I2DTavV7g=;
        b=JAvoIilgjfiX5LWBdxvLtWwkHc+JdeGD5tr40wwoRcdSmacoj2jxMpmUT21t5fzR05
         ka8GCh8vB54Dke5TqQZMyU9L7Bs13Z3e6xbuTTiPkQbvEBfhkA3rJzNHAQE5lKu6bFUt
         c9EKaD1zx1cK6gqawm7ZVdLmwcnP0YR5VMXIhZP8pl/nssh5FqqPRhSEqrCHQ0Ss3aSM
         4e5WLxeIW0aCbhvyheyFkpsOIGSrGyuYzhO7Zm0XaL33esVdVJckNfz+IR0rhmR+7khq
         6Md79oHvcprO+xCZi4eVy51x4VntZTo50+ZxtentGuBKdzz7DyxA+jZ+2ZamtJCw+UBt
         Yh7A==
X-Forwarded-Encrypted: i=1; AJvYcCUr7P8/zYB6RoyFZwS40IjPIW0BX0aVe0hetYCB1WZQ08YDhz8Y82zp+zBAH3yXvE7aVBWaZHAeuC1DBEfSrd4hEa7DJsmg61FNVwGoZ+Xm
X-Gm-Message-State: AOJu0YxQlLf5eGwPdnANKUw73OJ14FDgYY54xDyfGd7LkbHzTUIwsKdB
	hetPaEhF+ATRS0e9zJbk+7MIKDbMdVRKW0mWYqYCP2TTHQTaQBCT4+OkhCe0uU4=
X-Google-Smtp-Source: AGHT+IEXM30Lrne9ss/C/7W/K1gxYQD71hKRIdntgbmHeEfv/1G3LVtA8crJjeRdhBQq5PV/uA1LDA==
X-Received: by 2002:a05:6a00:1482:b0:6e7:2379:dd18 with SMTP id v2-20020a056a00148200b006e72379dd18mr4524923pfu.0.1710885563216;
        Tue, 19 Mar 2024 14:59:23 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id z25-20020aa785d9000000b006e6c61b264bsm10273892pfn.32.2024.03.19.14.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 14:59:22 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	tech-j-ext@lists.risc-v.org,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [RFC PATCH 5/9] riscv: Split per-CPU and per-thread envcfg bits
Date: Tue, 19 Mar 2024 14:58:31 -0700
Message-ID: <20240319215915.832127-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240319215915.832127-1-samuel.holland@sifive.com>
References: <20240319215915.832127-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_145925_683126_9ACB1961 
X-CRM114-Status: GOOD (  15.51  )
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

Some envcfg bits need to be controlled on a per-thread basis, such as
the pointer masking mode. However, the envcfg CSR value cannot simply be
stored in struct thread_struct, because some hardware may implement a
different subset of envcfg CSR bits is across CPUs. As a result, we need
to combine the per-CPU and per-thread bits whenever we switch threads.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/cpufeature.h |  2 ++
 arch/riscv/include/asm/processor.h  |  1 +
 arch/riscv/include/asm/switch_to.h  | 12 ++++++++++++
 arch/riscv/kernel/cpufeature.c      |  4 +++-
 4 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 0bd11862b760..b1ad8d0b4599 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -33,6 +33,8 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
+DECLARE_PER_CPU(unsigned long, riscv_cpu_envcfg);
+
 void riscv_user_isa_enable(void);
 
 #ifdef CONFIG_RISCV_MISALIGNED
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index a8509cc31ab2..06b87402a4d8 100644
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
index 7efdb0584d47..256a354a5c4a 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -69,6 +69,17 @@ static __always_inline bool has_fpu(void) { return false; }
 #define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
+static inline void sync_envcfg(struct task_struct *task)
+{
+	csr_write(CSR_ENVCFG, this_cpu_read(riscv_cpu_envcfg) | task->thread.envcfg);
+}
+
+static inline void __switch_to_envcfg(struct task_struct *next)
+{
+	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
+		sync_envcfg(next);
+}
+
 extern struct task_struct *__switch_to(struct task_struct *,
 				       struct task_struct *);
 
@@ -80,6 +91,7 @@ do {							\
 		__switch_to_fpu(__prev, __next);	\
 	if (has_vector())					\
 		__switch_to_vector(__prev, __next);	\
+	__switch_to_envcfg(__next);			\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d1846aab1f78..32aaaf41f8a8 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -44,6 +44,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
+DEFINE_PER_CPU(unsigned long, riscv_cpu_envcfg);
+
 /* Performance information */
 DEFINE_PER_CPU(long, misaligned_access_speed);
 
@@ -978,7 +980,7 @@ arch_initcall(check_unaligned_access_all_cpus);
 void riscv_user_isa_enable(void)
 {
 	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
-		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
+		this_cpu_or(riscv_cpu_envcfg, ENVCFG_CBZE);
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
