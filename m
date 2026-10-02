Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87343CA5FC4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 09:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=npG51dgxNo0askI0cfOacg3oKTQx40N+NisyrnN2lHU=; b=vypAdi2z/LJrI2
	S0Uadu7me/l+C/dmmzlPZc1gmSUSAawXL0t9OsMlTbeJ3BOgzO983IEyNtqDGe4K652LKns5kANu2
	zr7iyU/hufNRYGx6EWWgAntuOoLllr2ldQ300BcQ3WyeiPBPq5/BltwOnrVp2eLM5+BbcoxxSMezM
	LcLyj2pO6wNsklvrkMKBierSIZ18lwFxbNLeA5qmUgl1tcmr2qbzjjsR+0aIso9yEjQJBrBxBPB5c
	Li8Zwm3wE1r6/ORTeRbylaP/yZ9OApqEofYuQbgXMP+G8O5LRj4RsX+cz9zq+KsN8ZDZkZYWa2+nz
	XckpFXovmMgPmwu8yHSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZYn-0000000B8wJ-0eAh;
	Fri, 02 Oct 2026 09:28:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZYl-0000000B8va-2sOT;
	Fri, 02 Oct 2026 09:28:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C3DF60A70;
	Fri,  2 Oct 2026 09:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424F21F000FF;
	Fri,  2 Oct 2026 09:28:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=JXF9aYC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1790933279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dtcin0LGddrGq1z73zXhBfHbevxSulJDQC2ODA9S4LA=;
	b=JXF9aYC9WwUSK4dqsSbWZahQOF5tPs+qWfT6am7iM2kEiqJtJzCVxFzDeTv/m/a4MQVUpO
	GLRdB7QsZbpopzZdWvYR/SsEQbyfmCcXe2exUQZ5/eF4uZWlcciUWsy7qUj8Yd99apyea/
	uqdi3Lw+wZdB/dnq0RpegAZySOW8XXE=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 0f473697 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 2 Oct 2026 09:27:58 +0000 (UTC)
Date: Fri, 2 Oct 2026 11:27:54 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <ar95GsA9liO5Avn1@zx2c4.com>
References: <20260930133813.GA3142230@ax162>
 <ar0a4b9CjL2YHCkY@zx2c4.com>
 <ar0gTS71qxnx9AkW@zx2c4.com>
 <20260930151337.GD3142230@ax162>
 <CAHmME9pA+AntJ6hWoFYpTVjh-NUSd0ZGXp5XiUuhQcq3HjQT3g@mail.gmail.com>
 <ede392d7-3104-4a0f-9fa1-99b22552dcd6@kernel.org>
 <ar4nD8aRH7wEvTMt@zx2c4.com>
 <20261001102059.GA4176271@ax162>
 <ar46ap4jzLWyP92C@zx2c4.com>
 <83a874fb-db66-4dc2-8e14-68c7e28ae27c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83a874fb-db66-4dc2-8e14-68c7e28ae27c@kernel.org>
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

