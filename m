Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943EBC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 18:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nlI7S1/Ai0ChC36vWZqdy23xJ5aXtNEzppKeDt3a8G0=; b=po7qKgo1I7WrX0
	LkOhFqVqkxCJGbIIgR8yut+34tCADSe3a0RcKFPxQktKFHigFj2+R/scnM5pAz3RJp54uwM9d6Rwt
	7NOrnTTlQtECKe9aC0PdnA/LCblo6nQkktZ+JBuHHYIrakx/cZyxGtjLk7XzoVuZUSnHgXGdC3TAM
	RwLxSEuWtKYpwinmFfX7uf+ChavEWxOCn0mQxLoYgBSvu9b4wqJ7SGk+uPtai/5eo0/p0A1uXkw+U
	8utdMT1LnRQuTexTWatN5uewGe8TyeadQEhNLdJ7FKgD7hNBp9S8P9WyMPbbwU5lg3m7dzGtsnUvD
	adneIElnLyqqaPlIHGQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryyT5-0000000Ec1S-2vGa;
	Mon, 22 Apr 2024 18:32:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryyT1-0000000Ebzk-3SkR;
	Mon, 22 Apr 2024 18:32:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 87D9FCE068F;
	Mon, 22 Apr 2024 18:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD33C32781;
	Mon, 22 Apr 2024 18:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713810756;
	bh=41bQmayZLa9F2TS6BjEFSDm7V8S6LLEq/o95h7wxG6E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qA68HtY8VqgqRqZf2Z+BRxEGJ87lJdUCx6Osh8gSscfIYLuwih8LbbcRjgeSN72TL
	 Xw4JdoR+vqq1sJrywF+UW6jt11XxxAfhRX5vf+4P5PZXOtwSy4cCuAVWYzrkNtfZFY
	 RJi50MG1o3p5BPD9oDayagmrPVMy0EhVLAw/pglX6Uo5PAN1xX+pidD1GnidGKtKn6
	 ykB1LL+ua/PB+25yLvCBTFxFBB/U4R1LEgj+l7TftBqPQ+Ztyd7hEVqFG/2O36A5Z1
	 UjuZ6JKnGq1s27TbSA3JcyRLnCb+mXgDdhxyZJYk3N/4rAuQbLQhxxn1GV+slKtDRx
	 DyT9rgFt2Zekg==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-571c22d9de4so6379259a12.3;
        Mon, 22 Apr 2024 11:32:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsDMylRqNncLgmPiQTlvwHGhDyvg2oabA89V2vFariF4uHKzu9LuRjz66D7Hi5oUgsFzl3pbGS64H0b8zGylqsORjeR6OVTKT6Bsxv14GVVa4ID2sBTgzRldFt8+aWTRC48pcD14hB/7ByAVee77665zkuMYQ=
X-Gm-Message-State: AOJu0Ywo9uVuyBxB4K7CwnKHAJH3h3zypXlicqRFWgB/x19poEWs5dEZ
	Be0Q3raFXQsv7vlweHOzxuKbfVmLg8lLAphKshtjI875le8Zn+yMQi2GIkLMmGteHk5Ialw3qU7
	lzOMfn0V8Q2AVmC5464OZtKyls1k=
X-Google-Smtp-Source: AGHT+IEL0FWUHmCKYIOk93aax6U4BdFHP3q3Bogcq6+CoScwmomqpj0/rB2eiX3SYQzXlZuuQSNAuqDXXtIwEOxd65Y=
X-Received: by 2002:a2e:9496:0:b0:2d8:1d29:23a8 with SMTP id
 c22-20020a2e9496000000b002d81d2923a8mr6582027ljh.29.1713810734431; Mon, 22
 Apr 2024 11:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <ZiE91CJcNw7gBj9g@kernel.org> <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
 <ZiFd567L4Zzm2okO@kernel.org> <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
 <ZiIVVBgaDN4RsroT@kernel.org> <CAPhsuW7WoU+a46FhqqH8f-3=ehxeD4wSgKDWegMin1pT49OSWw@mail.gmail.com>
 <ZiKjmaDgz_56ovbv@kernel.org> <CAPhsuW7Nj1Sa_9xQtTgHz9AmX39zdh2x2COqA-qmkfpfX9hNWw@mail.gmail.com>
 <ZiLNGgVSQ7_cg58y@kernel.org> <CAPhsuW4KRM4O4RFbYQrt=Coqyh9w29WiF2YF=8soDfauLFsKBA@mail.gmail.com>
 <ZiNDGjkcqEPqruza@kernel.org> <20240420181121.d6c7be11a6f98dc2462f8b41@kernel.org>
