Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A692C27C6E
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 08:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AfgJBXl/ySfXN+0FhXIQlVFBMJA+ww7FMdmceGsRrbA=; b=H72ohCX2W/nG+V
	cRAupzye0n8ZB1uIPXlPt5P2pquLykJ8JUPuE52io3LSojf01TRKt0vg1xIB0/U47ybggWvt9IjDG
	hFrkSqzmqsNWZiFMKg7fdg8M4yAUJIg5dioq+aET6klUcACtQQ4ZhdGZmlZ9qBrbCdi5gpscYpnGk
	U0h/r+oU5h55sL7NfgwT1oD5nSc04oMz/XingXYWi1LWP6esmPJa7iBYKk3NrZXBs7Gp5jRuqcyWB
	85AfI6/bT+ddanaamuP4gUcKenJIiisv62JO98YRvz+YxKag2Sv9WXFwbpMK/QVpxwte5b2WAb8+T
	SD3kLne8cyArL1c1zlPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7Wj-00000009p2B-3BBg;
	Mon, 17 Jun 2024 08:15:45 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7Wg-00000009p1T-15z5
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 08:15:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1718612132; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bGcBqaIfCHRKICOs3rvbDy12lUk9nOlPk6eMD/0DFh7XP/Vhb4GMMUEOJ0DrwlCrlfBrhK7EXrtVzFFtmcc/1msp+h3bJ4Z3SZ0dEZvZ9XEDKMQNNGO46P4GsfuZ+NyCFAf45aD6jK3IACYJXbo4/fg5u2VK4FND1Cnq1IR61rM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1718612132; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oEw09u6puwEe1Nbazpi+FHtU6JyGgtK0P587AGGRiXE=; 
	b=D2SzVnPXEf4IGkJECZ6ycJwSvArQCAh6UntfciC9i6XptbdCPk66KDgqrFDG/a/Lv4I6s/y3xOqWzfj0E62pZifgAmJ/zufdJmwbpvkFEpQ23i45vhYudeVprvVHeXxlqla88C34gqJSRzJuw1gJtRw87K50QlFbzSVtnWGQgoI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718612132;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=oEw09u6puwEe1Nbazpi+FHtU6JyGgtK0P587AGGRiXE=;
	b=LhQDYkLRsNYhoyW+O7FQz6xPOO9x0ur4QOCLqgXaETHdqkjBBoGZqDPNcdYAYXv6
	CXe7/HkHDcdU8zlDlCAMdFzZpuzuZDYXogHTgGBfL7eEXpI6PPEa0yRgW1Xvw9GkveB
	sV5IqQbz136iu55t4LTJ9ILjV1h32EjvW6QKN6KQdI+H1Qe/5DKNJUjMHA+S8fS+3Ch
	82asOB9xMwQkwEvQkyzbV89SaFD8LrqRna8gdLzLjUox8Kq7XvL+H/iPypO4MSpSXs8
	eqdKidOldX8snJfkT6ibvY/2fzmamPNC/Gmr6LEehwHwiKUzoVIL7GF+fduRyz5K1hx
	ZGKev4fJtQ==
Received: by mx.zohomail.com with SMTPS id 1718612130295190.36232977173415;
	Mon, 17 Jun 2024 01:15:30 -0700 (PDT)
Message-ID: <60e610782212128d73dab9b1120708d81d809680.camel@icenowy.me>
Subject: Re: [PATCH v1 0/9] riscv: add initial support for SpacemiT K1
From: Icenowy Zheng <uwu@icenowy.me>
To: Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org, Conor
 Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Samuel Holland
 <samuel.holland@sifive.com>, Anup Patel <anup.patel@wdc.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Jesse Taube <jesse@rivosinc.com>
Date: Mon, 17 Jun 2024 16:15:25 +0800
In-Reply-To: <tencent_2ABAC5E885F8354EF1F9084A6B5B398EE00A@qq.com>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
	 <20240616-exorcism-computing-e11e26084a62@spud>
	 <20240616224811.GC3983622@ofsar>
	 <tencent_2ABAC5E885F8354EF1F9084A6B5B398EE00A@qq.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_011542_386100_BB5D226C 
