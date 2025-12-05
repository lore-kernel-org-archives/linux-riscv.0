Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F8AD3749B
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 20:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jpl6IjnU79l0dtQBdISeCWj4KS93dQdnZ65IAq7TM0g=; b=p3lH7v8fWZaWqL
	4udOU62r3jukZ9gg2VdmPqR6F1NWBNgyRKb/nlYWm7k9JK6EtYLcktvCCFLsjd1fKXdPkw+fhRqm4
	ie2ubk+KcY99gJp6ooSE0icl0XLh1K/fUY48EtUo8zdliBSFR9FkKbGwjscNVm7vVWNDBQnvBFxwB
	zE26tj18bHW4NWo2cDXVa5i0RjDK4jOkPNd4O1ZC/MRY0rZV2gSpP/R8B9radsFrl171bH3UIEWZz
	oj/5caM5STTHyVt4lPOAelUDYfPoM+7VR06ZavwASgoisdQ7+HWHfBoA5fqGTUUjy+eoKrAlk5YIa
	ZnPr3MOfEnvaOwO9Z+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRcGw-0000000A0ne-1F9W;
	Fri, 05 Dec 2025 20:19:22 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRcGq-0000000A0mX-4BtB
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 20:19:20 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E159140E0218;
	Fri,  5 Dec 2025 20:19:03 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YMkoYSsiYCqw; Fri,  5 Dec 2025 20:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1764965939; bh=+k+j5zpiOXPUaOMclkmVjKztohgymIQPYnO7V/a+C/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bxqGkefiEe2JFBIhARr9tXH5BeezbVW/58uxKq/Tfdv1Y3tcJ64dJ1cdY5nzgOcDx
	 Me/EwWk+UXXs5J5ilfhEsv4wRvMy6BoVgrjCQn7zbTZT2qYHO7fKRxALp2n6Qt5htI
	 gTAQ7c8xibH7fPZ24PWS1/mprjgWrwEhVK5CwZ82QcZ5336mD6SqPK/onz+yTMAXLP
	 Uo4I7c8WqByXwRacksIdRkqnh8YO6p8CMsqM/PCHezHIYa9d4lP93ibGWI3ZNiVxAM
	 mPb8gsmuEss401Wbz/xAbQNSUOuwu1r41oOvGUaV5kZBIn4MHLDAY7CJYqZBL9W3ap
	 laFZ7I+Zcr/T9Q/3ukCSfpG9cZXEK5vOti5wbd4vPFVuUFGTZ5MyID5VShadi3zIRl
	 xGQjT6zxjvwEqh0co2EFJhK3Wd2fCAbzZ0qQWgj1uBN8lkhIN9EAp7ruVUbMpryNy7
	 Jki+8RlqBEddLzRCQhp0Rdzku+HsxukwOUwD/gyU69z3FlEw5ppsXfaJyz+G7RLJzh
	 93hDC8gTmjSc4rYF7NhWhumcNWaQKLgqxtOxNJQCwIdPBsVUgVBY9zZpFZ/dqOCZNB
	 Er3+sydfYNzFkSoqjM9orlD665WhWzJ3uGh+eWKn7Ik+dRECEpFAfI3O1YBJgdo385
	 7MzW5WnEhsH8ZS8oz2Pgz8H4=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id D6DE840E0173;
	Fri,  5 Dec 2025 20:17:54 +0000 (UTC)
Date: Fri, 5 Dec 2025 21:17:47 +0100
From: Borislav Petkov <bp@alien8.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: debug@rivosinc.com, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
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
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
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
	Zong Li <zong.li@sifive.com>, David Hildenbrand <david@redhat.com>,
	Andreas Korb <andreas.korb@aisec.fraunhofer.de>,
	Valentin Haudiquet <valentin.haudiquet@canonical.com>,
	Paul Walmsley <pjw@kernel.org>,
	Charles Mirabile <cmirabil@redhat.com>
Subject: Re: [PATCH v25 00/28] riscv control-flow integrity for usermode
Message-ID: <20251205201747.GAaTM963Zy4gr820KV@fat_crate.local>
References: <20251205-v5_user_cfi_series-v25-0-1a07c0127361@rivosinc.com>
 <d45808b5-44c3-42c6-a54c-3a13606ee39d@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d45808b5-44c3-42c6-a54c-3a13606ee39d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_121918_465972_EF7B90BD 
X-CRM114-Status: GOOD (  13.80  )
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

On Fri, Dec 05, 2025 at 08:32:32PM +0100, Krzysztof Kozlowski wrote:
> On 05/12/2025 19:41, Deepak Gupta via B4 Relay wrote:
> > v25: Removal of `riscv_nousercfi` from `cpufeature.c` and instead placing
> > it as extern in `usercfi.h` was leading to build error whene cfi config
> > is not selected. Placed `riscv_nousercfi` outside cfi config ifdef block
> > in `usercfi.h`
> 
> 
> Please stop. You sent this 28-patch-bomb TWICE to 50 or 60 addresses.
> It's actually merge window so it should wait in the first place, but for
> sure sending it multiple times does not help. Please observe the Linux
> development process.

You can just delete them. I don't know about you but riscv shadow stack is not
something I even pretend to know so it all goes to /dev/null

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
