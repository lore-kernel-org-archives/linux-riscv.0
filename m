Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF1BC4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 23:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPEbZST6TzfA4L8R0zPZTfA2Hnd91vdMYO4k9PzUtzo=; b=ANrwDuIL9Y+1Z0
	xRCV5HToaCus4oKlDzsZ38KXFlR1lYmgbHDoMvqyh2bhJpVY5qcPyKmqmaaOaDZGaBIteT1wNVoxQ
	j2nbT7qO1z4dgeJWXTDfy3UN4tT6J4doj5QkLVibONfC8R0n/sKYznoohD0DNJSTUzGSaqVHTTeiN
	6lVyxL9gvmoxS10zaK/vXOw88VT/+IoGzyhHXCflX54VPlDxNPOrhMPeN1W0tAV04dKA18ByAqvee
	uhmb27ngg94sJknBMWBr7EvQXPp5o1z/M8vjWQ+A2l2969va8Q6es75s9YSE9P5ODCqcWhBJpWkQy
	324Zg+0MeM9syGFODjiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAI6c-005ls6-07;
	Mon, 04 Dec 2023 23:12:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAI6Y-005lrj-2V
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 23:12:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 07AE661338;
	Mon,  4 Dec 2023 23:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B00C433C7;
	Mon,  4 Dec 2023 23:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701731517;
	bh=DVXCZ9jpOAnNg7LJEUeeMDB9ZjLGevPMDsIyu7d5WpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bNvG9d527lXukIxR9+gLXuTRtcZ3LR1hX2B3aNpA7rsRtLbhjqerlUJqsy/CtL3nI
	 DV9uuBfDQGd3TsZ5jgfL9uVmWQ/LEuoIl5Bvi3YFPD6uBoSg2njjtQPrzENhVc0/aL
	 1PYLH1+nRyRY98F5llMANneXs5tqpN/pSD2oWFma3NQYi+LKKL+xqBmzKOeID/JiSh
	 G/Eexl0vTWn7OZdUAlf+F4x58PjrDMnwV60SmD2zzTdiM32tNACPy5C2XJssIetlqM
	 M+u4biG2quLP3Z/9NIBBcJ2VThXSLB8KWbpQoYGT51jEVSQ1qYgDJctD7YlVNd3TiD
	 U3Bz9P6gsHB+g==
Date: Mon, 4 Dec 2023 16:11:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Fangrui Song <maskray@google.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor@kernel.org, ndesaulniers@google.com,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH 2/2] riscv: Restrict DWARF5 when building with LLVM to
 known working versions
Message-ID: <20231204231155.GA3560411@dev-arch.thelio-3990X>
References: <20231129-riscv-restrict-dwarf5-llvm-v1-0-ec0d368fb538@kernel.org>
 <20231129-riscv-restrict-dwarf5-llvm-v1-2-ec0d368fb538@kernel.org>
 <CAFP8O3JscgacLPX-_pc2J0uhqk=ehtxSNStzo7PwewPSuXkxiw@mail.gmail.com>
 <20231201194858.GA290910@dev-arch.thelio-3990X>
 <CAFP8O3+uta+GQO7dpeNLe0OMFnX-tdEyvHREEu1ThjA3nFtTkQ@mail.gmail.com>
 <20231201215021.GA2579712@dev-arch.thelio-3990X>
 <CAFP8O3LJPqPVxcRzi_Qxvu_w8w76BXmfWv8YnsK+bMvqXb701Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFP8O3LJPqPVxcRzi_Qxvu_w8w76BXmfWv8YnsK+bMvqXb701Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_151158_925515_9FDC07E8 
X-CRM114-Status: GOOD (  14.19  )
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

On Fri, Dec 01, 2023 at 08:31:12PM -0800, Fangrui Song wrote:
> Perhaps: Clang generates .uleb128 with label differences for DWARF v5,
> a feature that older binutils ports, utilizing RISC-V style linker
> relaxation, do not support.
> 
> (Signed LEB128 is used by DWARF as well, but it is encoded directly
> into DW_OP_fbreg/DW_LNS_advance_line/etc, and explicit .sleb128
> directives are not emitted)
> (In assemblers, "label difference" is a more common term.)
> (People working on DWARF tend to prefer DWARF v5 to DWARF5, when the
> full "DWARF version 5" feels too verbose.)

Thanks, does this diff seem reasonable to you? I'd like to keep the
issue link as a paper trail and I figured that we might as well make the
configuration name slightly more accurate with that additional
information. I will send it as a separate patch in v2 tomorrow if so in
order to give people a chance to further chime in on the series.

Cheers,
Nathan

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index a0ebce05a368..76c2cc697573 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -231,9 +231,10 @@ config DEBUG_INFO
 	  in the "Debug information" choice below, indicating that debug
 	  information will be generated for build targets.
 
-# Clang is known to generate .{s,u}leb128 with symbol deltas with DWARF5, which
-# some targets may not support: https://sourceware.org/bugzilla/show_bug.cgi?id=27215
-config AS_HAS_NON_CONST_LEB128
+# Clang generates .uleb128 with label differences for DWARF v5, a feature that
+# older binutils ports do not support when utilizing RISC-V style linker
+# relaxation: https://sourceware.org/bugzilla/show_bug.cgi?id=27215
+config AS_HAS_NON_CONST_ULEB128
 	def_bool $(as-instr,.uleb128 .Lexpr_end4 - .Lexpr_start3\n.Lexpr_start3:\n.Lexpr_end4:)
 
 choice
@@ -258,7 +259,7 @@ config DEBUG_INFO_NONE
 config DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
 	bool "Rely on the toolchain's implicit default DWARF version"
 	select DEBUG_INFO
-	depends on !CC_IS_CLANG || AS_IS_LLVM || CLANG_VERSION < 140000 || (AS_IS_GNU && AS_VERSION >= 23502 && AS_HAS_NON_CONST_LEB128)
+	depends on !CC_IS_CLANG || AS_IS_LLVM || CLANG_VERSION < 140000 || (AS_IS_GNU && AS_VERSION >= 23502 && AS_HAS_NON_CONST_ULEB128)
 	help
 	  The implicit default version of DWARF debug info produced by a
 	  toolchain changes over time.
@@ -283,7 +284,7 @@ config DEBUG_INFO_DWARF5
 	bool "Generate DWARF Version 5 debuginfo"
 	select DEBUG_INFO
 	depends on !ARCH_HAS_BROKEN_DWARF5
-	depends on !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502 && AS_HAS_NON_CONST_LEB128)
+	depends on !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502 && AS_HAS_NON_CONST_ULEB128)
 	help
 	  Generate DWARF v5 debug info. Requires binutils 2.35.2, gcc 5.0+ (gcc
 	  5.0+ accepts the -gdwarf-5 flag but only had partial support for some

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
