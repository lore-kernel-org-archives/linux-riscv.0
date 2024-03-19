Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84401CD11BF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 16:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2cBNq9V0OFqCvk0Y2Oo62pzH/DmJNwUhoT539NNvD8=; b=xjPAhPfXrPpavn
	ig+hAX3WeLme83rbZxNvGxMV7/8zDwpYB1YyTqng93W5KtXbnfDr1dRGE1yIDAD20RhyS2ZPhstv/
	72f5ij4hGhrxMzVKFUZUIH/sW6YWMOPi08d5Jy7bVAms/OE4SicSYj/BwBAe+6A6qPgI7OOF2WCt9
	GisvDgJ5N14fFxo/GJpegIf02NRDs2RgRmypNHBwQK1GP2sSxTzBk1k1t5yqabWVCk/yxzYlEDgKp
	aerYDqKrmiovbFNwHmuQRiBykhxScjy5AUF6NfOKNo+BVo/U/Y/04Kzz37/8C36evbf8RQLJ9pEC8
	23vACFW/Ma64S7ebCKBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmch4-0000000DULZ-1zZF;
	Tue, 19 Mar 2024 16:52:06 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmch0-0000000DUKR-49Lb
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 16:52:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4B1FE0004;
	Tue, 19 Mar 2024 16:51:54 +0000 (UTC)
Message-ID: <b5624bba-9917-421b-8ef0-4515d442f80b@ghiti.fr>
Date: Tue, 19 Mar 2024 17:51:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Define TASK_SIZE_MAX for __access_ok()
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton
 <akpm@linux-foundation.org>, Charlie Jenkins <charlie@rivosinc.com>,
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Xiao Wang <xiao.w.wang@intel.com>,
 Yangyu Chen <cyy@cyyself.name>, linux-kernel@vger.kernel.org
References: <20240313180010.295747-1-samuel.holland@sifive.com>
 <CAHVXubjLWZkjSapnsWJzimWg_2swEy7tQ-DQ6ri8yMk8-Qsc-A@mail.gmail.com>
 <88de4a1a-047e-4be9-b5b0-3e53434dc022@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <88de4a1a-047e-4be9-b5b0-3e53434dc022@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_095203_330113_4923FD58 
X-CRM114-Status: GOOD (  28.95  )
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