In-Reply-To: <20240420181121.d6c7be11a6f98dc2462f8b41@kernel.org>
From: Song Liu <song@kernel.org>
Date: Mon, 22 Apr 2024 11:32:02 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5RYfq8FOtMkO69cdQ3Bc1p2kQPWE2crts1UMhqJr+7sQ@mail.gmail.com>
Message-ID: <CAPhsuW5RYfq8FOtMkO69cdQ3Bc1p2kQPWE2crts1UMhqJr+7sQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Bjorn Topel <bjorn@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller" <davem@davemloft.net>, 
	Dinh Nguyen <dinguyen@kernel.org>, Donald Dutile <ddutile@redhat.com>, 
	Eric Chanudet <echanude@redhat.com>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Luis Chamberlain <mcgrof@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nadav Amit <nadav.amit@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Puranjay Mohan <puranjay12@gmail.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Russell King <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, bpf@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_113240_467756_A988DD11 
X-CRM114-Status: GOOD (  26.90  )
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

SGkgTWFzYW1pIGFuZCBNaWtlLAoKT24gU2F0LCBBcHIgMjAsIDIwMjQgYXQgMjoxMeKAr0FNIE1h
c2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+IHdyb3RlOgpbLi4uXQo+ID4gPgo+
ID4gPiBJSVVDLCB3ZSBuZWVkIHRvIHVwZGF0ZSBfX2V4ZWNtZW1fY2FjaGVfYWxsb2MoKSB0byB0
YWtlIGEgcmFuZ2UgcG9pbnRlciBhcwo+ID4gPiBpbnB1dC4gbW9kdWxlIHRleHQgd2lsbCB1c2Ug
InJhbmdlIiBmb3IgRVhFQ01FTV9NT0RVTEVfVEVYVCwgd2hpbGUga3Byb2JlCj4gPiA+IHdpbGwg
dXNlICJyYW5nZSIgZm9yIEVYRUNNRU1fS1BST0JFLiBXaXRob3V0ICJtYXAgdG8iIGNvbmNlcHQg
b3Igc2hhcmluZwo+ID4gPiB0aGUgInJhbmdlIiBvYmplY3QsIHdlIHdpbGwgaGF2ZSB0byBjb21w
YXJlIGRpZmZlcmVudCByYW5nZSBwYXJhbWV0ZXJzIHRvIGNoZWNrCj4gPiA+IHdlIGNhbiBzaGFy
ZSBjYWNoZWQgcGFnZXMgYmV0d2VlbiBtb2R1bGUgdGV4dCBhbmQga3Byb2JlLCB3aGljaCBpcyBu
b3QKPiA+ID4gZWZmaWNpZW50LiBEaWQgSSBtaXNzIHNvbWV0aGluZz8KPgo+IFNvbmcsIHRoYW5r
cyBmb3IgdHJ5aW5nIHRvIGVwbGFpbi4gSSB0aGluayBJIG5lZWQgdG8gZXhwbGFpbiB3aHkgSSB1
c2VkCj4gbW9kdWxlX2FsbG9jKCkgb3JpZ2luYWxseS4KPgo+IFRoaXMgZGVwZW5kcyBvbiBob3cg
a3Byb2JlIGZlYXR1cmVzIGFyZSBpbXBsZW1lbnRlZCBvbiB0aGUgYXJjaGl0ZWN0dXJlLCBhbmQK
PiBob3cgbXVjaCBmZWF0dXJlcyBhcmUgc3VwcG9ydGVkIG9uIGtwcm9iZXMuCj4KPiBCZWNhdXNl
IGtwcm9iZSBqdW1wIG9wdGltaXphdGlvbiBhbmQga3Byb2JlIGp1bXAtYmFjayBvcHRpbWl6YXRp
b24gbmVlZCB0bwo+IHVzZSBhIGp1bXAgaW5zdHJ1Y3Rpb24gdG8ganVtcCBpbnRvIHRoZSB0cmFt
cG9saW5lIGFuZCBqdW1wIGJhY2sgZnJvbSB0aGUKPiB0cmFtcG9saW5lIGRpcmVjdGx5LCBpZiB0
aGUgYXJjaGl0ZWN1dHVyZSBqbXAgaW5zdHJ1Y3Rpb24gc3VwcG9ydHMgKy0yR0IgcmFuZ2UKPiBs
aWtlIHg4NiwgaXQgbmVlZHMgdG8gYWxsb2NhdGUgdGhlIHRyYW1wb2xpbmUgYnVmZmVyIGluc2lk
ZSBzdWNoIGFkZHJlc3Mgc3BhY2UuCj4gVGhpcyByZXF1aXJlbWVudCBpcyBzaW1pbGFyIHRvIHRo
ZSBtb2R1bGVzIChiZWNhdXNlIG1vZHVsZSBmdW5jdGlvbiBuZWVkcyB0bwo+IGNhbGwgb3RoZXIg
ZnVuY3Rpb25zIGluIHRoZSBrZXJuZWwgZXRjLiksIGF0IGxlYXN0IGtwcm9iZXMgb24geDg2IHVz
ZWQKPiBtb2R1bGVfYWxsb2MoKS4KPgo+IEhvd2V2ZXIsIGlmIGFuIGFyY2hpdGVjdHVyZSBvbmx5
IHN1cHBvcnRzIGJyZWFrcG9pbnQvdHJhcCBiYXNlZCBrcHJvYmUsCj4gaXQgZG9lcyBub3QgbmVl
ZCB0byBjb25zaWRlciB3aGV0aGVyIHRoZSBleGVjbWVtIGlzIGFsbG9jYXRlZC4KPgo+ID4KPiA+
IFdlIGNhbiBhbHdheXMgc2hhcmUgbGFyZ2UgUk9YIHBhZ2VzIGFzIGxvbmcgYXMgdGhleSBhcmUg
d2l0aGluIHRoZSBjb3JyZWN0Cj4gPiBhZGRyZXNzIHNwYWNlLiBUaGUgcGVybWlzc2lvbnMgZm9y
IHRoZW0gYXJlIFJPWCBhbmQgdGhlIGFsaWdubWVudAo+ID4gZGlmZmVyZW5jZXMgYXJlIGR1ZSB0
byBLQVNBTiBhbmQgdGhpcyBpcyBoYW5kbGVkIGR1cmluZyBhbGxvY2F0aW9uIG9mIHRoZQo+ID4g
bGFyZ2UgcGFnZSB0byByZWZpbGwgdGhlIGNhY2hlLiBfX2V4ZWNtZW1fY2FjaGVfYWxsb2MoKSBv
bmx5IG5lZWRzIHRvIGxpbWl0Cj4gPiB0aGUgc2VhcmNoIGZvciB0aGUgYWRkcmVzcyBzcGFjZSBv
ZiB0aGUgcmFuZ2UuCj4KPiBTbyBJIGRvbid0IHRoaW5rIEVYRUNNRU1fS1BST0JFIGFsd2F5cyBz
YW1lIGFzIEVYRUNNRU1fTU9EVUxFX1RFWFQsIGl0Cj4gc2hvdWxkIGJlIGNvbmZpZ3VyZWQgZm9y
IGVhY2ggYXJjaC4gRXNwZWNpYWxseSwgaWYgaXQgaXMgb25seSB1c2VkIGZvcgo+IHNlYXJjaGlu
ZyBwYXJhbWV0ZXIsIGl0IGxvb2tzIE9LIHRvIG1lLgoKVGhhbmtzIGZvciB0aGUgZXhwbGFuYXRp
b24hCgpJIHdhcyB0aGlua2luZyAid2UgY2FuIGhhdmUgRVhFQ01FTV9LUFJPQkUgc2hhcmUgdGhl
IHNhbWUgcGFyYW1ldGVycyBhcwpFWEVDTUVNX01PRFVMRV9URVhUIGZvciBhbGwgYXJjaGl0ZWN0
dXJlcyIuIEJ1dCB0aGlzIHRob3VnaHQgaXMgYnVpbHQgb24gdG9wCm9mIGFzc3VtcHRpb25zIG9u
IGZ1dHVyZSBjaGFuZ2VzL2ltcHJvdmVtZW50cyB3aXRoaW4gbXVsdGlwbGUgc3ViIHN5c3RlbXMu
CkF0IHRoaXMgbW9tZW50LCBJIGhhdmUgbm8gb2JqZWN0aW9ucyBtb3ZpbmcgZm9yd2FyZCB3aXRo
IGN1cnJlbnQgZXhlY21lbSBBUElzLgoKVGhhbmtzLApTb25nCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
