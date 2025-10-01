Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51996CAC5B8
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 00:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vT3JJKLjp+8mxFe4zG238oCPoPEK30dXU748mY/NcAg=; b=aF0fZhBXukEYOIQjlyK5NXO5Tj
	kS6FSWX7h0znOuV6sEJTKXhEnYbEHgS5eKjTUUiW421OhhZaxRF1tRU6y3ICrDXopmljrLHj1vwFz
	IxiqyalUyxFAVIna9UdRGXtaUPwuAvO5guTf8YBHbyXq95Mx8Pigz82TPubs6DPJKWK++uDPOePCL
	uX+lgSWKB926C2NszcaQBZyWosTsHDNdqUV30xaa4zr4zmhsUw7PLJJUGh/ZXj4iyqqLgrUZhsVFz
	04+rOeb/TjGRPY2BrOjCcqQpTFiQybzJ+/NpW3FNmCbP9jAzXDgP0fcyzGvXKc5pp/40irqPdmCML
	uSfDC/XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3kTI-00000006QkE-3d7z;
	Wed, 01 Oct 2025 00:13:28 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3kTG-00000006QjO-0jOC
	for linux-riscv@lists.infradead.org;
	Wed, 01 Oct 2025 00:13:27 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so6763721b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Sep 2025 17:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1759277605; x=1759882405; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CUsbmESiNHTapnE6rmxwHkpYC/VK0QzGDUHHcofE4qs=;
        b=NS/V8uNT3EkZSIh/CyER8lhos/F0MUoq9VpuELjVWim5vA5d9eoOL/ezzAr1QBPKsf
         BJW+Rd0BCG9wo0zmgykcme71yWr5g/9bMaApjEfRsuNbKcTlf3JnzXxcVtx6Jc1Dkh9h
         Pd1u0LDHAfU3gsxw4bKg5+kYgkIfbCCwt2v1gOmMnE48IgsLbZRCg3usKLxtM3hqMQqv
         AMG45vReon+Ll6H5T06WYdXYVYSRyHgOOtHw4t0P/l8pWeFwaWr+S3RS2h6OwydxGCUQ
         QZgM2QKiXqzFbazxjWK3ArezOCIooj5MzqZLaGNsdr8GrmvXY5fA+A9vKUvsIE51xuhN
         wunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759277605; x=1759882405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUsbmESiNHTapnE6rmxwHkpYC/VK0QzGDUHHcofE4qs=;
        b=b68J2pp5ABBbNKZuxzbkUTT1oYGkHzGTZh0JuxSb75EU5niQLqsu8Cz85yQN1jZWST
         Dionl8B2/Sh6bbcuCZUWB9Y5BPecw45E1HIYwMcE4ZP9dCk/PoiKaD7592lZliOjJ5Yt
         hfDWnnCsZkwHuTCE/WVKBT6jU/VS6v4JQsuRj8eAQK5HHCNW6jBaEdl1m9mxDq9CkSa1
         +DC5i6a2zY2AKb1NBqUsxbuSzfFNO4mpMyMmhOBcPaB0gaS6p196O95FVdeckVP+g7Um
         NjotpIrxS7H+vL8yQTsQDPtjOUJJDPYW6S3NVmeXf3yQdcAFbFrSoYW86JRyPgbmz1Qa
         8lbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLOE2N39Eg0hCjrEsOi8OYMlc3qLBY6v5YP4YyOXSBdqFP1DN+YpGBtYS97jDw0Q0iy/8T4sTbbKCtEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwD9ORcFskvv+vCJJoN6L8Jgt2ov84kS1AmcY5Ajg92HyJGWWUA
	cxMKtrf/Y1W0BP81KXDTgnDnYxVpk2P65UBtl44N6+Lw+y4hkyJFCCPnIProLu5XZdg=
X-Gm-Gg: ASbGncu11bg91FG2LBh2fbbfL4pFOchQOxlaOtKnxHDjx88Y+M8md5pIOoQBZMNvoyx
	LjrIpQ5ayjlKm9ufzfe3MWyGoBgEIkYNQ4vpfjjYeLnXy5VHgcFzcX2KuKQ7fs6a+iVlx1V86Ae
	75pRXKFTcI/uKhw4AtZkLEP1gJiPlLxKfE//1G7QVG0NhGBUYtxofi4R9E2VaBykwtEjhdNHEZp
	5SLBWNoITb7e3QVRqmq7NjR51CHoWVdPx3o7kT8OVJ0DJDcIX5MZVFctac7LkmtcIdCMQh9OgoO
	Cv+dnP+GbFL/FymLqoqyFxfRRmwsMZQg1rFWexh23vBRycJB4sNI4udprxsEsmNP3UDJ47Sbc0j
	bla7I0q6RG5t0H0sdrX+ZnVxH8HKqab/u7LZinUmPrXh5yf7eQzLBhq7m
X-Google-Smtp-Source: AGHT+IH1ajiur2VZSdi3/i+zRO/0+860zWmY2Oc/Oh+OdPF2Hx4MVy9Glo++QmHnaPr2yVoYd0LYtw==
X-Received: by 2002:a05:6a00:3d51:b0:77f:2f7c:b709 with SMTP id d2e1a72fcca58-78af404c9c4mr1324097b3a.5.1759277605281;
        Tue, 30 Sep 2025 17:13:25 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b64599sm14805168b3a.70.2025.09.30.17.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 17:13:24 -0700 (PDT)
