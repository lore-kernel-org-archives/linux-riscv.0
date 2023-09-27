Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55415E7F14E
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LrusFAoVb3BQZVUSkQ3Hkuf5CVVQdyBMeAYoVjmOJOs=; b=cJDcefQxmw9wfc
	EICbEGSZO+H90giCpvuOxzNCQF3rKv/Sidd+EV6vXeokWB1HnDI32IrmaiQDXAB9ENwORTEtroreo
	Cts5nPRVRMT9dueGRNWcOQ5MwKoxFKVfXXcTNLJKSzn5UMJ/afnipBRc5guhZfxml0YGmV7RRbPlV
	y7Z14Ibfplmz8dKjFKe3EwmijSO9r5TiUbQ5sqvbhq6HFsE0aJ+ZBjgSglMG0YotjT9PmMOwEooEU
	Z0d8IWIzIOgl80LIuVV5C22gCuW0usmDeTyebSd+HP47drQxpL7LlFRhJe0u19mj5GkFHEGxWAx1U
	LkW+cTSeKos2tMDvmgug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlUZT-0010Fa-09;
	Wed, 27 Sep 2023 13:27:19 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlUZO-0010Dt-1w
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 13:27:17 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 6F2D724DF1F;
	Wed, 27 Sep 2023 21:26:43 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 27 Sep
 2023 21:26:43 +0800
Received: from [192.168.125.107] (113.72.144.128) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 27 Sep
 2023 21:26:42 +0800
Message-ID: <5d942896-df35-f4a8-53ed-045023e579c9@starfivetech.com>
Date: Wed, 27 Sep 2023 21:26:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [GIT PULL 2/5] dt-bindings: power: Add power-domain header for
 JH7110
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>
CC: <ulf.hansson@linaro.org>, Conor Dooley <conor.dooley@microchip.com>,
	<arnd@arndb.de>, <jiajie.ho@starfivetech.com>, <linux-pm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <robh@kernel.org>,
	<walker.chen@starfivetech.com>
References: <20230913-bloomers-scorebook-fb45e0a2aa19@spud>
 <20230913-grumbly-rewrite-34c85539f2ed@spud>
 <CAMuHMdXmNCXvFj8gF0COQrvhbRuugrJN0sM_DL1vDE=4EU0bEA@mail.gmail.com>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <CAMuHMdXmNCXvFj8gF0COQrvhbRuugrJN0sM_DL1vDE=4EU0bEA@mail.gmail.com>
X-Originating-IP: [113.72.144.128]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_062714_917537_2FEC2853 
X-CRM114-Status: GOOD (  18.70  )
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

