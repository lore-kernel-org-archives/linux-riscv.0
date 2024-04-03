Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDD1CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gXPkVwEiQqFE8qCvPIuADYLts1LLHpyQfQoDfl2ZPM=; b=cOafyB45/+BhD2
	UXcPbM1IuRKhNgqgRviJ14YpmKRnd41sGJ8qpSR9tu+rhoCLC8CHTNS+z/GZOE5wiM2CE7xqjsPHd
	3h2W67s7LSAzrTTpUFqHnu7hFuv99H7CkjuWvSiu8idanx8AY0JBN/UlbqGDdVJDASTTO0pv5Dqij
	lmBwMdJYVW/gZEZhQYZZQjNLXDfBy5CZr9bWLv1BTnKWZU6Y51aBJY1eEjWcGGXPaOn8MMs8ChJYJ
	2Av4N/nvJ/3UGsMmg8XRwjpE/+zgEhBQiuVMupmTY7Eq5zn/BP9Jj7iDMC899hfHnGY+gYSiQCZaM
	DtqpOGYAHgMh7ILkDYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAEg-00000000ZMt-2AkV;
	Wed, 03 Apr 2024 23:41:42 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAEY-00000000ZG9-21q8
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:41:39 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6ecea46e1bfso130929b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187693; x=1712792493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1lL5f6yq9LaiF8GnxAfpEDQQL4kAkav9nCQOWb1C3Y=;
        b=hOCE4wtesWlIk4fRfVeTW+ZG9EG9hNTrhU0n4Jof3NB+C8yO4C+rlgljmyFwv435jr
         7lqQJNySm4vmedQ6W5+8ehG5wf2Zvi1QLJFfu6ZNvJyjfEWqQCKylnaCYyl03z2QoErm
         IvRC2s+kJBO1a9vNf5c0Gx2SAJNfPEdAQBS9QFYnquQ7FC/QcXYVGfutoEe026qUXOpv
         EP1aQOLMqbGM/9yk0nBgMu4gQ7hL5x6JS1aRN5mdUihu8oKtS5kowe9HT/23Ij1HCXv7
         3H+mYoMJnZ4i/EuwSO95Fzj7pa5q8brTk1ilPZIeqU010/6HVV4Ldl7okFwAgX8/OxkF
         fNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187693; x=1712792493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B1lL5f6yq9LaiF8GnxAfpEDQQL4kAkav9nCQOWb1C3Y=;
        b=QmY0J4YnABQ95nIBQDN3QENwdscs4bb6zql81Y/YZHIj5CrQ4cyIJmhPat0cDwXhCI
         wwlV/xAcsqaDrQsdM3MEMs1Cg2gcfAVr5RrScMgS/pIohDT2MIWa7QGnFgjix/JTkR3l
         bMIbKI/JkRz20eZ5nNoi8eGbur3jEWwWQ1/VN9+51QlIbS9+V3ofoTCF88EeQJ3tnGTY
         KI/FhMsQKe6aENIFkFsYyNAs6SQ4obIYy0hC+Lc+Cj6ABJQpj+rDnB8aNHMcXbcDjdbW
         lyag9drkU/RVNfvTPJDX0QR/s0IxhSp41joXlRUbBzdut3ae/HIgOebw6VCpgtdnYBc2
         6mEg==
X-Forwarded-Encrypted: i=1; AJvYcCUYWGdexpAfdAodd7nvWf+2vFjp/qKx9A7MYGb087obwGz3YBUigZWG7Le7krQBcgKdzbS1oh6uUj+1xZDVA2S2+lqd5v0JdqpBrQmzJIEi
X-Gm-Message-State: AOJu0YxFNR1xPpnUiGkM4BTVk9auqTi2cGL1Nkckr+JcH20Cj8YJNtBy
	Fh6DNIQsyc4QPa2v0hQjeJv1inebneDZSeK2GQMuOgCfEbpOgz93aDt+Q3qn4wo=
X-Google-Smtp-Source: AGHT+IExKU8/z/0Uf5Y5wAMW8Wut8qP6zJCIHgHh0jSkN2g23nIAgrJWZfYYYsTzy3HfTPFShjsbrQ==
X-Received: by 2002:a05:6a20:de16:b0:1a7:1df5:1699 with SMTP id kz22-20020a056a20de1600b001a71df51699mr975407pzb.27.1712187693134;
        Wed, 03 Apr 2024 16:41:33 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:41:32 -0700 (PDT)
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
Subject: [PATCH v3 01/29] riscv: envcfg save and restore on task switching
Date: Wed,  3 Apr 2024 16:34:49 -0700
Message-ID: <20240403234054.2020347-2-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_164134_687184_5CDABC1A 
X-CRM114-Status: GOOD (  10.61  )
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

envcfg CSR defines enabling bits for cache management instructions and
soon will control enabling for control flow integrity and pointer
masking features.

Control flow integrity enabling for forward cfi and backward cfi are
controlled via envcfg and thus need to be enabled on per thread basis.

This patch creates a place holder for envcfg CSR in `thread_info` and
adds logic to save and restore on task switching.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/switch_to.h   | 10 ++++++++++
 arch/riscv/include/asm/thread_info.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 7efdb0584d47..2d9a00a30394 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -69,6 +69,15 @@ static __always_inline bool has_fpu(void) { return false; }
 #define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
+static inline void __switch_to_envcfg(struct task_struct *next)
+{
+	register unsigned long envcfg = next->thread_info.envcfg;
+
+	asm volatile (ALTERNATIVE("nop", "csrw " __stringify(CSR_ENVCFG) ", %0", 0,
+							  RISCV_ISA_EXT_XLINUXENVCFG, 1)
+							  :: "r" (envcfg) : "memory");
+}
+
 extern struct task_struct *__switch_to(struct task_struct *,
 				       struct task_struct *);
 
@@ -80,6 +89,7 @@ do {							\
 		__switch_to_fpu(__prev, __next);	\
 	if (has_vector())					\
 		__switch_to_vector(__prev, __next);	\
+	__switch_to_envcfg(__next);				\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 5d473343634b..a503bdc2f6dd 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -56,6 +56,7 @@ struct thread_info {
 	long			user_sp;	/* User stack pointer */
 	int			cpu;
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
+	unsigned long envcfg;
 #ifdef CONFIG_SHADOW_CALL_STACK
 	void			*scs_base;
 	void			*scs_sp;
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
