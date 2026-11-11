Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C0F606A337
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 15:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bYY4gybE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SR3+ZIZC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zgxxPccZDke1KY8cmLImtKrHZvW6NMuXhFFL+wk9amE=; b=bYY4gybEqaz+t6nMDwWZhjgUvf
	J/jac0ruZG+RhRoyyPnTZdyVuZPslgu7XKcNRHL97PNZ0Q8JWCSI4zoSk5KDYCV6Uuafjh0Dk4tVf
	n6qnEK/Ytvp9Lww75T3qbu1yY8OIhCj3ejvw3yhS6GynZaGoHC6uiPPkgN5uXAF6Uu9t1m/qHptyD
	jjXKzSgY/WmyBEzbnPo8zJ285Uiej+Ahi5zenf8wXTuXKQsRmgKsTnDRBz/uxv3EDj4Q4JtxGHzsk
	6P1E5ExYazTvZZ/PuwP1gJz7ffoqIedjgfxpZT/Ew6LvL2ZzUkt/0cZaP0wRE/fODE/osZePbxICb
	21tJsYRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAFe-000000075BK-0V2i;
	Wed, 11 Nov 2026 15:28:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAFc-000000075BE-41q3
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 15:28:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D0D844F67;
	Wed, 11 Nov 2026 15:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F7E1F00A05;
	Wed, 11 Nov 2026 15:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794410920;
	bh=bjSv1XsBMujaNhaJRh9MvS8t1Brl66ZxiWLhcECWri0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SR3+ZIZCLdtTnoVy//GrCC4HXOm4Jn40gO8H9g6khWGHLAjdEjn6U0vog36o98TGw
	 9E7usnl2pOjHGDdTvkjfK9zCVEYLeZ/4w8mr535nxFe2in4nZqNmIIyuObNVNH1I3s
	 it86FSoPdpfICOVMty+Qdl6KzeVWzKZu/3TmIWkmlb9Sym6zbA+w/YYoR7NQ7ek5vs
	 Kx7pg3d5e7lJmvQ0IRK9rFspqC3V+r04vqvlvCCL2dGFbTDD0UCcH3hJTxs3jCNc/h
	 6fG+6gRY36AoK7F57pTXMY4k9sWAxjXrRwm+mXaWDa4vIQgAK63jtoBEwUBeuLsE9l
	 GwSbwxE5Z11IQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] clk: eswin: Keep the TCU AXI clock enabled
From: Brian Masney <masneyb@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Yifeng Huang <huangyifeng@eswincomputing.com>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Brian Masney <bmasney@redhat.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Min Lin <linmin@eswincomputing.com>, 
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
 Pritesh Patel <pritesh.patel@einfochips.com>, 
 Han Gao <rabenda.cn@gmail.com>, Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261110-eic7700-tcu-aclk-v1-1-72db82bf59c1@iscas.ac.cn>
References: <20261110-eic7700-tcu-aclk-v1-1-72db82bf59c1@iscas.ac.cn>
Date: Wed, 11 Nov 2026 10:28:34 -0500
Message-Id: <179441091475.1131744.8859651362389020365.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=1040; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=z+HGmtMUdWM1EKWRhHoD6bQsx34aIiCc8r72ukWTyvU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+dC6+2HQo5w7397Nqgvdum63l+3covdpWYYJRy7Gmp
 GlSD9tudZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRo2qMDKvm2ba+Sfn04c46
 OwbbLd5d95KuOfvzrC9tTM3R2RjcHsLIsEl1W2qs27z4/uTOU5tzKyeriFZcD+x75/7mzvddTod
 /MAEA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Han,

> The SMMU TCU needs its AXI clock for DMA, even in bypass mode. No driver
> claims this clock, so clk_disable_unused() gates it and DMA through the
> SMMU stalls. On the HiFive Premier P550, this hangs firmware loading of
> an RX550 graphics card.
> 
> Mark the clock as critical.
> 
> Fixes: cd44f127c1d4 ("clk: eswin: Add eic7700 clock driver")
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Cc: stable

> ---
> Tested on the HiFive Premier P550 with an RX550 graphics card:
> 
> - Without this patch, amdgpu stalls while loading the RX550 firmware
>   and CPUs can no longer be halted.
> - With only the TCU AXI clock kept enabled (the TCU configuration clock
>   is still managed normally), amdgpu initializes and the IB ring tests
>   pass without any manual register writes.

Please include these details in the commit message above the ---.

I can take this patch, however I'd ideally like to see a review from
Xuyang or someone at eswin first.

Brian

-- 
Brian Masney <masneyb@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
