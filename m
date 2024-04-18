Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116BAC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 21:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+dyalLYc458M3ZlZLbmaMV9cfzL7iLu3m9QPRA+0K1U=; b=UowNzGse3VMVJ+
	6U+XIn2lWZLLTF/V3SG6s26aH8EUy1uiUfkNkDch947pVCzSg63C/UaTbwqPQY2iAS4dfP+irn+z6
	+NqVcUyZn7kgOt/jUZOJTpxYBDpyfaN2upTo4iSuecrMwZ1f62izKW1fRApcEIF9P4ryXmCpJ1PKi
	9gwTSLtuS6O8pVxqXhM6Q6b+BSN3ZEWHw15llmYjAXZNTtWOlk9J57x3c+8acA+eUXEE/2/wLKHwD
	ZPjCd6Z/Ygvzfris59+jJlZJfHPjjTOS97z+PH+RZNeEMgdgel75ewHwxtHwCvKxdn1TtiHK1tj46
	7pbvgpjRJp4N5FGuZqKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxYtN-00000003hip-2jJD;
	Thu, 18 Apr 2024 21:02:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxYtJ-00000003hhF-1Woe;
	Thu, 18 Apr 2024 21:01:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CEBA4618F6;
	Thu, 18 Apr 2024 21:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79069C113CC;
	Thu, 18 Apr 2024 21:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713474116;
	bh=Q9xFEu3Y5LoeO0EqCkhUGHL0dsvPtZI4/AmKYvf5MnY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LKsu6wgwztewDd1Kf4NCYPGtYXsdZ+ofFTa2d1MI2zHPuKQq+mmWhhJ/cfOoO74/D
	 CmcZP1gphR1rk0/C2WrZMmDohWk9TLfoE/BVlmPcx4Ya9rM6Nh6AU0ABzg9gD2wvws
	 H60UGmuK3KY+NjPIGsNka51Re3XwprsD1pbbtq74ctVkAghiYQUsQoRN8cLIcXPPsL
	 rXx3eFrMppxOnjZtTYcB0+vT04YNLcaQFvbo1fn264bSOiuX8e1yptQTDfZHVYZ58/
	 0oeaQEoE1JgibuYG0nL+yludx9odg4AlyJea9d8FGku7Y1tGZRmj1BnxpJESiJFknk
	 jlSY0S/C8n1Cg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5194a2cf7c2so1382944e87.0;
        Thu, 18 Apr 2024 14:01:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZZja/hdY+2dAMCL4Zzigqj0jMFySOpwerg599UjSB8zA4prvx6zJZAKW9Juxvl+8uuDB5yGi0eY9BwSyJ7DXDN1n7Fz0PIJpiM2tI+ZNFqaWPxefzk8J2f6J9TTYHmqJVYvY0YSKmSVSnyoBexArZcpkIhj4=
X-Gm-Message-State: AOJu0YzNPpjpBLPm2WnHs0IK3SD72g94F6yKjSfIrriOjyaa5LxAtPRc
	NAQxPr1/KhZFNVNnL7EAKwt0bq0uRQhi8hTMY4LqNqaURO4vNNDsxAXe7jx4KFPE8F0tc2BzZC6
	25I9sTvLhPHuTr73/h0Mr6u5VfBM=
X-Google-Smtp-Source: AGHT+IHNxy9sJsnZs3KQVfU0+czeg8tBpsYhbjwNsSaDNt4tlgSyRo9Mz2ssjEN7kjA5vVRJEg5DihQkgyMA2Jl/jC4=
X-Received: by 2002:a05:6512:1251:b0:516:cec0:1fc0 with SMTP id
 fb17-20020a056512125100b00516cec01fc0mr104453lfb.63.1713474094462; Thu, 18
 Apr 2024 14:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240411160051.2093261-1-rppt@kernel.org> <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net> <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
 <Zh4nJp8rv1qRBs8m@kernel.org> <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
 <ZiE91CJcNw7gBj9g@kernel.org> <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
 <ZiFd567L4Zzm2okO@kernel.org>
