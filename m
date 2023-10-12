Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12868CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 14:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fG9OdLu+e/LB5nJzfqn0e7ArYlzo48TRdZ/ta2TLbL4=; b=YnAdJXC7h9I2k0
	0iJmI7PvkBnPLLdcUfbNcA/vlGL/xYuExIzCiwsKYjfHz24i1rXZ0yNlgAwZ1n4Ts76rWBU9Dg75F
	3nhU0q2LDXUu//Euu2M+svu0IL5W2PAERqWQh2vl6aV3ouFNGkWUPAfThKMdpOvz++6FrU1+IiQJT
	0yYjnzwe9/r9PCabU9I30rJWiFQ9Z9A3DUU82oNeXgZjsBttkAu34g/4uUu7LxkW3cvEIoTRSXdku
	OCHebEoO0SbwGxf+dMpd95blxePyJ5yd2i/PNMs9uU2YWngZ538pFyojTbiQmIOJgT9FnE0B2ph9n
	ltq56SSZZV0WuXlla44Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqwkg-001C0k-0J;
	Thu, 12 Oct 2023 14:33:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqwkc-001C07-1B
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 14:33:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6770ACE2909;
	Thu, 12 Oct 2023 14:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FB4C433C8;
	Thu, 12 Oct 2023 14:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697121199;
	bh=Ev2GnSgnN2D6OU+cvZem2qbvf+gC1yIh+IRKc5cJw4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=moZ684sDcVQ3HUjjeJR3BezTmgl1nG8v7DSoDIUmhpckZKKm8jjW4bl1WVeCDljDA
	 PO2cDZDaCvAeyM4+5HxUmn98bZ4rrukkScwXdVTcX6+Ex8MA+nD0QyiX2LdbZJt0CQ
	 aQz7Rv5A8EZhKvSDKtb3uDBy3JcpYat99a7d4E8IrNEYnpmh5cAz+PMRLZaf4qQ9rH
	 ale/nDMpo0ZMEoasY78mee7FeHuJjTRA63lT7TDgB1dxU8YKFeL4OABStDLK+G3F+z
	 GabLbkcnBj5weEPXXv8cBBprFoNyP5aDGKjhBfXJxPvl+HJoXBxpsUF1hxSuc+L6TA
	 YakNxuVJCvhvw==
Date: Thu, 12 Oct 2023 22:21:08 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] riscv: errata: thead: use riscv_nonstd_cache_ops
 for CMO
Message-ID: <ZSgA1BtMv/YDHzQX@xhacker>
References: <20231012141456.4078-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231012141456.4078-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_073322_626008_684F8303 
X-CRM114-Status: GOOD (  20.46  )
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

On Thu, Oct 12, 2023 at 10:14:54PM +0800, Jisheng Zhang wrote:
> Previously, we use alternative mechanism to dynamically patch
> the CMO operations for THEAD C906/C910 during boot for performance
> reason. But as pointed out by Arnd, "there is already a significant
> cost in accessing the invalidated cache lines afterwards, which is
> likely going to be much higher than the cost of an indirect branch".
> And indeed, there's no performance difference with GMAC and EMMC per
> my test on Sipeed Lichee Pi 4A board.
> 
> Use riscv_nonstd_cache_ops for THEAD C906/C910 CMO to simplify
> the alternative code, and to acchieve Arnd's goal -- "I think
> moving the THEAD ops at the same level as all nonstandard operations
> makes sense, but I'd still leave CMO as an explicit fast path that
> avoids the indirect branch. This seems like the right thing to do both
> for readability and for platforms on which the indirect branch has a
> noticeable overhead."
> 
> To make bisect easy, I use two patches here: patch1 does the conversion
> which just mimics current CMO behavior via. riscv_nonstd_cache_ops, I
> assume no functionalities changes. patch2 uses T-HEAD PA based CMO
> instructions so that we don't need to covert PA to VA.
> 
> Hi Guo,
> 
> I didn't use wback_inv for wback as you suggested during v1 reviewing,
> this can be left as future optimizations.
> 
> Thanks
> 
> since v2:
>   - collect Reviewed-by tag

Oh, I missed the tag collection, but I know maintainers are using b4 which can
collect and apply tags automatically ;). let me know if want a new
version.

>   - fix typo
> 
> since v1:
>   - collect Tested-by tag
>   - add patch2 to use T-HEAD PA based CMO instructions.
> 
> Jisheng Zhang (2):
>   riscv: errata: thead: use riscv_nonstd_cache_ops for CMO
>   riscv: errata: thead: use pa based instructions for CMO
> 
>  arch/riscv/Kconfig.errata            |  1 +
>  arch/riscv/errata/thead/errata.c     | 69 +++++++++++++++++++++++++++-
>  arch/riscv/include/asm/errata_list.h | 50 +++-----------------
>  3 files changed, 74 insertions(+), 46 deletions(-)
> 
> -- 
> 2.40.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
