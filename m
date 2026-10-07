Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5204ECA5FFC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 14:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDtNdX0KSGN2UdFa3Yc1X92TQ0nfdKu06xYRHZEFVNM=; b=m4dSwOTOSeiuGp
	VKw6HeZhxRWaCUH0oDWkDW4maehKJ+Payus7nHWk3DPcZqKA6IH1GvPUCHjnAI3Y1N0L8uvTWwwtf
	zFqgiEBtrsfkOLgsFqrpzM3Zm6pt+wcTvxZfG/qddwZaDe5eouQBsNg81oC/4blLnXo+h5ZFDyNkW
	TZutaiFmGwaIm3GZ0XLtooOMyHnnT6XJCT2zabnaYOFGml25SYXNx0LqTXo2YdOmeThq5V+vat1wx
	wL095iKMsroMkNTKL2eu80nGTdehw60H2OE1Lzrx0fwbG91pFnKWKbBsjcj//IJVdfOzT/bRZetnl
	XIJqhcERB33epVW8KytQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESVO-00000002bSa-41iy;
	Wed, 07 Oct 2026 14:20:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESVN-00000002bS7-1wQk
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 14:20:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E375760218;
	Wed,  7 Oct 2026 14:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 059341F0089B;
	Wed,  7 Oct 2026 14:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791382824;
	bh=kavN39jozoxAFeQQgnZ+m2rZbsC8+K29xHzjh0azB4k=;
	h=Date:From:List-Id:To:cc:Subject:In-Reply-To:References;
	b=cLIeWLZQsv3p8WDNzkrqV/m1YxkI+zIAUZS3iwoCn3iY+5LntbJM9/NN4/5Iu+krl
	 ociCq/R35FX9zNHv5P+7fy68abHzhPnl0f4MlipqJ9Es8XIDvh1D/2OefqO3wxSWL8
	 ShoNydlm3pJX6ahZhZ4gi+YtlM7fbw3ovPIAXlzS3bE2SVWF5Y2MyYwkA8jIv2Lynf
	 5+Ddv2fAoygxH3BBIYTqNBMU0a7gnolJc6KiBee/jPGh9CsWBsD5RRry8YXsiESM+s
	 LcHs3oKbjAdl2Gx52nT9ABT7AWY4lNSyrBy+Uo+JT1g5azHgEX4ttQjQr1ryXe6cEK
	 2e9lJNBUFdPSg==
Date: Wed, 7 Oct 2026 08:20:18 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: patchwork-bot+linux-riscv@kernel.org
cc: Andy Chiu <tchiu@tenstorrent.com>, linux-riscv@lists.infradead.org, 
    pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    andybnac@gmail.com, dfustini@oss.tenstorrent.com, greentime.hu@sifive.com, 
    linux-kernel@vger.kernel.org, olof@lixom.net
Subject: Re: [PATCH v6 0/8] riscv: optimize mode switch latency for Vector
In-Reply-To: <179127960878.2107992.9155163918962890142.git-patchwork-notify@kernel.org>
Message-ID: <cce463c9-3a77-d21c-56e7-5eaa0a290f14@kernel.org>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com> <179127960878.2107992.9155163918962890142.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
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

On Tue, 6 Oct 2026, patchwork-bot+linux-riscv@kernel.org wrote:

> Hello:
> 
> This series was applied to riscv/linux.git (for-next)
> by Paul Walmsley <pjw@kernel.org>:
> 

[ ... ]

> Here is the summary with links:
>   - [v6,1/8] riscv: do not read csr in vector context switch
>     https://git.kernel.org/riscv/c/5fd018c630e2
>   - [v6,2/8] riscv: vector: refactor context switch for kernel-mode vector
>     https://git.kernel.org/riscv/c/4740b934ebe7
>   - [v6,3/8] selftest: riscv: test vectorized user copy
>     https://git.kernel.org/riscv/c/52318cf0fa6e
>   - [v6,4/8] riscv: vector: refactor vector context operations
>     https://git.kernel.org/riscv/c/1a5c75ee3d09
>   - [v6,5/8] riscv: clarify vector state semantics on syscall and context switch
>     https://git.kernel.org/riscv/c/cc12e55016ba
>   - [v6,6/8] riscv: vector: adjust ptrace and signal behavior for INITIAL state
>     https://git.kernel.org/riscv/c/0d4b43a7734d
>   - [v6,7/8] selftests: riscv: Extend vector tests for sigreturn and ptrace
>     https://git.kernel.org/riscv/c/6740ec489dd7
>   - [v6,8/8] riscv: vector: optimize vstate operations
>     (no matching commit)

Just to clarify, I only applied the first three patches, for the reason
mentioned earlier.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
