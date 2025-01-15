Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98F9C02183
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 22:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWN+fQ235CGF+r+qw9CirPb1mTjNmuxW+I7wFKxCBBE=; b=kfnFSH7ir45C8d
	hoBb9EkA7Ej2BM3YfDempT3gJs63yUwJ3MiA+k/isOHylNw+MKDbhA+gWHa1ABsdoCifEQlGMfuLc
	HWHuKjb/3Ojo8sV9hRSGIrlamMMT8hZarQLMLl5K65lhvYH0PE4gc9MupyABxYJ+xmWh1hmqPBkbW
	Kv+rXCqIusKWp/35EtsRCkySE666D86rypKWNt6r/quP0lIa43prEB2Og2NLHnqF3/GTXf+hpHtCE
	s6GjdfXPDt0Ic4mwKMkuxCvx8kmcyLnYxiEYRBOlZWThltpc1s7BkAl9C5EWI2Xb5V954zXDaGOQt
	MrQcpSmMxsPyy6R94Y3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYC6O-0000000DGkw-0WGz;
	Wed, 15 Jan 2025 22:43:08 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYC6L-0000000DGkZ-09nz
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 22:43:06 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-216281bc30fso5840055ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 14:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736980984; x=1737585784; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1YubPgC/8eI2lbaVxtAtUgVaIXVapt21tVigfpGQfQ=;
        b=q4bEY1E54MX4UO3xu9z9SDtjgU1b9h581wrsiF81Dssig334oZGBj6GNxqB3hnS5FR
         8B6f+gYayg/iMvWZDIUxYWjOmzRn8HUA/UyRg9cg1egQWvt0zDWsZZp+YO0wFJ4KPkHi
         nvR5xWr5F1i9O/8ZVRaDkth6+4TJ82/5JOHE5pxMWp8aZuds9+LsEqTGkexp6az98NwG
         zMAEzJlg45YNFwBH4wZBYv63eaPo0uNSd05d9MIy7QTNCaYo3+9/EkKtEE4zjpHBkh4s
         +tgQsLOWNZM+dO+nyqPdvvWP19GaR9a/xhoZvjkvCKmTXmWIMesvc76CpKl41NateEUZ
         h5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736980984; x=1737585784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1YubPgC/8eI2lbaVxtAtUgVaIXVapt21tVigfpGQfQ=;
        b=wKDXWizYsXO84gxqoIrDA+yosVcB2phDHpc97OW6zDoeViF+bAj7nVsgSEYiMYPRB8
         FeT1/fz+3C14ZpuPNoU/SAIOdH10me+N2aOGMCRLWUYkHoQO1TdEHGTIJcKjNDbBQ4ht
         Whf/YsRcLloShgxWly2/3t68ZwGgDmXuLj/PiRN37v7L5GNXJUo8CmZchhlg46nY2lFH
         DAR8w+E5ndes2w3uJLvij35KQFsRXye4xWYr2KOs9ku1vSjnDDu49Eh7dFp/3bNMzY18
         VnTFTv/zHLomkJRN6voSx6RmNkzdCWuMkmTRhfPuQdPgGi42hl3lRRKoqukqCb5vUIbn
         SaFw==
X-Forwarded-Encrypted: i=1; AJvYcCXdQOfHO0tj5uOJr+fAr6ksUn7CmvuHFuT0KAFWDeFMA4cFdyxr5SCeAe18n10ji1bpjxeKAwVedyTo7w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0OCqwS2bt2nefGybaceKhInuHlxZQTb+OeaWj9WQciAWB4umw
	ydcox4bwHtoD8rKY2Q+UT3cu+FjceYWVwwdMisb8tp7hJzkktTXV6CW5OKWrzpE=
X-Gm-Gg: ASbGncvS93KE7AwMJE3kI6UN07gliJnz7Jo1RxKZ403snbCkaGdSkf9pEa8nd/QS3f2
	5a0cQktRFMH5Nv8Hgcn5LBJpKQhJ0HsAcF7C0B0WPj5Sf3MQ/aJSpGp7TsOuMU9rcqvXJ+vxIN3
	s9miwJcm96fULn8CbNP+qJTdJshScilWEPMaPCbgGx1VJkACW/L0KdkY/Joug0gBIOGorgrZX0f
	1Xpg8ooC2TAs7QvlqrvyTq9iTAc9H+sUX51hPdeJb/8O50=
