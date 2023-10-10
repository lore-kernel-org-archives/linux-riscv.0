Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0FACD8CB4
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 19:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=augLLZQzFFvjx2wwtZkHR2DlNg708FVk85OrIU7s90M=; b=j7zmzp3hYbcVCJ
	d6VEJ7bLyHjXfu7k6XoNbmuDBIOPVIm3WEvpkcQMNDuTtmDgazHDb6mByZWJ1GKjxr5rol/IYL/2b
	1hM41bxGWORIoie2GpcXjUMX3UdgmxvtqGd92/7Pk1JeIqfyA38cZlelL8OILab3tXiGpfZ9C9Frx
	Uc4oRFgCRh4hpO0YZZ4mdtq0GKq/T6vWxBG94AhBwBxMq1KxR7q/1Q/W4utsxxOAdAAn/s9s/LvkW
	GbomWfu2kNkXEMA4zzJLsAPxTlQwWGnsdM6uF9qbqKHC1z75vZ8Me7Ud6V6CsHfbGfnWKT34KnB/k
	+P7X7yVT49gqTHFBNn4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqImo-00E4LP-1J;
	Tue, 10 Oct 2023 19:52:58 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqImi-00E4K8-1P
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 19:52:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 315A5CE20CD;
	Tue, 10 Oct 2023 19:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F7EC433C8;
	Tue, 10 Oct 2023 19:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696967569;
	bh=u6XkChwgLKXRpmaMTPiMR4qyFXezaXl3BACHiWQ3Xfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HQ9gb11RxEYh8c8r4b+PxPv5ICATgjDdOAsQ9qOGP77ezjd0PX8ETklOYqrrpycRB
	 lDok5EdQOFnpCdImOAqX6DzcGJFBNvgJBfku3c+Mqcd3JiWesL6NxNlUEfjhzVZ21s
	 2m8c2fbdzpYVvRYOyRYuMpqGzXPOvBtsJ8LaOtz5uzYNigPIIczQ9A6IrovSnbLzZO
	 7u6FzBKQx2a0VsGGQ0BrOkuhXuUTt0bA1O0sIVYaEQyVskXZTMvd0R6HYWnQL/Pz9s
	 YZ/eQL96wTPljzXW76kv4bk5eb4/Jix2EXkl4KS5Oo5vWEBhir+9lJLR6fu147R40e
	 dRZYK+xUVJ8Ow==
Date: Tue, 10 Oct 2023 12:52:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor@kernel.org, trix@redhat.com, samitolvanen@google.com,
	twd2.me@gmail.com, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH v3] RISC-V: build: Allow LTO to be selected
Message-ID: <20231010195247.GA2233717@dev-arch.thelio-3990X>
References: <20231003-riscv-lto-v3-1-8aca61a4ecb4@kernel.org>
 <CAKwvOdnMeM4YArw=hyVkev11cLfks5gaXWXNK+Wo0bcbeuMZHg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOdnMeM4YArw=hyVkev11cLfks5gaXWXNK+Wo0bcbeuMZHg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_125252_672727_840BCE05 
X-CRM114-Status: GOOD (  18.73  )
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

