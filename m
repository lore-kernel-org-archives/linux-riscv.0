Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9115AC25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 00:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gW0boqVpCY2pzDQIk+K1iAPKywubDqw/HHJj289EuoE=; b=Y1ZZWUbJzOuZRt
	YOtqB8PEXlwx0Q00zu0jseuhWrI9Zp7f+jTuPGFsHbl0JymB7LD0dLndrdm1AonEe4ffZx/kUYINo
	SJjiu5XSg9f5U2m91UjNLlKEdoTpXbP8lKyvV7y36/DUL+bQcDsxZsd1El86BMn5IkB6wSmRhp4Mm
	s+202++beRvMafxj3iglycF4jPTMLHnPjxRVvWNd2wUJYSOr9cn3WpVu7FyFgvjZRmBuacazHL3al
	KSTwJeQWWUphUuC1o71EIsMMcD3HEgSshfrUSeBn6HIRfYx9mpJh0aGjPa9xvryjPgHjurWI0cMYm
	42oPB/ccnWSbS8D1seVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Our-00000003FSb-0E1Q;
	Thu, 16 May 2024 00:24:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Oun-00000003FOv-2LRa
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 00:24:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8264ECE17F6;
	Thu, 16 May 2024 00:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B95C116B1;
	Thu, 16 May 2024 00:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715819045;
	bh=2mTyV3yHsXnpIz+Hf8dHwdpSsS9bL76Nasiv3NlJOGU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eyhYvQrhNljUOqI7QNUxGGddgXbxg9y2eAf3SrTd+rZn8BqfPQoiuSPf3cJR34dYa
	 zSvce/f+OH48w4hBDOW3RJtYyeJg/nH46JmYm2E1PnSRHy3kF0o/T3lOVha7lvTJZL
	 uwq0IQjHw/2eZmSVpTKVdnQCl4UR4thsmYHeiq/1GVjfoMBQqd3nuLCklTZ9PM9S84
	 D8LoRdc+cO+u2c30aTUmBWeafhneREBkpHfzgJUF++utFsobb1GHqqrDGDR8WHyFxG
	 uiknNVRd2iWPJ5aH2ELN/FibJPqRnrW3ba5PPk+Mf7re8cp/Bm8sj9dFC7CoxlOg4B
	 VDJeBnkbZygiA==
Date: Thu, 16 May 2024 09:23:55 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Guo Ren <guoren@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Mark
 Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, "James E.J. Bottomley"
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v3] kprobe/ftrace: bail out if ftrace was killed
Message-Id: <20240516092355.4eaab560b7f4e22953f73cfc@kernel.org>
In-Reply-To: <87r0e2pvmn.fsf@oracle.com>
References: <20240501162956.229427-1-stephen.s.brennan@oracle.com>
	<CAJF2gTT8a4PBU3ekZFNTi6EuETT9hhKfhXrPgGGpn92rQMNSvg@mail.gmail.com>
	<20240502110348.016f190e0b0565b7e9ecdb48@kernel.org>
	<87r0e2pvmn.fsf@oracle.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_172409_973325_33B138BC 
X-CRM114-Status: GOOD (  33.56  )
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

