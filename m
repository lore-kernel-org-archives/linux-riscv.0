Return-Path: <SRS0=Ai3O=KJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224F5C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 21:14:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 810296135F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 21:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 810296135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1GRJ+rQ41rHi8Z0rzyNgdWg8f+sMGtTi7S4o+AdGNVU=; b=ePCGrk4O2oGHyKdKU4VKvz07H
	xiTx0a6HQeCvjHMCYnaFkY7iR7zfV3oNZNADom1n5/PIKYuhfr07Z7hxteJ61AD1HRs5SjYYw+TCH
	GVEm5NMaEmvkwkXGqpH3KmqmvmS1mami1am0KubM1Ra7A/TkqKaw4cCj3nPFor3yb/DorPR/rUvMt
	kQuZvKWyvnB6b18fOn4ZCI6CpkG/k8png1SRdw6Dj/09JmoZD1imTrb2CfyBSJIfqp5KMoEP+2NmB
	C0xgRyZ7IwSdHtUtGq/tB5YF9mScITI/TtQ3ROc7k32txby262l5kPrpxT4G8ib9p0MhXXexWHkhn
	s6TjGoyxA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhf8u-00920l-LG; Fri, 14 May 2021 21:14:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhf8t-00920S-8i
 for linux-riscv@desiato.infradead.org; Fri, 14 May 2021 21:14:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=VW7HJuHaDnGpXZOnS7Xj+UiyGJ5ZeAvJxmRsVxNh09I=; b=wzaIRw+bvanrlfFWCho8bcwVLo
 tgp2pilw39x9zYYfuiLVAi/STPyPevdUzQJ7Rat7QlsFKDh3GfjE/XixsW1YDTKt2L6zvgP5iNw+6
 CKCLjlUfRjDYksoesidE2sGahZ9woCd39EBzszH8MJT5iKOU5BFnv/MbLlyRG5kCdaZtJIhhsEt64
 rN+jM2e0L3MKoYFVUxcEXqF6dcgKcH/+OXNfyQUHvk6WX4p8Y1rUJ4+NYTMNLo2cmvpQ5UtXwg6zA
 mg6qiOQllIeaPh4qD7B/C9Ofvg0QKlVFrAJKjZKDPjxuuyuPLSV8aWQe3VE+grczdbU3GZDXUAED2
 3M/oM00w==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhf8q-00CGZy-AU
 for linux-riscv@lists.infradead.org; Fri, 14 May 2021 21:14:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9B0761283;
 Fri, 14 May 2021 21:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621026879;
 bh=uzFNJ8nVxCIFb27F01Z1d2ifb7H+STmvdrNQI/qc8oc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=I8aARS9Ly86DYfDc8vPfvaOnTaJz280wnmJ1xnnbBZvZERk0Yt9ba9CmSBMguakIK
 70GRnpTHNElZGHTJWFfsbFdjlHIW5bFIEOFXLyPTZ1F2r5glZmMhfOaFb60x2mXy+S
 lMRzZB9ZX1gfz+LiUevqgDa+t96/C6V5g7mx03T4UePrbAefFk/zIWjQM40e2wxBAF
 lpkv1w1FtwunGE65aFjwLw27IN6WF6+o8uDYWZrFnmadmtmqg9qSthGtPfS5tUYWui
 l/FzecNd40pOMJB8oq+aRj6rD4xG48mt8FjHzqbtG/1AcAfL5O4g2Rfb1w+M57Q88a
 tvrTuVgsYGPzA==
Subject: Re: [PATCH] riscv: Use -mno-relax when using lld linker
To: Khem Raj <raj.khem@gmail.com>, linux-riscv@lists.infradead.org,
 clang-built-linux@googlegroups.com
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nick Desaulniers <ndesaulniers@google.com>
References: <20210514205643.383422-1-raj.khem@gmail.com>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <bd8ae62f-1ead-2d82-5fdb-87308accc023@kernel.org>
Date: Fri, 14 May 2021 14:14:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210514205643.383422-1-raj.khem@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_141440_414483_C89757F7 
X-CRM114-Status: GOOD (  14.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Khem,

On 5/14/2021 1:56 PM, Khem Raj wrote:
> lld does not implement the RISCV relaxation optimizations like GNU ld
> therefore disable it when building with LLVM=1, Also pass it to
> assembler when using external GNU assembler ( LLVM_IAS != 1 ), this
> ensures that relevant assembler option is also enabled along. if these
> options are not used then we see following relocations in objects
> 
> 0000000000000000 R_RISCV_ALIGN     *ABS*+0x0000000000000002
> 
> These are then rejected by lld
> ld.lld: error: capability.c:(.fixup+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax but the .o is already compiled with -mno-relax
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>

Thank you for the patch! I can build a ARCH=riscv defconfig kernel with 
LLVM=1 now. LLVM_IAS=1 still needs work but we have outstanding issues 
for that:

https://github.com/ClangBuiltLinux/linux/issues/1023
https://github.com/ClangBuiltLinux/linux/issues/1143

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

One comment below though.

> ---
>   arch/riscv/Makefile | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 3eb9590a0775..519f133e0d53 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -38,6 +38,15 @@ else
>   	KBUILD_LDFLAGS += -melf32lriscv
>   endif
>   
> +ifeq ($(LLVM),1)

ifeq ($(CONFIG_LD_IS_LLD),y)

is a better choice so that LD=riscv64-linux-gnu-ld LLVM=1 can still work.

> +	KBUILD_CFLAGS += -mno-relax
> +	KBUILD_AFLAGS += -mno-relax
> +ifneq ($(LLVM_IAS),1)
> +	KBUILD_CFLAGS += -Wa,-mno-relax
> +	KBUILD_AFLAGS += -Wa,-mno-relax
> +endif
> +endif
> +
>   # ISA string setting
>   riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
>   riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
