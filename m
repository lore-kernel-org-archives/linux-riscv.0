Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA331C02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 21:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8lm7on91B55ZUQrzWNM0NTV+gcu4tuu0Aejnt7LgxsQ=; b=BEjFoNwwlE1cgV
	BFZL6f8JuxFkqVGaPiu1q0SXDkU/BGs2YSgDz/Smeh+Qbu4mHgECJm3u2LoROhhx5Ej5Qu5G1gYan
	TdBWSLAdMIfY2+89MrWv0obpSNEX8CmQ01+VAnj8ZESkiGzElzp93DHTqAG9iQbGnfSVXyeUlxo3D
	VZgdmdpHYusYLP3YORKmk5+Q+MbZ+J2KHJj/IS8wcBR2ZLRyGxiLWUdWS4JniNRAOFb78+hORM3fo
	+oUEdupN5VwiUMtSCIn7ugt4Cq034lWq+VVghq/NA3xn1zkqvbwKFF4+/KaRuRmF1G4WbaarI/+OU
	1x2IIwqC+sqkcb9+hr6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYB1J-0000000DAmy-2xlN;
	Wed, 15 Jan 2025 21:33:49 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYB1G-0000000DAlm-35AE
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 21:33:48 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2163dc5155fso3001585ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 13:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736976825; x=1737581625; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qo4ETtsJlbJYJPy25LzBlpSKy4jxFb72+aJIYM6Qmdo=;
        b=JqP+JbQBrxsOfxyR86bvvwzbZ7OVHvbHzL/EQL8CPNu/6ooKfpjhxqNliq15/pX4bQ
         JS9WyI2ecWz60Mw7t0GIxjaohCOrX3RhsAXWJyaDjQSm+gaWXZZXJ1Au19NoZZK38aT/
         t4Sqe/lERlgYIIteKpQyM8HVymfbfAuZii3I64wLQWw7BpkztAqivdeN53LIytWH5UBR
         fkk1egKoO9esx9nstRqw5FpxA+IXQh4U8pFHQpN1phUFVr3gOtvd+oMSWQkzZyKg0ptR
         p6nj41kraYGwf1BzJSEh5legDmtTYy2Upr0SAC+wVYJvm1r4hnlwQz4OJUJgjOUOiN4F
         ubPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736976825; x=1737581625;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qo4ETtsJlbJYJPy25LzBlpSKy4jxFb72+aJIYM6Qmdo=;
        b=XLQewlnUW35maTrLe85ve6Sf3Phef/xzeFVnG9RTPU8v0BrpBiT1ALNFea6aVTIDiH
         B6R+rXkH2//YzX8MKpYyZR9wU5rGC99ZIuK0lS141v7PwEpsSOLYI/1xqIPuoCLu+1KW
         k//y7h8KuikG8pRZa12BAa4ZV/gEEgM0WRm3YPAi0WaLmtImfRGMx7fZmIYTwsAOabgU
         Q4f5QLt+RyJTT72Z9GVRHkaOV7N5k93lqAZ1ZkW47GBOQhwLBnL22aDcMZcI3/ujZP6V
         gQ6zk8+H+RPuHsgfxACJSlMQC1GuXTl1F4aI2YqmJPTYS3fxey/n3nGxQDJny1FJQTf4
         6Gdw==
X-Forwarded-Encrypted: i=1; AJvYcCXLJ0YMtG9YcdWcjtWsis86LsD5BbMyS6QEn2THsqdeUKCgsTDX67B6G8re+RrepS/JiiNq4BBBPIBVQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDyNbVVZDTZyuZ0q7DXG+4brwCiMplhjHv1yy37kxVXFGq+2Ol
	6YGSOA+8tu86TSyTimqRCZZsoCEe7xzhgxKtkdJJNrqzOo5+yLf9M6SO+QZGKGE=
X-Gm-Gg: ASbGncu9RHJqKirH0E9sH06z7H7bgP8IS0wGtFkwqtvhEVB0UiP3GeRXvQqdZBlqws2
	MGlf8h/3j2pm10zOIGZzKgQ98DA4mmgf787UU59+Si6dtSJUP5kuYmOUi1AEwkfAId2W7Icgw+a
	nY3wfWEllnmSioIOdhHcyeG3GPHLFMRWy56+Ryh4dHvyhIyfu8wmpVY9Eb/Jy1J/+rp6TOo3/or
	UwFLrzVog4LRBOy/zp9/MXV1jFchFDpU8nvcG4EvZKo+Q0=
X-Google-Smtp-Source: AGHT+IHeBFp9ozsD00dMGeBP70l/6pdoK1N3rRLqykt0VBwwJZB2RSCK6+oNoGuy+C0NCfg+cpgwSw==
X-Received: by 2002:a17:90b:518b:b0:2ee:b2fe:eeee with SMTP id 98e67ed59e1d1-2f548eba7d0mr45962466a91.15.1736976824059;
        Wed, 15 Jan 2025 13:33:44 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c17fa66sm2035101a91.13.2025.01.15.13.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 13:33:43 -0800 (PST)
