Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD48C678DA
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 22:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wlq0d6vCLm71HN5wPVZ2HVmdATFN8HZCKJextiMsMc0=; b=F/vFiBlAEVynpb
	9IxV0K4yRBPzyJqtEfkb9INXEE1NUqmsfANuwDx0Fab3QBsLCEVj6jpxBRweB8aJULKIwB+VBiwZs
	HtuUn0Fp0BBMBd4KzCU+sMK2lNGiQufrx/dJVzO+IGNJs5gg3zU6r1vZXq3e/JFgKcASwGckbPb/z
	zCHkaLXjc79QciH43yNH06l69Rneg/nozsZNVPQ4f2vMx5PXJn137oxLMZ2/UbPJV9eCc2Ume3nyw
	VUwnoJs2P+BWcVDC99Y4OWDXGlHGtGf5cpkN9qbqVQJGb8aFr75/LaNFmU5MM0kF9Wc/lj72nDkem
	B9Mc4kiXAbfVM6RTo/0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7mU-00000008GxR-2SlD;
	Tue, 10 Jun 2025 22:49:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4Xl-00000007uc3-15rd
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 19:21:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67D5C629C8;
	Tue, 10 Jun 2025 19:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB41C4CEED;
	Tue, 10 Jun 2025 19:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749583316;
	bh=MvY65196OkKGiQelyzXqMzmcV5/FC5X0KU+wsmCw2F4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MwljCyWYyc8YtDsnvhBJ9wOOCxFpAopoKjI6sf7A7Wyb9RY4m84YGhhMqWyZM4/XK
	 5VZA+L/9/rkc0/UWOZR9lB9xiZ8yHz1gj4gA5XXKbn79to1O/nsjXd0TKNmn9xMotg
	 /yJcY3eyxkx7kmYsiOhYMcpBvjEFTawUqOyMfgdGElaMIWH9krgZRCgzLWGSwY8LVu
	 4SobJYaZskufh0q8t+Rg61TTIEcXnOf7noRIKEPB9b6JPNKezv47wZojtYBfpNdiMO
	 M5+GmFrYqClQCn9MRMiS2UDcT4CPFnzABcCQICxWEiISQM2jbc3IWhwjjGJY77ef1P
	 +pqmqVO/nvcCw==
Date: Tue, 10 Jun 2025 12:21:32 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Zhihang Shao <zhihang.shao.iscas@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	herbert@gondor.apana.org.au, paul.walmsley@sifive.com,
	alex@ghiti.fr, appro@cryptogams.org, zhang.lyra@gmail.com
Subject: Re: [PATCH v3] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS
 implementation
Message-ID: <20250610192132.GE1649@sol>
References: <20250609074655.203572-3-zhihang.shao.iscas@gmail.com>
 <20250609201306.GD1255@sol>
 <EC8AB5A0-D5C9-4D18-A986-DE66BE46E09A@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <EC8AB5A0-D5C9-4D18-A986-DE66BE46E09A@gmail.com>
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

On Tue, Jun 10, 2025 at 02:57:29PM +0800, Zhihang Shao wrote:
> 
> >> +void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
> >> +  unsigned int len, u32 padbit)
> >> +{
> >> + len = round_down(len, POLY1305_BLOCK_SIZE);
> >> + poly1305_blocks(state, src, len, 1);
> >> +}
> >> +EXPORT_SYMBOL_GPL(poly1305_blocks_arch);
> > 
> > This is ignoring the padbit and forcing it to 1, so this will compute the wrong
> > Poly1305 value for messages with length not a multiple of 16 bytes.
> 
> So Does this mean here the argument of poly1305_blocks should be fixed as poly1305_blocks(state, src, len, padbit)?
> But since the padbit is set to 1 in poly1305_blocks_arch according to the implementation in lib/crypto/poly1305.c, 
> it seems to be no difference here.
> 
> Looking forward to your reply.

While the common case is padbit=1, poly1305_final() passes padbit=0 in the case
where the message ends with a partial block.  So both values have to be
supported.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