In-Reply-To: <ZiFd567L4Zzm2okO@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 18 Apr 2024 14:01:22 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
Message-ID: <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240418_140157_505537_FE68DBD9 
X-CRM114-Status: GOOD (  19.24  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMTA6NTTigK9BTSBNaWtlIFJhcG9wb3J0IDxycHB0QGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMDk6MTM6MjdBTSAt
MDcwMCwgU29uZyBMaXUgd3JvdGU6Cj4gPiBPbiBUaHUsIEFwciAxOCwgMjAyNCBhdCA4OjM34oCv
QU0gTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+
ID4gPiBJJ20gbG9va2luZyBhdCBleGVjbWVtX3R5cGVzIG1vcmUgYXMgZGVmaW5pdGlvbiBvZiB0
aGUgY29uc3VtZXJzLCBtYXliZSBJCj4gPiA+ID4gPiBzaG91bGQgaGF2ZSBuYW1lZCB0aGUgZW51
bSBleGVjbWVtX2NvbnN1bWVyIGF0IHRoZSBmaXJzdCBwbGFjZS4KPiA+ID4gPgo+ID4gPiA+IEkg
dGhpbmsgbG9va2luZyBhdCBleGVjbWVtX3R5cGUgZnJvbSBjb25zdW1lcnMnIHBvaW50IG9mIHZp
ZXcgYWRkcwo+ID4gPiA+IHVubmVjZXNzYXJ5IGNvbXBsZXhpdHkuIElJVUMsIGZvciBtb3N0IChp
ZiBub3QgYWxsKSBhcmNocywgZnRyYWNlLCBrcHJvYmUsCj4gPiA+ID4gYW5kIGJwZiAoYW5kIG1h
eWJlIGFsc28gbW9kdWxlIHRleHQpIGFsbCBoYXZlIHRoZSBzYW1lIHJlcXVpcmVtZW50cy4KPiA+
ID4gPiBEaWQgSSBtaXNzIHNvbWV0aGluZz8KPiA+ID4KPiA+ID4gSXQncyBlbm91Z2ggdG8gaGF2
ZSBvbmUgYXJjaGl0ZWN0dXJlIHdpdGggZGlmZmVyZW50IGNvbnN0cmFpbnMgZm9yIGtwcm9iZXMK
PiA+ID4gYW5kIGJwZiB0byB3YXJyYW50IGEgdHlwZSBmb3IgZWFjaC4KPiA+Cj4gPiBBRkFJQ1Qs
IHNvbWUgb2YgdGhlc2UgY29uc3RyYWludHMgY2FuIGJlIGNoYW5nZWQgd2l0aG91dCB0b28gbXVj
aCB3b3JrLgo+Cj4gQnV0IHdoeT8KPiBJIGhvbmVzdGx5IGRvbid0IHVuZGVyc3RhbmQgd2hhdCBh
cmUgeW91IHRyeWluZyB0byBvcHRpbWl6ZSBoZXJlLiBBIGZldwo+IGxpbmVzIG9mIGluaXRpYWxp
emF0aW9uIGluIGV4ZWNtZW1faW5mbz8KCklJVUMsIGhhdmluZyBzZXBhcmF0ZSBFWEVDTUVNX0JQ
RiBhbmQgRVhFQ01FTV9LUFJPQkUgbWFrZXMgaXQKaGFyZGVyIGZvciBicGYgYW5kIGtwcm9iZSB0
byBzaGFyZSB0aGUgc2FtZSBST1ggcGFnZS4gSW4gbWFueSB1c2UgY2FzZXMsCmEgMk1pQiBwYWdl
IChhc3N1bWluZyB4ODZfNjQpIGlzIGVub3VnaCBmb3IgYWxsIEJQRiwga3Byb2JlLCBmdHJhY2Us
IGFuZAptb2R1bGUgdGV4dC4gSXQgaXMgbm90IGVmZmljaWVudCBpZiB3ZSBoYXZlIHRvIGFsbG9j
YXRlIHNlcGFyYXRlIHBhZ2VzIGZvciBlYWNoCm9mIHRoZXNlIHVzZSBjYXNlcy4gSWYgdGhpcyBp
cyBub3QgYSBwcm9ibGVtLCB0aGUgY3VycmVudCBhcHByb2FjaCB3b3Jrcy4KClRoYW5rcywKU29u
ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
