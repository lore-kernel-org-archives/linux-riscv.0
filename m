Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E293CC4167B
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Dec 2023 23:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=356JhNzYUpmavk6wGOgXMVgSvu67u2oudOK0i0e32fU=; b=bs42ijbjk0eY/tialzJCZJ+XtW
	hyFiIp06WQHaqJH5jFjWi1H+m0MfNgO4bLXJmgwJv+TxUhW/+LBsoQXn5PD97z29XgJz43WcYrWF7
	/7K5k4DLHN3T1N4JbvpFtQ9cKcbWEHHGJXgEJw4gO3Fwxww5QAIqsHvA6Z7rO1+5vlwaejRbxI194
	LaHcRt2Pqxz9nRgvQZD+7eDZw4zTnErOFPoiho1ugHqB36AN3mmxtlU5RrWO+OW325QSgbCCZ90dv
	H7FEoDLalawzWNl3Ji9v1xen+8I574+4B+W1b44VIpcpigApqgqJW5fHhBh5c5P+ja5JUoeq/5Vl/
	em2IxS1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rC74H-000j4M-1i;
	Sat, 09 Dec 2023 23:49:09 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rC74D-000j3W-2b
	for linux-riscv@lists.infradead.org;
	Sat, 09 Dec 2023 23:49:07 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6cef5220d07so193311b3a.2
        for <linux-riscv@lists.infradead.org>; Sat, 09 Dec 2023 15:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702165745; x=1702770545; darn=lists.infradead.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=OPCNY52nyiQdIzlwx6EU4oIvd2oaUqsRoubFMnhv/R4=;
        b=D150iy20mRvfiy5ZDcTEbMz/h9zjI4jF0LkN+2iHxS9haGyjm6OcsPCzF4+zY8OvUa
         PJ9Bt7YiB78jXKeeja6sqMCrukeB1KKIVKxXB5QTfrdAHVwJ3hpzGNH0K9DP+ZcjoK1W
         +kjG93A24FIxIRr79BM7eYOMn9MxCyOojJrHgecswuGMthDjFv+P4JzhpCoJMFualVrP
         aT8b9o2L1jUBXKbSucSaQeu3UX8L3NXry1rQd9ruuL2vu4HJfiDY8JMoRTqMrHRwRjHG
         mbMx1sGenV9NLJIyUoHPNJ3nRjGeqMpv4EoljlmyFSQ23BzqnNKmYWH+wQC5izAy0i2k
         4q0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702165745; x=1702770545;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPCNY52nyiQdIzlwx6EU4oIvd2oaUqsRoubFMnhv/R4=;
        b=k6ywpnCgfB2YNZBfIH2vTptWsFh0eyzLju89I/Ij1fFYwGbo2DYSqlS4ffrobgEeT7
         AOCGSQj8uwWdI5Zf6raVSTy00A3IQrXMxgCfvO5ZFPPliGHUjVgjRyORMRDjb1ouCJIj
         cFqYq/JFjraMUdxRNnzDHeEr9L2SsnWuz2sJE9mgnynUkwHxUtUKAKaWA7sgfedCYOAS
         DVGWSUM16tGZxQ8SRO3nZpUHfpb/d4MnhxBcrOvJNjrMLWi0vFe3GcUG/5vLjH459ba1
         lT4OUMx2MWLNHId+slshRrEdRdt5DzukmeumNKLhs7A/Cpp2fmsiP3XzQ9r8gqhfVzp0
         MRkA==
X-Gm-Message-State: AOJu0YybqvZP85YWxBe9K5PE2RNz4hflN2ha+0RHtHJ2ZUX30f91I5o7
	IZMuPJRLbqPQND0yjOb/+Az8hA==
X-Google-Smtp-Source: AGHT+IEJJXjirbJfGvEGv9wlC7QhPL3oJqPTSZjXXGeMs1qcfj17IHUevHGTEfzPXl+gH/HmXyzIBw==
X-Received: by 2002:a17:902:c64a:b0:1d0:c41b:1d1e with SMTP id s10-20020a170902c64a00b001d0c41b1d1emr919404pls.73.1702165744705;
        Sat, 09 Dec 2023 15:49:04 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8470:ded6:9593:9f4f:5c29])
        by smtp.gmail.com with ESMTPSA id n2-20020a170902d2c200b001cfcf3dd317sm3918148plc.61.2023.12.09.15.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:49:04 -0800 (PST)
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-26-201c483bd775@kernel.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, Oleg
 Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, "Rick P.
 Edgecombe" <rick.p.edgecombe@intel.com>, Deepak Gupta
 <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, Szabolcs Nagy
 <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, Christian
 Brauner <brauner@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 26/39] arm64/ptrace: Expose GCS via ptrace and core
 files
