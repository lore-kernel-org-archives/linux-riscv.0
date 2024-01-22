Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC880C46CD2
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 22:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mnrOoqZYHxdDDglQoH5Yxd2UNF0zkdjPdvtyX/j3h3E=; b=toO1S6Hqw51DJR
	+bdQAv86gEJHPcjRTCel8fAaMbikj4zlMjZo7XrFg4sMJNW8xA5iQZPqeyxnH73GHWGd8lND1i5wk
	neiXEd0I8qU3sJkUhLEwwj2UWJqkAQvf30ULjwxzhDYOcP1AAX1thpDPSZT3Xtk7Fp6h62FYEe4GZ
	mjjOkoovw/WgmdBeeKCNdnHDP/aqaN51Cu7npow39oDOTAaPXXrtgsjAmgyFoJFxwZfTdZ4MTNqmp
	rhpMn/k7NTTIm0xtV1hf3yRYlq8KbVP1UUAv9BlJWmeiv70Z6S6hJWNlM7z16yfPP2+PqVggsy2GZ
	5HTGH7JOi+ENKhHtk+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS2nH-00EHRu-1k;
	Mon, 22 Jan 2024 22:29:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS2nD-00EHR0-35;
	Mon, 22 Jan 2024 22:29:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B6EDF61961;
	Mon, 22 Jan 2024 22:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865A6C433C7;
	Mon, 22 Jan 2024 22:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705962561;
	bh=SzMBFscYInjce3MfAW+sb2rLG2n6/of69bzdv5vOW14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dMchy/Rf9B+AKr9VeXlzlsL6EuRsF8+t4y2i9zArOvInNAcNZGljBYCFS7seY+eOW
	 MvCWiN/QHRKLtotKn2o0Mz9KPjWnSeOzdOFrTNtEzcpFOQF/xt2/l8XSiV4dKKVGvQ
	 XABJJPzpg+A1KzpNUQQ5cDxdfklxdEyLIr+OfFEOjl/YWmJrBRy1+XOX2mLKF6qCW9
	 xQsUl+stWech7RSf7EgwYZYq7l5EPpV5GOsOVe/YmXyqRNAzcCyH/B8F369/SZP2i9
	 ANCDMDIUjAQ9FDQI1WsZ4ft0gO8WJYjbkcf2Swjj9IdItk9WtonCr/P6m5S1qIUBJE
	 J9UVr47FNvYow==
Date: Mon, 22 Jan 2024 15:29:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Andy Chiu <andy.chiu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Nelson Chu <nelson.chu@sifive.com>, linux-riscv@lists.infradead.org,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	Vineet Gupta <vineetg@rivosinc.com>, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, ndesaulniers@google.com, trix@redhat.com
Subject: Re: [PATCH -next v21 23/27] riscv: detect assembler support for
 .option arch
Message-ID: <20240122222918.GA141255@dev-fedora.aadp>
References: <20240121011341.GA97368@sol.localdomain>
 <mhng-e4b5de69-859d-43ea-b35d-b568e6a621ef@palmer-ri-x1c9>
 <CABgGipW0pZCESu7dyiUdta2JtrpeMsJ3EABNjj_0GO9fbbTwQg@mail.gmail.com>
 <20240121181009.GA1469@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240121181009.GA1469@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_142924_064187_3F1EDB93 
X-CRM114-Status: GOOD (  13.91  )
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

On Sun, Jan 21, 2024 at 10:10:09AM -0800, Eric Biggers wrote:
> On Sun, Jan 21, 2024 at 10:32:59PM +0800, Andy Chiu wrote:
> > 
> > Maybe what we really should do is to upgrade the condition check to a
> > one liner shell script and grep if "Warning" is being printed. Sadly
> > this warning is not failing the compilation with -Werror.
> > 
> > I can try forming a patch on this if it feels alright to people.
> 
> What about -Wa,--fatal-warnings ?

I suspect that would work, the following diff appears to work for me
with a version of clang that does and does not support '.option arch',
(although I am not sure if adding -Wa,--fatal-warnings will have any
other consequences):

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bffbd869a068..e3142ce531a0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -315,7 +315,6 @@ config AS_HAS_OPTION_ARCH
 	# https://reviews.llvm.org/D123515
 	def_bool y
 	depends on $(as-instr, .option arch$(comma) +m)
-	depends on !$(as-instr, .option arch$(comma) -i)
 
 source "arch/riscv/Kconfig.socs"
 source "arch/riscv/Kconfig.errata"
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 5a84b6443875..3ee8ecfb8c04 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -33,7 +33,7 @@ ld-option = $(success,$(LD) -v $(1))
 
 # $(as-instr,<instr>)
 # Return y if the assembler supports <instr>, n otherwise
-as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler-with-cpp -o /dev/null -)
+as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -Wa$(comma)--fatal-warnings -c -x assembler-with-cpp -o /dev/null -)
 
 # check if $(CC) and $(LD) exist
 $(error-if,$(failure,command -v $(CC)),C compiler '$(CC)' not found)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
