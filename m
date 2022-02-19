Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7A2C433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Feb 2022 16:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WF2RcBUY1I8aNGbzRkFI8f2HLr2O2i0IkcyCr1Go/Fo=; b=2q+oL6IxVY+amG
	/Zo46AGi37RbTAzLIEAzPiWujdJCYdFwIZ/ajeP+hOyklJdKtpVHx3ikDMRgZelq6UgSxdHHlrNtS
	kC8kqejqLBVU6GNZb14FmdOeSOE+TRKePl6k4YlywunnUv3FIL3711O/e8yIs0+krZSzn4W67Kgt5
	hrtK1LmvmMk0xFx3cvwVqiKvUUNiyN88dyu0EApgS/4HzLkktiJlpmn7ESVZWKGqSmCdaG3PVlkwZ
	tbsMbpyL062JM8aO0nGN3RIOON3kpxWyrBJRPo0wJu5C4ejva3XQ32wKU/DopP9e104lNOyuH4t5w
	H70cSgsU0MVmMOMLx1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLSrJ-00HL6P-0o; Sat, 19 Feb 2022 16:45:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLSrG-00HL5a-V0
 for linux-riscv@lists.infradead.org; Sat, 19 Feb 2022 16:45:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D1C24B80122;
 Sat, 19 Feb 2022 16:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3589AC004E1;
 Sat, 19 Feb 2022 16:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645289114;
 bh=fFFD3oN5cDl0TnwcVvL6+V1rI+rC3W6wYV3VSS5WoTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SY1E+ESkV+fUwtZzdZf7bHMG4LTNlMvATCd4VfhdPp6PfnmGFEokz24snDZ7vK7ZN
 69Iw+9pl3NtRQ18pzh3kqsuAe+s3A3W/qBAOw/kHJU2XBpsNVvYtOl9Jci8P1S0+rP
 A9pnP7BX2Rw767poeN69xONghRMuaRgjn4dxWgSADCdFH3LVK7sCKzzJbTnC1tqvzy
 ORy0Z7AmR5HVZJlbyw3MZssIoSIoRr9RcOw5Cxm5KTtNBVbPqzqzsznKJa2Aqnwqq4
 hINwwg9iBLIquncP5kuk0nsS3EZiSAu3TRgF8FeiBeNGY6R+uSGI2fBHGxDwN2K2EK
 zARiwFZLUbNHQ==
Date: Sat, 19 Feb 2022 09:45:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Fangrui Song <maskray@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] riscv module: remove (NOLOAD)
Message-ID: <YhEelqnPDr1u4uTD@dev-arch.archlinux-ax161>
References: <20220218082611.396353-1-maskray@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218082611.396353-1-maskray@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_084519_193151_DAF97743 
X-CRM114-Status: GOOD (  20.26  )
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

On Fri, Feb 18, 2022 at 12:26:11AM -0800, Fangrui Song wrote:
> On ELF, (NOLOAD) sets the section type to SHT_NOBITS[1]. It is conceptually
> inappropriate for .plt, .got, and .got.plt sections which are always
> SHT_PROGBITS.
> 
> In GNU ld, if PLT entries are needed, .plt will be SHT_PROGBITS anyway
> and (NOLOAD) will be essentially ignored. In ld.lld, since
> https://reviews.llvm.org/D118840 ("[ELF] Support (TYPE=<value>) to
> customize the output section type"), ld.lld will report a `section type
> mismatch` error. Just remove (NOLOAD) to fix the error.
> 
> [1] https://lld.llvm.org/ELF/linker_script.html As of today, "The
> section should be marked as not loadable" on
> https://sourceware.org/binutils/docs/ld/Output-Section-Type.html is
> outdated for ELF.

Thank you for the patch! As mentioned on the arm64 patch, this needs
your Signed-off-by tag. With that provided:

Cc: stable@vger.kernel.org
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

This needs to go to stable so that older trees with a newer toolchain do
not warn.

> ---
>  arch/riscv/include/asm/module.lds.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/module.lds.h b/arch/riscv/include/asm/module.lds.h
> index 4254ff2ff049..1075beae1ac6 100644
> --- a/arch/riscv/include/asm/module.lds.h
> +++ b/arch/riscv/include/asm/module.lds.h
> @@ -2,8 +2,8 @@
>  /* Copyright (C) 2017 Andes Technology Corporation */
>  #ifdef CONFIG_MODULE_SECTIONS
>  SECTIONS {
> -	.plt (NOLOAD) : { BYTE(0) }
> -	.got (NOLOAD) : { BYTE(0) }
> -	.got.plt (NOLOAD) : { BYTE(0) }
> +	.plt : { BYTE(0) }
> +	.got : { BYTE(0) }
> +	.got.plt : { BYTE(0) }
>  }
>  #endif
> -- 
> 2.35.1.265.g69c8d7142f-goog
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
