Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34BBC5AC67
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhILvHy9gPfgC0PycClH9K9pwarfjdU0e6jNhYTq7bs=; b=foAZm6Pjx9GXkk
	X+bxDt/QQcXJuoPUe+94ue4CuqnJa36R6oos0CsZM2TWGhOHnMvQuf2D2Xv9Sb7VoLtbhvcheg7iG
	na9zbFRi+8M9DnZLQjduwjvhoXZ8zraipi30XMwfxxBOg30favA2AvDaWPYnWH4xvF2LALyP7liU7
	s2gmfn3o6dCrV0yPLQLmDF5YATxndtdXXnzhgOxpFZ0dRRG68QecjP90jKlHR0MtRnjPi+HWz00R1
	kueXIUXDVnHEcRXv9tfPWs6xyTkL7ptG0tkXldxDNmkU+0PNrx8ntU9Fdvr40pF14vurDEUe2Wubc
	nVAdkknsGx56a6f3AjyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmTi-0000000E6Gj-2LFh;
	Tue, 11 Aug 2026 13:25:14 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmTg-0000000E6FU-0u8C
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 13:25:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso23128665e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 06:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786454710; x=1787059510; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HfUDfNxB65XZqovwWVBLkrKpJgUq3OtZ1XoJNMhjK1c=;
        b=oJJAnnmLZMQ507yOE0ImuVqszgF5WTxQe15p4aEYI53j7POiFtXRXbvpcHGJBst1fU
         LXWMX6rL0DoMlKmCMrLVdfMdNbWtiEWFvgrLnh9BGplZPS8bjSAcqwtSe3KPqC5mVryk
         Nf/kXgIsbTiNngXUdQ9ZdaCULW85mkGnl/01gK9F+QjErruqv5YhSoN2ISwH/P289Rms
         Bv4cbww+PYleALRQhGPtviYefZXo53w6zLdIRnFakxNf7F/F2gPYCN12LS1jwX6X6vXw
         C/uioKtdl9xHHq5jTQ55PsgpISs+ayFiZUtyQmOYFSBFug9ZV8By6ovX0Aj/hcQ7LYnD
         +wVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786454710; x=1787059510;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HfUDfNxB65XZqovwWVBLkrKpJgUq3OtZ1XoJNMhjK1c=;
        b=AJpYJjf2WfJXyph5E1efxTprLgB9tdXqIJL8rlVmPtXhVvsf2qqvrdKGBlw4R/My35
         hb2w+sGAlbEDX+eXADCI1mh/ZIDBhv+b7yuSw24Sd8XqqUqMqsFHVd7Nlc1XGj+04HlW
         wxlUw5vQru5Hg+M4WtP1VD8hAXM8fA67F8BoquKVmF5ZZWfsuK+PQ8ec+0kKJP1UeOnd
         3XDQwVdGq+liDW3Xp0tbQoUw1+Q1o9zBJKHHxpKmU+ph/fONtnabe24RdvX/cUNacsfp
         WjHmwPJubjz38iKf5oInBdLZ7gGpVOL+LqkRoD0XCPw/YQD0bXrt7az+BifSW3LxjMnO
         sRlA==
X-Forwarded-Encrypted: i=1; AHgh+RpnoJ/+iTth/bzNGzM+lFQiYTKJz2Ej+k5QcroRImrbNCUztRLpeBmw7c25w5X6Dm2/EH1zqRUESE8khA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwO3epCS/WnDx+0sT05Fp3QqubbrhF0YOLwv7SLUD8W+dXGSyX+
	ozpdWcgK92oyeDWI8cqU9nGaSArWURqBnIiIvx8Z/ta5O63uaDGTYCDc
