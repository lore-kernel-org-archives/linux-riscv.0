Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32051CAC5AE
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 18:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0waqTD9DpPM4np0qg402Srv6EIoP1EBt8ZMViED0h6s=; b=468YsL0PVy+uajuR/GZVICD7/K
	RlR7RDqcN1ub1UU+VhOld1i/q2CEM+lfc8f2JWTWXf2vJXfAwubz6BAVQ7erLE4vfDUQeWc5EpWtO
	iPT+XyIaKV9MObHIso2/xFO3z3PIIQegG5FFv5eul/hv9sMxfjFFUoNmmGGq5ilPcbS/hu5IHOqtn
	/nKIqIvUJC358/jPmgfbNPy34mcyIBN1huvxUjb0Tmdz2Yn+Fr+wNke+syXnBsk6jup19mKTXhlpU
	nXQnv8RXt6NF7jxQ2mOZz02jxi/0Jf4GRdcCdudKdqOS4QfPKjGGMo0dfkbpnFlYsgOYjXSxZHpk4
	ru7yCq/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1UPe-00000002iKf-38Ie;
	Wed, 24 Sep 2025 18:40:22 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1UPc-00000002iK3-2T2D
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 18:40:22 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-24456ce0b96so1375225ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Sep 2025 11:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1758739219; x=1759344019; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CmJ3vOxzWTYE+jCZQu9PTb3XdXqCFWVRNB5Wst4HaN8=;
        b=Uv4hz2T6pgNwM61jZk8BgjtxNcXEmcmUJbIjHwziVhuw9ZzcPwNZL1Seri2M97hbq5
         PdFU2bXayDgvr70YdnidovAARsFE5lJkVv7H7WPTxkmuG5B/Rv8Hq1U2ZOE89CEZAqaW
         w/TzNIA9p2QF5mMoG25VQBYlF5z9Q4vjwcaQ98k6RDHg8O6hGJVI6FxlWytObTJQlRXz
         xug3f1XMIK//khOyjgi/6EMuyK2Sg/nd4fVDPESozaEXDP0wd4Ds3PIpOple5gwlJXV2
         Eosh/y+onGfJYWPxFfXUtJvmhNUaUtFchUsOok6y5myLtohtJ2rOAAejl3/x87ja5Mf+
         FUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758739219; x=1759344019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmJ3vOxzWTYE+jCZQu9PTb3XdXqCFWVRNB5Wst4HaN8=;
        b=ZWTVL1/RlBKfRwkeBaKDwCy9uUKpepcuCHjj1oq1b5TpKpu8ivD1JNg81WCijrZdE7
         GdDRdBdYRj81YKXUiOI83oc3L96plk3WFLYAeaXL0WswFmp8+l+k4/v+mXrtEqzUAobT
         El6H1pUwMLwnG2UBcPUdw/uJGagpjcPVdXWlopAjlQJyb03uiddjnADZKrc51L/OJWDF
         w8T8gd7YDtU1ZSeg9i2uEuruYnD9wUeIOoqrAK37QbtLobFl0xGlDQ7EV9rP4/MiTugw
         IIgxyNOgRgg0ya8RXR+3e+6UyVbO0WUSQKu/CO4KNTQmBg8MM0Y6EWzGAsqMik0FNfGY
         BPLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/l2Lu94vF5qsncHCGpyv4vW57pSXqhM+Nr82MQ9XgJ995tKHeHv4Q0gFzLegEQ4Uia0AxoieFSPfQAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc8MYBOOGAhv3sPSH8+XTIR9YpovM+Sh+js5e1AB5FfN2qPHKB
	wlSe/HhB8Tc6xvp61JqPi1dEnwKpkWqPWc46I6bQX8o8HPVx8RC1hovwaP2gslfwTG0=
