Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FF4C636D4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 16:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=va66TEdTvQUlfSoi9Jiqs2gb2W+G+nlHXzlnr38XLFM=; b=ef23oHz6WlkA1Y
	k2Uov3QDGNElFKDjBhIYCoVmr8/UAecBLPzssPuc/CHQHq4vNfbh5dbUZ2u5Gag+b9Vvm4Kb/dUje
	70I3isv+unIvmWZ9GgcG9VSY1F9jeCxUHA85j25cg9iVvvJoHcJNrpXbLMMV54QKjyU+GIHg/lTbP
	PiI/R8pSUggaozENsVr9nxPSuHjtT1HnGuh1v4lKIWKLyoi4mh721MtMOjJdr35eppl/hSQm6ptUQ
	TYB5YpoE6wIol+1N8C+3kBCfbzLdFPgEg197ax25SZbMCEsENlWggr1dzGWG7V5U8P4jnOo6feGLg
	S/VCe8hbVildBAw7bVKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNcZR-00Gfyx-IL; Thu, 02 Feb 2023 16:36:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNcZO-00Gfxb-Af
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 16:36:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2D25661BF3;
	Thu,  2 Feb 2023 16:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1953FC433EF;
	Thu,  2 Feb 2023 16:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675355776;
	bh=JytctRnLlmIQWNjAzhvXjLyHz2fxuSYWfasVqPSiFbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ejpBmvWqofPsVRnlh+Aksey5eg0wIpLSXz9WQMa6HvO4WwE00TY4q0TdohUFhbKab
	 oKmEmhXcTzBaodCHEZGnHj9boK9rd8Pj7y+R3rsgttcy04XdCRNb/rbJ7wWWQOHagG
	 52pAygw16+yZMT3j80dvwTGM24fuQmNQk6q0nCnvhneUwfl5IZi+FXBCAEIqtPG9Vg
	 y6dnsjaherSc173i1mVO+4dtlDacQKVYiv2LYO62l+UQU2rg+RMphek4SlwE3MHh7n
	 DVM+8TngSeFGTNePYBxPART7PWayF4jHNhaCiPvW7NPTBoY8Zh+T96gkMK7zb4QTH3
	 7RxEarDiVsPuw==
Date: Fri, 3 Feb 2023 00:25:41 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dao Lu <daolu@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
Message-ID: <Y9vkBZknfDOHGZzu@xhacker>
References: <20220922060958.44203-1-samuel@sholland.org>
 <167523607081.29266.3967297527966644183.b4-ty@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <167523607081.29266.3967297527966644183.b4-ty@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_083618_442903_EF1E6DE8 
X-CRM114-Status: GOOD (  14.11  )
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

On Tue, Jan 31, 2023 at 11:21:10PM -0800, Palmer Dabbelt wrote:
> On Thu, 22 Sep 2022 01:09:58 -0500, Samuel Holland wrote:
> > commit 8eb060e10185 ("arch/riscv: add Zihintpause support") broke
> > building with CONFIG_CC_OPTIMIZE_FOR_SIZE enabled (gcc 11.1.0):
> > 
> >   CC      arch/riscv/kernel/vdso/vgettimeofday.o
> > In file included from <command-line>:
> > ./arch/riscv/include/asm/jump_label.h: In function 'cpu_relax':
> > ././include/linux/compiler_types.h:285:33: warning: 'asm' operand 0 probably does not match constraints
> >   285 | #define asm_volatile_goto(x...) asm goto(x)
> >       |                                 ^~~
> > ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro 'asm_volatile_goto'
> >    41 |         asm_volatile_goto(
> >       |         ^~~~~~~~~~~~~~~~~
> > ././include/linux/compiler_types.h:285:33: error: impossible constraint in 'asm'
> >   285 | #define asm_volatile_goto(x...) asm goto(x)
> >       |                                 ^~~
> > ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro 'asm_volatile_goto'
> >    41 |         asm_volatile_goto(
> >       |         ^~~~~~~~~~~~~~~~~
> > make[1]: *** [scripts/Makefile.build:249: arch/riscv/kernel/vdso/vgettimeofday.o] Error 1
> > make: *** [arch/riscv/Makefile:128: vdso_prepare] Error 2
> > 
> > [...]
> 
> Applied, thanks!

Hi Palmer,

I assume the build error is already fixed in v6.1 and can't be reproduced.

Thanks
> 
> [1/1] riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>       https://git.kernel.org/palmer/c/3c349eacc559
> 
> Best regards,
> -- 
> Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
