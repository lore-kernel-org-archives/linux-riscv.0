Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E869EE4999
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 20:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xcY8o+ed1xPNgqyPc2tpfckXbQIgdy6UiN6+G88divA=; b=jp5DH4s+CBul6U
	eJkP/POZWZst/oFFJj1D8mBaHP3vBDwlUqP1Z1KvAldnYDYzxd6I87u1ioDcsIG6vlb0S/2AYC6C0
	0yUZE+SMnCjJ89MZSUcsXtPyucUlWUqIdhVP8gLaUJ6KYXxEHRt2lLBMENZLzYN1hLZ27FYYAbRjR
	7M32BDIkDnuON18+VbEXEO0Wl44YBm3KqueiRO85nA7GrWSFiVYW2hrA0d3gpEqRt6ozFZYB2yej5
	pPhgsqqls8twUJctG5gHF8gqlLXNFs7392UDImX9CCn0nbf79kmM0dTbWBTyOhkiM7QdQdRhMw1tT
	SVNQjAKRJC9tF7Gc4d8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vafwX-00000005Fo8-1JoU;
	Tue, 30 Dec 2025 20:03:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vafwV-00000005Fnz-27aZ
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 20:03:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8143660052;
	Tue, 30 Dec 2025 20:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB696C4CEFB;
	Tue, 30 Dec 2025 20:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767125022;
	bh=Thx+nORb8zp8PxkWWwnYA4kbyhZZT9wdRf1FYRDT714=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPV7BQumz+Yoo6X42rYr0I+PAAHo4sF19hboFDQbKP/PmVutvZH0Xo0VD+vBYlNRQ
	 b6PzGOceX5aLNWXJL7UfV4dzrUp/sWmIL+s6P5W097LWX+CaIgOBfJrBFjgdmABWEO
	 OCtv1RRKhl+/AO8xJhcnsean1fATa6t9lEOeB0HnQK9HPpk+ge9knBYPM06SdzHIP+
	 +5dlTur+sq2Li8vHqYgy3GFOS5dQO47fXX/Ew8k7/6dr3YJMOmgYSN9+au7FsleZNc
	 LDHRBx13LIZww4IoBuJHYwtMWwQOTC1RPonjo39yvv0wQOVi9z0gVbIOcXMcZg4fBg
	 EEfKz9Vd78JPg==
Date: Tue, 30 Dec 2025 13:03:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexey Gladkov <legion@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Han Gao <gaohan@iscas.ac.cn>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: boot: Always make Image from vmlinux, not
 vmlinux.unstripped
Message-ID: <20251230200336.GA4062669@ax162>
References: <20251230-riscv-vmlinux-not-unstripped-v1-1-15f49df880df@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251230-riscv-vmlinux-not-unstripped-v1-1-15f49df880df@iscas.ac.cn>
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

On Tue, Dec 30, 2025 at 09:39:17PM +0800, Vivian Wang wrote:
> Since commit 4b47a3aefb29 ("kbuild: Restore pattern to avoid stripping
> .rela.dyn from vmlinux") vmlinux has .rel*.dyn preserved. Therefore, use
> vmlinux to produce Image, not vmlinux.unstripped.
> 
> Doing so fixes booting a RELOCATABLE=y Image with kexec. The problem is
> caused by this chain of events:
> 
> - Since commit 3e86e4d74c04 ("kbuild: keep .modinfo section in
>   vmlinux.unstripped"), vmlinux.unstripped gets a .modinfo section.
> - The .modinfo section has SHF_ALLOC, so it ends up in Image, at the end
>   of it.
> - The Image header's image_size field does not expect to include
>   .modinfo and does not account for it, since it should not be in Image.
> - If .modinfo is large enough, the file size of Image ends up larger
>   than image_size, which eventually leads to it failing
>   sanity_check_segment_list().
> 
> Using vmlinux instead of vmlinux.unstripped means that the unexpected
> .modinfo section is gone from Image, fixing the file size problem.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Yes, this seems reasonable. I suspect this could have been done after
commit e9d86b8e17e7 ("scripts: Do not strip .rela.dyn section") in 6.15
since it has the same effect that 4b47a3aefb29 does but there was no
visible problem.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/riscv/boot/Makefile | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
> index bfc3d0b75b9b..5301adf5f3f5 100644
> --- a/arch/riscv/boot/Makefile
> +++ b/arch/riscv/boot/Makefile
> @@ -31,11 +31,7 @@ $(obj)/xipImage: vmlinux FORCE
>  
>  endif
>  
> -ifdef CONFIG_RELOCATABLE
> -$(obj)/Image: vmlinux.unstripped FORCE
> -else
>  $(obj)/Image: vmlinux FORCE
> -endif
>  	$(call if_changed,objcopy)
>  
>  $(obj)/Image.gz: $(obj)/Image FORCE
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251230-riscv-vmlinux-not-unstripped-30ec0c930fd2
> 
> Best regards,
> -- 
> Vivian "dramforever" Wang
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
