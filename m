Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D06CA101F
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 08:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejMjQfFQqErWjZSrVpFNPl8mbEMs+V/Jl0hCLDtJa1Y=; b=i3vfor50vgu9VW
	ZjdSuwvoFS3gGRaeao+4/TTk4FozWI8nua/bc95Xj4CthfP/MpXffeH5Nr5G3BBuX6F3DW1rASw+i
	dvGibWTGm5htjUQA9gxgC+/FD29uO0/HkTwsXz6CJY2C+wAdgjIzAWwyK45vvS/e1gpurP1dVN6vT
	EQGFPVjdg4LtYh4F7LAfXKkSi8/duwS1E0i4OrWJf72DORBZgq1dEYV9y+QIDvejOW178RFTIOUkQ
	V+yxjDTrkLWIEBxMsiLnmoB+0SGqpcdVE28w7DgrsuPSpjs7//SY2u/jyGfH1Uu1+iqV3YbqW28Yy
	8g7qH+ASAZfT4iihm/WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGLk-0000000CzHJ-2ZJq;
	Wed, 10 Sep 2025 08:38:44 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGLh-0000000CzGL-410O
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 08:38:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757493516; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VygQp597WaS2coftTW2H3rQ3SWR5dW1VJpYekZnR6UDXUcptAdL1qR9QmQkjzHDrHMWQB7J26vbPVh6RMTc0ryLdnfkomEw9gWc/Xfq9q4Krm780d/0kqYu2NQJE4SRPotEvD+PLNsZrp7HTBkswu2e3/1lhm3aTTiNZAS+TVl8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757493516; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dO9LhUFt5CeCItAdJDAyUesTKortJiHsNYmFxK5UX0I=; 
	b=amaLbB/J8o1tpLyX2yvkwUyn8Rd7x3/z0zSd1MPRZuPoDjSwKXXM4nWEkrbuSVw1R9drsUC3SyoljIpYkpl+LdYwqnUl+vcDciHHxsXX94CJh9JjwSBUDO0hls+d8ptDhqzPQGJShCQFv63OdK56NdJ3mRz5lOSb80jqZW5j0JA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757493516;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=dO9LhUFt5CeCItAdJDAyUesTKortJiHsNYmFxK5UX0I=;
	b=dar0k1kQCwMXrgElAfKMZ6rjqq3yAQsywd6/NR7D//bTwA+XQIwkBAC1SJ6fN54t
	pKThEeHe7iw+bqUMcNUNdsAyHxkma1ze7FBDcif/wtWh4sAJ6ROXXV1tWhVLHCESHRb
	3BW3TWFBFo7rNymYo0SfhNrsNqfX+lg4HEDHT7mQ=
Received: by mx.zohomail.com with SMTPS id 1757493508558954.4218351468447;
	Wed, 10 Sep 2025 01:38:28 -0700 (PDT)
Message-ID: <9a0eedb5-1d90-4bdb-9bc3-4b3ade29cc2f@zohomail.com>
Date: Wed, 10 Sep 2025 16:38:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] clk: canaan: Add clock driver for Canaan K230
To: Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20250905-b4-k230-clk-v8-0-96caa02d5428@zohomail.com>
 <20250905-b4-k230-clk-v8-2-96caa02d5428@zohomail.com> <aLz4Q7LZFEfQQGUj@pie>
 <0947d9cc-86ba-46e0-92aa-04f4714e7a20@zohomail.com>
 <8ca70773-42b0-4dcc-8b54-338594e9a8ea@iscas.ac.cn>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <8ca70773-42b0-4dcc-8b54-338594e9a8ea@iscas.ac.cn>
Feedback-ID: rr0801122721eb2b2cfbde78b1a786bd58000076718b310158f27cfa3464eca44859bce125b648e8a25c5d35:zu08011227a06aac7a5cd58a25162aad5300002c0f1abb8414dc1dd3cbc0a960524f2538d0f8a740f0c120ae:rf0801122cea59dc67dd6f1b730040746700001b15077359642322a5d7c756be2477dd7a8e8d4849b3c6f97bd5d5e0df3f:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_013842_059556_7D3B4339 
X-CRM114-Status: GOOD (  12.12  )
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

