Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C55CCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 20:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZ+LgtAudo/e5/anb3/IBu+h9at93XwCRpNB+jlJr6o=; b=SSuqAQAE30XvYE
	me4NrLFXeUgYFu1IX99jbhPT6AYidPLUGbJvprB9jcKo74gMz2wH5u9g8L+gSmMW0zp/agxKIg//U
	uk2QyTr/NhINkHF+S2sm714lCmaOK1mh7LE24SO1VCBKZ/AZ3+NhfhbxFLasH5ZBjqgtf+WDL8vpj
	NXA76D+Nda2RhZz8ERCtXM3r5ehi/V4lwP2RiXXFb1qc7cjjG0Kf9ZIl9AE0bh/SHNMCplWONg3Qi
	kOQjajNslH1sfWE78e2Bf0CxAtdbzWcRil+k4j8lmBhMykNyvQBqC7KYX2iitgAIFLargnxgmfnkw
	LKnjeLXruWtx5rIJiDmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEvPR-00000006lE2-3svP;
	Fri, 31 Oct 2025 20:07:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEvPQ-00000006lDw-139S
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 20:07:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1627060235;
	Fri, 31 Oct 2025 20:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC5FC4CEE7;
	Fri, 31 Oct 2025 20:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761941258;
	bh=wQet1zpVA979LHOCAKnvDe4vIz5lgogB/RiA4rvDzcE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eEbaFUePEqsqd1xqvFj6PfHBe6jOCi2lEMdH8TycHl0Q5Auluk8S2lpJXmv9TxFx6
	 NusxPnTpJc0X0f0CeYGgWHWJPP+pm9H5h9r65gPGw/KCR077Hi6MKNwd20DNPMNN6b
	 WeahrAxPZQa10FjP/DdR4c+HK/1h5x2nUAasMuSHcOITJAiV483CzwcXL5NGIqys+P
	 mY145nVNkpzIC2zpwBWy190cfG4RZuldrQmgNpuR1kKC8i8XpoLRbm6nuQrl1TbMCc
	 xrhLxkelxND1eIrhNaB+SV+lyaoUFqxJyBOJ8iEADXR4rSsgSzl+qs3Ga+6/bKM9QS
	 dwrww+Tnxquiw==
Date: Fri, 31 Oct 2025 14:07:32 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>, Andy Chiu <andybnac@gmail.com>
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
    richard.henderson@linaro.org, jim.shu@sifive.com, 
    Andy Chiu <andybnac@gmail.com>, kito.cheng@sifive.com, 
    charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com, 
    cleger@rivosinc.com, alexghiti@rivosinc.com, samitolvanen@google.com, 
    broonie@kernel.org, rick.p.edgecombe@intel.com, 
    rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v22 17/28] riscv/signal: save and restore of shadow stack
 for signal
In-Reply-To: <20251023-v5_user_cfi_series-v22-17-1935270f7636@rivosinc.com>
Message-ID: <a8f469b8-5750-dfec-2390-09bad4515f99@kernel.org>
References: <20251023-v5_user_cfi_series-v22-0-1935270f7636@rivosinc.com> <20251023-v5_user_cfi_series-v22-17-1935270f7636@rivosinc.com>
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

On Thu, 23 Oct 2025, Deepak Gupta via B4 Relay wrote:

> From: Deepak Gupta <debug@rivosinc.com>
> 
> Save shadow stack pointer in sigcontext structure while delivering signal.
> Restore shadow stack pointer from sigcontext on sigreturn.
> 
> As part of save operation, kernel uses `ssamoswap` to save snapshot of
> current shadow stack on shadow stack itself (can be called as a save
> token). During restore on sigreturn, kernel retrieves token from top of
> shadow stack and validates it. This allows that user mode can't arbitrary
> pivot to any shadow stack address without having a token and thus provide
> strong security assurance between signaly delivery and sigreturn window.
> 
> Use ABI compatible way of saving/restoring shadow stack pointer into
> signal stack. This follows what Vector extension, where extra registers
> are placed in a form of extension header + extension body in the stack.
> The extension header indicates the size of the extra architectural
> states plus the size of header itself, and a magic identifier of the
> extension. Then, the extensions body contains the new architectural
> states in the form defined by uapi.
> 
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>

This patch causes some 'checkpatch.pl --strict' messages:

CHECK: Comparison to NULL could be written "!saved_shstk_ptr"
#271: FILE: arch/riscv/kernel/usercfi.c:186:
+	if (saved_shstk_ptr == NULL)

CHECK: Lines should not end with a '('
#300: FILE: arch/riscv/kernel/usercfi.c:215:
+		pr_info_ratelimited(

I've fixed them up here in the event that v22 goes in, but please do the 
same on your side in case a new version is needed.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
