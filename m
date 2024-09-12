Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ABCEEE270
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 23:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WptGrFvVb0PdPGI0I4NUgr+XRNvMzhzG3joRB1sdaJ0=; b=Ur//shVrqLjvFI
	keoNDnoKEeA77AV36/riAn1zCGT8TMnUlNskXhBkLbW6TVFRnyTNkBC02rWcoxOP7xb+FXM46Nu8z
	J4VNCLA7gv8Kb8W/Tj4HyuR0bj5fuWoK3xaQ0bJYiqNPknogiawiPADpH9tux9gkXteCOVzSRh884
	RHoBEQrQWoOsYztGPNZeLmT36XIdPFyYSKGrv0b+uMNzpB0ak9mKq31OHlRpthBhL6+QmnyIl9/Wr
	KuBEy6jLxBWqwBVQKnDZjX9CbeA+PmQlVDdhXlHW/391Wrs1QqXJmsrVubhUAVcW268gfklrsezdj
	zyYwE++5UFQ7D1uapt/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot44-0000000ER3q-2T2R;
	Thu, 12 Sep 2024 23:17:28 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot40-0000000EQzu-11Ee
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:17:26 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2053525bd90so2921525ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183043; x=1726787843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDmvOTSrnPg54HHGP9mWRdaXRn5Dr4fSLwQGe7BW+Sc=;
        b=euT8kCLmn1fXpsN0kAe53Cu3PxWsOgVtULTqHpz1xgUhYPvbDNJXU9Rh315LvBNDbv
         naPFGN8SfSq6ZLW1NVTeZdSiMG2gvHfTgRJ+lOttelJZZ/4XD2ofiWJb5B52SeiyWrkF
         kobreoQGy9dpKxXaxgerwqzKQWUY6fn/gXHycdTp2ccAbZPO+qOCydLL2wa5MkCXqIYH
         XKl3Ud87j35KaUE60LpHRWeatyE1M+0L41Bs1hwgZlqM73JJLPQbP4dxFLXNvfui5dKs
         NShE0ECCYcw/LEK5FClTdIX1LDkN6VVwok3uMQAtUW5w44CAdpRC3b/QQcGTv5JOsRbS
         7VBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183043; x=1726787843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zDmvOTSrnPg54HHGP9mWRdaXRn5Dr4fSLwQGe7BW+Sc=;
        b=uGMyK+GgXe7mhNNm9ZHyVLX/dKpRoXhQIh3gps44/2mVRydY3B+qFV4aQv57vRxK+u
         RzsnzixCsrL+mDExhpsb6JXv5v88mXc+YxMZLzU9xJFFKapNZ7p69ARYDV2kn/XCxrkD
         5kOjwW3tCI+gKZVZXsJHJpxsYj7BpHUodbWgciIxpaCM5hEWnqh/q12b3NtoY6NjKhAv
         iLauIdHZcLuqwnFoniDENhVlTrkeLtLOqWDNdHoMYi/X8FvtZJTITdQX9ploUR87M+uT
         egdzMFiITM7u0gOR8e9ZU932tHJ5ds8giSZiWZqpX022/CiampauSgcdR6JbHCD5A+yJ
         noXg==
X-Forwarded-Encrypted: i=1; AJvYcCUF8IUgn/WhGvov4Yu4H7lu7Qbge9pOs8D3Rt1PMNpHsCa9X4kzpP9E8wR9HISFt/MYtj7B8PASXbuOrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOD+f/aCp4Nd1VzNXUmQ4rKkq2835IivOQlpdP2WI1Yt3Q2mJ9
	7h0WB8DLr2pHcVKmDa6ekhL9nJvtQIB1lTS6t9kOOT36wdpGAJ2/BxA2V5VqXYM=
X-Google-Smtp-Source: AGHT+IFCbH4CWj3cRlGP/tTcFYJu5lqNBzSaDboWQslgR+Qb4odzPou2d9TOn5WUDlzlxhbuOJA+kw==
X-Received: by 2002:a17:90a:cf0f:b0:2d8:8ce3:1e9d with SMTP id 98e67ed59e1d1-2dbb9dbda04mr929613a91.3.1726183043273;
        Thu, 12 Sep 2024 16:17:23 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:17:22 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 04/30] riscv: Add support for per-thread envcfg CSR values
Date: Thu, 12 Sep 2024 16:16:23 -0700
Message-ID: <20240912231650.3740732-5-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_161724_585375_35FAD67E 
X-CRM114-Status: GOOD (  16.24  )
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
Cc: quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org, jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, greentime.hu@sifive.com, osalvador@suse.de, ajones@ventanamicro.com, revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, krzk+dt@kernel.org, vbabka@suse.cz, debug@rivosinc.com, brauner@kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Samuel Holland <samuel.holland@sifive.com>

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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/switch_to.h   | 8 ++++++++
 arch/riscv/include/asm/thread_info.h | 1 +
 arch/riscv/kernel/cpufeature.c       | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 7594df37cc9f..dd4a36ff4356 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -70,6 +70,13 @@ static __always_inline bool has_fpu(void) { return false; }
 #define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
+static inline void __switch_to_envcfg(struct task_struct *next)
+{
+	asm volatile (ALTERNATIVE("nop", "csrw " __stringify(CSR_ENVCFG) ", %0",
+				  0, RISCV_ISA_EXT_XLINUXENVCFG, 1)
+			:: "r" (next->thread_info.envcfg) : "memory");
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
 
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index fca5c6be2b81..c74536194626 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -57,6 +57,7 @@ struct thread_info {
 	long			user_sp;	/* User stack pointer */
 	int			cpu;
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
+	unsigned long envcfg;
 #ifdef CONFIG_SHADOW_CALL_STACK
 	void			*scs_base;
 	void			*scs_sp;
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 0139d4ea8426..f7fcd23d55de 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -922,7 +922,7 @@ unsigned long riscv_get_elf_hwcap(void)
 void riscv_user_isa_enable(void)
 {
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
-		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
+		current->thread_info.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
 		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
 }
-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
