Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFB3C6FD20
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 03:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4lhOo95FyWUFIzghVmXm0bACgzaqLpYBzFxnOHFJ9Mk=; b=ZHEADTKTZwvcna
	fFCCCgmUcV8Q/c2KuG+XbI2uPId0WIIt+aN2QXSQ5+IzpG/xPMPq3PCEEAbv/TfMLIeH8RjPVzmfF
	2Ehi7VMW6POWVfc/aQuaGnZjLpmn25pO+bNUe4SOey2RaTKQ8oVx7vuswJlW8hcbBv0BSKd0ZGWVg
	c/ufpdUJ05F42eTrOY6PnF6Mwd3v6+teiz6yGCZ9uL97+nqBGzUVTCxYOKKP6NX6C4m0TFa3VKr96
	FobqyDh66S2pC4GnpEm8hLfcyTTyODsnuWMYWgGAZcaFmyZqjG2MBZ/chCD2dwrVURcmdrb/UG+M/
	TVnDwKuxBr6yLIUDLQDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZkq6-003Nuv-K2; Wed, 08 Mar 2023 03:51:42 +0000
Received: from [2601:1c2:980:9ec0::df2f]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZkq4-003Nu7-GL; Wed, 08 Mar 2023 03:51:40 +0000
Message-ID: <e7a4c583-c6ad-b1f6-c6fc-f770f9184b64@infradead.org>
Date: Tue, 7 Mar 2023 19:51:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/3] Add RISC-V 32 NOMMU support
Content-Language: en-US
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Jesse Taube <mr.bossman075@gmail.com>, linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yimin Gu <ustcymgu@gmail.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Waldemar Brodkorb <wbx@openadk.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
 <42446784-a88b-df09-41e9-5f685b4df6ee@infradead.org>
 <556ce787-80eb-dc48-f8d6-83e415538e36@opensource.wdc.com>
 <f8f291d9-2723-4ab8-3020-49018757d470@gmail.com>
 <62852ee1-3763-3323-c3a8-f1e84f70204a@infradead.org>
 <c7941231-8ebd-dea5-81f8-3180cfc3f286@gmail.com>
 <1d858dbb-ae85-95a0-3e46-b67017733c04@infradead.org>
 <db3b3412-9616-d13c-3374-48647325e057@infradead.org>
 <7280914e-59e3-ba6d-4324-a29c1c0b4ce8@gmail.com>
 <2ebe4bc5-c11c-89b1-2644-358dc12bdfa5@infradead.org>
 <d3fb242e-646e-50b5-7dba-17b228bb32aa@opensource.wdc.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <d3fb242e-646e-50b5-7dba-17b228bb32aa@opensource.wdc.com>
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

