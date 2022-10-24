Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA48C38A2D
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 19:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NWrdynlBqbvDknh26YYOfp7zpGcHlIihKrmdwVatKyc=; b=KHD5JRGVqEQc2v
	DfuxDj/5uAubQ5i5sJwqAK5Y0YDDx309ubkgKT8H4ObVdiwb2bYCx3MbdYKL4DsP46fbkpQED7gsR
	5wy/UrvuGMyg2Otr+W2jwJTYPCv6cSAsMYVr5E5Cwm5adLjKLN2NIWf/PUgXvuu86rrWN91kNsJzX
	FKPS3FfmbVhG/UxVJ+vdaKslqV8BvMXsPMNQ58PeF593O27BTnIyGyOFNl7UBqk5J/UPnPeyMpDAr
	cmrUZn0W1pRPXnP57hAkjxYiRH3qu6GUuJo2YNQP4RMEmhqRaGRhWCznLJ/igkbqYVHj9x0gBvNlK
	Wlc7wI+8hcA2vHITnTNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on3Wh-002qjN-Mx; Mon, 24 Oct 2022 19:54:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on3Wf-002qih-N7
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 19:54:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1A6FEB81148;
	Mon, 24 Oct 2022 19:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 904DDC433D6;
	Mon, 24 Oct 2022 19:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666641258;
	bh=YRD1nZfisTmk9PSTyU7z/uzZUCz4EyKC3M9eXjeC60s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CIX/yThFQOifJaXu5hz+cLAzi6CJNAd2uQiOiW1RKfqS/dojHTnnSU/J2fSePXOIv
	 6i5dKd86qriZMtM+zFM5ljeKztF7uWQCsoE9VoLGqnB9za01PJleHtcOi90+MByHRt
	 saRRI0Lev8U6PbD+tEjlGDRUqyRSy2CqrgeADjTlq7MMQhvRSVzL+UPOZmAz92Q1UV
	 YNw4e1VcNEG/wj83mnXvq3GLKTFJVC6h2FRXrRpmoFdegPeix1VdU2H1sL1lWtXKHN
	 wpdiKHuX9rEROzzR0Up9S6W1lNF5u799zxl11SkMoD+w6T5xgdgU3qA+/U+783QL4E
	 V31JoiibZN25A==
Date: Mon, 24 Oct 2022 20:54:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, arnd@arndb.de
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>,
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: Re: [PATCH v5 2/4] RISC-V: Fix MEMREMAP_WB for systems with Svpbmt
Message-ID: <Y1btZRX/e+c+UDyv@spud>
References: <20221020075846.305576-1-apatel@ventanamicro.com>
 <20221020075846.305576-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221020075846.305576-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_125421_922861_FBC5EF51 
X-CRM114-Status: GOOD (  15.67  )
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

On Thu, Oct 20, 2022 at 01:28:44PM +0530, Anup Patel wrote:
> Currently, the memremap() called with MEMREMAP_WB maps memory using
> the generic ioremap() function which breaks on system with Svpbmt
> because memory mapped using _PAGE_IOREMAP page attributes is treated
> as strongly-ordered non-cacheable IO memory.
> 
> To address this, we implement RISC-V specific arch_memremap_wb()
> which maps memory using _PAGE_KERNEL page attributes resulting in
> write-back cacheable mapping on systems with Svpbmt.
> 
> Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
> Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Hey Arnd,
Does this look okay to you now?
Thanks,
Conor.

> ---
>  arch/riscv/include/asm/io.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
> index 92080a227937..42497d487a17 100644
> --- a/arch/riscv/include/asm/io.h
> +++ b/arch/riscv/include/asm/io.h
> @@ -135,4 +135,9 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
>  
>  #include <asm-generic/io.h>
>  
> +#ifdef CONFIG_MMU
> +#define arch_memremap_wb(addr, size)	\
> +	((__force void *)ioremap_prot((addr), (size), _PAGE_KERNEL))
> +#endif
> +
>  #endif /* _ASM_RISCV_IO_H */
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
