Return-Path: <SRS0=Ai3O=KJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D43C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 21:41:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 872E9613C5
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 21:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 872E9613C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FheMSeOTdXF0sJ+QCmtP+My/XR4dBFhaF7uspy8hzFU=; b=ZTCAn2UD2XXzWhGm/o1M2sp2a
	hd3kVB1kS4Kqsz+BNK3otckb5KJ75562sUOtYUAatLXjTgcixRYYz11S9WUf9IDA/db7iHqUbMfaz
	Uv/qsLDcNoNWgXFFkQLIHYMHjip+1fQbIjFbjwNGMqvbARkG00by8hfxX+trGcQ8CvRftDpBbMrIF
	RvwXwQ+EGpYaXaay2Q3IrqTl+Qvl2fnP7FXm+QVkHYjJsSkfjuRwMqghEW8msEJPDOktSrHxg0TUi
	h4cgknVohKcb6q/WwagaZSEgstbHY1lSM4EO9JRQnKm4fI1coqyBjgufuxf0zGCYKO8q7TCBiwlT6
	/k/kv3+uQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhfYT-0096N1-TK; Fri, 14 May 2021 21:41:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhfYR-0096Mg-8V
 for linux-riscv@desiato.infradead.org; Fri, 14 May 2021 21:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=otnOA7NzzwDCtVpkO83MvM9Y7K4RzjZhbxLqzjMrMDU=; b=tXO6BUin0f9R4PuvhOlGy0Cszm
 WiifnaIf+kJ0d4WkGIFL3iNC2NTuEsbon62GIrd2qze0sxC8B52TsC3v5Kswf+/AmaXQ4yeetATZ1
 ogBFfv9VHEHhfYPTRO6pak7h1ptwINh9R5Z5mGVHwPym7ky9bbqJ5DZcJZNbQhii87CrLayumQr9R
 UVBshsbnR9RujWbfO99tCRPPIDC90fZ5dqDMiL32NUds2Gw7bgKziiX3tfvcZSyVu90TYfa6VjTXk
 JGwSa7leZPSMx1rdaZcMOB3PyH6a3kRPpGEGNdEp9k0m07aHnrRm/1lCF45qCRPRv9SCoT8Jr/qf3
 uEIP2otw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhfYO-00CHV8-QC
 for linux-riscv@lists.infradead.org; Fri, 14 May 2021 21:41:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF3DA613C5;
 Fri, 14 May 2021 21:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621028464;
 bh=lIJMr83xoZuJ3w/yyzIHSmFWyvpoA8CD6cefe5EzBKY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MwLVGK/axnZXdcBGr4joQY0Wpf7vddRFK3k3H28eS11sPTEFIS9K+SqnA6Q/IqP/P
 nKmH9BNCtn3YR5LU9rlQMfK4Tiflm162afhonXnHaH/qr0EFqmDJ5tdO6Y0LQl+YMa
 Y01tq7fBNPMrCZhKw8P4EpCc2tAk8Fpd+9xFm8cEkhcXV+yqWCVj22CxCihH8uua+j
 tZIc2xH7bTdYhcHxkZ1WrZhTkKACkKD4mRbzX3Up2vrZHBOA966NmTLIL2ov0BJ1+6
 pOHJaj0Eu0ihAyLRL9X7y0c+jNBCZpDMRUNHZ50H2PEeHkbx6TZaKz13l/rARoLovj
 V69JkdYnj11Vw==
Subject: Re: [PATCH v2] riscv: Use -mno-relax when using lld linker
To: Khem Raj <raj.khem@gmail.com>, linux-riscv@lists.infradead.org,
 clang-built-linux@googlegroups.com
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nick Desaulniers <ndesaulniers@google.com>
References: <20210514213741.447088-1-raj.khem@gmail.com>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <49185379-b54e-9b6f-4984-8743e7940ce0@kernel.org>
Date: Fri, 14 May 2021 14:41:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210514213741.447088-1-raj.khem@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_144104_899161_8EAC641D 
X-CRM114-Status: GOOD (  13.68  )
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

On 5/14/2021 2:37 PM, Khem Raj wrote:
> lld does not implement the RISCV relaxation optimizations like GNU ld
> therefore disable it when building with lld, Also pass it to
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

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> v2: Use CONFIG_LD_IS_LLD instead of LLVM check
> 
>   arch/riscv/Makefile | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 3eb9590a0775..4be020695428 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -38,6 +38,15 @@ else
>   	KBUILD_LDFLAGS += -melf32lriscv
>   endif
>   
> +ifeq ($(CONFIG_LD_IS_LLD),y)
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
