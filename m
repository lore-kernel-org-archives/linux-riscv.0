Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E1FCD5BB0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 15:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6wEJ7oUmqkUqOOY2/94gaw/Gn0rb0/+BKgPb6VPG8Qk=; b=nL1wiwHMNanXlV
	CkqKaKTVJYZhac7KOfLKUNc06gIES7DDXrxZGksjTIpiz5DFO6YO8z/67gyrZfuZMOu1Rp+xSXow2
	TPhgs9Hrvz369jlTOIQaDKnY4dShNSHKs4OZvp+/lGFup7mmtduk055AwKA3/ys9rFJJMU2gAvKty
	bt9HOjEXLGizjqQlg4W7lZ4lkE8rb2/JVMrZWpFcAwlSBfv53ZhbQknDP0c4OltFJq8C7uC9WCOoW
	EeXmG5/6VWYXJvc5E+fLMRWrVHe21dId9K6XuJ26M/mTNLbcQtVOz+TxzRAd0SDTi/nZ0W7QJLe0Y
	y+tMvbAzDM1qiDptUokg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQS3j-0000000BJjM-0Imh;
	Fri, 22 May 2026 15:45:11 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQS3g-0000000BJih-4APC
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 15:45:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779464700; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MthQAsQ7VaS2cV01SOjYqaKVzYj+V8Mq47BxTV1TfQiPQi9L9NTJMHPv9NKFnWEsZLnLKQ7+0+JGuWdl4I/KvmSTsQwzWfJPEYweUNWz1yKbcZyTiMTbzHu75EAYqrLxccbboXmgRi3N2l6lkdkHglCxYgS+YRAyq9bjuoI7Zbo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779464700; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SHKeFZi+B9S1Z91e4v9pT5BCHHl/avL5yLlkuQ2GHFA=; 
	b=js1SN6rkkAObJZzpvj+4Vh/hgT13iRJHwtfbF8dtz/42bXgzmQS4fr7AqWaY2k+FUtlb7/tmiZa7vMk4pT+qi7PDrkn8MFGcKDbzy+QtoiLu94uLKl99pjwtfgPJATPFSWDLth7NotxstgJ7MuKaoCVUGt8XF2THM/6ypIqfOxU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779464700;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=SHKeFZi+B9S1Z91e4v9pT5BCHHl/avL5yLlkuQ2GHFA=;
	b=eCf3Oa8hV3BblpYL5pdzwHtwwJjKC606O1P+5d7RltJGsDH5Y3vBGd4Qvd1Oce5U
	46HBNAthfonZZgvFdnyUSmQvysLn1eHAIE+guJycJdACshY7FwO5QCTaiFwYAlL/UyA
	z4j7YAoy/xBo8RXneq8Zd21YXA/+9kus9sTLJ8iE=
Received: by mx.zohomail.com with SMTPS id 1779464697907144.61503187448898;
	Fri, 22 May 2026 08:44:57 -0700 (PDT)
Date: Fri, 22 May 2026 15:44:40 +0000
From: Yao Zi <me@ziyao.cc>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: add support for siflower sf21-topcrm
Message-ID: <ahB46uuoFQxKgr7r@pie>
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-4-438f2e0513ff@gmail.com>
 <agsEWo_mo5rzUAAH@pie>
 <CAJsYDVJZW2VYFaxzJRg2+CJZbvqq_iRXaf7+zYvidQn0AiviKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJsYDVJZW2VYFaxzJRg2+CJZbvqq_iRXaf7+zYvidQn0AiviKQ@mail.gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_084509_111344_64143E31 
X-CRM114-Status: GOOD (  28.62  )
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

