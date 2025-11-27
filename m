Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830FDD111A8
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 19:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rB8EWr971ZNFtzbJnPzXXrNOoCrcq4PrDzjw1uNxwY0=; b=NbCS5bizfkg9T+
	P+bqZ0tTd4YJ61aL2Xk4xkLyaekJCTvepP3QZYhw6ENa2mI0i4dRMu47s9TMfwWLgWCVeN71dzfZ8
	ISBV7IqZGp6nwkDuNhoJyW/yC0r/al1fmKvlgHETwAec2Y6KLtQeS1Zt94kbuKZ/zTzD/c80H85xh
	JgdH44v+OngR4U3VomfVsg7nGrpOUyqKJF5o9VMv3GmLESGaInFYwDOjhZmXcAmh7OfJCREK1DVdJ
	Fk/TqE8rcz4xd2drHT5lxAuQAZeH9/s6pXJa1f+QK1ttL0N4IyAoewhsJgFgk7FTfDB7TxXXe62XJ
	J9/9teEBOe02lFX0Dk2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhul-0000000HA3O-2e9S;
	Thu, 27 Nov 2025 19:44:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhuk-0000000HA3D-3N2m
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 19:44:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E304E60172;
	Thu, 27 Nov 2025 19:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF0FC4CEF8;
	Thu, 27 Nov 2025 19:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764272665;
	bh=2FTP2tPXd1GWQFRneLLYDqFrpGOgQxqB103gyOVSA4k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DHhD/aQhOyARXtDI0hb53vOA6x8+UUybsf+r7ell6SNfujszItV4w+dfeFIi0VVvp
	 SfUh8H3uoek+9MTu+QV4uvODoSpGySXi0o6d5frjsPAj15Of1utMh7nsvJb974rQD6
	 F4niZwOZzwHFDuJtR/LiKuHlg7eHU7BRGLvv18H42Kw9FviKkVKPvJALmGQ/V+VhNO
	 Gdb9h5b6Acg/uJQzdygl3tGNU7KMzqs4YfOU3R9/nzYTx1T8Fo7IgVylHkbTf2yBLR
	 qH2rfGWT4eDqkPvd+NlC1Xr49i1FAUs47DzrgHd5fldJ4zKIhqGNc++3zPYYD4TB9K
	 fox1xbw6MnYrQ==
Message-ID: <f27429f3-9dd8-4006-b2d8-702436ade805@kernel.org>
Date: Thu, 27 Nov 2025 20:44:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/22] mm: Always use page table accessor functions
To: Ryan Roberts <ryan.roberts@arm.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Wei Yang <richard.weiyang@gmail.com>,
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
References: <bc88d132-452a-42a1-9ee5-5407334d8aac@kernel.org>
 <df7d10ba-bb42-4ea1-8c5b-5db88a18eccb@kernel.org>
 <6bdf2b89-7768-4b90-b5e7-ff174196ea7b@lucifer.local>
 <71123d7a-641b-41df-b959-88e6c2a3a441@kernel.org>
 <c0818f5b-b8a1-4730-aa1d-df0f547a3d47@arm.com>
 <20251126134726.yrya5xxayfcde3kl@master>
 <ee5f5da3-8c6b-4381-aee8-b0fab56cbf83@arm.com>
 <6b966403-91e0-4f06-86a9-a4f7780b9557@kernel.org>
 <ab39d448-aa1c-4c93-8e2b-5d97a9c76af5@lucifer.local>
 <1ca9f99f-6266-47ca-8c94-1a9b9aaa717f@kernel.org>
 <37973e21-e8f4-4603-b93d-4e0b1b2499fa@lucifer.local>
 <a1d25bde-3ab6-46b5-a957-db80da7e737b@kernel.org>
 <4505a93b-2bac-4ce1-8971-4c31f1ce1362@arm.com>
 <150ffcb7-2df2-4f3a-a12e-9807f13c6ab9@arm.com>
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Language: fr-FR
In-Reply-To: <150ffcb7-2df2-4f3a-a12e-9807f13c6ab9@arm.com>
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

