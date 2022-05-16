Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE29C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 22:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0VqgxkhUipmaA+9Yotop/mj6813W8jEPemQTQVZONM=; b=cLMFAvyeUJZiC5
	gxSkpowVtys9vTh3KdYbp2HMgSy6QLWliAK9WfO64eFEvffTa6FkntbWjlS9fnZUTopT5HaXIESpU
	0bJj9YmK62MD158djh6EiLvFbZHoQDUGaZYeI1vbyHp5F8toZ3gld7UU9cE4bQ6bn02EBns531ku2
	v04hHLgv5mltJIMUTtA5a2yxlq7vOhXR5PGsi7AZm/spW5t+QZ3f6iyESPC9wxDFG+inimCYT9yhE
	XsocP8z/YdlU5hh3ASj3IBaJ2ZK4V83mjVtAWlztT6oVOwgaA2fUZ1AdArD2gnsDqTdQq720/gOYE
	09lfODHbzuM2XM53YSNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqjMK-00AUqf-Qx; Mon, 16 May 2022 22:38:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqjMH-00AUpr-IF
 for linux-riscv@lists.infradead.org; Mon, 16 May 2022 22:38:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 72AFEB81680;
 Mon, 16 May 2022 22:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D5B1C385B8;
 Mon, 16 May 2022 22:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652740708;
 bh=in1Km6RSLomipU4gTgXzsU0c+0UDtzLUVm/5QFxXPAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q44gTyJitNhYGT9BlIj0tHJ0AOrWd2jqV2H4o5SUez1iPGy874golGzim6ifaqXv+
 d6Cc3ob6UDv9GTtQgPI3epkH5Jqg38BCcMzM+wYGEglRk8al8id+Mzm3EaVzhO7v4D
 UIcR5nj/qqVGmAngKpjx3hKiOv87aIZTroYai92stRrITsuWgGoke2m+M6fse4iMlC
 Ud5PSYy5Ue9h2Fbc16jMRwa0mBA/mFPA3QWJUTD2InbZ2cNzqXQAw61gHobcCnaVHO
 zXmt3WrStPg3aQPQuUosI29qbOzoWec1D916+VMbK0GJ8QMwzu9wf5xsm1MOtRHqwN
 MmN+NzdlMPC6A==
Date: Mon, 16 May 2022 15:38:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nick Desaulniers <ndesaulniers@google.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, patches@lists.linux.dev,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: Move alternative length validation into subsection
Message-ID: <YoLSYSmLV0+7Pcqa@dev-arch.thelio-3990X>
References: <20220516214520.3252074-1-nathan@kernel.org>
 <2827138.e9J7NaK4W3@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2827138.e9J7NaK4W3@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_153833_925531_BD032292 
X-CRM114-Status: GOOD (  31.67  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Heiko,

On Mon, May 16, 2022 at 11:55:47PM +0200, Heiko St=FCbner wrote:
> Hi,
> =

> Am Montag, 16. Mai 2022, 23:45:21 CEST schrieb Nathan Chancellor:
> > After commit 49b290e430d3 ("riscv: prevent compressed instructions in
> > alternatives"), builds with LLVM's integrated assembler fail:
> =

> the commit in question didn't change anything there, so I guess
> the issue itself was present before that already and the
> commit only triggered the different buildbots?

Sort of. I am not super knowledgeable on the internals of LLVM's
integrated assembler but as far as I understand it, the use of the
'.option' directive creates a new fragment within this subsection, which
messes up the integrated assembler's ability to resolve the differences
between these labels outside of the subsection. Moving the directives
into the subsection allows it to do this. So your patch did not really
do anything wrong, it just exposed existing brittleness (hence why I
did not add a Fixes tag).

> >   In file included from arch/riscv/mm/init.c:10:
> >   In file included from ./include/linux/mm.h:29:
> >   In file included from ./include/linux/pgtable.h:6:
> >   In file included from ./arch/riscv/include/asm/pgtable.h:108:
> >   ./arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-ti=
me absolute expression
> >           ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : =
"r" (addr) : "memory"));
> >           ^
> >   ./arch/riscv/include/asm/errata_list.h:33:5: note: expanded from macr=
o 'ALT_FLUSH_TLB_PAGE'
> >   asm(ALTERNATIVE("sfence.vma %0", "sfence.vma", SIFIVE_VENDOR_ID,     =
   \
> >       ^
> >   ./arch/riscv/include/asm/alternative-macros.h:187:2: note: expanded f=
rom macro 'ALTERNATIVE'
> >           _ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_=
id, CONFIG_k)
> >           ^
> >   ./arch/riscv/include/asm/alternative-macros.h:113:2: note: expanded f=
rom macro '_ALTERNATIVE_CFG'
> >           __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENAB=
LED(CONFIG_k))
> >           ^
> >   ./arch/riscv/include/asm/alternative-macros.h:110:2: note: expanded f=
rom macro '__ALTERNATIVE_CFG'
> >           ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
> >           ^
> >   ./arch/riscv/include/asm/alternative-macros.h:99:3: note: expanded fr=
om macro 'ALT_NEW_CONTENT'
> >           ".org   . - (889b - 888b) + (887b - 886b)\n"                 =
   \
> >            ^
> >   <inline asm>:26:6: note: instantiated into assembly here
> >   .org    . - (889b - 888b) + (887b - 886b)
> >           ^
> > =

> > This error happens because LLVM's integrated assembler has a one-pass
> > design, which means it cannot figure out the instruction lengths when
> > the .org directive is outside of the subsection that contains the
> > instructions, which was changed by the .option directives added by the
> > above change.
> > =

> > Move the .org directives before the .previous directive so that these
> > directives are always within the same subsection, which resolves the
> > failures and does not introduce any new issues with GNU as. This was
> > done for arm64 in commit 966a0acce2fc ("arm64/alternatives: move length
> > validation inside the subsection") and commit 22315a2296f4 ("arm64:
> > alternatives: Move length validation in alternative_{insn, endif}").
> > =

> > While there is no error from the assembly versions of the macro, they
> > appear to have the same problem so just make the same change there as
> > well so that there are no problems in the future.
> > =

> > Link: https://github.com/ClangBuiltLinux/linux/issues/1640
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> =

> In any case, on my svpbmt testcases (qemu + d1-nezha):
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> =

> Thanks for looking into that
> Heiko

Thank you a lot for the quick testing and review!

Cheers,
Nathan

> > ---
> >  arch/riscv/include/asm/alternative-macros.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > =

> > diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/i=
nclude/asm/alternative-macros.h
> > index e13b1f6bb400..ec2f3f1b836f 100644
> > --- a/arch/riscv/include/asm/alternative-macros.h
> > +++ b/arch/riscv/include/asm/alternative-macros.h
> > @@ -27,9 +27,9 @@
> >  	\new_c
> >  	.option pop
> >  889 :
> > -	.previous
> >  	.org    . - (889b - 888b) + (887b - 886b)
> >  	.org    . - (887b - 886b) + (889b - 888b)
> > +	.previous
> >  	.endif
> >  .endm
> >  =

> > @@ -94,9 +94,9 @@
> >  	new_c "\n"							\
> >  	".option pop\n"							\
> >  	"889 :\n"							\
> > -	".previous\n"							\
> >  	".org	. - (887b - 886b) + (889b - 888b)\n"			\
> >  	".org	. - (889b - 888b) + (887b - 886b)\n"			\
> > +	".previous\n"							\
> >  	".endif\n"
> >  =

> >  #define __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, enable)	\
> > =

> > base-commit: 93c0651617a62a69717299f1464dda798af8bebb
> > =

> =

> =

> =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
