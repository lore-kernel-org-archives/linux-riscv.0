Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CCEE77188
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jan 2025 12:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5c6ualW7seJQcM7b58JGIS2mJSIAz0jWfICE1c3BMc=; b=Q4ko+3hezvDv+J
	cV2WLT+fVoxgNL9knfwyleASbZTzQyqVylLc1qI4udXtTQQIzU3lgo7441WzcqxEppRRvuzO0obmR
	mSC724VF5r3gYHt6qNSVSPYIXr3Q2KHg8I9rtdDUmLu56yldOx9YR57q16w2pRqa4MForPcR1+BfQ
	F0HZUHftavd6oOcuvV7lUwvzhAmPo03/Iyhe+XHZzF7dR0BK3sQRzma84LRAGnVoTe3gl4oB4QscQ
	Q5uBKlVpDkQx1qWCirw7ejL6rhsJN8BgiNskPArxwy6DVb+BkYA80vl+GcSdNrYas0KPi9q75XLch
	vU+ct/l57v7NNzDKnwcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU2yo-0000000ExBL-1F0p;
	Sat, 04 Jan 2025 12:10:10 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU2yl-0000000ExAw-1y6a
	for linux-riscv@lists.infradead.org;
	Sat, 04 Jan 2025 12:10:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1735992604; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lPt8JGbNPaODiEKElOAcn8idvZ3+61xpm3EP8xEu3ZMYfJPfGMuy5TXVr8AO3utQeNiWKwpwsIk2YY/cFXQhDTcy90L3nyFidAK3pFme1qEzwOVY3xjcYfQANWaIez/QM753lMKCjZ/d8eVfZFpTNpFHyQ/vr07XnvG2QEPAblg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735992604; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rXgxd4o5NjeP8XW0EW788UDZSYjiaeg8Pztng5GUR1A=; 
	b=lCntKarPiqn+UQHJQO34pYu//dxOotLNjUzBjTmWz71G0YHnFJgslAZ6lH+YzFVJbW15zvFcuSve5GHykbZa+8QHmN9XMz5GO42vQC9RmDLiSgymSHFwbuMvX+nJX7NP+GWpiDjZUhQUtTK/7CmKoQDv7qn1c3ENjQouI55RPM4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735992604;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=rXgxd4o5NjeP8XW0EW788UDZSYjiaeg8Pztng5GUR1A=;
	b=EIK+82I0gx0pM1oKMX6A6dLhIqepdqY18uYwkxU5x3nCJrevO6pnjk+uBCh1YdFm
	+A8WqsdH8PKECBrIX1fdbhK+8AalNx4iogZ3YV6tTeID4pof1izHi0XQMFhRRy6bUK+
	cVFzOGtHoqFeNzWT5LiPPSLku8J8G9VvPSE+i32k=
Received: by mx.zohomail.com with SMTPS id 1735992602298612.8567103281483;
	Sat, 4 Jan 2025 04:10:02 -0800 (PST)
Message-ID: <68de77d0-b289-4137-85f3-050a1a10eb63@zohomail.com>
Date: Sat, 4 Jan 2025 20:09:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com>
 <20241229-b4-k230-clk-v1-1-221a917e80ed@zohomail.com>
 <zfjj33otyxiamsc7u2uwnvygcuhe7u2tfgiz6txp62emnddbw5@5iozmjg4eugn>
 <39e6bf64-2ce6-45bb-b622-4b413efc185f@zohomail.com>
 <a097980a-c2b7-440c-8eff-b540acfd4027@kernel.org>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <a097980a-c2b7-440c-8eff-b540acfd4027@kernel.org>
Feedback-ID: rr080112273357ae56f066f34e26e187de00009fa745e4b013b75f5ba77aea31dee152b69591f8df3e995104:zu08011227aaeab78d45b963750c283283000046e7d40b9e797c87120571555c4b4db3c1cc53350543a5e19e:rf0801122c33f344c4e8e2ae312c1a7a600000068732a4d2f3c18cbef365f9b2d60a6535e04d1be579789a143d6b102506:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_041007_573373_9EACE821 
X-CRM114-Status: GOOD (  10.92  )
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

