Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696D1C2FC15
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 12:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ou0f9oVGIgOxI8m7/MI7ICwvBGWE/8lyFcP7mx1nAeg=; b=zYhD+T3isHDf5l
	TsE6tVl5b4+1/+IOehtDs2hR9iLhSNSeB8r2+iIYH16/3U25yQMvwyvwBj8jxysIjx4995BIFTYkK
	DypQEI8R2GB3eWpSOzLhnvAf6If6OzvFNfxG+jpkf+TX96f5vCx05p9uSVBHnOfS2l8y2aA6U7MLu
	gEJlB1VoyHrQbqUWcYBZiBKV2LfjrQ1dS14G/G4u58FjnL0FmiTv8Ud0dzuIbayRAg6r6I7398+/H
	WzJeIaih6x2a+WJ+mpH8LjID6DYtM5KayEfBy4PhaSS9EPRbaqyg0tlKvHDEo1ErG9uo+Ca9abd/y
	MsBL1sXmvMOIbt0ITSQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWcE9-006Nrk-1N;
	Thu, 17 Aug 2023 12:35:49 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWcE6-006NrF-2F
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 12:35:48 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 772B692009C; Thu, 17 Aug 2023 14:35:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 74CEF92009B;
	Thu, 17 Aug 2023 13:35:43 +0100 (BST)
Date: Thu, 17 Aug 2023 13:35:43 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Andy Chiu <andy.chiu@sifive.com>
cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
    greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org, 
    conor.dooley@microchip.com, Paul Walmsley <paul.walmsley@sifive.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, 
    Guo Ren <guoren@kernel.org>, Vincent Chen <vincent.chen@sifive.com>, 
    =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: Re: [v1, 2/3] RISC-V: vector: export VLENB csr in
 __sc_riscv_v_state
In-Reply-To: <20230816155450.26200-3-andy.chiu@sifive.com>
Message-ID: <alpine.DEB.2.21.2308170158460.8596@angie.orcam.me.uk>
References: <20230816155450.26200-1-andy.chiu@sifive.com> <20230816155450.26200-3-andy.chiu@sifive.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_053546_897321_49FC77CE 
X-CRM114-Status: GOOD (  10.41  )
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

On Wed, 16 Aug 2023, Andy Chiu wrote:

> diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
> index e17c550986a6..283800130614 100644
> --- a/arch/riscv/include/uapi/asm/ptrace.h
> +++ b/arch/riscv/include/uapi/asm/ptrace.h
> @@ -97,6 +97,7 @@ struct __riscv_v_ext_state {
>  	unsigned long vl;
>  	unsigned long vtype;
>  	unsigned long vcsr;
> +	unsigned long vlenb;
>  	void *datap;

 I think we really ought to make a distinct structure holding the vector 
CSR state only, and then have it included as a leading member of a pair of 
other structures, one for the signal context with a trailing `datap' (or 
`vregp' or `vreg') member and another one for the regset with a flexible 
array member of the `char' type, e.g. (actual names TBD):

struct __riscv_v_csr_state {
	unsigned long vstart;
	unsigned long vl;
	unsigned long vtype;
	unsigned long vcsr;
	unsigned long vlenb;
};

struct __riscv_v_signal_state {
	struct __riscv_v_csr_state csr;
	void *vregp;
};

struct __riscv_v_regset_state {
	struct __riscv_v_csr_state csr;
	char vreg[];
};

This will make the API cleaner and avoid both UB with making accesses 
beyond the end of a structure and clutter with an unused entry in core 
files and data exchanged via ptrace(2).

 Since this is a part of the UAPI I suggest consulting with libc people, 
possibly by posting an RFC to <libc-alpha@sourceware.org>.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
