Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639B2C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Feb 2022 14:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nkUdtJYScJeiZUVE/eik4YT9/N0bdvOvMKRrkkNvFU=; b=Xa6panklsvmpaL
	H0SPKGPGFR9ZjHkGkomLqOiIBBqjj5Jn8GxW6DHS9lN4pvc5uKRwvM8jDFdqrTGWbJTpeRmNz/lt4
	6C8JhUHakNOjZMy/TD4tiKWBUbP+hj7q3AZ6V7EM/clv/PQt8Rzl0PtHC+qE8F8n74tJ3aQxC/fjS
	AFIyMuzsH2EO2NkIQ4xGHlQIG/exEOLVrSBtrgYTct7zfHPsCHG8xBxQaFobfKw7vU7QgJkXoP/B4
	maUFSdJbTisZ+WP3rNQhnZj7K71qMX0wLR7Gl3vlWU+4z15CBAFkZAyUkb1055AWkgPFfd6DDl+Xq
	DbXle+4ZZTkABFIIZ2TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3o8-00EjlD-GB; Fri, 18 Feb 2022 14:00:24 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL3o5-00EjkC-4B
 for linux-riscv@lists.infradead.org; Fri, 18 Feb 2022 14:00:22 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by mail.gandi.net (Postfix) with ESMTPSA id E214810001E;
 Fri, 18 Feb 2022 14:00:11 +0000 (UTC)
