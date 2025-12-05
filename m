Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC90D339B2
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 18:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnDZ97znEBUzrvXMsBRO0N88iRM/bx4rlcUbkhClgrk=; b=2uGAhQNkSuwnyCpMkOczMTtFX1
	D1ETjHNRTzlvI/UpTXORljbLhMEWXNSX15pfUyZ2ZWWyvVh+3zigLgTBndGdXC1jEA9T9l4BTvztH
	m1KSZ19LGRDxAqw4NPp3aLUysxEE0wshR0hd0i4wjISlSYGCc/kUbAoDKa8w5mVI0lgN6ldrnFylr
	TuOd6eojKSX8WRjPmR73kY9DOkqrRWdRXz0vYRUS5nQuCRaQBzsz1tSsGZFRyJ9R/0kI3ErVYQMb+
	0wpx+4YlxdslONZJBcG5h52DWLCyDgJROkJs/nikAJt+ZYdhBfKADqYdBsZfSUkuHqBemYkPWRcpL
	y9kOU2/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRaTa-00000009ncQ-3osg;
	Fri, 05 Dec 2025 18:24:18 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRaTX-00000009nal-3d8L
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 18:24:17 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-29ba9249e9dso34066135ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Dec 2025 10:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764959055; x=1765563855; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R8W7GJchcQ4zk/poJ1GR6L1BtfcBrmnZJJRAQLqexSM=;
        b=CWJKMuxtZvW1+7pNX/sV0ZoDKCRvMiztvEAVL36h7tq+5M3nyLFbTNBB8znQRaz81A
         xdMZMtQ4GVsNtRcFogHWGtJjYB885NXa6WBSv8qFVlwUDFT4NTB+iUg9kiKCbv+gGvC1
         AmnSUDIvz56IbDfcEQG8iV6thbqtvCvEvZIr6CLCi9OsI9Sq5/ZhfXwn6pfUDoMf2XL9
         oPS9r9WuFz+WIYVuWzFjWJCbkeDGXLg/Bb7qwSGHD97D6d+7iZOt6XdvPKfEyPk5aMui
         tlwNBFtp7B076aMY2+H66Q+9UqP6KidgYbGQApL9WLD79F18VsvJvFS5PAagPhRPAFIf
         bpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959055; x=1765563855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8W7GJchcQ4zk/poJ1GR6L1BtfcBrmnZJJRAQLqexSM=;
        b=iXO3v5UjXPNN12Rl3OascaU+Lcp1u1I65etAcoSTDQTm4OUw5iIm52G+37XP1IsOTK
         eT6+dCj8tWYUauS09Lggi/bnoFaY8QzeVHfCgYrPLbfR7NzYrxdz9GLQHQtFvKDwWM44
         idMua61w7AYjvLxCAsCS4A1Fy3V/QCy4cXH87Q0d4m8RKdyiAfHZ3q8qjAjviDF0Q20S
         Za5IYZWRUZQA2dxvboRYTRc3AHnYvF/zmLTkstqyHfg/ChvVpT1p8f1jIymNfDOEm8xC
         dZMzPVzsfVT0BF8i3e+Q/OaOCGmVO2kJ8XOadbvtxNd1KKbu1olGch24nm39dm2dP+gS
         hv0A==
X-Forwarded-Encrypted: i=1; AJvYcCXKJRKJ/g13/9buR/OFpmAEFJxORAZROCDsyBEDTky2bj1cL6DypYUxJR6C8f5QXhRA+H94pQCYGbv7bg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjtMdWTsZlKUVZapt2RSoD2dUuyOeoKbi7X0BzNojkLffQHA4g
	wBuFouHco9/PizgZ1oJ9/dOHbeqHpYOh2ZX9EloynEcdandaShnmPT3OezJqTpgsniQ=
X-Gm-Gg: ASbGncuMzc+HRRAhnVz+eVf6LRgtvB1SXIMFnnW0/CxhY/8fLoEOnn5bClywz0GLag7
	sMoO/ZdPmFUPsDVXuvk5jt10ckgHcOqOVK4bo22fXKs1xVnUJv3p4/HK/6j+EyqZa1kY82cv6eC
	GTv1UzfZKSg2NPpdvx90SxJmHILGO+LD+hpJlCywOBtI7xTTQ9KOvcIMCHDmEFHW6YDKNGWxBjd
	b5JUZcbMBIhs2LwPgSWX2Bi2YoVJrAGJLiqGsLjgyvEuvvEc8l601Q9OVMkMLf7o0XYpj+Q8yOt
	sTWegiN5amL+7fN+ba8v1BxasWD4dL4qBpcl65dAdVim7NbbCBrxWZnpFRAHP3Kzdf9C/LZsjE1
	n/YaUcI0hW032vKAjhJdaIEO6e42Ah1hhkhuyw/93feYeXsvQTDufkKqsQ1o4npKmUc//YKys0/
	+Prdq0/mHsv/0NHazyDFZe
