Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD32EEE27A
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 03:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ikWIcJJverBzgBDBHLtQKuAKLe/kTNHGPw4MueWf0a8=; b=M0Y7xt/bT1CfLs
	RECfIQVp+TNLu0JtAV81qyTCzZGhzz7AfKAUurluhBkUv6eZANKtQ4gy0XZv5Ft47qXoB2eRqeFHh
	x0S6/f8x515S1Pjj3n8mfG/Xe/ILRh5GzlYVVjr9bPKfOX72cRpus9i8R72IwASfwJToHaXDb06Aw
	nFtsRhkArxOmCqFxYa7r/GwczZKPYQxtLg/MEZq2OhnQ41CY+qEu+cPhQ6qK4OAY1pG259XBwyeI5
	taFWh0TDiV98hn4WjrLBX5VxBHJ2GtinQluICA+ont8IbAvXp0TLguMCgXgOtOQ+XjSXA+haQroq9
	TOU13tb2dWPoys6OSq1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sowt6-0000000EoP7-1G7J;
	Fri, 13 Sep 2024 03:22:24 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sowt3-0000000EoOm-21SN
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 03:22:22 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-718e11e4186so1533788b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 20:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726197740; x=1726802540; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gkPkVDRD0OwFEuQUvV+n2s6XJ6GgG4bakHl8tALnG+0=;
        b=W5TztJMFj6MulRXgVxH+mfeQ0Adu5w2ESKbniCmRa/MP2NoDAvuf7G4NTroI04Uf1F
         MPwUup0LFhKn3Q7uw1RT/ceQ1ckQIE5sg+Aq7dZq6un/BmS+mTFmdu8VoLY5JEOu/i2i
         5a0HIEDhyppHSfeZT/bF32l7neYrWz0SZfy7Z3+tX4SLe6dP1k2J+vNscVY7s4PnRCxx
         SFLf7Kv/oo/wXlLl5sXDiyDTe1V2X5A7iwTQ5OymY2uyyBtuVdvozxpAw8OpAygU/XIc
         Y3UL2HzH704HT8J5QVIGQP+mLK/anuiRdyZORmHGyD4zxDkUNWYuG8gon6jhj9YHSv3f
         oWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726197740; x=1726802540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkPkVDRD0OwFEuQUvV+n2s6XJ6GgG4bakHl8tALnG+0=;
        b=vt5iOWAV5ycVQ62jLKShnDMUi0WkUcw7+4hNJw9gLoZNTxZ7BPi3rMxf7h9EkA1/Ay
         9q+Vi1XUJNVUVsZhaZEVPt45YQHLN19g7Ay+VWh47qcDsBwpM6EtHUVhkBpyfBvSyT10
         qDSY5Q3w0FlnSYXZrMXudcZ6VTyZUgN/WYorM9UyUTYQO6CtiiVVDHNv/d+isqTWJvrc
         JXh2BkM51nv4raUIFjMu/FlsM9Gw6hAiOO1RMeZzB9U73RHTQ8RPNUR5B7FIthKMh6W7
         agtiBDwyBkjq+ITM1vtvjf+uu2/1Kqc+GIAaABdcDbiyXXECr04/M8Sfn4mRBxHHo+Xe
         FwQg==
X-Forwarded-Encrypted: i=1; AJvYcCVgvqDrUV4Y3xQVbT049TLzaY38XcFSsdVpali1gSC3Wo8t/lakg0otr5N+wTWjrq3S8EukiRamIz/ctw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy17AbI6+Fu3Zyn4qrCt041OA4huSqpfAZjJllnmgTBgF5KrUT
	CWP3GqQT/bHuKZdTlIENBBAt8/yJRwKmMytK3l1EYUiyIhPbFcKovMgxtvavjsg=
X-Google-Smtp-Source: AGHT+IEXdu7/jKSiLZPseTbEtvh8wm3jfCToFcsHiweT3cn9stVw7aGwEh7jPsLs5sXKDmpHC50qCg==
X-Received: by 2002:a05:6a21:9d91:b0:1c6:fbf3:a0ef with SMTP id adf61e73a8af0-1cf764c11e3mr7345712637.44.1726197740389;
        Thu, 12 Sep 2024 20:22:20 -0700 (PDT)
Received: from ghost ([2600:1010:b329:66c7:b074:429:f745:d035])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719090b273asm5263978b3a.166.2024.09.12.20.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 20:22:19 -0700 (PDT)
Date: Thu, 12 Sep 2024 20:22:15 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH 2/2] selftests/mm: skip virtual_address_range tests on
 riscv
Message-ID: <ZuOv55YsorfvhlQi@ghost>
References: <20240913022635.751505-1-zhangchunyan@iscas.ac.cn>
 <20240913022635.751505-2-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240913022635.751505-2-zhangchunyan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_202221_545478_86ED21EA 
X-CRM114-Status: GOOD (  19.85  )
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

On Fri, Sep 13, 2024 at 10:26:35AM +0800, Chunyan Zhang wrote:
> RISC-V doesn't currently have the behavior of restricting the virtual
> address space which virtual_address_range tests check, this will
> cause the tests fail. So lets disable the whole test suite for riscv64
> for now, not build it and run_vmtests.sh will skip it if it is not present.
> 
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>

Which tree does this apply onto? It is failing to apply on -rc7. Also,
since this is the second version of this patch it is good practice to
put v2 in the subject like [PATCH v2 2/2]. Anyways, the content of this
patch looks good!

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  tools/testing/selftests/mm/Makefile       |  2 ++
>  tools/testing/selftests/mm/run_vmtests.sh | 10 ++++++----
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
> index 84573ddfcfa2..912778347213 100644
> --- a/tools/testing/selftests/mm/Makefile
> +++ b/tools/testing/selftests/mm/Makefile
> @@ -112,7 +112,9 @@ endif
>  
>  ifneq (,$(filter $(ARCH),arm64 ia64 mips64 parisc64 powerpc riscv64 s390x sparc64 x86_64))
>  TEST_GEN_FILES += va_high_addr_switch
> +ifneq ($(ARCH),riscv64)
>  TEST_GEN_FILES += virtual_address_range
> +endif
>  TEST_GEN_FILES += write_to_hugetlbfs
>  endif
>  
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> index 03ac4f2e1cce..7caa624a2e5a 100755
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
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
