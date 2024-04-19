Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27B3C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 21:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAdXyuYbfCeCVUtMYCyFz2WkwcVWaVeNmV/I0rvWHGU=; b=h8qE6sM55+iJG+
	PCEg+zJ2rEIwZmM1qN25DnCpmbcmT6Isj9HfnIAFzhe4h2le1Ul7LtLCcKz5fvzI/FpiC+K0vz4wd
	+enC5igTmNkpxLEaH4EkbPp9wUlYK0hfsyhN5HiD2I/avUwpwgQWkr46WLjgokiU3avnmwVleeQYV
	T10aDloGwK3YycYfCPUUp4/qQeK3g4RcNvPq4FwNpNLrGNC1IFdJCVfdMPCR5ErQpJjsJizO1k1aQ
	dYJ5FqALxgj84ToijFeACGgZEs2LIkDuhO+KiJQg5G6BVLoBHwM7YJImxrLXlZfivupP4KM+9ExZm
	DNf+59mcnV+GcMk0y8fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxw0c-000000073fL-3IeD;
	Fri, 19 Apr 2024 21:43:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxw0X-000000073bg-1Y3z;
	Fri, 19 Apr 2024 21:42:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 92A75CE1AEF;
	Fri, 19 Apr 2024 21:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80C5C072AA;
	Fri, 19 Apr 2024 21:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713562970;
	bh=TCFccoU0QynIlhNVSwfE9PBflv6m2g3eer2smjEjHo0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m4HnPRVFmWRnbZz8jQgaboXaGgGHKM6NiRHPnWxYnXriYRx79b4qxLh61hmOGchcc
	 BeAAWFrwxoxYJkYzlzLPxW1HmMSHuQQ804wgQ9HB2dliWoJAMe+WuPJgC73w48qsaY
	 8p0FVzWBN/to3b7K3DQ7j/PsKeJd4uV1W+Gch+w6NTUGukNdlDn0g0cB3UnAb3jQx7
	 PSf8rBW9ZQhouGbP6ra7uug8JuzEdjBEg+XfggIiIEQt0h1ve10SOMFqY9M0wevTbL
	 Eq6Fd3MJ0oNRWLCEy29E4JMXnQs2SedtXJyicXYfXpkSeddtxs7BNvLDpvfmOC5KQu
	 tl/dlpBBhEWSQ==
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4199332c1dcso5974935e9.3;
        Fri, 19 Apr 2024 14:42:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZGnck7rwN6td5tlODeGb5QtiT2dhEH/9jhwv93QHdHfyl1rDnnPZPpCgXuth978pH6yddnkmGdKo9bdCzEs3Uqqv3JdpFSxVk9hGtaQL24XH+f1eutKfOv7rc5hIxBV3gRLbSKEilNtpMrZ+c6NTNgdMO+BA=
X-Gm-Message-State: AOJu0Yyo8/lhCgvDrulT2T+uGQMokQXMPnF8GxHn/YyKVtCI7hIgB9eM
	D8+E1k1FAhbetC5rZTY1OfmLnDksREL+6FDd0uSxXWaziBDzEeK1pGHM2UpIKwpc/KIPpLPg58M
	T46IuBVB3HnLXKG4Q3ymrnZ4HMMQ=
X-Google-Smtp-Source: AGHT+IH4AnwX5zN14P6kYOA/5jMldeW1Bv8FPwjpWGtVTE89ihBaxTYgE7/68A2MjqxVZZCm/ny8Sr/SdDVp6qchZyo=
X-Received: by 2002:a19:5f4d:0:b0:519:5b84:1038 with SMTP id
 a13-20020a195f4d000000b005195b841038mr1897119lfj.20.1713562948432; Fri, 19
 Apr 2024 14:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <Zh4nJp8rv1qRBs8m@kernel.org> <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
 <ZiE91CJcNw7gBj9g@kernel.org> <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
 <ZiFd567L4Zzm2okO@kernel.org> <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
 <ZiIVVBgaDN4RsroT@kernel.org> <CAPhsuW7WoU+a46FhqqH8f-3=ehxeD4wSgKDWegMin1pT49OSWw@mail.gmail.com>
 <ZiKjmaDgz_56ovbv@kernel.org> <CAPhsuW7Nj1Sa_9xQtTgHz9AmX39zdh2x2COqA-qmkfpfX9hNWw@mail.gmail.com>
 <ZiLNGgVSQ7_cg58y@kernel.org>
In-Reply-To: <ZiLNGgVSQ7_cg58y@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 19 Apr 2024 14:42:16 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4KRM4O4RFbYQrt=Coqyh9w29WiF2YF=8soDfauLFsKBA@mail.gmail.com>
Message-ID: <CAPhsuW4KRM4O4RFbYQrt=Coqyh9w29WiF2YF=8soDfauLFsKBA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240419_144257_779178_B3000F6E 
X-CRM114-Status: GOOD (  23.16  )
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

