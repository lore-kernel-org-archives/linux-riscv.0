Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5687EC83F17
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Jul 2025 05:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJcdLcncfu3LcqrvwQF5K59e3WboDCaFroNOcGEZEP8=; b=gYQMCwYL2hP69N
	F1ArJVdDh1x74CLxHo/aq2cdItLOMpjnDwEEiSiUdHnEiNGlGgtzS6Ilb/QPB58oemmXZCO6ufYiu
	09vp2dLJpRyk857zfILqKRNNcmwiyq530oigfl3DJmNClNnkR1bgg9Mi4oP1I1qhQl77P3Q9SHDt6
	Dejdxl2noqW7feZ3wQLCxlOibRqigDWgDSaoiqB7cSk2PZmNxJZp+7XhPRmZTe0uSUCLR5jRbpEq5
	ZEVXnE0JEK+7SJQO/m37iEsvCYrRCnMHfY2obKaliDfbRLKFLDqlg2J9fcL+zPeG5pHgpQC3J6mEH
	O5ry8PrgFVVP47qFufCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufXNF-0000000B9OP-2uH9;
	Sat, 26 Jul 2025 05:23:09 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufXNB-0000000B9O3-0Zhf
	for linux-riscv@lists.infradead.org;
	Sat, 26 Jul 2025 05:23:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753507380; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=i0agtowXXKYFSAlOsS8xUPqmzYDHud40K5NHwrE6N3YvftVmEA954C5rlJnFEh9SvBg3ReCxTB1RQtFEsXuNV3ZBWqH8YB7zt3NlgBAccpYFxMFxyykWzBJMWYhBbPPxRYm111gebhWyO4teJM3ludtbicZN0y938k9mdMC6oys=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753507380; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mmNwg6ueXxCadafwT4lips5HbPEdPE1RcKAk/DHerao=; 
	b=eW6XxyGu8A3WtuK70zypZPduHdACYu8WrZQZLprZzG711jC7CSRxU87efrDZ/kst3xkhQc9mWxHVA7THIE6uRMAVJDmk65zNdPmUiYXmAblAXuF3Y3p8wdUFc4lS5ZvfcQIZ8hiWSMvaazIxNOhRooaZOKNKMK41w22fGxcI1Xg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753507380;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=mmNwg6ueXxCadafwT4lips5HbPEdPE1RcKAk/DHerao=;
	b=Sd2GZqii9J7K2i+4KyFQrPpU0ReER2s6hMO3c+oxxsUjJZfw0uHu+VUdbXbY7aG7
	vw0S6Vqe14ImXHpfWMSH1OhwzyIMGj8O1JlyBKKLUNuooQ9adQ0dioQqxT6uP0EYvYl
	Oe/vfGeF3qKlIe2AxaEVkDIoqB7uJqE1dWgYUI6Y=
Received: by mx.zohomail.com with SMTPS id 1753507373478583.4224143944394;
	Fri, 25 Jul 2025 22:22:53 -0700 (PDT)
Message-ID: <cde19d45-fbd6-4b8c-b04f-e34811d62ae8@zohomail.com>
Date: Sat, 26 Jul 2025 13:22:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] riscv: canaan: Add support for K230-Canmv clock
To: Stephen Boyd <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com>
 <776638cc-cbd9-4747-82eb-e11bcc6c8bdd@zohomail.com>
 <175339519523.3513.2798631977806639092@lazor>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <175339519523.3513.2798631977806639092@lazor>
Feedback-ID: rr080112270c568dcf46d7bd9a6ca9bde60000df18909873772a153d341f279040e2ef74d0e9fe6602cd0fae:zu080112272084c8b289bc0c5b040e9e3500009ab072e80699b0abcbefb7032cae82cc441631b6531d467a59:rf0801122c2d91ede877ecf69152271edf0000f5f0466ce28d08f638bbfd1d1d3c2ccd19fe675d2edb74cde1f734449b92:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_222305_583746_E4834B54 
X-CRM114-Status: GOOD (  16.50  )
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

