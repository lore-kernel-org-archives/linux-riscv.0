Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16189CE8E6A
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 18:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=mzJAYcA4uFsyIKGfneo1D9Bahhda23MYkMBJ9qaJmGo=; b=NDUHtwW6+k5W1uKNc0086op/PB
	5Kq2dbt7zEI+4Em1JN/w3A0eOFZs29ZC+T3Iw3Y+LhSRBdrixHgvbcDUU9H7HzCInrBMdIp48J8kI
	V98VJ9M+Qlq+V4Z7NtquLSp8LgFwfylxtLC5R770T118oO7P+ZUuM5sPFru+ObveLsl3lfavft1H8
	/QIr3uI/jkhOtG5DcJOIcIrCyVnJZ5vzRZ08cEkPldNTKjwPdbk0ULumiwqQcN0IgKrQQzdIzP6WN
	FjKuNm2ra4lBZOPtuT5b7EMCMTxi9+/m07KttlVVBIuaPsKCJgfropg+p13snntc0oLwkDLuP6kpE
	YqI40ejQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t42G1-00000001PjB-3tD3;
	Thu, 24 Oct 2024 18:08:25 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t428Y-00000001OFZ-3bj3
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 18:00:44 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7203c431f93so939901b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Oct 2024 11:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1729792841; x=1730397641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/q1WiGJcS/tkbhu37qaq0jxibdm+CvDbpDg/bK1kAU=;
        b=m5FPL9Mq0IjtxzbvnIR8MlEhXy5n+tPKxgAIy2MSfqEqP0ob9B7FEgjWS91SNmNW8o
         Q0IaHmz35F4Fuol7gA2a8BGJB4HfuGRXfTPV6vK8WVdxEy0nJ6Z6ka5CgalZceh6Hrx8
         hVTGF0iP66M32rTqsR90t0u7gkzvmLnkVeoEx7VaIEz7wau+uKEjHHhf2+aMQ5O1Ju95
         W7XKRNBOhBPW+KpmGNVHYhrrPc97jW6HUop6H/5BikYzrfpdtGjE1rOqsa34NtEzZNrk
         7u4KnZcJjAIbhT7WwDeddtddz/wlfMLNr5rg/xMBGx5yTocpbUkY53/Pc5fGsIAM2Z6T
         0TjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729792841; x=1730397641;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/q1WiGJcS/tkbhu37qaq0jxibdm+CvDbpDg/bK1kAU=;
        b=YTFM3SC7TBJewHHEA0Zl5EggsiHQAvyrE7QLqL4uYsMoYSfcy+U3/w5DeRkpSq7Guw
         8ScrigNXC4hK20P2duDy5klO217k5jqliEfsS/bYUM0IjbqS0XA/Q3CPBItm5JoagF1h
         bWX/Ko/LuCjGC0aQNY5Pe9MHshMpCZrODZHwhjSJk9NojPKG79z4DxtxGXCfO9HHFUNg
         vrK3AeoCTGm+aig8h+pgh7xCg9ejTdfOgP76nXBLVFb9BKfsISxk24v92Z7U4JJlI1g0
         +5JWLIquBFgRAuebF8gqfNOGJUB1HnmlbSCEDpM1wrc5RXQqkEP8Id9/kiVhBVfmuffi
         8Z8A==
X-Forwarded-Encrypted: i=1; AJvYcCWx47u+hK0kfRjYTn22VGW8mYTllbwe5TDNeiTFj/bqVZ8i1eLwgxgbSFFresLH9SO0ICKTWtxaAV2uyA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5gE3qhbBCf+iUGDLacWbSeq683QOGuJd6os+/CwyBPYFLlkqg
	alkA/5ITtHyIdCuQJ8Z/PJuplF8/MlO2lG/pdoeWJj4a5hJdAAvsIl+FEOQFfSU=
X-Google-Smtp-Source: AGHT+IEWB1udhSviA9LAWrRVloAe7iAHeKwlFuxSRB7lYrklQRgkKc7BVJq9iQgQFB+GNpPYe7xzxw==
X-Received: by 2002:a05:6a00:2e1c:b0:71e:634e:fe0d with SMTP id d2e1a72fcca58-72030a8ae4bmr10220156b3a.12.1729792841339;
        Thu, 24 Oct 2024 11:00:41 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13ea720sm8218735b3a.157.2024.10.24.11.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 11:00:40 -0700 (PDT)
Date: Thu, 24 Oct 2024 11:00:40 -0700 (PDT)
X-Google-Original-Date: Thu, 24 Oct 2024 10:54:46 PDT (-0700)
Subject: Re: [PATCH V2 4/4] selftests/mm: skip virtual_address_range tests on riscv
In-Reply-To: <20241008094141.549248-5-zhangchunyan@iscas.ac.cn>
CC: akpm@linux-foundation.org, shuah@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, alex@ghiti.fr, Charlie Jenkins <charlie@rivosinc.com>, linux-mm@kvack.org,
  linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  zhang.lyra@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhangchunyan@iscas.ac.cn
Message-ID: <mhng-d7045132-a4e1-409a-9646-d8ecd3d6a48f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_110043_236767_10249D1B 
X-CRM114-Status: GOOD (  17.59  )
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

On Tue, 08 Oct 2024 02:41:41 PDT (-0700), zhangchunyan@iscas.ac.cn wrote:
> RISC-V doesn't currently have the behavior of restricting the virtual
> address space which virtual_address_range tests check, this will
> cause the tests fail. So lets disable the whole test suite for riscv64
> for now, not build it and run_vmtests.sh will skip it if it is not present.
>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
> V1: https://lore.kernel.org/linux-mm/ZuOuedBpS7i3T%2Fo0@ghost/T/
> ---
>  tools/testing/selftests/mm/Makefile       |  2 ++
>  tools/testing/selftests/mm/run_vmtests.sh | 10 ++++++----
>  2 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
> index 02e1204971b0..76a378c5c141 100644
> --- a/tools/testing/selftests/mm/Makefile
> +++ b/tools/testing/selftests/mm/Makefile
> @@ -115,7 +115,9 @@ endif
>
>  ifneq (,$(filter $(ARCH),arm64 mips64 parisc64 powerpc riscv64 s390x sparc64 x86_64 s390))
>  TEST_GEN_FILES += va_high_addr_switch
> +ifneq ($(ARCH),riscv64)
>  TEST_GEN_FILES += virtual_address_range
> +endif
>  TEST_GEN_FILES += write_to_hugetlbfs
>  endif
>
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> index c5797ad1d37b..4493bfd1911c 100755
> --- a/tools/testing/selftests/mm/run_vmtests.sh
> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> @@ -347,10 +347,12 @@ if [ $VADDR64 -ne 0 ]; then
>  	# allows high virtual address allocation requests independent
>  	# of platform's physical memory.
>
> -	prev_policy=$(cat /proc/sys/vm/overcommit_memory)
> -	echo 1 > /proc/sys/vm/overcommit_memory
> -	CATEGORY="hugevm" run_test ./virtual_address_range
> -	echo $prev_policy > /proc/sys/vm/overcommit_memory
> +	if [ -x ./virtual_address_range ]; then
> +		prev_policy=$(cat /proc/sys/vm/overcommit_memory)
> +		echo 1 > /proc/sys/vm/overcommit_memory
> +		CATEGORY="hugevm" run_test ./virtual_address_range
> +		echo $prev_policy > /proc/sys/vm/overcommit_memory
> +	fi
>
>  	# va high address boundary switch test
>  	ARCH_ARM64="arm64"

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

(I'm taking the first two as they're RISC-V bits)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
