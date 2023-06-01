Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1441AC7EE32
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 22:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5/inQJ3uO0Qn6nrnV2HykFaDevtiYjnh9Zgt/lPM2Zo=; b=gPHeSjBeMpO3nX
	E2bO/EGfopHTyOhQdFlIjLOi4Bk6yiqWGL4c2JTSJksHvaYjJSmlW3otPUXyOG3EKOYBBm+aWMGdR
	3bIxzJ9CxM/fts8lv8nWLEBJq6b1Xk7lpXxLDanvfyvX/tDismUu1r5H6ISg3TLiKBh0CL6KHC+cO
	h+5tPIDIDc8mFQCSvPBOCnUD+RvBfG8GyeAc3bDDEkVCyQ6aZ9u8JSR5gqn02Y5pKvLR2XhlhrWu1
	UIvAJytgpQijh+yPHbneWHOMFk86YBzL4+HVobERlEWzmitBxSFeTo2RklCtu/+j0O0evrGpbtmtn
	j5E/b8XNgZk0VBhnEmyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4r7F-005AuS-0a;
	Thu, 01 Jun 2023 22:49:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4r7C-005AtT-1J;
	Thu, 01 Jun 2023 22:49:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A327364A50;
	Thu,  1 Jun 2023 22:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12018C4339B;
	Thu,  1 Jun 2023 22:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685659793;
	bh=s5scddDgq8SCu6I0UWPQExKWJjas9UFzehdQi3Sw4tA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K25ToaEbCp02bMG+wiJikwHyiXiwwQBkm/MmN8qlrLj5yam240H0kFAxxnFa3RlG8
	 bu4BSS/frooyZ20B2VklohnrYULCfishpBQ/wfdUaMkt+oR8gS4E1+AjfNshKja3vS
	 Rv+moH0Y5isDfBQyF8Rj722+0entBKGogJrcfr++cvzRmW73HdsIB35hoxtRn829Ae
	 fyn3i/1QAGvtS1oiJarw65vHM76zJn0jBvddq9Vcz7E6Icr7CQW2U08iG1Oryzm6d3
	 58DCK+DxQNJ2Qn/JWEej+n8GVZwut1/xKU3k6dkfSYsQUQ9uCCopruEXev0WWNFxor
	 G4HpcCwxRlB1w==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f4f757d575so1925326e87.0;
        Thu, 01 Jun 2023 15:49:52 -0700 (PDT)
X-Gm-Message-State: AC+VfDzwsnq53CWE5Wf7J+mmdf9csUcouyB0J2yrTAj677QhB6Z097d1
	8KSwrowkYYt1gB8ZlTV3EIVmhsQKiOk32DipSIg=
X-Google-Smtp-Source: ACHHUZ4uA6ym60CkoL3kD4Xme876wGBHsdD1XRoswJZBV/GnrkgRlI3npJzU+tR131QuPJoGC+7UxG4nzuqJElDeBo4=
X-Received: by 2002:ac2:4a8b:0:b0:4f3:aa81:2a6e with SMTP id
 l11-20020ac24a8b000000b004f3aa812a6emr364328lfp.19.1685659791105; Thu, 01 Jun
 2023 15:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org> <20230601101257.530867-13-rppt@kernel.org>
In-Reply-To: <20230601101257.530867-13-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 1 Jun 2023 15:49:39 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4Q2d7=7yBMQLgz+7Bz_q==_F+N3C8O4LStXva73ECCTg@mail.gmail.com>
Message-ID: <CAPhsuW4Q2d7=7yBMQLgz+7Bz_q==_F+N3C8O4LStXva73ECCTg@mail.gmail.com>
Subject: Re: [PATCH 12/13] x86/jitalloc: prepare to allocate exectuatble
 memory as ROX
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_154954_523164_077F8F56 
X-CRM114-Status: GOOD (  18.14  )
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

