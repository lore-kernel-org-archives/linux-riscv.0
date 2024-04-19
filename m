Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1658AC071FD
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 17:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+Pdg6TG5etwHiSyzvgc1nbdFxFRkWXQkXZs9o8A/6g=; b=WR8F/DeRg5zgZr
	mAg6spjLmD21fwLObl+Gmy0atu0wt31xqBAK60/AsMzTP4Dsh7YM9F1dGoWwm1a1mzXAr1t8LkBAk
	vutkCWeoST6tWzToCV0g/CJ1xurK4vEXVxl7z1MMCYD9Wol1X2KE7vbPCYy4a6PNqdor7dqXlRKLp
	OEZBBB/cbiTrHms54sABnA6qKjhUW2i1D0Vcxksm0p9L5HPsjhoD/NWNdP0uFd0VxniWmaaU+Q1wW
	1jSuNwyeTROgVhJE7mSQNc4x4E8v9MAP3hiZwW6zpbYKX/h8C6q2G5+a0tqRYwiciEy+UX4eBr8vx
	Qut0JGp5IZGxvY8W1V+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxs6v-00000006Y0U-2dC7;
	Fri, 19 Apr 2024 17:33:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxs6r-00000006Xz9-2THU;
	Fri, 19 Apr 2024 17:33:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 01713619E1;
	Fri, 19 Apr 2024 17:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFD4C2BD11;
	Fri, 19 Apr 2024 17:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713547992;
	bh=sVegppIF/niXLnTLCcBWzkxa2L1ow1Dt9dF+ATN6lsk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hz5HA12mGjDKfqVeo5OEuWAXF7TDIh13CeKJ5HkGMfIHVK1Eso9dNbU7tD++O5rKF
	 0sUzDpSaXME0yKE/l8cgrQWT0Z2sDz6N+xBa5e2JQHDmU99ok3qp4SzMoIVGoVpEwf
	 FexKUZUXH+JNYzZwL8sv4Ui8jBZVcdQT31/FMgdQ0m5wu28goRuvm3B21LF/otZU2O
	 XoCzXXYsLp/0EakVkhWxF02OBZtpBRVRnjNTzYgCBl9NhL3X5Jwa9LaLOt0hsxr64Z
	 QzmDAxTOkYMWvKL9laT9o+PUmzjOHAVeOdb0I3eJy8krCoZrJBeqor627d4pzQ8XKs
	 l7bBiZSmzj0Uw==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-571cca01d8aso1134788a12.2;
        Fri, 19 Apr 2024 10:33:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkB+ZJwO87XLWB22YpGsWxOCG6DIXaf/nhdV8E/7BJEf3eAOV1sLgtk0AnxXlt+xYLSAJxoXFTxoqwdfV3BNf4akFW+8NAvtiGWY4AHazT1FXLf2kvyy14nUEF9cQbY9H0PA7LbnsSAOc/iKxMFwoAAREiwDA=
X-Gm-Message-State: AOJu0Yz0kdwL9IJLHx/tsklYa2mXrzFVi6HqN+4ToTEm3QiPdcgYMTkU
	ceZ5mm9FRpLVq73C4mHbRA8+smENlwEOFJpSrOwo/LaPF2ggqENeqqkquaqZssEScGQFPwI7N4B
	ETvfpEGTmWTLS1sTkkzZuWCjppeE=
X-Google-Smtp-Source: AGHT+IFQL0ZIY0ZfQ4j9vl7SSSW0Y7vt5IE5s4aAkthQ3+dt0vC//uVhsYgqRpBdUKo6ap4ecg5hjMNFhNToQ1hMBQU=
X-Received: by 2002:ac2:5a1e:0:b0:519:296e:2c80 with SMTP id
 q30-20020ac25a1e000000b00519296e2c80mr1475078lfn.15.1713547970497; Fri, 19
 Apr 2024 10:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240415075241.GF40213@noisy.programming.kicks-ass.net>
 <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com> <Zh4nJp8rv1qRBs8m@kernel.org>
 <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
 <ZiE91CJcNw7gBj9g@kernel.org> <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
 <ZiFd567L4Zzm2okO@kernel.org> <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
 <ZiIVVBgaDN4RsroT@kernel.org> <CAPhsuW7WoU+a46FhqqH8f-3=ehxeD4wSgKDWegMin1pT49OSWw@mail.gmail.com>
 <ZiKjmaDgz_56ovbv@kernel.org>