X-Google-Smtp-Source: AGHT+IHvvdjAhB26TfABelCo2yezRGgIVCLHqbk75eU3TNKSL+BscHjkrJVVlUgyTbGeTyl7z8y3Mg==
X-Received: by 2002:a05:6a00:1385:b0:72a:aa0f:c86e with SMTP id d2e1a72fcca58-72d21f17738mr44987044b3a.4.1736980984037;
        Wed, 15 Jan 2025 14:43:04 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d405942b0sm9709309b3a.74.2025.01.15.14.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 14:43:03 -0800 (PST)
Date: Wed, 15 Jan 2025 14:43:00 -0800
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
Subject: Re: [PATCH v6 0/3] riscv/ptrace: add new regset to access original
 a0 register
Message-ID: <Z4g59EaNblLWKPXF@ghost>
References: <20250115-riscv-new-regset-v6-0-59bfddd33525@coelacanthus.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250115-riscv-new-regset-v6-0-59bfddd33525@coelacanthus.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_144305_285875_DC9B36A7 
X-CRM114-Status: GOOD (  19.54  )
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

On Wed, Jan 15, 2025 at 07:13:26PM +0800, Celeste Liu wrote:
> The orig_a0 is missing in struct user_regs_struct of riscv, and there is
> no way to add it without breaking UAPI. (See Link tag below)
> 
> Like NT_ARM_SYSTEM_CALL do, we add a new regset name NT_RISCV_ORIG_A0 to
> access original a0 register from userspace via ptrace API.
> 
> Link: https://lore.kernel.org/all/59505464-c84a-403d-972f-d4b2055eeaac@gmail.com/
> 
> Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
> ---
> Changes in v6:
> - Fix obsolute comment.
> - Copy include/linux/stddef.h to tools/include to use offsetofend in
>   selftests.
> - Link to v5: https://lore.kernel.org/r/20250115-riscv-new-regset-v5-0-d0e6ec031a23@coelacanthus.name
> 
> Changes in v5:
> - Fix wrong usage in selftests.
> - Link to v4: https://lore.kernel.org/r/20241226-riscv-new-regset-v4-0-4496a29d0436@coelacanthus.name
> 
> Changes in v4:
> - Fix a copy paste error in selftest. (Forget to commit...)
> - Link to v3: https://lore.kernel.org/r/20241226-riscv-new-regset-v3-0-f5b96465826b@coelacanthus.name
> 
> Changes in v3:
> - Use return 0 directly for readability.
> - Fix test for modify a0.
> - Add Fixes: tag
> - Remove useless Cc: stable.
> - Selftest will check both a0 and orig_a0, but depends on the
>   correctness of PTRACE_GET_SYSCALL_INFO.
> - Link to v2: https://lore.kernel.org/r/20241203-riscv-new-regset-v2-0-d37da8c0cba6@coelacanthus.name
> 
> Changes in v2:
> - Fix integer width.
> - Add selftest.
> - Link to v1: https://lore.kernel.org/r/20241201-riscv-new-regset-v1-1-c83c58abcc7b@coelacanthus.name
> 
> ---
> Celeste Liu (3):
>       riscv/ptrace: add new regset to access original a0 register
>       tools: copy include/linux/stddef.h to tools/include
>       riscv: selftests: Add a ptrace test to verify a0 and orig_a0 access
> 
>  arch/riscv/kernel/ptrace.c                   |  32 +++++
>  include/uapi/linux/elf.h                     |   1 +
>  tools/include/linux/stddef.h                 |  85 ++++++++++++
>  tools/include/uapi/linux/stddef.h            |   6 +-
>  tools/testing/selftests/riscv/abi/.gitignore |   1 +
>  tools/testing/selftests/riscv/abi/Makefile   |   6 +-
>  tools/testing/selftests/riscv/abi/ptrace.c   | 193 +++++++++++++++++++++++++++
>  7 files changed, 319 insertions(+), 5 deletions(-)
> ---
> base-commit: 0e287d31b62bb53ad81d5e59778384a40f8b6f56
> change-id: 20241201-riscv-new-regset-d529b952ad0d
> 
> Best regards,
> -- 
> Celeste Liu <uwu@coelacanthus.name>
> 

There is also this series that looks like it will solve this problem by
providing an architecture agnostic way of changing syscall args with
PTRACE_SET_SYSCALL_INFO [1].

- Charlie

[1] https://lore.kernel.org/lkml/20250113170925.GA392@altlinux.org/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
