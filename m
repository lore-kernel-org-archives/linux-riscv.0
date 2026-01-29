Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F2CD46BED
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 01:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/FDsDNVNDLOIh7py65knQ2H44VH883sLA58sd657tk=; b=NSwjruOeNiWW22
	k+wfDlNf6aCyl2hZ+ZN/0GKxPjcIfLqcAlBTRCEHWm23sv4m50J0+Mk6tDdA9lV5S3zGQRlOVq3kF
	cxTyAh6SyfyMqd0Apap3Hn4qv3cV1sE8BiYoQIvFxacz7+iMT34q+3tmB52vlUZ2yZxV1Z3GgHn+N
	EiK/QdzzV/FRdWchs2EbehSN67iHejrt8hxDy+xVZU7JBRXP8uH349Ro56NDi/KItVuXpBffGZJjR
	Lt/wLEevNbUlpklRrl10p3/yqYKDGl2p+WnjcZTPfpBP02Gw859xtUJQeHhCK18rFHsPqH/rtoSee
	e/j7p+fE4TiDdrL/vfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGf2-0000000H2Sb-3oNY;
	Thu, 29 Jan 2026 01:17:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGez-0000000H2RY-2Ka6
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 01:17:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADB646001A;
	Thu, 29 Jan 2026 01:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859BFC4CEF1;
	Thu, 29 Jan 2026 01:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769649444;
	bh=D/IkbJyJ8dzJu/m0Oq7rZy5LRS0CebRGYUjs9pw88Bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kk/2bljfOvlt7Y6FCsrn/g954SLnE/Ew8TaKyl1w6/LHYR4QVD87qS6AoWyA5rpMO
	 TUNxnCCsxqsojp2iYZoeOLETqI6XZpAJ1GfnYseXnNRtoYmScwyXbl28Bj0hirz1kw
	 MdqqwYNcnNfADeTj7vzT3DNJn44iW+rR6dynp1qsYGWYminC3edT88XNu7Rf7JEzwe
	 JaqLPhm1SM8m00w2IRqO3WJTRQ7ULQXHxv9SwVe9764FJ/T8DYia+HHQ2zpGERxzoa
	 zpAGp0SKDd7jMnVcDbKc2CEcea8uXzGMoTvjvgK2Q6bCD4QMhvHtTXP57iOm43Low+
	 uOl1KvShFOSFA==
Date: Wed, 28 Jan 2026 20:17:18 -0500
From: Guo Ren <guoren@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: compat: fix COMPAT_UTS_MACHINE definition
Message-ID: <aXq1HthMYkBGXx/l@gmail.com>
References: <20260127190711.2264664-1-gaohan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260127190711.2264664-1-gaohan@iscas.ac.cn>
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

On Wed, Jan 28, 2026 at 03:07:11AM +0800, Han Gao wrote:
> The COMPAT_UTS_MACHINE for riscv was incorrectly defined as "riscv".
> Change it to "riscv32" to reflect the correct 32-bit compat name.
> 
> Fixes: 06d0e3723647 ("riscv: compat: Add basic compat data type implementation")
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  arch/riscv/include/asm/compat.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/compat.h b/arch/riscv/include/asm/compat.h
> index 6081327e55f5..28e115eed218 100644
> --- a/arch/riscv/include/asm/compat.h
> +++ b/arch/riscv/include/asm/compat.h
> @@ -2,7 +2,7 @@
>  #ifndef __ASM_COMPAT_H
>  #define __ASM_COMPAT_H
>  
> -#define COMPAT_UTS_MACHINE	"riscv\0\0"
> +#define COMPAT_UTS_MACHINE	"riscv32\0\0"
Good catch, my typo. The UTS_MACHINE is riscv32 in Makefile. Thx for fixup.

Reviewed-by: Guo Ren (Alibaba Damo Academy) <guoren@kernel.org>


>  
>  /*
>   * Architecture specific compatibility types
> -- 
> 2.47.3
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
