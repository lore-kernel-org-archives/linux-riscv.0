Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96ADFC36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 14:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zs22xzAqlyEl5kAuuGnTZXf6c5EWt/YtXCyBCvqjwqM=; b=jQgpPg7iV9/C774Nkz5jXFSWPE
	8uJqZPIfpG+aKxZ1qQePjWjYWcz3peptKRZ/GjWy+CTGiO1g/7AuykAqGZx0/ONsMuAViIYUNML2i
	RhmdGXkLfNLG+Ky51PT/jr3M3lnYjBxEKlbf5m+9Y7qt08AoQrTNRPTjb458nr3vXYwRHvqTyyuQa
	nHz7pRJodAGo2H0h7FyOFeRmVq3X0E2AZjPGrMefhjYAnyKcO4jkJmAPeGHxPSFvZv3rvBvaxZX3F
	xjVPXfMqbOJYDc/r9gxT9ZOcbRkZM+k/EEsvwkx6UwwiZo53DczYV5BaCfOTSlPlHvV8lELMNVlPG
	wvJeQ1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Wqy-00000007ZCZ-1k3U;
	Wed, 09 Apr 2025 14:56:36 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WNb-00000007RmC-186h
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 14:26:16 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso9172887b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 07:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744208774; x=1744813574; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VWCFSwSJdWVyuiq1FZlofUemWkrK3y3F0Kcxx42yGpc=;
        b=vXtwkW4iAGzMbf406amLZUkSK530Qk72uBKdEu7X6xtqeOKTxHP+lbciHKtvzp2E2o
         MXEvZgoN98UKmzqhfbShE2ntx1LntrY+FEjnTagMcn9aN1gZLck6S9/jFvWY1Xf4uMq8
         EPrbj/9SlYq0wWTa6y3bp284lsubToRJ5wqKJYp3vACNbRX2H+9Q1Pj+5dURTTcyaa6+
         gRUKwVgy2G4t+yFI5uxf70A7e4ZuyVoqCCrUONT829UZEYFh1/3DFOmEWBngWRWjkp+m
         6ZC45TrBUqzUcngiW8KocsWVA+e6Ak9W9u+y507p4VUmDdO2XvstMQ3lfC4TnMwvjnDO
         76Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744208774; x=1744813574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWCFSwSJdWVyuiq1FZlofUemWkrK3y3F0Kcxx42yGpc=;
        b=Rz2jSyTq6urVy/squNZ16zHMHRA1FYbMwt9rTt2jmPPhR15vAxZOTyxdt0l034PMv2
         6TqU9ZPQP0DZS8GVX/uWcgTuPQ5cBBFfvWrOA1QtrvQO2O69phOxz5WRkxdPTigJhI/q
         VowihmWhb1schsLUjj45U4b7UIbgqaZ+5GnzqSX8XXanA6mjJbiaf8LLWcTozJDxEbpH
         SLNS1DIKNdALMzNRqnTS60xvK7kfiOoWaOoKpgNaLFoW21D7UdgJfpEHS869IspD8PkX
         aV4zS/A1bijKAowmcxaHy0h8+4hOJ6M1Y4D9HGYkoXUyRNVfEqtTOEQFKc5ksvGTb8Fl
         /Q8A==
X-Forwarded-Encrypted: i=1; AJvYcCWoXsASC93FeQPmQxGBiEieTskNGFqcA/joHaYUEmXKEOOxEA20O2KfyBVHvWeckeNhpwzaeB7ppLFtjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxllZc+AX6f10Sg34FYXugouRFXRe6SHku+gN+y0s73PhdBfxGt
	r7rLyC8WOWCNHhe6ab5v6zjDqcdkzXgAuNJbg5eqSSUzIIxONUec3R9fdFWsY4M=
