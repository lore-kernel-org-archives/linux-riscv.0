Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D775CCCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 22:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3cQ/CU2MvJ8IT0hRbCMooLSPFUsErgI7OpD+WAz8iQ=; b=OfN+JlqqYhTgiH
	ZX0BZWn+Z9feaLHiD/9ydbBdXhrQ+bPZjZ/xF3kNSGcE3b2Q10RKSEjBziazdkqYNDniFw+waPNUT
	dqRNlFLCfXSGxVE1yyrv3KQbgTBBWTBN0RUADDIhpE78tI0uTEa/UXLl+1uxJy6SXJjaa9VTkUzjN
	CfVy7O/d+SB8xDuF/BW81CLTrWwaTMSjvmbZ76couL7YE8llzQfFPFK/eYl9Qjjj0zb5MSac5FiFW
	u++fepOAs64DOUUuptfMGg8ustyS7xf5AYd2u2d+KP/dD6NxVF8v57u70t8UCcIUWfS8llzxVlFqG
	yymJX7HN7uF4vXzMASYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vExJx-00000006qjm-3WGp;
	Fri, 31 Oct 2025 22:10:09 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vExJr-00000006qiy-0FlZ;
	Fri, 31 Oct 2025 22:10:03 +0000
Message-ID: <d442965b-8716-4f89-be88-bc62459af712@infradead.org>
Date: Fri, 31 Oct 2025 15:10:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 17/28] riscv/signal: save and restore of shadow stack
 for signal
To: Paul Walmsley <pjw@kernel.org>, Deepak Gupta <debug@rivosinc.com>,
 Andy Chiu <andybnac@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Christian Brauner <brauner@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com,
 kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com,
 evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com,
 samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com,
 rust-for-linux@vger.kernel.org
References: <20251023-v5_user_cfi_series-v22-0-1935270f7636@rivosinc.com>
 <20251023-v5_user_cfi_series-v22-17-1935270f7636@rivosinc.com>
 <a8f469b8-5750-dfec-2390-09bad4515f99@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <a8f469b8-5750-dfec-2390-09bad4515f99@kernel.org>
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



On 10/31/25 1:07 PM, Paul Walmsley wrote:
> On Thu, 23 Oct 2025, Deepak Gupta via B4 Relay wrote:
> 
>> From: Deepak Gupta <debug@rivosinc.com>
>>
>> Save shadow stack pointer in sigcontext structure while delivering signal.
>> Restore shadow stack pointer from sigcontext on sigreturn.
>>

> 
> This patch causes some 'checkpatch.pl --strict' messages:
> 
> CHECK: Comparison to NULL could be written "!saved_shstk_ptr"
> #271: FILE: arch/riscv/kernel/usercfi.c:186:
> +	if (saved_shstk_ptr == NULL)
> 
> CHECK: Lines should not end with a '('
> #300: FILE: arch/riscv/kernel/usercfi.c:215:
> +		pr_info_ratelimited(
> 
> I've fixed them up here in the event that v22 goes in, but please do the 
> same on your side in case a new version is needed.

Hi Paul,

Is checkpatch.pl --strict the norm for arch/riscv/ ?

If there are enough arch/riscv/-specific patch expectations,
maybe they could be documented in Documentation/process/maintainer-riscv.rst
(a new file).

Thanks.
-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
