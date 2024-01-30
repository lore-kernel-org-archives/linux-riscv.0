Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50050C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 13:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9lSQaBx/Jju4YR/+f1WcmvHff6D7cdAo54T8c57PLI=; b=iO8QRK+KTv+OpM
	Zn2kianYqppGGZd24XFyPwXFlJ17nuGSrRyC08BBDaM1ORgPAwwz3W8luX38rJ1wOn5PzhCBGg/5D
	DeosaFJzlXllw5ydSHtxGVtaFs+q6TSDjRw/qTfctfOb48fgmK5AwZ9xVxBBTb7xOZz2QegaFimKa
	tcEWfJSxDHDve+oiCw4ZWieJOOyFejBzqXht0ugxz4aSlKsRe96qv07G2yarH1GcAaB9KWzaLvTTf
	6mIWAOkEZVYmTOytXCGWjaS3PO2XFiMSv0hZhY4qGYIWzwfuX2k81OBf//GweQIq3px97PT38QC6b
	e9j0zqD65iFrU9mETsoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUo6l-0000000GqGI-3FCr;
	Tue, 30 Jan 2024 13:24:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUo6j-0000000GqFX-135U
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 13:24:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C71CFCE18E3;
	Tue, 30 Jan 2024 13:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC81C433F1;
	Tue, 30 Jan 2024 13:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706621094;
	bh=u2/EtGgKHfzM35W18xHX1KvyJ0d2ZoEG7yO9aWLn5E0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uZaWbzdNChbyXG+ahuq7EytUvzRdZGDvruqZR11EZP6KTpKu3lWN/qaKKHbKMmAac
	 edrLPNAUV3JEw7LNJZYEtY41NODu+IuPpTTB+MXn0rcibGvRZZ6TSVZU/X1ajBNnK2
	 yaVvQBdAQhPeoy2yJmanm0awSjpJSBJYJeMrGWBfDCsOmppHRgQBv927XnZtM62RLp
	 H2qFTf/lKAOkPMRb027X03Vzmx9K2okqjDdgglg+LiVXFAEsmXtiA84jM77PTSXlvf
	 fNrB4cxOyLO8nYqGR9iC8qKkkFJ35Eorggm/AWzX+Sd6Yb6jWtf6l2lS9tl6KuIveF
	 M4SW6Z8UDW+ig==
Date: Tue, 30 Jan 2024 21:12:03 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Matteo Croce <mcroce@microsoft.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/3] riscv: optimized memmove
Message-ID: <Zbj1o6VAsk8Tn2ab@xhacker>
References: <20240128111013.2450-1-jszhang@kernel.org>
 <20240128111013.2450-3-jszhang@kernel.org>
 <fa36b871-43d7-413c-82a2-0ecc0ebce9b4@ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa36b871-43d7-413c-82a2-0ecc0ebce9b4@ics.forth.gr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_052457_654468_FF531096 
X-CRM114-Status: GOOD (  22.77  )
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

