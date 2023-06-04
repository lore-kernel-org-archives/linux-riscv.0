Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9286C7EE29
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 21:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fzcm3id46tYWqUqARpg299cWQFUoL5SweQJxw8P2bcM=; b=2zL0qjf76A4FSe
	+Pl0HV0rXRDz1HAc98/rODOkEgRBmZsenUuUgQFt4NWSfA+LsfNSAgmHXlq5/3zo3knL35XTEpYJB
	6IgW/GKzRT12W1qgMst1Ls5QA0V5lo4T2UvKOPcrPW0n+DTp8e6VoKLR1vqk8/GF7PKS4ppoTf6HB
	REn/apyN6ToiZzGzABYdwwcLHj63ropft9Q2kPSKgY2nul+Awrx3LJX5d2d6jlx0vVcxIGBctNZyE
	yI4bikE+J64w978aD4uC0FWmMJPgYrlKM72xnVvoTf7i7bPAAHbKZvyMlaUUd00PPEoRtZ70MudL/
	cKjgN9c/gmepXHQVIvzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5vBa-00D8hA-0F;
	Sun, 04 Jun 2023 21:22:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5vBX-00D8fe-0F;
	Sun, 04 Jun 2023 21:22:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 90C9F6154A;
	Sun,  4 Jun 2023 21:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794CAC433A1;
	Sun,  4 Jun 2023 21:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685913764;
	bh=M3qa4JrCJfL3BlNTay6Yo1EjRS0Ncm+BgXInegps46U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b7/fXotn0pQEscndihWizAxU7LQa5dSl44a9/klsWVyS0lxz/8hzxSa2IZZsjsxfX
	 r+NUkhYWfR+U4pM6AYQOSE7NKbAlOja0TNvz5m0DUEI1zWFDSIkNTecITt/pEkmEGw
	 J/i1EcDni6ZWXfMClgL03G31hjpaAYBpUerxaCwWdNhFcQlLqMtUbQhIMCbcYDNWvU
	 UhGMgdB0T5xWi5hDLtX6T9Luh2uONUrqL+9je7Lg6uu0df3kWNPuh+zhJ8FFH8haNG
	 M5E3S5UelWImxtKzuetFx71eO1My6o4ugA9ZPA9fKjM0HrHilfHJ2bhtk0fdh1FBN/
	 wGD7X3O1e8t2w==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f6195d2b3fso1759133e87.1;
        Sun, 04 Jun 2023 14:22:44 -0700 (PDT)
X-Gm-Message-State: AC+VfDyc8ZaT41Bi87QZ6Zso9eJfb3M1w2sJOkfuvkVM/T9NRkZK0qoi
	Lf48aC05QgbpgeaoreT4kgjUHcbo3LKQk7/eKUc=
X-Google-Smtp-Source: ACHHUZ60WLRim/NZBMM58ZYdg3/lDfHnTA86A+7CXA+1QyWmoNPWXKyb36vAONlyven1Wz2rt1eY822fjimBjrUI6Ak=
X-Received: by 2002:ac2:5d6c:0:b0:4f2:4df1:f071 with SMTP id
 h12-20020ac25d6c000000b004f24df1f071mr4227167lft.51.1685913762272; Sun, 04
 Jun 2023 14:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org> <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan> <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
 <CAPhsuW7Euczff_KB70nuH=Hhf2EYHAf=xiQR7mFqVfByhD34XA@mail.gmail.com> <ZHzRxE5V6YzGVsHy@moria.home.lan>
In-Reply-To: <ZHzRxE5V6YzGVsHy@moria.home.lan>
From: Song Liu <song@kernel.org>
Date: Sun, 4 Jun 2023 14:22:30 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7iEDa44jxc_7Cj4KnVhtct-UTO2JtVK-U7o2ynn2iX8Q@mail.gmail.com>
Message-ID: <CAPhsuW7iEDa44jxc_7Cj4KnVhtct-UTO2JtVK-U7o2ynn2iX8Q@mail.gmail.com>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Mark Rutland <mark.rutland@arm.com>, Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller" <davem@davemloft.net>, 
	Dinh Nguyen <dinguyen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, 
	Puranjay Mohan <puranjay12@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_142247_242451_9B7520AD 