X-CRM114-Status: GOOD (  27.40  )
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

5ZyoIDIwMjQtMDYtMTfmmJ/mnJ/kuIDnmoQgMTA6MDAgKzA4MDDvvIxZYW5neXUgQ2hlbuWGmemB
k++8mgo+IAo+ID4gT24gSnVuIDE3LCAyMDI0LCBhdCAwNjo0OCwgWWl4dW4gTGFuIDxkbGFuQGdl
bnRvby5vcmc+IHdyb3RlOgo+ID4gCj4gPiBIaSBDb25vcgo+ID4gVGhhbmtzIGZvciBicmluZ2lu
ZyB0aGlzIHVwCj4gPiAKPiA+IE9uIDE5OjM1IFN1biAxNiBKdW7CoMKgwqDCoCAsIENvbm9yIERv
b2xleSB3cm90ZToKPiA+ID4gT24gTW9uLCBKdW4gMTcsIDIwMjQgYXQgMDE6MTg6NTJBTSArMDgw
MCwgWWFuZ3l1IENoZW4gd3JvdGU6Cj4gPiA+IAo+ID4gPiBObyBNQUlOVEFJTkVSUyB1cGRhdGUs
IHNvIEkgZmlndXJlIHRoYXQgbWVhbnMgeW91IGRvbid0IHdhbnQgdG8KPiA+ID4gbWFpbnRhaW4K
PiA+ID4gaXQgZ29pbmcgZm9yd2FyZHM/IElmIHRoZXJlJ3Mgc29tZW9uZSBvdXQgdGhhdCB0aGF0
IGRvZXMgY2FyZQo+ID4gPiBhYm91dCB0aGUKPiA+ID4gc3BhY2VtaXQgazEgKEplc3NlIG1heWJl
PyksIHRoZW4gSSdkIGJlIG1vcmUgdGhhbiBoYXBweSB0byBoYXZlCj4gPiA+IHRoZW0KPiA+ID4g
bG9vayBhZnRlciBpdC4KPiAKPiBBY3R1YWxseSwgSSBkb27igJl0IGtub3cgaG93IHRvIGJlIGEg
bWFpbnRhaW5lci4gU2hvdWxkIEkgaGF2ZSB0bwo+IHByb3ZpZGUgYSBuZXcgZ2l0IHRyZWUgYW5k
IGFsbCB0aGUgbmV3IHBhdGNoZXMgbWVyZ2VkIHRvIG15IHRyZWUKPiBhbmQgdGhlbiBzdWJtaXQg
YSBnaXQgcHVsbD8gT3IgcmV1c2UgdGhlIFJJU0MtViBtYWlsaW5nIGxpc3QgYW5kCj4ganVzdCBn
aXZlIGEgcmV2aWV3LCBhbmQgdGhlIHBhdGNoZXMgY29tZSB0byBzb2MgbWlzYyB0cmVlPyBJIHdv
dWxkCj4gbGlrZSB0aGUgbGF0dGVyIG9uZS4KCldlbGwgSSB0aGluayBmb3IgdGhlc2UgU29DcyB0
aGUgbGF0dGVyIGlzIHRoZSBjYXNlLgoKQlRXIEkgY291bGQgdm9sdW50ZWVyIGFzIGEgbWFpbnRh
aW5lciwgb3IgYXQgbGVhc3QgYSByZXZpZXdlciBoZXJlLgoKPiAKPiA+IFlhbmd5dSBraW5kIG9m
IGhhcyBsaW1pdGVkIHRpbWUsIHRvbyBtYW55IHN0dWZmIGZvciBoaW0uLgo+ID4gCj4gCj4gVHJ1
ZS4gTWF5YmUgSSBjYW4gaGF2ZSBhIHJldmlldyBhbmQgdGVzdCB0aGUgcGF0Y2ggaW4gb25lIHdl
ZWsuCj4gSG93ZXZlciwgcHJvdmlkaW5nIGEgcmV2aWV3IGFuZCB0ZXN0IGluIDItMyBkYXlzIGlz
IHNvbWV0aW1lcyBoYXJkCj4gZm9yIG1lLgo+IAo+ID4gSSdkIHZvbHVudGVlcmVkIHRvIGhlbHAg
b24gdGhpcyBpZiBpdCBjYW4gZmlsbCB0aGUgZ2FwCj4gPiBBbHNvIEknZCBiZSBtb3JlIHRoYW4g
aGFwcHkgaWYgYW55b25lIHdpbGxpbmcgc3RlcCBmb3J3YXJkIHRvIGNvLQo+ID4gbWFpbnRhaW4u
Lgo+ID4gCj4gCj4gVGhhbmtzLiBSZWFsbHkgYXBwcmVjaWF0ZSBpdC4KPiAKPiBTaG91bGQgSSBw
cm92aWRlIGEgZGlmZiBsaWtlIHRoaXM6Cj4gCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIv
TUFJTlRBSU5FUlMKPiBpbmRleCBkNmM5MDE2MWM3YmYuLjcxOGQzMDk5NmYxMiAxMDA2NDQKPiAt
LS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTE5MzA2LDYgKzE5MzA2
LDcgQEAgRjrCoMKgwqDCoMKgIGFyY2gvcmlzY3YvYm9vdC9kdHMvCj4gwqBYOsKgwqDCoMKgIGFy
Y2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyLwo+IMKgWDrCoMKgwqDCoCBhcmNoL3Jpc2N2L2Jv
b3QvZHRzL3JlbmVzYXMvCj4gwqBYOsKgwqDCoMKgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdv
Lwo+ICtYOsKgwqDCoMKgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvCj4gwqAKPiDCoFJJ
U0MtViBQTVUgRFJJVkVSUwo+IMKgTTrCoMKgwqDCoCBBdGlzaCBQYXRyYSA8YXRpc2hwQGF0aXNo
cGF0cmEub3JnPgo+IEBAIC0yMTAwNCw2ICsyMTAwNSwxMyBAQCBXOsKgwqDCoMKgIGh0dHBzOi8v
bGludXh0di5vcmcKPiDCoFE6wqDCoMKgwqAgaHR0cDovL3BhdGNod29yay5saW51eHR2Lm9yZy9w
cm9qZWN0L2xpbnV4LW1lZGlhL2xpc3QvCj4gwqBGOsKgwqDCoMKgIGRyaXZlcnMvbWVkaWEvZHZi
LWZyb250ZW5kcy9zcDIqCj4gwqAKPiArU1BBQ0VNSVQgREVWSUNFVFJFRVMgYW5kIERSSVZFUlMK
PiArTTrCoMKgwqDCoCBZYW5neXUgQ2hlbiA8Y3l5QGN5eXNlbGYubmFtZT4KPiArTTrCoMKgwqDC
oCBZaXh1biBMYW4gPGRsYW5AZ2VudG9vLm9yZz4KPiArUzrCoMKgwqDCoCBNYWludGFpbmVkCj4g
K0Y6wqDCoMKgwqAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NwYWNl
bWl0LnlhbWwKPiArRjrCoMKgwqDCoCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0Lwo+ICsK
PiDCoFNQQU5JU0ggRE9DVU1FTlRBVElPTgo+IMKgTTrCoMKgwqDCoCBDYXJsb3MgQmlsYmFvIDxj
YXJsb3MuYmlsYmFvLm9zZGV2QGdtYWlsLmNvbT4KPiDCoFI6wqDCoMKgwqAgQXZhZGh1dCBOYWlr
IDxhdmFkaHV0Lm5haWtAYW1kLmNvbT4KPiAKPiBUaGFua3MsCj4gWWFuZ3l1IENoZW4KPiAKPiA+
IC0tIAo+ID4gWWl4dW4gTGFuIChkbGFuKQo+ID4gR2VudG9vIExpbnV4IERldmVsb3Blcgo+ID4g
R1BHIEtleSBJRCBBQUJFRkQ1NQo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