T24gVHVlLCBPY3QgMTAsIDIwMjMgYXQgMTA6MDM6MTVBTSAtMDcwMCwgTmljayBEZXNhdWxuaWVy
cyB3cm90ZToKPiBPbiBUdWUsIE9jdCAzLCAyMDIzIGF0IDEyOjE34oCvUE0gTmF0aGFuIENoYW5j
ZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBXZW5kZSBUYW4g
PHR3ZDIubWVAZ21haWwuY29tPgo+ID4KPiA+IEFsbG93IExUTyB0byBiZSBzZWxlY3RlZCBmb3Ig
UklTQy1WLCBvbmx5IHdoZW4gTExEID49IDE0LCBzaW5jZSB0aGVyZSBpcyBhbgo+ID4gaXNzdWUg
WzFdIGluIHByaW9yIExMRCB2ZXJzaW9ucyB0aGF0IHByZXZlbnRzIExMRCB0byBnZW5lcmF0ZSBw
cm9wZXIKPiA+IG1hY2hpbmUgY29kZSBmb3IgUklTQy1WIHdoZW4gd3JpdGluZyBgbm9wYHMuCj4g
Pgo+ID4gSSBoYXZlIHRlc3RlZCBlbmFibGluZyBMVE8gZm9yIGBkZWZjb25maWdgLiBUaGUgTExE
IHRvb2sgfjJtMjFzIGFuZCB+M0dpQgo+ID4gb24gb3VyIEludGVsIFhlb24gR29sZCA2MTQwIHNl
cnZlciBhbmQgcHJvZHVjZWQgYW4gMThNaUIgSW1hZ2UuIFRoZSBpbWFnZQo+ID4gY2FuIGJvb3Qg
dG8gc2hlbGwgdXNpbmcgYW4gYXJjaHJpc2N2IHJvb3RmcyBvbiBRRU1VLgo+ID4KPiA+IEkgaGF2
ZSBhbHNvIHRlc3RlZCBpdCBmb3IgYGFsbHllc2NvbmZpZ2Agd2l0aG91dCBDT01QSUxFX1RFU1Qs
IEZUUkFDRSwKPiA+IEtBU0FOLCBhbmQgR0NPVi4gVGhlIExMRCB0b29rIH43aDAzbSBhbmQgfjMz
NUdpQiBvbiB0aGUgc2VydmVyLAo+ID4gc3VjY2Vzc2Z1bGx5IHByb2R1Y2luZyBhIDEuN0dpQiBJ
bWFnZS4gVW5mb3J0dW5hdGVseSwgd2UgY2Fubm90IGJvb3QgdGhpcwo+ID4gaW1hZ2UgYmVjYXVz
ZSB0aGUgYGNyZWF0ZV9rZXJuZWxfcGFnZV90YWJsZSgpYCAtPiBgYWxsb2NfcG1kX2Vhcmx5KClg
IC0+Cj4gPiBgQlVHX09OKClgIGxvZ2ljIGxpbWl0cyB0aGUgaW1hZ2UgdG8gYmUgPCAxR2lCLiBN
YXliZSB3ZSBjYW4gZml4IGl0IGluIGEKPiA+IHNlcGFyYXRlIHBhdGNoIGZ1cnRoZXIuCj4gPgo+
ID4gRGlzYWJsZSBMVE8gZm9yIGFyY2gvcmlzY3Yva2VybmVsL3BpLCBhcyBsbHZtLW9iamNvcHkg
ZXhwZWN0cyBhbiBFTEYKPiA+IG9iamVjdCBmaWxlIHdoZW4gbWFuaXB1bGF0aW5nIHRoZSBmaWxl
cyBpbiB0aGF0IHN1YmZvbGRlciwgcmF0aGVyIHRoYW4KPiA+IExMVk0gYml0Y29kZS4KPiA+Cj4g
PiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L2lzc3Vlcy81MDUwNSwg
cmVzb2x2ZWQgYnkgTExWTQo+ID4gICAgIGNvbW1pdCBlNjM0NTVkNWUwZTUgKCJbTUNdIFVzZSBs
b2NhbCBNQ1N1YnRhcmdldEluZm8gaW4gd3JpdGVOb3BzIikKPiA+Cj4gPiBUZXN0ZWQtYnk6IFdl
bmRlIFRhbiA8dHdkMi5tZUBnbWFpbC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXZW5kZSBUYW4g
PHR3ZDIubWVAZ21haWwuY29tPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBOYXRoYW4gQ2hhbmNlbGxv
ciA8bmF0aGFuQGtlcm5lbC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxv
ciA8bmF0aGFuQGtlcm5lbC5vcmc+Cj4gCj4gUGVyaGFwcyB3b3J0aCBhIHY0IGR1ZSB0byBsaW5r
ZXIgcmVsYXhhdGlvbiByZXN1bHRpbmcgaW4gYm9vdCBmYWlsdXJlcwo+IHlvdSBvYnNlcnZlZDoK
PiBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy8xOTQyID8K
ClllcywgYWdyZWVkLiBSSVNDLVYgcGF0Y2h3b3JrIGZvbGtzLCBjb25zaWRlciBtYXJraW5nIHRo
aXMgYXMgIkNoYW5nZXMKUmVxdWVzdGVkIiBvciB3aGF0ZXZlciBvdGhlciBzdGF0dXMgdGhlcmUg
aXMgdGhhdCBpbmRpY2F0ZXMgdGhhdCBJIG5lZWQKdG8gc2VuZCBhIHY0IHdvcmtpbmcgYXJvdW5k
IHRoYXQgaXNzdWUsIGF0IGxlYXN0IHVudGlsIHdlIGJldHRlcgp1bmRlcnN0YW5kIHRoZSBpc3N1
ZS4KCkNoZWVycywKTmF0aGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
