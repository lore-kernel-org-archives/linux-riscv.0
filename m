Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B915AC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 19:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lvtK+OSAxPeQoN+kd+544LZNF7cKhANyfAG5TK0SieY=; b=hJbt4jiteqyYn+
	rrvJjqOuqJlcGrhBMyurgVj8bWin8jTSJUV+gh4F/Q43dGEdJZmFWQRgOCIPlqsbiGYqLjaIL+w5R
	nEdQ2axotgqWbqMEhgcva0RnTVpPeXE0Izmw1RBbo9+P5rVG4N5H2lPQfddxn7mtXXVGXAimbNEbx
	ioX+naB521HPwKsl9o+KENTN5RWGMH+U5EVzjoIvLiOryjlw8eO5SNdn2+g6rpmLRl2gRgvDKlGXH
	4fL1VowFPkecqD9RT847mA8OsCQBSfNOE5YKUd6jvayWaQP7mGyX5Bw34gL522qiE+gUBqRPPHVLg
	fFt6puYa/O9ZCM6tMIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r059r-00HNyF-19;
	Mon, 06 Nov 2023 19:21:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r059o-00HNxt-2F
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 19:21:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 85986B811C7;
	Mon,  6 Nov 2023 19:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE79C433C8;
	Mon,  6 Nov 2023 19:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699298465;
	bh=DNSe1kWEmQIx9RbnW/5BezE7eNr7BvDl2djBhzSMnZI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CzC22BIRJwDgnZhVgMFNrwGQ5hFQ1zOJg1uk/iLLj+M01dpVFAB45brwdB7ujupSF
	 R7/p/7lDbOlboRHRksVysmedjqGCD1rEj15+YNNxEcKbvR0ZcwMgUd15YNSmtAWfSV
	 guY0MJwBtUmQzi//vxXtES0P3GhkIEwIpD6Bu8fdpkAi2FC7brpjThZtcDfG93o4e5
	 g/sK7RDWpD17ghwsc1iI92Jxz6pi5YwauAUg8efYDQQD0IIAWjka94bIdhbjb81feI
	 nIwR6qQSwjozFZsIPET4cK/SLAYZD9UfZILECpFhS4zLNlFRJ3+QUjJMOCt3em/XSW
	 HkMIi/enxHOpQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] riscv: CONFIG_EFI should not depend on CONFIG_RISCV_ISA_C
In-Reply-To: <mhng-7bef396f-1601-4934-8c85-08196c54aa76@palmer-ri-x1c9>
References: <mhng-7bef396f-1601-4934-8c85-08196c54aa76@palmer-ri-x1c9>
Date: Mon, 06 Nov 2023 20:21:04 +0100
Message-ID: <87ttpyu1r3.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_112109_021899_00A1D4ED 
X-CRM114-Status: GOOD (  19.09  )
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
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, atishp@atishpatra.org, Atish Patra <atishp@rivosinc.com>, Bjorn Topel <bjorn@rivosinc.com>, linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

UGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4gd3JpdGVzOgoKPiBPbiBUdWUsIDI0
IE9jdCAyMDIzIDEyOjI2OjQ4IFBEVCAoLTA3MDApLCBiam9ybkBrZXJuZWwub3JnIHdyb3RlOgo+
PiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4+Cj4+IFVFRkkvUEUg
bWFuZGF0ZXMgdGhhdCB0aGUga2VybmVsIEltYWdlIHN0YXJ0cyB3aXRoICJNWiIgQVNDSUkKPj4g
KDB4NUE0RCkuIENvbnZlbmllbnQgZW5vdWdoLCAiTVoiIGlzIGEgdmFsaWQgY29tcHJlc3NlZCBS
SVNDLVYKPj4gaW5zdHJ1Y3Rpb24uIFRoaXMgbWVhbnMgdGhhdCBhIG5vbi1VRUZJIGxvYWRlciBj
YW4gc2ltcGx5IGp1bXAgdG8KPj4gImNvZGUwIiBpbiB0aGUgSW1hZ2UgaGVhZGVyIFsxXSBhbmQg
c3RhcnQgZXhlY3V0aW5nLgo+Pgo+PiBUaGUgSW1hZ2Ugc3BlY2lmaWNhdGlvbiBbMV0gc2F5cyB0
aGUgZm9sbG93aW5nIGFib3V0ICJjb2RlMCI6Cj4+ICAgfCAgIFRoaXMgaGVhZGVyIGlzIGFsc28g
cmV1c2VkIHRvIHN1cHBvcnQgRUZJIHN0dWIgZm9yIFJJU0MtVi4gRUZJCj4+ICAgfCAgIHNwZWNp
ZmljYXRpb24gbmVlZHMgUEUvQ09GRiBpbWFnZSBoZWFkZXIgaW4gdGhlIGJlZ2lubmluZyBvZiB0
aGUKPj4gICB8ICAga2VybmVsIGltYWdlIGluIG9yZGVyIHRvIGxvYWQgaXQgYXMgYW4gRUZJIGFw
cGxpY2F0aW9uLiBJbiBvcmRlcgo+PiAgIHwgICB0byBzdXBwb3J0IEVGSSBzdHViLCBjb2RlMCBp
cyByZXBsYWNlZCB3aXRoICJNWiIgbWFnaWMgc3RyaW5nCj4+ICAgfCAgIGFuZCByZXMzKGF0IG9m
ZnNldCAweDNjKSBwb2ludHMgdG8gdGhlIHJlc3Qgb2YgdGhlIFBFL0NPRkYKPj4gICB8ICAgaGVh
ZGVyLgo+Pgo+PiAiTVoiIGlzIG5vdCBhIHZhbGlkIGluc3RydWN0aW9uIGZvciBpbXBsZW1lbnRh
dGlvbnMgd2l0aG91dCB0aGUgQwo+PiBleHRlbnNpb24uCj4+Cj4+IEEgbm9uLVVFRkkgbG9hZGVy
LCBsb2FkaW5nIGEgbm9uLUMgVUVGSSBpbWFnZSBoYXZlIHRoZSBmb2xsb3dpbmcKPj4gb3B0aW9u
czoKPj4gICAxLiBUcmFwIGFuZCBlbXVsYXRlICJjb2RlMCIKPj4gICAyLiBBdm9pZCAiY29kZTAi
IGlmIGl0IGlzICJNWiIsIGFuZCBoYXZlIHRoZSBrZXJuZWwgZW50cnkgYXQKPj4gICAgICAiY29k
ZTEiLgo+Pgo+PiBSZXBsYWNlIHRoZSBjb21wcmVzc2VkIGluc3RydWN0aW9uIHdpdGggYSBoZXgg
Y29kZSB2YXJpYW50LCB0aGF0IHdvcmtzCj4+IGZvciBDT05GSUdfUklTQ1ZfSVNBX0M9biBidWls
ZHMuIEZ1cnRoZXIsIHRoaXMgY2hhbmdlIGFsc28gbWFrZSBzdXJlCj4+IHRoYXQgdGhlICJjb2Rl
MCIgaW5zdHJ1Y3Rpb24gaXMgMzJiIGFsaWduZWQuCj4KPiBJTU8gdGhpcyBicmVha3MgdGhlIElt
YWdlIGZvcm1hdCBvbiBub24tQyBzeXN0ZW1zOiB0aGV5J2xsIGp1bXAgc3RyYWlnaHQgCj4gdG8g
dGhlIHN0YXJ0IChhcyB0aGVyZSdzIG5vIHN5bWJvbHMgbGVmdCBvciBhbnl0aGluZykgYW5kIHRo
ZW4ganVzdCBmYWlsIAo+IHRvIGV4ZWN1dGUgdGhlIEMgaW5zdHJ1Y3Rpb25zLgoKVGhhdCdzIHJp
Z2h0ISBNeSBpZGVhLCB3aGljaCB3YXMgcHJvYmFibHkgcmVhbGx5IHBvb3IgYXJ0aWN1bGF0ZWQs
IHdhcwp0byBhZGQgdHJhcC9lbXVsYXRlIGluIE9wZW5TQkkvbm9uLUMgZm9yIHRoZSBNWiBpbnN0
cnVjdGlvbnMuCgo+IFdlIGNvdWxkIGFtZW5kIHRoZSBJbWFnZSBmb3JtYXQgdG8gcmVxdWlyZSBi
b290bG9hZGVycyB0byBoYW5kbGUgdGhpcyAKPiAoaWUsIGxvb2sgYXQgdGhlIGZpcnN0IGluc3Ry
dWN0aW9ucyBhbmQgZW11bGF0ZSB0aGVtIGlmIHRoZXJlJ3Mgbm8gQyksIAo+IHRoYXQgd291bGQg
cmVxdWlyZSBzb21lIGJvb3Rsb2FkZXIgdXBkYXRlcyBidXQgZ2l2ZW4gdGhpcyBkb2Vzbid0IHdv
cmsgCj4gbWF5YmUgdGhhdCdzIGZpbmUuCj4KPiBXZSBjb3VsZCBhbHNvIGp1c3Qgc3RvcCBwcm9k
dWNpbmcgSW1hZ2UrUEUgYmluYXJpZXMgb24gbm9uLUMgc3lzdGVtcyAKPiAoaWUsIGp1c3QgcHJv
ZHVjZSBQRSkuCgpZZXMsIG9yIG1ha2UgdGhlIEltYWdlIGxvYWRlciBpbiBRZW11IGV0IGFsIG1v
cmUgcm9idXN0LCBieSBlLmcuCmNoZWNraW5nIGNvZGUwL2NvZGUxLiBUaGUgSW1hZ2Ugc3BlYyBk
b2VzIHNheSB0aGF0IGNvZGUwIGlzICdNWicgZm9yClBFK0ltYWdlIGJ1aWxkcywgYW5kIGZvciBu
b24tQyBjYXBhYmxlIHN5c3RlbXMgb25lIGNvdWxkIGFyZ3VlIHRoYXQgaXQKc2hvdWxkIGJlIGNo
ZWNrZWQvc2tpcHBlZCBieSB0aGUgbG9hZGVyLgoKRG9lcyB0aGUgYXJndW1lbnRzIGFib3ZlIG1h
a2Ugc2Vuc2UgZm9yIHlvdT8gSS5lLjoKICAxLiAgIE1lcmdlIHRoaXMgcGF0Y2gKICAyYS4gIEFk
ZCB0aGUgdHJhcC9lbXUgdG8gT3BlblNCSQogICgyYi4gSW1wcm92ZSB0aGUgaW1hZ2UgbG9hZGVy
IGluIFFlbXU/KQoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