X-Gm-Gg: AR+sD129dmHHEns0RNOOIPwRjHLfArxQdBbodZ2ZwshrERFIov3Y1yo/SEApt9wJlxo
	fVjJbRJ7G0CG0ChWEdQCS1JlFnUOzGN2GdcDTLEqVyx/l7Cc4E8yiowP+VvPIAzs4aYu7t4tgWb
	1pRCfFfWhTTd+aR9gNu+CqTrIqdmqejsEWZYKSRUqEusz09Ro9cjXAcroORfg/IHlarOCpXkw/E
	6YvjDnJAZ9yEQGJktTHpeYoTIN++CRmVctDmP2+93vcmacQTmxpnlPC5GnLjJd1aEHSIhRrO/uD
	QfH2YoQKmxTSuGe+jjNziyqbUKMzOtmhiSGuvfdtqGKzx6UfpxP5tR2OY3MDK1Ml4vqCrGz19dh
	StPjLm+omed7Y4975KsJ+IyclE+4eERaVydudtfJ5G2cPCMMer3QgZnnfJmNfMlKq0IwyU3HCgs
	jN/weLKsZQ8bVgV1wA/mnx6k/0LGqF5V0CxSvgvKoH2uVUGg9NJtVuKnb+mRB6o1S0UjPFu4bFP
	DmpFs80wrqaY9ttRbuLURIrI3DWiw6utj2l
X-Received: by 2002:a05:600c:4513:b0:495:3e08:ad19 with SMTP id 5b1f17b1804b1-49978468c2bmr48261215e9.9.1786454709883;
        Tue, 11 Aug 2026 06:25:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977df9489sm83541285e9.1.2026.08.11.06.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:25:09 -0700 (PDT)
Date: Tue, 11 Aug 2026 14:25:07 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil
 Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Pasha
 Tatashin <pasha.tatashin@soleen.com>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org,
 Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
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
Message-ID: <20260811142507.4c6c760f@pumpkin>
In-Reply-To: <01f07ea2-8bdd-4450-8a49-548f8b646cfd@kernel.org>
References: <20260714-remove_pgtable_cdtor-v1-0-44be8a7685d7@arm.com>
	<20260714-remove_pgtable_cdtor-v1-3-44be8a7685d7@arm.com>
	<01f07ea2-8bdd-4450-8a49-548f8b646cfd@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_062512_283325_B60540E6 
X-CRM114-Status: GOOD (  20.31  )
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

