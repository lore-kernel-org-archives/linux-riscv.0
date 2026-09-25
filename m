Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F207C9830E
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 23:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBejcRZRbLkq1xNvCLbYOhQLH9taPIE11koVurSeNsc=; b=VPQA3DhvbgAwnt
	/OQL8TK0xOR4R4RF4dswYBnmN2Mk5RE05+6VU8i570n3FOR34TpXJ0DWovTm1HLBlPTsFWiLuko/7
	qeen1PRXue5ujXDOaWSz9+s06EtibnyJA1fstpAZDoF5ItcSuJicUg0i34iu/jAs8STBtAHrMbDBM
	0Zp6AXQPK57gNjGuIE2VdaUtCfTVNcT6W+p6998cHqWMSi+Ef6P35ftgloZzC0n2LsprnmGkGI5Wj
	UO6dOAY18WTnbT/T1fV3ajq2L7Wv1sZrJF+nGQOD6Q+TafCbi6oVPCNlB4QaHuVPRgEsZpvQhtLxD
	Trw0CKTjGpymI3QGidbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAFej-0000000Ehgm-1ToQ;
	Fri, 25 Sep 2026 23:48:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAFei-0000000Ehgg-2xCb
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 23:48:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D66843045;
	Fri, 25 Sep 2026 23:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612491F000FF;
	Fri, 25 Sep 2026 23:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790380120;
	bh=J+M33NAyGSzOubJELAznu648UId0n2/UxhskdMsd6PU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=YDGo+f8SBIabB5AlVZjw1FBM4xikyYXwnmWgVWQLVSNoNF2PprCkjdb7oSzinUEfb
	 NSvjQYRjIjLcohyVj50K7FPbwutcyTS2YyahXw1Td1G8CewaZupgCEee7MVb+XCmTC
	 LBOD2hdrsbExKVb/FBbcGCRhlPJntzO1PssAbKyoWESRRQcZFB/lwP/kSOhW8IoRYS
	 /18a7ip9c586i7h8fD+HtItMQiRWxh8mAs5Unz/DcBeRtz9AJfueQkmKVmr4J/qEjK
	 nQ5VwFAFfaOJGYSMdCDEwa9Djkfs3jo64Z0QnNGK2Ao1LTTvNqeKQZOPBcAHnYjPcQ
	 31j7DPl2y/5nw==
Date: Fri, 25 Sep 2026 17:48:38 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Thorsten Blum <blum@kernel.org>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
    Samuel Holland <samuel.holland@sifive.com>, Zishun Yi <vulab@iscas.ac.cn>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: process: Use str_supported_unsupported() in
 compat_mode_detect()
In-Reply-To: <20260924213256.122530-2-blum@kernel.org>
Message-ID: <15d659fe-c9cb-fa65-5dd6-7182fb152317@kernel.org>
References: <20260924213256.122530-2-blum@kernel.org>
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

On Thu, 24 Sep 2026, Thorsten Blum wrote:

> Replace hard-coded strings with the str_supported_unsupported() helper.
> This unifies the output and helps the linker with deduplication, which
> can result in a smaller binary.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Thanks, queued for v7.4.

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
