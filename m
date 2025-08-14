Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80549CA0ED1
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 05:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhuNfjCs9J5cbisUUBKJrOeqapBu+HqBG8CPs1nGjCw=; b=dRAN7tMM9M02RU
	lW3UZqfkOBUJhBpB8SqkhzSqESPjkgiHuQVIOlJ7dd498akxiY665bU+jdfxNPStoXYn66sSDrkxV
	TcYTRevILoYmjYVdh08wdInZ74SiZLE6l8HoZp9yIQSM1dsu6JfMA7nF3k4sjNJn7ExgINDv3L22D
	nrEZIapUcYhFe735jm6S5u4lV00ynVr+mlrr5hZxMcBaFjqrZncA9NMmFKXYw8KpqAmMbXQEJ0Uie
	00OMxqzQi8rZaXM5V8XpyfbAvRUmjxUQkogOLktzo2bA56Naw961Z+u7XluEtjdxO6HR/A4HSkBeO
	Uh6CecynZvuX/9UcjyLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umQ7c-0000000FnPc-3y0m;
	Thu, 14 Aug 2025 05:03:28 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umQ7a-0000000FnP7-0eNb
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 05:03:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755147802; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ntImf5J+UOrydq8pxjV1FsxBHnBAANDYN0HvR88uIR+nQ+NV48q0qO7FA1ibA2Exk1QQv5svsKOCvgJZ+xHiIpBLibFYYhY7eVQbGdV2W5lNkcI08uKD6GQ0ozZ8bv5nziJ3xXNrz9hn7NBYDFzr+W88YVtIssAkAeoX9VH9bHs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755147802; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gKJM5C644LG9rsg7duMR0KLnbszCz82kft+GL+KGUro=; 
	b=CKqBwa8oKb5MwYr3pxv0/19z5hay4GRIRxssFxxqSUdrsfDiNBXHgpQD0OltSo5/YMyVj6MmZ9rIR6vBGr8wXzbcBVEA1K+DlCxDL64Hiding9SdwxuJ0FZQlr0NCrjbisKbFbPGwtG2WwTLoG6S0+IR4eihRf+TN90n5CFAGGY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755147802;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=gKJM5C644LG9rsg7duMR0KLnbszCz82kft+GL+KGUro=;
	b=Bxm3cBrehiUEQB8zy1/W2o1kSecnuH3umONwv8l+gUpbPXZAMxQSn7n7F3aGKIgW
	OOY7+4crTW4nWjrX21o4/8oT7OdXPdX4CMzg7XPrd55FSl7netoQujY4GfKYZzI289N
	W3M6te0HIFJFHeCq6Ppi1IVbBok5h0H0d/5/Z8PvypLYNp/7/jECXWEWASc8qaPtVC2
	mCZKJTQRsnMYAiuBe9hzsarX0Do68I4D0OqVNQ4JLMmYRe24vGjN2Z7Gfs8SsHDmeT9
	gcTFu9Te21WfvD1THKrLtH8UcvJwSu3pSoA+B58pxzuaeSVt4L/0hh2rayT3AEZUC8q
	Zhq+reThHQ==
Received: by mx.zohomail.com with SMTPS id 1755147799613946.1322238706706;
	Wed, 13 Aug 2025 22:03:19 -0700 (PDT)
Message-ID: <fbbd4f01234d63d1a083944a3c90fa554a6ac458.camel@icenowy.me>
Subject: Re: [PATCH 2/2] clk: thead: th1520-ap: fix parent of padctrl0 clock
From: Icenowy Zheng <uwu@icenowy.me>
To: Guo Ren <guoren@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, Fu Wei <wefu@redhat.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>, Yao Zi <ziyao@disroot.org>,
 Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 14 Aug 2025 13:03:12 +0800
