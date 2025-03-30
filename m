Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6DCC28B20
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Mar 2025 11:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+VsUeYLuVPwtaC4rEtSmwVrOn3/v7ebMos7jwT33cQ=; b=lakrifi2M14lOC
	erfwuCNUfzMBDAGHWLzDgHDJaAh3l/2oIKRN08USzTrarI9qCDG/cnYbqS+B7r3wmSgAiCmmda879
	VAmF4t3pIdW++stR7molSIFOAcfb2UA2D5Qli/933TTp21RZqtulb2SzrBauW3KmtK17Ma9y3wRav
	NieyV3ECizeOIjjUCFryWqq3/H3egqeQmh9QsTiDfwzaoAr9e/KkHj9uY5aOliXeLrLD+5VmavwOi
	WIWByaLbWaNfJQtZ3qzw6PDqEhaC3iUJf9HWqU6o95z+3qUFVx5PFiqLEBF9zksJoPauAgU183gCT
	uF30Iv4Q9f3sS/0Q2Ilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyqb0-0000000G7qQ-1241;
	Sun, 30 Mar 2025 11:12:54 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyqax-0000000G7pv-12U5
	for linux-riscv@lists.infradead.org;
	Sun, 30 Mar 2025 11:12:52 +0000
Message-ID: <14e0cc95-95d7-4e7d-949b-d944366510a3@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1743333168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QJY3OLhP2SkmfexLon8hzKLe4fDSbbfUy/idzgYz8bg=;
	b=An30oobdO9LFf0QQeb0gDKl+YJQCJivOaMuyVu1pPFaynt3+Ue61jxmEiUC6ouLugMvMst
	kN3ZFifMDLqlyIj8VnA9284owVulaFeSA062+b6Zn+OhXyvrr0NWcrbqdMUgJAU0SpZLnh
	CNPnID6XrLh/kIit6F1L/M4lsfIVJR8rdtVCy+Zj2gSzeKpAXT+nGzxSo24kBWFqcNA6tR
	qOLK+mvmtb88T+CfR3GxerP7HPgkwH5Jw6KMRWYO5PORxXmfh+DPW8L6CXpU4VeOoBwzF1
	n4bnN7Zt5KppamvM8SYNCglFPb2I/DhGI8+/VAgrx65OGarD1mex7uawOLGIMg==
Date: Sun, 30 Mar 2025 13:12:39 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] selftests: riscv: fix v_exec_initval_nolibc.c
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250306-fix-v_exec_initval_nolibc-v2-1-97f9dc8a7faf@iencinas.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
In-Reply-To: <20250306-fix-v_exec_initval_nolibc-v2-1-97f9dc8a7faf@iencinas.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_041251_444683_09B9B279 
X-CRM114-Status: GOOD (  19.51  )
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

Gentle ping :)

On 6/3/25 20:49, Ignacio Encinas wrote:
> Vector registers are zero initialized by the kernel. Stop accepting
> "all ones" as a clean value.
> 
> Note that this was not working as expected given that
> 	value == 0xff
> can be assumed to be always false by the compiler as value's range is
> [-128, 127]. Both GCC (-Wtype-limits) and clang
> (-Wtautological-constant-out-of-range-compare) warn about this.
> 
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> Tested-by: Charlie Jenkins <charlie@rivosinc.com>
> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
> ---
> Changes in v2:
> 
> Remove code that becomes useless now that the only "clean" value for
> vector registers is 0.
> 
> - Link to v1: https://lore.kernel.org/r/20250305-fix-v_exec_initval_nolibc-v1-1-b87b60e43002@iencinas.com
> ---
>  tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> index 35c0812e32de0c82a54f84bd52c4272507121e35..4dde05e45a04122b566cedc36d20b072413b00e2 100644
> --- a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> +++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
> @@ -6,7 +6,7 @@
>   * the values. To further ensure consistency, this file is compiled without
>   * libc and without auto-vectorization.
>   *
> - * To be "clean" all values must be either all ones or all zeroes.
> + * To be "clean" all values must be all zeroes.
>   */
>  
>  #define __stringify_1(x...)	#x
> @@ -14,9 +14,8 @@
>  
>  int main(int argc, char **argv)
>  {
> -	char prev_value = 0, value;
> +	char value = 0;
>  	unsigned long vl;
> -	int first = 1;
>  
>  	if (argc > 2 && strcmp(argv[2], "x"))
>  		asm volatile (
> @@ -44,14 +43,11 @@ int main(int argc, char **argv)
>  			"vsrl.vi " __stringify(register) ", " __stringify(register) ", 8\n\t" \
>  			".option pop\n\t"					\
>  			: "=r" (value));					\
> -		if (first) {							\
> -			first = 0;						\
> -		} else if (value != prev_value || !(value == 0x00 || value == 0xff)) { \
> +		if (value != 0x00) {						\
>  			printf("Register " __stringify(register)		\
>  				" values not clean! value: %u\n", value);	\
>  			exit(-1);						\
>  		}								\
> -		prev_value = value;						\
>  	}									\
>  })
>  
> 
> ---
> base-commit: 03d38806a902b36bf364cae8de6f1183c0a35a67
> change-id: 20250301-fix-v_exec_initval_nolibc-498d976c372d
> 
> Best regards,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