X-Gm-Gg: ASbGnctKMFSd6wF8bJreFNnHX81h+F0X8yugyHV5yxGuOJ8EedNLsy6PurtUuiiOreX
	exNc7rH8ZXF4FieDsVLLZI/fa8NMHJmjKhv2xcE2HJMbw3A179s9K/E+ubL3OfUn/APi0pTn3S3
	rhMRqQlwtRPF+CoVIgkgpDPJXOyoXSORJi61sYyMSDPTPBeUh2SGSmG2pRf+jdEVqQHTdeZttoX
	EfTf557SxJAUzM1kbvkXQfSY/tIt4m51ejvHwqeiv2BBnIET6b/Brg8tUMf9Spp1iS7UDLx8ZCS
	s0YwXoaIg/2BWP5fg+C/pweDrGkclWv0dBUKHwp0kTFWyVAQu8E=
X-Google-Smtp-Source: AGHT+IHFFMUtgc5GdaqhKowOEcwpQuVaNNQv/0+QvYg71I8MlHsNAHS1sjVjRx/1bLRC7yOHjj+PuA==
X-Received: by 2002:a05:6a00:e12:b0:736:a973:748 with SMTP id d2e1a72fcca58-73bafd6a4a1mr3511930b3a.22.1744208774241;
        Wed, 09 Apr 2025 07:26:14 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d2b108sm1426136b3a.19.2025.04.09.07.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:26:13 -0700 (PDT)
Date: Wed, 9 Apr 2025 07:26:10 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: Re: [PATCH v12 13/28] prctl: arch-agnostic prctl for indirect branch
 tracking
Message-ID: <Z_aDgnfI3_LKHdfb@debug.ba.rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-13-e51202b53138@rivosinc.com>
 <fdf8f812-ae36-4327-b345-2df047b85e7a@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fdf8f812-ae36-4327-b345-2df047b85e7a@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_072615_331103_4689EFE4 
