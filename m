Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1002D11183
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 08:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lKbrXE/l1FDwoFdtIOVw7ijHDXTVElzR2byQmcAttWY=; b=2h31JfllEKAB3Y
	keJl/pHgvDIROCcUyJ1fHkjAs0Mkow1naS9ZgtoxhHkwpWKXj9HEWAFpjoyv/N4PmT9527SwUHQK6
	Bf1WqUNy+sGBCOs0ZE/nb+rkJTwT4+S3oDgqlambcORCKDHCJBgAfOo8YzgnYjY6qdwD3KMaKvbGC
	jhWQrG9M0ZrH1oipGNOjdbGV/SMVqd8hoimxkW9VDTcXjEYjm0wIFVc4mV+50jr/q/S2om1gZePit
	p+WcKZ4C5g66/rlAiz+p2Lv1y5vaasxRtDfHF+GQrtQtJp7FzOUONx2KolDfU1RT2qrr9Zonh/FeW
	nYlJYQ6aL6u7NYlKPNGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXKz-0000000GCZW-0eTv;
	Thu, 27 Nov 2025 08:26:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXKw-0000000GCYj-0nFB
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 08:26:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86C9E423E4;
	Thu, 27 Nov 2025 08:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336B6C4CEF8;
	Thu, 27 Nov 2025 08:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764232005;
	bh=bcPfE1QJFfuPJbcIojv7Nn8Gaq58C6i7WGhcnOmsWd4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WcmFwl3BFSTa59/qQB3P8sjeCiQkh28Bx5X8iBQfaUe9YSkO9nM6cU7737TjnKOAp
	 JJkTOlBk92QSIZ2v8m6Y6XbVK9HWVET1oCn6iBF1FjQogwNkbb80I07YujudKOOV/w
	 jrIBVQvi9EmOYcwjbuxYPeKj4FIh8G+4H+CR5PI3EtQcfNOF6BBZM98kJDPYxtAGma
	 9DJFGkFyQVPcFXE1Z/hTrfVM345+WrNeKTmw1VLoc3DWXOvGUwLitd1sX0X02raP8b
	 M5NVBmYkjvj75YhwFp8eFNQl9M+E9BJCXFBZubd8BB0leNXs9KcXf5d4SR52xj4DCC
	 +M1Pg28PbX3VQ==
Message-ID: <a33b87ab-b24f-45d5-bd4a-646988b54a2b@kernel.org>
Date: Thu, 27 Nov 2025 09:26:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/22] mm: Always use page table accessor functions
To: Ryan Roberts <ryan.roberts@arm.com>, Wei Yang <richard.weiyang@gmail.com>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Samuel Holland <samuel.holland@sifive.com>,
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
 <c0818f5b-b8a1-4730-aa1d-df0f547a3d47@arm.com>
 <20251126134726.yrya5xxayfcde3kl@master>
 <ee5f5da3-8c6b-4381-aee8-b0fab56cbf83@arm.com>
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Language: fr-FR
In-Reply-To: <ee5f5da3-8c6b-4381-aee8-b0fab56cbf83@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_002646_307635_5F528D8B 
X-CRM114-Status: GOOD (  18.79  )
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

