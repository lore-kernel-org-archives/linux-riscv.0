Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A63DC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 23:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jg47aIAF+6Ncjxq6rK7y+ispWbiWzkp9bJoF+ElPiBU=; b=K8mNXlHNxpBPoR
	7uVUCC8eIxgdauTlTXGdPqhzTlgRTm/PaMNMYAAjIhIMdw6ZhaYb/A6azNRxHLOj1ewVjS63vRdsr
	pNidw6D+fWZCpQPxSQ9UwgOjxiiWpvSsrjS79lQMqh1l87eUyMgIFRfBeIITLLSB/sgHV+Vd8owub
	wErZ6VRvkAju0sJBNBTnFcPwK2ZKUZuGgqFFynjt8qg3PnYvMN4zHD/CapGL5TeAIGQhhAH1aQaQt
	kKXS14y7PCEeaho9GoiRejQQFbhv/+Vw+BZptZMY5tTKbIjhIAkJdXX/4U/TPoYDpPcdS1RfXEmao
	GX6YNAvBGIENnvD/9AbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxEmQ-00000000JbI-29RZ;
	Wed, 17 Apr 2024 23:33:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxEmL-00000000JYw-07jC;
	Wed, 17 Apr 2024 23:33:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 53991CE1068;
	Wed, 17 Apr 2024 23:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9072FC072AA;
	Wed, 17 Apr 2024 23:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713396802;
	bh=UVEJ59zmDjoboUO24xHkWUbtsfOaV4nMW96i+du0QWo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rjB6vmEuetONe18hKTsn5+HJjhJMpyiX9HOcxJfZjVMUBr4HS/b8Qk0b+NvQ1SPoy
	 6+U9ERhx0yAL/f6syVMyH0tvCiwAqehHRdXPWB291uyc1cWB1Lj6SX69GppWO+2Zt+
	 FVEhm3i2wE/Ef/XXI5ZIpEkHAgVYWXqZNQXNL+NmfX6Z+SeoXJZSkwotWq6QnU2VU1
	 mlsup2LG6VX8kIop/HOQwiR9Qpz5L8GpSSeIxq3M0f0Pzo+vgVVgLVSg0npsWRBkuf
	 eL40HYDNQxEkhjMIk/FzBlsJxrfsmyLxH/OVNZCSGMq/fL0AyGNTQBlwE9GQVY/UQJ
	 IQQItlG25afRA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56e1baf0380so303064a12.3;
        Wed, 17 Apr 2024 16:33:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXh9HJmXCDqSG+j08Yc9hN8xI0Kd37O364PmPaoCFpepn+Fm4Mal4oqrD8UtM52jJ17mmPLSdIEgn0Z3YWjeFUxPLNeQK3cfWgl4fr3oxcIPA9Pzd9RpMpsXi3OSnQXyXI8WTmofkYX0jHkIMUF0NVWNmDG758=
X-Gm-Message-State: AOJu0Yw9PRqPkqfpDJHdpG1ulir60ObUgUbZE38rXnVm8fGg/uy3gqhS
	yrwVjWY0vtm3BlZjDawdq2O1v+6goo+fgrQA1ObvfvXOvz93I76hH8TOLV2vMBZcY2CMzJ0SJj+
	hjrJtpfgLowBGYEVEUHxq/DHn1qk=
X-Google-Smtp-Source: AGHT+IEHuhOgcI3i5xgKWDt/RXWKyZ/pV78ei3ikSzZKT8X4nbojHe59GGn0FqOU5qFFQVvC8y10X+N0SPB8sxHbE0Q=
X-Received: by 2002:a05:6512:3184:b0:519:b95:22b5 with SMTP id
 i4-20020a056512318400b005190b9522b5mr446945lfe.51.1713396780753; Wed, 17 Apr
 2024 16:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240411160051.2093261-1-rppt@kernel.org> <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net> <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
 <Zh4nJp8rv1qRBs8m@kernel.org>
In-Reply-To: <Zh4nJp8rv1qRBs8m@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 17 Apr 2024 16:32:49 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
Message-ID: <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
To: Mike Rapoport <rppt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Bjorn Topel <bjorn@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Donald Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_163325_488939_E0F4A367 
X-CRM114-Status: GOOD (  35.90  )
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