X-CRM114-Status: GOOD (  17.49  )
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

T24gU3VuLCBKdW4gNCwgMjAyMyBhdCAxMTowMuKAr0FNIEtlbnQgT3ZlcnN0cmVldAo8a2VudC5v
dmVyc3RyZWV0QGxpbnV4LmRldj4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAwMiwgMjAyMyBhdCAx
MToyMDo1OEFNIC0wNzAwLCBTb25nIExpdSB3cm90ZToKPiA+IElJVUMsIGFybTY0IHVzZXMgVk1B
TExPQyBhZGRyZXNzIHNwYWNlIGZvciBCUEYgcHJvZ3JhbXMuIFRoZSByZWFzb24KPiA+IGlzIGVh
Y2ggQlBGIHByb2dyYW0gdXNlcyBhdCBsZWFzdCA2NGtCIChvbmUgcGFnZSkgb3V0IG9mIHRoZSAx
MjhNQgo+ID4gYWRkcmVzcyBzcGFjZS4gUHVyYW5qYXkgTW9oYW4gKENDJ2VkKSBpcyB3b3JraW5n
IG9uIGVuYWJsaW5nCj4gPiBicGZfcHJvZ19wYWNrIGZvciBhcm02NC4gT25jZSB0aGlzIHdvcmsg
aXMgZG9uZSwgbXVsdGlwbGUgQlBGIHByb2dyYW1zCj4gPiB3aWxsIGJlIGFibGUgdG8gc2hhcmUg
YSBwYWdlLiBXaWxsIHRoaXMgaW1wcm92ZW1lbnQgcmVtb3ZlIHRoZSBuZWVkIHRvCj4gPiBzcGVj
aWZ5IGEgZGlmZmVyZW50IGFkZHJlc3MgcmFuZ2UgZm9yIEJQRiBwcm9ncmFtcz8KPgo+IENhbiB3
ZSBwbGVhc2Ugc3RvcCB3b3JraW5nIG9uIEJQRiBzcGVjaWZpYyBzdWIgcGFnZSBhbGxvY2F0aW9u
IGFuZCBmb2N1cwo+IG9uIGRvaW5nIHRoaXMgaW4gbW0vPyBUaGlzIG5ldmVyIHNob3VsZCBoYXZl
IGJlZW4gaW4gQlBGIGluIHRoZSBmaXJzdAo+IHBsYWNlLgoKVGhhdCB3b3JrIGlzIG1vc3RseSBp
bmRlcGVuZGVudCBvZiB0aGUgYWxsb2NhdG9yIHdvcmsgd2UgYXJlIGRpc2N1c3NpbmcgaGVyZS4K
VGhlIGdvYWwgUHVyYW5qYXkncyB3b3JrIGlzIHRvIGVuYWJsZSB0aGUgYXJtNjQgQlBGIEpJVCBl
bmdpbmUgdG8gdXNlIGEKUk9YIGFsbG9jYXRvci4gVGhlIGFsbG9jYXRvciBjb3VsZCBiZSB0aGUg
YnBmX3Byb2dfcGFjayBhbGxvY2F0b3IsIG9yIGppdGFsbG9jLApvciBtb2R1bGVfYWxsb2NfdHlw
ZS4gUHVyYW5qYXkgaXMgdXNpbmcgYnBmX3Byb2dfYWxsb2MgZm9yIG5vdy4gQnV0IG9uY2UKaml0
YWxsb2Mgb3IgbW9kdWxlX2FsbG9jX3R5cGUgKGVpdGhlciBvbmUpIGlzIG1lcmdlZCwgd2Ugd2ls
bCBtaWdyYXRlIEJQRgpKSVQgZW5naW5lcyAoeDg2XzY0IGFuZCBhcm02NCkgdG8gdGhlIG5ldyBh
bGxvY2F0b3IgYW5kIHRoZW4gdGVhciBkb3duCmJwZl9wcm9nX3BhY2suCgpEb2VzIHRoaXMgbWFr
ZSBzZW5zZT8KClRoYW5rcywKU29uZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
