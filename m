Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A8DC5CFDB
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 11:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uUgkobM2LS4f6fA+Ngg20d8XqLUcCxm6tukte/yw+eo=; b=RR+zAoSy6Cjcwi
	RSkhlmTo6OMSNP8YaGOizpTwDNrnAUnBfCELM50fJci6txnyOXazHN331i/kgjQIvD9rtexCHJYlL
	WcQkYRU1hbgsnT94SkZ9Wh9Ja4T3v+DJL3+NKYZ4f/3R0JX4cbB/m9GPICA1OVSOW34DTuuA+KXec
	wCjZZqLkjVvHMV0Gl6Ly0ouBJQ/Q0Rz+8ssCq/lu7R2RjRlWK8Zzx+2Z5c+GY2rywsffZh5H4tZ+F
	YogDHGml0YIDWRO/kc0S3lMwE3y4KskKzjcZinDjcwMV5yncSPrFpLktsZmoGj78oag9ov1ae7TTx
	ZjXElrUYBsN4Lfd4kZ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtkWL-0000000Dv8s-3FUN;
	Tue, 11 Aug 2026 11:19:49 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtkWI-0000000Dv6Q-2Kk0
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 11:19:48 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso1621680f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 04:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786447185; x=1787051985; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WpHpX3dMx1OmUziffO2NidzvFmW3rlX7MNbm6J/WhK0=;
        b=fUXKGApFcWgdI8I1EPP0gY+24s1nXgYPScThdfmH4kS2fxLmWTHqAbOqleJYSaK6Dq
         ld29z4aIkmHEo7BhMuR6qz3LTD9sPUCv0D3brqh5Y3x8lZIf4Rtcu0bIHPEET6Pde5sF
         0v3JX3+V+rLYQ2HhRi3tmMcdij5M78Rzg+AA6deqZ0nmUuIyahvjfsHUch2Y/s1mXgZ4
         DhoZcJCnEHAkmfhPVTwTmVRLV8J/OqTsNaz5EowABY6Vo76IIEIxS8vKQD3ljIWx+QrS
         F7hwxGRbGWQ4t6JHiTLKf3c0BYBZ3GbrDQ1FoMGXomNSuOVT5zHsa6+VQVAHx9gPn6KO
         jb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786447185; x=1787051985;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpHpX3dMx1OmUziffO2NidzvFmW3rlX7MNbm6J/WhK0=;
        b=Eb79KxJUtHMt76OIFcxfv/jsRTCZ5ZxcpfnXpr53wOrpitl/I72WbSEartZ7F3IUFd
         uVpkTvvjF8fMEtCIzM3h4fjp3MD2LTNieCapX3hxy9Bi7JuZzRqPmMmKUs7LY53xvQC+
         F2NqOy2+zzqL9O9gJpOiE3Fb7AnH2DtwFTN/FirH1vgl4v8RQ/Vu4u29aMEidKfkAdWb
         49daQOc+JinN6rVO5/Z7ZRk1dcatVUnpmpdMUTTe4n7MIGAo+Cp2T/4x1pHO6UVD5dLT
         U31f8QTQwpcokX/4QtQLIMzMafeZOZGBaEQnbv53FzbaIpSBHzLQzo4Mfmcp8vpkK28n
         e3uQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr03/UFAtUK67pDXPvO3iait5fs5My42gjnQWBt4VyPlmPtAFYa7SHz8JSge3YYl6VUiicj8ff92maztg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTKEa5DILL9PMnIRdKoGTKVmSr/EqYfb+RPGAFW/Hw201uUtgj
	H42Z361Nwo1fqpoPVxERJxXFp4WXSgxI0jg4Pjy2nXAQvStQANOxD9h4
