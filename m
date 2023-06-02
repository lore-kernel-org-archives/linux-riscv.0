Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09ADC7EE24
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 09:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=axCg6DNK6Ytqwb3ST6tSGedv8ALIokrKhXGQts2hrTA=; b=mkwcertXYa5C9Z
	mNm6ndr1h0Klxog76ZqkGmSJuouCLf2L/7lKOLHR28gWBiafZ8FyamJwAAR5IFnevT9Ia8YH7PHbb
	wspVddLVUOp4MWOkZXT84HnDnTy1jZVQ6ojILG6cOuk8jUUWiUqgCFWIAZ1F460doQXyqCcrlBVEI
	AvFC6DwkGgjw6djshKA2XZscG7TAZhhv06EFszjR8iTIcjYNqYTsfHTUeUnvxoI0Y+9rVJpqh7XMj
	wIRVIPuYRRTNyYo7guo1oa5k5FDxKszy+S9XdIUr7/IjLDxkDY6yZhGsSQyly6zMpj+B4cl3cMw67
	uUIkQH1ViSbDCzZDiqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q51Hc-006Pqp-36;
	Fri, 02 Jun 2023 09:41:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q51Ha-006PqI-0r
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 09:41:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EABD364983;
	Fri,  2 Jun 2023 09:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA543C433EF;
	Fri,  2 Jun 2023 09:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685698876;
	bh=/KSfwY3Ual0+wljvgcQlMt2JAgEfVGw+2YZ7Lc+KauY=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=UDLKmlUAbmsOJHDUcz5fnpZTTJXa+Dkfr8EZpIQJkiP0PFwaHjIHlsfPjtVSahPyO
	 ybmlER5Np6+I53qyaUKKbu7ZpRfSepvfS2mu6y54NWnJzRhe+5DZNie8mk2D02xrPE
	 25gt8d46UomGELcEcrEEYQVHHrkhNY0IyblBiLp57higroyXJ5FWyXjgyRfA0rzLfN
	 7XMTuEWZV5Helndap57dn4EjfxkvKIrwhK36B+Z2BMRtz5igg0RlfIdiBVfF9W0u4d
	 XnMPDODBOYzTsGxznoFfQ9BgWNZgH5+0HI2jSONP6szg5K5GaW7rL3F3KqE6ku/uEx
	 vMntFNYBCgNFg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Ruan Jinjie <ruanjinjie@huawei.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 palmer@rivosinc.com
Subject: Re: [PATCH v3] riscv: fix kprobe __user string arg print fault issue
In-Reply-To: <c9b6939c-f072-c4aa-b721-3cd0b2fd5635@huawei.com>
References: <20230504072910.3742842-1-ruanjinjie@huawei.com>
 <c9b6939c-f072-c4aa-b721-3cd0b2fd5635@huawei.com>
Date: Fri, 02 Jun 2023 11:41:13 +0200
Message-ID: <87cz2ei4li.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_024118_365456_54F66D61 
X-CRM114-Status: UNSURE (   8.91  )
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

UnVhbiBKaW5qaWUgPHJ1YW5qaW5qaWVAaHVhd2VpLmNvbT4gd3JpdGVzOgoKPiBQaW5nLgoKTWF5
YmUgaXQncyBub3QgY2xlYXIgKndoeSogd2UgbmVlZApBUkNIX0hBU19OT05fT1ZFUkxBUFBJTkdf
QUREUkVTU19TUEFDRSBvbiBSSVNDLVY/CgpBUkNIX0hBU19OT05fT1ZFUkxBUFBJTkdfQUREUkVT
U19TUEFDRSBpcyB1c2VkIGluIHRoZSBrZXJuZWwgdG8KZGV0ZXJtaW5lIHdoYXQgIm1lbW9yeSBh
Y2Nlc3MiIGZ1bmN0aW9uIHRvIHVzZSwgZS5nLgoKICB8ICNpZmRlZiBDT05GSUdfQVJDSF9IQVNf
Tk9OX09WRVJMQVBQSU5HX0FERFJFU1NfU1BBQ0UKICB8ICAgICAgICAgaWYgKCh1bnNpZ25lZCBs
b25nKXN0cl92YWwgPCBUQVNLX1NJWkUpCiAgfCAgICAgICAgICAgICByZXQgPSBzdHJuY3B5X2Zy
b21fdXNlcl9ub2ZhdWx0KHN0cl9maWVsZCwgc3RyX3ZhbCwgU1RSX1ZBUl9MRU5fTUFYKTsKICB8
ICAgICAgICAgZWxzZQogIHwgI2VuZGlmCiAgfCAgICAgICAgICAgICByZXQgPSBzdHJuY3B5X2Zy
b21fa2VybmVsX25vZmF1bHQoc3RyX2ZpZWxkLCBzdHJfdmFsLCBTVFJfVkFSX0xFTl9NQVgpOwoK
UklTQy1WIG1ha2VzIHVzZSBvZiB0aGUgU1VNIGJpdCBbMV0sIHdoaWNoIHJlcXVpcmVzIHRoZSBr
ZXJuZWwgZmxpcHMgYQpiaXQgZXhwbGljaXRseSB0byB0b3VjaCB1c2VyIG1lbW9yeSwgc28gaXQn
cyBpbXBvcnRhbnQgdG8gdXNlIHRoZQpjb3JyZWN0IGFjY2VzcyBmdW5jdGlvbi4KCldoYXQgdGhp
cyBtZWFucywgaXMgdGhhdCBpZgpDT05GSUdfQVJDSF9IQVNfTk9OX09WRVJMQVBQSU5HX0FERFJF
U1NfU1BBQ0UgaXMgKm5vdCogZGVmaW5lZCBmb3IgUlYKa2VybmVscywgdGhlIGNvcHlfZnJvbV9r
ZXJuZWwgd2lsbCBmYXVsdCAoYXMgSmluamllIHBvaW50cyBvdXQgaW4gdGhlCmNvbW1pdCBtZXNz
YWdlKS4KClRoZSBmaXhlcyB0YWcgc2hvdWxkIGJlIHdoZW4gRGFuaWVsIEJvcmttYW5uIGludHJv
ZHVjZWQgdGhlIGNvbmZpZyAtLSBvcgp0aGF0IG1ha2VzIHNlbnNlIGZyb20gYSBiYWNrcG9ydCBw
ZXJzcGVjdGl2ZS4KCk1heWJlIFBhbG1lciBjYW4gYWRkIGEgbG9yZSBsaW5rIHRvIHRoaXMgcG9z
dCwgYW5kIHRoZSBmb2xsb3dpbmcKZml4ZXMtdGFnCgogIEZpeGVzOiAwZWJlZWE4Y2E4YTQgKCJi
cGY6IFJlc3RyaWN0IGJwZl9wcm9iZV9yZWFkeywgc3RyfSgpIG9ubHkgdG8gYXJjaHMgd2hlcmUg
dGhleSB3b3JrIikKCndoZW4gYXBwbHlpbmc/CgoKQmrDtnJuCgpbMV0gaHR0cHM6Ly9naXRodWIu
Y29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwvYmxvYi9tYWluL3NyYy9zdXBlcnZpc29yLmFkb2M/
cGxhaW49MSNMMTE4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