SGnCoCBTYW11ZWwsCgpPbiAxOC8wMy8yMDI0IDIyOjI5LCBTYW11ZWwgSG9sbGFuZCB3cm90ZToK
PiBIaSBBbGV4LAo+Cj4gT24gMjAyNC0wMy0xOCAzOjUwIFBNLCBBbGV4YW5kcmUgR2hpdGkgd3Jv
dGU6Cj4+IE9uIFdlZCwgTWFyIDEzLCAyMDI0IGF0IDc6MDDigK9QTSBTYW11ZWwgSG9sbGFuZAo+
PiA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4+PiBUQVNLX1NJWkVfTUFYIHNo
b3VsZCBiZSBzZXQgdG8gdGhlIGxhcmdlc3QgdXNlcnNwYWNlIGFkZHJlc3MgdW5kZXIgYW55Cj4+
PiBydW50aW1lIGNvbmZpZ3VyYXRpb24uIFRoaXMgb3B0aW1pemVzIHRoZSBjaGVjayBpbiBfX2Fj
Y2Vzc19vaygpLCB3aGljaAo+Pj4gbm8gbG9uZ2VyIG5lZWRzIHRvIGNvbXB1dGUgdGhlIGN1cnJl
bnQgdmFsdWUgb2YgVEFTS19TSVpFLiBJdCBpcyBzdGlsbAo+Pj4gc2FmZSBiZWNhdXNlIGFkZHJl
c3NlcyBiZXR3ZWVuIFRBU0tfU0laRSBhbmQgVEFTS19TSVpFX01BWCBhcmUgaW52YWxpZAo+Pj4g
YXQgdGhlIGhhcmR3YXJlIGxldmVsLgo+Pj4KPj4+IFRoaXMgcmVtb3ZlcyBhYm91dCBoYWxmIG9m
IHRoZSByZWZlcmVuY2VzIHRvIHBndGFibGVfbFs0NV1fZW5hYmxlZC4KPj4+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPj4+IC0t
LQo+Pj4KPj4+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmggfCAxICsKPj4+
ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICAgfCAxICsKPj4+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFi
bGUtNjQuaAo+Pj4gaW5kZXggYjk5YmQ2NjEwN2E2Li5hNjc3ZWYzYzBmZTIgMTAwNjQ0Cj4+PiAt
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtNjQuaAo+Pj4gKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmgKPj4+IEBAIC0xNyw2ICsxNyw3IEBAIGV4dGVy
biBib29sIHBndGFibGVfbDVfZW5hYmxlZDsKPj4+ICAgI2RlZmluZSBQR0RJUl9TSElGVF9MNCAg
MzkKPj4+ICAgI2RlZmluZSBQR0RJUl9TSElGVF9MNSAgNDgKPj4+ICAgI2RlZmluZSBQR0RJUl9T
SVpFX0wzICAgKF9BQygxLCBVTCkgPDwgUEdESVJfU0hJRlRfTDMpCj4+PiArI2RlZmluZSBQR0RJ
Ul9TSVpFX0w1ICAgKF9BQygxLCBVTCkgPDwgUEdESVJfU0hJRlRfTDUpCj4+Pgo+Pj4gICAjZGVm
aW5lIFBHRElSX1NISUZUICAgICAocGd0YWJsZV9sNV9lbmFibGVkID8gUEdESVJfU0hJRlRfTDUg
OiBcCj4+PiAgICAgICAgICAgICAgICAgIChwZ3RhYmxlX2w0X2VuYWJsZWQgPyBQR0RJUl9TSElG
VF9MNCA6IFBHRElSX1NISUZUX0wzKSkKPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+PiBp
bmRleCA2MDY2ODIyZTczOTYuLjIwMzJmOGFjNWZjNSAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3BndGFibGUuaAo+Pj4gQEAgLTg2Nyw2ICs4NjcsNyBAQCBzdGF0aWMgaW5saW5lIHB0ZV90IHB0
ZV9zd3BfY2xlYXJfZXhjbHVzaXZlKHB0ZV90IHB0ZSkKPj4+ICAgI2lmZGVmIENPTkZJR182NEJJ
VAo+Pj4gICAjZGVmaW5lIFRBU0tfU0laRV82NCAgIChQR0RJUl9TSVpFICogUFRSU19QRVJfUEdE
IC8gMikKPj4+ICAgI2RlZmluZSBUQVNLX1NJWkVfTUlOICAoUEdESVJfU0laRV9MMyAqIFBUUlNf
UEVSX1BHRCAvIDIpCj4+PiArI2RlZmluZSBUQVNLX1NJWkVfTUFYICAoUEdESVJfU0laRV9MNSAq
IFBUUlNfUEVSX1BHRCAvIDIpCj4+Pgo+Pj4gICAjaWZkZWYgQ09ORklHX0NPTVBBVAo+Pj4gICAj
ZGVmaW5lIFRBU0tfU0laRV8zMiAgIChfQUMoMHg4MDAwMDAwMCwgVUwpKQo+Pj4gLS0KPj4+IDIu
NDMuMQo+Pj4KPj4gSSB0aGluayB5b3UgYWxzbyBuZWVkIHRvIGNoYW5nZSB0aGUgY2hlY2sgaW4g
aGFuZGxlX3BhZ2VfZmF1bHQoKSBieQo+PiB1c2luZyBUQVNLX1NJWkVfTUFYIGluc3RlYWQgb2Yg
VEFTS19TSVpFLCBvdGhlcndpc2UgdGhlIGZpeHVwIGNhbid0Cj4+IGhhcHBlbiAoaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9hcmNoL3Jpc2N2L21tL2ZhdWx0
LmMjTDI3MykuCj4gSXQgaXMgbm90IG5lY2Vzc2FyeSB0byBjaGFuZ2UgdGhhdCBjaGVjayBpbiBm
YXVsdC5jIHVubGVzcyB3ZSBleHBlY3QgdG8gaGFuZGxlCj4gZXhjZXB0aW9ucyAob3V0c2lkZSBv
ZiB1c2Vyc3BhY2UgYWNjZXNzIHJvdXRpbmVzKSBmb3IgYWRkcmVzc2VzIGJldHdlZW4KPiBUQVNL
X1NJWkUgYW5kIFRBU0tfU0laRV9NQVguCgoKV2hpY2ggSSB0aGluayBjb3VsZCBiZSB0aGUgY2Fz
ZSBpZiBzb21lIGNvZGUgaXMgb25seSB1c2luZyB0aGUgIm5ldyIgCmFjY2Vzc19vaygpIHdpdGhv
dXQgdGhlIHVhY2Nlc3Mgcm91dGluZXMgKHdoaWNoIGlzIHdyb25nIHllcywgYnV0IHN1Y2ggCmNv
ZGUgaXMgYXQgdGhlIG9yaWdpbiBvZiB0aGlzIGNoZWNrKS4KCgo+IEl0IGxvb2tzIGxpa2UgdGhl
IGNhbGwgdG8gZml4dXBfZXhjZXB0aW9uKCkgW2FkZGVkCj4gaW4gNDE2NzIxZmYwNWZkICgicmlz
Y3YsIG1tOiBQZXJmb3JtIEJQRiBleGhhbmRsZXIgZml4dXAgb24gcGFnZSBmYXVsdCIpXSBpcwo+
IG9ubHkgaW50ZW5kZWQgdG8gY2F0Y2ggbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlcy4gU28gbWFr
aW5nIHRoZSBjaGFuZ2Ugd291bGRuJ3QKPiBoYXZlIGFueSBmdW5jdGlvbmFsIGltcGFjdCwgYnV0
IGl0IHdvdWxkIHN0aWxsIGJlIGEgdmFsaWQgb3B0aW1pemF0aW9uLgo+Cj4+IE9yIEkgd2FzIHdv
bmRlcmluZyBpZiBpdCB3b3VsZCBub3QgYmUgYmV0dGVyIHRvIGRvIGxpa2UgeDg2IGFuZCB1c2Ug
YW4KPj4gYWx0ZXJuYXRpdmUsIGl0IHdvdWxkIGJlIG1vcmUgY29ycmVjdCAoZXZlbiB0aG91Z2gg
SSBiZWxpZXZlIHlvdXIKPj4gc29sdXRpb24gd29ya3MpCj4+IGh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvYXJjaC94ODYvaW5jbHVkZS9hc20vcGFnZV82NC5o
I0w4Mi4KPiBXaGF0IHdvdWxkIGJlIHRoZSBiZW5lZml0IG9mIHVzaW5nIGFuIGFsdGVybmF0aXZl
PyBBbnkgYWNjZXNzIHRvIGFuIGFkZHJlc3MKPiBiZXR3ZWVuIFRBU0tfU0laRSBhbmQgVEFTS19T
SVpFX01BWCBpcyBndWFyYW50ZWVkIHRvIGdlbmVyYXRlIGEgcGFnZSBmYXVsdCwgc28KPiB0aGUg
b25seSBiZW5lZml0IEkgc2VlIGlzIHJldHVybmluZyAtRUZBVUxUIHNsaWdodGx5IGZhc3RlciBh
dCB0aGUgY29zdCBvZgo+IGFwcGx5aW5nIGEgZmV3IGh1bmRyZWQgYWx0ZXJuYXRpdmVzIGF0IGJv
b3QuIEJ1dCBpdCdzIHBvc3NpYmxlIEknbSBtaXNzaW5nCj4gc29tZXRoaW5nLgoKClRoZSB1c2Ug
b2YgYWx0ZXJuYXRpdmVzIGFsbG93cyB0byByZXR1cm4gcmlnaHQgYXdheSBpZiB0aGUgYnVmZmVy
IGlzIApiZXlvbmQgdGhlIHVzYWJsZSB1c2VyIGFkZHJlc3Mgc3BhY2UsIGFuZCBpdCdzIG5vdCBq
dXN0ICJzbGlnaHRseSAKZmFzdGVyIiBmb3Igc29tZSBjYXNlcyAoYSB2ZXJ5IGxhcmdlIGJ1ZmZl
ciB3aXRoIG9ubHkgYSBmZXcgYnl0ZXMgYmVpbmcgCmJleW9uZCB0aGUgbGltaXQgb3Igc29tZW9u
ZSBjb3VsZCBmYXVsdC1pbiBhbGwgdGhlIHVzZXIgcGFnZXMgYW5kIGZhaWwgCnZlcnkgbGF0ZS4u
LmV0YykuIGFjY2Vzc19vaygpIGlzIGhlcmUgdG8gZ3VhcmFudGVlIHRoYXQgc3VjaCBzaXR1YXRp
b25zIApkb24ndCBoYXBwZW4sIHNvIGFjdHVhbGx5IGl0IG1ha2VzIG1vcmUgc2Vuc2UgdG8gdXNl
IGFuIGFsdGVybmF0aXZlIHRvIAphdm9pZCB0aGF0LgoKCkFsZXgKCgo+IFJlZ2FyZHMsCj4gU2Ft
dWVsCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
