Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FAED10F40
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 13:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MaViGz8gwZZUtDU2hP6lBHAFencFXH4ZJZm4zp+EzVI=; b=IIl6gvcp9LNCx0
	819dPD09BElIpFZQ/rgrp097OjInnJvkSkvEjjKIjCoYUYUHp9FNkFwqxDMLHOudan0xROJRQLZtk
	xNiMhi9WxCIx4T7zwUI0fxVEZVNZrKeHjd6YbGaHSUnewnW5lr1IYyvmwJ6XXaf4PyzSYypUX8P33
	bLZHWmramrgwkS4pITr++Iu2Q5EDsek1SQWMlB4hZdPv3fYOkQEzzc6747HqpCuYPc82oQUZ4XQ3O
	e+qa1uXrjVc+y/hL/noQ9y4tkGFidLDHkvYuXTbkVIZb3O5Pn8JBr3p90LRxII73h0P7qjAQgNc4q
	acHsil4A9CaChEUA9CCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOFBX-0000000F1cJ-3xKf;
	Wed, 26 Nov 2025 13:03:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOFBU-0000000F1by-2hak
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 13:03:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5553A168F;
	Wed, 26 Nov 2025 05:03:39 -0800 (PST)
Received: from [10.1.33.153] (unknown [10.1.33.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FDE83F66E;
	Wed, 26 Nov 2025 05:03:44 -0800 (PST)
Message-ID: <c0818f5b-b8a1-4730-aa1d-df0f547a3d47@arm.com>
Date: Wed, 26 Nov 2025 13:03:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/22] mm: Always use page table accessor functions
Content-Language: en-GB
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org, devicetree@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh+dt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Anshuman Khandual <anshuman.khandual@arm.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
 <20251113014656.2605447-7-samuel.holland@sifive.com>
 <02e3b3bd-ae6a-4db4-b4a1-8cbc1bc0a1c8@arm.com>
 <bc88d132-452a-42a1-9ee5-5407334d8aac@kernel.org>
 <df7d10ba-bb42-4ea1-8c5b-5db88a18eccb@kernel.org>
 <6bdf2b89-7768-4b90-b5e7-ff174196ea7b@lucifer.local>
 <71123d7a-641b-41df-b959-88e6c2a3a441@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <71123d7a-641b-41df-b959-88e6c2a3a441@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_050349_001676_35D6CC4A 
X-CRM114-Status: GOOD (  28.45  )
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

T24gMjYvMTEvMjAyNSAxMjozNSwgRGF2aWQgSGlsZGVuYnJhbmQgKFJlZCBIYXQpIHdyb3RlOgo+
IE9uIDExLzI2LzI1IDEzOjI3LCBMb3JlbnpvIFN0b2FrZXMgd3JvdGU6Cj4+IE9uIFdlZCwgTm92
IDI2LCAyMDI1IGF0IDAxOjE5OjAwUE0gKzAxMDAsIERhdmlkIEhpbGRlbmJyYW5kIChSZWQgSGF0
KSB3cm90ZToKPj4+IE9uIDExLzI2LzI1IDEzOjE2LCBEYXZpZCBIaWxkZW5icmFuZCAoUmVkIEhh
dCkgd3JvdGU6Cj4+Pj4gT24gMTEvMjYvMjUgMTI6MDksIFJ5YW4gUm9iZXJ0cyB3cm90ZToKPj4+
Pj4gT24gMTMvMTEvMjAyNSAwMTo0NSwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4+Pj4+PiBTb21l
IHBsYXRmb3JtcyBuZWVkIHRvIGZpeCB1cCB0aGUgdmFsdWVzIHdoZW4gcmVhZGluZyBvciB3cml0
aW5nIHBhZ2UKPj4+Pj4+IHRhYmxlcy4gQmVjYXVzZSBvZiB0aGlzLCB0aGUgYWNjZXNzb3JzIG11
c3QgYWx3YXlzIGJlIHVzZWQ7IGl0IGlzIG5vdAo+Pj4+Pj4gdmFsaWQgdG8gc2ltcGx5IGRlcmVm
ZXJlbmNlIGEgcFhYX3QgcG9pbnRlci4KPj4+Pj4+Cj4+Pj4+PiBGaXggYWxsIG9mIHRoZSBpbnN0
YW5jZXMgb2YgdGhpcyBwYXR0ZXJuIGluIGdlbmVyaWMgY29kZSwgbW9zdGx5IGJ5Cj4+Pj4+PiBh
cHBseWluZyB0aGUgYmVsb3cgY29jY2luZWxsZSBzZW1hbnRpYyBwYXRjaCwgcmVwZWF0ZWQgZm9y
IGVhY2ggcGFnZQo+Pj4+Pj4gdGFibGUgbGV2ZWwuIFNvbWUgYWRkaXRpb25hbCBmaXhlcyB3ZXJl
IGFwcGxpZWQgbWFudWFsbHksIG1vc3RseSB0bwo+Pj4+Pj4gbWFjcm9zIHdoZXJlIHR5cGUgaW5m
b3JtYXRpb24gaXMgdW5hdmFpbGFibGUuCj4+Pj4+Pgo+Pj4+Pj4gSW4gYSBmZXcgcGxhY2VzLCBh
IGBwdGVfdCAqYCBvciBgcG1kX3QgKmAgaXMgYWN0dWFsbHkgYSBwb2ludGVyIHRvIGEgUFRFCj4+
Pj4+PiBvciBQTURFIHZhbHVlIHN0b3JlZCBvbiB0aGUgc3RhY2ssIG5vdCBhIHBvaW50ZXIgdG8g
YSBwYWdlIHRhYmxlLiBJbgo+Pj4+Pj4gdGhvc2UgY2FzZXMsIGl0IGlzIG5vdCBhcHByb3ByaWF0
ZSB0byB1c2UgdGhlIGFjY2Vzc29ycywgYmVjYXVzZSB0aGUKPj4+Pj4+IHZhbHVlIGlzIG5vdCBn
bG9iYWxseSB2aXNpYmxlLCBhbmQgYW55IHRyYW5zZm9ybWF0aW9uIGZyb20gcFhYcF9nZXQoKQo+
Pj4+Pj4gaGFzIGFscmVhZHkgYmVlbiBhcHBsaWVkLiBUaG9zZSBwbGFjZXMgYXJlIG1hcmtlZCBi
eSBuYW1pbmcgdGhlIHBvaW50ZXIKPj4+Pj4+IGBwdGVudHBgIG9yIGBwbWR2YWxwYCwgYXMgb3Bw
b3NlZCB0byBgcHRlcGAgb3IgYHBtZHBgLgo+Pj4+Pj4KPj4+Pj4+IEBACj4+Pj4+PiBwdGVfdCAq
UDsKPj4+Pj4+IGV4cHJlc3Npb24gRTsKPj4+Pj4+IGV4cHJlc3Npb24gSTsKPj4+Pj4+IEBACj4+
Pj4+PiAtIFBbSV0gPSBFCj4+Pj4+PiArIHNldF9wdGUoUCArIEksIEUpCj4+Pj4+Pgo+Pj4+Pj4g
QEAKPj4+Pj4+IHB0ZV90ICpQOwo+Pj4+Pj4gZXhwcmVzc2lvbiBFOwo+Pj4+Pj4gQEAKPj4+Pj4+
ICgKPj4+Pj4+IC0gV1JJVEVfT05DRSgqUCwgRSkKPj4+Pj4+ICsgc2V0X3B0ZShQLCBFKQo+Pj4+
Pj4gfAo+Pj4+Pj4gLSAqUCA9IEUKPj4+Pj4+ICsgc2V0X3B0ZShQLCBFKQo+Pj4+Pj4gKQo+Pj4+
Pgo+Pj4+PiBUaGVyZSBzaG91bGQgYWJzb2x1dGVseSBuZXZlciBiZSBhbnkgaW5zdGFuY2VzIG9m
IGNvcmUgY29kZSBkaXJlY3RseQo+Pj4+PiBzZXR0aW5nIGFuCj4+Pj4+IGVudHJ5IGF0IGFueSBs
ZXZlbC4gVGhpcyAqbXVzdCogYWx3YXlzIGdvIHZpYSB0aGUgYXJjaCBjb2RlIGhlbHBlcnMuIERp
ZCB5b3UKPj4+Pj4gZmluZCBhbnkgaW5zdGFuY2VzIG9mIHRoaXM/IElmIHNvLCBJIHdvdWxkIGNv
bnNpZGVyIHRoZXNlIGJ1Z3MgYW5kIHN1Z2dlc3QKPj4+Pj4gc2VuZGluZyBhcyBhIHNlcGFyYXRl
IGJ1Z2ZpeCBwYXRjaC4gQmFkIHRoaW5ncyBjb3VsZCBoYXBwZW4gb24gYXJtNjQKPj4+Pj4gYmVj
YXVzZSB3ZQo+Pj4+PiBtYXkgbmVlZCB0byBicmVhayBhIGNvbnRpZ3VvdXMgbWFwcGluZywgd2hp
Y2ggd291bGQgbm90IGhhcHBlbiBpZiB0aGUgdmFsdWUgaXMKPj4+Pj4gc2V0IGRpcmVjdGx5Lgo+
Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IEBACj4+Pj4+PiBwdGVfdCAqUDsKPj4+Pj4+IGV4cHJlc3Npb24g
STsKPj4+Pj4+IEBACj4+Pj4+PiAoCj4+Pj4+PiDCoMKgwqDCoCAmUFtJXQo+Pj4+Pj4gfAo+Pj4+
Pj4gLSBSRUFEX09OQ0UoUFtJXSkKPj4+Pj4+ICsgcHRlcF9nZXQoUCArIEkpCj4+Pj4+PiB8Cj4+
Pj4+PiAtIFBbSV0KPj4+Pj4+ICsgcHRlcF9nZXQoUCArIEkpCj4+Pj4+PiApCj4+Pj4+Pgo+Pj4+
Pj4gQEAKPj4+Pj4+IHB0ZV90ICpQOwo+Pj4+Pj4gQEAKPj4+Pj4+ICgKPj4+Pj4+IC0gUkVBRF9P
TkNFKCpQKQo+Pj4+Pj4gKyBwdGVwX2dldChQKQo+Pj4+Pj4gfAo+Pj4+Pj4gLSAqUAo+Pj4+Pj4g
KyBwdGVwX2dldChQKQo+Pj4+Pj4gKQo+Pj4+Pgo+Pj4+PiBGb3IgcmVhZGluZyB0aGUgKlBURSos
IGNvbnZlcnNpb24gb3ZlciB0byBwdGVwX2dldCgpIHNob3VsZCBoYXZlIGFscmVhZHkgYmVlbgo+
Pj4+PiBkb25lIChJIGRpZCB0aGlzIGEgZmV3IHllYXJzIGJhY2sgd2hlbiBpbXBsZW1lbnRpbmcg
c3VwcG9ydCBmb3IgYXJtNjQKPj4+Pj4gY29udGlndW91cwo+Pj4+PiBtYXBwaW5ncykuIElmIHlv
dSBmaW5kIGFueSBjYXNlcyB3aGVyZSBkaXJlY3QgZGVyZWZlcmVuY2Ugb3IgUkVBRF9PTkNFKCkg
aXMKPj4+Pj4gYmVpbmcgZG9uZSBpbiBnZW5lcmljIGNvZGUgZm9yIFBURSwgdGhlbiB0aGF0J3Mg
YSBidWcgYW5kIHNob3VsZCBhbHNvIGJlCj4+Pj4+IHNlbnQgYXMKPj4+Pj4gYSBzZXBhcmF0ZSBw
YXRjaC4KPj4+Pj4KPj4+Pj4gRllJLCBteSBleHBlcmllbmNlIHdhcyB0aGF0IENvY2NpbmVsbGUg
ZGlkbid0IGZpbmQgZXZlcnl0aGluZyB3aGVuIEkgd2FzCj4+Pj4+IGNvbnZlcnRpbmcgdG8gcHRl
cF9nZXQoKSAtIGFsdGhvdWdoIGl0IGNvdWxkIGhhdmUgYmVlbiB0aGF0IG15IENvY2hpbmVsbGUK
Pj4+Pj4gc2tpbGxzCj4+Pj4+IHdlcmUgbm90IHVwIHRvIHNjcmF0Y2ghIEkgZW5kZWQgdXAgdXNp
bmcgYW4gYWRkaXRpb25hbCBtZXRob2Qgd2hlcmUgSSBkaWQgYQo+Pj4+PiBmaW5kL3JlcGxhY2Ug
dG8gY29udmVydCAicHRlX3QgKiIgdG8gInB0ZXBfaGFuZGxlX3QiIGFuZCBkZWNsYXJlZCBwdGVf
aGFuZGxlX3QKPj4+Pj4gYXMgYSB2b2lkKiB3aGljaCBjYXVzZXMgYSBjb21waWxlciBlcnJvciBv
biBkZXJlZmVyZW5jZS4gVGhlbiBpbiBhIGZldyBrZXkKPj4+Pj4gcGxhY2VzIEkgZGlkIGEgbWFu
dWFsIGNhc2UgZnJvbSBwdGVfaGFuZGxlX3QgdG8gKHB0ZV90ICopIGFuZCBjb21waWxlZAo+Pj4+
PiBhbGx5ZXNjb25maWcuCj4+Pj4+Cj4+Pj4+IEknbSBhc3N1bWluZyB0aGUgYWJvdmUgQ29jY2hp
bmVsbGUgdGVtcGxhdGUgd2FzIGFsc28gdXNlZCBmb3IgcG1kX3QsIHB1ZF90LAo+Pj4+PiBwNGRf
dCBhbmQgcGdkX3Q/Cj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gQWRkaXRpb25hbGx5LCB0aGUgZm9sbG93
aW5nIHNlbWFudGljIHBhdGNoIHdhcyB1c2VkIHRvIGNvbnZlcnQgUE1EIGFuZAo+Pj4+Pj4gUFVE
IHJlZmVyZW5jZXMgaW5zaWRlIHN0cnVjdCB2bV9mYXVsdDoKPj4+Pj4+Cj4+Pj4+PiBAQAo+Pj4+
Pj4gc3RydWN0IHZtX2ZhdWx0IHZtZjsKPj4+Pj4+IEBACj4+Pj4+PiAoCj4+Pj4+PiAtICp2bWYu
cG1kCj4+Pj4+PiArIHBtZHBfZ2V0KHZtZi5wbWQpCj4+Pj4+PiB8Cj4+Pj4+PiAtICp2bWYucHVk
Cj4+Pj4+PiArIHB1ZHBfZ2V0KHZtZi5wdWQpCj4+Pj4+PiApCj4+Pj4+Pgo+Pj4+Pj4gQEAKPj4+
Pj4+IHN0cnVjdCB2bV9mYXVsdCAqdm1mOwo+Pj4+Pj4gQEAKPj4+Pj4+ICgKPj4+Pj4+IC0gKnZt
Zi0+cG1kCj4+Pj4+PiArIHBtZHBfZ2V0KHZtZi0+cG1kKQo+Pj4+Pj4gfAo+Pj4+Pj4gLSAqdm1m
LT5wdWQKPj4+Pj4+ICsgcHVkcF9nZXQodm1mLT5wdWQpCj4+Pj4+PiApCj4+Pj4+Pgo+Pj4+Pj4K
Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZp
dmUuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiBUaGlzIGNvbW1pdCBjb3ZlcnMgc29tZSBvZiB0aGUg
c2FtZSBjaGFuZ2VzIGFzIGFuIGV4aXN0aW5nIHNlcmllcyBmcm9tCj4+Pj4+PiBBbnNodW1hbiBL
aGFuZHVhbFsxXS4gVW5saWtlIHRoYXQgc2VyaWVzLCB0aGlzIGNvbW1pdCBpcyBhIHB1cmVseQo+
Pj4+Pj4gbWVjaGFuaWNhbCBjb252ZXJzaW9uIHRvIGRlbW9uc3RyYXRlIHRoZSBSSVNDLVYgY2hh
bmdlcywgc28gaXQgZG9lcyBub3QKPj4+Pj4+IGluc2VydCBsb2NhbCB2YXJpYWJsZXMgdG8gYXZv
aWQgcmVkdW5kYW50IGNhbGxzIHRvIHRoZSBhY2Nlc3NvcnMuIEEKPj4+Pj4+IG1hbnVhbCBjb252
ZXJzaW9uIGxpa2UgaW4gdGhhdCBzZXJpZXMgY291bGQgaW1wcm92ZSBwZXJmb3JtYW5jZS4KPj4+
Pj4+Cj4+Pj4+PiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1tLzIwMjQwOTE3
MDczMTE3LjE1MzEyMDctMS0KPj4+Pj4+IGFuc2h1bWFuLmtoYW5kdWFsQGFybS5jb20vCj4+Pj4+
Cj4+Pj4+IEhpLAo+Pj4+Pgo+Pj4+PiBJJ3ZlIGp1c3QgY29tZSBhY3Jvc3MgdGhpcyBwYXRjaCBh
bmQgd2FudGVkIHRvIG1lbnRpb24gdGhhdCB3ZSBjb3VsZCBhbHNvCj4+Pj4+IGJlbmVmaXQgZnJv
bSB0aGlzIGltcHJvdmVkIGFic3JhY3Rpb24gZm9yIHNvbWUgZmVhdHVyZXMgd2UgYXJlIGxvb2tp
bmcgYXQgZm9yCj4+Pj4+IGFybTY0LiBBcyB5b3UgbWVudGlvbiwgQW5zaHVtYW4gaGFkIGEgZ28g
YnV0IGhpdCBzb21lIHJvYWRibG9ja3MuCj4+Pj4+Cj4+Pj4+IFRoZSBtYWluIGlzc3VlIGlzIHRo
YXQgdGhlIGNvbXBpbGVyIHdhcyB1bmFibGUgdG8gb3B0aW1pemUgYXdheSB0aGUKPj4+Pj4gUkVB
RF9PTkNFKClzCj4+Pj4+IGZvciB0aGUgY2FzZSB3aGVyZSBjZXJ0YWluIGxldmVscyBvZiB0aGUg
cGd0YWJsZSBhcmUgZm9sZGVkLiBCdXQgaXQgY2FuCj4+Pj4+IG9wdGltaXplCj4+Pj4+IHRoZSBw
bGFpbiBDIGRlcmVmZXJlbmNlcy4gVGhlcmUgd2VyZSBjb21wbGFpbnRzIHRoZSB0aGUgZ2VuZXJh
dGVkIGNvZGUgZm9yIGFybQo+Pj4+PiAoMzIpIGFuZCBwb3dlcnBjIHdhcyBzaWduaWZpY2FudGx5
IGltcGFjdGVkIGR1ZSB0byBoYXZpbmcgbWFueSBtb3JlCj4+Pj4+IChyZWR1bmRhbnQpCj4+Pj4+
IGxvYWRzLgo+Pj4+Pgo+Pj4+Cj4+Pj4gV2UgZG8gaGF2ZSBtbV9wbWRfZm9sZGVkKCkvcDRkX2Zv
bGRlZCgpIGV0YywgY291bGQgdGhhdCBoZWxwIHRvIHNvcnQKPj4+PiB0aGlzIG91dCBpbnRlcm5h
bGx5Pwo+Pj4+Cj4+Pgo+Pj4gSnVzdCBzdHVtYmxlZCBvdmVyIHRoZSByZXBseSBmcm9tIENocmlz
dG9wZToKPj4+Cj4+PiBodHRwczovL2xrbWwua2VybmVsLm9yZy9yLzAwMTlkNjc1LWNlM2QtNGE1
Yy04OWVkLWYxMjZjNDUxNDVjOUBrZXJuZWwub3JnCj4+Pgo+Pj4gQW5kIHdvbmRlciBpZiB3ZSBj
b3VsZCBoYW5kbGUgdGhhdCBzb21laG93IGRpcmVjdGx5IGluIHRoZSBwZ2RwX2dldCgpIGV0Yy4K
CkkgY2VydGFpbmx5IGRvbid0IGxpa2UgdGhlIHN1Z2dlc3Rpb24gb2YgZG9pbmcgdGhlIGlzX2Zv
bGRlZCgpIHRlc3Qgb3V0c2lkZSB0aGUKaGVscGVyLCBidXQgaWYgd2UgY2FuIHB1c2ggdGhhdCBs
b2dpYyBkb3duIGludG8gcFhkcF9nZXQoKSB0aGF0IHdvdWxkIGJlIHByZXR0eQpuZWF0LiBBbnNo
dW1hbiBhbmQgSSBkaWQgYnJpZWZseSBwbGF5IHdpdGggdGhlIGlkZWEgb2YgZG9pbmcgYSBDIGRl
cmVmZXJlbmNlIGlmCnRoZSBsZXZlbCBpcyBmb2xkZWQgYW5kIGEgUkVBRF9PTkNFKCkgb3RoZXJ3
aXNlLCBhbGwgaW5zaWRlIGVhY2ggcFhkcF9nZXQoKQpoZWxwZXIuIEFsdGhvdWdoIHdlIG5ldmVy
IHByb3ZlZCBpdCB0byBiZSBjb3JyZWN0LiBJIHN0cnVnZ2xlIHdpdGggdGhlIG1vZGVsIGZvcgpm
b2xkaW5nLiBEbyB5b3Ugd2FudCB0byBvcHRpbWl6ZSBvdXQgYWxsLWJ1dC10aGUtaGlnaGVzdCBs
ZXZlbCdzIGFjY2VzcyBvcgphbGwtYnV0LXRoZS1sb3dlc3QgbGV2ZWwncyBhY2Nlc3M/IE1ha2Vz
IG15IGhlYWQgaHVydC4uLgoKCj4+Cj4+IEkgZmluZCB0aGF0IGtpbmQgb2YgZ3Jvc3MgdG8gYmUg
aG9uZXN0LiBJc24ndCB0aGUgd2hvbGUgcG9pbnQgb2YgZm9sZGluZyB0aGF0IHdlCj4+IGRvbid0
IGhhdmUgdG8gdGhpbmsgYWJvdXQgaXQuLi4KCkFncmVlZCwgYnV0IGlmIHdlIGNhbiBwdXQgaXQg
aW5zaWRlIHRoZSBkZWZhdWx0IGhlbHBlciBpbXBsZW1lbnRhdGlvbiwgdGhhdApzb2x2ZXMgaXQs
IEkgdGhpbms/IEFuIGFyY2ggaGFzIHRvIGJlIGNhcmVmdWwgaWYgdGhleSBhcmUgb3ZlcnJpZGlu
ZyB0aGUKZGVmYXVsdHMsIGJ1dCBpdCdzIHN0aWxsIHdlbGwgY29udGFpbmVkLgoKPiAKPiBJZiB3
ZSBjb3VsZCBhZGp1c3QgZ2VuZXJpYyBwZ2RwX2dldCgpIGFuZCBmcmllbmRzIHRvIG5vdCBkbyBh
IFJFQURfT05DRSgpIG9uY2UKPiBmb2xkZWQgd2UgbWlnaHQgbm90IGhhdmUgdG8gdGhpbmsgYWJv
dXQgdGhhdCBpbiB0aGUgY2FsbGVycy4KPiAKPiBKdXN0IGFuIGlkZWEsIHRob3VnaCwgbm90IHN1
cmUgaWYgdGhhdCB3b3VsZCBmbHkgdGhlIHdheSBJIGVudmlzaW9uIGl0LgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