Ck9uIDIwMjUvMS80IDE4OjQwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIDA0LzAx
LzIwMjUgMTA6MjMsIFh1a2FpIFdhbmcgd3JvdGU6Cj4+IEhlcmUncyB0aGUgdXBkYXRlIHZlcnNp
b246Cj4+Cj4+IHJlZzoKPj4gwqAgZGVzY3JpcHRpb246IHwKPj4gwqDCoMKgIFRoZSBgcmVnYCBw
cm9wZXJ0eSBzcGVjaWZpZXMgdGhlIGJhc2UgYWRkcmVzcyBhbmQgc2l6ZSBvZiB0aGUKPj4gZGV2
aWNlJ3MgcmVnaXN0ZXJzLgo+PiDCoMKgwqAgLSBUaGUgZmlyc3QgYWRkcmVzcyBjb3JyZXNwb25k
cyB0byB0aGUgYmFzZSBhZGRyZXNzIG9mIHRoZSBQTEwKPj4gY29udHJvbCByZWdpc3RlcnMuCj4+
IMKgwqDCoCAtIFRoZSBzZWNvbmQgYWRkcmVzcyBjb3JyZXNwb25kcyB0byB0aGUgYmFzZSBhZGRy
ZXNzIG9mIHRoZSBzeXNjbGsKPj4gY29udHJvbCByZWdpc3RlcnMuCj4gTm8sIGRyb3AgYWxsIHRo
ZXNlLiBZb3UgZHVwbGljYXRlIHNjaGVtYS4KPgo+PiDCoCBtaW5JdGVtczogMQo+IFdoeT8KPgo+
PiDCoCBpdGVtczoKPj4gwqDCoMKgIC0gZGVzY3JpcHRpb246IEJhc2UgYWRkcmVzcyBhbmQgc2l6
ZSBvZiB0aGUgUExMIGNvbnRyb2wgcmVnaXN0ZXJzLgo+PiDCoMKgwqAgLSBkZXNjcmlwdGlvbjog
QmFzZSBhZGRyZXNzIGFuZCBzaXplIG9mIHRoZSBzeXNjbGsgY29udHJvbCByZWdpc3RlcnMuCj4g
RHJvcCByZWR1bmRhbnQgIkJhc2UgYWRkcmVzcyBhbmQgc2l6ZSBvZiB0aGUiLiBUaGlzIGNhbm5v
dCBiZSBhbnl0aGluZwo+IGVsc2UgaW4gdGhpcyBjb250ZXh0LgoKVGhhbmsgeW91IGZvciBwb2lu
dCB0aGVzZSBvdXQsIEnigJl2ZSByZW1vdmVkIHRoZSByZWR1bmRhbnQgZGVzY3JpcHRpb25zLAph
bmQgaGVyZSdzIHRoZSB1cGRhdGVkIHZlcnNpb246CgpyZWc6CsKgIGl0ZW1zOgrCoMKgwqAgLSBk
ZXNjcmlwdGlvbjogUExMIGNvbnRyb2wgcmVnaXN0ZXJzLgrCoMKgwqAgLSBkZXNjcmlwdGlvbjog
U3lzY2xrIGNvbnRyb2wgcmVnaXN0ZXJzLgoKRG9lcyB0aGlzIGNvbnRlbnQgbG9vayBhcHByb3By
aWF0ZT8KCj4+Pj4gKwo+Pj4+ICsgICcjY2xvY2stY2VsbHMnOgo+Pj4+ICsgICAgY29uc3Q6IDEK
Pj4+PiArCj4+Pj4gK3JlcXVpcmVkOgo+Pj4+ICsgIC0gY29tcGF0aWJsZQo+Pj4+ICsgIC0gcmVn
Cj4+Pj4gKyAgLSBjbG9ja3MKPj4+PiArICAtICcjY2xvY2stY2VsbHMnCj4+Pj4gKwo+Pj4+ICth
ZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPj4+PiArCj4+Pj4gK2V4YW1wbGVzOgo+Pj4+ICsg
IC0gfAo+Pj4+ICsgICAgY2xvY2stY29udHJvbGxlckA5MTEwMjAwMCB7Cj4+Pj4gKyAgICAgICAg
Y29tcGF0aWJsZSA9ICJjYW5hYW4sazIzMC1jbGsiOwo+Pj4+ICsgICAgICAgIHJlZyA9IDwweDkx
MTAyMDAwIDB4MTAwMD4sIDwweDkxMTAwMDAwIDB4MTAwMD47Cj4+Pj4gKyAgICAgICAgI2Nsb2Nr
LWNlbGxzID0gPDE+Owo+Pj4+ICsgICAgICAgIGNsb2NrcyA9IDwmb3NjMjRtPjsKPj4+PiArICAg
IH07Cj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svazIzMC1jbGsu
aCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svazIzMC1jbGsuaAo+IEkgbWlzc2VkIG9uZSB0
aGluZyAtIGZpbGVuYW1lIGlzIHN1cHBvc2VkIHRvIGJlIHRoZSBzYW1lIGFzIGJpbmRpbmcKPiBm
aWxlbmFtZS4KT0ssIEkgd2lsbCByZW5hbWUgdGhlIGZpbGUgYGsyMzAtY2xrLmhgIHRvIGBjYW5h
YW4sazIzMC1jbGsuaGAgdG8KbWFpbnRhaW4gY29uc2lzdGVuY3kgd2l0aCB0aGUgYmluZGluZyBm
aWxlbmFtZS4KPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
