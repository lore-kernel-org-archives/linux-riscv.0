Return-Path: <SRS0=CXC0=UK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887BAC4321A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 09:45:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 525D020673
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 09:45:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nu0jIrAm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 525D020673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0xyCQryh/yK9OAEEK2T/JboitdCf9SojD/I/WSVR7Q=; b=Nu0jIrAm/zRzmE
	iasIMLcZkiYlWGWpeAGZK1tO1kS0YhYxzo5TQYbBOgHLzbzfNBvHLMnVd3k+7IXZBSASavlPlbRXY
	fwNMXIaBx5UpEixKnRo9+mZW3uh3Ny5K/L+esIeZ2dAYJQbeMujLIUrpcV4uAyy5CpB68gVELFiSW
	UU7GYSPcHYJlJpRVGELy+8P6qNkC07MkdOBGncexhRcB2pOrXaOOWVR8h14q+nHRMK3uBZRj6sQxT
	X92GJrwuyo8TpQWmdneo41aVQAWyB3TG/qXHxE+t0T8LKk5tSMSbwP9uOlsnL5y3wIBVfjY8Fycl3
	Sra+PSLwLzFlPFGxuneg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hadLj-0006Z1-UX; Tue, 11 Jun 2019 09:45:52 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1hadLS-0006LM-1Y; Tue, 11 Jun 2019 09:45:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2460346;
 Tue, 11 Jun 2019 02:45:33 -0700 (PDT)
Received: from [10.1.29.141] (e121487-lin.cambridge.arm.com [10.1.29.141])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A29323F73C;
 Tue, 11 Jun 2019 02:47:14 -0700 (PDT)
Subject: Re: [PATCH 02/15] binfmt_flat: remove flat_set_persistent
To: Christoph Hellwig <hch@lst.de>, Greg Ungerer <gerg@linux-m68k.org>
References: <20190610212015.9157-1-hch@lst.de>
 <20190610212015.9157-3-hch@lst.de>
