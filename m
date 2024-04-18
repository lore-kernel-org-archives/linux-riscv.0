Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B558C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 19:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BjwbZ+jWZtBiL8rV8MHMw9Jk6b0uyZaCOie+b4GUb0k=; b=ZBHQVARuC2S4ye
	WYKsu/YBnE8+qIcQxAWHzVZEXh7VstzQxX80Eo5Vj2vnJ8VWhBdQ37Pls+INFsl3nKxdEmoZK6uK1
	Bs6xq5DKM5wjOw4W4K4ZFEQY0jJs9Y2Fdgb618Ar7n2tLgGLgRZ2ae0uyDz/lpp5uTZ06BFjX+1lK
	imwdkMxsj418uhG66yRwzCYKlZuBRvmqrO/lVWbqDiUfPrSVoFGmRpp3RgC9I74o0MZyFkctvHS0Z
	oAndEpsDz110KLV5/yIPcC1gh62Kl0PGn802yOKKO37wmrYzBJOrWqSZf82fTgUGeQsukTPoU/ij5
	ehMqvG+n2/PGyk2xYfAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxXhh-00000003VVU-3IBQ;
	Thu, 18 Apr 2024 19:45:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxXhe-00000003VS4-0RfC;
	Thu, 18 Apr 2024 19:45:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB01D618E2;
	Thu, 18 Apr 2024 19:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87BEC113CC;
	Thu, 18 Apr 2024 19:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713469548;
	bh=dHO0bamdxUUeACG8WtZho+GCcL4yBYsb4entMWbbmyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmVx6dRzicEYeby+eqehWh43quHdNoBbYY/i36pebwlC3hu3ZmeS4VjBXURj7aNy3
	 iceEu2pMqBEVdzfyoNs6zYPwdeFEVjMU4daLSOF+34RPv/VgtKgm1TQzPbhCvKJCzp
	 PwHKW3yddAFwEE2clGQPe9VCz0EWlv35PYz4PkEEkLTMMrd+GAZOMmGABmKaUl5Y8d
	 4udjlt3Z97dUrMWxxJyIATuY3MTqmnZM5WdZYeq2ykeLqUHwwS1ZlLE9RAdOJI4t5m
	 dZHSPXrDPE8q2nmOH9o+Xw5o1ED5ivvKuuyvGRHdoAhgoYmdvYsWWSvRA9smcyAVNW
	 9J1gVzjdVbV+Q==
Date: Thu, 18 Apr 2024 22:44:31 +0300
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
	bpf <bpf@vger.kernel.org>, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	the arch/x86 maintainers <x86@kernel.org>
