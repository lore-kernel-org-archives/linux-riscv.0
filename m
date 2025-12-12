Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD85D4336E
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 05:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ozXZg7eLpxjLBt3DluRAr4uxaETXuRgc7pvf7Of25c=; b=cZ6sEh3fDrbjNP
	++f5w2e8NrFy4eg/0faXt4B1W4vqxhnRzrnvQvO040mVlyOc7J/DjiACS/0pubYd8aQDxob5YC+G2
	JHocTHt5eaw9OrJzhhT7KsI3lli5Nrv4xAXmdL8vLd7xc29oDJb6mIbRclP7PypSqRWTMk8PCgucT
	JN2dIdXPZ3CAo2ECpE7oIQ3IBBpn45YMyv7FYR5eyJkamF4lc4a3NhAuXzY1I5nRPoKmeSthJYj1v
	G6dYf9DXTKNV7QD44QLV3F+7YdDnEQ4U/ylC58u5BmSxweDADPHyI8JcL6GUHWrLEIDCmfZgFwdGK
	9JcGBNOQB8T/LPOWNYWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTw5n-000000007fz-2VNP;
	Fri, 12 Dec 2025 05:53:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTw5k-000000007fe-23zA
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 05:53:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85EA040ACD;
	Fri, 12 Dec 2025 05:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C7EC16AAE;
	Fri, 12 Dec 2025 05:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765518802;
	bh=hqZiXxUv6smJHZEauESfPalDA9+KANqTpadXMEusfNw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AyO/BSfwTPEnPYiKTNe49XE5ReOcZayLHxn1jhIueisyharCn+IGjtVnILr1TyT4G
	 nKspnHRVYrODD0i8/slxWhZO45GVoryW8+V/nxlc/cl74nTuJRbLhh3ggNHZOEBuYb
	 QDmLjiWrVjXjswh87/9uwuRkEI8eFewPySbNTeNTwGLTcMN1WG3UEMMW4dyWT3R8WC
	 usqvWUjSdiWX6RPs7TcBpBmWUvNqIWTkoQltHM7P5Np0sArdIfW5uDHthsrsmogOdO
	 hIkW5ifAR2CVWEU0QaSLWbDYhAy2B4dDGsH3opzA5PTXmucpnskg1uCN7anY9zjNbX
	 o+vLEGqelWAfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F34E13809A37;
	Fri, 12 Dec 2025 05:50:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v26 00/28] riscv control-flow integrity for usermode
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176551861579.2032148.13920544388182691102.git-patchwork-notify@kernel.org>
Date: Fri, 12 Dec 2025 05:50:15 +0000
References: <20251211-v5_user_cfi_series-v26-0-f0f419e81ac0@rivosinc.com>
In-Reply-To: <20251211-v5_user_cfi_series-v26-0-f0f419e81ac0@rivosinc.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
 lorenzo.stoakes@oracle.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, conor@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 arnd@arndb.de, brauner@kernel.org, peterz@infradead.org, oleg@redhat.com,
 ebiederm@xmission.com, kees@kernel.org, corbet@lwn.net, shuah@kernel.org,
 jannh@google.com, conor+dt@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, lossin@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com,
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org,
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org,
 zong.li@sifive.com, david@redhat.com, andreas.korb@aisec.fraunhofer.de,
 valentin.haudiquet@canonical.com, cmirabil@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_215324_573391_690DC2EF 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
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

Hello:

This series was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Thu, 11 Dec 2025 09:20:33 -0800 you wrote:
> v26: CONFIG_RISCV_USER_CFI depends on CONFIG_MMU (dependency of shadow stack
> on MMU). Used b4 to pick tags, apparantly it messed up some tag picks. Fixing it
> 
> v25: Removal of `riscv_nousercfi` from `cpufeature.c` and instead placing
> it as extern in `usercfi.h` was leading to build error whene cfi config
> is not selected. Placed `riscv_nousercfi` outside cfi config ifdef block
> in `usercfi.h`
> 
> [...]

Here is the summary with links:
  - [v26,01/28] mm: VM_SHADOW_STACK definition for riscv
    https://git.kernel.org/riscv/c/e53803e4a8c5
  - [v26,02/28] dt-bindings: riscv: zicfilp and zicfiss in dt-bindings (extensions.yaml)
    https://git.kernel.org/riscv/c/d6c9672baa77
  - [v26,03/28] riscv: zicfiss / zicfilp enumeration
    (no matching commit)
  - [v26,04/28] riscv: zicfiss / zicfilp extension csr and bit definitions
    (no matching commit)
  - [v26,05/28] riscv: usercfi state for task and save/restore of CSR_SSP on trap entry/exit
    https://git.kernel.org/riscv/c/2acf75f432dc
  - [v26,06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
    https://git.kernel.org/riscv/c/813c549f5b08
  - [v26,07/28] riscv/mm: manufacture shadow stack pte
    https://git.kernel.org/riscv/c/d3cea05f52a7
  - [v26,08/28] riscv/mm: teach pte_mkwrite to manufacture shadow stack PTEs
    https://git.kernel.org/riscv/c/444404ff99bf
  - [v26,09/28] riscv/mm: write protect and shadow stack
    https://git.kernel.org/riscv/c/5da46726825d
  - [v26,10/28] riscv/mm: Implement map_shadow_stack() syscall
    (no matching commit)
  - [v26,11/28] riscv/shstk: If needed allocate a new shadow stack on clone
    (no matching commit)
  - [v26,12/28] riscv: Implements arch agnostic shadow stack prctls
    https://git.kernel.org/riscv/c/46f2da262367
  - [v26,13/28] prctl: arch-agnostic prctl for indirect branch tracking
    https://git.kernel.org/riscv/c/5b23a2d70976
  - [v26,14/28] riscv: Implements arch agnostic indirect branch tracking prctls
    https://git.kernel.org/riscv/c/2b1bd48147c5
  - [v26,15/28] riscv/traps: Introduce software check exception and uprobe handling
    (no matching commit)
  - [v26,16/28] riscv: signal: abstract header saving for setup_sigcontext
    (no matching commit)
  - [v26,17/28] riscv/signal: save and restore of shadow stack for signal
    (no matching commit)
  - [v26,18/28] riscv/kernel: update __show_regs to print shadow stack register
    https://git.kernel.org/riscv/c/35d89b5390a9
  - [v26,19/28] riscv/ptrace: riscv cfi status and state via ptrace and in core files
    (no matching commit)
  - [v26,20/28] riscv/hwprobe: zicfilp / zicfiss enumeration in hwprobe
    (no matching commit)
  - [v26,21/28] riscv: kernel command line option to opt out of user cfi
    (no matching commit)
  - [v26,22/28] riscv: enable kernel access to shadow stack memory via FWFT sbi call
    https://git.kernel.org/riscv/c/ef83c58ab12f
  - [v26,23/28] arch/riscv: compile vdso with landing pad and shadow stack note
    (no matching commit)
  - [v26,24/28] arch/riscv: dual vdso creation logic and select vdso based on hw
    https://git.kernel.org/riscv/c/fbe7823a03f1
  - [v26,25/28] riscv: create a config for shadow stack and landing pad instr support
    (no matching commit)
  - [v26,26/28] riscv: Documentation for landing pad / indirect branch tracking
    (no matching commit)
  - [v26,27/28] riscv: Documentation for shadow stack on riscv
    (no matching commit)
  - [v26,28/28] kselftest/riscv: kselftest for user mode cfi
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