In-Reply-To: <ZiKjmaDgz_56ovbv@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 19 Apr 2024 10:32:39 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7Nj1Sa_9xQtTgHz9AmX39zdh2x2COqA-qmkfpfX9hNWw@mail.gmail.com>
Message-ID: <CAPhsuW7Nj1Sa_9xQtTgHz9AmX39zdh2x2COqA-qmkfpfX9hNWw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240419_103313_739748_9DE84696 
X-CRM114-Status: GOOD (  16.75  )
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

T24gRnJpLCBBcHIgMTksIDIwMjQgYXQgMTA6MDPigK9BTSBNaWtlIFJhcG9wb3J0IDxycHB0QGtl
cm5lbC5vcmc+IHdyb3RlOgpbLi4uXQo+ID4gPgo+ID4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjQwNDExMTYwNTI2LjIwOTM0MDgtMS1ycHB0QGtlcm5lbC5vcmcKPiA+Cj4g
PiBGb3IgdGhlIFJPWCB0byB3b3JrLCB3ZSBuZWVkIGRpZmZlcmVudCB1c2VycyAobW9kdWxlIHRl
eHQsIGtwcm9iZSwgZXRjLikgdG8gaGF2ZQo+ID4gdGhlIHNhbWUgZXhlY21lbV9yYW5nZS4gRnJv
bSBbMV06Cj4gPgo+ID4gc3RhdGljIHZvaWQgKmV4ZWNtZW1fY2FjaGVfYWxsb2Moc3RydWN0IGV4
ZWNtZW1fcmFuZ2UgKnJhbmdlLCBzaXplX3Qgc2l6ZSkKPiA+IHsKPiA+IC4uLgo+ID4gICAgICAg
IHAgPSBfX2V4ZWNtZW1fY2FjaGVfYWxsb2Moc2l6ZSk7Cj4gPiAgICAgICAgaWYgKHApCj4gPiAg
ICAgICAgICAgICAgICByZXR1cm4gcDsKPiA+ICAgICAgIGVyciA9IGV4ZWNtZW1fY2FjaGVfcG9w
dWxhdGUocmFuZ2UsIHNpemUpOwo+ID4gLi4uCj4gPiB9Cj4gPgo+ID4gV2UgYXJlIGNhbGxpbmcg
X19leGVjbWVtX2NhY2hlX2FsbG9jKCkgd2l0aG91dCByYW5nZS4gRm9yIHRoaXMgdG8gd29yaywK
PiA+IHdlIGNhbiBvbmx5IGNhbGwgZXhlY21lbV9jYWNoZV9hbGxvYygpIHdpdGggb25lIGV4ZWNt
ZW1fcmFuZ2UuCj4KPiBBY3R1YWxseSwgb24geDg2IHRoaXMgd2lsbCAianVzdCB3b3JrIiBiZWNh
dXNlIGV2ZXJ5dGhpbmcgc2hhcmVzIHRoZSBzYW1lCj4gYWRkcmVzcyBzcGFjZSA6KQo+Cj4gVGhl
IDJNIHBhZ2VzIGluIHRoZSBjYWNoZSB3aWxsIGJlIGluIHRoZSBtb2R1bGVzIHNwYWNlLCBzbwo+
IF9fZXhlY21lbV9jYWNoZV9hbGxvYygpIHdpbGwgYWx3YXlzIHJldHVybiBtZW1vcnkgZnJvbSB0
aGF0IGFkZHJlc3Mgc3BhY2UuCj4KPiBGb3Igb3RoZXIgYXJjaGl0ZWN0dXJlcyB0aGlzIGluZGVl
ZCBuZWVkcyB0byBiZSBmaXhlZCB3aXRoIHBhc3NpbmcgdGhlCj4gcmFuZ2UgdG8gX19leGVjbWVt
X2NhY2hlX2FsbG9jKCkgYW5kIGxpbWl0aW5nIHNlYXJjaCBpbiB0aGUgY2FjaGUgZm9yIHRoYXQK
PiByYW5nZS4KCkkgdGhpbmsgd2UgYXQgbGVhc3QgbmVlZCB0aGUgIm1hcCB0byIgY29uY2VwdCAo
aW5pdGlhbGx5IHByb3Bvc2VkIGJ5IFRob21hcykKdG8gZ2V0IHRoaXMgd29yay4gRm9yIGV4YW1w
bGUsIEVYRUNNRU1fQlBGIGFuZCBFWEVDTUVNX0tQUk9CRQptYXBzIHRvIEVYRUNNRU1fTU9EVUxF
X1RFWFQsIHNvIHRoYXQgYWxsIHRoZXNlIGFjdHVhbGx5IHNoYXJlCnRoZSBzYW1lIHJhbmdlLgoK
RG9lcyB0aGlzIG1ha2Ugc2Vuc2U/CgpTb25nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