CgpMZSAyNi8xMS8yMDI1IMOgIDE1OjIyLCBSeWFuIFJvYmVydHMgYSDDqWNyaXTCoDoKPiBPbiAy
Ni8xMS8yMDI1IDEzOjQ3LCBXZWkgWWFuZyB3cm90ZToKPj4gT24gV2VkLCBOb3YgMjYsIDIwMjUg
YXQgMDE6MDM6NDJQTSArMDAwMCwgUnlhbiBSb2JlcnRzIHdyb3RlOgo+Pj4gT24gMjYvMTEvMjAy
NSAxMjozNSwgRGF2aWQgSGlsZGVuYnJhbmQgKFJlZCBIYXQpIHdyb3RlOgo+PiBbLi4uXQo+Pj4+
Pj4+PiBIaSwKPj4+Pj4+Pj4KPj4+Pj4+Pj4gSSd2ZSBqdXN0IGNvbWUgYWNyb3NzIHRoaXMgcGF0
Y2ggYW5kIHdhbnRlZCB0byBtZW50aW9uIHRoYXQgd2UgY291bGQgYWxzbwo+Pj4+Pj4+PiBiZW5l
Zml0IGZyb20gdGhpcyBpbXByb3ZlZCBhYnNyYWN0aW9uIGZvciBzb21lIGZlYXR1cmVzIHdlIGFy
ZSBsb29raW5nIGF0IGZvcgo+Pj4+Pj4+PiBhcm02NC4gQXMgeW91IG1lbnRpb24sIEFuc2h1bWFu
IGhhZCBhIGdvIGJ1dCBoaXQgc29tZSByb2FkYmxvY2tzLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGUg
bWFpbiBpc3N1ZSBpcyB0aGF0IHRoZSBjb21waWxlciB3YXMgdW5hYmxlIHRvIG9wdGltaXplIGF3
YXkgdGhlCj4+Pj4+Pj4+IFJFQURfT05DRSgpcwo+Pj4+Pj4+PiBmb3IgdGhlIGNhc2Ugd2hlcmUg
Y2VydGFpbiBsZXZlbHMgb2YgdGhlIHBndGFibGUgYXJlIGZvbGRlZC4gQnV0IGl0IGNhbgo+Pj4+
Pj4+PiBvcHRpbWl6ZQo+Pj4+Pj4+PiB0aGUgcGxhaW4gQyBkZXJlZmVyZW5jZXMuIFRoZXJlIHdl
cmUgY29tcGxhaW50cyB0aGUgdGhlIGdlbmVyYXRlZCBjb2RlIGZvciBhcm0KPj4+Pj4+Pj4gKDMy
KSBhbmQgcG93ZXJwYyB3YXMgc2lnbmlmaWNhbnRseSBpbXBhY3RlZCBkdWUgdG8gaGF2aW5nIG1h
bnkgbW9yZQo+Pj4+Pj4+PiAocmVkdW5kYW50KQo+Pj4+Pj4+PiBsb2Fkcy4KPj4+Pj4+Pj4KPj4+
Pj4+Pgo+Pj4+Pj4+IFdlIGRvIGhhdmUgbW1fcG1kX2ZvbGRlZCgpL3A0ZF9mb2xkZWQoKSBldGMs
IGNvdWxkIHRoYXQgaGVscCB0byBzb3J0Cj4+Pj4+Pj4gdGhpcyBvdXQgaW50ZXJuYWxseT8KPj4+
Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IEp1c3Qgc3R1bWJsZWQgb3ZlciB0aGUgcmVwbHkgZnJvbSBDaHJp
c3RvcGU6Cj4+Pj4+Pgo+Pj4+Pj4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5v
dXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGttbC5rZXJuZWwub3JnJTJGciUyRjAwMTlk
Njc1LWNlM2QtNGE1Yy04OWVkLWYxMjZjNDUxNDVjOSU0MGtlcm5lbC5vcmcmZGF0YT0wNSU3QzAy
JTdDY2hyaXN0b3BoZS5sZXJveSU0MGNzZ3JvdXAuZXUlN0MyMmQwYTAyOGIxZWM0YThiNjc4MTA4
ZGUyY2Y3Mzc2OSU3QzhiODdhZjdkODY0NzRkYzc4ZGY0NWY2OWEyMDExYmI1JTdDMCU3QzAlN0M2
Mzg5OTc2Mzc0ODExMTk5NTQlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKRmJYQjBlVTFoY0dr
aU9uUnlkV1VzSWxZaU9pSXdMakF1TURBd01DSXNJbEFpT2lKWGFXNHpNaUlzSWtGT0lqb2lUV0Zw
YkNJc0lsZFVJam95ZlElM0QlM0QlN0MwJTdDJTdDJTdDJnNkYXRhPW9jUjZ1c1ZnUkhmdWUwTXJ0
YlFuRE84d2hJTnZ5JTJGRE1BZk5FM2NhaVk4YyUzRCZyZXNlcnZlZD0wCj4+Pj4+Pgo+Pj4+Pj4g
QW5kIHdvbmRlciBpZiB3ZSBjb3VsZCBoYW5kbGUgdGhhdCBzb21laG93IGRpcmVjdGx5IGluIHRo
ZSBwZ2RwX2dldCgpIGV0Yy4KPj4+Cj4+PiBJIGNlcnRhaW5seSBkb24ndCBsaWtlIHRoZSBzdWdn
ZXN0aW9uIG9mIGRvaW5nIHRoZSBpc19mb2xkZWQoKSB0ZXN0IG91dHNpZGUgdGhlCj4+PiBoZWxw
ZXIsIGJ1dCBpZiB3ZSBjYW4gcHVzaCB0aGF0IGxvZ2ljIGRvd24gaW50byBwWGRwX2dldCgpIHRo
YXQgd291bGQgYmUgcHJldHR5Cj4+PiBuZWF0LiBBbnNodW1hbiBhbmQgSSBkaWQgYnJpZWZseSBw
bGF5IHdpdGggdGhlIGlkZWEgb2YgZG9pbmcgYSBDIGRlcmVmZXJlbmNlIGlmCj4+PiB0aGUgbGV2
ZWwgaXMgZm9sZGVkIGFuZCBhIFJFQURfT05DRSgpIG90aGVyd2lzZSwgYWxsIGluc2lkZSBlYWNo
IHBYZHBfZ2V0KCkKPj4+IGhlbHBlci4gQWx0aG91Z2ggd2UgbmV2ZXIgcHJvdmVkIGl0IHRvIGJl
IGNvcnJlY3QuIEkgc3RydWdnbGUgd2l0aCB0aGUgbW9kZWwgZm9yCj4+PiBmb2xkaW5nLiBEbyB5
b3Ugd2FudCB0byBvcHRpbWl6ZSBvdXQgYWxsLWJ1dC10aGUtaGlnaGVzdCBsZXZlbCdzIGFjY2Vz
cyBvcgo+Pj4gYWxsLWJ1dC10aGUtbG93ZXN0IGxldmVsJ3MgYWNjZXNzPyBNYWtlcyBteSBoZWFk
IGh1cnQuLi4KPj4+Cj4+Pgo+Pgo+PiBZb3UgbWVhbiBzdGggbGlrZToKPj4KPj4gc3RhdGljIGlu
bGluZSBwbWRfdCBwbWRwX2dldChwbWRfdCAqcG1kcCkKPj4gewo+PiAjaWZkZWYgX19QQUdFVEFC
TEVfUE1EX0ZPTERFRAo+PiAJcmV0dXJuICpwbWRwOwo+PiAjZWxzZQo+PiAJcmV0dXJuIFJFQURf
T05DRSgqcG1kcCk7Cj4+ICNlbmRpZgo+PiB9Cj4gCj4gWWVzLiBCdXQgSSdtIG5vdCBjb252aW5j
ZWQgaXQncyBjb3JyZWN0Lgo+IAo+IEkgKnRoaW5rKiAoYnV0IHBsZWFzZSBjb3JyZWN0IG1lIGlm
IEknbSB3cm9uZykgaWYgdGhlIFBNRCBpcyBmb2xkZWQsIHRoZSBQVUQgYW5kCj4gUDREIG11c3Qg
YWxzbyBiZSBmb2xkZWQsIGFuZCB5b3UgZWZmZWN0aXZlbHkgaGF2ZSBhIDIgbGV2ZWwgcGd0YWJs
ZSBjb25zaXN0aW5nCj4gb2YgdGhlIFBHRCB0YWJsZSBhbmQgdGhlIFBURSB0YWJsZS4gcDRkcF9n
ZXQoKSwgcHVkcF9nZXQoKSBhbmQgcG1kcF9nZXQoKSBhcmUKPiBhbGwgZWZmZWN0aXZlbHkgZHVw
bGljYXRpbmcgdGhlIGxvYWQgb2YgdGhlIHBnZCBlbnRyeT8gU28gYXNzdW1pbmcgcGdkcF9nZXQo
KQo+IHdhcyBhbHJlYWR5IGNhbGxlZCBhbmQgdXNlZCBSRUFEX09OQ0UoKSwgeW91IG1pZ2h0IGhv
cGUgdGhlIGNvbXBpbGVyIHdpbGwganVzdAo+IGRyb3AgdGhlIG90aGVyIGxvYWRzIGFuZCBqdXN0
IHVzZSB0aGUgdmFsdWUgcmV0dXJuZWQgYnkgUkVBRF9PTkNFKCkuIEJ1dCBJIGRvdWJ0Cj4gdGhl
cmUgaXMgYW55IGd1YXJhbnRlZSBvZiB0aGF0IGFuZCB5b3UgbWlnaHQgYmUgaW4gYSBzaXR1YXRp
b24gd2hlcmUgcGdkcF9nZXQoKQo+IG5ldmVyIGV2ZW4gZ290IGNhbGxlZCAocGVyaGFwcyB5b3Ug
YWxyZWFkeSBoYXZlIHRoZSBwbWQgcG9pbnRlcikuCgpJIHRoaW5rIHlvdSBjYW4ndCBhc3N1bWUg
cGdkcF9nZXQoKSB3YXMgYWxyZWFkeSBjYWxsZWQsIGJlY2F1c2Ugc29tZSAKcGFydHMgb2YgY29k
ZSB3aWxsIGRpcmVjdGx5IGRlc2NlbmQgdG8gUE1EIGxldmVsIHVzaW5nIHBtZF9vZmYoKSBvciAK
cG1kX29mZl9rKCkKCnN0YXRpYyBpbmxpbmUgcG1kX3QgKnBtZF9vZmYoc3RydWN0IG1tX3N0cnVj
dCAqbW0sIHVuc2lnbmVkIGxvbmcgdmEpCnsKCXJldHVybiBwbWRfb2Zmc2V0KHB1ZF9vZmZzZXQo
cDRkX29mZnNldChwZ2Rfb2Zmc2V0KG1tLCB2YSksIHZhKSwgdmEpLCB2YSk7Cn0KCnN0YXRpYyBp
bmxpbmUgcG1kX3QgKnBtZF9vZmZfayh1bnNpZ25lZCBsb25nIHZhKQp7CglyZXR1cm4gcG1kX29m
ZnNldChwdWRfb2Zmc2V0KHA0ZF9vZmZzZXQocGdkX29mZnNldF9rKHZhKSwgdmEpLCB2YSksIHZh
KTsKfQoKCkNocmlzdG9waGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