T24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgMDk6MzQ6MTdQTSArMDgwMCwgQ2h1YW5ob25nIEd1byB3
cm90ZToKPiBIaSEKPiAKPiBPbiBNb24sIE1heSAxOCwgMjAyNiBhdCA4OjIy4oCvUE0gWWFvIFpp
IDxtZUB6aXlhby5jYz4gd3JvdGU6Cj4gPgo+ID4gT24gU3VuLCBNYXkgMTcsIDIwMjYgYXQgMTA6
MTI6NThQTSArMDgwMCwgQ2h1YW5ob25nIEd1byB3cm90ZToKCi4uLgoKPiA+Cj4gPiBbLi4uXQo+
ID4KPiA+IEJlc2lkZXMgZmllbGQvcmVnaXN0ZXIgb2Zmc2V0cywgdGhlIG9ubHkgZGlmZmVyZW5j
ZSBJIGNvdWxkIHRlbGwgYmV0d2Vlbgo+ID4gY21ucGxsX3Bvc3RkaXYgYW5kIHBjaWVwbGxfZm91
dCBpcyB0aGF0IHBjaWVwbGxfZm91dCBjbG9ja3MgY291bGQgYmUKPiA+IGdhdGVkLgo+ID4KPiA+
IFdvdWxkIGl0IGJlIGEgZ29vZCBpZGVhIHRvIGRlc2NyaWJlIHRoZSBnYXRpbmcgZnVuY3Rpb24g
c2VwYXJhdGVseSBhcyBhCj4gPiBjbG9jaywgYW5kIG1lcmdlIHRoZSBjb21tb24gcGFydCBvZiBw
Y2llcGxsX2ZvdXQgYW5kIGNtbnBsbF9wb3N0ZGl2PyBJbgo+ID4gd2hpY2ggd2F5IHlvdSBjb3Vs
ZCBzYXZlIGEgbG90IG9mIG1vc3RseSBkdXBsaWNhdGVkIGNvZGUuCj4gCj4gSSBkb24ndCB0aGlu
ayBzby4gU2luY2UgdGhlIG1ham9yaXR5IG9mIHRoZSBleGlzdGluZyBjb2RlIGFyZSByZWdpc3Rl
cgo+IG9wZXJhdGlvbnMsIGFuZCB0aGUgcmVnaXN0ZXIgYml0IGxheW91dCBhcmUgY29tcGxldGVs
eSBkaWZmZXJlbnQsCj4gdGhlcmUgaXNuJ3QgbXVjaCB0byBzaGFyZSBiZXR3ZWVuIHRoZXNlIHR3
byBQTExzLgo+IFdyaXRpbmcgYSBzdHJ1Y3QgdG8gZGVzY3JpYmUgYm90aCByZWdpc3RlciBsYXlv
dXRzIHRvZ2V0aGVyIHNlZW1zCj4gdW5uZWNlc3NhcmlseSBjb21wbGljYXRlZCBhbmQgaGFyZGVy
IHRvIHJlYWQuCgpJJ20gbm90IHN1Z2dlc3RpbmcgbWVyZ2luZyB0aGUgaW1wbGVtZW50YXRpb24g
b2YgdGhlIHR3byBQTExzCnRoZW1zZWx2ZXMsIGJ1dCBvbmx5IHRoZSB0d28gdHlwZXMgb2YgY2xv
Y2tzIGRlcml2ZWQgZnJvbSB0aGVtLAppLmUuIGNtbnBsbF9wb3N0ZGl2IGFuZCBwY2llcGxsX2Zv
dXQuCgo+IEJUVyB0aGUgQ01OUExMIGFuZCBQQ0lFUExMIGFyZSBhY3R1YWxseSBkaWZmZXJlbnQg
aGFyZHdhcmUuCj4gVGhlIGZvcm1lciBpcyBhbiBpbnRlZ2VyIFBMTCB3aGlsZSB0aGUgbGF0dGVy
IGFjdHVhbGx5IHN1cHBvcnRzCj4gZnJhY3Rpb25hbCBvcGVyYXRpb25zLiBJIGRpZG4ndCBhZGQg
c3VwcG9ydCBmb3IgdGhlIGZyYWN0aW9uYWwgcGFydAo+IGR1ZSB0byB0aGUgbGFjayBvZiB1c2Ug
Y2FzZXMgYW5kIGRvY3VtZW50YXRpb24uIFBDSUUgYW5kIEdNQUMKPiBjbG9ja3MgYXJlIGZlZCBi
eSB0aGlzIFBMTCBhbmQgcmVxdWlyZSBleGFjdCBjbG9jayBmcmVxdWVuY2llcwo+IHdoaWNoIGNh
biBiZSBhY2hpZXZlZCB1c2luZyBvbmx5IHRoZSBpbnRlZ2VyIG1vZGUuCj4gCj4gPgo+ID4gPiAr
ICAgICAucmVjYWxjX3JhdGUgPSBzZjIxX3BjaWVwbGxfZm91dF9yZWNhbGNfcmF0ZSwKPiA+ID4g
KyAgICAgLmRldGVybWluZV9yYXRlID0gc2YyMV9wY2llcGxsX2ZvdXRfZGV0ZXJtaW5lX3JhdGUs
Cj4gPiA+ICsgICAgIC5zZXRfcmF0ZSA9IHNmMjFfcGNpZXBsbF9mb3V0X3NldF9yYXRlLAo+ID4g
PiArfTsKPiA+IFsuLi5dCj4gPiA+ICsKPiA+ID4gKyAgICAgc3Bpbl9sb2NrX2lycXNhdmUoY21u
X3ByaXYtPmxvY2ssIGZsYWdzKTsKPiA+ID4gKyAgICAgaWYgKGluZGV4KQo+ID4gPiArICAgICAg
ICAgICAgIHNmX3JtdyhjbW5fcHJpdiwgbXV4X3JlZywgMCwgQklUKG11eF9vZmZzKSk7Cj4gPiA+
ICsgICAgIGVsc2UKPiA+ID4gKyAgICAgICAgICAgICBzZl9ybXcoY21uX3ByaXYsIG11eF9yZWcs
IEJJVChtdXhfb2ZmcyksIDApOwo+ID4gPiArCj4gPiA+ICsgICAgIHNwaW5fdW5sb2NrX2lycXJl
c3RvcmUoY21uX3ByaXYtPmxvY2ssIGZsYWdzKTsKPiA+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiA+
ICt9Cj4gPgo+ID4gSSBiZWxpZXZlIGJlc2lkZXMgdGhlIGRpdmlkZXIgcmVsb2FkaW5nIHBhcnQs
IGNsa19tdXhfb3BzLAo+ID4gY2xrX2RpdmlkZXJfb3BzLCBhbmQgY2xrX2dhdGVfb3BzIGhhdmUg
YWxyZWFkeSBwcm92aWRlZCB0aGUgbG9naWMKPiA+IHlvdSBpbXBsZW1lbnRlZCBoZXJlLiBTbyBp
dCBtaWdodCBiZSBhIGJldHRlciBvcHRpb24gdG8gY29tcG9zaXRlIHRoZW0KPiA+IHRvZ2V0aGVy
IHRvIGltcGxlbWVudCB5b3VyIGNsb2NrcyBpbnN0ZWFkIG9mIGJ1aWxkaW5nIGZyb20gc2NyYXRj
aC4KPiAKPiBUaGUgZGl2aWRlciByZWxvYWRpbmcgaXMgdGhlIGV4YWN0IHJlYXNvbiBJIGNob3Nl
IHRvIG5vdCBjb21wb3NlIHRoZW0KPiB3aXRoIHRoZSBmdW5jdGlvbiB5b3UgbWVudGlvbmVkLiBU
aGUgcmVsb2FkaW5nIGJpdCBuZWVkIHRvIGJlIHNldCBvbgo+IGJvdGggY2xvY2sgZGl2aWRlciBj
aGFuZ2UgYW5kIGNsb2NrIGVuYWJsaW5nLCBiZWNhdXNlIHRoZSBjbG9jayBkaXZpZGVyCj4gbG9h
ZGluZyBvbmx5IGhhcHBlbnMgd2hlbiB0aGUgY2xvY2sgaXMgcnVubmluZy4gU2luY2UgSSBhbHJl
YWR5IGhhdmUKPiB0byB3cml0ZSB0d28gb2YgdGhlIHRocmVlIHBhcnRzIHlvdSBtZW50aW9uZWQs
IHRyeWluZyB0byByZXVzZQo+IGNsa19tdXhfb3BzIGRvZXNuJ3Qgc2VlbSB0byByZWR1Y2UgdGhl
IGNvZGUgY29tcGxleGl0eSBoZXJlLgoKWW91IGRvbid0IGhhdmUgdG8gd3JpdGUgZGl2aWRlci9n
YXRlIG9wZXJhdGlvbnMgZnJvbSBzY3JhdGNoLCBidXQgb25seQp3cmFwcGVycyB0aGF0IGZpcnN0
IGNhbGwgY2xrX3tkaXZpZGVyLGdhdGV9X29wcy4qIHRoZW4gdHJpZ2dlciBmcmVxdWVuY3kKcmVs
b2FkaW5nLgoKPiBJdCdzIGp1c3QgdHJhZGluZyBnZXRfcGFyZW50IGFuZCBzZXRfcGFyZW50IGNh
bGwgd2l0aCBvbmUgbW9yZSBsZXZlbAo+IGluIHRoZSBjbG9jayB0cmVlIGZvciBldmVyeSBjbG9j
ayBhbmQgbW9yZSBjb2RlIHRvIHdpcmUgdGhlbSB0b2dldGhlcgo+IGluIHRoZSBwcm9iZSBmdW5j
dGlvbi4KPiAKPiA+Cj4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19vcHMgc2YyMV9jbGtf
bXV4ZGl2X29wcyA9IHsKPiA+ID4gKyAgICAgLmVuYWJsZSA9IHNmMjFfbXV4ZGl2X2VuYWJsZSwK
PiA+ID4gKyAgICAgLmRpc2FibGUgPSBzZjIxX211eGRpdl9kaXNhYmxlLAo+ID4gPiArICAgICAu
aXNfZW5hYmxlZCA9IHNmMjFfbXV4ZGl2X2lzX2VuYWJsZWQsCj4gPiA+ICsgICAgIC5yZWNhbGNf
cmF0ZSA9IHNmMjFfbXV4ZGl2X3JlY2FsY19yYXRlLAo+ID4gPiArICAgICAuZGV0ZXJtaW5lX3Jh
dGUgPSBzZjIxX211eGRpdl9kZXRlcm1pbmVfcmF0ZSwKPiA+ID4gKyAgICAgLnNldF9yYXRlID0g
c2YyMV9tdXhkaXZfc2V0X3JhdGUsCj4gPiA+ICsgICAgIC5nZXRfcGFyZW50ID0gc2YyMV9tdXhk
aXZfZ2V0X3BhcmVudCwKPiA+ID4gKyAgICAgLnNldF9wYXJlbnQgPSBzZjIxX211eGRpdl9zZXRf
cGFyZW50LAo+ID4gPiArfTsKClJlZ2FyZHMsCllhbyBaaQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
