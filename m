Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E82EC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 14:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iZbGgjaautH86QrYMUhfCcqneENW5dT0qMny/KbRhZo=; b=mIEErqbuc5BOot
	Guzc0n7+Rlo1atP9lPNsGDbAGBK0tCxpgGBOWrjO3+Qh91rNN1iSqWkxGIm6wTpOC2SuWv2YEyEHM
	slRFZNKLWBhGEH7+vIuvOlKTtLWMmaYExxUAEZDo64LeJoRTrV80/QRqEKbxS/wvtqMgQ4FFqkCnD
	kJO2RMmORofagXv0U7Tv9+jrUcO+596uAVvSrmdUls/8sbw6LI/lr+dM43lYK9poUpwFPLDlNMmbX
	bLa0s94QncNwvm7GiMfoayrFG2ULxa1MufJNPD96jhFzSXB5YPBMBO6MkQZ5FwS8mIyiZdj1sh50U
	HBcRrP014XG5sKtr8Zwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouxK1-00C5iP-TF; Tue, 15 Nov 2022 14:53:57 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouxJz-00C5gd-2F
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 14:53:56 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id B0C8C1C0009;
	Tue, 15 Nov 2022 14:53:47 +0000 (UTC)
Message-ID: <1057a6ba-3778-f419-fb99-029c26092871@ghiti.fr>
Date: Tue, 15 Nov 2022 15:53:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] riscv: mm: Proper page permissions after initmem free
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org
References: <20221115090641.258476-1-bjorn@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20221115090641.258476-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_065355_274132_A3864F33 
X-CRM114-Status: GOOD (  24.63  )
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

