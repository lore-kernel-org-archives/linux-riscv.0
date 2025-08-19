Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD73CCA0EF7
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 03:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3HOguLYGBbQ1tL6eNzIK9J5hztRH2iTt+JWT20ftGT8=; b=Gpfg/xpCLOLOsi
	85BbhqQ734hf6/pU88Pny1JwBbz4qp5mNix0iEpGwf2MKi6AQDo24GCMaChwQOgiIXBkA9rMFxVTy
	iArUuliNR2Fc13W6k6iFEe59C8C3TqUqxsrCaWDwWk8J8qp8BrGxxC/ka+g/cCKhOJFYNnpjLo6gx
	5KHPonu17822gJJyVTdAxW0YbSVaQ8wAM/HiIiEnfgH4VU9Mex659god3P6811gkjSYE55Kh4/lG/
	73AvnR5Y37LMlGNu1dz4fm+Q62ik6Cg0TJQHueK1j5/TO+zzpT45G8qAMfhzJ2TFgI7POek9uS93A
	FuTHCqGOBPCn3jZCF0+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDFR-00000009IJH-1Z0Q;
	Tue, 19 Aug 2025 03:42:57 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoD6N-00000009Gtb-2Y1L
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 03:33:36 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 02AD722D5B;
	Tue, 19 Aug 2025 05:33:34 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qgjcBsKQiYp9; Tue, 19 Aug 2025 05:33:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755574413; bh=vcTlBhNgqVBZ0I1xUlH2j/eLUPhobck51aJHN7CtKLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b5lC15ez1E9v90xnuxQcuzn4aMMntdWle+OmlRrL8iwX9wS1NMCy/RyKt568slok6
	 qE/W+qwROulsJ77VFncsjd8AQyHvv9qqHPPFKW+DeUcEXIhBEyIhfAM9fToTcWWLqI
	 +NZnmSuIHagLm4E/3DMmEoKESMtlkaV6GlO8ndz4xeqs884vrjp7QTlwdgDWlwhIr4
	 nuwmWj2qxxPK7bdZf1sAdf7wGrBMYKokvzFi86o9VcjfNAgKftaEQpsLjnjj21sY7O
	 9Sya8fistPlmwdZii+7uXMBYpSj6p+2k7ybu5ddf4m9LcKtTKcFlk9rJcpz0JrM6By
	 uB1CaRCz/Dmwg==
Date: Tue, 19 Aug 2025 03:33:26 +0000
From: Yao Zi <ziyao@disroot.org>
To: Jimmy Ho <jimmy.ho@sifive.com>, linux-riscv@lists.infradead.org
Cc: troy.mitchell@linux.spacemit.com
Subject: Re: [PATCH v2] riscv: fix using wrong load type
Message-ID: <aKPwhoaE0nS8W3mA@pie>
References: <20250819021931.31935-1-jimmy.ho@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250819021931.31935-1-jimmy.ho@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_203335_788626_396C9112 
X-CRM114-Status: GOOD (  15.16  )
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

On Tue, Aug 19, 2025 at 10:19:31AM +0800, Jimmy Ho wrote:
> thread_info.cpu field is 32 bits wide,
> but is accessed using an XLEN-bit load, which might be 64bit load, fix it
> 
> Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>
> 
> Changes in v2:
> - add a comment to explain why use lw instead of REG_L.
> - correct commit message
> ---
>  arch/riscv/kernel/entry.S | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 3a0ec6fd5956..82306cecfdcb 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -45,8 +45,10 @@
>  	 * Computes:
>  	 * a0 = &new_vmalloc[BIT_WORD(cpu)]
>  	 * a1 = BIT_MASK(cpu)
> +	 * 
> +	 * using lw instead of REG_L is because the thread_info.cpu field is 32 bits wide
>  	 */
> -	REG_L 	a2, TASK_TI_CPU(tp)
> +	lw a2, TASK_TI_CPU(tp)
	~~~~~
In this code block, a TAB instead of a space is placed between opcode
and operands. I think it's better to keep them aligned.

And should this patch carry a Fixes tag?

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
