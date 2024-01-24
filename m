Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0E1C47422
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 21:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oUfPu1BGNrs85nskQCvj2R/dUpFTQEgDQ531JIeqYDg=; b=1GtfIkvrmD80jN
	pX9Arm00SvltO1N3XbgvlM+uNJl9aw/I29VO60mqCgVrleI4J+EWYjzoQ/bDPQ0R3dNQazjBWW3Wu
	pN4d2uG1inUVg1xicZN/bIdAF3v04dbGvTAf5AvWFoL81fPo5qTBsJ8IwzceKDuRHBaZMLUerPKXj
	VJ8xJyU079t8NkdlsRee10rwNM/Q0RkkRH1PW/awcPT+QAscvbdWPM9gqaeXlJU4IqVOuCZSrxlBN
	EM8+LH3r17eakA1lfaA80s/Qmexw3aDvIZ3yqWOglqmrlgS6IyVO4X9MmReToC3xx4gLF0cNfmaIG
	ug0fngSpv+aEgv4jOmpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSlGN-005E61-0B;
	Wed, 24 Jan 2024 21:58:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSlGJ-005E57-31;
	Wed, 24 Jan 2024 21:58:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65E0561DB3;
	Wed, 24 Jan 2024 21:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B9AC433F1;
	Wed, 24 Jan 2024 21:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706133502;
	bh=uMwDhQCLwA5wgNwX3/sL+vg/75j1pnH7swf2g38L7iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qwGw/amCMosOG55RuQMEK2Yz0wSPIw1pZbIEsKN9uTeRG3CiSLi52NkdDNFevblHH
	 kTqzMbIWc0xaXGcrM2zXvxo7WUKI/S4ZnGCRs+NkSA1GWFAMQHOfFrWWDITpZf+HDK
	 MRsG7RWYUWalvluSa6ejyoTltRWZMXHqY/WPN9Cw6vUxe1m2eTxDiPQ5qrYNekVGa4
	 tPI2bqHKOGoHYqeCyUaSmDEYc921ME9rPqfrBG5J47YgIJjoBOpQyPsCwLeH1YM5j5
	 RffoC356pdS1+HKCIv9dD/OzOek/qDzhV8UxjgD6XD1LTmUKvVf1iGT1g3s3fyZgW1
	 qbiwiiFW0sZkg==
Date: Wed, 24 Jan 2024 13:58:18 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andy Chiu <andy.chiu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Nelson Chu <nelson.chu@sifive.com>, linux-riscv@lists.infradead.org,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	Vineet Gupta <vineetg@rivosinc.com>, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, ndesaulniers@google.com, trix@redhat.com
Subject: Re: [PATCH -next v21 23/27] riscv: detect assembler support for
 .option arch
Message-ID: <20240124215818.GB1088@sol.localdomain>
References: <20240121011341.GA97368@sol.localdomain>
 <mhng-e4b5de69-859d-43ea-b35d-b568e6a621ef@palmer-ri-x1c9>
 <CABgGipW0pZCESu7dyiUdta2JtrpeMsJ3EABNjj_0GO9fbbTwQg@mail.gmail.com>
 <20240121181009.GA1469@sol.localdomain>
 <20240122222918.GA141255@dev-fedora.aadp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240122222918.GA141255@dev-fedora.aadp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_135824_064088_8AC872D3 
X-CRM114-Status: GOOD (  20.24  )
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

On Mon, Jan 22, 2024 at 03:29:18PM -0700, Nathan Chancellor wrote:
> On Sun, Jan 21, 2024 at 10:10:09AM -0800, Eric Biggers wrote:
> > On Sun, Jan 21, 2024 at 10:32:59PM +0800, Andy Chiu wrote:
> > > 
> > > Maybe what we really should do is to upgrade the condition check to a
> > > one liner shell script and grep if "Warning" is being printed. Sadly
> > > this warning is not failing the compilation with -Werror.
> > > 
> > > I can try forming a patch on this if it feels alright to people.
> > 
> > What about -Wa,--fatal-warnings ?
> 
> I suspect that would work, the following diff appears to work for me
> with a version of clang that does and does not support '.option arch',
> (although I am not sure if adding -Wa,--fatal-warnings will have any
> other consequences):
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index bffbd869a068..e3142ce531a0 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -315,7 +315,6 @@ config AS_HAS_OPTION_ARCH
>  	# https://reviews.llvm.org/D123515
>  	def_bool y
>  	depends on $(as-instr, .option arch$(comma) +m)
> -	depends on !$(as-instr, .option arch$(comma) -i)
>  
>  source "arch/riscv/Kconfig.socs"
>  source "arch/riscv/Kconfig.errata"
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 5a84b6443875..3ee8ecfb8c04 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -33,7 +33,7 @@ ld-option = $(success,$(LD) -v $(1))
>  
>  # $(as-instr,<instr>)
>  # Return y if the assembler supports <instr>, n otherwise
> -as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler-with-cpp -o /dev/null -)
> +as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -Wa$(comma)--fatal-warnings -c -x assembler-with-cpp -o /dev/null -)
>  
>  # check if $(CC) and $(LD) exist
>  $(error-if,$(failure,command -v $(CC)),C compiler '$(CC)' not found)

It looks good to me as long as none of the as-instr users turn out to have any
expected warnings.

Maybe send the change to scripts/Kconfig.include as a separate patch?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