X-Gm-Gg: ASbGncv9xa4scldRXJRNkZLuq7pY6u+sp0w0KI8IUh9XVBLMTXSAjhFWTKpYe+qvzM6
	OusDBjSe6MQkaRlK6rVyGQu0xNhTtYvhHNdp7be3R/K6Yo0Str4JcF+IZTAC2fFpU42D08QyMDI
	3eCc9HWYc/wcTf6oZV8R15ve3LSzfVy5QTLsA51Gusu9OuL1iDa/iKE5DfSGvaW6ckkMjTcBuoB
	8EILmfi2U/iHcU1h/P7AUDCAQCejaySr7LfDzafj1hbvgfBbX/FMVWhLnwRwAMO8xlHuor7v5i6
	LscxRe/mX+CeJ3c8rz6tF131HpyC9G57NMaJ+jS0DmryHHb3pCacX1JLWFXeHTFjb76DCmSAZ6w
	SssjuoLtO/GobKLH9tMw0byH0a3W+lJ4H
X-Google-Smtp-Source: AGHT+IGXuHXHBWPf+oE+Ln4Jp/4CaKr0teMjK8nrYhSg666HYgvhIXatAPi5gWQsQGiN1OujHcfx1A==
X-Received: by 2002:a17:902:e790:b0:24b:270e:56d4 with SMTP id d9443c01a7336-27ed4c67b42mr6992845ad.4.1758739219414;
        Wed, 24 Sep 2025 11:40:19 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698035ddcasm198787335ad.142.2025.09.24.11.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:40:18 -0700 (PDT)
Date: Wed, 24 Sep 2025 11:40:15 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Paul Walmsley <pjw@kernel.org>
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
	Andy Chiu <andybnac@gmail.com>, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
	Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Florian Weimer <fweimer@redhat.com>, bharrington@redhat.com,
	Aurelien Jarno <aurel32@debian.org>
Subject: Re: [PATCH v19 00/27] riscv control-flow integrity for usermode
Message-ID: <aNQ7D6_ZYMhCdkmL@debug.ba.rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
 <f953ee7b-91b3-f6f5-6955-b4a138f16dbc@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f953ee7b-91b3-f6f5-6955-b4a138f16dbc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_114020_729695_B5591E6B 
X-CRM114-Status: GOOD (  37.28  )
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

On Wed, Sep 24, 2025 at 08:36:11AM -0600, Paul Walmsley wrote:
>Hi,
>
>On Thu, 31 Jul 2025, Deepak Gupta wrote:
>
>[ ... ]
>
>> vDSO related Opens (in the flux)
>> =================================
>>
>> I am listing these opens for laying out plan and what to expect in future
>> patch sets. And of course for the sake of discussion.
>>
>
>[ ... ]
>
>> How many vDSOs
>> ---------------
>> Shadow stack instructions are carved out of zimop (may be operations) and if CPU
>> doesn't implement zimop, they're illegal instructions. Kernel could be running on
>> a CPU which may or may not implement zimop. And thus kernel will have to carry 2
>> different vDSOs and expose the appropriate one depending on whether CPU implements
>> zimop or not.
>
>If we merge this series without this, then when CFI is enabled in the
>Kconfig, we'll wind up with a non-portable kernel that won't run on older
>hardware.  We go to great lengths to enable kernel binary portability
>across the presence or absence of other RISC-V extensions, and I think
>these CFI extensions should be no different.
>
>So before considering this for merging, I'd like to see at least an
>attempt to implement the dual-vDSO approach (or something equivalent)
>where the same kernel binary with CFI enabled can run on both pre-Zimop
>and post-Zimop hardware, with the existing userspaces that are common
>today.

Added some distro folks in this email chain.

After patchwork meeting today, I wanted to continue discussion here. So thanks
Paul for looking into it and initiating a discussion here.

This patch series has been in the queue for quite a long time and we have had
deliberations on vDSO topic earlier as well and after those deliberations it
was decided to go ahead with merge and it indeed was sent for 6.17 merge
window. Unfortunatley due to other unforeseen reasons, entirety of riscv
changes were not picked. So it's a bit disappointing to see back-paddling on
this topic.

Anyways, we are here. So I'll provide a bit of context for the list about
deliberations and discussions we have been having for so many merge windows.
This so that a holistic discussion can happen on this before we make a
decision.

Issue
======

