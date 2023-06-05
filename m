Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52A5C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kICtzOsC9N/VgaX/rNHgslpW0fhegCvFT/eP0JgS8EU=; b=Boj955zCNfxDLM
	OWTL7eKCLWxFcw8k++Xp5FVgC725C9IqiEtEoDYM26UODOZiRIyznkFo9LlpvNxRG13x5jN0+cfcT
	Ljfy34sQqf4CDFZl6y5yZalEDLIkOXD9U85WVLeQac2hY//yqQlO5W6MEIASO8uN/w05XyLsT4yQv
	m7IK5h8e/zO85P/oUDzjy3KWIDX4vi9MO+LSv/CIWbqM2yGbJMKUNM7lOY6APzVYaMXI3F5/I6kPH
	/X1/h2fJA/y/1k649NmE79XwrOsOdiIOnk8rkHC/bmprawpoIqxsrgXYCysMoTDjHoAR6ALKlz2HF
	Dy5wBymsbOtrUI9XRrOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CRj-00G2UK-1n;
	Mon, 05 Jun 2023 15:48:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CRg-00G2TO-0P;
	Mon, 05 Jun 2023 15:48:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4C63D627DB;
	Mon,  5 Jun 2023 15:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16755C4339E;
	Mon,  5 Jun 2023 15:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685980114;
	bh=A97J27YBgv4Ql05HCnA2rdg2BpQzUVduAdsUbDGi2Wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tgEbGdQzR24RJwd6mGMOLDrzAtRP7mQYZbgK0Z5VjW2fgrxrNFfNnASEPaV31IPSO
	 A+kam/jXYiGu03JN78fa7fhhX8Uiyt5QegP/dI1BKc5NCJuIjlC/b8Fm8Fqtm2pJ0F
	 p62jV9ZjXEuw+DuD+Fgb+Oa7Cd/T6AXg6I+DVURR2g25OwOH9IELRjlKC5dwMR7DUN
	 +YY7tjTIj5EyMKnXIKMgGwFC/Lz84Djk3ZE30YXlelyFZ+QoJuJKsKeRG/6e7lORF7
	 hApa46q42JeRnsKA9QvsND9//uZzZ0PAQO5bou53PJWB/QYkl99Vq/pd9DctUK2/Ba
	 WNtxuL8r0KoyA==
Date: Mon, 5 Jun 2023 08:48:32 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: Re: [PATCH -next v21 23/27] riscv: detect assembler support for
 .option arch
Message-ID: <20230605154832.GA3049210@dev-arch.thelio-3990X>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
 <20230605110724.21391-24-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230605110724.21391-24-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_084836_256782_176EC848 
X-CRM114-Status: GOOD (  23.83  )
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

Hi Andy,

On Mon, Jun 05, 2023 at 11:07:20AM +0000, Andy Chiu wrote:
> Some extensions use .option arch directive to selectively enable certain
> extensions in parts of its assembly code. For example, Zbb uses it to
> inform assmebler to emit bit manipulation instructions. However,
> supporting of this directive only exist on GNU assembler and has not
> landed on clang at the moment, making TOOLCHAIN_HAS_ZBB depend on
> AS_IS_GNU.
> 
> While it is still under review at https://reviews.llvm.org/D123515, the
> upcoming Vector patch also requires this feature in assembler. Thus,
> provide Kconfig AS_HAS_OPTION_ARCH to detect such feature. Then
> TOOLCHAIN_HAS_XXX will be turned on automatically when the feature land.

Just an FYI, this change has landed in LLVM main, so it should be in
LLVM 17 in a few months:

https://github.com/llvm/llvm-project/commit/9e8ed3403c191ab9c4903e8eeb8f732ff8a43cb4

If you have to spin another revision for some reason, consider updating
the Phabricator link to that one, as I expect that link to remain more
stable in the long run over the Phabricator one, as LLVM is planning to
eventually move away from Phabricator to GitHub pull requests. I don't
think this is worth respinning on its own (obviously, heh).

The rest of the change still looks good to me, thanks again for taking
this up.

> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/Kconfig | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 348c0fa1fc8c..1019b519d590 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -262,6 +262,12 @@ config RISCV_DMA_NONCOHERENT
>  config AS_HAS_INSN
>  	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
>  
> +config AS_HAS_OPTION_ARCH
> +	# https://reviews.llvm.org/D123515
> +	def_bool y
> +	depends on $(as-instr, .option arch$(comma) +m)
> +	depends on !$(as-instr, .option arch$(comma) -i)
> +
>  source "arch/riscv/Kconfig.socs"
>  source "arch/riscv/Kconfig.errata"
>  
> @@ -466,7 +472,7 @@ config TOOLCHAIN_HAS_ZBB
>  	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
>  	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
>  	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> -	depends on AS_IS_GNU
> +	depends on AS_HAS_OPTION_ARCH
>  
>  config RISCV_ISA_ZBB
>  	bool "Zbb extension support for bit manipulation instructions"
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
