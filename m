Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2E6CD0429
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 00:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FBUiJU62XOnZyxAOOAixwX/tzq8R8wBmKNdv85P5Jps=; b=m2duq6Vzd0KAxB
	+pWBC9/mwWbE17UFlRNTDSC+0uXIYsp6MdBHp2DcbYhxx8nbAQqsSoJjTZJrSViG0HS7nAzBtZyiY
	/um2W9RWwndzvnPl5u1jW3OjJqiLTGNAdlxO4RCFF5V7zefh0ODQSnyPJy197iaH3Du3iP4EiP5hU
	PmSlEj6lTpVzt+bP0UonahNI+iKz2uKhQQggfPb0vpqm7pOv44YKF4J5Z+gvKUlR5RJG7b7YPJVSz
	EXolAnNvgavaEBG2b2hLS49EvGrxy1qv4R5TG+7R17GuhV/fvinp2swTwY1yn332ZLDMMLdaFYoZo
	kdzqMqZthgzeXgdaGWqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvHC-0000000CH3u-2pHE;
	Tue, 06 Jan 2026 00:50:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvHB-0000000CH3o-1YoJ
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 00:50:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F54B6011E;
	Tue,  6 Jan 2026 00:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD67FC116D0;
	Tue,  6 Jan 2026 00:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767660620;
	bh=3XU7EJG3gP5Z3gnDS9oA7OG4JTxemlvF/Kp87nuH4tI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=shILJ/z5Ej3dqd0AgMqc4MIVqDmTAJpI/Djjw+Dasj5u+yL8zN4Vv5HzTOfWuYNXu
	 PoBTmqaGcrv1jwwgITYnPQQ91nBLwPAh4cnvGFCz1zVz04DertEGKAguYLv4cFEdBe
	 pdRMnPwU8AdSJ06iOK2mMokNnTXgN3CFY/oFsh/xbIqLNdYExmnBj+J52AKhj6zBt1
	 GneHYVGExZGNFxn/btL8eMSkC/KEYDelsK7ZGk32jVpEGFHZmBdsqFUN1oxQDEJaLU
	 H6VweoBIgzXadSvzXQQFyHPNfPdqTfWBAvRufBmgqUw9EyDhsbugKAlyII6RmHZ8GP
	 dm2CzqXq9Ps+g==
Date: Mon, 5 Jan 2026 17:50:16 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: guoren@kernel.org
cc: paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr, 
    charlie@rivosinc.com, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: pgtable: Cleanup useless VA_USER_XXX
 definitions
In-Reply-To: <20251201005850.702569-1-guoren@kernel.org>
Message-ID: <4f359362-8e79-4a04-dda5-e4129266221f@kernel.org>
References: <20251201005850.702569-1-guoren@kernel.org>
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

On Sun, 30 Nov 2025, guoren@kernel.org wrote:

> From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
> 
> These marcos are not used after commit b5b4287accd7 ("riscv: mm: Use
> hint address in mmap if available"). Cleanup VA_USER_XXX definitions
> in asm/pgtable.h.
> 
> Fixes: b5b4287accd7 ("riscv: mm: Use hint address in mmap if available")
> Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>

Thanks, queued for v6.19-rc.


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