Subject: Re: [RFC PATCH 3/7] module: [
Message-ID: <ZiF4H5_tGx7woaXH@kernel.org>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-4-rppt@kernel.org>
 <0C4B9C1A-97DE-4798-8256-158369AF42A4@gmail.com>
 <ZiDz4YbIHEOAnpwF@kernel.org>
 <A714B340-9EFB-4F27-9CD6-CFBC1BC9139F@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A714B340-9EFB-4F27-9CD6-CFBC1BC9139F@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_124550_303089_C5F455AF 
X-CRM114-Status: GOOD (  23.67  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMTA6MzE6MTZQTSArMDMwMCwgTmFkYXYgQW1pdCB3cm90
ZToKPiAKPiA+IE9uIDE4IEFwciAyMDI0LCBhdCAxMzoyMCwgTWlrZSBSYXBvcG9ydCA8cnBwdEBr
ZXJuZWwub3JnPiB3cm90ZToKPiA+IAo+ID4gT24gVHVlLCBBcHIgMTYsIDIwMjQgYXQgMTI6MzY6
MDhQTSArMDMwMCwgTmFkYXYgQW1pdCB3cm90ZToKPiA+PiAKPiA+PiAKPiA+PiAKPiA+PiBJIG1p
Z2h0IGJlIG1pc3Npbmcgc29tZXRoaW5nLCBidXQgaXQgc2VlbXMgYSBiaXQgcmFjeS4KPiA+PiAK
PiA+PiBJSVVDLCBtb2R1bGVfZmluYWxpemUoKSBjYWxscyBhbHRlcm5hdGl2ZXNfc21wX21vZHVs
ZV9hZGQoKS4gQXQgdGhpcwo+ID4+IHBvaW50LCBzaW5jZSB5b3UgZG9u4oCZdCBob2xkIHRoZSB0
ZXh0X211dGV4LCBzb21lIG1pZ2h0IGRvIHRleHRfcG9rZSgpLAo+ID4+IGUuZy4sIGJ5IGVuYWJs
aW5nL2Rpc2FibGluZyBzdGF0aWMta2V5LCBhbmQgdGhlIHVwZGF0ZSB3b3VsZCBiZQo+ID4+IG92
ZXJ3cml0dGVuLiBObz8KPiA+IAo+ID4gUmlnaHQgOigKPiA+IEV2ZW4gd29yc2UsIGZvciBVUCBj
YXNlIGFsdGVybmF0aXZlc19zbXBfdW5sb2NrKCkgd2lsbCAicGF0Y2giIHN0aWxsIGVtcHR5Cj4g
PiBhcmVhLgo+ID4gCj4gPiBTbyBJJ20gdGhpbmtpbmcgYWJvdXQgY2FsbGluZyBhbHRlcm5hdGl2
ZXNfc21wX21vZHVsZV9hZGQoKSBmcm9tIGFuCj4gPiBhZGRpdGlvbmFsIGNhbGxiYWNrIGFmdGVy
IHRoZSBleGVjbWVtX3VwZGF0ZV9jb3B5KCkuCj4gPiAKPiA+IERvZXMgaXQgbWFrZSBzZW5zZSB0
byB5b3U/Cj4gCj4gR29pbmcgb3ZlciB0aGUgY29kZSBhZ2FpbiAtIEkgbWlnaHQgaGF2ZSBqdXN0
IGJlZW4gd3Jvbmc6IEkgY29uZnVzZWQgdGhlCj4gYWx0ZXJuYXRpdmVzIGFuZCB0aGUganVtcC1s
YWJlbCBtZWNoYW5pc21zIChhcyB0aGV5IGRvIHNoYXJlIGEgbG90IG9mCj4gY29kZSBhbmQgY2hh
cmFjdGVyaXN0aWNzKS4KPiAKPiBUaGUganVtcC1sYWJlbHMgYXJlIHVwZGF0ZWQgd2hlbiBwcmVw
YXJlX2NvbWluZ19tb2R1bGUoKSBpcyBjYWxsZWQsIHdoaWNoCj4gaGFwcGVucyBhZnRlciBwb3N0
X3JlbG9jYXRpb24oKSBbd2hpY2ggbWVhbnMgdGhleSB3b3VsZCBiZSB1cGRhdGVkIHVzaW5nCj4g
dGV4dF9wb2tlKCkg4oCcaW5lZmZpY2llbnRseeKAnSBidXQgc2hvdWxkIGJlIHNhZmVdLgo+IAo+
IFRoZSDigJxhbHRlcm5hdGl2ZXPigJ0gYXBwZWFyIG9ubHkgdG8gdXNlIHRleHRfcG9rZSgpIChp
biBjb250cmFzdCBmb3IKPiB0ZXh0X3Bva2VfZWFybHkoKSkgZnJvbSB2ZXJ5IHNwZWNpZmljIGZl
dyBmbG93cywgZS5nLiwgCj4gY29tbW9uX2NwdV91cCgpIC0+IGFsdGVybmF0aXZlc19lbmFibGVf
c21wKCkuCj4gCj4gQXJlIHRob3NlIGZsb3dzIHBvc2UgYSBwcm9ibGVtIGFmdGVyIGJvb3Q/CgpZ
ZXMsIGNvbW1vbl9jcHVfdXAgaXMgY2FsbGVkICBvbiBDUFUgaG90cGx1Zywgc28gaXQncyBwb3Nz
aWJsZSB0byBoYXZlIGEKcmFjZSBiZXR3ZWVuIGFsdGVybmF0aXZlc19zbXBfbW9kdWxlX2FkZCgp
IGFuZCBjb21tb25fY3B1X3VwKCkgLT4KYWx0ZXJuYXRpdmVzX2VuYWJsZV9zbXAoKS4KCkFuZCBp
biBVUCBjYXNlIGFsdGVybmF0aXZlc19zbXBfbW9kdWxlX2FkZCgpIHdpbGwgY2FsbAphbHRlcm5h
dGl2ZXNfc21wX3VubG9jaygpIHRoYXQgd2lsbCBwYXRjaCBtb2R1bGUgdGV4dCBiZWZvcmUgaXQg
aXMgdXBkYXRlZC4KCj4gQW55aG93LCBzb3JyeSBmb3IgdGhlIG5vaXNlLgoKT24gdGhlIGNvbnRy
YXJ5LCBJIHdvdWxkIGhhdmUgbWlzc2VkIGl0LgoKLS0gClNpbmNlcmVseSB5b3VycywKTWlrZS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
