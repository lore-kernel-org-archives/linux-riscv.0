Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD86AC7EE21
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 06:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HH2VlKWExAfRpX3lrwezWz3ep0/lOSoTbuER0e01GOw=; b=GV4xgGXwmQrEzH
	zTKS8yhY8UruFQJRapG2UydVX7eKgY2YqyTDi9m732gAlvpARmYTzpgMnCjrT3mqXzLsg7LdOVrIa
	NJ4Fumo4srMvqjzqY+NgXhxTUc+abd85irY5t1T9HhbAZBfSzn5mBgmFDNUm3hZycSyDjosiK7maT
	/hs4gi2jHLHamvKmNrkLptb4smyLy9HoYXp3jJBTfJCCTT9MzZne83z8bB46dW2SUdz1UgxRGWzIr
	s48BkxWqJgT4psmgPIbZ1HTI7n3eZs9Of9gIoHWDdBfQZN2V6YxCb3bNiWlDs+rG9WXl8JLELdN6q
	5E/2cz1FcQKqte0cC4BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puS9w-006iUO-28;
	Thu, 04 May 2023 06:09:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puS9t-006iTA-35
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 06:09:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DBD5561187;
	Thu,  4 May 2023 06:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01CE7C433EF;
	Thu,  4 May 2023 06:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683180580;
	bh=UoN0G7xRgK8l3KWmK6d34C2kwfr+QWMw0vjw1R1S+g8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WkNmkNHyBdD/lfnYPpRlf/EnuH4fJCQwyJfMktPPjjpKgV58Kq8Dny63w4j1be69C
	 Y0/56/ojSQARUHNAK+YeZmq5QtzTuY6nUj0dbjslzaP3bBcHP9Oqm3lFpqjAwz21oj
	 ZcJ7ji3L7GFPasea44QUUDWyrz8qGkdGAIRkjWxhFXAwr/vJz5NLnRbjs6h0U8bNpr
	 w3uS83M6kpoupg24tFt9sAowm3rIsiT4nznB7QKLjx+I2AmpiYZglpPGRbaT3PI41O
	 ZjiRE6u6BotmdwSE4c3YV0tp909MCnd6rSNEnfCiwMZ6Yn26U7sU9f62DmXnPTMVMg
	 2mBmisAStMmuw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: ruanjinjie <ruanjinjie@huawei.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH v2] riscv: fix kprobe __user string arg print fault issue
In-Reply-To: <20230423091235.968980-1-ruanjinjie@huawei.com>
References: <20230423091235.968980-1-ruanjinjie@huawei.com>
Date: Thu, 04 May 2023 08:09:37 +0200
Message-ID: <87cz3g39we.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_230942_057258_14778B10 
X-CRM114-Status: GOOD (  16.31  )
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