In-Reply-To: <CAJF2gTT-ryXrM87BwvK_wp9F_ZEsqUHKJdkxKbtJmiq_07g2rA@mail.gmail.com>
References: <20250813171136.2213309-1-uwu@icenowy.me>
	 <20250813171136.2213309-3-uwu@icenowy.me>
	 <CAJF2gTT-ryXrM87BwvK_wp9F_ZEsqUHKJdkxKbtJmiq_07g2rA@mail.gmail.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_220326_252347_0ED92432 
X-CRM114-Status: GOOD (  15.33  )
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

5ZyoIDIwMjUtMDgtMTTmmJ/mnJ/lm5vnmoQgMTE6MDggKzA4MDDvvIxHdW8gUmVu5YaZ6YGT77ya
Cj4gT24gVGh1LCBBdWcgMTQsIDIwMjUgYXQgMToxMuKAr0FNIEljZW5vd3kgWmhlbmcgPHV3dUBp
Y2Vub3d5Lm1lPiB3cm90ZToKPiA+IAo+ID4gVGhlIHBhZGN0cmwwIGNsb2NrIHNlZW1zIHRvIGJl
IGEgY2hpbGQgb2YgdGhlIHBlcmlzeXNfYXBiNF9oY2xrCj4gPiBjbG9jaywKPiA+IGdhdGluZyB0
aGUgbGF0ZXIgbWFrZXMgcGFkY3RybDAgcmVnaXN0ZXJzIHN0dWNrIHRvby4KPiA+IAo+ID4gRml4
IHRoaXMgcmVsYXRpb25zaGlwLgo+IFNob3VsZCBpdCBhZGQgYSAiRml4ZXM6IiB0YWc/CgpDb25z
aWRlcmluZyBwdWxsaW5nIHRoaXMgcGF0Y2ggcmVxdWlyZXMgcHVsbGluZyBQQVRDSCAxLzIgdG9v
LCBJIGRvdWJ0CndoZXRoZXIgdGhpcyBzaG91bGQgYmUgdGFnZ2VkIGEgZml4IGFuZCB0cmlnZ2Vy
IGEgYmFja3BvcnQgb3BlcmF0aW9uLgoKPiAKPiBPdGhlcnMsIExHVE0hCj4gCj4gUmV2aWV3ZWQt
Ynk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+IAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPiA+IC0tLQo+ID4gwqBkcml2ZXJzL2Ns
ay90aGVhZC9jbGstdGgxNTIwLWFwLmMgfCA1ICsrKystCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvY2xrL3RoZWFkL2Nsay10aDE1MjAtYXAuYwo+ID4gYi9kcml2ZXJzL2Nsay90aGVhZC9jbGst
dGgxNTIwLWFwLmMKPiA+IGluZGV4IGQwOGU3ZmIzODdlNTAuLmY2ZjNkNjNkNTMzNTMgMTAwNjQ0
Cj4gPiAtLS0gYS9kcml2ZXJzL2Nsay90aGVhZC9jbGstdGgxNTIwLWFwLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvY2xrL3RoZWFkL2Nsay10aDE1MjAtYXAuYwo+ID4gQEAgLTg4OCwxMyArODg4LDE2IEBA
IHN0YXRpYyBDQ1VfR0FURShDTEtfUEVSSVNZU19BUEIzX0hDTEssCj4gPiBwZXJpc3lzX2FwYjNf
aGNsaywgInBlcmlzeXMtYXBiMy1oY2xrIiwgcAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDB4MTUwLCAxMSwgQ0xLX0lTX0NSSVRJQ0FMKTsKPiA+IMKgc3RhdGljIENDVV9HQVRF
KENMS19QRVJJU1lTX0FQQjRfSENMSywgcGVyaXN5c19hcGI0X2hjbGssCj4gPiAicGVyaXN5cy1h
cGI0LWhjbGsiLCBwZXJpc3lzX2FoYl9oY2xrX3BkLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDB4MTUwLCAxMiwgMCk7Cj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfcGFy
ZW50X2RhdGEgcGVyaXN5c19hcGI0X2hjbGtfcGRbXSA9IHsKPiA+ICvCoMKgwqDCoMKgwqAgeyAu
aHcgPSAmcGVyaXN5c19hcGI0X2hjbGsuZ2F0ZS5odyB9LAo+ID4gK307Cj4gPiDCoHN0YXRpYyBD
Q1VfR0FURShDTEtfTlBVX0FYSSwgbnB1X2F4aV9jbGssICJucHUtYXhpIiwgYXhpX2FjbGtfcGQs
Cj4gPiAweDFjOCwgNSwgQ0xLX0lTX0NSSVRJQ0FMKTsKPiA+IMKgc3RhdGljIENDVV9HQVRFKENM
S19DUFUyVlAsIGNwdTJ2cF9jbGssICJjcHUydnAiLCBheGlfYWNsa19wZCwKPiA+IDB4MWUwLCAx
MywgQ0xLX0lTX0NSSVRJQ0FMKTsKPiA+IMKgc3RhdGljIENDVV9HQVRFKENMS19FTU1DX1NESU8s
IGVtbWNfc2Rpb19jbGssICJlbW1jLXNkaW8iLAo+ID4gZW1tY19zZGlvX3JlZl9jbGtfcGQsIDB4
MjA0LCAzMCwgMCk7Cj4gPiDCoHN0YXRpYyBDQ1VfR0FURShDTEtfR01BQzEsIGdtYWMxX2Nsaywg
ImdtYWMxIiwgZ21hY19wbGxfY2xrX3BkLAo+ID4gMHgyMDQsIDI2LCAwKTsKPiA+IMKgc3RhdGlj
IENDVV9HQVRFKENMS19QQURDVFJMMSwgcGFkY3RybDFfY2xrLCAicGFkY3RybDEiLAo+ID4gcGVy
aXN5c19hcGJfcGNsa19wZCwgMHgyMDQsIDI0LCAwKTsKPiA+IMKgc3RhdGljIENDVV9HQVRFKENM
S19EU01BUlQsIGRzbWFydF9jbGssICJkc21hcnQiLAo+ID4gcGVyaXN5c19hcGJfcGNsa19wZCwg
MHgyMDQsIDIzLCAwKTsKPiA+IC1zdGF0aWMgQ0NVX0dBVEUoQ0xLX1BBRENUUkwwLCBwYWRjdHJs
MF9jbGssICJwYWRjdHJsMCIsCj4gPiBwZXJpc3lzX2FwYl9wY2xrX3BkLCAweDIwNCwgMjIsIDAp
Owo+ID4gK3N0YXRpYyBDQ1VfR0FURShDTEtfUEFEQ1RSTDAsIHBhZGN0cmwwX2NsaywgInBhZGN0
cmwwIiwKPiA+IHBlcmlzeXNfYXBiNF9oY2xrX3BkLCAweDIwNCwgMjIsIDApOwo+ID4gwqBzdGF0
aWMgQ0NVX0dBVEUoQ0xLX0dNQUNfQVhJLCBnbWFjX2F4aV9jbGssICJnbWFjLWF4aSIsCj4gPiBh
eGk0X2NwdXN5czJfYWNsa19wZCwgMHgyMDQsIDIxLCAwKTsKPiA+IMKgc3RhdGljIENDVV9HQVRF
KENMS19HUElPMywgZ3BpbzNfY2xrLCAiZ3BpbzMtY2xrIiwKPiA+IHBlcmkyc3lzX2FwYl9wY2xr
X3BkLCAweDIwNCwgMjAsIDApOwo+ID4gwqBzdGF0aWMgQ0NVX0dBVEUoQ0xLX0dNQUMwLCBnbWFj
MF9jbGssICJnbWFjMCIsIGdtYWNfcGxsX2Nsa19wZCwKPiA+IDB4MjA0LCAxOSwgMCk7Cj4gPiAt
LQo+ID4gMi41MC4xCj4gPiAKPiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
