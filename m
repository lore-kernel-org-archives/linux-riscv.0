Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73193C52D70
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 19:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWxLodhTY1maPlBdghiW26F1wyPWGRn37H+nYELLVtQ=; b=ZRKJgVa/JjB/bt
	ZO6QxTzEjsMZ7BRsBayGrggYfMEwI5pr5od9YRbhuWEU1y2TJRWn8XX/bHecTLQ2L/kbLZ5fVQqUb
	udzzTLkRJbaunecpbwLYFJxjmrSUiknrnPiHjSYOGoqkKENMIlHCjIcO8qNocDSxDAiBwk3n3hn/L
	Kow8zB6lPwfFSvpWx0OwVejtygzC8fub35Hii0ecWVt6vrXeaB6h9K5mq5v//kab0SXuc/1f/S+6O
	6/Fwk9+ENCKAlbFbh1aP/rqKvqbyUorOtlykRvHXumLrfrdHTJWHigeFZEUqWc8kORxeUhAltjqtk
	rWTxZRvQmotr4UIAnXIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbPnc-00000002ghm-16vP;
	Tue, 06 Aug 2024 19:24:48 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbPnY-00000002ggX-3bAl
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 19:24:46 +0000
Received: from [192.168.49.54] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8018920B7165;
	Tue,  6 Aug 2024 12:24:40 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8018920B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1722972281;
	bh=Qbx96xFbGoYdTWGhHn3B+cy2pNWGVzfzN21Xqhn+OSk=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=SqXCxba7R3fhOrXQIUZw3R4WO4OkqLSq0ky5wLl6zBu3kxtU4lSB7e0xih8mApH5E
	 sCdfu13aveEjfkIQ9CMyGkjBs7+EvZF46Gr4HZ5p1dckvpOkNliR0kW2lXLKpCg8Km
	 1KUtVl+grJYw+dT7Ck7tx9MIrgOovUzrlSZqbCI4=
Message-ID: <389da90e-df78-4ea4-8453-ae2080a68956@linux.microsoft.com>
Date: Tue, 6 Aug 2024 12:24:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/7] iommu/riscv: Paging domain support
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1718388908.git.tjeznach@rivosinc.com>
 <bdd1e0547e01d012bf40c5e33b752e77c6663c90.1718388909.git.tjeznach@rivosinc.com>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <bdd1e0547e01d012bf40c5e33b752e77c6663c90.1718388909.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_122445_002749_01C6691E 
X-CRM114-Status: GOOD (  15.05  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, eahariha@linux.microsoft.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNi8xNC8yMDI0IDEwOjI3IFBNLCBUb21hc3ogSmV6bmFjaCB3cm90ZToKPiBJbnRyb2R1Y2Ug
Zmlyc3Qtc3RhZ2UgYWRkcmVzcyB0cmFuc2xhdGlvbiBzdXBwb3J0Lgo+IAo+IFBhZ2UgdGFibGUg
Y29uZmlndXJlZCBieSB0aGUgSU9NTVUgZHJpdmVyIHdpbGwgdXNlIHRoZSBoaWdoZXN0IG1vZGUK
PiBpbXBsZW1lbnRlZCBieSB0aGUgaGFyZHdhcmUsIHVubGVzcyBub3Qga25vd24gYXQgdGhlIGRv
bWFpbiBhbGxvY2F0aW9uCj4gdGltZSBmYWxsaW5nIGJhY2sgdG8gdGhlIENQVeKAmXMgTU1VIHBh
Z2UgbW9kZS4KPiAKPiBUaGlzIGNoYW5nZSBpbnRyb2R1Y2VzIElPVElOVkFMLlZNQSBjb21tYW5k
LCByZXF1aXJlZCB0byBpbnZhbGlkYXRlCj4gYW55IGNhY2hlZCBJT0FUQyBlbnRyaWVzIGFmdGVy
IG1hcHBpbmcgaXMgdXBkYXRlZCBhbmQvb3IgcmVtb3ZlZCBmcm9tCj4gdGhlIHBhZ2luZyBkb21h
aW4uICBJbnZhbGlkYXRpb25zIGZvciB0aGUgbm9uLWxlYWYgcGFnZSBlbnRyaWVzIHVzZQo+IElP
VElOVkFMIGZvciBhbGwgYWRkcmVzc2VzIGFzc2lnbmVkIHRvIHRoZSBwcm90ZWN0aW9uIGRvbWFp
biBmb3IKPiBoYXJkd2FyZSBub3Qgc3VwcG9ydGluZyBtb3JlIGdyYW51bGFyIG5vbi1sZWFmIHBh
Z2UgdGFibGUgY2FjaGUKPiBpbnZhbGlkYXRpb25zLgo+IAo+IFJldmlld2VkLWJ5OiBMdSBCYW9s
dSA8YmFvbHUubHVAbGludXguaW50ZWwuY29tPgo+IFJldmlld2VkLWJ5OiBab25nIExpIDx6b25n
LmxpQHNpZml2ZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVG9tYXN6IEplem5hY2ggPHRqZXpuYWNo
QHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jIHwgNjQy
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NjM5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCgo+IEBAIC04NTYsNyArMTQ3Myw3
IEBAIHN0YXRpYyBzdHJ1Y3QgaW9tbXVfZG9tYWluIHJpc2N2X2lvbW11X2lkZW50aXR5X2RvbWFp
biA9IHsKPiAgCj4gIHN0YXRpYyBpbnQgcmlzY3ZfaW9tbXVfZGV2aWNlX2RvbWFpbl90eXBlKHN0
cnVjdCBkZXZpY2UgKmRldikKPiAgewo+IC0JcmV0dXJuIElPTU1VX0RPTUFJTl9JREVOVElUWTsK
PiArCXJldHVybiAwOwo+ICB9Cgo8c25pcD4KU29ycnkgZm9yIHRoZSBkcml2ZSBieSBjb21tZW50
LCBJIGp1c3QgaGFwcGVuIHRvIGJlIGluIHRoZSBuZWFyYnkgY29kZQpjb250ZXh0LgoKTml0OiBJ
dCBtYXkgYmUgYmV0dGVyIHRvIHVzZSBJT01NVV9ET01BSU5fQkxPQ0tFRCBoZXJlIGZvciByZWFk
YWJpbGl0eQpyYXRoZXIgdGhhbiB0aGUgYmFyZSB2YWx1ZS4KClRoYW5rcywKRWFzd2FyCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
