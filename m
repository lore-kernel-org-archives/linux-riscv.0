Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225C0C3601A
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 08:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aodPu78aeCXY3v7FxqZ/rKzbd7Di+2QTql19vvI8huY=; b=ybxHSEapLsWggL
	TEumnno75KTWyFdgLSLracLHU95tCW+NjJUyJq0PHQXlL4IIBjgv4n77KSsXQMrOnrE9qj/qStqJG
	108zMesceqcgxbV/BNkwRU26CetAD0Du+eETwO2b7Xn1xFp4Nxpkvw1KM1CHRz3Vb3XG5KmTDjvuV
	CcGSZmEVBMJh8N2Ck7H4weAPD3s/h4i4SMEK73BNUmTPmHarlP+PZZfhTMkd4RUPI360lP99Y6/LD
	UJD3L6wZgXOUF6edahfHSN6sZA+m2RNVxnDeRR9fq6fhveyLnsg++ovgNlK2ZJ53sNBf1obYTuT2L
	tOZb9q454j2cKnQ5kYcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1iHJ-0000000H64K-2mf8;
	Mon, 07 Apr 2025 08:56:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1i4S-0000000H3R8-1wJH
	for linux-riscv@bombadil.infradead.org;
	Mon, 07 Apr 2025 08:43:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bOlZydid21RU+uyMBcWhy/2nhySl1EJG9vjMGVT/sz4=; b=rcWTlSY8d6z1FCYrusYecUdWzW
	llrQYAIhKEfbnRwg6zEk7lNs2fZa4PBy4fqZa5bvs291y4tPU4DdKgyB4wr36o693jI+LqvvT/OSA
	SH7e8SyAsRCM0ETaUR/Lkj94ly68UWt9e1yy+RmK4utMNppnfdg4siboNKnP2o+SYkDpdeYxpY/l/
	3MvPO7hGwXqzUkTbHF+Bd1mzrNbm9651rEkS/dHcEruJg3VaufE0UVe1R39TiW9uYna2kw3J12tdG
	M9wJqnJaW8brKGtzzPqiQJZjFePeyPuTKEp8+TIgwchuwQzDigxIIaXVM/FWPrIvZeAyAfwoX65IJ
	oPe6IfZw==;
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1i4P-00000007tTR-0b4f
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 08:43:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0D7C44201;
	Mon,  7 Apr 2025 08:42:46 +0000 (UTC)
Message-ID: <e760a42c-1147-4fe8-9c65-6c4919f15fff@ghiti.fr>
Date: Mon, 7 Apr 2025 10:42:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scripts: Do not strip .rela.dyn section
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
References: <20250403134200.385077-1-alexghiti@rivosinc.com>
 <CAMj1kXGzrn6i20LvUBnz_mGi946=GCogNHHUL=mNsv513qYv7A@mail.gmail.com>
 <2874fc20-9135-4b13-b825-43fb350ce552@ghiti.fr>
 <CAK7LNAT5sDhh1v3U2xUuVnrbhNXp3SJ_ngxSqAgwmZL0E2QGpA@mail.gmail.com>
 <CAHVXubgZ+Dwx70vU03R9MZ7BjkzbdR21y-Ort6pBngFmFYs-uw@mail.gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAHVXubgZ+Dwx70vU03R9MZ7BjkzbdR21y-Ort6pBngFmFYs-uw@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleeljeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeeuffefvdelteelteejhfejhedujeetteevtddvvddthfeiteffledvffeggfeiieenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeeisgemvdefgeekmeduvgduheemvdgrgeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeeisgemvdefgeekmeduvgduheemvdgrgeehpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeeisgemvdefgeekmeduvgduheemvdgrgeehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopegrlhgvgihghhhithhisehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehmrghsrghhihhrohihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhgus
 geskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepsghjohhrnhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihgtohhlrghssehfjhgrshhlvgdrvghu
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_094305_316602_FF230EAB 
X-CRM114-Status: GOOD (  22.13  )
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