X-Gm-Gg: AR+sD13KIm1+CRaS5Nm0KVJ1xbouqJ9HVihPvOewfsNw2S24OQxPFJw1pMw3QvtS8B5
	FyWNK+FB1TEr0nLI6dRPdm9WDmQ/khparQltPo+o3TQ3DK7JVNecTjx7r9n7lSilT167O7kv892
	dI8TgNAOIL8WmcqkhCQaNVqnNBNKUsDcHd33lrEsaTe40+4Rmshnt062CvP3DQXlCYVtwMNpQSj
	o+BzH3GQlsBTqiSIWcpMYQoLt98HSMbi9Nl4RsZVSUcMc0TfZ2FB9DKvk6J6sjNIYWTUWCd+G8W
	66KQedMaIkAoMbWBPLmGanHrXus1nAtuRu3Umgsn8VyjrTHwVSn6oAS3hMg8Td642QC4KoDuVcH
	gjccfgFbkkeLdwfQr1JOS2il83StX+bXrQrJGkkLlnDlDHzdZpQR/x04BEa4p+JCWO9TMaNfgjz
	aiuR/1KAu6Bx6mdydlLsfU8Kc1qx3EHJUVnOz3fh304uCj0FyW7dxChU3Nc7HOZTYKhBz+jgLa+
	bvTFkHmNiYkLWMrXu7IWlPdeQ==
X-Received: by 2002:a5d:5e8f:0:b0:47f:6f6a:6a7f with SMTP id ffacd0b85a97d-4814ad890fbmr4370323f8f.8.1786447184497;
        Tue, 11 Aug 2026 04:19:44 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a5ac75dsm3318120f8f.7.2026.08.11.04.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 04:19:44 -0700 (PDT)
Date: Tue, 11 Aug 2026 12:19:41 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, "Christophe Leroy (CS
 GROUP)" <chleroy@kernel.org>, linux-mm@kvack.org, Andrew Morton
 <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal
 Hocko <mhocko@suse.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 Russell King <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org, Huacai Chen
 <chenhuacai@kernel.org>, loongarch@lists.linux.dev, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 linux-s390@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, sparclinux@vger.kernel.org, Richard
 Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, linux-um@lists.infradead.org, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Ning Sun <ning.sun@intel.com>, x86@kernel.org,
 tboot-devel@lists.sourceforge.net, Ard Biesheuvel <ardb@kernel.org>, Ilias
 Apalodimas <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org, Vishal
 Moola <vishal.moola@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 03/22] mm: introduce MMF_KERNEL flag and set it for
 init_mm
Message-ID: <20260811121941.4ca20b88@pumpkin>
In-Reply-To: <643a624d-0106-44ed-a7f5-aaf9316f94fd@arm.com>
References: <20260714-remove_pgtable_cdtor-v1-0-44be8a7685d7@arm.com>
	<20260714-remove_pgtable_cdtor-v1-3-44be8a7685d7@arm.com>
	<01f07ea2-8bdd-4450-8a49-548f8b646cfd@kernel.org>
	<33fc9d31-2866-4315-9510-0004deb93994@kernel.org>
	<20260811091016.5ca67143@pumpkin>
	<643a624d-0106-44ed-a7f5-aaf9316f94fd@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_041946_674548_405FFDA2 
X-CRM114-Status: GOOD (  27.89  )
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