In-reply-to: <20231122-arm64-gcs-v7-26-201c483bd775@kernel.org>
Date: Sat, 09 Dec 2023 20:49:02 -0300
Message-ID: <877clney35.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231209_154905_852566_0CD02CEE 
X-CRM114-Status: GOOD (  21.22  )
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


Mark Brown <broonie@kernel.org> writes:

> Provide a new register type NT_ARM_GCS reporting the current GCS mode
> and pointer for EL0.  Due to the interactions with allocation and
> deallocation of Guarded Control Stacks we do not permit any changes to
> the GCS mode via ptrace, only GCSPR_EL0 may be changed.

The code allows disabling GCS. Is that unintended?

> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/uapi/asm/ptrace.h |  8 +++++
>  arch/arm64/kernel/ptrace.c           | 59 ++++++++++++++++++++++++++++++++++++
>  include/uapi/linux/elf.h             |  1 +
>  3 files changed, 68 insertions(+)
>
> diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/uapi/asm/ptrace.h
> index 7fa2f7036aa7..0f39ba4f3efd 100644
> --- a/arch/arm64/include/uapi/asm/ptrace.h
> +++ b/arch/arm64/include/uapi/asm/ptrace.h
> @@ -324,6 +324,14 @@ struct user_za_header {
>  #define ZA_PT_SIZE(vq)						\
>  	(ZA_PT_ZA_OFFSET + ZA_PT_ZA_SIZE(vq))
>  
> +/* GCS state (NT_ARM_GCS) */
> +
> +struct user_gcs {
> +	__u64 features_enabled;
> +	__u64 features_locked;
> +	__u64 gcspr_el0;
> +};

If there's a reserved field in sigframe's gcs_context, isn't it worth it
to have a reserved field here as well?

> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif /* _UAPI__ASM_PTRACE_H */
> diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
> index 20d7ef82de90..f15b8e33561e 100644
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -33,6 +33,7 @@
>  #include <asm/cpufeature.h>
>  #include <asm/debug-monitors.h>
>  #include <asm/fpsimd.h>
> +#include <asm/gcs.h>
>  #include <asm/mte.h>
>  #include <asm/pointer_auth.h>
>  #include <asm/stacktrace.h>
> @@ -1409,6 +1410,51 @@ static int tagged_addr_ctrl_set(struct task_struct *target, const struct
>  }
>  #endif
>  
> +#ifdef CONFIG_ARM64_GCS
> +static int gcs_get(struct task_struct *target,
> +		   const struct user_regset *regset,
> +		   struct membuf to)
> +{
> +	struct user_gcs user_gcs;
> +
> +	if (target == current)
> +		gcs_preserve_current_state();
> +
> +	user_gcs.features_enabled = target->thread.gcs_el0_mode;
> +	user_gcs.features_locked = target->thread.gcs_el0_locked;
> +	user_gcs.gcspr_el0 = target->thread.gcspr_el0;
> +
> +	return membuf_write(&to, &user_gcs, sizeof(user_gcs));
> +}
> +
> +static int gcs_set(struct task_struct *target, const struct
> +		   user_regset *regset, unsigned int pos,
> +		   unsigned int count, const void *kbuf, const
> +		   void __user *ubuf)
> +{
> +	int ret;
> +	struct user_gcs user_gcs;
> +
> +	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &user_gcs, 0, -1);
> +	if (ret)
> +		return ret;
> +
> +	if (user_gcs.features_enabled & ~PR_SHADOW_STACK_SUPPORTED_STATUS_MASK)
> +		return -EINVAL;
> +
> +	/* Do not allow enable via ptrace */
> +	if ((user_gcs.features_enabled & PR_SHADOW_STACK_ENABLE) &&
> +	    !!(target->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE))

There should be only one '!' above.

Though contrary to the patch description, this code allows disabling
GCS. Shouldn't we require that

  (user_gcs.features_enabled & PR_SHADOW_STACK_ENABLE) ==
    (target->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE)

? That would ensure that the GCS mode can't be changed.

> +		return -EBUSY;
> +
> +	target->thread.gcs_el0_mode = user_gcs.features_enabled;
> +	target->thread.gcs_el0_locked = user_gcs.features_locked;
> +	target->thread.gcspr_el0 = user_gcs.gcspr_el0;
> +
> +	return 0;
> +}
> +#endif

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
