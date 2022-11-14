Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665BDC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 15:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4cmTA/TqJhq3FRrbFlOGGqG/V11n/3+nUUFn9S5UXpA=; b=OLqP2Gk/Wzgly/
	wuy3FKLkrvzJjrq355IPGrxL01aVUEINaad1/BI/r+HJbNUYodBiaPjIlFuPzOGNUy142FBNHXrlF
	JNrO2fJYQHjdK/ZZ8DaEWxen+NNfUj38snLbbGVxen+J7059UQTbc2ISBaAHV4KOsVhTgKgqjR67Y
	5zph4CH/SxmqguxIoIg2G/fAZNrvQEqnXSk7lPFCvVX74/dBiBiJvGOI8ZK9SU6FG2hRMVRqPEAaW
	me/4cIg324VsLEo36eOdChTYX+l9e6+lqbLk8RiqepT549g0FUxbDFawbQv7kG/BX8JM5ln3K5vJr
	QSpRxMM8gwrBM1EbBdyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oubLT-002DR2-Ox; Mon, 14 Nov 2022 15:25:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oubLQ-002DOp-Ia
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 15:25:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 233D7611BD;
	Mon, 14 Nov 2022 15:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B57C433D6;
	Mon, 14 Nov 2022 15:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668439553;
	bh=GZIeodh/tKHzRw2Ib47HyuuEsEyl1mclfUnUp+6XOS4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=V+kyaMbou7xF+5gq6vmScT40d3HqUhdgg84H871WsQ03EnASOqmsZkqAK1nmpCw1p
	 OGjt5tAo7E9cQFakoqXmHS6zvo34YdYwQeFAR/672DJP2miPxep1YoG5827M4/6Mhc
	 CocoZltQ+KvESRI8sUqCMnr7eCrZaA+WAEzkwCjQ6auu4h81XDoHpQkvWTVJIiVuED
	 7mDX7t4PaaKtYEgMA7SBjFkHn6T3N2ZH+cwiK4FxkaRbprEmtHyyEYHe5zdgmB2Y4J
	 DEsCHDAMaoIPjg5PHZpGY+dnjP3ptSY62mebT7gfvd7xqCgnGB7cHEYBpReyTIgVdm
	 1lhRewu4yuveA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: Proper page permissions after initmem free
In-Reply-To: <b82f4580-76a0-e02b-05c8-4a89e576da0c@ghiti.fr>
References: <20221112113543.3165646-1-bjorn@kernel.org>
 <b82f4580-76a0-e02b-05c8-4a89e576da0c@ghiti.fr>
Date: Mon, 14 Nov 2022 16:25:49 +0100
Message-ID: <871qq5tv5u.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_072556_689396_B0D5BDE1 
X-CRM114-Status: UNSURE (   7.37  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cml0ZXM6Cgo+PiArCQlzZXRfa2VybmVs
X21lbW9yeShfX2luaXRfYmVnaW4sIF9faW5pdF9lbmQsIHNldF9tZW1vcnlfcndfbngpOwo+Cj4K
PiBUaGF0J3Mgbml0cyBidXQgZm9yIDY0LWJpdCBrZXJuZWxzLCBkbyB3ZSByZWFsbHkgd2FudCB0
byBtYWtlIHRoZSBrZXJuZWwgCj4gbWFwcGluZyB3cml0YWJsZT8gSSB0aGluayBjYXRjaGluZyBh
IHdyaXRlIGFjY2VzcyBoZXJlIHdvdWxkIGJlIGJldHRlciAKPiBiZWNhdXNlIElNTyB0aGF0IHNo
b3VsZCBub3QgaGFwcGVuLgoKVGhhbmtzIGZvciBoYXZpbmcgYSBsb29rIQoKSG1tLCBzbyB3aGF0
IHlvdSdyZSBzdWdnZXN0aW5nIGlzIGEgInNldF9tZW1vcnlfcl9ueCIgZm9yIENPTkZJR182NEJJ
VD8KV2hhdCBkbyBvdGhlciBhcmNocyBkbz8gSXMgaXQgd29ydGggdGhlIGV4dHJhIGlmZGVmIGNs
dXR0ZXI/CgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
