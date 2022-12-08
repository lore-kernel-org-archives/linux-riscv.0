Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE1AC3A5A7
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 10:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SeQFJv03/j+kNPlGza0KP7Yl2I+5HDmqXTLD5HUesSw=; b=N9Q3pgtjR/U/BX
	eVGUler7frIT5xovD3+RFBLvkJob4fK8pI7cu8MEBxQxwFzU6AYYSC00tX5/M1ESoDrRLieN9IrtA
	iVck/Uag9yJfaSULPMYlvcM87s2JZig9Na7vn5MUtTebNPQ7jgHC08s/hQwPg+TlHyvlX0hrPBq3A
	GVSjoc9vVLFTLBFnruwpLpi+u7C69VLtPFQNDsoumt6BgOuKtLqu9YH6MUPhwxqYe1uYmEUjs6aYM
	HffzZ+41mWd+h8bCOHhexW1sLJL6vPAXaE2HKh7PoElBWHtCtGMCtvctIaN4pOtwgOuOBTNixUp/S
	b72tSveMJtx3tovLjgPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Dsu-00BuHZ-WC; Thu, 08 Dec 2022 10:12:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Dss-00Bu3D-6p
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 10:12:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B400A61E6A;
	Thu,  8 Dec 2022 10:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F28AC433C1;
	Thu,  8 Dec 2022 10:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670494325;
	bh=B10KeXGupOTZ9O/Osm7gIGMgA+zr2X0fyDsuPqU+p6Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jzC1x3m4jHd7F84vjyOy+NamYp39Gn3nrEFu2TeBOmBYx2dWmBUT1/pmwZxppbY1F
	 k3mARGSpHXQf3jbRw2R32f6GWvOMKiBHTpUNZhE6wou3scBRoN9MRpMKQd1yjdDCSU
	 Fch/E5PWHTfsLN2LDrvy6qOC42Wopi9m5ANt2emInNAd+fH1x7kQPjR5FwnB7gLUEI
	 BXjnvpidbxJfcBeMGDl7DS9Hm4gzX215uUgcPLi9SRzCp0pZ9BuNvh0g1g37P9PQsZ
	 xfAobjVzjKpZphURLyxzkO1avVJ5YY2Kw+lai6cyw4n2VPf91fBEhaNpv4wkR1W/lC
	 +gleUuoO7qoog==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: guoren@kernel.org, arnd@arndb.de, guoren@kernel.org,
 palmer@rivosinc.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, conor.dooley@microchip.com, heiko@sntech.de,
 jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org,
 chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com,
 zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com,
 chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com,
 ben@decadent.org.uk
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next V10 06/10] riscv: entry: Consolidate
 ret_from_kernel_thread into ret_from_fork
In-Reply-To: <20221208025816.138712-7-guoren@kernel.org>
References: <20221208025816.138712-1-guoren@kernel.org>
 <20221208025816.138712-7-guoren@kernel.org>
Date: Thu, 08 Dec 2022 11:12:02 +0100
Message-ID: <87r0xaw6fh.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_021206_318997_97E84BDE 
X-CRM114-Status: UNSURE (   7.00  )
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

Z3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgoKPiBGcm9tOiBKaXNoZW5nIFpoYW5nIDxqc3poYW5n
QGtlcm5lbC5vcmc+Cj4KPiBUaGUgcmV0X2Zyb21fa2VybmVsX3RocmVhZCgpIGJlaGF2ZXMgc2lt
aWxhcmx5IHdpdGggcmV0X2Zyb21fZm9yaygpLAo+IHRoZSBvbmx5IGRpZmZlcmVuY2UgaXMgd2hl
dGhlciBjYWxsIHRoZSBmbihhcmcpIG9yIG5vdCwgdGhpcyBjYW4gYmUKPiBhY2hpZXZlZCBieSB0
ZXN0aW5nIGZuIGlzIE5VTEwgb3Igbm90LCBJLkUgczAgaXMgMCBvciBub3QuIE1hbnkKPiBhcmNo
aXRlY3R1cmVzIGhhdmUgZG9uZSB0aGUgc2FtZSB0aGluZywgaXQgbWFrZSBlbnRyeS5TIG1vcmUg
Y2xlYW4uCgpOaXQ6ICJpdCBtYWtlcyIuCgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