Date: Tue, 30 Sep 2025 17:13:21 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Florian Weimer <fweimer@redhat.com>
Cc: Paul Walmsley <pjw@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
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
	Andy Chiu <andybnac@gmail.com>, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
	Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	bharrington@redhat.com, Aurelien Jarno <aurel32@debian.org>,
	bergner@tenstorrent.com, jeffreyalaw@gmail.com
Subject: Re: [PATCH v19 00/27] riscv control-flow integrity for usermode
Message-ID: <aNxyIeVB8Rjsu6wW@debug.ba.rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
 <f953ee7b-91b3-f6f5-6955-b4a138f16dbc@kernel.org>
 <aNQ7D6_ZYMhCdkmL@debug.ba.rivosinc.com>
 <lhuldlwgpij.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <lhuldlwgpij.fsf@oldenburg.str.redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_171326_222460_6BEBC582 
X-CRM114-Status: GOOD (  26.82  )
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

On Tue, Sep 30, 2025 at 01:15:32PM +0200, Florian Weimer wrote:
>* Deepak Gupta:
>
>> Any distro who is shipping userspace (which all of them are) along
>> with kernel will not be shipping two different userspaces (one with
>> shadow stack and one without them). If distro are shipping two
>> different userspaces, then they might as well ship two different
>> kernels. Tagging some distro folks here to get their take on shipping
>> different userspace depending on whether hardware is RVA23 or
>> not. @Heinrich, @Florian, @redbeard and @Aurelien.
>>
>> Major distro's have already drawn a distinction here that they will drop
>> support for hardware which isn't RVA23 for the sake of keeping binary
>> distribution simple.
>
>The following are just my personal thoughts.
>
>For commercial distributions, I just don't see how things work out if
>you have hardware that costs less than (say) $30 over its lifetime, and
>you want LTS support for 10+ years.  The existing distribution business
>models aren't really compatible with such low per-node costs.  So it
>makes absolute sense for distributions to target more powerful cores,
>and therefore require RVA23.  Nobody is suggesting that mainstream
>distributions should target soft-float, either.
>
>For community distributions, it is a much tougher call.  Obsoleting
>virtually all existing hardware sends a terrible signal to early
>supporters of the architecture.  But given how limited the RISC-V
>baseline ISA is, I'm not sure if there is much of a choice here.  Maybe
>it's possible to soften the blow by committing to (say) two more years
>of baseline ISA support, and then making the switch, assuming that RVA23
>hardware for local installation is widely available by then.

Yes that's totally fine. Distro (community or commercial) get to decide.
They aren't forced to make a decision of RVA23 switch. Question is about
"Once they switch to RVA23 on say release `A`, will they build release `A`
for non-RVA23 as well". 

Once they make a switch, I do not expect the userspace they're building
to be able to run on older hardware because it'll have zimop instruction
in them in epilogue and prologue.

Sure, they can keep supporting older releases, keep building userspace
without cfi/non-rva23 and thus they should be building kernel without
cfi config as well for those releases.

New release (RVA23) isn't expected to run on older hardware. If new userspace
is not going to be able to run on older hardware and new userspace isn't
making an effort to have runtime selection of binaries depending on which
hardware it is running, Is it worth the effort to have two vDSO in kernel
and expose the one depending on which hardware its running? It's just added
complexity for usecase which I don't really see a usecase.

Yes a savvy kernel hacker might have a need where they want to build a kernel
with RVA23 and transport it on all kind of hardware but that's a very corner
use-case. 

At the very least this corner use case shouldn't block these patches from
being taken in 6.18. Current patches don't block such future capability (if any
one feels like this is really needed).

>
>However, my real worry is that in the not-too-distant future, another
>ISA transition will be required after RVA23.  This is not entirely
>hypothetical because RVA23 is still an ISA designed mostly for C (at
>least in the scalar space, I don't know much about the vector side).
>Other architectures carry forward support for efficient overflow
>checking (as required by Ada and some other now less-popular languages,
>and as needed for efficiently implementing fixnums with arbitrary
>precision fallback).  Considering current industry trends, it is not
>inconceivable that these ISA features become important again in the near
>term.
>

I can only be optimistic here and hope that enough ecosystem adoption would
prevent such breaks in transition.

>You can see the effect of native overflow checking support if you look
>at Ada code examples with integer arithmetic.  For example, this:
>
>function Fib (N: Integer) return Integer is
>begin
>   if N <= 1 then
>      return N;
>   else
>      return Fib (N - 1) + Fib (N - 2);
>   end if;
>end;
>
>produces about 370 RISC-V instructions with -gnato, compared to 218
>instructions with -gnato0 and overflow checking disabled (using GCC
>trunk).  For GCC 15, the respective instruction counts are 301 and 258
>for x86-64, and 288 and 244 for AArch64.  RVA23 reduces the instruction
>count with overflow checking to 353.  A further reduction should be
>possible once GCC starts using xnor in its overflow checks, but I expect
>that the overhead from overflow checking will remain high.
>
>Thanks,
>Florian
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