From: Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <820932ef-bf45-d670-e9d6-979889d62501@arm.com>
Date: Tue, 11 Jun 2019 10:45:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190610212015.9157-3-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_024534_176760_F47DB993 
X-CRM114-Status: GOOD (  16.88  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 6/10/19 10:20 PM, Christoph Hellwig wrote:
> This helper is a no-op on all architectures, remove it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arm/include/asm/flat.h        | 1 -
>  arch/c6x/include/asm/flat.h        | 1 -
>  arch/h8300/include/asm/flat.h      | 1 -
>  arch/m68k/include/asm/flat.h       | 5 -----
>  arch/microblaze/include/asm/flat.h | 1 -
>  arch/sh/include/asm/flat.h         | 1 -
>  arch/xtensa/include/asm/flat.h     | 1 -
>  fs/binfmt_flat.c                   | 2 --
>  8 files changed, 13 deletions(-)
> 

For ARM bits:

Tested-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


> diff --git a/arch/arm/include/asm/flat.h b/arch/arm/include/asm/flat.h
> index 10cce9ecf151..576241d74704 100644
> --- a/arch/arm/include/asm/flat.h
> +++ b/arch/arm/include/asm/flat.h
> @@ -31,6 +31,5 @@ static inline int flat_put_addr_at_rp(u32 __user *rp, u32 addr, u32 rel)
>  }
>  
>  #define	flat_get_relocate_addr(rel)		(rel)
> -#define	flat_set_persistent(relval, p)		0
>  
>  #endif /* __ARM_FLAT_H__ */
> diff --git a/arch/c6x/include/asm/flat.h b/arch/c6x/include/asm/flat.h
> index ecc6aea6606c..ac87368efad1 100644
> --- a/arch/c6x/include/asm/flat.h
> +++ b/arch/c6x/include/asm/flat.h
> @@ -18,6 +18,5 @@ static inline int flat_put_addr_at_rp(u32 __user *rp, u32 addr, u32 rel)
>  	return 0;
>  }
>  #define flat_get_relocate_addr(rel)			(rel)
> -#define flat_set_persistent(relval, p)			0
>  
>  #endif /* __ASM_C6X_FLAT_H */
> diff --git a/arch/h8300/include/asm/flat.h b/arch/h8300/include/asm/flat.h
> index dcc7775115dd..7ef7eefded3d 100644
> --- a/arch/h8300/include/asm/flat.h
> +++ b/arch/h8300/include/asm/flat.h
> @@ -10,7 +10,6 @@
>  
>  #define	flat_argvp_envp_on_stack()		1
>  #define	flat_old_ram_flag(flags)		1
> -#define	flat_set_persistent(relval, p)		0
>  
>  /*
>   * on the H8 a couple of the relocations have an instruction in the
> diff --git a/arch/m68k/include/asm/flat.h b/arch/m68k/include/asm/flat.h
> index a631caf5e18f..955617bb937b 100644
> --- a/arch/m68k/include/asm/flat.h
> +++ b/arch/m68k/include/asm/flat.h
> @@ -30,11 +30,6 @@ static inline int flat_put_addr_at_rp(u32 __user *rp, u32 addr, u32 rel)
>  }
>  #define	flat_get_relocate_addr(rel)		(rel)
>  
> -static inline int flat_set_persistent(u32 relval, u32 *persistent)
> -{
> -	return 0;
> -}
> -
>  #define FLAT_PLAT_INIT(regs) \
>  	do { \
>  		if (current->mm) \
> diff --git a/arch/microblaze/include/asm/flat.h b/arch/microblaze/include/asm/flat.h
> index 34be5ed011be..846084fa7f04 100644
> --- a/arch/microblaze/include/asm/flat.h
> +++ b/arch/microblaze/include/asm/flat.h
> @@ -15,7 +15,6 @@
>  
>  #define	flat_argvp_envp_on_stack()	0
>  #define	flat_old_ram_flag(flags)	(flags)
> -#define	flat_set_persistent(relval, p)		0
>  
>  /*
>   * Microblaze works a little differently from other arches, because
> diff --git a/arch/sh/include/asm/flat.h b/arch/sh/include/asm/flat.h
> index 8f2929b32f2e..6f3b18679a98 100644
> --- a/arch/sh/include/asm/flat.h
> +++ b/arch/sh/include/asm/flat.h
> @@ -25,7 +25,6 @@ static inline int flat_put_addr_at_rp(u32 __user *rp, u32 addr, u32 rel)
>  	return 0;
>  }
>  #define	flat_get_relocate_addr(rel)		(rel)
> -#define	flat_set_persistent(relval, p)		({ (void)p; 0; })
>  
>  #define FLAT_PLAT_INIT(_r) \
>    do { _r->regs[0]=0; _r->regs[1]=0; _r->regs[2]=0; _r->regs[3]=0; \
> diff --git a/arch/xtensa/include/asm/flat.h b/arch/xtensa/include/asm/flat.h
> index 6ee5a35eb0ec..b1bc0d9a8d4e 100644
> --- a/arch/xtensa/include/asm/flat.h
> +++ b/arch/xtensa/include/asm/flat.h
> @@ -18,6 +18,5 @@ static inline int flat_put_addr_at_rp(u32 __user *rp, u32 addr, u32 rel)
>  	return 0;
>  }
>  #define flat_get_relocate_addr(rel)			(rel)
> -#define flat_set_persistent(relval, p)			0
>  
>  #endif /* __ASM_XTENSA_FLAT_H */
> diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
> index afddea583999..a4c0b245ab1f 100644
> --- a/fs/binfmt_flat.c
> +++ b/fs/binfmt_flat.c
> @@ -787,8 +787,6 @@ static int load_flat_file(struct linux_binprm *bprm,
>  			if (get_user(relval, reloc + i))
>  				return -EFAULT;
>  			relval = ntohl(relval);
> -			if (flat_set_persistent(relval, &persistent))
> -				continue;
>  			addr = flat_get_relocate_addr(relval);
>  			rp = (u32 __user *)calc_reloc(addr, libinfo, id, 1);
>  			if (rp == (u32 __user *)RELOC_FAILED) {
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
