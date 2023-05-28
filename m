Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010D1C77B7E
	for <linux-riscv@archiver.kernel.org>; Sun, 28 May 2023 13:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=psSGPupDd5vl6qvn188o/yEX1NVjzBGnYBCArHewNqg=; b=D1GVuBqtNR56Pa
	nwnCA0s2Hgpmk2dHmTPlzU0mIcdwdW1UfxZfK7OBzRSx8bSjpadlMr8D15JxDm8bvWdwxbfiUZZrT
	2AA0Q05X6+lGi25Iy1tTNwT8cPoNwiogBRAhAcHu5Dckv6pNKRUeFxQ27EqsIEl+3fCd5/9Em0eK4
	mmHvjhgge/l5BLcT1yZ2Yktpjo3NK3nmLWkaHfEBq74344UA46YPbGEmf8m/5/UaXdDo+vfGdQSNM
	GW4Z5UkbfKbY6Mi99FVRTB3quIFOXFoC0GP/SaGrPgGsi8Fn/qExq/KrvcknKbYOHhbNMkF096e8F
	jF0nOKhVZpVbxbvE5L7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Gfx-007jAr-1x;
	Sun, 28 May 2023 13:43:13 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Gft-007jA0-2d
	for linux-riscv@lists.infradead.org;
	Sun, 28 May 2023 13:43:11 +0000
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 928C6240002;
	Sun, 28 May 2023 13:43:00 +0000 (UTC)
Message-ID: <cf0d2d2a-c407-7b3d-a5ab-ea5c19e7b890@ghiti.fr>
Date: Sun, 28 May 2023 15:42:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH -fixes] riscv: Fix relocatable kernels with early
 alternatives using -fno-pie
To: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andreas Schwab <schwab@linux-m68k.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230526154630.289374-1-alexghiti@rivosinc.com>
 <20230526-clergyman-wriggly-accc659a3fad@spud>
 <20230526-rockfish-moody-f6d3e71f9d24@spud>
 <f6522c82-01bd-8a03-579d-a5b294784480@ghiti.fr>
 <20230527-hyperlink-doctrine-ef22cfcb508a@spud>
 <CAHVXubgx3uBEjMLHXTxr0192ZHbSb=qK4NggZyWQTDfgrJt2-g@mail.gmail.com>
 <20230528-darkness-grandly-6cb9e014391d@spud>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230528-darkness-grandly-6cb9e014391d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_064310_169265_70CADC4C 
X-CRM114-Status: GOOD (  24.59  )
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

