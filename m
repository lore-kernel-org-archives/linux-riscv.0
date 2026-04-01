Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9004D35179
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 11:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ILWHwfmLEAKoZ+e9vW1dRSnvXuPwlU2nHcI6I7cBgTM=; b=fKH9Ashk1KZyc4
	i6LpAvPXIYd5v+aVG07/G7qUPv3MZzYedoNkGOe3WTmDXePn8u8W0tSLYOJMtW4lViiWg5PxRHESY
	Z3Mg+TIhaz2+bMe/I7m2wGOBzmP8G4Ob+vGi+C120i4cIUWqAjEQ/XHnA13LTIftTWyMKO6KnyD1t
	wwaxKzP6hOFF9+S2LEwBzc40KZMV+8zkH2UIzpeWOodL62/ch1m4ltry3VQtYesE2tIO70fTDmCmg
	lXnrkCdB16k8/1oU/EzoYn/VTxsmt5Zpg2RC9L/3FadmxfTXNwoPy4Q1NiS3zBzEDP0KmXE/lLN/Q
	q3+URJlbijdGqMmOuB5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tzW-0000000Efdy-2f6c;
	Wed, 01 Apr 2026 11:44:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tzU-0000000EfdY-03Xh
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 11:44:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4ABD84090A
	for <linux-riscv@lists.infradead.org>; Wed,  1 Apr 2026 11:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FB0C116C6;
	Wed,  1 Apr 2026 11:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775043847;
	bh=msYVK4Utdiqx9U2vKN4AsAcQwo+MGyKaSM3z3gcoNPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qSF3OmF9Gh5QP08gC3sEz7Qg7lNGlacb1ZwnTpz4+WXuiZ0eiUIe1iNsBuFdlwufb
	 hfygd6sG1d5RDZ5RtYlaJZSmsvWpf46u+xbQa9+kJPFPIsf+0opQAnNAaTbdoaf90e
	 k8OmvpcTJsfT9ff0R2uNyS1nX1h5m7d5XvWVYgcvpWIb6OS5gRNl6otlmEOSnCFdky
	 J87pk73eLGbdkWtaAnJYwN67g1gLzMGt+3ftaD6WPMBsbfSZjzCyfpQS+UYLr6C2Lk
	 ryRbKfgKX7gcNVIIMmJPlrWYkEB8FYtL1i0Eo/Rce7d/AcxMVYsYGhVsyJ5yllo1NC
	 /1qrzOq2EpqYQ==
Date: Wed, 1 Apr 2026 13:44:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] ~RISC-V~Microchip soc fixes for v7.0-rc6
Message-ID: <20260401-bold-positive-flounder-6e7b0d@quoll>
References: <20260326-vertebrae-relatable-adfa3baabfd6@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260326-vertebrae-relatable-adfa3baabfd6@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_044408_077262_AD82ABD3 
X-CRM114-Status: GOOD (  11.21  )
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

On Thu, Mar 26, 2026 at 11:21:39AM +0000, Conor Dooley wrote:
> Hey folks,
> 
> Another small PR here, worth pointing out that the exact contents has
> been in linux-next but not as these commit hashes yet, I squashed a
> fixup patch just now that I hadn't realised got pushed without being
> squashed. Might be worth letting it marinate for a few days if that's
> a concern.
> 
> Cheers,
> Conor.
> 
> The following changes since commit 0528a348b04b327a4611e29589beb4c9ae81304a:
> 
>   cache: ax45mp: Fix device node reference leak in ax45mp_cache_init() (2026-02-06 19:54:40 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-fixes-for-v7.0-rc6
> 
> for you to fetch changes up to c7596f9001e2b83293e3658e4e1addde69bb335d:
> 
>   firmware: microchip: fail auto-update probe if no flash found (2026-03-26 11:14:11 +0000)

Thanks, applied

Probably better if the fixes branch would move to v7.0-rc1, not
continuing the v6.19.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
