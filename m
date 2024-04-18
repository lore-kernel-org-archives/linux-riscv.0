Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C912C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 10:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u3Y5e4nU5UXHJxP2vw2Ibp2/jpVa/NW8HM5b02lIHlA=; b=aGM+MYv37EhAmd
	Z0pk7TTF29/f9eq85VD7uSpma4dorES/PB/c3Az5Px8QU51Y8EzBHy99On3za9UOAtWpEWbewiaeh
	Bb/yuUW0C6zXVURHHSzCxOJPwNaTFmrQN75DXH9AOpIcOs20TodwQkcGRu2e2Y6716DsqvRnEMEO8
	1VbEOt2w5rsvM/lLbQd1mE55q3Z2nhLrXjhgtAZ4Blc1JlaYNouxZGVJ4N4LffNEdDY4Jhj2hK+6C
	WzVzLaJ5rHuP4KeqRueToRpaP0Gg6WpT6KbyYqSEjuz404O6N9VxQJFL4waxnkZbHwV/zg4Jhw85E
	ZsjZgNffzTQJRGYReYCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOtg-00000001mDg-0yCl;
	Thu, 18 Apr 2024 10:21:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOtb-00000001mB5-2fwJ;
	Thu, 18 Apr 2024 10:21:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E10D617AF;
	Thu, 18 Apr 2024 10:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE78C113CC;
	Thu, 18 Apr 2024 10:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713435694;
	bh=GIF39x+DoxCddvDNRomXCworfiQAca8ygUjDy3+kOkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SELAoNeXc3Beu0HbaRnXjo5QYZwKVoBtQiv3DGWKIGD1ByoQxYtKIRMmvzmqWXRIs
	 l28WXlrgf45drPhQ9fcY+C862qqlcZ84I3lISaD2oLaKCzcGbAykPBulJ9k6bwvlRz
	 LV8NaKjnWubu4ei2CwJbivkB4YEQEKSRsSyVzaW8Mxs5W6YReOjEi+EuEAD86bBnwS
	 qFPhIxsVlHHsOebyI08OR68Lghu75Srbh8a5UrbpGFwRlRYkMIVyzmMjHu+Dqlrqq9
	 fLqc6ctyg9Ep6vn3VgTN09QBUzcZ5AVisQI/jdvTkZRhUWxPwNNaW0QWW5GqKdhOFZ
	 JlWziN6p3qThQ==
Date: Thu, 18 Apr 2024 13:20:17 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Nadav Amit <nadav.amit@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>, Helge Deller <deller@gmx.de>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	the arch/x86 maintainers <x86@kernel.org>
Subject: Re: [RFC PATCH 3/7] module: prepare to handle ROX allocations for
 text
Message-ID: <ZiDz4YbIHEOAnpwF@kernel.org>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-4-rppt@kernel.org>
 <0C4B9C1A-97DE-4798-8256-158369AF42A4@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0C4B9C1A-97DE-4798-8256-158369AF42A4@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_032135_774272_8EC35C40 
X-CRM114-Status: GOOD (  18.27  )
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

T24gVHVlLCBBcHIgMTYsIDIwMjQgYXQgMTI6MzY6MDhQTSArMDMwMCwgTmFkYXYgQW1pdCB3cm90
ZToKPiAKPiAKPiA+IE9uIDExIEFwciAyMDI0LCBhdCAxOTowNSwgTWlrZSBSYXBvcG9ydCA8cnBw
dEBrZXJuZWwub3JnPiB3cm90ZToKPiA+IAo+ID4gQEAgLTI0NDAsNyArMjQ3OSwyNCBAQCBzdGF0
aWMgaW50IHBvc3RfcmVsb2NhdGlvbihzdHJ1Y3QgbW9kdWxlICptb2QsIGNvbnN0IHN0cnVjdCBs
b2FkX2luZm8gKmluZm8pCj4gPiAJYWRkX2thbGxzeW1zKG1vZCwgaW5mbyk7Cj4gPiAKPiA+IAkv
KiBBcmNoLXNwZWNpZmljIG1vZHVsZSBmaW5hbGl6aW5nLiAqLwo+ID4gLQlyZXR1cm4gbW9kdWxl
X2ZpbmFsaXplKGluZm8tPmhkciwgaW5mby0+c2VjaGRycywgbW9kKTsKPiA+ICsJcmV0ID0gbW9k
dWxlX2ZpbmFsaXplKGluZm8tPmhkciwgaW5mby0+c2VjaGRycywgbW9kKTsKPiA+ICsJaWYgKHJl
dCkKPiA+ICsJCXJldHVybiByZXQ7Cj4gPiArCj4gPiArCWZvcl9lYWNoX21vZF9tZW1fdHlwZSh0
eXBlKSB7Cj4gPiArCQlzdHJ1Y3QgbW9kdWxlX21lbW9yeSAqbWVtID0gJm1vZC0+bWVtW3R5cGVd
Owo+ID4gKwo+ID4gKwkJaWYgKG1lbS0+aXNfcm94KSB7Cj4gPiArCQkJaWYgKCFleGVjbWVtX3Vw
ZGF0ZV9jb3B5KG1lbS0+YmFzZSwgbWVtLT5yd19jb3B5LAo+ID4gKwkJCQkJCSBtZW0tPnNpemUp
KQo+ID4gKwkJCQlyZXR1cm4gLUVOT01FTTsKPiA+ICsKPiA+ICsJCQl2ZnJlZShtZW0tPnJ3X2Nv
cHkpOwo+ID4gKwkJCW1lbS0+cndfY29weSA9IE5VTEw7Cj4gPiArCQl9Cj4gPiArCX0KPiA+ICsK
PiA+ICsJcmV0dXJuIDA7Cj4gPiB9Cj4gCj4gSSBtaWdodCBiZSBtaXNzaW5nIHNvbWV0aGluZywg
YnV0IGl0IHNlZW1zIGEgYml0IHJhY3kuCj4gCj4gSUlVQywgbW9kdWxlX2ZpbmFsaXplKCkgY2Fs
bHMgYWx0ZXJuYXRpdmVzX3NtcF9tb2R1bGVfYWRkKCkuIEF0IHRoaXMKPiBwb2ludCwgc2luY2Ug
eW91IGRvbuKAmXQgaG9sZCB0aGUgdGV4dF9tdXRleCwgc29tZSBtaWdodCBkbyB0ZXh0X3Bva2Uo
KSwKPiBlLmcuLCBieSBlbmFibGluZy9kaXNhYmxpbmcgc3RhdGljLWtleSwgYW5kIHRoZSB1cGRh
dGUgd291bGQgYmUKPiBvdmVyd3JpdHRlbi4gTm8/CgpSaWdodCA6KApFdmVuIHdvcnNlLCBmb3Ig
VVAgY2FzZSBhbHRlcm5hdGl2ZXNfc21wX3VubG9jaygpIHdpbGwgInBhdGNoIiBzdGlsbCBlbXB0
eQphcmVhLgoKU28gSSdtIHRoaW5raW5nIGFib3V0IGNhbGxpbmcgYWx0ZXJuYXRpdmVzX3NtcF9t
b2R1bGVfYWRkKCkgZnJvbSBhbgphZGRpdGlvbmFsIGNhbGxiYWNrIGFmdGVyIHRoZSBleGVjbWVt
X3VwZGF0ZV9jb3B5KCkuCgpEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8geW91PwoKLS0gClNpbmNlcmVs
eSB5b3VycywKTWlrZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
