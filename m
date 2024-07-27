Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0ACC3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 05:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFyGsbEbSMACB/FOQbG49z9Ps8qP7eoTwK0r2UVgKKM=; b=hwTBnBscKg8JiV
	ghBB3JXTmDo8uQdTqYo/e9n4IWJQ6apX4VVxzbDqTMcQp7/fKhMnrNPW3JNQLOqvNbsbmlXx2FnRY
	ZhliJ7ojZCqUQediapuSTeuYZb0M6AXv/skbfGWPBEybceBngH/84wPVrQMW37AEtpotiMcEoLxzh
	X7ejV6PBrRBCJMPb08PSTWdRazd7TjUwZiymjo9z+sCp5ic95futMXHIzLS0b9/YspCTy3vFe0dfZ
	i9FnM/2c+0U+bYJ38qfw7STMUZcMKxL5OWu/u3TnhFDCyf/j//wqYzXg5wzSpm7S8hCWlSf3lgco4
	Yv7oc1k0GMCDnpo3J8ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXZsa-00000006720-0Zih;
	Sat, 27 Jul 2024 05:22:04 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXZsW-0000000671J-44df
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jul 2024 05:22:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1722057708; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aXi1zLnnjn1YLCOIyHDHWq+wPNACX16kzdArfXr6fGs71QPrbvINIpgRoIGoYuGcf5ElOvk27nyPb02iiL6VAjfCOHSO9jNyi1RHhGdIpPJxJl3sCLVoJcSieNm0CUJuexXknk1TwwjEyWN58LoP1EhBkwcjnupiXunky2+3usM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722057708; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Mih095U9iXueDDnfQMixcmVN6Xd/74AO9SVU2wiAifk=; 
	b=Q3WtiC2NUZR9yuI4zJTd9srWjqBAsHMh46WTLkSn9nn7xbBy0PBPyYYVJOkRC/6Iqb1LNcgDDwTQhrr5lG/VhraboN/98G2emClS9hujnkNH0tz52WdkllzY/MNwWZoevFxXmqHbhk28A55kcvv4ZBOuaqEhXTiJcgXizB+RkQo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722057708;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=Mih095U9iXueDDnfQMixcmVN6Xd/74AO9SVU2wiAifk=;
	b=mE6x7AemEjphe0KxvGJGqSkAsC2aNPV6Dw8UVJc9uiwKXtzO3VDNzHKGrXhYp56K
	KWDZ9uAbTn/pkxD5rjVuXR/s6kW4uAIlDk/K4CJKBpBkn1ql4YlMiFEluXdhXEioLNF
	RCZOk29odxLzT6AGNplXtSMCTnHt07PELEEGcTOVyvclz3NfIoM7E82u9zEFEZ7qm/I
	lQnVsLo3op+anS1sQoDTSZT1FAmK9LzqScMQbW6xkUOpkftdU5ho3edjlsCD47KjWRg
	tVJTlUr3WZXUjsH41AmOywlT/tyhCNlpCkWVAB/LMKNtkrRSQwYi9ij6dWHIGJmawev
	N/u+GM0q+w==
Received: by mx.zohomail.com with SMTPS id 1722057705832303.64384928637764;
	Fri, 26 Jul 2024 22:21:45 -0700 (PDT)
Message-ID: <2375ff5fb664d8de9627e76788bd40b5d8eabf35.camel@icenowy.me>
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: Document T-Head TH1520
 AP_SUBSYS controller
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <drew@pdp7.com>, Emil Renner Berthing
	 <emil.renner.berthing@canonical.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini
 <dfustini@tenstorrent.com>, Fu Wei <wefu@redhat.com>, Guo Ren
 <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, Thomas
 Bonnefille <thomas.bonnefille@bootlin.com>,  Yangtao Li
 <frank.li@vivo.com>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Date: Sat, 27 Jul 2024 13:21:39 +0800
In-Reply-To: <ZqPQ8X51S6PrzQxI@x1>
References: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
	 <20240623-th1520-clk-v2-1-ad8d6432d9fb@tenstorrent.com>
	 <57ef2eef45f2de15e6607da266b37b2a.sboyd@kernel.org>
	 <CAJM55Z8iF8yV5JK5v6ZtQqS5AaWwCZ7uwhSYb7hdxh0juDFdqg@mail.gmail.com>
	 <ZqPQ8X51S6PrzQxI@x1>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_222201_091598_45F06572 
X-CRM114-Status: GOOD (  20.05  )
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