T24gV2VkLCAxNSBNYXkgMjAyNCAxNToxODowOCAtMDcwMApTdGVwaGVuIEJyZW5uYW4gPHN0ZXBo
ZW4ucy5icmVubmFuQG9yYWNsZS5jb20+IHdyb3RlOgoKPiBNYXNhbWkgSGlyYW1hdHN1IChHb29n
bGUpIDxtaGlyYW1hdEBrZXJuZWwub3JnPiB3cml0ZXM6Cj4gPiBPbiBUaHUsIDIgTWF5IDIwMjQg
MDE6MzU6MTYgKzA4MDAKPiA+IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+
Cj4gPj4gT24gVGh1LCBNYXkgMiwgMjAyNCBhdCAxMjozMOKAr0FNIFN0ZXBoZW4gQnJlbm5hbgo+
ID4+IDxzdGVwaGVuLnMuYnJlbm5hbkBvcmFjbGUuY29tPiB3cm90ZToKPiA+PiA+Cj4gPj4gPiBJ
ZiBhbiBlcnJvciBoYXBwZW5zIGluIGZ0cmFjZSwgZnRyYWNlX2tpbGwoKSB3aWxsIHByZXZlbnQg
ZGlzYXJtaW5nCj4gPj4gPiBrcHJvYmVzLiBFdmVudHVhbGx5LCB0aGUgZnRyYWNlX29wcyBhc3Nv
Y2lhdGVkIHdpdGggdGhlIGtwcm9iZXMgd2lsbCBiZQo+ID4+ID4gZnJlZWQsIHlldCB0aGUga3By
b2JlcyB3aWxsIHN0aWxsIGJlIGFjdGl2ZSwgYW5kIHdoZW4gdHJpZ2dlcmVkLCB0aGV5Cj4gPj4g
PiB3aWxsIHVzZSB0aGUgZnJlZWQgbWVtb3J5LCBsaWtlbHkgcmVzdWx0aW5nIGluIGEgcGFnZSBm
YXVsdCBhbmQgcGFuaWMuCj4gPj4gPgo+ID4+ID4gVGhpcyBiZWhhdmlvciBjYW4gYmUgcmVwcm9k
dWNlZCBxdWl0ZSBlYXNpbHksIGJ5IGNyZWF0aW5nIGEga3Byb2JlIGFuZAo+ID4+ID4gdGhlbiB0
cmlnZ2VyaW5nIGEgZnRyYWNlX2tpbGwoKS4gRm9yIHNpbXBsaWNpdHksIHdlIGNhbiBzaW11bGF0
ZSBhbgo+ID4+ID4gZnRyYWNlIGVycm9yIHdpdGggYSBrZXJuZWwgbW9kdWxlIGxpa2UgWzFdOgo+
ID4+ID4KPiA+PiA+IFsxXTogaHR0cHM6Ly9naXRodWIuY29tL2JyZW5uczEwL2tlcm5lbF9zdHVm
Zi90cmVlL21hc3Rlci9mdHJhY2Vfa2lsbGVyCj4gPj4gPgo+ID4+ID4gICBzdWRvIHBlcmYgcHJv
YmUgLS1hZGQgY29tbWl0X2NyZWRzCj4gPj4gPiAgIHN1ZG8gcGVyZiB0cmFjZSAtZSBwcm9iZTpj
b21taXRfY3JlZHMKPiA+PiA+ICAgIyBJbiBhbm90aGVyIHRlcm1pbmFsCj4gPj4gPiAgIG1ha2UK
PiA+PiA+ICAgc3VkbyBpbnNtb2QgZnRyYWNlX2tpbGxlci5rbyAgIyBjYWxscyBmdHJhY2Vfa2ls
bCgpLCBzaW11bGF0aW5nIGJ1Zwo+ID4+ID4gICAjIEJhY2sgdG8gcGVyZiB0ZXJtaW5hbAo+ID4+
ID4gICAjIGN0cmwtYwo+ID4+ID4gICBzdWRvIHBlcmYgcHJvYmUgLS1kZWwgY29tbWl0X2NyZWRz
Cj4gPj4gPgo+ID4+ID4gQWZ0ZXIgYSBzaG9ydCBwZXJpb2QsIGEgcGFnZSBmYXVsdCBhbmQgcGFu
aWMgd291bGQgb2NjdXIgYXMgdGhlIGtwcm9iZQo+ID4+ID4gY29udGludWVzIHRvIGV4ZWN1dGUg
YW5kIHVzZXMgdGhlIGZyZWVkIGZ0cmFjZV9vcHMuIFdoaWxlIGZ0cmFjZV9raWxsKCkKPiA+PiA+
IGlzIHN1cHBvc2VkIHRvIGJlIHVzZWQgb25seSBpbiBleHRyZW1lIGNpcmN1bXN0YW5jZXMsIGl0
IGlzIGludm9rZWQgaW4KPiA+PiA+IEZUUkFDRV9XQVJOX09OKCkgYW5kIHNvIHRoZXJlIGFyZSBt
YW55IHBsYWNlcyB3aGVyZSBhbiB1bmV4cGVjdGVkIGJ1Zwo+ID4+ID4gY291bGQgYmUgdHJpZ2dl
cmVkLCB5ZXQgdGhlIHN5c3RlbSBtYXkgY29udGludWUgb3BlcmF0aW5nLCBwb3NzaWJseQo+ID4+
ID4gd2l0aG91dCB0aGUgYWRtaW5pc3RyYXRvciBub3RpY2luZy4gSWYgZnRyYWNlX2tpbGwoKSBk
b2VzIG5vdCBwYW5pYyB0aGUKPiA+PiA+IHN5c3RlbSwgdGhlbiB3ZSBzaG91bGQgZG8gZXZlcnl0
aGluZyB3ZSBjYW4gdG8gY29udGludWUgb3BlcmF0aW5nLAo+ID4+ID4gcmF0aGVyIHRoYW4gbGVh
dmUgYSB0aWNraW5nIHRpbWUgYm9tYi4KPiA+PiA+Cj4gPj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGVw
aGVuIEJyZW5uYW4gPHN0ZXBoZW4ucy5icmVubmFuQG9yYWNsZS5jb20+Cj4gPj4gPiAtLS0KPiA+
PiA+IENoYW5nZXMgaW4gdjM6Cj4gPj4gPiAgIERvbid0IGV4cG9zZSBmdHJhY2VfaXNfZGVhZCgp
LiBDcmVhdGUgYSAia3Byb2JlX2Z0cmFjZV9kaXNhYmxlZCIKPiA+PiA+ICAgdmFyaWFibGUgYW5k
IGNoZWNrIGl0IGRpcmVjdGx5IGluIHRoZSBrcHJvYmUgaGFuZGxlcnMuCj4gPj4gPiBMaW5rIHRv
IHYxL3YyIGRpc2N1c3Npb246Cj4gPj4gPiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI0MDQyNjIyNTgzNC45OTMzNTMtMS1zdGVwaGVuLnMuYnJlbm5hbkBvcmFjbGUuY29tLwo+ID4+
ID4KPiA+PiA+ICBhcmNoL2Nza3kva2VybmVsL3Byb2Jlcy9mdHJhY2UuYyAgICAgfCAzICsrKwo+
ID4+ID4gIGFyY2gvbG9vbmdhcmNoL2tlcm5lbC9mdHJhY2VfZHluLmMgICB8IDMgKysrCj4gPj4g
PiAgYXJjaC9wYXJpc2Mva2VybmVsL2Z0cmFjZS5jICAgICAgICAgIHwgMyArKysKPiA+PiA+ICBh
cmNoL3Bvd2VycGMva2VybmVsL2twcm9iZXMtZnRyYWNlLmMgfCAzICsrKwo+ID4+ID4gIGFyY2gv
cmlzY3Yva2VybmVsL3Byb2Jlcy9mdHJhY2UuYyAgICB8IDMgKysrCj4gPj4gPiAgYXJjaC9zMzkw
L2tlcm5lbC9mdHJhY2UuYyAgICAgICAgICAgIHwgMyArKysKPiA+PiA+ICBhcmNoL3g4Ni9rZXJu
ZWwva3Byb2Jlcy9mdHJhY2UuYyAgICAgfCAzICsrKwo+ID4+ID4gIGluY2x1ZGUvbGludXgva3By
b2Jlcy5oICAgICAgICAgICAgICB8IDcgKysrKysrKwo+ID4+ID4gIGtlcm5lbC9rcHJvYmVzLmMg
ICAgICAgICAgICAgICAgICAgICB8IDYgKysrKysrCj4gPj4gPiAga2VybmVsL3RyYWNlL2Z0cmFj
ZS5jICAgICAgICAgICAgICAgIHwgMSArCj4gPj4gPiAgMTAgZmlsZXMgY2hhbmdlZCwgMzUgaW5z
ZXJ0aW9ucygrKQo+ID4+ID4KPiA+PiA+IGRpZmYgLS1naXQgYS9hcmNoL2Nza3kva2VybmVsL3By
b2Jlcy9mdHJhY2UuYyBiL2FyY2gvY3NreS9rZXJuZWwvcHJvYmVzL2Z0cmFjZS5jCj4gPj4gPiBp
bmRleCA4MzRjZmZjZmJjZTMuLjdiYTRiOTgwNzZkZSAxMDA2NDQKPiA+PiA+IC0tLSBhL2FyY2gv
Y3NreS9rZXJuZWwvcHJvYmVzL2Z0cmFjZS5jCj4gPj4gPiArKysgYi9hcmNoL2Nza3kva2VybmVs
L3Byb2Jlcy9mdHJhY2UuYwo+ID4+ID4gQEAgLTEyLDYgKzEyLDkgQEAgdm9pZCBrcHJvYmVfZnRy
YWNlX2hhbmRsZXIodW5zaWduZWQgbG9uZyBpcCwgdW5zaWduZWQgbG9uZyBwYXJlbnRfaXAsCj4g
Pj4gPiAgICAgICAgIHN0cnVjdCBrcHJvYmVfY3RsYmxrICprY2I7Cj4gPj4gPiAgICAgICAgIHN0
cnVjdCBwdF9yZWdzICpyZWdzOwo+ID4+ID4KPiA+PiA+ICsgICAgICAgaWYgKHVubGlrZWx5KGtw
cm9iZV9mdHJhY2VfZGlzYWJsZWQpKQo+ID4+ID4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiA+
PiA+ICsKPiA+PiBGb3IgY3NreSBwYXJ0Lgo+ID4+IEFja2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5A
a2VybmVsLm9yZz4KPiA+Cj4gPiBUaGFua3MgU3RlcGhlbiwgR3VvIGFuZCBTdGV2ZSEKPiA+Cj4g
PiBMZXQgbWUgcGljayB0aGlzIHRvIHByb2Jlcy9mb3ItbmV4dCEKPiAKPiBUaGFuayB5b3UgTWFz
YW1pIQo+IAo+IEkgZGlkIHdhbnQgdG8gY2hlY2ssIGlzIHRoaXMgdGhlIGNvcnJlY3QgZ2l0IHRy
ZWUgdG8gYmUgd2F0Y2hpbmc/Cj4gCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvdHJhY2UvbGludXgtdHJhY2UuZ2l0L2xvZy8/aD1wcm9iZXMvZm9yLW5l
eHQKPiAKPiAoIEknbSBub3QgdHJ5aW5nIHRvIHByZXNzdXJlIG9uIHRpbWluZywgYXMgSSBrbm93
IHRoZSBtZXJnZSB3aW5kb3cgaXMKPiAgIGhlY3RpYy4gSnVzdCBtYWtpbmcgc3VyZSBJJ20gd2F0
Y2hpbmcgdGhlIGNvcnJlY3QgcGxhY2UhICkKClNvcnJ5LCBJIGZvcmdvdCB0byBwdXNoIGl0IGZy
b20gbXkgbG9jYWwgdHJlZS4gTm93IGl0IHNob3VsZCBiZSB0aGVyZS4KClRoYW5rcywKCi0tIApN
YXNhbWkgSGlyYW1hdHN1IChHb29nbGUpIDxtaGlyYW1hdEBrZXJuZWwub3JnPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