T24gTW9uLCAzIEF1ZyAyMDI2IDE1OjU5OjM1ICswMjAwCiJDaHJpc3RvcGhlIExlcm95IChDUyBH
Uk9VUCkiIDxjaGxlcm95QGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBMZSAxNC8wNy8yMDI2IMOgIDE2
OjAzLCBLZXZpbiBCcm9kc2t5IGEgw6ljcml0wqA6Cj4gPiBtbSBjb2RlIG9mdGVuIG5lZWRzIHRv
IGtub3cgd2hldGhlciBzb21lIG1tIHJlcHJlc2VudHMgYSBrZXJuZWwgb3IKPiA+IHVzZXIgYWRk
cmVzcyBzcGFjZS4gVGhpcyBpcyBjdXJyZW50bHkgZG9uZSBieSBjb21wYXJpbmcgdGhlIG1tCj4g
PiBwb2ludGVyIHdpdGggJmluaXRfbW07IGJlc2lkZXMgbm90IGJlaW5nIHBhcnRpY3VsYXJseSBl
bGVnYW50LCB0aGlzCj4gPiBpZ25vcmVzIHRoZSBmYWN0IHRoYXQgb3RoZXIgbW0ncyAoZS5nLiBl
ZmlfbW0pIG1heSBhbHNvIHJlcHJlc2VudAo+ID4gcGFydHMgb2YgdGhlIGtlcm5lbCBhZGRyZXNz
IHNwYWNlLgo+ID4gCj4gPiBJbnRyb2R1Y2UgYSBuZXcgbW0gZmxhZyBNTUZfS0VSTkVMIGFuZCBz
ZXQgaXQgZm9yIGluaXRfbW0uCj4gPiBTdWJzZXF1ZW50IHBhdGNoZXMgd2lsbCB1c2UgdGhpcyBm
bGFnIHRvIHJlcGxhY2UgY29tcGFyaXNvbnMgd2l0aAo+ID4gJmluaXRfbW0uIE5vIGZ1bmN0aW9u
YWwgY2hhbmdlIGlzIGludHJvZHVjZWQgZm9yIG5vdy4gIAo+IAo+IERpZCB5b3UgY29uc2lkZXIg
cGVyZm9ybWFuY2UgaW1wYWN0ID8gVGhpcyB0ZXN0IGlzIHVzdWFsbHkgZG9uZSBpbiBxdWl0ZSAK
PiBjcml0aWNhbCBtZW1vcnkgaGFuZGxpbmcgZnVuY3Rpb25zLgo+IAo+IGluaXRfbW0gaXMga25v
d24gYXQgbGluayB0aW1lLiBCZWZvcmUgeW91ciBwYXRjaCAwOC8yMiB0aGVyZSBpcyBqdXN0IGEg
Cj4gY29tcGFyaXNvbiBvZiBtbSAocjMpIHdpdGggYSBjb25zdGFudCAobG9hZGVkIGluIHIxMCk6
Cj4gCj4gYzAwMTQwNDggPGFzc2VydF9wdGVfbG9ja2VkPjoKPiBjMDAxNDA0ODoJM2QgNDAgYzEg
MDkgCWxpcyAgICAgcjEwLC0xNjExOQo+IGMwMDE0MDRjOgkzOSA0YSAwMyA5OCAJYWRkaSAgICBy
MTAscjEwLDkyMAo+IGMwMDE0MDUwOgk3YyAwMyA1MCAwMCAJY21wdyAgICByMyxyMTAKPiBjMDAx
NDA1NDoJNGQgODIgMDAgMjAgCWJlcWxyCj4gLi4uCj4gCj4gQWZ0ZXIgcGF0Y2ggMDgvMjIgd2Ug
aGF2ZSwgaXQgZmlyc3QgY2hlY2tzIHRoYXQgbW0gaXMgbm90IDAsIHRoZW4gaXQgCj4gbG9hZHMg
dGhlIHdvcmQgbG9jYXRlZCBhdCBtbSs1MjggdGhlbiBBTkQgaXQgd2l0aCAweDEuIFRoaXMgbG9h
ZCBtaWdodCAKPiBiZSBjb3N0bHkuCj4gCj4gYzAwMTQwNDggPGFzc2VydF9wdGVfbG9ja2VkPjoK
PiBjMDAxNDA0ODoJMmMgMDMgMDAgMDAgCWNtcHdpICAgcjMsMAo+IGMwMDE0MDRjOgk3YyA4NSAy
MyA3OCAJbXIgICAgICByNSxyNAo+IGMwMDE0MDUwOgk0MSA4MiAwMCAxMCAJYmVxICAgICBjMDAx
NDA2MCA8YXNzZXJ0X3B0ZV9sb2NrZWQrMHgxOD4KPiBjMDAxNDA1NDoJODEgMjMgMDIgMTAgCWx3
eiAgICAgcjksNTI4KHIzKQo+IGMwMDE0MDU4Ogk3MSAyOSAwMCAwMSAJYW5kaS4gICByOSxyOSwx
Cj4gYzAwMTQwNWM6CTRjIDgyIDAwIDIwIAlibmVscgo+IC4uLgoKVGhvdWdodC4uLgpDb3VsZCB0
aGUgY2hlY2sgYmUgcmVwbGFjZWQgYnkgb25lIHRoYXQgY2hlY2tzIGZvciBrZXJuZWwgc3RhdGlj
IGRhdGE/ClRoYXQgd291bGQgcmVxdWlyZSB0aGF0IG90aGVyIG1tIHRoYXQgcmVwcmVzZW50IHBh
cnQgb2YgdGhlIGtlcm5lbAphZGRyZXNzIHNwYWNlIGJlIHN0YXRpYyAoYW5kIHByb2JhYmx5IG5v
dCBpbiBtb2R1bGVzKS4KSVNUUiB0aGVyZSBpcyBhbiBhZGRyZXNzIHJhbmdlIGNoZWNrIHRoYXQg
Y2FuIGJlIHVzZWQgLSBhbmQgbWlnaHQgYmUKY2hlYXBlciB0aGFuIHRoZSBleHBsaWNpdCB0ZXN0
IGZvciBpbml0X21tIG9uIG1hbnkgNjRiaXQgYXJjaHMuCgoJRGF2aWQKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
