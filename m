Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB1FC36017
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 20:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sM5TkiIzv+kA/g9IZTqpjctEHz+kqKzNJbHdWhijfOY=; b=rjJm91zst1fL8A
	ycq0PiOzYK+IRANggm/bcQDrzuS3z+8EnrONQ+9q2rNCtv3YXETdrzqYvyoMzbenJ2lYRXXaSt5Cy
	VYXJ/Ys0KKIDAWD3eQWlDc4S5jtzvvULow8BaCekPfog/IS7UjTxmaFV1ub7uHwvhXsZ71WsI+zar
	ip6QIMxgrZhvJBqxCfOb5O4N2AgFtjmXnIDtSPht9QB0p4FdeOsRI8VQRRzLPJPfzZNtFi3Pl447z
	Q90G/g+oPz0XFyZTIjfoyDfiY3YG1NnD0/VpZpq6EP5MUftUh3zPKXCrPZPB9EcBiul5JRikUqMHG
	GhVN5h+eZQ5wB2CJvSfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziS7-00000004KnA-3jFH;
	Tue, 01 Apr 2025 20:43:20 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziS2-00000004KmT-2mst
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 20:43:17 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22423adf751so112179465ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Apr 2025 13:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743540193; x=1744144993; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4N9bSikoL2WjOyo56gwXGKLK2uNMMUkoiqCVV5Eb9wg=;
        b=Sd+Cisf/GcTe2+HOj8GnCXDvhY4wQx0SrUlNznCVJGdUiGKUQk+qBjn7Ov30BfGzxJ
         VNx1ABOB6CbU2Oq5wR1af0b7JJo6JLtqug9iM8/BaT5e+28a22bZZWPhsQbFWw544gCO
         18qLt3i0NXeHZyTudnAmJprSzhEzF7kRkr8tZdebpozKZmPA02mA7vXeaf1lO6XsNbG4
         JFOUm2QlcQZSXDn2yFExHB7HC5xMbTQHcj54ApNETCU+HzT5lc++SpCOyzsg7AKM0BzW
         uncAWb3ni2uO+HQUbRj4EKttCGDJr3BDsoTWMIvviYM8UMKCn9qPgi/vSRESbKYGjC7d
         i49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540193; x=1744144993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4N9bSikoL2WjOyo56gwXGKLK2uNMMUkoiqCVV5Eb9wg=;
        b=jv+JC4hUxz22QC2AWIVKMsTL8h2jTZ4879vbyZFEqBErKkMbUMIRTp4fhvIy8d2lcj
         3u/37vGN613iqEpZB++C1QqNvAlL3SIx5HLfX4Ahlw4Mij8oFVqN2u6oH/q/TqFH2RzR
         63O02rKrvG7Wp/9knjFHW2FAnb5/c7H1BIkM2qVp1l4K/BN9payHavyAq7nNN7SsZc2w
         QayxNuamTtdxdH0pSo7r8+4MGX52CmI6AjJk3i1ci1DpR3k/9kTb7asvCX4GaHLDWBGO
         N2Qj+3ySu1h45WOH/f36jJePjdjs+uhvLFx6IyDBpBlFA0EQgW4JkjO/NlVwjPw3fO5x
         J9xg==
X-Forwarded-Encrypted: i=1; AJvYcCVwBewIe7o9b9HEMtDE1NfkuGqJgL74lusPgRcJ9NiD8kZYsHhxabvBhLU/p3DcbIlUdkX44sL+OCywDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCEkbSn1cAuYwn1oAGcIZiHOZFWMB79kss235B1VzsH68ytvds
	T1vTXWmKaR3ucdSN/huqASul7rY8IvYaF4aDKoBxMkQpjaEcssw+8PXz2RNgVOY=
X-Gm-Gg: ASbGncvtUPVWj6Ygh2jRKKh+1zxMazZzzoMaCT2/C6oUVAImKHuNvcQ7n+GN8BV7Hcj
	l231Z4I1xJv5PksOyoF7VdqbBaYA2JryflM7OcIv2E2vqGrHRi32uGug3m2myWCSBt8qYRGMy+g
	XEilOapFpwwQTFAw9Q90VtbUwvX1RqcFZfTCook1xWeX968mkJVJoKufnNOmakk63bWgTqIgVUJ
	Rsy6BhJX9/q5fdhaCmJaMrDvSphcFX40hgmxb1znqHnuESPeCYsRIUGn1yEnS22ytTDqpn74QFi
	o4ZXVOcfld4LQatIfV9yTJq70n+LzP1s9Cs=
X-Google-Smtp-Source: AGHT+IEK/OL+9Kd9LZbi6kJp9eomm5A9lXwmWj+SEPjmTfabDnSjH/xtw6UkP02pfgtMx4rN8zRqyg==
X-Received: by 2002:a17:902:c411:b0:220:f7bb:842 with SMTP id d9443c01a7336-2295c0ed243mr67067595ad.42.1743540193373;
        Tue, 01 Apr 2025 13:43:13 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cde55sm93609305ad.132.2025.04.01.13.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 13:43:12 -0700 (PDT)