Ck9uIDI4LzA1LzIwMjMgMTU6MTIsIENvbm9yIERvb2xleSB3cm90ZToKPiBPbiBTdW4sIE1heSAy
OCwgMjAyMyBhdCAwMzowMDo1N1BNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+IE9u
IFNhdCwgTWF5IDI3LCAyMDIzIGF0IDEyOjAy4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPj4+IE9uIFNhdCwgTWF5IDI3LCAyMDIzIGF0IDExOjEzOjE4QU0gKzAy
MDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4+PiBPbiAyNi8wNS8yMDIzIDE4OjM1LCBDb25v
ciBEb29sZXkgd3JvdGU6Cj4+Pj4+IE9uIEZyaSwgTWF5IDI2LCAyMDIzIGF0IDA1OjI0OjQxUE0g
KzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToKPj4+Pj4+IE9uIEZyaSwgTWF5IDI2LCAyMDIzIGF0
IDA1OjQ2OjMwUE0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4+Pj4+PiBFYXJseSBh
bHRlcm5hdGl2ZXMgYXJlIGNhbGxlZCB3aXRoIHRoZSBtbXUgZGlzYWJsZWQsIGFuZCB0aGVuIHNo
b3VsZCBub3QKPj4+Pj4+PiBhY2Nlc3MgYW55IGdsb2JhbCBzeW1ib2xzIHRocm91Z2ggdGhlIEdP
VCBzaW5jZSBpdCByZXF1aXJlcyByZWxvY2F0aW9ucywKPj4+Pj4+PiByZWxvY2F0aW9ucyB0aGF0
IHdlIGRvIGJlZm9yZSBidXQgKnZpcnR1YWxseSouIFNvIG9ubHkgdXNlIG1lZGFueSBjb2RlCj4+
Pj4+Pj4gbW9kZWwgZm9yIHRoaXMgZWFybHkgY29kZS4KPj4+Pj4+Pgo+Pj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPj4+Pj4+PiAt
LS0KPj4+Pj4+Pgo+Pj4+Pj4+IE5vdGUgdGhhdCBJJ20gbm90IHZlcnkgaGFwcHkgd2l0aCB0aGlz
IGZpeCwgSSB0aGluayB3ZSBuZWVkIHRvIHB1dCBtb3JlCj4+Pj4+Pj4gZWZmb3J0IGludG8gImhh
cm1vbml6aW5nIiB0aGlzIHZlcnkgZWFybHkgY29kZSAoaWUgYmVmb3JlIHRoZSBtbXUgaXMKPj4+
Pj4+PiBlbmFibGVkKSBhcyBpdCBpcyBzcHJlYWQgYmV0d2VlbiBkaWZmZXJlbnQgbG9jYXRpb25z
IGFuZCBjb21waWxlZAo+Pj4+Pj4+IGRpZmZlcmVudGx5Lgo+Pj4+Pj4gVG90YWxseSAmIEknbGwg
aGFwcGlseSBzcGVuZCB0aGUgdGltZSB0cnlpbmcgdG8gcmV2aWV3IHRoYXQgd29yay4KPj4+Pj4+
Cj4+Pj4+Pj4gSSdsbCB3b3JrIG9uIHRoYXQgbGF0ZXIsIGJ1dCBmb3Igbm93LCB0aGlzIGZpeCBk
b2VzIHdoYXQgaXMKPj4+Pj4+PiBuZWVkZWQgdG8gd29yayAoZnJvbSBteSB0ZXN0aW5nIGF0IGxl
YXN0KS4gQW55IFRlc3RlZC1ieSBvbiB0aGUgVW5tYXRjaGVkCj4+Pj4+Pj4gYW5kIFQtaGVhZCBi
b2FyZHMgaXMgd2VsY29tZSEKPj4+Pj4+IE9uIDYuNC1yYzEgJiB2Ni40LXJjMSArIHRoaXMgcGF0
Y2gsIHdpdGggQ09ORklHX1JFTE9DQVRBQkxFIGFkZGVkIHRvIG15Cj4+Pj4+PiBjb25maWcsIG15
IE5lemhhIGZhaWxzIHRvIGJvb3QuIFRoZXJlIGlzIG5vIG91dHB1dCB3aGF0c29ldmVyIGZyb20g
dGhlCj4+Pj4+PiBrZXJuZWwuIFR1cm5pbmcgb2ZmIENPTkZJR19SRUxPQ0FUQUJMRSBib290cyBh
Z2Fpbi4KPj4+Pj4gSSBkb24ndCBrbm93IGlmIHRoaXMgaXMgYmV0dGVyIG9yIHdvcnNlIG5ld3Ms
IGJ1dCBzYW1lIHRoaW5nIGhhcHBlbnMgb24KPj4+Pj4gYW4gaWNpY2xlIGtpdC4gV2hhdCBzeXN0
ZW1zLCBvdGhlciB0aGFuIFFFTVUsIGhhcyB0aGUgcmVsb2NhdGFibGUKPj4+Pj4gZXJpZXMgYmVl
biB0ZXN0ZWQgd2l0aCwgYnR3Pwo+Pj4+Cj4+Pj4gSSB0ZXN0ZWQgaXQgb24gdGhlIFVubWF0Y2hl
ZCAoQW5kcmVhcyBkaWQgdG9vKS4KPj4+IENvb2wuIEkgY3JhY2tlZCBvdXQgbXkgdW5tYXRjaGVk
IGFuZCBpdCBoYXMgdGhlIHNhbWUgaXNzdWUgYXMgdGhlCj4+PiBpY2ljbGUuIERpdHRvIG15IFZp
c2lvbmZpdmUgdjIuIEhlcmUncyBteSBjb25maWcuCj4+PiBodHRwczovL3Jhdy5naXRodWJ1c2Vy
Y29udGVudC5jb20vQ29uY2h1T0QvcmlzY3YtZW52L2Rldi9jb25mL2RlZmNvbmZpZwo+Pj4KPj4+
IEEgfmRlZmF1bHQgcWVtdSB2aXJ0IGRvZXNuJ3Qgd29yayBlaXRoZXIuICgtbSAyRyAtc21wIDUp
Cj4+IEkgY2FuIGJvb3Qgd2l0aCB0aGlzIGNvbmZpZyB1c2luZzoKPj4KPj4gJCBzdWRvIH4vcWVt
dS9idWlsZC9xZW11LXN5c3RlbS1yaXNjdjY0IC1tYWNoaW5lIHZpcnQgLWNwdQo+PiBydjY0LHN2
NDg9b2ZmIC1ub2dyYXBoaWMgLW0gMkcgLXNtcCA1IC1rZXJuZWwKPj4gYnVpbGRfY29ub3IvYXJj
aC9yaXNjdi9ib290L0ltYWdlIC1zCj4gSnVzdCBpbiBjYXNlLCB0aGF0IGlzIG15IG5vcm1hbCBj
b25maWcgdGhhdCBJIHVzZSBmb3IgdGVzdGluZyByYW5kb20KPiBzdHVmZiBvbiBMS01MLCBJIGFk
ZGVkIENPTkZJR19SRUxPQ0FUQUJMRSBpbiBhZGRpdGlvbiB0byB0aGF0Lgo+Cj4+IEkgbm90aWNl
ZCB3aGVuIHRyeWluZyB0byBhZGQgdGhpcyB0byBvdXIgaW50ZXJuYWwgQ0kgdGhhdCBJIGhhZCBs
b2NhbAo+PiBmYWlsdXJlcyB0aGF0IGRpZCBub3QgaGFwcGVuIGluIHRoZSBDSSBiZWNhdXNlIHRo
ZSBDSSB3YXMgbm90IHVzaW5nCj4+IHRoZSBzYW1lIHRvb2xjaGFpbjogY2FuIHlvdSBnaXZlIG1l
IHRoZSBmdWxsIC5jb25maWc/IFNvIHRoYXQgSSBjYW4KPj4gc2VlIGlmIHRoZSBjb21waWxlciBh
ZGRlZCBzdGFjayBndWFyZHMgb3Igc29tZSBvdGhlciB0aGluZ3MgSSBkaWQgbm90Cj4+IHRoaW5r
IG9mLgo+IGh0dHBzOi8vZ2lzdC5naXRodWJ1c2VyY29udGVudC5jb20vQ29uY2h1T0QvNjU1Zjlj
YzE5ZmIzYmU2M2YxYzlkYTdlN2UzYWI3MTcvcmF3L2ExYWFkM2MwZDMwNzYwOWIyMDYyZmQzYTY2
NzA1MTY2YWVkZTlmOWYvLmNvbmZpZwo+Cj4gOTAlIG9mIHdoYXQgSSB0ZXN0IGZvciB1cHN0cmVh
bSBzdHVmZiB1c2VzIGNsYW5nLCBzaW5jZSBjbGFuZyBhcHBlYXJzIHRvCj4gYmUgYSBtaW5vcml0
eSBjaG9pY2UgLSBidXQgSSBjb3VsZCByZXByb2R1Y2UgdGhpcyB3aXRoIGdjYy0xMiBhcyB3ZWxs
LAo+IHVzaW5nIHRoZSBzYW1lIGRlZmNvbmZpZyBhcyBsaW5rZWQgYWJvdmUgKyBDT05GSUdfUkVM
T0NBVEFCTEUuCgoKSG1tbSwgaXQgc3RpbGwgd29ya3MgZm9yIG1lIHdpdGggYm90aCBjbGFuZyBh
bmQgZ2NjLTkuCgoKWW91IGRvbid0IGhhdmUgdG8gZG8gdGhhdCBub3cgYnV0IGlzIHRoZXJlIGEg
d2F5IEkgY291bGQgZ2V0IHlvdXIgCmNvbXBpbGVkIGltYWdlPyBXaXRoIHRoZSBzaGExIHVzZWQg
dG8gYnVpbGQgaXQ/IFNvcnJ5LCBJIGRvbid0IHNlZSB3aGF0IApoYXBwZW5zLCBJIG5lZWQgdG8g
Z2V0IG15IGhhbmRzIGRpcnR5IGluIHNvbWUgZGVidWchCgoKVGhhbmtzIGZvciBiZWluZyBzbyBx
dWljayBDb25vciEKCgo+IENoZWVycywKPiBDb25vci4KPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4g
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