T24gRnJpLCBPY3QgMDIsIDIwMjYgYXQgMTE6MTg6NTFBTSArMDIwMCwgQ2hyaXN0b3BoZSBMZXJv
eSAoQ1MgR1JPVVApIHdyb3RlOgo+IAo+IAo+IExlIDAxLzEwLzIwMjYgw6AgMTI6NDgsIEphc29u
IEEuIERvbmVuZmVsZCBhIMOpY3JpdMKgOgo+ID4gT24gVGh1LCBPY3QgMDEsIDIwMjYgYXQgMTI6
MjA6NTlQTSArMDIwMCwgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6Cj4gPj4gY29udHJvbC4gVGhl
IGNoYW5nZSB0aGF0IGludHJvZHVjZWQgLW1heC1zdG9yZS1tZW1zZXQgb25seSBkaWQgaXQgdG8K
PiA+PiAiYWxsb3cgZmluZS10dW5pbmcgb2YgdGhlIGlubGluaW5nIHRocmVzaG9sZCBmb3IgcGVy
Zm9ybWFuY2UgYW5hbHlzaXMKPiA+PiBhbmQgb3B0aW1pemF0aW9uIi4gSWYgdGhleSBkZWNpZGUg
dG8gcmVtb3ZlIGl0IGZvciB3aGF0ZXZlciByZWFzb24sCj4gPj4gd2UncmUgYmFjayB0byBzcXVh
cmUgb25lLgo+ID4gCj4gPiBJIHN1cHBvc2UgYWxsIHRoZSBtb3JlIHJlYXNvbiB0byBnZXQgLWZp
bmxpbmUtc3RyaW5nb3BzPW1lbXNldCBhZGRlZCB0bwo+ID4gY2xhbmcuIFRoZW4gdGhlIGR1YWwt
ZGVmYXVsdCB0aGluZyB5b3UgY2FtZSB1cCB3aXRoIGJlbG93IHdpbGwgbmF0dXJhbGx5Cj4gPiBz
dGFydCBjaG9vc2luZyB0aGUgZmlyc3Qgb3B0aW9uIHdoZW4gaXQgYmVjb21lcyBhdmFpbGFibGUu
Cj4gPiAKPiA+PiBJIGtub3cgc29tZXRoaW5nIGxpa2UgYmVsb3cgd291bGQgYmUgdWdsaWVyIGR1
ZSB0byB0aGUgaWZkZWYgYnV0IGl0Cj4gPj4gd291bGQgYXZvaWQgY2hhbmdpbmcgYW55dGhpbmcg
Zm9yIEdDQyB3aGlsZSBjbGVhcmluZyB1cCB0aGUgaXNzdWUgYXQKPiA+PiBoYW5kIGZvciBjbGFu
ZyBpbiBhIGd1YXJhbnRlZWQgc3RhYmxlIGFuZCBzdWNjaW5jdCBtYW5uZXIuCj4gPiAKPiA+IEJ1
dCB0aGVuIHdlJ3JlIGJhY2sgdG8gdGhlIGJ5dGUtYnktYnl0ZSBjb2RlZ2VuIHRoYXQgQ2hyaXN0
b3BoZSBwb2ludGVkCj4gPiBvdXQuCj4gPiAgIAo+ID4+IElmIHRoYXQgaXMgbm90IGFjY2VwdGFi
bGUsIHNvbWV0aGluZyBsaWtlIHRoZSBmb2xsb3dpbmcgZG9lcyBhcHBlYXIgdG8KPiA+PiB3b3Jr
IGZvciBtZS4KPiA+IAo+ID4gT2theSwgZ3JlYXQsIGxldCdzIGRvIHRoYXQuCj4gPiAKPiA+IERv
ZXMgdGhpcyBjb21taXQgc2VlbSBva2F5IHdpdGggeW91PyBJIHVzZWQgdGhlIGRpZmYgeW91IHNl
bnQgYmVsb3cgYW5kCj4gPiBhZGp1c3RlZCB0aGUgY29tbWl0IG1lc3NhZ2U6IGh0dHBzOi8vZXVy
MDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdp
dC56eDJjNC5jb20lMkZsaW51eC1ybmclMkZjb21taXQlMkYlM0ZpZCUzRDU2ZmY5NWVlODU3MTUw
NDdlYjViNTIyMDI0Mzc3OGFmNjU3Nzc4YzgmZGF0YT0wNSU3QzAyJTdDY2hyaXN0b3BoZS5sZXJv
eSU0MGNzZ3JvdXAuZXUlN0NkODliNGRlMjJmZjk0YjZiZTcxMjA4ZGYxZmE5ODM5YSU3QzhiODdh
ZjdkODY0NzRkYzc4ZGY0NWY2OWEyMDExYmI1JTdDMCU3QzAlN0M2MzkyNjQ0ODUwNTU0OTAwMjkl
N0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKRmJYQjBlVTFoY0draU9uUnlkV1VzSWxZaU9pSXdM
akF1TURBd01DSXNJbEFpT2lKWGFXNHpNaUlzSWtGT0lqb2lUV0ZwYkNJc0lsZFVJam95ZlElM0Ql
M0QlN0MwJTdDJTdDJTdDJnNkYXRhPVZ4Zjh4UkNkTGF2dHc0RG1pJTJCNDlGWTFsSkRXdG0lMkJq
S3Y3ZjhCeEtUR3E0JTNEJnJlc2VydmVkPTAKPiA+IAo+IAo+IFRoZSBjb21taXQgbWVzc2FnZSBz
YXlzOiBTaW1pbGFybHksIEdDQyBoYXMgLWZpbmxpbmUtc3RyaW5nb3BzPW1lbXNldCB0byAKPiBk
byB0aGUgc2FtZSBbNF0sIHNob3VsZCB0aGlzIGlzc3VlIGV2ZXIgaGl0IGZ1dHVyZSB2ZXJzaW9u
IG9mIEdDQy4KPiAKPiBXaHkgZGVmYXVsdCAiLWZpbmxpbmUtc3RyaW5nb3BzPW1lbXNldCIgaWYg
Cj4gJChjYy1vcHRpb24sLWZpbmxpbmUtc3RyaW5nb3BzPW1lbXNldCksIGhhdmUgd2UgaWRlbnRp
ZmllZCBjYXNlcyB3aGVyZSAKPiBidWlsZCBmYWlsIHdpdGhvdXQgdGhhdCBvciBpcyBpdCBqdXN0
IGZvciBmdXR1cmUgcHJvdmlzaW9uID8KPiAKPiBBcyBzaG93biBpbiBteSBwcmV2aW91cyBlbWFp
bCwgd2l0aCBHQ0MgMTYgb24gcG93ZXJwYzMyIHdlIGdldCBhIAo+IHNsaWdodGx5IGJldHRlciBj
b2RlIHdpdGhvdXQgdGhpcyBvcHRpb24uCiAKTm8sIHRoYXQgcGF0Y2ggdGVzdGVkIHRoaXMgb3B0
aW9uICsgYWN0dWFsbHkgY2FsbGluZyBidWlsdGluX21lbXNldC4KVGhpcyBuZXcgcGF0Y2ggaGFz
IHRoZSBvcmlnaW5hbCBjb2RlIG9mIHplcm9pbmcgYSBsb25nIGF0IGEgdGltZSwgYnV0CmhhcyB0
aGUgaW5saW5lIG1lbXNldCBvcHRpb24gdG8gcHJldmVudCBmdXR1cmUgR0NDIGZyb20gcmVjb2du
aXppbmcgdGhhdApwYXR0ZXJuIGFuZCBtYWtpbmcgaXQgb3V0bGluZS4gQ29kZWdlbiBzaG91bGQg
YmUgdGhlIHNhbWUuCgpKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
