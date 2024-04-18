Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99441C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 16:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NA8CID9MFz5ADUJIj/KVm7Bohr2JxUwoZqXiLqb82Is=; b=h3P1FjZD/cgngw
	z4L94p6YdbhNnafaHekH6L6Qd2CjpAZ0fcqETQZwcyX+qbVOb2FGQ4pij7+IgCKjmbYkeKmljjHT5
	e5A8/3AHbjXsS6ipEN/BY5BzcLmp/fGRrdlkuI3W/p/lA7oMMQje5VtIdvhk6wWsgUYU3rXNM7HwB
	mVc7jsfs0C8IBS8j1pkP5FqxkK0tXwuOTTNU3rhIfxKnml0ugQ0yNieCFzmCANuRXypeEF99xVA4w
	wj9zTEhr1G1HBNVI5FKx7MS9/PPIpKGtijIVnHGYflFW6DRGdxxNym35d0fAdzSlc5Uj9dO2BTYKE
	gy0HSxsEIY0BAsBPfA3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxUOl-00000002yM2-1MR6;
	Thu, 18 Apr 2024 16:14:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxUOh-00000002yJb-0MLG;
	Thu, 18 Apr 2024 16:14:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 80C4561889;
	Thu, 18 Apr 2024 16:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F1CC113CC;
	Thu, 18 Apr 2024 16:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713456842;
	bh=q/TFlw8SQh+Cko4nU/ng2SJ+spicGdHxGtHPBf/Abnk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ognbMNC/GR84CM8HfbPGtJAJ8YT7dKj9Wghcc2TTr9NhuNApI7Kv9jjT00nMuPgbc
	 00Am3pZnMcn8yKK1ESf9bytpJFexmwPKeROcuLJ5A59ClliyBQXAEQwC0v8gswe+DC
	 RQ6AGLfqZFCN9TyOJd2amNdpvm/mXWyYOV8gSIk6PHgoJsPIGWc1gfKMkNdr+EoKd0
	 ZKnV+reIVszWUpVDetYjSoV1dkVwtBe1b3QFb5OksN5hpQxHYfQBIbiG+2NSQlNQ5E
	 OIyQxsxVXeEYTWY97KSGSgrlcJoyreO6fMnWacvq8uqg8PHeHBMmr3oqwh8omLnZQJ
	 uoknBJmLL02AA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d88a869ce6so13960991fa.3;
        Thu, 18 Apr 2024 09:14:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXtne+ppYrwkouqYs7+26KJMl36FLH0nspDb318Y71SmyjOTdeglY+wSLw9VQQ1qQoihVTng5GKghpXOdOgWD/zXP0HQ1+1Zbmi1yyQFh4Ob/B8zefUixJGD+LYldJHn+pepwvs11jf+qq1mChAkr+znCSZGk=
X-Gm-Message-State: AOJu0YxekBccsNeDpb9AxMDxeBQrgeFXgl+QCQELBWMBoYDPoE6lvWyw
	fTXmcgxB1QxgnVTT3zx1qvQMSyuEEOWzI6S9BaFsGyaIpm0IkfFWWPiImB30BKuem6mkUkgz2g5
	WpkNppF5kXamfxwmOPMlyoLvI6rc=
X-Google-Smtp-Source: AGHT+IHLiDWbpJNv5cpg7tSucX1RJbILlT9QE6EE0zaOt0RsDuLJ8JfO9fqfVmmivnqe0091gRHYHRJJ+tsSYBR5kLA=
X-Received: by 2002:ac2:5fad:0:b0:519:569b:361b with SMTP id
 s13-20020ac25fad000000b00519569b361bmr1973077lfe.63.1713456819439; Thu, 18
 Apr 2024 09:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240411160051.2093261-1-rppt@kernel.org> <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net> <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
 <Zh4nJp8rv1qRBs8m@kernel.org> <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
 <ZiE91CJcNw7gBj9g@kernel.org>
