Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D200C5AE59
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 21:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uLkRdDAyY8zDzEU4XlVQj788PVY03bdfVDhuU6CUrhI=; b=aiRZ4fas1OSSwi
	bYSadM0L78zDGCnvFXZhNkoQmhK3UCM4mZ/aikPwxMKc3ZfhmNaZTET6qqhwEIwVXtZkyUGseM/mf
	Eix7wIMS0jA+tFnPJjWCq7YtKqD0rB1gDpYpsMTWspqiSpK2RvQYCuMS4YlR+EGm/FKW2AntyruPq
	+bZb30owmp+IVQnrjrdC1wxDiCc86TnrVwKA9a5BGbJ8lVdhNPLNjTYACq4l7CREHJH8iAb/jU7gX
	V6T2gnBPJJ9NSiIdENgPF2lJ70QUy/3JqUiXNUF87sCXMNbxR6N13wU6Ngc6SRLJgNgYqenWcv78k
	pFT1xutrAOIsGaUBD4Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMZYa-0000000BusL-22D5;
	Tue, 03 Jun 2025 21:52:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMZYY-0000000Burz-0HI3
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 21:52:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5C44CA48AA3;
	Tue,  3 Jun 2025 21:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1E3C4CEED;
	Tue,  3 Jun 2025 21:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748987544;
	bh=Hd230v7UYvXFWhsu9Ll50VumM2+7mBmKgU8gOgz4uMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SKNXXsHZZPss1CqcoHEt1E33Ml7MwCPs9Y6UkucIcgHQ8tgfi8hn8A17nNevgaFBb
	 P/nuRMqz2epHfEypVkuLj+B5Y7H2gtJCyh2+pc73HTSruyOOSDDks6wyPTm8vG+Y9B
	 Cze9mj3gQXchkrWY/gVNrB21yNaEx8LRHvzhmfq0Fff9UX88M3o7BtTbq+UzkMPOIX
	 P0URTvafvziugJMadTz5djFv7hqmoD7L+O6ddzdD+26K7mAt/qWl/BNoIMBRL/o67c
	 OkqkndZPea1do65OnYH4SKZieFCklxPLHdzauER6B6I9a4QY8fYdkoqzzEc5lLQv3C
	 QsV8SVA8P/YkQ==
Date: Tue, 3 Jun 2025 14:52:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Fangrui Song <i@maskray.me>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] riscv: vdso: Exclude .rodata from the PT_DYNAMIC segment
Message-ID: <20250603215218.GA3631276@ax162>
References: <20250602-riscv-vdso-v1-1-0620cf63cff0@maskray.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250602-riscv-vdso-v1-1-0620cf63cff0@maskray.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_145226_173794_59F2101C 
X-CRM114-Status: GOOD (  17.99  )
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

On Mon, Jun 02, 2025 at 08:48:44PM -0700, Fangrui Song wrote:
> .rodata is implicitly included in the PT_DYNAMIC segment due to
> inheriting the segment of the preceding .dynamic section (in both GNU ld
> and LLD).  When the .rodata section's size is not a multiple of 16
> bytes on riscv64, llvm-readelf will report a "PT_DYNAMIC dynamic table
> is invalid" warning.  Note: in the presence of the .dynamic section, GNU
> readelf and llvm-readelf's -d option decodes the dynamic section using
> the section.
> 
> This issue arose after commit 8f8c1ff879fab60f80f3a7aec3000f47e5b03ba9
> ("riscv: vdso.lds.S: remove hardcoded 0x800 .text start addr"), which
> placed .rodata directly after .dynamic by removing .eh_frame.
> 
> This patch resolves the implicit inclusion into PT_DYNAMIC by explicitly
> specifying the :text output section phdr.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2093
> Signed-off-by: Fangrui Song <i@maskray.me>

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/riscv/kernel/vdso/vdso.lds.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
> index abc69cda0445b1f500a89b47deefa31349103f08..62e0410f69f09e2bbf27101c000d604193f525cb 100644
> --- a/arch/riscv/kernel/vdso/vdso.lds.S
> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> @@ -30,7 +30,7 @@ SECTIONS
>  		*(.data .data.* .gnu.linkonce.d.*)
>  		*(.dynbss)
>  		*(.bss .bss.* .gnu.linkonce.b.*)
> -	}
> +	}						:text
>  
>  	.note		: { *(.note.*) }		:text	:note
>  
> 
> ---
> base-commit: 1a3f6980889df3fc90ad3e4a525061d2c138adba
> change-id: 20250602-riscv-vdso-13efdee34a24
> 
> Best regards,
> -- 
> Fangrui Song <i@maskray.me>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