5ZyoIDIwMjQtMDctMjbmmJ/mnJ/kupTnmoQgMDk6MzggLTA3MDDvvIxEcmV3IEZ1c3Rpbmnlhpnp
gZPvvJoKPiBPbiBGcmksIEp1bCAyNiwgMjAyNCBhdCAwMzo0NTozNkFNIC0wNTAwLCBFbWlsIFJl
bm5lciBCZXJ0aGluZyB3cm90ZToKPiA+IFN0ZXBoZW4gQm95ZCB3cm90ZToKPiA+ID4gUXVvdGlu
ZyBEcmV3IEZ1c3RpbmkgKDIwMjQtMDYtMjMgMTk6MTI6MzEpCj4gPiA+ID4gRG9jdW1lbnQgYmlu
ZGluZ3MgZm9yIHRoZSBULUhlYWQgVEgxNTIwIEFQIHN1Yi1zeXN0ZW0gY2xvY2sKPiA+ID4gPiBj
b250cm9sbGVyLgo+ID4gPiA+IAo+ID4gPiA+IExpbms6Cj4gPiA+ID4gaHR0cHM6Ly9vcGVuYmVh
Z2xlLm9yZy9iZWFnbGV2LWFoZWFkL2JlYWdsZXYtYWhlYWQvLS9ibG9iL21haW4vZG9jcy9USDE1
MjAlMjBTeXN0ZW0lMjBVc2VyJTIwTWFudWFsLnBkZgo+ID4gPiA+IENvLWRldmVsb3BlZC1ieTog
WWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWWFu
Z3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IENvbm9yIERv
b2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
RHJldyBGdXN0aW5pIDxkZnVzdGluaUB0ZW5zdG9ycmVudC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+
IAo+ID4gPiBBcHBsaWVkIHRvIGNsay1uZXh0Cj4gPiAKPiA+IFRoYW5rcywgYnV0IHRoaXMgZHJp
dmVyIHNlZW1zIGEgYml0IGluY29tcGxldGUuIFdpdGggdGhpcyBhcHBsaWVkCj4gPiB0aGUgTGlj
aGVlIFBpCj4gPiA0QSBubyBsb25nZXIgYm9vdHMgd2l0aG91dCB0aGUgY2xrX2lnbm9yZV91bnVz
ZWQga2VybmVsIHBhcmFtZXRlci4KPiA+IAo+ID4gL0VtaWwKPiAKPiBJcyB0aGlzIHRoZSBjYXNl
IHdoZW4geW91IGFwcGx5IHRoZSBkdHMgcGF0Y2hlcyBmcm9tIHRoaXMgc2VyaWVzPwo+IAo+IFRo
ZSBkdHMgcGF0Y2hlcyB3b24ndCBnbyBpbiB1bnRpbCA2LjEyIHNvIEkgZG9uJ3QgdGhpbmsgdGhl
IHByZXNlbmNlCj4gb2YKPiB0aGUgY2xrLXRoMTUyMC1hcC5jIGl0c2VsZiBpbiA2LjExIHdvdWxk
IGJyZWFrIGV4aXN0aW5nIHN5c3RlbXMuCj4gCj4gVGhhdCBzYWlkLCBJIGhhdmUgYmVlbiB1c2lu
ZyBjbGtfaWdub3JlX3VudXNlZC4gSSBoYWQgYmVlbiB0aGlua2luZwo+IHRoYXQKPiBtYWRlIHNl
bnNlIGJlY2F1c2UgdGhlIGZ1bGwgc2V0IG9mIGNsb2NrIGNvbnRyb2xsZXIgZHJpdmVycyBsaWtl
Cj4gQU9OX1NVQlNZUyAoYWx3YXlzIG9uKSwgQVVESU9fU1VCU1lTLCBEU1BfU1VCU1lTLCBldGMs
IGFyZSBub3QKPiBwcmVzZW50Cj4geWV0IGluIG1haW5saW5lLiBIb3dldmVyLCB0aGUgVC1IZWFk
IHZlbmRvciBrZXJuZWwgZG9lcyBoYXZlIGRyaXZlcnMKPiBmb3IKPiBhbGwgdGhvc2UgY2xvY2sg
Y29udHJvbGxlcnMgYW5kIEkgd2FzIHN1cHJpc2VkIHRvIHNlZSB0aGF0IHRoZSB2ZW5kb3IKPiBr
ZXJuZWwgZmFpbHMgdG8gYm9vdCB3aGVuIEkganVzdCB0ZXN0ZWQgcmVtb3ZpbmcgY2xrX2lnbm9y
ZV91bnVzZWQuCj4gCj4gQXMgZm9yIGNsay10aDE1MjAtYXAuYyBpbiBtYWlubGluZSwgSSdsbCBp
bnZlc3RpZ2F0ZSBmdXJ0aGVyIHdoaWNoCj4gY2xrCj4gZGlzYWJsZXMgc2VlbSB0byBjYXVzaW5n
IHRoZSBib290IGZhaWx1cmUgd2hlbiB1c2luZyB0aGUgZHRzIGZyb20KPiB0aGlzCj4gc2VyaWVz
LiBJIHN1c3BlY3QgSSBtYXkgbmVlZCB0byBhZGQgbm9kZXMgdGhhdCB3aWxsIGNhdXNlIHRoZQo+
IG5lY2Vzc2FyeQo+IGNsa3MgdG8gYmUgZW5hYmxlZCBieSB0aGVpciByZXNwZWN0aXZlIGRyaXZl
cnMuCgpJZiBkaXNhYmxpbmcgdGhlIGNsb2NrIGp1c3QgbGVhZHMgdG8gc3lzdGVtIGhhbmcsIHNl
dHRpbmcKQ0xLX0lTX0NSSVRJQ0FMIHNob3VsZCBiZSB1c2VmdWwgKGFuZCBuZWVkZWQpIGhlcmUu
Cgo+IAo+IFRoYW5rcywKPiBEcmV3Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