T24gVGh1LCBKdW4gMSwgMjAyMyBhdCAzOjE14oCvQU0gTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEZyb206IFNvbmcgTGl1IDxzb25nQGtlcm5lbC5vcmc+Cj4KPiBS
ZXBsYWNlIGRpcmVjdCBtZW1vcnkgd3JpdGVzIHRvIG1lbW9yeSBhbGxvY2F0ZWQgZm9yIGNvZGUg
d2l0aCB0ZXh0IHBva2luZwo+IHRvIGFsbG93IGFsbG9jYXRpb24gb2YgZXhlY3V0YWJsZSBtZW1v
cnkgYXMgUk9YLgo+Cj4gVGhlIG9ubHkgZXhjZXB0aW9uIGlzIGFyY2hfcHJlcGFyZV9icGZfdHJh
bXBvbGluZSgpIHRoYXQgY2Fubm90IGppdAo+IGRpcmVjdGx5IGludG8gbW9kdWxlIG1lbW9yeSB5
ZXQsIHNvIGl0IHVzZXMgc2V0X21lbW9yeSBjYWxscyB0bwo+IHVucHJvdGVjdCB0aGUgbWVtb3J5
IGJlZm9yZSB3cml0aW5nIHRvIGl0IGFuZCB0byBwcm90ZWN0IG1lbW9yeSBpbiB0aGUKPiBlbmQu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBTb25nIExpdSA8c29uZ0BrZXJuZWwub3JnPgo+IENvLWRldmVs
b3BlZC1ieTogTWlrZSBSYXBvcG9ydCAoSUJNKSA8cnBwdEBrZXJuZWwub3JnPgo+IFNpZ25lZC1v
ZmYtYnk6IE1pa2UgUmFwb3BvcnQgKElCTSkgPHJwcHRAa2VybmVsLm9yZz4KPiAtLS0KPiAgYXJj
aC94ODYva2VybmVsL2FsdGVybmF0aXZlLmMgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLQo+ICBhcmNoL3g4Ni9rZXJuZWwvZnRyYWNlLmMgICAgICB8IDQxICsrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICBhcmNoL3g4Ni9rZXJuZWwvbW9kdWxlLmMgICAg
ICB8IDI0ICsrKysrLS0tLS0tLS0tLS0tLS0KPiAgYXJjaC94ODYva2VybmVsL3N0YXRpY19jYWxs
LmMgfCAxMCArKysrLS0tLQo+ICBhcmNoL3g4Ni9rZXJuZWwvdW53aW5kX29yYy5jICB8IDEzICsr
KysrKystLS0tCj4gIGFyY2gveDg2L25ldC9icGZfaml0X2NvbXAuYyAgIHwgMjIgKysrKysrKysr
KysrKy0tLS0tCgpXZSBuZWVkIHRoZSBmb2xsb3dpbmcgaW4gdGhpcyBwYXRjaCAob3IgYmVmb3Jl
IHRoaXMgcGF0Y2gpLgpPdGhlcndpc2UsIHRoZSBzeXN0ZW0gd2lsbCBjcmFzaCBhdCB0aGUgVklS
VFVBTF9CVUdfT04oKQppbiB2bWFsbG9jX3RvX3BhZ2UoKS4KClRoYW5rcywKU29uZwoKZGlmZiAt
LWdpdCBhL2tlcm5lbC9icGYvY29yZS5jIGIva2VybmVsL2JwZi9jb3JlLmMKaW5kZXggYmY5NTRk
MjcyMWMxLi40ZWZhOGE3OTVlYmMgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9icGYvY29yZS5jCisrKyBi
L2tlcm5lbC9icGYvY29yZS5jCkBAIC0xMDg0LDcgKzEwODQsNyBAQCBicGZfaml0X2JpbmFyeV9w
YWNrX2FsbG9jKHVuc2lnbmVkIGludCBwcm9nbGVuLAp1OCAqKmltYWdlX3B0ciwKICAgICAgICAg
ICAgICAgIHJldHVybiBOVUxMOwogICAgICAgIH0KCi0gICAgICAgKnJ3X2hlYWRlciA9IGt2bWFs
bG9jKHNpemUsIEdGUF9LRVJORUwpOworICAgICAgICpyd19oZWFkZXIgPSBrdnphbGxvYyhzaXpl
LCBHRlBfS0VSTkVMKTsKICAgICAgICBpZiAoISpyd19oZWFkZXIpIHsKICAgICAgICAgICAgICAg
IGJwZl9hcmNoX3RleHRfY29weSgmcm9faGVhZGVyLT5zaXplLCAmc2l6ZSwgc2l6ZW9mKHNpemUp
KTsKICAgICAgICAgICAgICAgIGJwZl9wcm9nX3BhY2tfZnJlZShyb19oZWFkZXIpOwpAQCAtMTA5
Miw4ICsxMDkyLDYgQEAgYnBmX2ppdF9iaW5hcnlfcGFja19hbGxvYyh1bnNpZ25lZCBpbnQgcHJv
Z2xlbiwKdTggKippbWFnZV9wdHIsCiAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKICAgICAg
ICB9CgotICAgICAgIC8qIEZpbGwgc3BhY2Ugd2l0aCBpbGxlZ2FsL2FyY2gtZGVwIGluc3RydWN0
aW9ucy4gKi8KLSAgICAgICBicGZfZmlsbF9pbGxfaW5zbnMoKnJ3X2hlYWRlciwgc2l6ZSk7CiAg
ICAgICAgKCpyd19oZWFkZXIpLT5zaXplID0gc2l6ZTsKCiAgICAgICAgaG9sZSA9IG1pbl90KHVu
c2lnbmVkIGludCwgc2l6ZSAtIChwcm9nbGVuICsgc2l6ZW9mKCpyb19oZWFkZXIpKSwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