T24gVHVlLCBBcHIgMTYsIDIwMjQgYXQgMTI6MjPigK9BTSBNaWtlIFJhcG9wb3J0IDxycHB0QGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBBcHIgMTUsIDIwMjQgYXQgMDY6MzY6MzlQTSAr
MDEwMCwgTWFyayBSdXRsYW5kIHdyb3RlOgo+ID4gT24gTW9uLCBBcHIgMTUsIDIwMjQgYXQgMDk6
NTI6NDFBTSArMDIwMCwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gPiA+IE9uIFRodSwgQXByIDEx
LCAyMDI0IGF0IDA3OjAwOjQxUE0gKzAzMDAsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gPiA+ID4g
Ky8qKgo+ID4gPiA+ICsgKiBlbnVtIGV4ZWNtZW1fdHlwZSAtIHR5cGVzIG9mIGV4ZWN1dGFibGUg
bWVtb3J5IHJhbmdlcwo+ID4gPiA+ICsgKgo+ID4gPiA+ICsgKiBUaGVyZSBhcmUgc2V2ZXJhbCBz
dWJzeXN0ZW1zIHRoYXQgYWxsb2NhdGUgZXhlY3V0YWJsZSBtZW1vcnkuCj4gPiA+ID4gKyAqIEFy
Y2hpdGVjdHVyZXMgZGVmaW5lIGRpZmZlcmVudCByZXN0cmljdGlvbnMgb24gcGxhY2VtZW50LAo+
ID4gPiA+ICsgKiBwZXJtaXNzaW9ucywgYWxpZ25tZW50IGFuZCBvdGhlciBwYXJhbWV0ZXJzIGZv
ciBtZW1vcnkgdGhhdCBjYW4gYmUgdXNlZAo+ID4gPiA+ICsgKiBieSB0aGVzZSBzdWJzeXN0ZW1z
Lgo+ID4gPiA+ICsgKiBUeXBlcyBpbiB0aGlzIGVudW0gaWRlbnRpZnkgc3Vic3lzdGVtcyB0aGF0
IGFsbG9jYXRlIGV4ZWN1dGFibGUgbWVtb3J5Cj4gPiA+ID4gKyAqIGFuZCBsZXQgYXJjaGl0ZWN0
dXJlcyBkZWZpbmUgcGFyYW1ldGVycyBmb3IgcmFuZ2VzIHN1aXRhYmxlIGZvcgo+ID4gPiA+ICsg
KiBhbGxvY2F0aW9ucyBieSBlYWNoIHN1YnN5c3RlbS4KPiA+ID4gPiArICoKPiA+ID4gPiArICog
QEVYRUNNRU1fREVGQVVMVDogZGVmYXVsdCBwYXJhbWV0ZXJzIHRoYXQgd291bGQgYmUgdXNlZCBm
b3IgdHlwZXMgdGhhdAo+ID4gPiA+ICsgKiBhcmUgbm90IGV4cGxjaXRseSBkZWZpbmVkLgo+ID4g
PiA+ICsgKiBARVhFQ01FTV9NT0RVTEVfVEVYVDogcGFyYW1ldGVycyBmb3IgbW9kdWxlIHRleHQg
c2VjdGlvbnMKPiA+ID4gPiArICogQEVYRUNNRU1fS1BST0JFUzogcGFyYW1ldGVycyBmb3Iga3By
b2Jlcwo+ID4gPiA+ICsgKiBARVhFQ01FTV9GVFJBQ0U6IHBhcmFtZXRlcnMgZm9yIGZ0cmFjZQo+
ID4gPiA+ICsgKiBARVhFQ01FTV9CUEY6IHBhcmFtZXRlcnMgZm9yIEJQRgo+ID4gPiA+ICsgKiBA
RVhFQ01FTV9UWVBFX01BWDoKPiA+ID4gPiArICovCj4gPiA+ID4gK2VudW0gZXhlY21lbV90eXBl
IHsKPiA+ID4gPiArIEVYRUNNRU1fREVGQVVMVCwKPiA+ID4gPiArIEVYRUNNRU1fTU9EVUxFX1RF
WFQgPSBFWEVDTUVNX0RFRkFVTFQsCj4gPiA+ID4gKyBFWEVDTUVNX0tQUk9CRVMsCj4gPiA+ID4g
KyBFWEVDTUVNX0ZUUkFDRSwKPiA+ID4gPiArIEVYRUNNRU1fQlBGLAo+ID4gPiA+ICsgRVhFQ01F
TV9UWVBFX01BWCwKPiA+ID4gPiArfTsKPiA+ID4KPiA+ID4gQ2FuIHdlIHBsZWFzZSBnZXQgYSBi
cmVhay1kb3duIG9mIGhvdyBhbGwgdGhlc2UgdHlwZXMgYXJlIGFjdHVhbGx5Cj4gPiA+IGRpZmZl
cmVudCBmcm9tIG9uZSBhbm90aGVyPwo+ID4gPgo+ID4gPiBJJ20gdGhpbmtpbmcgc29tZSBwbGF0
Zm9ybXMgaGF2ZSBhIHRpbnkgaW1tZWRpYXRlIHNwYWNlIChhcm02NCBjb21lcyB0bwo+ID4gPiBt
aW5kKSBhbmQgaGFzIGxlc3Mgc3RyaWN0IHBsYWNlbWVudCBjb25zdHJhaW50cyBmb3Igc29tZSBv
ZiB0aGVtPwo+ID4KPiA+IFllYWgsIGFuZCByZWFsbHkgSSdkICptdWNoKiByYXRoZXIgZGVhbCB3
aXRoIHRoYXQgaW4gYXJjaCBjb2RlLCBhcyBJIGhhdmUgc2FpZAo+ID4gc2V2ZXJhbCB0aW1lcy4K
PiA+Cj4gPiBGb3IgYXJtNjQgd2UgaGF2ZSB0d28gYnNhaWMgcmVzdHJpY3Rpb25zOgo+ID4KPiA+
IDEpIERpcmVjdCBicmFuY2hlcyBjYW4gZ28gKy8tMTI4TQo+ID4gICAgV2UgY2FuIGV4cGFuZCB0
aGlzIHJhbmdlIGJ5IGhhdmluZyBkaXJlY3QgYnJhbmNoZXMgZ28gdG8gUExUcywgYXQgYQo+ID4g
ICAgcGVyZm9ybWFuY2UgY29zdC4KPiA+Cj4gPiAyKSBQUkVMMzIgcmVsb2NhdGlvbnMgY2FuIGdv
ICsvLTJHCj4gPiAgICBXZSBjYW5ub3QgZXhwYW5kIHRoaXMgZnVydGhlci4KPiA+Cj4gPiAqIFdl
IGRvbid0IG5lZWQgdG8gYWxsb2NhdGUgbWVtb3J5IGZvciBmdHJhY2UuIFdlIGRvIG5vdCB1c2Ug
dHJhbXBvbGluZXMuCj4gPgo+ID4gKiBLcHJvYmVzIFhPTCBhcmVhcyBkb24ndCBjYXJlIGFib3V0
IGVpdGhlciBvZiB0aG9zZTsgd2UgZG9uJ3QgcGxhY2UgYW55Cj4gPiAgIFBDLXJlbGF0aXZlIGlu
c3RydWN0aW9ucyBpbiB0aG9zZS4gTWF5YmUgd2Ugd2FudCB0byBpbiBmdXR1cmUuCj4gPgo+ID4g
KiBNb2R1bGVzIGNhcmUgYWJvdXQgYm90aDsgd2UnZCAqcHJlZmVyKiB0byBwbGFjZSB0aGVtIHdp
dGhpbiArLy0xMjhNIG9mIGFsbAo+ID4gICBvdGhlciBrZXJuZWwvbW9kdWxlIGNvZGUsIGJ1dCBp
ZiB0aGVyZSdzIG5vIHNwYWNlIHdlIGNhbiB1c2UgUExUcyBhbmQgZXhwYW5kCj4gPiAgIHRoYXQg
dG8gKy8tMkcuIFNpbmNlIG1vZHVsZXMgY2FuIHJlZnJlZW5jZSBvdGhlciBtb2R1bGVzLCB0aGF0
IGVuZHMgdXAKPiA+ICAgYWN0dWFsbHkgYmVpbmcgaGFsdmVkLCBhbmQgbW9kdWxlcyBoYXZlIHRv
IGZpdCB3aXRoaW4gc29tZSAyRyB3aW5kb3cgdGhhdAo+ID4gICBhbHNvIGNvdmVycyB0aGUga2Vy
bmVsLgoKSXMgKy8tIDJHIGVub3VnaCBmb3IgYWxsIHJlYWxpc3RpYyB1c2UgY2FzZXM/IElmIHNv
LCBJIGd1ZXNzIHdlIGRvbid0CnJlYWxseSBuZWVkCkVYRUNNRU1fQU5ZV0hFUkUgYmVsb3c/Cgo+
ID4KPiA+ICogSSdtIG5vdCBzdXJlIGFib3V0IEJQRidzIHJlcXVpcmVtZW50czsgaXQgc2VlbXMg
aGFwcHkgZG9pbmcgdGhlIHNhbWUgYXMKPiA+ICAgbW9kdWxlcy4KPgo+IEJQRiBhcmUgaGFwcHkg
d2l0aCB2bWFsbG9jKCkuCj4KPiA+IFNvIGlmIHdlICptdXN0KiB1c2UgYSBjb21tb24gZXhlY21l
bSBhbGxvY2F0b3IsIHdoYXQgd2UnZCByZWFsbCB3YW50IGlzIG91ciBvd24KPiA+IHR5cGVzLCBl
LmcuCj4gPgo+ID4gICAgICAgRVhFQ01FTV9BTllXSEVSRQo+ID4gICAgICAgRVhFQ01FTV9OT1BM
VAo+ID4gICAgICAgRVhFQ01FTV9QUkVMMzIKPiA+Cj4gPiAuLi4gYW5kIHRoZW4gd2UgdXNlIHRo
b3NlIGluIGFyY2ggY29kZSB0byBpbXBsZW1lbnQgbW9kdWxlX2FsbG9jKCkgYW5kIGZyaWVuZHMu
Cj4KPiBJJ20gbG9va2luZyBhdCBleGVjbWVtX3R5cGVzIG1vcmUgYXMgZGVmaW5pdGlvbiBvZiB0
aGUgY29uc3VtZXJzLCBtYXliZSBJCj4gc2hvdWxkIGhhdmUgbmFtZWQgdGhlIGVudW0gZXhlY21l
bV9jb25zdW1lciBhdCB0aGUgZmlyc3QgcGxhY2UuCgpJIHRoaW5rIGxvb2tpbmcgYXQgZXhlY21l
bV90eXBlIGZyb20gY29uc3VtZXJzJyBwb2ludCBvZiB2aWV3IGFkZHMKdW5uZWNlc3NhcnkgY29t
cGxleGl0eS4gSUlVQywgZm9yIG1vc3QgKGlmIG5vdCBhbGwpIGFyY2hzLCBmdHJhY2UsIGtwcm9i
ZSwKYW5kIGJwZiAoYW5kIG1heWJlIGFsc28gbW9kdWxlIHRleHQpIGFsbCBoYXZlIHRoZSBzYW1l
IHJlcXVpcmVtZW50cy4KRGlkIEkgbWlzcyBzb21ldGhpbmc/CgpJT1csIHdlIGhhdmUKCmVudW0g
ZXhlY21lbV90eXBlIHsKICAgICAgICBFWEVDTUVNX0RFRkFVTFQsCiAgICAgICAgRVhFQ01FTV9U
RVhULAogICAgICAgIEVYRUNNRU1fS1BST0JFUyA9IEVYRUNNRU1fVEVYVCwKICAgICAgICBFWEVD
TUVNX0ZUUkFDRSA9IEVYRUNNRU1fVEVYVCwKICAgICAgICBFWEVDTUVNX0JQRiA9IEVYRUNNRU1f
VEVYVCwgICAgICAvKiB3ZSBtYXkgZW5kIHVwIHdpdGhvdXQKX0tQUk9CRSwgX0ZUUkFDRSwgX0JQ
RiAqLwogICAgICAgIEVYRUNNRU1fREFUQSwgIC8qIHJ3ICovCiAgICAgICAgRVhFQ01FTV9ST19E
QVRBLAogICAgICAgIEVYRUNNRU1fUk9fQUZURVJfSU5JVCwKICAgICAgICBFWEVDTUVNX1RZUEVf
TUFYLAp9OwoKRG9lcyB0aGlzIG1ha2Ugc2Vuc2U/CgpUaGFua3MsClNvbmcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