CgpMZSAyNi8xMS8yMDI1IMOgIDE3OjM0LCBSeWFuIFJvYmVydHMgYSDDqWNyaXTCoDoKPiBPbiAy
Ni8xMS8yMDI1IDE2OjA3LCBSeWFuIFJvYmVydHMgd3JvdGU6Cj4+IE9uIDI2LzExLzIwMjUgMTU6
MTIsIERhdmlkIEhpbGRlbmJyYW5kIChSZWQgSGF0KSB3cm90ZToKPj4+IE9uIDExLzI2LzI1IDE2
OjA4LCBMb3JlbnpvIFN0b2FrZXMgd3JvdGU6Cj4+Pj4gT24gV2VkLCBOb3YgMjYsIDIwMjUgYXQg
MDM6NTY6MTNQTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJhbmQgKFJlZCBIYXQpIHdyb3RlOgo+Pj4+
PiBPbiAxMS8yNi8yNSAxNTo1MiwgTG9yZW56byBTdG9ha2VzIHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+
IFdvdWxkIHRoZSBwbWRwX2dldCgpIG5ldmVyIGdldCBpbnZva2VkIHRoZW4/IE9yIG90aGVyd2lz
ZSB3b3VsZG4ndCB0aGF0IGVuZCB1cAo+Pj4+Pj4gcmVxdWlyaW5nIGEgUkVBRF9PTkNFKCkgZnVy
dGhlciB1cCB0aGUgc3RhY2s/Cj4+Pj4+Cj4+Pj4+IFNlZSBteSBvdGhlciByZXBseSwgSSB0aGlu
ayB0aGUgcG1kcF9nZXQoKSBpcyByZXF1aXJlZCBiZWNhdXNlIGFsbCBwdWRfKgo+Pj4+PiBmdW5j
dGlvbnMgYXJlIGp1c3Qgc2ltcGxlIHN0dWJzLgo+Pj4+Cj4+Pj4gT0ssIHRob3VnaHQgeW91IHdl
cmUgc2F5aW5nIHdlIHNob3VsZCBwdXNoIGZ1cnRoZXIgZG93biB0aGUgc3RhY2s/IE9yIHVwCj4+
Pj4gZGVwZW5kaW5nIG9uIGhvdyB5b3UgdmlldyB0aGVzZSB0aGluZ3MgOlAgYXMgaW4gUkVBRF9P
TkNFIGF0IGxlYWY/Cj4+Pgo+Pj4gSSB0aGluayBhdCBsZWFmIGJlY2F1c2UgSSB0aGluayB0aGUg
cHJldmlvdXMgb25lcyBzaG91bGQgZXNzZW50aWFsbHkgYmUgb25seQo+Pj4gdXNlZCBieSBzdHVi
cy4KPj4+Cj4+PiBCdXQgSSBoYXZlbid0IGZ1bGx5IGRpZ2VzdGVkIGhvdyB0aGlzIGlzIGFsbCB3
b3JraW5nLiBPciBzdXBwb3NlZCB0byB3b3JrLgo+Pj4KPj4+IEknbSB0cnlpbmcgdG8gY2hldyB0
aHJvdWdoIHRoZSBhcmNoL2FybS9pbmNsdWRlL2FzbS9wZ3RhYmxlLTJsZXZlbC5oIGV4YW1wbGUg
dG8KPj4+IHNlZSBpZiBJIGNhbiBtYWtlIHNlbnNlIG9mIGl0LAo+Pgo+PiBJIHdvbmRlciBpZiB3
ZSBjYW4gdGhpbmsgYWJvdXQgdGhpcyBzbGlnaHRseSBkaWZmZXJlbnRseTsKPj4KPj4gUkVBRF9P
TkNFKCkgaGFzIHR3byBpbXBvcnRhbnQgcHJvcGVydGllczoKPj4KPj4gICAtIEl0IGd1YXJyYW50
ZWVzIHRoYXQgYSBsb2FkIHdpbGwgYmUgaXNzdWVkLCAqZXZlbiBpZiBvdXRwdXQgaXMgdW51c2Vk
Kgo+PiAgIC0gSXQgZ3VhcnJhbnRlZXMgdGhhdCB0aGUgcmVhZCB3aWxsIGJlIHNpbmdsZS1jb3B5
LWF0b21pYyAobm8gdGVhcmluZykKPj4KPj4gSSB0aGluayBmb3IgdGhlIGV4aXN0aW5nIHBsYWNl
cyB3aGVyZSBSRUFEX09OQ0UoKSBpcyB1c2VkIGZvciBwYWdldGFibGUgcmVhZHMgd2UKPj4gb25s
eSBjYXJlIGFib3V0Ogo+Pgo+PiAgIC0gSXQgZ3VhcnJhbnRlZXMgdGhhdCBhIGxvYWQgd2lsbCBi
ZSBpc3N1ZWQsICppZiBvdXRwdXQgaXMgdXNlZCoKPj4gICAtIEl0IGd1YXJyYW50ZWVzIHRoYXQg
dGhlIHJlYWQgd2lsbCBiZSBzaW5nbGUtY29weS1hdG9taWMgKG5vIHRlYXJpbmcpCj4+Cj4+IEkg
dGhpbmsgaWYgd2UgY2FuIHdlYWtlbiB0byB0aGUgImlmIG91dHB1dCBpcyB1c2VkIiBwcm9wZXJ0
eSwgdGhlbiB0aGUgY29tcGlsZXIKPj4gd2lsbCBvcHRpbWl6ZSBvdXQgYWxsIHRoZSB1bm5lY2Nl
c3NhcnkgcmVhZHMuCj4+Cj4+IEFJVUksIGEgQyBkZXJlZmVyZW5jZSBwcm92aWRlcyBuZWl0aGVy
IG9mIHRoZSBndWFycmFudGVlcyBzbyB0aGF0J3Mgbm8gZ29vZC4KPj4KPj4gV2hhdCBhYm91dCBu
b24tdm9sYXRpbGUgYXNtPyBJJ20gdG9sZCAodGhvdWdodCBuZWVkIHRvIHZlcmlmeSkgdGhhdCBm
b3IKPj4gbm9uLXZvbGF0aWxlIGFzbSwgdGhlIGNvbXBpbGVyIHdpbGwgZW1pdCBpdCBpZiB0aGUg
b3V0cHV0IGlzIHVzZWQgYW5kIHJlbW92ZSBpdAo+PiBvdGhlcndpc2UuIFNvIGlmIHRoZSBhc20g
Y29udGFpbnMgdGhlIHJlcXVpcmVkIHNpbmdsZS1jb3B5LWF0b21pYywgcGVyaGFwcyB3ZQo+PiBh
cmUgaW4gYnVzaW5lc3M/Cj4+Cj4+IFNvIHdlIHdvdWxkIG5lZWQgYSBuZXcgUkVBRF9TQ0EoKSBt
YWNybyB0aGF0IGNvdWxkIGRlZmF1bHQgdG8gUkVBRF9PTkNFKCkgKHdoaWNoCj4+IGlzIHN0cm9u
Z2VyKSBhbmQgYXJjaGVzIGNvdWxkIG9wdCBpbiB0byBwcm92aWRpbmcgYSB3ZWFrZXIgYXNtIHZl
cnNpb24uIFRoZW4gdGhlCj4+IGRlZmF1bHQgcFhkcF9nZXQoKSBjb3VsZCBiZSBSRUFEX1NDQSgp
LiBBbmQgdGhpcyBzaG91bGQgd29yayBmb3IgYWxsIGNhc2VzLgo+Pgo+PiBJIHRoaW5rLgo+IAo+
IEknbSBub3Qgc3VyZSB0aGlzIHdvcmtzLiBJdCBsb29rcyBsaWtlIHRoZSBjb21waWxlciBpcyBm
cmVlIHRvIG1vdmUgbm9uLXZvbGF0aWxlCj4gYXNtIHNlY3Rpb25zIHdoaWNoIG1pZ2h0IGJlIHBy
b2JsZW1hdGljIGZvciBwbGFjZXMgd2hlcmUgd2UgYXJlIGN1cnJlbnRseSB1c2luZwo+IFJFQURf
T05DRSgpIGluIGxvY2tsZXNzIGFsZ29yaXRobXMsIChlLmcuIEdVUD8pLiBXZSB3b3VsZG4ndCB3
YW50IHRvIGVuZCB1cCB3aXRoCj4gYSBzdGFsZSB2YWx1ZS4KCldoYXQgYWJvdXQgYWRkaW5nIGEg
bWVtb3J5IGNsb2JiZXIgdG8gdGhlIG5vbi12b2xhdGlsZSBhc20gPyBDb21waWxlciAKc2hvdWxk
bid0IG1vdmUgdGhlIGFzbSBzZWN0aW9uIGluIHRoYXQgY2FzZS4KCkNocmlzdG9waGUKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
