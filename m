Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACB0D11183
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 08:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9diL5mbibq9YBRdQ1heQBENsOErJJ9pTufADa3BfcI=; b=GOEEPLQ5YxOw7u
	w63qQIEsfes/jz84dS0mEq+0vz27DM5SDS1DqcmntvX5NzyoJvoglIm0Wo7PMIvar1HTPb2jpCAst
	0YIfhNqXlNg+1JZqO6D/PQfFnSzCYAtHdEFtPmGNdjxKHqFG9LJdksXQTs6sfAlEIIxrn/YSrJ/p9
	CaUPiosClc2g0WQ5zxA2gTwTGTmH5y2TET8cBkV2A6MaiPOV6umgT10znnM5tIIBhKQ1avfyrDMaX
	OLT3EN+gnPoiaQTUPmn1B3W5vaMvdM9jBdPEe5OVHxBZvN+0ql6FrZ8njMd633VBOAslTFbi9dl1O
	ZrSYrIcG28spu92VCPSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXTh-0000000GDGG-3dU0;
	Thu, 27 Nov 2025 08:35:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXTf-0000000GDFs-0RDX
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 08:35:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3167540879;
	Thu, 27 Nov 2025 08:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E346C4CEF8;
	Thu, 27 Nov 2025 08:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764232546;
	bh=qx0VZrdqJksxpKXVCVyXb4JAI2P5dCq0KsV9HbIKGek=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JgZwtp8Tu+n8p3LaI0AsCxvsyQZRHcTfkmQ3l9GMb6+DsJHERvHrUAVvuNANZGssM
	 1M16aKThUv8pm2fpPqzK2E3IHdPvq+aq3wozuehRIzN/auBNvkuBrLr6jWjsAJGCMq
	 gKw7f/dbAyg/ijfp+HAJRn+vODfnzRDqa1NPE8PNzovArQpUEyQnNO9IlK9lVOFcaU
	 rIQPl3NMUd1o23B2Hqadw35UJ/5HrnWAquZp5u0emedD51lI/HoUp9yu7BgsLOvQ8k
	 XMwxnK1OciERhD8X2cpmZm/yFv7fG7M0DIasL3/JLatgVzgnVpA/FBj2y3iK0eiQu3
	 ClsmI9yWdvtIg==
Message-ID: <46ca641c-6a39-49e4-b1b2-23262841ecc8@kernel.org>
Date: Thu, 27 Nov 2025 09:35:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/22] mm: Always use page table accessor functions
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Wei Yang <richard.weiyang@gmail.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
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
 <a33b87ab-b24f-45d5-bd4a-646988b54a2b@kernel.org>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <a33b87ab-b24f-45d5-bd4a-646988b54a2b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_003547_206841_DAE84F09 
X-CRM114-Status: GOOD (  19.99  )
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