In-Reply-To: <ZiE91CJcNw7gBj9g@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 18 Apr 2024 09:13:27 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
Message-ID: <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240418_091403_270875_51F45231 
X-CRM114-Status: GOOD (  26.34  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgODozN+KAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KWy4uLl0KPiA+Cj4gPiBJcyArLy0gMkcgZW5vdWdoIGZvciBhbGwg
cmVhbGlzdGljIHVzZSBjYXNlcz8gSWYgc28sIEkgZ3Vlc3Mgd2UgZG9uJ3QKPiA+IHJlYWxseSBu
ZWVkCj4gPiBFWEVDTUVNX0FOWVdIRVJFIGJlbG93Pwo+ID4KPiA+ID4gPgo+ID4gPiA+ICogSSdt
IG5vdCBzdXJlIGFib3V0IEJQRidzIHJlcXVpcmVtZW50czsgaXQgc2VlbXMgaGFwcHkgZG9pbmcg
dGhlIHNhbWUgYXMKPiA+ID4gPiAgIG1vZHVsZXMuCj4gPiA+Cj4gPiA+IEJQRiBhcmUgaGFwcHkg
d2l0aCB2bWFsbG9jKCkuCj4gPiA+Cj4gPiA+ID4gU28gaWYgd2UgKm11c3QqIHVzZSBhIGNvbW1v
biBleGVjbWVtIGFsbG9jYXRvciwgd2hhdCB3ZSdkIHJlYWxsIHdhbnQgaXMgb3VyIG93bgo+ID4g
PiA+IHR5cGVzLCBlLmcuCj4gPiA+ID4KPiA+ID4gPiAgICAgICBFWEVDTUVNX0FOWVdIRVJFCj4g
PiA+ID4gICAgICAgRVhFQ01FTV9OT1BMVAo+ID4gPiA+ICAgICAgIEVYRUNNRU1fUFJFTDMyCj4g
PiA+ID4KPiA+ID4gPiAuLi4gYW5kIHRoZW4gd2UgdXNlIHRob3NlIGluIGFyY2ggY29kZSB0byBp
bXBsZW1lbnQgbW9kdWxlX2FsbG9jKCkgYW5kIGZyaWVuZHMuCj4gPiA+Cj4gPiA+IEknbSBsb29r
aW5nIGF0IGV4ZWNtZW1fdHlwZXMgbW9yZSBhcyBkZWZpbml0aW9uIG9mIHRoZSBjb25zdW1lcnMs
IG1heWJlIEkKPiA+ID4gc2hvdWxkIGhhdmUgbmFtZWQgdGhlIGVudW0gZXhlY21lbV9jb25zdW1l
ciBhdCB0aGUgZmlyc3QgcGxhY2UuCj4gPgo+ID4gSSB0aGluayBsb29raW5nIGF0IGV4ZWNtZW1f
dHlwZSBmcm9tIGNvbnN1bWVycycgcG9pbnQgb2YgdmlldyBhZGRzCj4gPiB1bm5lY2Vzc2FyeSBj
b21wbGV4aXR5LiBJSVVDLCBmb3IgbW9zdCAoaWYgbm90IGFsbCkgYXJjaHMsIGZ0cmFjZSwga3By
b2JlLAo+ID4gYW5kIGJwZiAoYW5kIG1heWJlIGFsc28gbW9kdWxlIHRleHQpIGFsbCBoYXZlIHRo
ZSBzYW1lIHJlcXVpcmVtZW50cy4KPiA+IERpZCBJIG1pc3Mgc29tZXRoaW5nPwo+Cj4gSXQncyBl
bm91Z2ggdG8gaGF2ZSBvbmUgYXJjaGl0ZWN0dXJlIHdpdGggZGlmZmVyZW50IGNvbnN0cmFpbnMg
Zm9yIGtwcm9iZXMKPiBhbmQgYnBmIHRvIHdhcnJhbnQgYSB0eXBlIGZvciBlYWNoLgo+CgpBRkFJ
Q1QsIHNvbWUgb2YgdGhlc2UgY29uc3RyYWludHMgY2FuIGJlIGNoYW5nZWQgd2l0aG91dCB0b28g
bXVjaCB3b3JrLgoKPiBXaGVyZSBkbyB5b3Ugc2VlIHVubmVjZXNzYXJ5IGNvbXBsZXhpdHk/Cj4K
PiA+IElPVywgd2UgaGF2ZQo+ID4KPiA+IGVudW0gZXhlY21lbV90eXBlIHsKPiA+ICAgICAgICAg
RVhFQ01FTV9ERUZBVUxULAo+ID4gICAgICAgICBFWEVDTUVNX1RFWFQsCj4gPiAgICAgICAgIEVY
RUNNRU1fS1BST0JFUyA9IEVYRUNNRU1fVEVYVCwKPiA+ICAgICAgICAgRVhFQ01FTV9GVFJBQ0Ug
PSBFWEVDTUVNX1RFWFQsCj4gPiAgICAgICAgIEVYRUNNRU1fQlBGID0gRVhFQ01FTV9URVhULCAg
ICAgIC8qIHdlIG1heSBlbmQgdXAgd2l0aG91dAo+ID4gX0tQUk9CRSwgX0ZUUkFDRSwgX0JQRiAq
Lwo+ID4gICAgICAgICBFWEVDTUVNX0RBVEEsICAvKiBydyAqLwo+ID4gICAgICAgICBFWEVDTUVN
X1JPX0RBVEEsCj4gPiAgICAgICAgIEVYRUNNRU1fUk9fQUZURVJfSU5JVCwKPiA+ICAgICAgICAg
RVhFQ01FTV9UWVBFX01BWCwKPiA+IH07Cj4gPgo+ID4gRG9lcyB0aGlzIG1ha2Ugc2Vuc2U/Cj4K
PiBIb3cgZG8geW91IHN1Z2dlc3QgdG8gZGVhbCB3aXRoIGUuZy4gcmlzY3YgdGhhdCBoYXMgc2Vw
YXJhdGUgYWRkcmVzcyBzcGFjZXMKPiBmb3IgbW9kdWxlcywga3Byb2JlcyBhbmQgYnBmPwoKSUlV
QywgbW9kdWxlcyBhbmQgYnBmIHVzZSB0aGUgc2FtZSBhZGRyZXNzIHNwYWNlIG9uIHJpc2N2LCB3
aGlsZSBrcHJvYmVzIHVzZQp2bWFsbG9jIGFkZHJlc3MuIEkgaGF2ZW4ndCB0cmllZCB0aGlzIHll
dCwgYnV0IEkgdGhpbmsgd2UgY2FuIGxldAprcHJvYmVzIHVzZSB0aGUKc2FtZSBzcGFjZSBhcyBt
b2R1bGVzIGFuZCBicGYsIHdoaWNoIGlzOgoKZmZmZmZmZmYwMDAwMDAwMCB8ICAtNCAgICAgR0Ig
fCBmZmZmZmZmZjdmZmZmZmZmIHwgICAgMiBHQiB8IG1vZHVsZXMsIEJQRgoKRGlkIEkgZ2V0IHRo
aXMgcmlnaHQ/CgpUaGFua3MsClNvbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
