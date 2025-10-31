Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CB8CCFA02
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 19:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wt5AnGkU+SkM4p+Zz7OjSHtnteHlAd6F5NIqZ1Muvs=; b=2CWWhj2suHj37i
	JA5I5x/eyTG331/Lj/jQQ8QpBLJVWUHvVPy2IvxXHucLYFOTKIyqSnKPQE3Nc5CDt4D87YHvhCcgW
	vq3eAaush+ByRnhHUPrtrq2dYszti3JaA003p7c2Alg68pvIz4HJzsCij4GHiE9BQyzDplLqWupsj
	O+7hLMkItG6RgpVVanfCNDpcQ16mSBRYY/oDsb4itVpaEZHk1A/stek9fmQAVpi/2rVSftdrfnhEf
	Qq6o6q6eF3ZuTWf4Oy98xGQU/HmbxzxnnrgfPSqiU778t6e286blnIM/8R4HN2xbaOyq852pj50ce
	zd+ws5l87+XNJuh14Paw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEuho-00000006hDF-3Fgy;
	Fri, 31 Oct 2025 19:22:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEuhk-00000006hBk-3Z9u
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 19:22:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AC17419AE;
	Fri, 31 Oct 2025 19:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1DEC4CEE7;
	Fri, 31 Oct 2025 19:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761938551;
	bh=aRO45gf5CfHW1/jbUbbLGsRCxWY7tHk3cFfnDvNsB6Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M5HDCi2R/696KAq+LQQDeEnnFTStWNLkXYwKUiU9FxJS0+SMep8pWFlpbWtMhCEDE
	 3IqSttDBCsW639HgoIfXNDa5Rl5R2Eg3DPtIMGmbvxRmY4i0JiGYkRMvEIB/UsEAF/
	 CpSxsd8YDaLo7qB+j1Vd4dXbW9wlxIEkOBpLnql/SBO5QE8BsCAMM0NgYXNNpBc0uG
	 74Srbaun1zMez0S5J737hSGvZAiklmcFqDN9evPXeLKPQOTt4EkImzO1RV9Ab3ErMe
	 U7GPDkqCNG4vnEozILb4d3SSdHavGo7+IHCu1Lfn9KlyQUdgHAk2dJZMnL8zRIQzci
	 moNGNmIxIROuQ==
Date: Fri, 31 Oct 2025 13:22:23 -0600 (MDT)
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
    rust-for-linux@vger.kernel.org, Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v22 03/28] riscv: zicfiss / zicfilp enumeration
In-Reply-To: <20251023-v5_user_cfi_series-v22-3-1d53ce35d8fd@rivosinc.com>
Message-ID: <9230fa65-6b8e-ebf6-f215-b3a3bb7357d9@kernel.org>
References: <20251023-v5_user_cfi_series-v22-0-1d53ce35d8fd@rivosinc.com> <20251023-v5_user_cfi_series-v22-3-1d53ce35d8fd@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_122232_927912_958B4EF7 
X-CRM114-Status: GOOD (  12.74  )
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

On Thu, 23 Oct 2025, Deepak Gupta wrote:

> This patch adds support for detecting zicfiss and zicfilp. zicfiss and
> zicfilp stands for unprivleged integer spec extension for shadow stack
> and branch tracking on indirect branches, respectively.
> 
> This patch looks for zicfiss and zicfilp in device tree and accordinlgy
> lights up bit in cpu feature bitmap. Furthermore this patch adds detection
> utility functions to return whether shadow stack or landing pads are
> supported by cpu.
> 
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>

This patch introduces some 'checkpatch.pl --strict' messages:

CHECK: Alignment should match open parenthesis
#68: FILE: arch/riscv/kernel/cpufeature.c:278:
+static int riscv_cfilp_validate(const struct riscv_isa_ext_data *data,
+			      const unsigned long *isa_bitmap)

CHECK: Alignment should match open parenthesis
#77: FILE: arch/riscv/kernel/cpufeature.c:287:
+static int riscv_cfiss_validate(const struct riscv_isa_ext_data *data,
+			      const unsigned long *isa_bitmap)


I'll fix them up here in the event that v22 goes in, but please do the 
same on your side in case a new version is needed.  


thanks,

- Paul 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