T24gMTEvMjcvMjUgMDk6MjYsIENocmlzdG9waGUgTGVyb3kgKENTIEdST1VQKSB3cm90ZToKPiAK
PiAKPiBMZSAyNi8xMS8yMDI1IMOgIDE1OjIyLCBSeWFuIFJvYmVydHMgYSDDqWNyaXTCoDoKPj4g
T24gMjYvMTEvMjAyNSAxMzo0NywgV2VpIFlhbmcgd3JvdGU6Cj4+PiBPbiBXZWQsIE5vdiAyNiwg
MjAyNSBhdCAwMTowMzo0MlBNICswMDAwLCBSeWFuIFJvYmVydHMgd3JvdGU6Cj4+Pj4gT24gMjYv
MTEvMjAyNSAxMjozNSwgRGF2aWQgSGlsZGVuYnJhbmQgKFJlZCBIYXQpIHdyb3RlOgo+Pj4gWy4u
Ll0KPj4+Pj4+Pj4+IEhpLAo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEkndmUganVzdCBjb21lIGFjcm9z
cyB0aGlzIHBhdGNoIGFuZCB3YW50ZWQgdG8gbWVudGlvbiB0aGF0IHdlIGNvdWxkIGFsc28KPj4+
Pj4+Pj4+IGJlbmVmaXQgZnJvbSB0aGlzIGltcHJvdmVkIGFic3JhY3Rpb24gZm9yIHNvbWUgZmVh
dHVyZXMgd2UgYXJlIGxvb2tpbmcgYXQgZm9yCj4+Pj4+Pj4+PiBhcm02NC4gQXMgeW91IG1lbnRp
b24sIEFuc2h1bWFuIGhhZCBhIGdvIGJ1dCBoaXQgc29tZSByb2FkYmxvY2tzLgo+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+IFRoZSBtYWluIGlzc3VlIGlzIHRoYXQgdGhlIGNvbXBpbGVyIHdhcyB1bmFibGUg
dG8gb3B0aW1pemUgYXdheSB0aGUKPj4+Pj4+Pj4+IFJFQURfT05DRSgpcwo+Pj4+Pj4+Pj4gZm9y
IHRoZSBjYXNlIHdoZXJlIGNlcnRhaW4gbGV2ZWxzIG9mIHRoZSBwZ3RhYmxlIGFyZSBmb2xkZWQu
IEJ1dCBpdCBjYW4KPj4+Pj4+Pj4+IG9wdGltaXplCj4+Pj4+Pj4+PiB0aGUgcGxhaW4gQyBkZXJl
ZmVyZW5jZXMuIFRoZXJlIHdlcmUgY29tcGxhaW50cyB0aGUgdGhlIGdlbmVyYXRlZCBjb2RlIGZv
ciBhcm0KPj4+Pj4+Pj4+ICgzMikgYW5kIHBvd2VycGMgd2FzIHNpZ25pZmljYW50bHkgaW1wYWN0
ZWQgZHVlIHRvIGhhdmluZyBtYW55IG1vcmUKPj4+Pj4+Pj4+IChyZWR1bmRhbnQpCj4+Pj4+Pj4+
PiBsb2Fkcy4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFdlIGRvIGhhdmUgbW1fcG1kX2Zv
bGRlZCgpL3A0ZF9mb2xkZWQoKSBldGMsIGNvdWxkIHRoYXQgaGVscCB0byBzb3J0Cj4+Pj4+Pj4+
IHRoaXMgb3V0IGludGVybmFsbHk/Cj4+Pj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+PiBKdXN0IHN0dW1i
bGVkIG92ZXIgdGhlIHJlcGx5IGZyb20gQ2hyaXN0b3BlOgo+Pj4+Pj4+Cj4+Pj4+Pj4gaHR0cHM6
Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJG
JTJGbGttbC5rZXJuZWwub3JnJTJGciUyRjAwMTlkNjc1LWNlM2QtNGE1Yy04OWVkLWYxMjZjNDUx
NDVjOSU0MGtlcm5lbC5vcmcmZGF0YT0wNSU3QzAyJTdDY2hyaXN0b3BoZS5sZXJveSU0MGNzZ3Jv
dXAuZXUlN0MyMmQwYTAyOGIxZWM0YThiNjc4MTA4ZGUyY2Y3Mzc2OSU3QzhiODdhZjdkODY0NzRk
Yzc4ZGY0NWY2OWEyMDExYmI1JTdDMCU3QzAlN0M2Mzg5OTc2Mzc0ODExMTk5NTQlN0NVbmtub3du
JTdDVFdGcGJHWnNiM2Q4ZXlKRmJYQjBlVTFoY0draU9uUnlkV1VzSWxZaU9pSXdMakF1TURBd01D
SXNJbEFpT2lKWGFXNHpNaUlzSWtGT0lqb2lUV0ZwYkNJc0lsZFVJam95ZlElM0QlM0QlN0MwJTdD
JTdDJTdDJnNkYXRhPW9jUjZ1c1ZnUkhmdWUwTXJ0YlFuRE84d2hJTnZ5JTJGRE1BZk5FM2NhaVk4
YyUzRCZyZXNlcnZlZD0wCj4+Pj4+Pj4KPj4+Pj4+PiBBbmQgd29uZGVyIGlmIHdlIGNvdWxkIGhh
bmRsZSB0aGF0IHNvbWVob3cgZGlyZWN0bHkgaW4gdGhlIHBnZHBfZ2V0KCkgZXRjLgo+Pj4+Cj4+
Pj4gSSBjZXJ0YWlubHkgZG9uJ3QgbGlrZSB0aGUgc3VnZ2VzdGlvbiBvZiBkb2luZyB0aGUgaXNf
Zm9sZGVkKCkgdGVzdCBvdXRzaWRlIHRoZQo+Pj4+IGhlbHBlciwgYnV0IGlmIHdlIGNhbiBwdXNo
IHRoYXQgbG9naWMgZG93biBpbnRvIHBYZHBfZ2V0KCkgdGhhdCB3b3VsZCBiZSBwcmV0dHkKPj4+
PiBuZWF0LiBBbnNodW1hbiBhbmQgSSBkaWQgYnJpZWZseSBwbGF5IHdpdGggdGhlIGlkZWEgb2Yg
ZG9pbmcgYSBDIGRlcmVmZXJlbmNlIGlmCj4+Pj4gdGhlIGxldmVsIGlzIGZvbGRlZCBhbmQgYSBS
RUFEX09OQ0UoKSBvdGhlcndpc2UsIGFsbCBpbnNpZGUgZWFjaCBwWGRwX2dldCgpCj4+Pj4gaGVs
cGVyLiBBbHRob3VnaCB3ZSBuZXZlciBwcm92ZWQgaXQgdG8gYmUgY29ycmVjdC4gSSBzdHJ1Z2ds
ZSB3aXRoIHRoZSBtb2RlbCBmb3IKPj4+PiBmb2xkaW5nLiBEbyB5b3Ugd2FudCB0byBvcHRpbWl6
ZSBvdXQgYWxsLWJ1dC10aGUtaGlnaGVzdCBsZXZlbCdzIGFjY2VzcyBvcgo+Pj4+IGFsbC1idXQt
dGhlLWxvd2VzdCBsZXZlbCdzIGFjY2Vzcz8gTWFrZXMgbXkgaGVhZCBodXJ0Li4uCj4+Pj4KPj4+
Pgo+Pj4KPj4+IFlvdSBtZWFuIHN0aCBsaWtlOgo+Pj4KPj4+IHN0YXRpYyBpbmxpbmUgcG1kX3Qg
cG1kcF9nZXQocG1kX3QgKnBtZHApCj4+PiB7Cj4+PiAjaWZkZWYgX19QQUdFVEFCTEVfUE1EX0ZP
TERFRAo+Pj4gCXJldHVybiAqcG1kcDsKPj4+ICNlbHNlCj4+PiAJcmV0dXJuIFJFQURfT05DRSgq
cG1kcCk7Cj4+PiAjZW5kaWYKPj4+IH0KPj4KPj4gWWVzLiBCdXQgSSdtIG5vdCBjb252aW5jZWQg
aXQncyBjb3JyZWN0Lgo+Pgo+PiBJICp0aGluayogKGJ1dCBwbGVhc2UgY29ycmVjdCBtZSBpZiBJ
J20gd3JvbmcpIGlmIHRoZSBQTUQgaXMgZm9sZGVkLCB0aGUgUFVEIGFuZAo+PiBQNEQgbXVzdCBh
bHNvIGJlIGZvbGRlZCwgYW5kIHlvdSBlZmZlY3RpdmVseSBoYXZlIGEgMiBsZXZlbCBwZ3RhYmxl
IGNvbnNpc3RpbmcKPj4gb2YgdGhlIFBHRCB0YWJsZSBhbmQgdGhlIFBURSB0YWJsZS4gcDRkcF9n
ZXQoKSwgcHVkcF9nZXQoKSBhbmQgcG1kcF9nZXQoKSBhcmUKPj4gYWxsIGVmZmVjdGl2ZWx5IGR1
cGxpY2F0aW5nIHRoZSBsb2FkIG9mIHRoZSBwZ2QgZW50cnk/IFNvIGFzc3VtaW5nIHBnZHBfZ2V0
KCkKPj4gd2FzIGFscmVhZHkgY2FsbGVkIGFuZCB1c2VkIFJFQURfT05DRSgpLCB5b3UgbWlnaHQg
aG9wZSB0aGUgY29tcGlsZXIgd2lsbCBqdXN0Cj4+IGRyb3AgdGhlIG90aGVyIGxvYWRzIGFuZCBq
dXN0IHVzZSB0aGUgdmFsdWUgcmV0dXJuZWQgYnkgUkVBRF9PTkNFKCkuIEJ1dCBJIGRvdWJ0Cj4+
IHRoZXJlIGlzIGFueSBndWFyYW50ZWUgb2YgdGhhdCBhbmQgeW91IG1pZ2h0IGJlIGluIGEgc2l0
dWF0aW9uIHdoZXJlIHBnZHBfZ2V0KCkKPj4gbmV2ZXIgZXZlbiBnb3QgY2FsbGVkIChwZXJoYXBz
IHlvdSBhbHJlYWR5IGhhdmUgdGhlIHBtZCBwb2ludGVyKS4KPiAKPiBJIHRoaW5rIHlvdSBjYW4n
dCBhc3N1bWUgcGdkcF9nZXQoKSB3YXMgYWxyZWFkeSBjYWxsZWQsIGJlY2F1c2Ugc29tZQo+IHBh
cnRzIG9mIGNvZGUgd2lsbCBkaXJlY3RseSBkZXNjZW5kIHRvIFBNRCBsZXZlbCB1c2luZyBwbWRf
b2ZmKCkgb3IKPiBwbWRfb2ZmX2soKQo+IAo+IHN0YXRpYyBpbmxpbmUgcG1kX3QgKnBtZF9vZmYo
c3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgdmEpCj4gewo+IAlyZXR1cm4gcG1k
X29mZnNldChwdWRfb2Zmc2V0KHA0ZF9vZmZzZXQocGdkX29mZnNldChtbSwgdmEpLCB2YSksIHZh
KSwgdmEpOwo+IH0KPiAKPiBzdGF0aWMgaW5saW5lIHBtZF90ICpwbWRfb2ZmX2sodW5zaWduZWQg
bG9uZyB2YSkKPiB7Cj4gCXJldHVybiBwbWRfb2Zmc2V0KHB1ZF9vZmZzZXQocDRkX29mZnNldChw
Z2Rfb2Zmc2V0X2sodmEpLCB2YSksIHZhKSwgdmEpOwo+IH0KCkknbGwgbm90ZSB0aGF0IHRoZXNl
IChuZXN0eSkgaGVscGVycyBvbmx5IHdvcmsgd2hlbiB5b3Uga25vdyB0aGF0IHlvdSAKaGF2ZSBm
b2xkZWQgcGFnZSB0YWJsZXMuCgpBbmQgdGhhdCdzIHdoeSBJIGFtIGFyZ3VpbmcgdGhhdCB0aGUg
cG1kcF9nZXQoKSBtdXN0IGFjdHVhbGx5IGJlIGtlcHQgYXMgaXMuCgotLSAKQ2hlZXJzCgpEYXZp
ZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