T24gVHVlLCAxMSBBdWcgMjAyNiAxMTowMDowOSArMDIwMApLZXZpbiBCcm9kc2t5IDxrZXZpbi5i
cm9kc2t5QGFybS5jb20+IHdyb3RlOgoKPiBPbiAxMS8wOC8yMDI2IDEwOjEwLCBEYXZpZCBMYWln
aHQgd3JvdGU6Cj4gPiBPbiBXZWQsIDUgQXVnIDIwMjYgMTQ6MDc6MDEgKzAyMDAKPiA+ICJEYXZp
ZCBIaWxkZW5icmFuZCAoQXJtKSIgPGRhdmlkQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gIAo+ID4+
IE9uIDgvMy8yNiAxNTo1OSwgQ2hyaXN0b3BoZSBMZXJveSAoQ1MgR1JPVVApIHdyb3RlOiAgCj4g
Pj4+Cj4gPj4+IExlIDE0LzA3LzIwMjYgw6AgMTY6MDMsIEtldmluIEJyb2Rza3kgYSDDqWNyaXTC
oDogICAgCj4gPj4+PiBtbSBjb2RlIG9mdGVuIG5lZWRzIHRvIGtub3cgd2hldGhlciBzb21lIG1t
IHJlcHJlc2VudHMgYSBrZXJuZWwgb3IKPiA+Pj4+IHVzZXIgYWRkcmVzcyBzcGFjZS4gVGhpcyBp
cyBjdXJyZW50bHkgZG9uZSBieSBjb21wYXJpbmcgdGhlIG1tCj4gPj4+PiBwb2ludGVyIHdpdGgg
JmluaXRfbW07IGJlc2lkZXMgbm90IGJlaW5nIHBhcnRpY3VsYXJseSBlbGVnYW50LCB0aGlzCj4g
Pj4+PiBpZ25vcmVzIHRoZSBmYWN0IHRoYXQgb3RoZXIgbW0ncyAoZS5nLiBlZmlfbW0pIG1heSBh
bHNvIHJlcHJlc2VudAo+ID4+Pj4gcGFydHMgb2YgdGhlIGtlcm5lbCBhZGRyZXNzIHNwYWNlLgo+
ID4+Pj4KPiA+Pj4+IEludHJvZHVjZSBhIG5ldyBtbSBmbGFnIE1NRl9LRVJORUwgYW5kIHNldCBp
dCBmb3IgaW5pdF9tbS4KPiA+Pj4+IFN1YnNlcXVlbnQgcGF0Y2hlcyB3aWxsIHVzZSB0aGlzIGZs
YWcgdG8gcmVwbGFjZSBjb21wYXJpc29ucyB3aXRoCj4gPj4+PiAmaW5pdF9tbS4gTm8gZnVuY3Rp
b25hbCBjaGFuZ2UgaXMgaW50cm9kdWNlZCBmb3Igbm93LiAgICAKPiA+Pj4gRGlkIHlvdSBjb25z
aWRlciBwZXJmb3JtYW5jZSBpbXBhY3QgPyBUaGlzIHRlc3QgaXMgdXN1YWxseSBkb25lIGluIHF1
aXRlCj4gPj4+IGNyaXRpY2FsIG1lbW9yeSBoYW5kbGluZyBmdW5jdGlvbnMuCj4gPj4+Cj4gPj4+
IGluaXRfbW0gaXMga25vd24gYXQgbGluayB0aW1lLiBCZWZvcmUgeW91ciBwYXRjaCAwOC8yMiB0
aGVyZSBpcyBqdXN0IGEKPiA+Pj4gY29tcGFyaXNvbiBvZiBtbSAocjMpIHdpdGggYSBjb25zdGFu
dCAobG9hZGVkIGluIHIxMCk6Cj4gPj4+Cj4gPj4+IGMwMDE0MDQ4IDxhc3NlcnRfcHRlX2xvY2tl
ZD46Cj4gPj4+IGMwMDE0MDQ4OsKgwqDCoCAzZCA0MCBjMSAwOcKgwqDCoMKgIGxpc8KgwqDCoMKg
IHIxMCwtMTYxMTkKPiA+Pj4gYzAwMTQwNGM6wqDCoMKgIDM5IDRhIDAzIDk4wqDCoMKgwqAgYWRk
acKgwqDCoCByMTAscjEwLDkyMAo+ID4+PiBjMDAxNDA1MDrCoMKgwqAgN2MgMDMgNTAgMDDCoMKg
wqDCoCBjbXB3wqDCoMKgIHIzLHIxMAo+ID4+PiBjMDAxNDA1NDrCoMKgwqAgNGQgODIgMDAgMjDC
oMKgwqDCoCBiZXFscgo+ID4+PiAuLi4KPiA+Pj4KPiA+Pj4gQWZ0ZXIgcGF0Y2ggMDgvMjIgd2Ug
aGF2ZSwgaXQgZmlyc3QgY2hlY2tzIHRoYXQgbW0gaXMgbm90IDAsIHRoZW4gaXQgbG9hZHMgdGhl
Cj4gPj4+IHdvcmQgbG9jYXRlZCBhdCBtbSs1MjggdGhlbiBBTkQgaXQgd2l0aCAweDEuIFRoaXMg
bG9hZCBtaWdodCBiZSBjb3N0bHkuCj4gPj4+Cj4gPj4+IGMwMDE0MDQ4IDxhc3NlcnRfcHRlX2xv
Y2tlZD46Cj4gPj4+IGMwMDE0MDQ4OsKgwqDCoCAyYyAwMyAwMCAwMMKgwqDCoMKgIGNtcHdpwqDC
oCByMywwCj4gPj4+IGMwMDE0MDRjOsKgwqDCoCA3YyA4NSAyMyA3OMKgwqDCoMKgIG1ywqDCoMKg
wqDCoCByNSxyNAo+ID4+PiBjMDAxNDA1MDrCoMKgwqAgNDEgODIgMDAgMTDCoMKgwqDCoCBiZXHC
oMKgwqDCoCBjMDAxNDA2MCA8YXNzZXJ0X3B0ZV9sb2NrZWQrMHgxOD4KPiA+Pj4gYzAwMTQwNTQ6
wqDCoMKgIDgxIDIzIDAyIDEwwqDCoMKgwqAgbHd6wqDCoMKgwqAgcjksNTI4KHIzKQo+ID4+PiBj
MDAxNDA1ODrCoMKgwqAgNzEgMjkgMDAgMDHCoMKgwqDCoCBhbmRpLsKgwqAgcjkscjksMQo+ID4+
PiBjMDAxNDA1YzrCoMKgwqAgNGMgODIgMDAgMjDCoMKgwqDCoCBibmVsciAgICAKPiA+PiBJcyB0
aGF0IGEgcmVhbCBwcm9ibGVtLCB0aG91Z2g/ICAKPiA+IFRoZSBjb3N0IG9mIHRoZSByZWFkIGlz
IGxpa2VseSB0byBtYXR0ZXIgbW9zdCBpZiB0aGUgYnJhbmNoIGdldHMgbWlzcHJlZGljdGVkLgo+
ID4gSSdkIGFsc28gZ3Vlc3MgdGhlIG1tIGlzbid0IHVzdWFsbHkgTlVMTCAtIHNvIHRoYXQgYnJh
bmNoIG5lZWRzIHRvIHN0YXRpY2FsbHkKPiA+IHByZWRpY3RlZCBjb3JyZWN0bHkgYXMgd2VsbC4K
PiA+IEknZCBhbHNvIG5vdCBhc3N1bWUgdGhhdCB0aGUgbW0gaXMgaW4gdGhlIGNhY2hlICh1bmxl
c3MgdGhlIHN1cnJvdW5kaW5nIGNvZGUKPiA+IGhhcyBhbHJlYWR5IGFjY2Vzc2VkIGl0KSwgdGhl
IEwxIGRhdGEgY2FjaGVzIGFyZSBzbWFsbC4gIAo+IAo+IFlvdSdyZSByaWdodCwgSSBkaWRuJ3Qg
dGhpbmsgYWJvdXQgdGhpcyB0aGUgcmlnaHQgd2F5IHJvdW5kIC0gaW4gZ2VuZXJhbAo+IGl0IG1h
eSBub3QgYmUgZWFzeSB0byBwcmVkaWN0IHRoYXQgbW0gcG9pbnRzIHRvIGluaXRfbW0sIGFuZCBh
bgo+IGFyYml0cmFyeSB1c2VyIG1tIGlzbid0IGd1YXJhbnRlZWQgdG8gYmUgY2FjaGVkLiBSZXBl
YXRlZCBjYWxscyB0bwo+IG1tX2lzX2tlcm5lbChtbSkgaW4gdGhlIHNhbWUgZnVuY3Rpb24gc2hv
dWxkbid0IGNvc3QgbXVjaCB0aG91Z2guCgpEZXBlbmRzLgpJZiBpdCBpcyByZWFsIGZ1bmN0aW9u
IGNhbGwgdGhlIGNvZGUgd2lsbCBiZSBpbiB0aGUgSS1jYWNoZSBhbmQgaXMgbGlrZWx5CnRvIGdl
dCBwcmVkaWN0ZWQgY29ycmVjdGx5IGJ5IHRoZSB0aGlyZCBjYWxsLgpPVE9IIGlmIGlubGluZWQg
eW91J3ZlIGFsbCB0aGUgSS1jYWNoZSBsb2FkcyBhbmQgdGhhdCBzdGF0aWMgYnJhbmNoCnByZWRp
Y3Rpb24gbWlnaHQgZ2V0IHRoZW0gYWxsIHdyb25nLgoKT2gsIGFuZCBzYXZpbmcgdGhlIHJlc3Vs
dCBpbiBhIGxvY2FsIG1pZ2h0IGNhdXNlIGEgcmVnaXN0ZXIgc3BpbGwuCgoJRGF2aWQKCj4gCj4g
V291bGQgc29tZSAobWljcm8pYmVuY2htYXJrIGJlIHBhcnRpY3VsYXJseSByZWxldmFudCB0byBt
ZWFzdXJlIHRoZQo+IG92ZXJoZWFkLCBpZiBhbnk/Cj4gCj4gLSBLZXZpbgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
