Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DE1606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 03:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vvw4x1WP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j8uuaBAl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q3WFnF5t7t1P1ToQW4UiCGr/UKC8hKeB1HQA5z57orQ=; b=vvw4x1WPJ/SWPELMhkg9Le22Ox
	0oMQwnGhSmk5G4r6ydaznV3DsmrdyJarCRn44qAv6x5r9atGS5LolReuqSCary35lsmuLowyKTBTF
	Yut0MyakvrSpykxyFbSb0o/KQjHNUsNB/VJkIHgiUo4S6AHGWJYSzoM0O12tL8zgheh3X0b1IYAgn
	a8eFqBq68Lmh0ei8SeMp9TNMb4aGrq+cddVMYZyJ6W6SOOTa9wuazCK80k2rubLsriS7yV9Ht7h8v
	YQgrKcBdy4SsjZgXDfEnHxJervjaKo4LT0e2Bt5xpIW1psjnqdWmgFogBH7UHpUoWzrg3ATFOTI+S
	pWPCMQ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWLa-00000007ddH-2ge0;
	Wed, 18 Nov 2026 03:28:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWLZ-00000007dd4-1LgP
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 03:28:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E3CA2403A5;
	Wed, 18 Nov 2026 03:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7C31F000C4;
	Wed, 18 Nov 2026 03:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794972511;
	bh=OQurdBkKxkbhxtgp8myE5vmibpMYsIIamR+xgT7WLpQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=j8uuaBAlBidKgVeIm7fyQUAg0OFmHPk4oc903Aif4DZYu44m3VZCoswmWs+x8eL6k
	 +/OR+/nEIxmb7g5OfDxba5nCJlPdhttcF6uHyDMBoKB74XGqW/agX6+BdJGJwWj/uE
	 lGGDrLa+XzZ3XgoP1frDyRQ+gHs2xbzhSIJ2+dVj7LihoesRNy8psQyDnvaBpksski
	 NxSPSRfhOLkoW0eESMffJuz0MxvNFiwGqSSb7FT8Z/oNFUXjr8d/ime68FDxb0KU7x
	 ZFTaoNGfhrpSGI8TjOvoaHVmwfxj0GvtusXmZn733uWM9nHJG5ahhk+WSAkog4TnU2
	 Fbz15zcVLtSZQ==
Date: Tue, 17 Nov 2026 20:28:30 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: unaligned: fix __setup handlers
In-Reply-To: <20261111-fix-riscv-unaligned-v1-1-0722514fc1e4@mobileye.com>
Message-ID: <2eee9e1a-83c2-90ca-a374-fd461c0a050c@kernel.org>
References: <20261111-fix-riscv-unaligned-v1-1-0722514fc1e4@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 11 Nov 2026, Vladimir Kondratiev wrote:

> Returning -EINVAL from a __setup() callback cause invalid
> unaligned_scalar_speed= and unaligned_vector_speed=
> values to be treated as handled. obsolete_checksetup() treats any
> non-zero return value from setup_func() as success, so an unrecognized
> argument is silently accepted instead of being reported as an unknown
> boot option.
> 
> __setup() handlers return 0 on failure.
> 
> Fixes: aecb09e091dc ("riscv: Add parameter for skipping access speed tests")
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

Thanks, queued for v7.4-rc with a stable@ cc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
