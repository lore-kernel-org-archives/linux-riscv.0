Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE27C61D97
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 23:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMrrPRgi3OaUDRboaI2JJc++zCRDMrosQKXf+vhGcjk=; b=EE78Z7UdnERCD/
	eFuY8TvgGXcXdBwR3gTpPtoeHLCg2ebGk6TN8JOF09BVBRfFFkxxQwwWIQKbAjZDxqsQIJpOcOkAW
	UdzKQ4X2SrS9s4TIKTfvgR13GcFj3GL1dlfc09BmZFDxO4uX+gCHfovXHUZoecQGWpFZ7tQs24s94
	XlQvsNNZ4q38pEdLMy2PYuNs0LBa7rul+2zVN3I3ybiHZtmJ+9mVrzoYUPr7/tWoEld1014KiY68E
	pybKFUv/oHiJC82GTgNPrp7wlzjC16llRG4A8UNIWiX+MJDWD53VdGWg0KNoooIUuHUfp87Shh1do
	Vi5jpq/QkgTSHwsWFDEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5aWU-000IM2-0b;
	Tue, 21 Nov 2023 23:51:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5aWO-000ILH-1W
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 23:51:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BBC2761993;
	Tue, 21 Nov 2023 23:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D1BC433C7;
	Tue, 21 Nov 2023 23:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700610671;
	bh=3dyir6hn+yCj4QQvn9hjT6LOtunjwshoOwuVacKmLPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Viv7M/P9qyRl2VwZUlURi91OfI/4U9msYDGubL5WGF0EsH8lrLL5mLBzZ6NGtsz8o
	 qAe1Cx6Zn20b3qNeSML9ESPa19ZjTNqAhUFQRc29WWBTMHkoaMNqp4dm6bU34MeR98
	 N54rNvtavGdNtCKw9I06lWeDnm3ES/Ly8r8uY22ETe69Nagxnph64vPyauJmyrHBuk
	 Bh9uf0yHvfQGk+jvq3HweYu40XpicTDFszLX1ZTuVjWDhrYr4TFcgfvMuAQ68s1xzC
	 A8dBQkpI/Rrfn3nIhxxF/SQJoptq17e2/Pm+pfc7W9rsDrp72UFaiUATXVXZmj9RM1
	 BeBaMD+UQIC/w==
Date: Tue, 21 Nov 2023 15:51:09 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 00/12] RISC-V: support some cryptography accelerations
Message-ID: <20231121235109.GE2172@sol.localdomain>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230914001144.GA924@sol.localdomain>
 <ZQJdnCwf99Glggin@ghost>
 <3A0F6A71-C521-44A5-A56C-076AF3E13897@gmail.com>
 <DD3113B1-AB9F-4D6D-BD6E-8F75A83DA45D@sifive.com>
 <20231006194741.GA68531@google.com>
 <AB98E114-A8DE-492E-B078-7394EE4FA83E@sifive.com>
 <20231102040333.GC1498@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231102040333.GC1498@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_155115_017212_A263F76B 
X-CRM114-Status: GOOD (  22.18  )
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

On Wed, Nov 01, 2023 at 09:03:33PM -0700, Eric Biggers wrote:
> > 
> > There is no public assembler supports the vector-crypto asm mnemonics.
> > We should still use `opcode` for vector-crypto instructions. But we might
> > use asm for standard rvv parts.
> > In order to reuse the codes in OpenSSL as much as possible,  we still use
> > the `riscv.pm` for all standard rvv and vector-crypto instructions. If the asm
> > mnemonic is still a better approach,  I will `rewrite` all standard rvv parts
> > with asm mnemonics in next patch.
> 
> Tip-of-tree gcc + binutils seems to support them.  Building some of the sample
> code from the riscv-crypto repository:
> 
>     $ riscv64-linux-gnu-as --version
>     GNU assembler (GNU Binutils) 2.41.50.20231021
>     $ riscv64-linux-gnu-gcc --version
>     riscv64-linux-gnu-gcc (GCC) 14.0.0 20231021 (experimental)
>     $ riscv64-linux-gnu-gcc -march=rv64ivzvkned -c riscv-crypto/doc/vector/code-samples/zvkned.s
> 
> And tip-of-tree clang supports them experimentally:
> 
>     $ clang --version
>     clang version 18.0.0 (https://github.com/llvm/llvm-project 30416f39be326b403e19f23da387009736483119)
>     $ clang -menable-experimental-extensions -target riscv64-linux-gnu -march=rv64ivzvkned1 -c riscv-crypto/doc/vector/code-samples/zvkned.s
> 
> It would be nice to use a real assembler, so that people won't have to worry
> about potential mistakes or inconsistencies in the perl-based "assembler".  Also
> keep in mind that if we allow people to compile this code without the real
> assembler support from the beginning, it might end up staying that way for quite
> a while in order to avoid breaking the build for people.
> 
> Ultimately it's up to you though; I think that you and others who have been
> working on RISC-V crypto can make the best decision about what to do here.  I
> also don't want this patchset to be delayed waiting for other projects, so maybe
> that indeed means the perl-based "assembler" needs to be used for now.
> 

Just wanted to bump up this discussion again.  In binutils, the vector crypto
v1.0.0 support was released 4 months ago in 2.41.  See the NEWS file at
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=binutils/NEWS;hb=refs/heads/binutils-2_41-branch

    * The RISC-V port now supports the following new standard extensions:
      - Zicond (conditional zero instructions)
      - Zfa (additional floating-point instructions)
      - Zvbb, Zvbc, Zvkg, Zvkned, Zvknh[ab], Zvksed, Zvksh, Zvkn, Zvknc, Zvkng,
        Zvks, Zvksc, Zvkg, Zvkt (vector crypto instructions)

That's every extension listed in the vector crypto v1.0.0 specification
(https://github.com/riscv/riscv-crypto/releases/download/v1.0.0/riscv-crypto-spec-vector.pdf).

LLVM still has the vector crypto extensions marked as "experimental" extensions.
However, there is an open pull request to mark them non-experimental:
https://github.com/llvm/llvm-project/pull/69000

Could we just go ahead and remove riscv.pm, develop with binutils for now, and
prioritize getting the LLVM support finished?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
