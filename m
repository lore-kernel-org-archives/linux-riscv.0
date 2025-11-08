Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2753CCF9F8
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Nov 2025 00:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLa6DHBGvSlZPQms/ehKvxJ3/XenABPqkjOHiy4zC5I=; b=C2Mz2+BiTRv85kL6UKx+rK2NQe
	cTFe8oWdXaWJMpDBLI8aE+Z2OISAQern9s/NIIIMeYEEJWfEMW1M9sMWHcFawGlMMukM2thin/l3c
	nCvPA5UOBmpjgV5PSnhyhoSu5K7uIS0QepBfJJHx9g2rHN3YcVXecdpwdlAwhcz7WgBMlAFJCI4TP
	YJ68GGjuZxg8ojD9HQ/BDCqRlLUH5JRmGvtKV6Zcacj+Mr34zrOfxHDIcGKvhaWE7Szk86fQnr/9n
	h2gF1972p9Zr+ASG13XEdl1BUUMbXUsrKZTzWgRyG7JObphrPYvOgPbv+AN+tUFa4nh7Avac0+T5O
	1t1UBLuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHWxb-00000001lGS-39yD;
	Sat, 08 Nov 2025 00:37:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHWxa-00000001lFg-1oaI
	for linux-riscv@lists.infradead.org;
	Sat, 08 Nov 2025 00:37:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B682601D4;
	Sat,  8 Nov 2025 00:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07358C2BCB1;
	Sat,  8 Nov 2025 00:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762562232;
	bh=50HHS0ijG9TAVwMqmB+iIxiQVsMKkOQnCN7kXgu+NYk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oOwHy49FHh4GUcTBUUqVG4b7fTrjc/gMDnEREAAKy1Is+0XVL4NReGf+uUkJ59bJg
	 fawVrgoBcfMlmhIARI1MjLfL9RRYj9hYZJInTMwBtP6S+0zuU+2nXSsjs+3KGKwsYb
	 iBA/z+QqKpmmeSwNbOSZrmAB1njM2zljWehjxLi7jWTi43Qboip9/8488Uu9L/fcgs
	 rPA2VX20pKvIWesjXZZqjVOlaRYWZ04GEWs6imP6Ur3hGeXrw+zv8mgCfTfPZwfFL6
	 e87H+QfWwiXVP7zXUcNkNKqe/8FahpN45AVUuGRoqn6VUSVdgg1n4x5I5c951tncsU
	 /XSUnoAZA8FNw==
Date: Fri, 7 Nov 2025 17:37:08 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, 
    Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
    Andrew Jones <ajones@ventanamicro.com>, 
    Ben Dooks <ben.dooks@codethink.co.uk>, linux-riscv@lists.infradead.org, 
    llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH fixes] riscv: Fix CONFIG_AS_HAS_INSN for new .insn
 usage
In-Reply-To: <20251107-riscv-fix-new-insn-usage-v1-1-9a186c5928a0@kernel.org>
Message-ID: <6668adce-cab2-7f92-5403-723ef8c5ab04@kernel.org>
References: <20251107-riscv-fix-new-insn-usage-v1-1-9a186c5928a0@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1559060956-1762562232=:644284"
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1559060956-1762562232=:644284
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi Nathan,

On Fri, 7 Nov 2025, Nathan Chancellor wrote:

> After commit 44aa25c000b4 ("riscv: asm: use .insn for making custom
> instructions"), builds using LLVM older that 19 or binutils older than
> 2.38 fail with:
> 
>   arch/riscv/include/asm/vdso/processor.h: Assembler messages:
>   arch/riscv/include/asm/vdso/processor.h:27: Error: unrecognized opcode `0x100000f'
>   arch/riscv/include/asm/vdso/processor.h:27: Error: unrecognized opcode `0x100000f'
>   arch/riscv/include/asm/vdso/processor.h:27: Error: unrecognized opcode `0x100000f'
>   arch/riscv/include/asm/vdso/processor.h:27: Error: unrecognized opcode `0x100000f'
>   make[4]: *** [scripts/Makefile.build:287: arch/riscv/kernel/vdso/vgettimeofday.o] Error 1
> 
>   In file included from <built-in>:4:
>   In file included from lib/vdso/gettimeofday.c:6:
>   In file included from include/vdso/datapage.h:21:
>   In file included from include/vdso/processor.h:10:
>   arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
>      23 |         ALT_RISCV_PAUSE();
>         |         ^
>   arch/riscv/include/asm/errata_list.h:47:3: note: expanded from macro 'ALT_RISCV_PAUSE'
>      47 |                 RISCV_PAUSE, /* Original RISC‑V pause insn */ \
>         |                 ^
>   arch/riscv/include/asm/insn-def.h:259:21: note: expanded from macro 'RISCV_PAUSE'
>     259 | #define RISCV_PAUSE     ASM_INSN_I("0x100000f")
>         |                         ^
>   arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
>      16 | #define ASM_INSN_I(__x) ".insn " __x
>         |                          ^
>   <inline asm>:5:7: note: instantiated into assembly here
>       5 | .insn 0x100000f
>         |       ^
> 
> binutils gained support for '.insn <value>' in 2.38 [1] and LLVM gained
> support in 19 [2]. Adjust the test for CONFIG_AS_HAS_INSN to ensure that
> all versions of .insn are supported before being used.
> 
> Fixes: 44aa25c000b4 ("riscv: asm: use .insn for making custom instructions")
> Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=a262b82fdbf4cda3b0648b1adc32245ca3f78b7a [1]
> Link: https://github.com/llvm/llvm-project/commit/2a086dce691e3cc34a2fc27f4fb255bb2cbbfac9 [2]
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>  arch/riscv/Kconfig | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for the fast fix, and sorry for the trouble. 

Clearly we're not doing sufficiently broad build testing here, either 
before branch submission, or on -next.  We'll fix this ASAP on the branch 
submission case, and work on improving -next autobuilds.

Queued for v6.18-rc.


- Paul
--8323329-1559060956-1762562232=:644284
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1559060956-1762562232=:644284--

