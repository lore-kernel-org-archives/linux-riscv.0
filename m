Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D330EEE4996
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 08:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MbI4xbyhDRL56SN6+y0hDVHtbInsVC5QJXeEpGt5dgU=; b=I3O+sRKF7cpzMf
	Uk3cABDsqa7D5Nty9ggGPCoIY1v3eOPyDPudKejUhf15nj2alKbLS2XPGEsLW92CVpHYePzqNU0sx
	O2x+e0tW6kLyZ7FyUPqNMAVRhuJvDkGXV42dlGV7XF7MRONYR4CdnzFBkR5pD8Q8gmAnv4H43NcRM
	ETvDBlqaG2bx0+5YM1mj5YEbJb4eVFNflyNuJoWTswNBqabfOXVzNOzK9zTxkAE3DINOQbxEKFQoM
	jaeBruJ1URmjfXQM/khgwiUariR8QzXbvKselMC/x67Dngqse9TmTdSHq6YmTqSH5GFPPZxyZ3pwa
	CmM7sBKBn4Q/TRrsf/rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYMTu-00FQjm-0E;
	Tue, 22 Aug 2023 08:11:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYMTr-00FQip-2o
	for linux-riscv@lists.infradead.org;
	Tue, 22 Aug 2023 08:11:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD8EF6198D;
	Tue, 22 Aug 2023 08:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99528C433C8;
	Tue, 22 Aug 2023 08:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692691873;
	bh=dP7XQ0sCXAruh+GpITOqH5w9X6cDXAv3cJsgzKeIU5Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cmF9bCzW3ZTBmxrwDqSFLRomoVyePOb6UicYk6s0az7G6Zgw/xsfCoPX5gpakSpzZ
	 YKZ9tPbcTmtbXJdGnpIvf/3Y54Kc5R/qSQnwJGGADLPCHhX7dpK3Hvtw5jW1TgGQbg
	 ssP6xcaDa537UbAWX80ipw5Qf/PlnbJPdMukidpNLR3DGXayDmusx9PqxWFFt8OGgb
	 qu3qHAyK0gtGtV+27EI/nFQnwIe6IhfH/KkrcpK1NDNlZCgB+RxXk4Lzs2GcpTIppK
	 APmJy5Lbzd6AWl3TFzZ1rGFECKPuQdKHB3UJVtm7eSfU+LMWjpLVDJpPhofZDSdG5S
	 QbS35/3ipEMYw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>
Subject: Re: linux-next: Tree for Aug 21 (riscv-64 asm)
In-Reply-To: <5ebf04f8-0cf6-d2b4-fb73-f51fff421b3a@infradead.org>
References: <20230821164605.7bac05f1@canb.auug.org.au>
 <5ebf04f8-0cf6-d2b4-fb73-f51fff421b3a@infradead.org>
Date: Tue, 22 Aug 2023 10:11:11 +0200
Message-ID: <87ttsr33a8.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_011115_984789_AD9E78FB 
X-CRM114-Status: UNSURE (   9.09  )
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

UmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IHdyaXRlczoKCj4gT24gOC8yMC8y
MyAyMzo0NiwgU3RlcGhlbiBSb3Rod2VsbCB3cm90ZToKPj4gSGkgYWxsLAo+PiAKPj4gQ2hhbmdl
cyBzaW5jZSAyMDIzMDgxODoKPj4gCj4KPiAuLi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jOiBJ
biBmdW5jdGlvbiAnZG9faXJxJzoKPiAuLi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jOjM4NDox
OiBlcnJvcjogczAgY2Fubm90IGJlIHVzZWQgaW4gJ2FzbScgaGVyZQo+ICAgMzg0IHwgfQo+ICAg
ICAgIHwgXgo+IC4uL2FyY2gvcmlzY3Yva2VybmVsL2lycS5jOiBJbiBmdW5jdGlvbiAnZG9fc29m
dGlycV9vd25fc3RhY2snOgo+IC4uL2FyY2gvcmlzY3Yva2VybmVsL2lycS5jOjk0OjE6IGVycm9y
OiBzMCBjYW5ub3QgYmUgdXNlZCBpbiAnYXNtJyBoZXJlCj4gICAgOTQgfCB9Cj4gICAgICAgfCBe
Cj4KPgo+IDIgb3V0IG9mIDEwIHJpc2MtdiA2NC1iaXQgYnVpbGRzIGZhaWxlZCB3aXRoIHRoZXNl
IGVycm9ycy4KPgo+IElzIHRoaXMgYSB0b29sY2hhaW4gcHJvYmxlbSBvciBzb21ldGhpbmcgZWxz
ZT8KCkhtbSwgZG8geW91IGhhdmUgYSBsaW5rIHRvIGNvbmZpZy90b29sY2hhaW4vbG9nLCBvciBz
aW1pbGFyPwoKClRoYW5rcyEKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