Ck9uIDA3LzA0LzIwMjUgMTA6MTUsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiBIaSBNYXNhaGly
bywKPgo+IE9uIEZyaSwgQXByIDQsIDIwMjUgYXQgNToyNeKAr1BNIE1hc2FoaXJvIFlhbWFkYSA8
bWFzYWhpcm95QGtlcm5lbC5vcmc+IHdyb3RlOgo+PiBPbiBGcmksIEFwciA0LCAyMDI1IGF0IDEy
OjQ14oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90ZToKPj4+IEhpIEFy
ZCwKPj4+Cj4+PiBPbiAwMy8wNC8yMDI1IDE3OjExLCBBcmQgQmllc2hldXZlbCB3cm90ZToKPj4+
PiBPbiBUaHUsIDMgQXByIDIwMjUgYXQgMTY6NDIsIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRp
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+Pj4+IHJpc2N2IHVzZXMgdGhlIC5yZWxhLmR5biBzZWN0
aW9uIHRvIHJlbG9jYXRlIHRoZSBrZXJuZWwgYXQgcnVudGltZSBidXQKPj4+Pj4gdGhhdCBzZWN0
aW9uIGlzIHN0cmlwcGVkIGZyb20gdm1saW51eC4gVGhhdCBwcmV2ZW50cyBrZXhlYyB0bwo+Pj4+
PiBzdWNjZXNzZnVsbHkgbG9hZCB2bWxpbnV4IHNpbmNlIGl0IGRvZXMgbm90IGNvbnRhaW4gdGhl
IHJlbG9jYXRpb25zIGluZm8KPj4+Pj4gbmVlZGVkLgo+Pj4+Pgo+Pj4+IE1heWJlIGV4cGxhaW4g
dGhhdCAucmVsYS5keW4gY29udGFpbnMgcnVudGltZSByZWxvY2F0aW9ucywgd2hpY2ggYXJlCj4+
Pj4gb25seSBlbWl0dGVkIGlmIHRoZXkgYXJlIGFjdHVhbGx5IG5lZWRlZCAtIGFzIG9wcG9zZWQg
dG8gdGhlIHN0YXRpYwo+Pj4+IHJlbG9jYXRpb25zIHRoYXQgYXJlIG5vdCBlbWl0dGVkIGFzIFNI
Rl9BTExPQyBzZWN0aW9ucywgYW5kIGFyZSBub3QKPj4+PiBjb25zaWRlcmVkIHRvIGJlIHBhcnQg
b2YgdGhlIHJ1bnRpbWUgaW1hZ2UgaW4gdGhlIGZpcnN0IHBsYWNlLgo+Pj4KPj4+IE9rIEknbGwg
ZG8uCj4+Pgo+Pj4KPj4+PiBJdAo+Pj4+IHdvdWxkIGJlIG5pY2UgaWYgd2UgY291bGQgdXNlIC0t
cmVtb3ZlLXJlbG9jYXRpb25zPSBoZXJlLCB3aGljaCBvbmx5Cj4+Pj4gcmVtb3ZlcyBzdGF0aWMg
cmVsb2NhdGlvbnMsIGJ1dCB1bmZvcnR1bmF0ZWx5LCBsbHZtLW9iamNvcHkgZG9lcyBub3QKPj4+
PiBzdXBwb3J0IHRoaXMuCj4+Pj4KPj4+PiBBbHNvLCBJIHdvbmRlciBpZiB0aGlzIHNob3VsZCBh
cHBseSB0byBhbGwgb2YgLnJlbC5keW4sIC5yZWxhLmR5biBhbmQKPj4+PiAucmVsci5keW4sIGFz
IHRoZXkgYWxsIGNhcnJ5IHJ1bnRpbWUgcmVsb2NhdGlvbnMuCj4+Pgo+Pj4gT2ssIEknbGwgYWRk
IHRoZW0gdG8gdGhlIG5leHQgdmVyc2lvbi4KPj4+Cj4+Pgo+Pj4+IEZpbmFsbHksIEknZCBiZSBj
dXJpb3VzIHRvIGtub3cgd2h5IFJJU0MtViByZWxpZXMgb24gLS1lbWl0LXJlbG9jcyBpbgo+Pj4+
IHRoZSBmaXJzdCBwbGFjZT8gSXMgdGhlIHJlbG9jcyBjaGVjayByZWFsbHkgbmVlZGVkPyBJZiBu
b3QsIGl0IHdvdWxkCj4+Pj4gYmUgYSBuaWNlIG9wcG9ydHVuaXR5IHRvIGdldCByaWQgb2YgTWFr
ZWZpbGUucG9zdGxpbmsgZW50aXJlbHkuCj4+Pgo+Pj4gU28gSSBoYWQgdG8gY2hlY2sgYW5kIGl0
IGhhcHBlbnMgdGhhdCB0aGlzIHdhcyBhbiBpc3N1ZSB3aXRoIHRoZQo+Pj4gdG9vbGNoYWluLCBJ
IHNob3VsZCBjaGVjayBpZiB0aGF0IHN0aWxsIGhhcHBlbnMgd2l0aCBuZXdlciBvbmVzLgo+Pj4K
Pj4+IGNvbW1pdCA1NTlkMWU0NWExNmRjZjE1NDJlNDMwZWEzZGNlOWFiNjI1YmU5OGQwCj4+PiBB
dXRob3I6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPj4+IERhdGU6
ICAgV2VkIE1hciAyOSAwNjo1MzoyOSAyMDIzICswMjAwCj4+Pgo+Pj4gICAgICAgcmlzY3Y6IFVz
ZSAtLWVtaXQtcmVsb2NzIGluIG9yZGVyIHRvIG1vdmUgLnJlbGEuZHluIGluIGluaXQKPj4KPj4K
Pj4KPj4gU28sCj4+Cj4+IEZpeGVzOiA1NTlkMWU0NWExNmQgKCJyaXNjdjogVXNlIC0tZW1pdC1y
ZWxvY3MgaW4gb3JkZXIgdG8gbW92ZQo+PiAucmVsYS5keW4gaW4gaW5pdCIpCj4+Cj4+IElzIHRo
aXMgdGhlIGNvcnJlY3QgdGFnPwo+IFRoaXMgaXMgdGhlIGluaXRpYWwgY3VscHJpdCB5ZXMsIGJ1
dCBpZiB3ZSB1c2UgdGhpcyB0YWcsIHRoZSBmaXggd29uJ3QKPiBhcHBseS4gU28gSSBkZWNpZGVk
IHRvIHBpY2sgQXJkJ3MgcGF0Y2ggc28gdGhhdCB0aGlzIGZpeCBjYW4gYmUgZWFzaWx5Cj4gYmFj
a3BvcnRlZCB0byA2LjE0LCBhbmQgSSdsbCBjb21lIHVwIHdpdGggYSBuZXcgdmVyc2lvbiBmb3Ig
cHJldmlvdXMKPiByZWxlYXNlcy4gSXMgdGhhdCBvayB3aXRoIHlvdT8KCgpBbmQgSSBoYXZlIGp1
c3QgbG9va2VkIGF0IDYuMTUtcmMxIGFuZCBub3RpY2VkIHRoYXQgdGhlIHJlbG9jYXRpb24gCnN0
cmlwcGluZyB3YXMgbW92ZWQgdG8gTWFrZWZpbGUudm1saW51eCwgc28gdGhpcyBmaXggd29uJ3Qg
YXBwbHkgdG8gNi4xNCAKbmVpdGhlci4KCkknbGwgdGhlbiB1c2UgdGhlIGluaXRpYWwgY3VscHJp
dCwgd2hpY2ggaXMgRml4ZXM6IDU1OWQxZTQ1YTE2ZCAoInJpc2N2OiAKVXNlIC0tZW1pdC1yZWxv
Y3MgaW4gb3JkZXIgdG8gbW92ZS5yZWxhLmR5biBpbiBpbml0IikuCgpTb3JyeSBmb3IgdGhlIG5v
aXNlLAoKQWxleAoKCj4KPiBUaGFua3MsCj4KPiBBbGV4Cj4KPj4KPj4KPj4KPj4KPj4gLS0KPj4g
QmVzdCBSZWdhcmRzCj4+IE1hc2FoaXJvIFlhbWFkYQo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