X-CRM114-Status: GOOD (  14.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 09, 2025 at 10:03:05AM +0200, Alexandre Ghiti wrote:
>On 14/03/2025 22:39, Deepak Gupta wrote:
>>Three architectures (x86, aarch64, riscv) have support for indirect branch
>>tracking feature in a very similar fashion. On a very high level, indirect
>>branch tracking is a CPU feature where CPU tracks branches which uses
>>memory operand to perform control transfer in program. As part of this
>>tracking on indirect branches, CPU goes in a state where it expects a
>>landing pad instr on target and if not found then CPU raises some fault
>>(architecture dependent)
>>
>>x86 landing pad instr - `ENDBRANCH`
>>arch64 landing pad instr - `BTI`
>>riscv landing instr - `lpad`
>>
>>Given that three major arches have support for indirect branch tracking,
>>This patch makes `prctl` for indirect branch tracking arch agnostic.
>>
>>To allow userspace to enable this feature for itself, following prtcls are
>>defined:
>>  - PR_GET_INDIR_BR_LP_STATUS: Gets current configured status for indirect
>>    branch tracking.
>>  - PR_SET_INDIR_BR_LP_STATUS: Sets a configuration for indirect branch
>>    tracking.
>>    Following status options are allowed
>>        - PR_INDIR_BR_LP_ENABLE: Enables indirect branch tracking on user
>>          thread.
>>        - PR_INDIR_BR_LP_DISABLE; Disables indirect branch tracking on user
>>          thread.
>>  - PR_LOCK_INDIR_BR_LP_STATUS: Locks configured status for indirect branch
>>    tracking for user thread.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>Reviewed-by: Mark Brown <broonie@kernel.org>
>>---
>>  include/linux/cpu.h        |  4 ++++
>>  include/uapi/linux/prctl.h | 27 +++++++++++++++++++++++++++
>>  kernel/sys.c               | 30 ++++++++++++++++++++++++++++++
>>  3 files changed, 61 insertions(+)
>>
>>diff --git a/include/linux/cpu.h b/include/linux/cpu.h
>>index 6a0a8f1c7c90..fb0c394430c6 100644
>>--- a/include/linux/cpu.h
>>+++ b/include/linux/cpu.h
>>@@ -204,4 +204,8 @@ static inline bool cpu_mitigations_auto_nosmt(void)
>>  }
>>  #endif
>>+int arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status);
>>+int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status);
>>+int arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long status);
>>+
>>  #endif /* _LINUX_CPU_H_ */
>>diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
>>index 5c6080680cb2..6cd90460cbad 100644
>>--- a/include/uapi/linux/prctl.h
>>+++ b/include/uapi/linux/prctl.h
>>@@ -353,4 +353,31 @@ struct prctl_mm_map {
>>   */
>>  #define PR_LOCK_SHADOW_STACK_STATUS      76
>>+/*
>>+ * Get the current indirect branch tracking configuration for the current
>>+ * thread, this will be the value configured via PR_SET_INDIR_BR_LP_STATUS.
>>+ */
>>+#define PR_GET_INDIR_BR_LP_STATUS      77
>>+
>>+/*
>>+ * Set the indirect branch tracking configuration. PR_INDIR_BR_LP_ENABLE will
>>+ * enable cpu feature for user thread, to track all indirect branches and ensure
>>+ * they land on arch defined landing pad instruction.
>>+ * x86 - If enabled, an indirect branch must land on `ENDBRANCH` instruction.
>>+ * arch64 - If enabled, an indirect branch must land on `BTI` instruction.
>>+ * riscv - If enabled, an indirect branch must land on `lpad` instruction.
>>+ * PR_INDIR_BR_LP_DISABLE will disable feature for user thread and indirect
>>+ * branches will no more be tracked by cpu to land on arch defined landing pad
>>+ * instruction.
>>+ */
>>+#define PR_SET_INDIR_BR_LP_STATUS      78
>>+# define PR_INDIR_BR_LP_ENABLE		   (1UL << 0)
>
>
>Are we missing PR_INDIR_BR_LP_DISABLE definition here?

PR_SET_INDIR_BR_LP_STATUS with parameter's bit0 clear will disable branch tracking.
This is what arm and riscv settled on for shadow stack enable and disable as well.
>
>
>>+
>>+/*
>>+ * Prevent further changes to the specified indirect branch tracking
>>+ * configuration.  All bits may be locked via this call, including
>>+ * undefined bits.
>>+ */
>>+#define PR_LOCK_INDIR_BR_LP_STATUS      79
>>+
>>  #endif /* _LINUX_PRCTL_H */
>>diff --git a/kernel/sys.c b/kernel/sys.c
>>index cb366ff8703a..f347f3518d0b 100644
>>--- a/kernel/sys.c
>>+++ b/kernel/sys.c
>>@@ -2336,6 +2336,21 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
>>  	return -EINVAL;
>>  }
>>+int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
>>+{
>>+	return -EINVAL;
>>+}
>>+
>>+int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
>>+{
>>+	return -EINVAL;
>>+}
>>+
>>+int __weak arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long status)
>>+{
>>+	return -EINVAL;
>>+}
>>+
>>  #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
>>  #ifdef CONFIG_ANON_VMA_NAME
>>@@ -2811,6 +2826,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>>  			return -EINVAL;
>>  		error = arch_lock_shadow_stack_status(me, arg2);
>>  		break;
>>+	case PR_GET_INDIR_BR_LP_STATUS:
>>+		if (arg3 || arg4 || arg5)
>>+			return -EINVAL;
>>+		error = arch_get_indir_br_lp_status(me, (unsigned long __user *)arg2);
>>+		break;
>>+	case PR_SET_INDIR_BR_LP_STATUS:
>>+		if (arg3 || arg4 || arg5)
>>+			return -EINVAL;
>>+		error = arch_set_indir_br_lp_status(me, arg2);
>>+		break;
>>+	case PR_LOCK_INDIR_BR_LP_STATUS:
>>+		if (arg3 || arg4 || arg5)
>>+			return -EINVAL;
>>+		error = arch_lock_indir_br_lp_status(me, arg2);
>>+		break;
>>  	default:
>>  		trace_task_prctl_unknown(option, arg2, arg3, arg4, arg5);
>>  		error = -EINVAL;
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
