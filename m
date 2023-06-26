Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448E9EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 18:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S11CGTlMVfZUbep4AiGDiqlOEloZmpN3Wln0dm0xfOE=; b=XwoTvn5Q2PFixm
	B7hi6gr+pSoajcAF92KQPVoSmcm9ipMMe3APQLp0SR4x9QWe7AseluOqt2Za841JlHskxmAQPhUVN
	Ad9G1xUQHVPr4VeFvUuIXBTlzB0dU21KRbesG3+pOaUHOz2xweqI3rOhPqKLRBxMyFv0eafCirEs9
	5qn2wArSvmr/jrCbNGM9XEGyBcn1RgDBzTtLhyiZ6DEO+1J2+hUSaCC+lFt1dv2Mg4TSgLN/GFTf6
	At+UOzm5u+8q3LABDxgqck6MoREIb+wWo5u6gJ5rMjz16VLNYmlzmpJPyzukmsaMtX5BREF1Xgg85
	RYE8MwvN524kvq6ia3Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDqZY-00Aofg-0s;
	Mon, 26 Jun 2023 18:04:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDqZV-00AofD-2Z
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 18:04:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 47D2E60F12;
	Mon, 26 Jun 2023 18:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31CD7C433C8;
	Mon, 26 Jun 2023 18:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687802656;
	bh=WsiKkTM73mtAmQ00ugazGG4W0HkOJmDHHpGv9mYa+/E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AounBPoyrIYC8tj7GGEruylVt9XIaWqGJ/RxL5wRls1pWn/s/8is3nNnLf7ugNk6e
	 NUReI1leY2p9+1wp2L1WcPq9dO7QpRIFKkoi2DDaxPIah1LWHp0Bie2/8Moc86g+pm
	 CEdCgj1na0IsDDyuvc5ixeNqr/lnM0fNpPByNAKBotkFprb4HuKt2tus/jCJnakzNA
	 A8ZzIHCVZqBxuESs/zX8uTXdSCwOGZvFyh1pP+sGol9EO+RGX6NBShA7Frp17/XEdi
	 p6tDQvHcpUvwXIR9Kswn5YlJAPSBe/LdATxMZwVqYiQA7khrmHdczws9DWYs+xcWiq
	 CWpCGJTzGJlqA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org,
 linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>, =?utf-8?Q?R?=
 =?utf-8?Q?=C3=A9mi?=
 Denis-Courmont <remi@remlab.net>, Darius Rad <darius@bluespec.com>, Andy
 Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH v2] riscv: Discard vector state on syscalls
In-Reply-To: <87y1k6m827.fsf@all.your.base.are.belong.to.us>
References: <20230626165736.65927-1-bjorn@kernel.org>
 <87y1k6m827.fsf@all.your.base.are.belong.to.us>
Date: Mon, 26 Jun 2023 20:04:13 +0200
Message-ID: <87sfaem76q.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_110417_879119_3FBAFE4C 
X-CRM114-Status: UNSURE (   7.49  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBCasO2cm4gVMO2cGVs
IDxiam9ybkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4KPj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Acml2b3NpbmMuY29tPgo+Pgo+PiBUaGUgUklTQy1WIHZlY3RvciBzcGVjaWZpY2F0aW9uIHN0
YXRlczoKPj4gICBFeGVjdXRpbmcgYSBzeXN0ZW0gY2FsbCBjYXVzZXMgYWxsIGNhbGxlci1zYXZl
ZCB2ZWN0b3IgcmVnaXN0ZXJzCj4+ICAgKHYwLXYzMSwgdmwsIHZ0eXBlKSBhbmQgdnN0YXJ0IHRv
IGJlY29tZSB1bnNwZWNpZmllZC4KPgo+IEEgYml0IG9mIGEgY29ybmVyIGNhc2UsIGJ1dCB0aGlz
IHdpbGwgbWFrZSBzaWdyZXR1cm4gc3lzY2FsbHMgZGlzY2FyZAo+IHRoZSB2ZWN0b3Igc3RhdGUg
YXMgd2VsbC4KPgo+IElzIHRoYXQgYW4gaXNzdWU/IEUuZy4gYSB1c2VyIGNhbm5vdCBidWlsZCB1
c2Vyc3BhY2UgY29udGV4dCBzd2l0Y2hpbmcKPiBhcHBsaWNhdGlvbi4gRG9lcyBhcm02NCBTVkUg
aGFuZGxlIHNpZ3JldHVybiBpbiBhIHNwZWNpYWwgd2F5PwoKTlZNOyBNeSBiYWQuIFRoZSB2ZWN0
b3Igc3RhdGUgaXMgY2xlYXJlZCBvbiAqZW50cnkqLCBidXQgdGhlbiB0aGUKcmVnaXN0ZXJzIHBh
c3NlZCBvbiBzaWduYWwgc3RhY2sgaXMgcmVzdG9yZWQgYXMgdXN1YWwuCgpTb3JyeSBmb3IgdGhl
IG5vaXNlISBXZSdyZSBhbGwgZ29vZCEKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