Message-ID: <5d36edd4-39ff-bc52-0b40-6f909a510b9e@ghiti.fr>
Date: Fri, 18 Feb 2022 15:00:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] riscv: mm: remove the BUG_ON check of mapping the last 4K
 bytes of memory
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: jszhang@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <mhng-790fdd34-b20e-4c0a-b36d-eb91b16a3e44@palmer-ri-x1c9>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mhng-790fdd34-b20e-4c0a-b36d-eb91b16a3e44@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_060021_349629_5E467B61 
X-CRM114-Status: GOOD (  24.51  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGFsbWVyLAoKT24gMi8xNS8yMiAwMDo0MSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24g
VHVlLCAyNSBKYW4gMjAyMiAwODoxMDo0MSBQU1QgKC0wODAwKSwgYWxleEBnaGl0aS5mciB3cm90
ZToKPj4KPj4gT24gMS8yNS8yMiAxNjo1NSwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPj4+IHJlbW92
ZSB0aGUgQlVHX09OIGNoZWNrIG9mIG1hcHBpbmcgdGhlIGxhc3QgNEsgYnl0ZXMgb2YgdGhlIGFk
ZHJlc3NhYmxlCj4+PiBtZW1vcnkgc2luY2UgInRoaXMgaXMgdHJ1ZSBmb3IgZXZlcnkga2VybmVs
IGFjdHVhbGx5IiBhcyBwb2ludGVkIG91dAo+Pj4gYnkgQWxleGFuZHJlLgo+Pj4KPj4+IFNpZ25l
ZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPj4+IFJldmlld2Vk
LWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+Cj4+PiAtLS0KPj4+IMKgIGFyY2gv
cmlzY3YvbW0vaW5pdC5jIHwgOCAtLS0tLS0tLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDggZGVs
ZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJj
aC9yaXNjdi9tbS9pbml0LmMKPj4+IGluZGV4IGNmNGQwMThiN2Q2Ni4uODM0N2QwZmRhOGNkIDEw
MDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9pbml0LmMKPj4+ICsrKyBiL2FyY2gvcmlzY3Yv
bW0vaW5pdC5jCj4+PiBAQCAtODExLDE0ICs4MTEsNiBAQCBhc21saW5rYWdlIHZvaWQgX19pbml0
IHNldHVwX3ZtKHVpbnRwdHJfdCBkdGJfcGEpCj4+PiDCoMKgwqDCoMKgIEJVR19PTigoUEFHRV9P
RkZTRVQgJSBQR0RJUl9TSVpFKSAhPSAwKTsKPj4+IMKgwqDCoMKgwqAgQlVHX09OKChrZXJuZWxf
bWFwLnBoeXNfYWRkciAlIFBNRF9TSVpFKSAhPSAwKTsKPj4+Cj4+PiAtI2lmZGVmIENPTkZJR182
NEJJVAo+Pj4gLcKgwqDCoCAvKgo+Pj4gLcKgwqDCoMKgICogVGhlIGxhc3QgNEsgYnl0ZXMgb2Yg
dGhlIGFkZHJlc3NhYmxlIG1lbW9yeSBjYW4gbm90IGJlIAo+Pj4gbWFwcGVkIGJlY2F1c2UKPj4+
IC3CoMKgwqDCoCAqIG9mIElTX0VSUl9WQUxVRSBtYWNyby4KPj4+IC3CoMKgwqDCoCAqLwo+Pj4g
LcKgwqDCoCBCVUdfT04oKGtlcm5lbF9tYXAudmlydF9hZGRyICsga2VybmVsX21hcC5zaXplKSA+
IAo+Pj4gQUREUkVTU19TUEFDRV9FTkQgLSBTWl80Syk7Cj4+PiAtI2VuZGlmCj4+Cj4+Cj4+IFRo
aXMgQlVHX09OIHNlZW1zIHByZXR0eSBsZWdpdCB0byBtZTogSSByZS1yZWFkIHRoZSBleGNoYW5n
ZXMgd2UgaGFkLAo+PiBhbmQgSSBzZWUgdGhhdCBJIGRpZG4ndCBub3RpY2UgdGhhdCBpbiB5b3Vy
IHYyLCB5b3UgYWN0dWFsbHkgcmVtb3ZlZCB0aGUKPj4gQlVHX09OLiBTbyB0aGF0J3MgbXkgYmFk
LCB3aGF0IEkgbWVhbnQgaW4gdGhlIGZpcnN0IHBsYWNlIHdhcyB0aGF0IHRoZQo+PiBCVUdfT04g
aXMgdHJ1ZSBmb3IgMzItYml0IGFuZCA2NC1iaXQga2VybmVscyBhY3R1YWxseS4KPgo+IFRoZXJl
J3MgYWN0dWFsbHkgYW4gaWZuZGVmIDY0QklUIGFib3ZlIHRoYXQgc29ydCBvZiBoYW5kbGVzIHRo
aXMgY2FzZSAKPiAodGhvdWdoIEkgZGlkbid0IGNoZWNrIHRvIHNlZSBpZiB3ZSdyZSBnZXR0aW5n
IHRoZSBsaW1pdHMgY29ycmVjdCwgc28gCj4gaXQgbWF5IG5vdCB3b3JrIHByb3Blcmx5KS7CoCBU
aGF0J3Mgc2hyaW5raW5nIHRoZSBtZW1vcnksIHJhdGhlciB0aGFuIAo+IGp1c3QgZmlyaW5nIGEg
QlVHLCBhbmQgaXQncyBub3QgcmVhbGx5IGFueSBtb3JlIGNvZGUgc28gd2Ugc2hvdWxkIGdvIAo+
IHRoYXQgd2F5IGZvciBib3RoLsKgIEkgY291bGQgc2VlIGxlYXZpbmcgYSBCVUcgaW4gdGhlcmUs
IG1heWJlIGp1c3QgCj4gZXhwbGljaXRseSB1c2luZyBJU19FUlJfVkFMVUUgYXMgdGhhdCdzIHJl
YWxseSB3aGF0IHdlJ3JlIGNoZWNraW5nIGZvciAKPiAodGhvdWdoIGlmIHRoYXQncyBub3QgNEsg
YSBidW5jaCBvZiBzdHVmZiB3aWxsIGJyZWFrLCBzbyBtYXliZSBpdCBqdXN0IAo+IGRvZXNuJ3Qg
bWF0dGVyKS4KCgpJIHRoaW5rIHlvdSdyZSB0YWxraW5nIGFib3V0OgoKbWVtb3J5X2xpbWl0ID0g
S0VSTl9WSVJUX1NJWkUgLSAoSVNfRU5BQkxFRChDT05GSUdfNjRCSVQpID8gU1pfNEcgOiAwKTsK
CklmIHllcywgdGhhdCdzIHNocmlua2luZyB0aGUgYXZhaWxhYmxlIHBoeXNpY2FsIG1lbW9yeSB3
ZSBjYW4gbWFwIGluIHRoZSAKbGluZWFyIG1hcHBpbmcsIHdoZXJlYXMgdGhlIEJVR19PTiBoZXJl
IGlzIHRyaWdnZXJlZCBpZiB0aGUga2VybmVsIAptYXBwaW5nIGlzIHZlcnkgKHZlcnkpIGxhcmdl
IGFuZCBvdmVybGFwcyB0aGUgbGFzdCAqNEsqIG9mIHRoZSBhZGRyZXNzIApzcGFjZSwgc28gSSBz
dGlsbCB0aGluayB0aGUgQlVHX09OIGlzIGxlZ2l0IGFsdGhvdWdoIHZlcnkgdW5saWtlbHkuCgpI
b3dldmVyLCBJJ20gd29uZGVyaW5nIGlmIHRoZSBzaHJpbmtpbmcgc3RpbGwgaG9sZHMgd2l0aCB0
aGUgcmVjZW50IG1vdmUgCm9mIEtBU0FOLCBJIG1heSBiZSBiYWNrIHdpdGggYSBmaXggZm9yIHRo
YXQuCgpBbGV4CgoKPgo+PiBTb3JyeSBteSBSQiB3YXMgbm90IHJpZ2h0IG9uIHRoaXMgb25lIDoo
Cj4+Cj4+IEFsZXgKPj4KPj4KPj4+IC0KPj4+IMKgwqDCoMKgwqAgcHRfb3BzX3NldF9lYXJseSgp
Owo+Pj4KPj4+IMKgwqDCoMKgwqAgLyogU2V0dXAgZWFybHkgUEdEIGZvciBmaXhtYXAgKi8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
