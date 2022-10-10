Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227A0C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 15:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mk/nVJPodhAWk05YrqFIigVPXeLEZdZfQJqr4iLIwLQ=; b=NV1s/iaQhO7iUk
	IWY257BRm6IOjj9VOfWpXMgRHsjPuTA8EOvASS7Lkl75KZhjr1bMneatbPevR7sg92vesHlgcZkKC
	DaFQtsCI8gfvdv1FqfiwC48xrszWaFhlCE0BpFs9VxrLVQ9pQ9e03NQZ2Q2GPmmBJUwGkk1H+/anj
	GVIB88Yjpnp6kedBI/nDGEtuJdbvqCXeKRZ8LhJ15D6VSRkAszVeKipWxd/HqB2p5MwmMpmT8PoFi
	OJwszRSRG/LxttUsHBlp4HpGQxa35hY/3FchNo1ZzBfQObCdQDzwqf2XKLktT5UnKFLOJxdYaBlSS
	Fet/fswQEwGYwWiJEeDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohuug-001NBm-1r; Mon, 10 Oct 2022 15:41:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohuue-001NB9-58
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 15:41:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A7D9460F99;
	Mon, 10 Oct 2022 15:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73B2C433D6;
	Mon, 10 Oct 2022 15:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665416511;
	bh=OVOTUrIilndF1mR/lcqxq5K3gXDsoBCDf10VgMvS05c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HlnJ6PAkTmb//6BpFhLmM/8I9T9k0/r26yDs+E8k1ahLJXR8HgaveZWDrb7R/P1Ry
	 B1LvEIFr7JhV1tkv8vHULD3EpwW3xNpQm9t1ZbOdCqqKd8BBP8iToWhDYif360Aj8l
	 xUMbtKkWXM7NbGwKs3auUjkok3mi4XQ8SaGMgT1HeebdvGSmk4N0bUo003WG8Vpja7
	 /Q9IOiTLoVIPI+/4chbv3BgulvkDODHkablz03RZdV6X0uSUJtdgqi+GWcVltdcvgs
	 uQC9CV6sp8xlQJXGpe4McSCp+NwXHxJj356HYrBHURmaIDygL39pRRGGzga16IUo6F
	 pdxFmU9Sjxu/A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: Make port I/O string accessors actually work
In-Reply-To: <alpine.DEB.2.21.2209231211350.29493@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2209220223080.29493@angie.orcam.me.uk>
 <c4ee195a-cf1f-44f6-b3b6-241d04e01fb9@www.fastmail.com>
 <alpine.DEB.2.21.2209231211350.29493@angie.orcam.me.uk>
Date: Mon, 10 Oct 2022 17:41:47 +0200
Message-ID: <878rlnk7no.fsf@smulpajen.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_084152_254148_A55E118B 
X-CRM114-Status: UNSURE (   6.64  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ik1hY2llaiBXLiBSb3p5Y2tpIiA8bWFjcm9Ab3JjYW0ubWUudWs+IHdyaXRlczoKCj4gT24gRnJp
LCAyMyBTZXAgMjAyMiwgQXJuZCBCZXJnbWFubiB3cm90ZToKPgpbLi4uXQo+ICBUaGFua3MgZm9y
IHlvdXIgcmV2aWV3IQo+CgpDaGFzaW5nIHN0YWxlIHRocmVhZHMhIDstKQoKQXJuZCwgd291bGQg
eW91IGJlIE9LIGFkZGluZyB5b3VyIFJldmlld2VkLWJ5IHRhZyB0byB0aGUgcGF0Y2g/CgoKQ2hl
ZXJzLApCasO2cm4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
