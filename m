Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F87C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Feb 2022 14:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9BP3a1sxFa7DJ1MDJ5FOaEOVBr3kWfsiDdQJ9fdTS8=; b=njSDxcYROHdaPo
	knc4LsApnjVsR0S0FruLxbiNuRvtVoIziLGVpSDtFoRm5e6c2Xo1I387lrg9iPdFZEqRIZWpm4IKd
	JLNgCrw70Zlbfo56xgPRxD0Anmueh8oZCGtdmz35RitRdidmQsTuH9EPvsUoAMYTr9i2TcHa1LUYD
	aZrVkf4azzkn3MQhfQeOFSL2fqvTh2kOfO3zf6q8EKRhu7p94thhF10M7vgEdeCchx6JPalOcbIzb
	SGlaKY3ANhjyCZNOvFh7FVX7tFTZlqcibOfW1Gkr+x6fOXRTskw7jdwWHZXHzDPQPyy/BL0PFAfsH
	yU3DUCGjoqvf7fRLCTUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nItGA-00A1pX-8Q; Sat, 12 Feb 2022 14:20:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nItFy-00A1Yz-36; Sat, 12 Feb 2022 14:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7QnIJw6JxaPkGqXMTz2fgzVx+1VOgBcJilFzsMI0nk0=; b=D//rq9qQ1yPFmlYSJjfJ++UitW
 R94LxHUfU/lsbdZfaToI/2ib1NTyBPeNKo1yFNy2Y1f7kcAqCrAQVaOGZb0nsKkGU9sqUA1+SfsBs
 KyU/D3XEyfxKVQ7mapp2Oe/TT5cgDUaRPhWNav+Be8ZDacTeFQkP1XztQpdM9itfvkHhb5mEmPWO0
 556GGN7mb9mocAJcfJgB8OKFKolIjqv3dMwdMuqanrr1V7ikWk3aYXNZ2jTIgHtC2KwTWoL3vd51B
 TJrrw6fdLn1YJ+hl4nrIVIJ8Z5p/vaFek2FShZlHl1yeexKsqOYealYzAWVuHigBVTsLLwcOjBssJ
 IRhawmdQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57216)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nItCy-0008Cj-25; Sat, 12 Feb 2022 14:17:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nItCk-0004bI-1s; Sat, 12 Feb 2022 14:16:50 +0000
Date: Sat, 12 Feb 2022 14:16:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alex Gaynor <alex.gaynor@gmail.com>, Finn Behrens <me@kloenk.de>,
 Adam Bratschi-Kaye <ark.email@gmail.com>,
 Wedson Almeida Filho <wedsonaf@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Sven Van Asbroeck <thesven73@gmail.com>,
 Gary Guo <gary@garyguo.net>, Boris-Chengbiao Zhou <bobo1239@web.de>,
 Boqun Feng <boqun.feng@gmail.com>, Douglas Su <d0u9.su@outlook.com>,
 Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
 Antonio Terceiro <antonio.terceiro@linaro.org>,
 Daniel Xu <dxu@dxuuu.xyz>, Miguel Cano <macanroj@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 16/20] Kbuild: add Rust support
Message-ID: <YgfBUhYdLXA46kOX@shell.armlinux.org.uk>
References: <20220212130410.6901-1-ojeda@kernel.org>
 <20220212130410.6901-17-ojeda@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220212130410.6901-17-ojeda@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_062010_142581_9749457C 
X-CRM114-Status: GOOD (  13.13  )
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

On Sat, Feb 12, 2022 at 02:03:42PM +0100, Miguel Ojeda wrote:
> +config RUST
> +	bool "Rust support"
> +	depends on RUST_IS_AVAILABLE
> +	depends on ARM64 || CPU_32v6 || CPU_32v6K || (PPC64 && CPU_LITTLE_ENDIAN) || X86_64 || RISCV

Please don't use CPU_32v6* here.

It probably makes more sense to add a symbol "HAVE_RUST" and have the
appropriate architecture Kconfig files select HAVE_RUST.

Does Rust support Thumb on ARMv6 and ARMv7 architectures?

> +	depends on !MODVERSIONS
> +	depends on !GCC_PLUGIN_RANDSTRUCT
> +	select CONSTRUCTORS
> +	default n

Please remove every utterance of "default n" from your patch; n is the
default default which default defaults to, so you don't need to specify
default n to make the option default to n. It will default to n purely
because n is the default when no default is specified.

> +	help
> +	  Enables Rust support in the kernel.
> +
> +	  This allows other Rust-related options, like drivers written in Rust,
> +	  to be selected.

As Rust doesn't support all the architectures that the kernel supports,
Rust must not be used for core infrastructure.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