CgpPbiAzLzcvMjMgMTk6NDIsIERhbWllbiBMZSBNb2FsIHdyb3RlOgo+IE9uIDMvOC8yMyAxMjoy
MywgUmFuZHkgRHVubGFwIHdyb3RlOgo+Pj4+IE9LLCBJIGRvbid0IGtub3cgaG93IGl0IGhhcHBl
bmVkLiBJIGNhbm5vdCByZXByb2R1Y2UgaXQgbm93Lgo+Pj4+IFRoZSBmYWlsaW5nIC5jb25maWcg
ZmlsZXMgaGFzIENPTkZJR19NTVUgaXMgbm90IHNldCAoZm9yIFJWMzJJKSwgd2hpY2gKPj4+PiBh
cHBlYXJzIHRvIGJlIGltcG9zc2libGUuCj4+PiBUaGVzZSBwYXRjaGVzIGFkZCBgQ09ORklHX01N
VSBpcyBub3Qgc2V0YCAoZm9yIFJWMzJJKS4KPj4+IEJ1dCBubyB3b3JyaWVzIGl0IHNlZW1zIHRv
IGJlIGEgbm9uIGlzc3VlwqAgbm93Lgo+Pj4KPj4+IFlvdXIgdGhvdWdodHMgRGFtaWVuPwo+Pj4K
Pj4KPj4gVGhhbmtzIGZvciByZW1pbmRpbmcgbWUuCj4+Cj4+IFdpdGggdGhlc2UgMyBwYXRjaGVz
IGFwcGxpZWQgdG8gbGludXgtbmV4dC0yMDIzMDMwNywKPj4gSSBzdGlsbCBnZXQgdGhpcyBidWls
ZCBlcnJvci4KPiAKPiBEb2VzIHRoaXMgaGVscCA/Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c29jL2NhbmFhbi9LY29uZmlnIGIvZHJpdmVycy9zb2MvY2FuYWFuL0tjb25maWcKPiBpbmRleCAy
NTI3Y2Y1NzU3ZWMuLjc3OTZjNWYxZDEwOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9jYW5h
YW4vS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvc29jL2NhbmFhbi9LY29uZmlnCj4gQEAgLTQsNyAr
NCw4IEBAIGNvbmZpZyBTT0NfSzIxMF9TWVNDVEwKPiAgICAgICAgIGJvb2wgIkNhbmFhbiBLZW5k
cnl0ZSBLMjEwIFNvQyBzeXN0ZW0gY29udHJvbGxlciIKPiAgICAgICAgIGRlcGVuZHMgb24gUklT
Q1YgJiYgU09DX0NBTkFBTiAmJiBPRgo+ICAgICAgICAgZGVmYXVsdCBTT0NfQ0FOQUFOCj4gLSAg
ICAgICAgc2VsZWN0IFBNCj4gLSAgICAgICAgc2VsZWN0IE1GRF9TWVNDT04KPiArICAgICAgIHNl
bGVjdCBDT01NT05fQ0xLX0syMTAKPiArICAgICAgIHNlbGVjdCBQTQo+ICsgICAgICAgc2VsZWN0
IE1GRF9TWVNDT04KPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAgQ2FuYWFuIEtlbmRyeXRlIEsy
MTAgU29DIHN5c3RlbSBjb250cm9sbGVyIGRyaXZlci4KPiAKPiAoanVzdCBub3RpY2VkIHRoYXQg
dGhlcmUgYXJlIHdoaXRlc3BhY2UgZXJyb3JzIGhlcmUuLi4pCgpZZXMsIHRoaXMgcGF0Y2ggYWxs
b3dzIGl0IHRvIGJ1aWxkIGNsZWFubHkuClRoYW5rcy4KCkkgZGlkbid0IHRlc3QgYW55IG9mIHRo
ZSBiZWxvdyBjaGFuZ2VzLgoKPiBOb3RlIHRoYXQgYm90aCB0aGUgc3lzY3RsIGFuZCBjbGsgZHJp
dmVyIGRlcGVuZCBvbiBSSVNDVi4gSSB0aGluayB0aGVzZSBzaG91bGQKPiBwcm9iYWJseSBhbHNv
IGRlcGVuZCBvbiA2NEJJVCwgYW5kIGV2ZW50dWFsbHkgYWRkIGEgInx8IENPTVBJTEVfVEVTVCIg
YXMgd2VsbC4KPiBTbyBzb21ldGhpbmcgbGlrZSB0aGlzOgo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2Nsay9LY29uZmlnIGIvZHJpdmVycy9jbGsvS2NvbmZpZwo+IGluZGV4IGI2YzViZjY5YTJi
Mi4uNjU3YTM2ZDI2NDBkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL0tjb25maWcKPiArKysg
Yi9kcml2ZXJzL2Nsay9LY29uZmlnCj4gQEAgLTQzMSw3ICs0MzEsNyBAQCBjb25maWcgQ09NTU9O
X0NMS19GSVhFRF9NTUlPCj4gCj4gIGNvbmZpZyBDT01NT05fQ0xLX0syMTAKPiAgICAgICAgIGJv
b2wgIkNsb2NrIGRyaXZlciBmb3IgdGhlIENhbmFhbiBLZW5kcnl0ZSBLMjEwIFNvQyIKPiAtICAg
ICAgIGRlcGVuZHMgb24gT0YgJiYgUklTQ1YgJiYgU09DX0NBTkFBTgo+ICsgICAgICAgZGVwZW5k
cyBvbiBPRiAmJiBSSVNDViAmJiBTT0NfQ0FOQUFOICYmICg2NEJJVCB8fCBDT01QSUxFX1RFU1Qp
Cj4gICAgICAgICBkZWZhdWx0IFNPQ19DQU5BQU4KPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAg
U3VwcG9ydCBmb3IgdGhlIENhbmFhbiBLZW5kcnl0ZSBLMjEwIFJJU0MtViBTb0MgY2xvY2tzLgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9jYW5hYW4vS2NvbmZpZyBiL2RyaXZlcnMvc29jL2Nh
bmFhbi9LY29uZmlnCj4gaW5kZXggMjUyN2NmNTc1N2VjLi4xNzQ1YTYxNGQyYTcgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9zb2MvY2FuYWFuL0tjb25maWcKPiArKysgYi9kcml2ZXJzL3NvYy9jYW5h
YW4vS2NvbmZpZwo+IEBAIC0yLDkgKzIsMTAgQEAKPiAKPiAgY29uZmlnIFNPQ19LMjEwX1NZU0NU
TAo+ICAgICAgICAgYm9vbCAiQ2FuYWFuIEtlbmRyeXRlIEsyMTAgU29DIHN5c3RlbSBjb250cm9s
bGVyIgo+IC0gICAgICAgZGVwZW5kcyBvbiBSSVNDViAmJiBTT0NfQ0FOQUFOICYmIE9GCj4gKyAg
ICAgICBkZXBlbmRzIG9uIFJJU0NWICYmIFNPQ19DQU5BQU4gJiYgT0YgJiYgKDY0QklUIHx8IENP
TVBJTEVfVEVTVCkKPiAgICAgICAgIGRlZmF1bHQgU09DX0NBTkFBTgo+IC0gICAgICAgIHNlbGVj
dCBQTQo+IC0gICAgICAgIHNlbGVjdCBNRkRfU1lTQ09OCj4gKyAgICAgICBzZWxlY3QgQ09NTU9O
X0NMS19LMjEwCj4gKyAgICAgICBzZWxlY3QgUE0KPiArICAgICAgIHNlbGVjdCBNRkRfU1lTQ09O
Cj4gICAgICAgICBoZWxwCj4gICAgICAgICAgIENhbmFhbiBLZW5kcnl0ZSBLMjEwIFNvQyBzeXN0
ZW0gY29udHJvbGxlciBkcml2ZXIuCj4gCj4gQ09NUElMRV9URVNUIGlzIG9wdGlvbmFsIHRob3Vn
aCwgYnV0IEkgZG8gbm90IHNlZSBhbnkgcmVhc29uIHdoeSBub3QgZXZlbnRob3VnaAo+IGluIHBy
YWN0aWNlIHRoZXNlIGRyaXZlcnMgd2lsbCBsaWtlbHkgbmV2ZXIgZW5kIHVwIGluIDMyLWJpdHMg
U29DLgo+IAo+IAoKLS0gCn5SYW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