T24gVHVlLCBKYW4gMzAsIDIwMjQgYXQgMDE6Mzk6MTBQTSArMDIwMCwgTmljayBLb3NzaWZpZGlz
IHdyb3RlOgo+IE9uIDEvMjgvMjQgMTM6MTAsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4gPiBGcm9t
OiBNYXR0ZW8gQ3JvY2UgPG1jcm9jZUBtaWNyb3NvZnQuY29tPgo+ID4gCj4gPiBXaGVuIHRoZSBk
ZXN0aW5hdGlvbiBidWZmZXIgaXMgYmVmb3JlIHRoZSBzb3VyY2Ugb25lLCBvciB3aGVuIHRoZQo+
ID4gYnVmZmVycyBkb2Vzbid0IG92ZXJsYXAsIGl0J3Mgc2FmZSB0byB1c2UgbWVtY3B5KCkgaW5z
dGVhZCwgd2hpY2ggaXMKPiA+IG9wdGltaXplZCB0byB1c2UgYSBiaWdnZXIgZGF0YSBzaXplIHBv
c3NpYmxlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0ZW8gQ3JvY2UgPG1jcm9jZUBtaWNy
b3NvZnQuY29tPgo+ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwu
Y29tPgo+ID4gU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3Jn
Pgo+IAo+IEknZCBleHBlY3QgdG8gaGF2ZSBtZW1tb3ZlIGhhbmRsZSBib3RoIGZ3L2J3IGNvcHlp
bmcgYW5kIHRoZW4gbWVtY3B5IGJlaW5nCj4gYW4gYWxpYXMgdG8gbWVtbW92ZSwgdG8gYWxzbyB0
YWtlIGNhcmUgd2hlbiByZWdpb25zIG92ZXJsYXAgYW5kIGF2b2lkCj4gdW5kZWZpbmVkIGJlaGF2
aW9yLgoKSGkgTmljaywKCkhlcmUgaXMgc29tdGhpbmcgZnJvbSBtYW4gbWVtY3B5OgoKInZvaWQg
Km1lbWNweSh2b2lkIGRlc3RbcmVzdHJpY3QgLm5dLCBjb25zdCB2b2lkIHNyY1tyZXN0cmljdCAu
bl0sCiAgICAgICAgICAgICAgICAgICAgc2l6ZV90IG4pOwoKVGhlICBtZW1jcHkoKSAgZnVuY3Rp
b24gY29waWVzIG4gYnl0ZXMgZnJvbSBtZW1vcnkgYXJlYSBzcmMgdG8gbWVtb3J5IGFyZWEgZGVz
dC4KVGhlIG1lbW9yeSBhcmVhcyBtdXN0IG5vdCBvdmVybGFwLiAgVXNlIG1lbW1vdmUoMykgaWYg
dGhlIG1lbW9yeSBhcmVhcyBkbyAgb3ZlcuKAkApsYXAuIgoKSU1ITywgdGhlICJyZXN0cmljdCIg
aW1wbGllcyB0aGF0IHRoZXJlJ3Mgbm8gb3ZlcmxhcC4gSWYgb3ZlcmxhcApoYXBwZW5zLCB0aGUg
bWFudWFsIGRvZXNuJ3Qgc2F5IHdoYXQgd2lsbCBoYXBwZW4uCgpGcm9tIGFub3RoZXIgc2lkZSwg
SSBoYXZlIGEgY29uY2VybjogY3VycmVudGx5LCBvdGhlciBhcmNoIGRvbid0IGhhdmUKdGhpcyBh
bGlhcyBiZWhhdmlvciwgSUlVQyhhdCBsZWFzdCwgcGVyIG15IHVuZGVyc3RhbmRpbmcgb2YgYXJt
IGFuZCBhcm02NAptZW1jcHkgaW1wbGVtZW50YXRpb25zKXRoZXkganVzdCBjb3B5IGZvcndhcmQu
IEkgd2FudCB0byBrZWVwIHNpbWlsYXIgYmVoYXZpb3IKZm9yIHJpc2N2LgoKU28gSSB3YW50IHRv
IGhlYXIgbW9yZSBiZWZvcmUgZ29pbmcgdG93YXJkcyBhbGlhcy1tZW1jcHktdG8tbWVtbW92ZSBk
aXJlY3Rpb24uCgpUaGFua3MKPiAKPiAKPiA+IC0tLSBhL2FyY2gvcmlzY3YvbGliL3N0cmluZy5j
Cj4gPiArKysgYi9hcmNoL3Jpc2N2L2xpYi9zdHJpbmcuYwo+ID4gQEAgLTExOSwzICsxMTksMjgg
QEAgdm9pZCAqbWVtY3B5KHZvaWQgKmRlc3QsIGNvbnN0IHZvaWQgKnNyYywgc2l6ZV90IGNvdW50
KSBfX3dlYWsgX19hbGlhcyhfX21lbWNweSkKPiA+ICAgRVhQT1JUX1NZTUJPTChtZW1jcHkpOwo+
ID4gICB2b2lkICpfX3BpX21lbWNweSh2b2lkICpkZXN0LCBjb25zdCB2b2lkICpzcmMsIHNpemVf
dCBjb3VudCkgX19hbGlhcyhfX21lbWNweSk7Cj4gPiAgIHZvaWQgKl9fcGlfX19tZW1jcHkodm9p
ZCAqZGVzdCwgY29uc3Qgdm9pZCAqc3JjLCBzaXplX3QgY291bnQpIF9fYWxpYXMoX19tZW1jcHkp
Owo+ID4gKwo+ID4gKy8qCj4gPiArICogU2ltcGx5IGNoZWNrIGlmIHRoZSBidWZmZXIgb3Zlcmxh
cHMgYW4gY2FsbCBtZW1jcHkoKSBpbiBjYXNlLAo+ID4gKyAqIG90aGVyd2lzZSBkbyBhIHNpbXBs
ZSBvbmUgYnl0ZSBhdCB0aW1lIGJhY2t3YXJkIGNvcHkuCj4gPiArICovCj4gPiArdm9pZCAqX19t
ZW1tb3ZlKHZvaWQgKmRlc3QsIGNvbnN0IHZvaWQgKnNyYywgc2l6ZV90IGNvdW50KQo+ID4gK3sK
PiA+ICsJaWYgKGRlc3QgPCBzcmMgfHwgc3JjICsgY291bnQgPD0gZGVzdCkKPiA+ICsJCXJldHVy
biBfX21lbWNweShkZXN0LCBzcmMsIGNvdW50KTsKPiA+ICsKPiA+ICsJaWYgKGRlc3QgPiBzcmMp
IHsKPiA+ICsJCWNvbnN0IGNoYXIgKnMgPSBzcmMgKyBjb3VudDsKPiA+ICsJCWNoYXIgKnRtcCA9
IGRlc3QgKyBjb3VudDsKPiA+ICsKPiA+ICsJCXdoaWxlIChjb3VudC0tKQo+ID4gKwkJCSotLXRt
cCA9ICotLXM7Cj4gPiArCX0KPiA+ICsJcmV0dXJuIGRlc3Q7Cj4gPiArfQo+ID4gK0VYUE9SVF9T
WU1CT0woX19tZW1tb3ZlKTsKPiA+ICsKPiAKPiBIZXJlIGlzIGFuIGFwcHJvYWNoIGZvciB0aGUg
YmFja3dhcmRzIGNhc2UgdG8gZ2V0IHRoaW5ncyBzdGFydGVkLi4uCj4gCj4gc3RhdGljIHZvaWQK
PiBjb3B5X2J3KHZvaWQgKmRzdF9wdHIsIGNvbnN0IHZvaWQgKnNyY19wdHIsIHNpemVfdCBsZW4p
Cj4gewo+IAl1bmlvbiBjb25zdF9kYXRhIHNyYyA9IHsgLmFzX2J5dGVzID0gc3JjX3B0ciArIGxl
biB9Owo+IAl1bmlvbiBkYXRhIGRzdCA9IHsgLmFzX2J5dGVzID0gZHN0X3B0ciArIGxlbiB9Owo+
IAlzaXplX3QgcmVtYWluaW5nID0gbGVuOwo+IAlzaXplX3Qgc3JjX29mZnQgPSAwOwo+IAo+IAlp
ZiAobGVuIDwgMiAqIFdPUkRfU0laRSkKPiAJCWdvdG8gdHJhaWxpbmdfYnc7Cj4gCj4gCWZvcig7
IGRzdC5hc191cHRyICYgV09SRF9NQVNLOyByZW1haW5pbmctLSkKPiAJCSotLWRzdC5hc19ieXRl
cyA9ICotLXNyYy5hc19ieXRlczsKPiAKPiAJc3JjX29mZnQgPSBzcmMuYXNfdXB0ciAmIFdPUkRf
TUFTSzsKPiAJaWYgKCFzcmNfb2ZmdCkgewo+IAkJZm9yICg7IHJlbWFpbmluZyA+PSBXT1JEX1NJ
WkU7IHJlbWFpbmluZyAtPSBXT1JEX1NJWkUpCj4gCQkJKi0tZHN0LmFzX3Vsb25nID0gKi0tc3Jj
LmFzX3Vsb25nOwo+IAl9IGVsc2Ugewo+IAkJdW5zaWduZWQgbG9uZyBjdXIsIHByZXY7Cj4gCQlz
cmMuYXNfYnl0ZXMgLT0gc3JjX29mZnQ7Cj4gCQlmb3IgKDsgcmVtYWluaW5nID49IFdPUkRfU0la
RTsgcmVtYWluaW5nIC09IFdPUkRfU0laRSkgewo+IAkJCWN1ciA9ICpzcmMuYXNfdWxvbmc7Cj4g
CQkJcHJldiA9ICotLXNyYy5hc191bG9uZzsKPiAJCQkqLS1kc3QuYXNfdWxvbmcgPSBjdXIgPDwg
KChXT1JEX1NJWkUgLSBzcmNfb2ZmdCkgKiA4KSB8Cj4gCQkJCQkgIHByZXYgPj4gKHNyY19vZmZ0
ICogOCk7Cj4gCQl9Cj4gCQlzcmMuYXNfYnl0ZXMgKz0gc3JjX29mZnQ7Cj4gCX0KPiAKPiAgdHJh
aWxpbmdfYnc6Cj4gCXdoaWxlIChyZW1haW5pbmctLSA+IDApCj4gCQkqLS1kc3QuYXNfYnl0ZXMg
PSAqLS1zcmMuYXNfYnl0ZXM7Cj4gfQo+IAo+IFJlZ2FyZHMsCj4gTmljawoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