Date: Wed, 15 Jan 2025 13:33:38 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Celeste Liu <uwu@coelacanthus.name>
Cc: Oleg Nesterov <oleg@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, "Dmitry V. Levin" <ldv@strace.io>,
	Andrea Bolognani <abologna@redhat.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ron Economos <re@w6rz.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>, Guo Ren <guoren@kernel.org>,
	Yao Zi <ziyao@disroot.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: Re: [PATCH v6 1/3] riscv/ptrace: add new regset to access original
 a0 register
Message-ID: <Z4gpstfwOanEy_Ck@ghost>
References: <20250115-riscv-new-regset-v6-0-59bfddd33525@coelacanthus.name>
 <20250115-riscv-new-regset-v6-1-59bfddd33525@coelacanthus.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250115-riscv-new-regset-v6-1-59bfddd33525@coelacanthus.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_133347_058675_4B867F1E 
X-CRM114-Status: GOOD (  22.08  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 15, 2025 at 07:13:27PM +0800, Celeste Liu wrote:
> The orig_a0 is missing in struct user_regs_struct of riscv, and there is
> no way to add it without breaking UAPI. (See Link tag below)
> =

> Like NT_ARM_SYSTEM_CALL do, we add a new regset name NT_RISCV_ORIG_A0 to
> access original a0 register from userspace via ptrace API.
> =

> Fixes: e2c0cdfba7f6 ("RISC-V: User-facing API")
> Link: https://lore.kernel.org/all/59505464-c84a-403d-972f-d4b2055eeaac@gm=
ail.com/
> Cc: stable@vger.kernel.org
> Reviewed-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> Signed-off-by: Celeste Liu <uwu@coelacanthus.name>

Thank you!

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  arch/riscv/kernel/ptrace.c | 32 ++++++++++++++++++++++++++++++++
>  include/uapi/linux/elf.h   |  1 +
>  2 files changed, 33 insertions(+)
> =

> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index ea67e9fb7a583683b922fe2c017ea61f3bc848db..ef9ab74c8575a5c440155973b=
1c625c06a867c97 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -31,6 +31,7 @@ enum riscv_regset {
>  #ifdef CONFIG_RISCV_ISA_SUPM
>  	REGSET_TAGGED_ADDR_CTRL,
>  #endif
> +	REGSET_ORIG_A0,
>  };
>  =

>  static int riscv_gpr_get(struct task_struct *target,
> @@ -184,6 +185,29 @@ static int tagged_addr_ctrl_set(struct task_struct *=
target,
>  }
>  #endif
>  =

> +static int riscv_orig_a0_get(struct task_struct *target,
> +			     const struct user_regset *regset,
> +			     struct membuf to)
> +{
> +	return membuf_store(&to, task_pt_regs(target)->orig_a0);
> +}
> +
> +static int riscv_orig_a0_set(struct task_struct *target,
> +			     const struct user_regset *regset,
> +			     unsigned int pos, unsigned int count,
> +			     const void *kbuf, const void __user *ubuf)
> +{
> +	unsigned long orig_a0 =3D task_pt_regs(target)->orig_a0;
> +	int ret;
> +
> +	ret =3D user_regset_copyin(&pos, &count, &kbuf, &ubuf, &orig_a0, 0, -1);
> +	if (ret)
> +		return ret;
> +
> +	task_pt_regs(target)->orig_a0 =3D orig_a0;
> +	return 0;
> +}
> +
>  static const struct user_regset riscv_user_regset[] =3D {
>  	[REGSET_X] =3D {
>  		.core_note_type =3D NT_PRSTATUS,
> @@ -224,6 +248,14 @@ static const struct user_regset riscv_user_regset[] =
=3D {
>  		.set =3D tagged_addr_ctrl_set,
>  	},
>  #endif
> +	[REGSET_ORIG_A0] =3D {
> +		.core_note_type =3D NT_RISCV_ORIG_A0,
> +		.n =3D 1,
> +		.size =3D sizeof(elf_greg_t),
> +		.align =3D sizeof(elf_greg_t),
> +		.regset_get =3D riscv_orig_a0_get,
> +		.set =3D riscv_orig_a0_set,
> +	},
>  };
>  =

>  static const struct user_regset_view riscv_user_native_view =3D {
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index b44069d29cecc0f9de90ee66bfffd2137f4275a8..390060229601631da2fb27030=
d9fa2142e676c14 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -452,6 +452,7 @@ typedef struct elf64_shdr {
>  #define NT_RISCV_CSR	0x900		/* RISC-V Control and Status Registers */
>  #define NT_RISCV_VECTOR	0x901		/* RISC-V vector registers */
>  #define NT_RISCV_TAGGED_ADDR_CTRL 0x902	/* RISC-V tagged address control=
 (prctl()) */
> +#define NT_RISCV_ORIG_A0	  0x903	/* RISC-V original a0 register */
>  #define NT_LOONGARCH_CPUCFG	0xa00	/* LoongArch CPU config registers */
>  #define NT_LOONGARCH_CSR	0xa01	/* LoongArch control and status registers=
 */
>  #define NT_LOONGARCH_LSX	0xa02	/* LoongArch Loongson SIMD Extension regi=
sters */
> =

> -- =

> 2.48.0
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