Date: Tue, 1 Apr 2025 13:43:08 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Pasha Bouzarjomehri <pasha@rivosinc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v10 2/2] riscv: Add runtime constant support
Message-ID: <Z-xP3M7-GSUCHQkb@ghost>
References: <20250319-runtime_const_riscv-v10-0-745b31a11d65@rivosinc.com>
 <20250319-runtime_const_riscv-v10-2-745b31a11d65@rivosinc.com>
 <20250401192833.GA3645424@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250401192833.GA3645424@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_134314_972726_310FCF97 
X-CRM114-Status: GOOD (  20.84  )
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

On Tue, Apr 01, 2025 at 12:28:33PM -0700, Nathan Chancellor wrote:
> Hi Charlie,
> 
> On Wed, Mar 19, 2025 at 11:35:20AM -0700, Charlie Jenkins wrote:
> > Implement the runtime constant infrastructure for riscv. Use this
> > infrastructure to generate constants to be used by the d_hash()
> > function.
> > 
> > This is the riscv variant of commit 94a2bc0f611c ("arm64: add 'runtime
> > constant' support") and commit e3c92e81711d ("runtime constants: add
> > x86 architecture support").
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ...
> > diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> ...
> > +#define RISCV_RUNTIME_CONST_64_ZBA				\
> > +	".option push\n\t"					\
> > +	".option arch,+zba\n\t"					\
> > +	"slli	%[__tmp],%[__tmp],32\n\t"			\
> > +	"add.uw %[__ret],%[__ret],%[__tmp]\n\t"			\
> > +	"nop\n\t"						\
> > +	"nop\n\t"						\
> > +	".option pop\n\t"					\
> ...
> > +#if defined(CONFIG_RISCV_ISA_ZBA) && defined(CONFIG_RISCV_ISA_ZBKB)
> ...
> > +#elif defined(CONFIG_RISCV_ISA_ZBA)
> > +#define runtime_const_ptr(sym)						\
> > +({									\
> > +	typeof(sym) __ret, __tmp;					\
> > +	asm_inline(RISCV_RUNTIME_CONST_64_PREAMBLE			\
> > +		ALTERNATIVE(						\
> > +			RISCV_RUNTIME_CONST_64_BASE,			\
> > +			RISCV_RUNTIME_CONST_64_ZBA,			\
> > +			0, RISCV_ISA_EXT_ZBA, 1				\
> > +		)							\
> > +		RISCV_RUNTIME_CONST_64_POSTAMBLE(sym)			\
> > +		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
> > +	__ret;								\
> > +})
> 
> This breaks the build for clang versions 16 and earlier because they do
> not support '.option arch' and it is used in CONFIG_RISCV_ISA_ZBA, which
> has no dependencies and it is default on.
> 
>   $ make -skj"$(nproc)" ARCH=riscv LLVM=1 mrproper defconfig fs/dcache.o
>   fs/dcache.c:117:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
>           return runtime_const_ptr(dentry_hashtable) +
>                  ^
>   arch/riscv/include/asm/runtime-const.h:103:4: note: expanded from macro 'runtime_const_ptr'
>                           RISCV_RUNTIME_CONST_64_ZBA,                     \
>                           ^
>   arch/riscv/include/asm/runtime-const.h:57:17: note: expanded from macro 'RISCV_RUNTIME_CONST_64_ZBA'
>           ".option push\n\t"                                      \
>                          ^
>   <inline asm>:32:10: note: instantiated into assembly here
>           .option arch,+zba
>                   ^
>   fs/dcache.c:117:9: error: instruction requires the following: 'Zba' (Address Generation Instructions)
>           return runtime_const_ptr(dentry_hashtable) +
>                  ^
>   arch/riscv/include/asm/runtime-const.h:103:4: note: expanded from macro 'runtime_const_ptr'
>                           RISCV_RUNTIME_CONST_64_ZBA,                     \
>                           ^
>   arch/riscv/include/asm/runtime-const.h:59:30: note: expanded from macro 'RISCV_RUNTIME_CONST_64_ZBA'
>           "slli   %[__tmp],%[__tmp],32\n\t"                       \
>                                         ^
>   <inline asm>:34:2: note: instantiated into assembly here
>           add.uw a2,a2,a3
>           ^
>   ...
> 
>   $ rg 'OPTION_ARCH|ZBA' .config
>   364:CONFIG_RISCV_ISA_ZBA=y
> 
> Should it grow a dependency on AS_HAS_OPTION_ARCH or should there be a
> different fix?

This should have been fixed by Alex's patch [1]. Zba is in an awkward
state because BPF generates Zba code without the need for toolchain
support.

[1] https://lore.kernel.org/all/20250328115422.253670-1-alexghiti@rivosinc.com/

> 
> Cheers,
> Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