SGkgQmrDtnJuLAoKT24gMTUvMTEvMjAyMiAxMDowNiwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBG
cm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiA2NC1iaXQgUklTQy1W
IGtlcm5lbHMgaGF2ZSB0aGUga2VybmVsIGltYWdlIG1hcHBlZCBzZXBhcmF0ZWx5IHRvIGFsaWFz
Cj4gdGhlIGxpbmVhciBtYXAuIFRoZSBsaW5lYXIgbWFwIGFuZCB0aGUga2VybmVsIGltYWdlIG1h
cCBhcmUgZG9jdW1lbnRlZAo+IGFzICJkaXJlY3QgbWFwcGluZyIgYW5kICJrZXJuZWwiIHJlc3Bl
Y3RpdmVseSBpbiBbMV0uCj4KPiBBdCBpbWFnZSBsb2FkIHRpbWUsIHRoZSBsaW5lYXIgbWFwIGNv
cnJlc3BvbmRpbmcgdG8gdGhlIGtlcm5lbCBpbWFnZQo+IGlzIHNldCB0byBQQUdFX1JFQUQgcGVy
bWlzc2lvbiwgYW5kIHRoZSBrZXJuZWwgaW1hZ2UgbWFwIGlzIHNldCB0bwo+IFBBR0VfUkVBRHxQ
QUdFX0VYRUMuCj4KPiBXaGVuIHRoZSBpbml0bWVtIGlzIGZyZWVkLCB0aGUgcGFnZXMgaW4gdGhl
IGxpbmVhciBtYXAgc2hvdWxkIGJlCj4gcmVzdG9yZWQgdG8gUEFHRV9SRUFEfFBBR0VfV1JJVEUs
IHdoZXJlYXMgdGhlIGNvcnJlc3BvbmRpbmcgcGFnZXMgaW4KPiB0aGUga2VybmVsIGltYWdlIG1h
cCBzaG91bGQgYmUgcmVzdG9yZWQgdG8gUEFHRV9SRUFELCBieSByZW1vdmluZyB0aGUKPiBQQUdF
X0VYRUMgcGVybWlzc2lvbi4KPgo+IFRoaXMgaXMgbm90IHRoZSBjYXNlLiBGb3IgNjQtYml0IGtl
cm5lbHMsIG9ubHkgdGhlIGxpbmVhciBtYXAgaXMKPiByZXN0b3JlZCB0byBpdHMgcHJvcGVyIHBh
Z2UgcGVybWlzc2lvbnMgYXQgaW5pdG1lbSBmcmVlLCBhbmQgbm90IHRoZQo+IGtlcm5lbCBpbWFn
ZSBtYXAuCj4KPiBJbiBwcmFjdGlzZSB0aGlzIHJlc3VsdHMgaW4gdGhhdCB0aGUga2VybmVsIGNh
biBwb3RlbnRpYWxseSBqdW1wIHRvCj4gZGVhZCBfX2luaXQgY29kZSwgYW5kIHN0YXJ0IGV4ZWN1
dGluZyBpbnZhbGlkIGluc3RydWN0aW9ucywgd2l0aG91dAo+IGdldHRpbmcgYW4gZXhjZXB0aW9u
Lgo+Cj4gUmVzdG9yZSB0aGUgZnJlZWQgaW5pdG1lbSBwcm9wZXJseSwgYnkgc2V0dGluZyBib3Ro
IHRoZSBrZXJuZWwgaW1hZ2UKPiBtYXAgdG8gdGhlIGNvcnJlY3QgcGVybWlzc2lvbnMuCj4KPiBb
MV0gRG9jdW1lbnRhdGlvbi9yaXNjdi92bS1sYXlvdXQucnN0Cj4KPiBGaXhlczogZTVjMzVmYTA0
MDE5ICgicmlzY3Y6IE1hcCB0aGUga2VybmVsIHdpdGggY29ycmVjdCBwZXJtaXNzaW9ucyB0aGUg
Zmlyc3QgdGltZSIpCj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3Np
bmMuY29tPgo+IC0tLQo+IHYyOiAqIERvIG5vdCBzZXQgdGhlIGtlcm5lbCBpbWFnZSBtYXAgdG8g
UEFHRV9XUklURS4gKEFsZXgpCj4gICAgICAqIE1hc3NhZ2VkIHRoZSBjb21taXQgbWVzc2FnZSBh
IGJpdC4KPiAgICAgIAo+IFNhbXVlbCwgSSByZW1vdmVkIHlvdXIgUmV2aWV3ZWQtYnk6L1Rlc3Rl
ZC1ieTogZm9yIHRoZSB2Mi4KPiAtLS0KPiAgIGFyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgfCA5
ICsrKysrLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvc2V0dXAuYwo+IGluZGV4IDY3ZWMxZmFkY2ZlMi4uODZhY2Q2OTBkNTI5IDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9zZXR1cC5jCj4gQEAgLTMyMiwxMCArMzIyLDExIEBAIHN1YnN5c19pbml0Y2FsbCh0
b3BvbG9neV9pbml0KTsKPiAgIAo+ICAgdm9pZCBmcmVlX2luaXRtZW0odm9pZCkKPiAgIHsKPiAt
CWlmIChJU19FTkFCTEVEKENPTkZJR19TVFJJQ1RfS0VSTkVMX1JXWCkpCj4gLQkJc2V0X2tlcm5l
bF9tZW1vcnkobG1fYWxpYXMoX19pbml0X2JlZ2luKSwgbG1fYWxpYXMoX19pbml0X2VuZCksCj4g
LQkJCQkgIElTX0VOQUJMRUQoQ09ORklHXzY0QklUKSA/Cj4gLQkJCQkJc2V0X21lbW9yeV9ydyA6
IHNldF9tZW1vcnlfcndfbngpOwo+ICsJaWYgKElTX0VOQUJMRUQoQ09ORklHX1NUUklDVF9LRVJO
RUxfUldYKSkgewo+ICsJCXNldF9rZXJuZWxfbWVtb3J5KGxtX2FsaWFzKF9faW5pdF9iZWdpbiks
IGxtX2FsaWFzKF9faW5pdF9lbmQpLCBzZXRfbWVtb3J5X3J3X254KTsKPiArCQlpZiAoSVNfRU5B
QkxFRChDT05GSUdfNjRCSVQpKQo+ICsJCQlzZXRfa2VybmVsX21lbW9yeShfX2luaXRfYmVnaW4s
IF9faW5pdF9lbmQsIHNldF9tZW1vcnlfbngpOwo+ICsJfQo+ICAgCj4gICAJZnJlZV9pbml0bWVt
X2RlZmF1bHQoUE9JU09OX0ZSRUVfSU5JVE1FTSk7Cj4gICB9CgoKVGhpcyBsb29rcyBnb29kIHRv
IG1lLCBJIHRlc3RlZCBpdCBvbiBib3RoIGRlZmNvbmZpZyBhbmQgcnYzMl9kZWZjb25maWcgCm9u
IHFlbXUsIHNvIHlvdSBjYW4gYWRkOgoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxl
eEBnaGl0aS5mcj4KVGVzdGVkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+CgpU
aGFua3MsCgpBbGV4CgoKPiBiYXNlLWNvbW1pdDogMjJkY2UyYjg5ZDYwNDNkNWMzZjY4Mzg0Mjg1
ZmZmNTUwNjEwOTMxNwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