X-Google-Smtp-Source: AGHT+IHZMCsXUTCjOVQ3AFVu8onlvt7po3LO4OEVVdk3jTNgtLDl44M+FmDz1C3tnLg32Vfv9eEpZQ==
X-Received: by 2002:a17:903:11c8:b0:269:4759:904b with SMTP id d9443c01a7336-29d6848df81mr135161565ad.58.1764959054851;
        Fri, 05 Dec 2025 10:24:14 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4a13d2sm54863235ad.9.2025.12.05.10.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:24:14 -0800 (PST)
Date: Fri, 5 Dec 2025 10:24:11 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Randy Dunlap <rdunlap@infradead.org>
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
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com,
	richard.henderson@linaro.org, jim.shu@sifive.com,
	andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
	atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
	alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
	Zong Li <zong.li@sifive.com>,
	Andreas Korb <andreas.korb@aisec.fraunhofer.de>,
	Valentin Haudiquet <valentin.haudiquet@canonical.com>
Subject: Re: [PATCH v24 25/28] riscv: create a config for shadow stack and
 landing pad instr support
Message-ID: <aTMjS-Ok-DrJJjQY@debug.ba.rivosinc.com>
References: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
 <20251204-v5_user_cfi_series-v24-25-ada7a3ba14dc@rivosinc.com>
 <b5feba48-7e7c-4ab9-a193-072f3980f525@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5feba48-7e7c-4ab9-a193-072f3980f525@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_102416_018787_5F8E1911 
X-CRM114-Status: GOOD (  18.04  )
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

On Thu, Dec 04, 2025 at 02:17:27PM -0800, Randy Dunlap wrote:
>
>
>On 12/4/25 12:04 PM, Deepak Gupta wrote:
>> This patch creates a config for shadow stack support and landing pad instr
>> support. Shadow stack support and landing instr support can be enabled by
>> selecting `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wires
>> up path to enumerate CPU support and if cpu support exists, kernel will
>> support cpu assisted user mode cfi.
>>
>> If CONFIG_RISCV_USER_CFI is selected, select `ARCH_USES_HIGH_VMA_FLAGS`,
>> `ARCH_HAS_USER_SHADOW_STACK` and DYNAMIC_SIGFRAME for riscv.
>>
>> Reviewed-by: Zong Li <zong.li@sifive.com>
>> Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
>> Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  arch/riscv/Kconfig                  | 22 ++++++++++++++++++++++
>>  arch/riscv/configs/hardening.config |  4 ++++
>>  2 files changed, 26 insertions(+)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 0c6038dc5dfd..f5574c6f66d8 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -1146,6 +1146,28 @@ config RANDOMIZE_BASE
>>
>>            If unsure, say N.
>>
>> +config RISCV_USER_CFI
>> +	def_bool y
>> +	bool "riscv userspace control flow integrity"
>> +	depends on 64BIT && \
>> +		$(cc-option,-mabi=lp64 -march=rv64ima_zicfiss_zicfilp -fcf-protection=full)
>> +	depends on RISCV_ALTERNATIVE
>> +	select RISCV_SBI
>> +	select ARCH_HAS_USER_SHADOW_STACK
>> +	select ARCH_USES_HIGH_VMA_FLAGS
>> +	select DYNAMIC_SIGFRAME
>> +	help
>> +	  Provides CPU assisted control flow integrity to userspace tasks.
>
>	           CPU-assisted
>
>> +	  Control flow integrity is provided by implementing shadow stack for
>> +	  backward edge and indirect branch tracking for forward edge in program.
>> +	  Shadow stack protection is a hardware feature that detects function
>> +	  return address corruption. This helps mitigate ROP attacks.
>> +	  Indirect branch tracking enforces that all indirect branches must land
>> +	  on a landing pad instruction else CPU will fault. This mitigates against
>> +	  JOP / COP attacks. Applications must be enabled to use it, and old user-
>> +	  space does not get protection "for free".
>> +	  default y.
>
>	  Default is y if hardware supports it.
>?

No default Y means support is built in the kernel for cfi.
If hardware doesn't support CFI instructions, then kernel will do following

- prctls to manage shadow stack/landing pad enable/disable will fail.
- vDSO will not have shadow stack instructions in it.


>
>> +
>>  endmenu # "Kernel features"
>
>
>-- 
>~Randy
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