Instructions in RISC-V shadow stack extension (zicfiss - [1]) are carved out of
"may be ops" aka zimop extension [2]. "may be ops" are illegal on non-RVA23
hardware. This means any existing riscv CPU or future CPU which isn't RVA23
compliant and not implementing zimop will treat these encodings as illegal.

Current kernel patches enable shadow stack and landing pad support for
userspace using config `CONFIG_RISCV_USER_CFI`. If this config is selected then
vDSO that will be exposed to user space will also have shadow stack
instructions in them. Kernel compiled with `CONFIG_RISCV_USER_CFI`, for sake of
this discussion lets call it RVA23 compiled kernel.

Issue that we discussed earlier and even today is "This RVA23 compiled kernel
won't be able to support non-RVA23 userspace on non-RVA23 hardware because".
Please note that issue exists only on non-RVA23 hardware (which is existing
hardware and future hardware which is not implementing zimop). RVA23 compiled
kernel can support any sort of userspace on RVA23 hardware.


Discussion
===========

So the issue is not really shadow stack instructions but rather may be op
instructions in codegen (binaries and vDSO) which aren't hidden behind any
flag (to hide them if hardware doesn't support). And if I can narrow down
further, primary issue we are discussing is that if cfi is enabled during
kernel compile, it is bringing in a piece of code (vDSO) which won't work
on existing hardware. But the counter point is if someone were to deploy
RVA23 compiled kernel on non-RVA23 hardware, they must have compiled
rest of the userspace without shadow stack instructions in them for such
a hardware. And thus at this point they could simply choose *not* to turn on
`CONFIG_RISCV_USER_CFI` when compiling such kernel. It's not that difficult to
do so.

Any distro who is shipping userspace (which all of them are) along with kernel
will not be shipping two different userspaces (one with shadow stack and one
without them). If distro are shipping two different userspaces, then they might
as well ship two different kernels. Tagging some distro folks here to get their
take on shipping different userspace depending on whether hardware is RVA23 or
not. @Heinrich, @Florian, @redbeard and @Aurelien.

Major distro's have already drawn a distinction here that they will drop
support for hardware which isn't RVA23 for the sake of keeping binary
distribution simple.

Only other use case that was discussed of a powerful linux user who just wants
to use a single kernel on all kinds of riscv hardware. I am imagining such a
user knows enough about kernel and if is really dear to them, they can develop
their own patches and send it upstream to support their own usecase and we can
discuss them out. Current patchset don't prevent such a developer to send such
patches upstream.

I heard the argument in meeting today that "Zbb" enabling works similar for
kernel today. I looked at "Zbb" enabling. It's for kernel usage and it's
surgically placed in kernel using asm hidden behind alternatives. vDSO isn't
compiled with Zbb. Shadow stack instructions are part of codegen for C files
compiled into vDSO.

Furthermore,

Kernel control flow integrity will introduce shadow stack instructions all
over the kernel binary. Such kernel won't be deployable on non-RVA23 hardware.
How to deal with this problem for a savvy kernel developer who wants to run
same cfi enabled kernel binary on multiple hardware?

Coming from engineering and hacker point of view, I understand the desire here
but I still see that it's complexity enforced on rest of the kernel from a user
base which anyways can achieve such goals. For majority of usecases, I don't
see a reason to increase complexity in the kernel for build, possibly runtime
patching and thus possibly introduce more issues and errors just for the sake
of a science project.

Being said that, re-iterating that currently default for `CONFIG_RISCV_USER_CFI`
is "n" which means it won't be breaking anything unless a user opts "Y". So even
though I really don't see a reason and usability to have complexity in kernel to
carry multiple vDSOs, current patchsets are not a hinderance for such future
capability (because current default is No) and motivated developer is welcome
to build on top of it. Bottomline is I don't see a reason to block current
patchset from merging in v6.18.


[1] - https://github.com/riscv/riscv-isa-manual/blob/main/src/unpriv-cfi.adoc#shadow-stack-zicfiss
[2] - https://github.com/riscv/riscv-isa-manual/blob/main/src/zimop.adoc

>
>thanks Deepak,
>
>- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
