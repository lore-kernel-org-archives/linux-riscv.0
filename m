Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5469CCA478
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 14:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqvX+H9koP3Z32JSVz6GrQ6YcSsj5GjQ4JYDti9psC8=; b=z7dCSRP58SV51T
	Wlq+UWAI0tp1mU4g/iVVAN9JbFN/gJi/AgsZVL99UYPKVMHWCwCLSd1N9FwWg/yoPoMFsZo9nKb4a
	GSZ2Ix0bLCLzpZbEcTFR+Nn3uuAraQrSnmCLhHRTv1nGSp34bRjlRjS2SdBobIciQEaydZBJ5nsVg
	F6W54Ahc7uggUq/sqM2cwXK6ZioTmie+j+NQbDh5Lj2KLHHdVaF+/K1obWd9qDEpBXtRHX34hGPtk
	MuWYsCQdyzn5sEU+ymHY9WrM7zolRfSrtYavkME+/8SLvlwhoH26hVUgAbmHKUeTXlfYA5T4xim5p
	IlC6zLrOb5ILp18OUfLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwm2W-003bJR-Fb; Thu, 02 Jun 2022 14:43:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwm2S-003bIQ-RI
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 14:43:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 271B1617ED;
	Thu,  2 Jun 2022 14:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA50C385A5;
	Thu,  2 Jun 2022 14:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654180983;
	bh=4kWjTMseHRZBI+DoHWf0Iz0RsrVG0ExhwVphkECDeXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QkYqJ9SfCLMOEcWgp/w59i9xvAktYsHjQg+lErZVTJ2szgYWIO1xjDikg8088WxZF
	 dckdZBFejMjwPzVBMV+Ky0T/shh5Iy0duUpeEcIznP4GT3jnIT+LzymPfm6yCg1uua
	 j2AublGX7CZa4LcjsysfXXNLHaFYFuBsW1yT4NaMy+01pGgh1enqqW1tGY7TctmKFd
	 JdC0wWoqVFhJDl3ipjGcr0Z/zJ3/9O03UjQZgWoJin0SWX3CM/Lh7VxYMRXTEKgUBg
	 svDa5XvlG3ir7+wuVJC7bl1T0XOFzZJrcsAHL3D4R8DRgzeVqeMNDXW9K9k959FOrz
	 xldkhSt08Rt0w==
Date: Thu, 2 Jun 2022 07:43:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Changbin Du <changbin.du@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, changbin.du@gmail.com,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Hui Wang <hw.huiwang@huawei.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: riscv: alternatives: move length validation inside the subsection
Message-ID: <YpjMdVjLzoIoSGz9@dev-arch.thelio-3990X>
References: <20220602112734.it2bzlqaismotjof@M910t>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220602112734.it2bzlqaismotjof@M910t>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_074305_002282_13E60DC6 
X-CRM114-Status: GOOD (  20.12  )
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

On Thu, Jun 02, 2022 at 07:27:34PM +0800, Changbin Du wrote:
> Apply the same fix from commit 966a0acce2fc ("arm64/alternatives: move
> length validation inside the subsection") to riscv.  Due to the one-pass
> design of LLVM's integrated assembler, it can not compute the length of
> instructions if the .org directive is outside of the subsection that these
> instructions are in.
> 
> Here is the build error reported by llvm:
> 
> In file included from ./arch/riscv/include/asm/pgtable.h:108:
> ./arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time absolute expression
>         ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory"));
>         ^
> ./arch/riscv/include/asm/errata_list.h:41:5: note: expanded from macro 'ALT_FLUSH_TLB_PAGE'
> asm(ALTERNATIVE("sfence.vma %0", "sfence.vma", SIFIVE_VENDOR_ID,        \
>     ^
> ./arch/riscv/include/asm/alternative-macros.h:187:2: note: expanded from macro 'ALTERNATIVE'
>         _ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
>         ^
> ./arch/riscv/include/asm/alternative-macros.h:113:2: note: expanded from macro '_ALTERNATIVE_CFG'
>         __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
>         ^
> ./arch/riscv/include/asm/alternative-macros.h:110:2: note: expanded from macro '__ALTERNATIVE_CFG'
>         ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
>         ^
> ./arch/riscv/include/asm/alternative-macros.h:98:3: note: expanded from macro 'ALT_NEW_CONTENT'
>         ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
>          ^
> <inline asm>:25:6: note: instantiated into assembly here
> .org    . - (887b - 886b) + (889b - 888b)
>         ^
> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>

Thanks for the patch! I already sent an equivalent change two weeks ago
as https://lore.kernel.org/20220516214520.3252074-1-nathan@kernel.org/,
which I think is slightly better because it handles the __ASSEMBLY__
version of the macro as well.

Cheers,
Nathan

> ---
>  arch/riscv/include/asm/alternative-macros.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> index e13b1f6bb400..c7d7f1945768 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -94,9 +94,9 @@
>  	new_c "\n"							\
>  	".option pop\n"							\
>  	"889 :\n"							\
> -	".previous\n"							\
>  	".org	. - (887b - 886b) + (889b - 888b)\n"			\
>  	".org	. - (889b - 888b) + (887b - 886b)\n"			\
> +	".previous\n"							\
>  	".endif\n"
>  
>  #define __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, enable)	\
> -- 
> 2.26.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