cnVhbmppbmppZSA8cnVhbmppbmppZUBodWF3ZWkuY29tPiB3cml0ZXM6Cgo+IE9uIHJpc2N2IHFl
bXUgcGxhdGZvcm0sIHdoZW4gYWRkIGtwcm9iZSBldmVudCBvbiBkb19zeXNfb3BlbigpIHRvIHNo
b3cKPiBmaWxlbmFtZSBzdHJpbmcgYXJnLCBpdCBqdXN0IHByaW50IGZhdWx0IGFzIGZvbGxvdzoK
Pgo+IGVjaG8gJ3A6bXlwcm9iZSBkb19zeXNfb3BlbiBkZmQ9JGFyZzEgZmlsZW5hbWU9KzAoJGFy
ZzIpOnN0cmluZyBmbGFncz0kYXJnMwo+IG1vZGU9JGFyZzQnID4ga3Byb2JlX2V2ZW50cwo+Cj4g
YmFzaC0xNjYgICAgIFswMDBdIC4uLjEuICAgMzYwLjE5NTM2NzogbXlwcm9iZTogKGRvX3N5c19v
cGVuKzB4MC8weDg0KQo+IGRmZD0weGZmZmZmZmZmZmZmZmZmOWMgZmlsZW5hbWU9KGZhdWx0KSBm
bGFncz0weDgyNDEgbW9kZT0weDFiNgo+Cj4gYmFzaC0xNjYgICAgIFswMDBdIC4uLjEuICAgMzYw
LjIxOTM2OTogbXlwcm9iZTogKGRvX3N5c19vcGVuKzB4MC8weDg0KQo+IGRmZD0weGZmZmZmZmZm
ZmZmZmZmOWMgZmlsZW5hbWU9KGZhdWx0KSBmbGFncz0weDgyNDEgbW9kZT0weDFiNgo+Cj4gYmFz
aC0xOTEgICAgIFswMDBdIC4uLjEuICAgMzYwLjM3ODgyNzogbXlwcm9iZTogKGRvX3N5c19vcGVu
KzB4MC8weDg0KQo+IGRmZD0weGZmZmZmZmZmZmZmZmZmOWMgZmlsZW5hbWU9KGZhdWx0KSBmbGFn
cz0weDk4ODAwIG1vZGU9MHgwCj4KPiBBcyByaXNjdiBkbyBub3Qgc2VsZWN0IEFSQ0hfSEFTX05P
Tl9PVkVSTEFQUElOR19BRERSRVNTX1NQQUNFLAo+IHRoZSArMCgkYXJnMikgYWRkciBpcyBwcm9j
ZXNzZWQgYXMgYSBrZXJuZWwgYWRkcmVzcyB0aG91Z2ggaXQgaXMgYQo+IHVzZXJzcGFjZSBhZGRy
ZXNzLCBjYXVzZSB0aGUgYWJvdmUgZmlsZW5hbWU9KGZhdWx0KSBwcmludC4gU28gc2VsZWN0Cj4g
QVJDSF9IQVNfTk9OX09WRVJMQVBQSU5HX0FERFJFU1NfU1BBQ0UgdG8gYXZvaWQgdGhlIGlzc3Vl
LCBhZnRlciB0aGF0IHRoZQo+IGtwcm9iZSB0cmFjZSBpcyBvayBhcyBiZWxvdzoKPgo+IGJhc2gt
MTY2ICAgICBbMDAwXSAuLi4xLiAgICA5Ni43Njc2NDE6IG15cHJvYmU6IChkb19zeXNfb3Blbisw
eDAvMHg4NCkKPiBkZmQ9MHhmZmZmZmZmZmZmZmZmZjljIGZpbGVuYW1lPSIvZGV2L251bGwiIGZs
YWdzPTB4ODI0MSBtb2RlPTB4MWI2Cj4KPiBiYXNoLTE2NiAgICAgWzAwMF0gLi4uMS4gICAgOTYu
NzkzNzUxOiBteXByb2JlOiAoZG9fc3lzX29wZW4rMHgwLzB4ODQpCj4gZGZkPTB4ZmZmZmZmZmZm
ZmZmZmY5YyBmaWxlbmFtZT0iL2Rldi9udWxsIiBmbGFncz0weDgyNDEgbW9kZT0weDFiNgo+Cj4g
YmFzaC0xNzcgICAgIFswMDBdIC4uLjEuICAgIDk2Ljk2MjM1NDogbXlwcm9iZTogKGRvX3N5c19v
cGVuKzB4MC8weDg0KQo+IGRmZD0weGZmZmZmZmZmZmZmZmZmOWMgZmlsZW5hbWU9Ii9zeXMva2Vy
bmVsL2RlYnVnL3RyYWNpbmcvZXZlbnRzL2twcm9iZXMvIgo+IGZsYWdzPTB4OTg4MDAgbW9kZT0w
eDAKPgo+IFNpZ25lZC1vZmYtYnk6IHJ1YW5qaW5qaWUgPHJ1YW5qaW5qaWVAaHVhd2VpLmNvbT4K
ClBsZWFzZSB1c2UgeW91ciBmdWxsIG5hbWUuCgo+IC0tLQo+IHYyOgo+IC0gYWRkIHRoZSBjb25m
aWcgaW4gYWxwaGFiZXRpY2FsIG9yZGVyCj4gLS0tCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDEg
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCBlYjdmMjlhNDEyZjgu
LmI0NjJlZDdkNDFmZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiArKysgYi9h
cmNoL3Jpc2N2L0tjb25maWcKPiBAQCAtMjUsNiArMjUsNyBAQCBjb25maWcgUklTQ1YKPiAgCXNl
bGVjdCBBUkNIX0hBU19HSUdBTlRJQ19QQUdFCj4gIAlzZWxlY3QgQVJDSF9IQVNfS0NPVgo+ICAJ
c2VsZWN0IEFSQ0hfSEFTX01NSU9XQgo+ICsJc2VsZWN0IEFSQ0hfSEFTX05PTl9PVkVSTEFQUElO
R19BRERSRVNTX1NQQUNFCgpBZnRlciBhZGRpbmcgcHJvcGVyIG5hbWUgaW4gU29CLCBmZWVsIGZy
ZWUgdG8gYWRkOgoKQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4K
Cj4gIAlzZWxlY3QgQVJDSF9IQVNfUE1FTV9BUEkKPiAgCXNlbGVjdCBBUkNIX0hBU19QVEVfU1BF
Q0lBTAo+ICAJc2VsZWN0IEFSQ0hfSEFTX1NFVF9ESVJFQ1RfTUFQIGlmIE1NVQo+IC0tIAo+IDIu
MjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