CgpPbiAyMDIzLzkvMjYgMTg6NTUsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiBIaSBDb25v
ciwgQ2hhbmdodWFuZywKPiAKPiBPbiBXZWQsIFNlcCAxMywgMjAyMyBhdCAzOjU44oCvUE0gQ29u
b3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPj4gRnJvbTogQ2hhbmdodWFuZyBM
aWFuZyA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2guY29tPgo+Pgo+PiBBZGQgcG93ZXIt
ZG9tYWluIGhlYWRlciBmb3IgSkg3MTEwIFNvQywgaXQgY2FuIHVzZSB0byBvcGVyYXRlIGRwaHkK
Pj4gcG93ZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVh
bmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAKPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gs
IHdoaWNoIGlzIG5vdyBjb21taXQgNDFiNjZiNTRhNzJiZDc5Ngo+ICgiZHQtYmluZGluZ3M6IHBv
d2VyOiBBZGQgcG93ZXItZG9tYWluIGhlYWRlciBmb3IgSkg3MTEwIikKPiBpbiBwbWRvbWFpbi9u
ZXh0Lgo+IAo+IENvbm9yOiBsb29rcyBsaWtlIHlvdSBmb3Jnb3QgdG8gdXBkYXRlIHRoZSBwYXRj
aCBkZXNjcmlwdGlvbiwgYXMgcHJvbWlzZWQgaW4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyMzA1MTktaXJrLWR3ZWxsZWQtNmE0OTljNDgyZTYyQHNwdWQ/Cj4gCj4+IC0tLSBhL2lu
Y2x1ZGUvZHQtYmluZGluZ3MvcG93ZXIvc3RhcmZpdmUsamg3MTEwLXBtdS5oCj4+ICsrKyBiL2lu
Y2x1ZGUvZHQtYmluZGluZ3MvcG93ZXIvc3RhcmZpdmUsamg3MTEwLXBtdS5oCj4+IEBAIC0xLDYg
KzEsNiBAQAo+PiAgLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1Ig
QlNELTItQ2xhdXNlKSAqLwo+PiAgLyoKPj4gLSAqIENvcHlyaWdodCAoQykgMjAyMiBTdGFyRml2
ZSBUZWNobm9sb2d5IENvLiwgTHRkLgo+PiArICogQ29weXJpZ2h0IChDKSAyMDIyLTIwMjMgU3Rh
ckZpdmUgVGVjaG5vbG9neSBDby4sIEx0ZC4KPj4gICAqIEF1dGhvcjogV2Fsa2VyIENoZW4gPHdh
bGtlci5jaGVuQHN0YXJmaXZldGVjaC5jb20+Cj4+ICAgKi8KPj4gICNpZm5kZWYgX19EVF9CSU5E
SU5HU19QT1dFUl9KSDcxMTBfUE9XRVJfSF9fCj4+IEBAIC0xNCw0ICsxNCw3IEBACj4+ICAjZGVm
aW5lIEpINzExMF9QRF9JU1AgICAgICAgICAgNQo+PiAgI2RlZmluZSBKSDcxMTBfUERfVkVOQyAg
ICAgICAgIDYKPj4KPj4gKyNkZWZpbmUgSkg3MTEwX1BEX0RQSFlfVFggICAgICAwCj4+ICsjZGVm
aW5lIEpINzExMF9QRF9EUEhZX1JYICAgICAgMQo+IAo+IFRoZXNlIHZhbHVlcyBhcmUgY29uZmxp
Y3Rpbmcgd2l0aCBzaW1pbGFybHktbmFtZWQgdmFsdWVzIGFib3ZlOgo+IAo+ICAgICAjZGVmaW5l
IEpINzExMF9QRF9TWVNUT1AgICAgICAgIDAKPiAgICAgI2RlZmluZSBKSDcxMTBfUERfQ1BVICAg
ICAgICAgICAxCj4gCj4gVXBvbiBjbG9zZXIgbG9vaywgYW5kIGRpdmluZyBpbnRvIHRoZSBkcml2
ZXIsIHRoaXMgaGVhZGVyIGZpbGUgY29udGFpbnMKPiBkZWZpbml0aW9ucyBmb3IgdHdvIHNlcGFy
YXRlIG51bWJlciBzcGFjZXM6IHRoZSBmaXJzdCBzZXQgaXMgbWVhbnQKPiB0byBiZSB1c2VkIGlu
IFBNIERvbWFpbiBzcGVjaWZpZXJzIHJlZmVycmluZyB0byBhIG5vZGUgY29tcGF0aWJsZQo+IHdp
dGggInN0YXJmaXZlLGpoNzExMC1wbXUiLCB3aGlsZSB0aGUgc2Vjb25kIHNldCBpcyBtZWFudCB0
byBiZQo+IHVzZWQgaW4gUE0gRG9tYWluIHNwZWNpZmllcnMgcmVmZXJyaW5nIHRvIGEgbm9kZSBj
b21wYXRpYmxlIHdpdGgKPiAic3RhcmZpdmUsamg3MTEwLWFvbi1zeXNjb24iLgo+IEkgdGhpbmsg
aXQgd291bGQgYmUgbmljZSB0byBoYXZlIHRoaXMgcmVmbGVjdGVkIGluIHRoZSBuYW1lcyBvZgo+
IHRoZSBkZWZpbmVzIChlLmcuIEpINzExMF9QRF9BT05fRFBIWV9UWCksIGFuZC9vciB0byBhZGQg
Y29tbWVudHMKPiBjbGVhcmx5IGRlbGltaXRpbmcgdGhlIHR3byBzZXBhcmF0ZSBudW1iZXIgc3Bh
Y2VzLCBhbmQgZXhwbGFpbmluZwo+IHdoZXJlIHRoZXkgYXBwbHkgdG8uCj4gCgpIaSBHZWVydCwK
CkkgaGF2ZSBzZW50IGEgc2VyaWVzIHRvIGZpeCB0aGlzLCBidXQgSSBmb3JnZXQgdG8gc2VuZCBp
dCB0byB5b3UuCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1wbS9w
YXRjaC8yMDIzMDkyNzEzMDczNC45OTIxLTItY2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2gu
Y29tLwoKVGhhbmtzLApDaGFuZ2h1YW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