T24gRnJpLCBBcHIgMTksIDIwMjQgYXQgMTowMOKAr1BNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEFwciAxOSwgMjAyNCBhdCAxMDozMjozOUFNIC0w
NzAwLCBTb25nIExpdSB3cm90ZToKPiA+IE9uIEZyaSwgQXByIDE5LCAyMDI0IGF0IDEwOjAz4oCv
QU0gTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPiB3cm90ZToKPiA+IFsuLi5dCj4gPiA+
ID4gPgo+ID4gPiA+ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDQxMTE2
MDUyNi4yMDkzNDA4LTEtcnBwdEBrZXJuZWwub3JnCj4gPiA+ID4KPiA+ID4gPiBGb3IgdGhlIFJP
WCB0byB3b3JrLCB3ZSBuZWVkIGRpZmZlcmVudCB1c2VycyAobW9kdWxlIHRleHQsIGtwcm9iZSwg
ZXRjLikgdG8gaGF2ZQo+ID4gPiA+IHRoZSBzYW1lIGV4ZWNtZW1fcmFuZ2UuIEZyb20gWzFdOgo+
ID4gPiA+Cj4gPiA+ID4gc3RhdGljIHZvaWQgKmV4ZWNtZW1fY2FjaGVfYWxsb2Moc3RydWN0IGV4
ZWNtZW1fcmFuZ2UgKnJhbmdlLCBzaXplX3Qgc2l6ZSkKPiA+ID4gPiB7Cj4gPiA+ID4gLi4uCj4g
PiA+ID4gICAgICAgIHAgPSBfX2V4ZWNtZW1fY2FjaGVfYWxsb2Moc2l6ZSk7Cj4gPiA+ID4gICAg
ICAgIGlmIChwKQo+ID4gPiA+ICAgICAgICAgICAgICAgIHJldHVybiBwOwo+ID4gPiA+ICAgICAg
IGVyciA9IGV4ZWNtZW1fY2FjaGVfcG9wdWxhdGUocmFuZ2UsIHNpemUpOwo+ID4gPiA+IC4uLgo+
ID4gPiA+IH0KPiA+ID4gPgo+ID4gPiA+IFdlIGFyZSBjYWxsaW5nIF9fZXhlY21lbV9jYWNoZV9h
bGxvYygpIHdpdGhvdXQgcmFuZ2UuIEZvciB0aGlzIHRvIHdvcmssCj4gPiA+ID4gd2UgY2FuIG9u
bHkgY2FsbCBleGVjbWVtX2NhY2hlX2FsbG9jKCkgd2l0aCBvbmUgZXhlY21lbV9yYW5nZS4KPiA+
ID4KPiA+ID4gQWN0dWFsbHksIG9uIHg4NiB0aGlzIHdpbGwgImp1c3Qgd29yayIgYmVjYXVzZSBl
dmVyeXRoaW5nIHNoYXJlcyB0aGUgc2FtZQo+ID4gPiBhZGRyZXNzIHNwYWNlIDopCj4gPiA+Cj4g
PiA+IFRoZSAyTSBwYWdlcyBpbiB0aGUgY2FjaGUgd2lsbCBiZSBpbiB0aGUgbW9kdWxlcyBzcGFj
ZSwgc28KPiA+ID4gX19leGVjbWVtX2NhY2hlX2FsbG9jKCkgd2lsbCBhbHdheXMgcmV0dXJuIG1l
bW9yeSBmcm9tIHRoYXQgYWRkcmVzcyBzcGFjZS4KPiA+ID4KPiA+ID4gRm9yIG90aGVyIGFyY2hp
dGVjdHVyZXMgdGhpcyBpbmRlZWQgbmVlZHMgdG8gYmUgZml4ZWQgd2l0aCBwYXNzaW5nIHRoZQo+
ID4gPiByYW5nZSB0byBfX2V4ZWNtZW1fY2FjaGVfYWxsb2MoKSBhbmQgbGltaXRpbmcgc2VhcmNo
IGluIHRoZSBjYWNoZSBmb3IgdGhhdAo+ID4gPiByYW5nZS4KPiA+Cj4gPiBJIHRoaW5rIHdlIGF0
IGxlYXN0IG5lZWQgdGhlICJtYXAgdG8iIGNvbmNlcHQgKGluaXRpYWxseSBwcm9wb3NlZCBieSBU
aG9tYXMpCj4gPiB0byBnZXQgdGhpcyB3b3JrLiBGb3IgZXhhbXBsZSwgRVhFQ01FTV9CUEYgYW5k
IEVYRUNNRU1fS1BST0JFCj4gPiBtYXBzIHRvIEVYRUNNRU1fTU9EVUxFX1RFWFQsIHNvIHRoYXQg
YWxsIHRoZXNlIGFjdHVhbGx5IHNoYXJlCj4gPiB0aGUgc2FtZSByYW5nZS4KPgo+IFdoeT8KCklJ
VUMsIHdlIG5lZWQgdG8gdXBkYXRlIF9fZXhlY21lbV9jYWNoZV9hbGxvYygpIHRvIHRha2UgYSBy
YW5nZSBwb2ludGVyIGFzCmlucHV0LiBtb2R1bGUgdGV4dCB3aWxsIHVzZSAicmFuZ2UiIGZvciBF
WEVDTUVNX01PRFVMRV9URVhULCB3aGlsZSBrcHJvYmUKd2lsbCB1c2UgInJhbmdlIiBmb3IgRVhF
Q01FTV9LUFJPQkUuIFdpdGhvdXQgIm1hcCB0byIgY29uY2VwdCBvciBzaGFyaW5nCnRoZSAicmFu
Z2UiIG9iamVjdCwgd2Ugd2lsbCBoYXZlIHRvIGNvbXBhcmUgZGlmZmVyZW50IHJhbmdlIHBhcmFt
ZXRlcnMgdG8gY2hlY2sKd2UgY2FuIHNoYXJlIGNhY2hlZCBwYWdlcyBiZXR3ZWVuIG1vZHVsZSB0
ZXh0IGFuZCBrcHJvYmUsIHdoaWNoIGlzIG5vdAplZmZpY2llbnQuIERpZCBJIG1pc3Mgc29tZXRo
aW5nPwoKVGhhbmtzLApTb25nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
