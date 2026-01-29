Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7CFD358E4
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 08:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6o1O/XnjATouKPb9K7cbSDQS1btoxLI5+J4PBxHAHA=; b=YawiS8iWn4m37g
	5LIZcIGqDaci7XVN/71gGPHcK0mMyLVRGPN3VM81pHN8V62mAg/TqbernG1x5rbk4fopJED48/fS5
	zQZ+vridOgKVHTb3spV7oz0SB7o+22mNNOIdI/3tKxL41G58LdRSykRmo7KkA68EHZuzKZq3l7z9R
	550U0T8DLPPWZbEZOCdzaM80ayRvBVlGPL7MnDGbTtAUMRGeV2EO0sCfYHZVV12A2bTS1HMzmOMc/
	HEh/GmK9FOTkGmxM8fIycNUz+AmuuQ14gKsNH5jyts+qKBSQDDlDtpDjz9e7QkDfHVJhmPo0Tu16P
	ctextb1BuIBT2NZdfZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNbt-0000000HT2M-26tK;
	Thu, 29 Jan 2026 08:42:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNbs-0000000HT1o-0T9F
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 08:42:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2321160054;
	Thu, 29 Jan 2026 08:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4C1C4CEF7;
	Thu, 29 Jan 2026 08:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769676158;
	bh=9QMEWB+yM4NRpFfl8KXrYJ8s8e6vKN8iej0DvKpGhcU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WPGl94Lhk/NCi3lEfZ8z65ulZBNKDA6CREUcGelyPWHfzLrK37HGMuOwr6ymnAWbq
	 zMZw49VV3aaXfUo4RySMTADkUQE8+HOyxLnDUbS9p1QK1M0ZRy5dZoytzUnUWxQCiV
	 JuT7cNRWclddUiuwl9xVh/+NdZ+rP0tENaakniujZDuQet4Cq/5STEjla2SU6a7q9W
	 IS3R+R9rKQilV6AEDsD1IY1uaYb3R1j1y6rd5wzC3bsdxi84+lYX8JX2lPdhLlHGdW
	 /cUwi/rw/43gTiJJkns0weSNlVwB+8yl7oSzYqr3Zf2SXhbeJgLk9oPQYFHNifZxf3
	 yKjt2ycaK4QFQ==
Date: Thu, 29 Jan 2026 01:42:32 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
    Vlastimil Babka <vbabka@suse.cz>, 
    Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
    Christian Brauner <brauner@kernel.org>, 
    Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
    Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
    Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
    Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
    Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
    Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
    =?ISO-8859-15?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
    Andreas Hindborg <a.hindborg@kernel.org>, 
    Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
    Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
    linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
    linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
    linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
    linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
    richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
    kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
    evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
    samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
    rust-for-linux@vger.kernel.org, Zong Li <zong.li@sifive.com>, 
    Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
    Valentin Haudiquet <valentin.haudiquet@canonical.com>
Subject: Re: [PATCH v26 10/28] riscv/mm: Implement map_shadow_stack()
 syscall
In-Reply-To: <aXfRPJvoSsOW8AwM@debug.ba.rivosinc.com>
Message-ID: <190df1c1-feb2-ae5d-7fdc-dd0c3d780b21@kernel.org>
References: <20251211-v5_user_cfi_series-v26-0-f0f419e81ac0@rivosinc.com> <20251211-v5_user_cfi_series-v26-10-f0f419e81ac0@rivosinc.com> <aXfRPJvoSsOW8AwM@debug.ba.rivosinc.com>
MIME-Version: 1.0
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

Hi, 

On Mon, 26 Jan 2026, Deepak Gupta wrote:

> Can you apply following diff on `allocate_shadow_stack` function in this
> patch.
> This fixes the bug that I earlier mentioned. We shouldn't be returning
> location
> to token and instead return base address of shadow stack. Userspace consumer
> should be determining token location itself. This matches the ABI of other
> arches. Sorry for being late on this.
> 
> diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
> index 27b36034ea85..a8530e6afb1e 100644
> --- a/arch/riscv/kernel/usercfi.c
> +++ b/arch/riscv/kernel/usercfi.c
> @@ -232,7 +232,7 @@ static unsigned long allocate_shadow_stack(unsigned long
> addr, unsigned long siz
>  {
>         int flags = MAP_ANONYMOUS | MAP_PRIVATE;
>         struct mm_struct *mm = current->mm;
> -       unsigned long populate, tok_loc = 0;
> +       unsigned long populate;
> 
>         if (addr)
>                 flags |= MAP_FIXED_NOREPLACE;
> @@ -245,13 +245,11 @@ static unsigned long allocate_shadow_stack(unsigned long
> addr, unsigned long siz
>         if (!set_tok || IS_ERR_VALUE(addr))
>                 goto out;
> 
> -       if (create_rstor_token(addr + token_offset, &tok_loc)) {
> +       if (create_rstor_token(addr + token_offset, NULL)) {
>                 vm_munmap(addr, size);
>                 return -EINVAL;
>         }
> 
> -       addr = tok_loc;
> -
>  out:
>         return addr;
>  }

Thanks, this fix has been rolled into the queued patch.  The Reviewed-by:s 
and Tested-by:s have been dropped.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