Ck9uIDIwMjUvOS85IDE1OjAyLCBWaXZpYW4gV2FuZyB3cm90ZToKPiBPbiA5LzgvMjUgMjI6MTMs
IFh1a2FpIFdhbmcgd3JvdGU6Cj4+Pj4gWy4uLl0KPj4+Pgo+Pj4+ICsKPj4+PiArc3RhdGljIGlu
dCBrMjMwX2Nsa19zZXRfcmF0ZV9tdWxfZGl2KHN0cnVjdCBjbGtfaHcgKmh3LCB1bnNpZ25lZCBs
b25nIHJhdGUsCj4+Pj4gKwkJCQkgICAgIHVuc2lnbmVkIGxvbmcgcGFyZW50X3JhdGUpCj4+Pj4g
K3sKPj4+PiArCXN0cnVjdCBrMjMwX2Nsa19yYXRlICpjbGsgPSBod190b19rMjMwX2Nsa19yYXRl
KGh3KTsKPj4+PiArCXN0cnVjdCBrMjMwX2Nsa19yYXRlX3NlbGYgKnJhdGVfc2VsZiA9ICZjbGst
PmNsazsKPj4+PiArCXUzMiBkaXYsIG11bCwgZGl2X3JlZywgbXVsX3JlZzsKPj4+PiArCj4+Pj4g
KwlpZiAocmF0ZSA+IHBhcmVudF9yYXRlKQo+Pj4+ICsJCXJldHVybiAtRUlOVkFMOwo+Pj4+ICsK
Pj4+PiArCWlmIChyYXRlX3NlbGYtPnJlYWRfb25seSkKPj4+PiArCQlyZXR1cm4gMDsKPj4+PiAr
Cj4+Pj4gKwlpZiAoazIzMF9jbGtfZmluZF9hcHByb3hpbWF0ZV9tdWxfZGl2KHJhdGVfc2VsZi0+
bXVsX21pbiwgcmF0ZV9zZWxmLT5tdWxfbWF4LAo+Pj4+ICsJCQkJCSAgICAgIHJhdGVfc2VsZi0+
ZGl2X21pbiwgcmF0ZV9zZWxmLT5kaXZfbWF4LAo+Pj4+ICsJCQkJCSAgICAgIHJhdGUsIHBhcmVu
dF9yYXRlLCAmZGl2LCAmbXVsKSkKPj4+PiArCQlyZXR1cm4gLUVJTlZBTDsKPj4+PiArCj4+Pj4g
KwlndWFyZChzcGlubG9jaykocmF0ZV9zZWxmLT5sb2NrKTsKPj4+PiArCj4+Pj4gKwlkaXZfcmVn
ID0gcmVhZGwocmF0ZV9zZWxmLT5yZWcgKyBjbGstPmRpdl9yZWdfb2ZmKTsKPj4+PiArCWRpdl9y
ZWcgfD0gKChkaXYgLSAxKSAmIHJhdGVfc2VsZi0+ZGl2X21hc2spIDw8IChyYXRlX3NlbGYtPmRp
dl9zaGlmdCk7Cj4+Pj4gKwlkaXZfcmVnIHw9IEJJVChyYXRlX3NlbGYtPndyaXRlX2VuYWJsZV9i
aXQpOwo+Pj4+ICsJd3JpdGVsKGRpdl9yZWcsIHJhdGVfc2VsZi0+cmVnICsgY2xrLT5kaXZfcmVn
X29mZik7Cj4+Pj4gKwo+Pj4+ICsJbXVsX3JlZyA9IHJlYWRsKHJhdGVfc2VsZi0+cmVnICsgY2xr
LT5tdWxfcmVnX29mZik7Cj4+Pj4gKwltdWxfcmVnIHw9ICgobXVsIC0gMSkgJiByYXRlX3NlbGYt
Pm11bF9tYXNrKSA8PCAocmF0ZV9zZWxmLT5tdWxfc2hpZnQpOwo+Pj4+ICsJbXVsX3JlZyB8PSBC
SVQocmF0ZV9zZWxmLT53cml0ZV9lbmFibGVfYml0KTsKPj4+PiArCXdyaXRlbChtdWxfcmVnLCBy
YXRlX3NlbGYtPnJlZyArIGNsay0+bXVsX3JlZ19vZmYpOwo+Pj4+ICsKPj4+PiArCXJldHVybiAw
Owo+Pj4+ICt9Cj4+PiBUaGVyZSBhcmUgdGhyZWUgdmFyaWFudHMgb2YgcmF0ZSBjbG9ja3MsIG11
bC1vbmx5LCBkaXYtb25seSBhbmQgbXVsLWRpdgo+Pj4gb25lcywgd2hpY2ggYXJlIHNpbWlsYXIg
dG8gY2xrLW11bHRpcGxpZXIsIGNsay1kaXZpZGVyLAo+Pj4gY2xrLWZyYWN0aW9uYWwtZGl2aWRl
ci4KPj4+Cj4+PiBUaGUgb25seSBkaWZmZXJlbmNlIGlzIHRvIHNldHVwIG5ldyBwYXJhbWV0ZXJz
IGZvciBLMjMwJ3MgcmF0ZSBjbG9ja3MsCj4+PiBhIHJlZ2lzdGVyIGJpdCwgZGVzY3JpYmVkIGFz
IGsyMzBfY2xrX3JhdGVfc2VsZi53cml0ZV9lbmFibGVfYml0LCBtdXN0Cj4+PiBiZSBzZXQgZmly
c3QuCj4+IEFjdHVhbGx5LCBJIHRoaW5rIHRoZSBkaWZmZXJlbmNlcyBhcmUgbm90IGxpbWl0ZWQg
dG8ganVzdCB0aGUKPj4gd3JpdGVfZW5hYmxlX2JpdC4gVGhlcmUgYXJlIGFsc28gZGlzdGluY3Qg
bXVsX21pbiwgbXVsX21heCwgZGl2X21pbiwgYW5kCj4+IGRpdl9tYXggdmFsdWVzLCB3aGljaCBh
cmUgbm90IHR5cGljYWxseSBqdXN0IDEgYW5kICgxIDw8IGJpdF93aWR0aCkgYXMKPj4gaW4gc3Rh
bmRhcmQgY2xvY2sgZGl2aWRlciBvciBtdWx0aXBsaWVyIHN0cnVjdHVyZXMuCj4gU28gdGhlIHBh
cnQgSSBoYXZlIGJlZW4gdGhpbmtpbmcgYWJvdXQgaXMsIGNvbnNpZGVyIGp1c3QgY2hlY2tpbmcg
dGhlCj4ge211bCxkaXZ9X3ttaW4sbWF4fSB2YWx1ZXMgdG8gZGV0ZXJtaW5lIHdoaWNoIGtpbmQg
aXQgaXM/IEFzIGlzIHRoaXMgaXMKPiBqdXN0IHJlZHVuZGFudCBpbmZvcm1hdGlvbiwgc2luY2Ug
eW91IGNhbiBpbmZlciB3aGV0aGVyIHRoZXJlIGlzIGEKPiBjb25maWd1cmFibGUgbXVsdGlwbGll
ciBieSBjaGVja2luZyBpZiBtdWxfe21pbixtYXh9IGFyZSBlcXVhbC4gU2FtZSBmb3IKPiBkaXZf
e21pbixtYXh9Lgo+Cj4gVml2aWFuICJkcmFtZm9yZXZlciIgV2FuZwpUaGFua3MgZm9yIHBvaW50
aW5nIGl0IG91dC4gSSBzZWUgeW91ciBpZGVhLCBidXQgSSBkb27igJl0IHRoaW5rIGl04oCZcwpu
ZWNlc3NhcnkgdG8gZGV0ZXJtaW5lIHRoZSBjbG9jayB0eXBlIGZyb20ge211bCxkaXZ9X3ttaW4s
bWF4fQpkeW5hbWljYWxseSBzaW5jZSB3ZSBhbHJlYWR5IHN0YXRpY2FsbHkgc3BlY2lmeSBlYWNo
IG11bCwgZGl2LCBhbmQKbXVsLWRpdiBjbG9jayBieSBkaWZmZXJlbnQgbWFjcm9zLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