Ck9uIDIwMjUvNy8yNSAwNjoxMywgU3RlcGhlbiBCb3lkIHdyb3RlOgo+IFF1b3RpbmcgWHVrYWkg
V2FuZyAoMjAyNS0wNy0xMyAwOTo0ODo0NCkKPj4gSSdtIHdvcmtpbmcgb24gYSBMaW51eCBjbG9j
ayBkcml2ZXIgYW5kIGhhdmUgZW5jb3VudGVyZWQgYSBxdWVzdGlvbgo+PiByZWdhcmRpbmcgaG93
IHRvIHByb3Blcmx5IHJlcHJlc2VudCBhIHBhcnRpY3VsYXIgdHlwZSBvZiBjbG9jayBzb3VyY2Uu
Cj4+Cj4+IEluIEsyMzAgU29DLCB0aGVyZSdzIGEgbXV4IGNsb2NrIHdob3NlIHBhcmVudCBjYW4g
b3B0aW9uYWxseSBiZSBhbgo+PiBleHRlcm5hbCBwdWxzZSBzaWduYWwsIHdoaWNoIGlzIGNvdW50
ZWQgdmlhIGEgcGluICh0aGUgaW5wdXQgaXMgbm90Cj4+IGdlbmVyYXRlZCBpbnRlcm5hbGx5IGJ1
dCBjb21lcyBmcm9tIGFuIGV4dGVybmFsIHNvdXJjZSkuIEnigJltIHdvbmRlcmluZzoKPj4KPj4g
U2hvdWxkIHRoaXMgZXh0ZXJuYWwgcHVsc2Ugc2lnbmFsIGJlIG1vZGVsZWQgYXMgYSBjbG9jayB3
aXRoaW4gdGhlCj4+IENvbW1vbiBDbG9jayBGcmFtZXdvcmsgKENDRik/Cj4gTGlrZWx5LCB5ZXMu
Cj4KPj4gSWYgc28sIHdoYXQgd291bGQgYmUgdGhlIGNvcnJlY3Qgd2F5IHRvIHJlZ2lzdGVyIG9y
IGRlc2NyaWJlIHN1Y2ggYQo+PiBjbG9jayBpbiB0aGUgZHJpdmVyPwo+IElmIGl0IGlzIGEgZml4
ZWQgcmF0ZSBwdWxzZSBzaWduYWwgSSB3b3VsZCB1c2UgYSBmaXhlZCByYXRlIGNsayBub2RlIGF0
Cj4gdGhlIHJvb3Qgb2YgdGhlIERUIHRyZWU6Cj4KPiAJY2xvY2stNTAwMDAgewo+IAkJY29tcGF0
aWJsZSA9ICJmaXhlZC1jbG9jayI7Cj4gCQkjY2xvY2stY2VsbHMgPSA8MD47Cj4gCQljbG9jay1m
cmVxdWVuY3kgPSA8NTAwMDA+Owo+IAl9Cj4KPiBJZiB5b3UgbmVlZCBwaW5jdHJsIHNldHRpbmdz
IHRvIG1ha2UgdGhhdCBjbGsgd29yayB5b3UgY2FuIGFzc2lnbiB0aGVtCj4gaW4gdGhhdCBub2Rl
LCBhbHRob3VnaCBJIGRvbid0IGtub3cgaWYgSSd2ZSBldmVyIHNlZW4gc3VjaCBhIGNhc2UKPiBi
ZWZvcmUuIApUaGFua3MgZm9yIHlvdXIgcmVwbHkgYW5kIGhlbHBmdWwgZXhwbGFuYXRpb24hCgpS
ZWdhcmRpbmcgdGhlIHRpbWVyLXB1bHNlLWluLCB0aGUgZG9jdW1lbnRhdGlvbiBkZXNjcmliZXMg
aXQgYXM6CgoiY2FuIGJlIHVzZWQgdG8gY291bnQgZXh0ZXJuYWwgaW5wdXQgc2lnbmFsIHdpdGgg
ZnJlcXVlbmN5IGxlc3MgdGhhbgoxTUh6IGFuZCBkdXR5IGN5Y2xlIGZyb20gMH4xMDAlIgoKU28g
dGhlIGlucHV0IGZyZXF1ZW5jeSBpcyBub3QgZml4ZWQgaW4gcHJhY3RpY2UuCgpHaXZlbiB0aGF0
LCBtb2RlbGluZyBpdCBhcyBhIGZpeGVkLXJhdGUgY2xvY2sgbWlnaHQgbm90IGJlIGFjY3VyYXRl
LgoKQW5kIEknbSBjb25zaWRlcmluZyB3aGV0aGVyIGEgbW9yZSBmZWF0dXJlLXJpY2ggZHJpdmVy
IGlzIG5lZWRlZCB0bwpoYW5kbGUgdGhlIGR5bmFtaWNhbGx5IGNoYW5naW5nIGV4dGVybmFsIGNs
b2NrLCBvciBpZiB0aGVyZSdzIGEgYmV0dGVyCndheSB0byBkZXNjcmliZSBzdWNoIGEgY2xvY2sg
aW4gdGhlIENDRi4KCj4gSWYgdGhlIGV4dGVybmFsIHBhcmVudCBjbGsgbmVlZHMgdG8gYmUgZ2F0
ZWQgeW91J2xsIG5lZWQgdG8KPiB3cml0ZSBhIG1vcmUgZmVhdHVyZWQgZHJpdmVyLCB1bmxlc3Mg
aXQgY2FuIGJlIGNvbnRyb2xsZWQgd2l0aCBhIGdwaW8gb3IKPiBzb21ldGhpbmcgbGlrZSB0aGF0
LgphbmQgSSB0aGluayBpdCBkb2Vzbid0IG5lZWQgdG8gYmUgZ2F0ZWQuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
