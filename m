Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453BDC6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 13:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b0TonU3yPYF7nZyLGwWuOZIv2n5NWiZs8HRMBtgk9jI=; b=u4eAkIquW3lP5u
	ZsUjqft9TABzv21L4vogakfP43jP71NBjvd8AuYQqxumvl8smxtxlZJuziwnARZcon37rwycH2+vK
	SxRdR2LJPHEGrQ45q6G2naNDXiUoKN6Hm4PvvNkbeTbZ0QFoPanJl8g2/nODb5hsnK83h6Kp5p1v4
	8UQGywPgJ0mxp9Ym/GBFo/m+6ww4swfj3xyesErmHhUsRGgZ75OT6G443yLbC5kt2FS4peJ70bqTb
	X2PUU62qwqJCB/VTHVj362SP1PusLFXdGKSP6nTBL7NOIAHQgvSG4A3wYnmiESPDFi26cNdIH0/Kk
	4jaCgZ+9vBHLuwq7D3lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rre35-0000000BKPn-37XZ;
	Tue, 02 Apr 2024 13:19:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rre33-0000000BKP1-2yJQ
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 13:19:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 04C1560FE3;
	Tue,  2 Apr 2024 13:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31957C433F1;
	Tue,  2 Apr 2024 13:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712063972;
	bh=HSrh7OQUagdQP/I1BKUPujeKyaLpFjrOfOThuODgUt0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AFfbQ9oFDJPX0tUP4l0IYbN/pB3/ZQyA9/Ib2vBIOzYv+lyIaystfw2fmT/5lIcMa
	 82FLn5nxcU+9kuLo6izOS+nQ6ulZAhqtHJInG/djbnImRMRv2MDLv7yBLKEX98K5rh
	 xe5guAotmTmQ86zsxcFHNRSRwdk/+kZP0UISHQVFAaLn9svLiCvzsVn/H+e4OD7rbW
	 NtUE17cp2T/yAhp2nG6eLnc2x/fgTE5CVmhL1w9TiCnu6mPgxfzSTWsqcbR0Ne3KqC
	 FKLGNV0xLPABH7JE4dOBrtPCGoXXZiDOvLv0uiTq9eoL4Q6Mi0x3v4taag9fVCZTnF
	 Ehjiqydw92pdA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>
Cc: puranjay12@gmail.com
Subject: Re: [PATCH 1/2] riscv: stacktrace: use arch_stack_walk() in place
 of walk_stackframe
In-Reply-To: <20240328184020.34278-2-puranjay12@gmail.com>
References: <20240328184020.34278-1-puranjay12@gmail.com>
 <20240328184020.34278-2-puranjay12@gmail.com>
Date: Tue, 02 Apr 2024 15:19:29 +0200
Message-ID: <87zfubrjfi.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_061934_049345_4D5FFE3C 
X-CRM114-Status: GOOD (  14.36  )
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

UHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5MTJAZ21haWwuY29tPiB3cml0ZXM6Cgo+IEN1cnJlbnRs
eSwgZHVtcF9iYWNrdHJhY2UoKSwgX19nZXRfd2NoYW4oKSwgYW5kIHBlcmZfY2FsbGNoYWluX2tl
cm5lbCgpCj4gZGlyZWN0bHkgY2FsbCB3YWxrX3N0YWNrZnJhbWUoKS4gTWFrZSB0aGVuIGNhbGwg
YXJjaF9zdGFja193YWxrKCkgd2hpY2gKPiBpcyBhIHdyYXBwZXIgYXJvdW5kIHdhbGtfc3RhY2tm
cmFtZSgpIGFuZCBtYWtlIHdhbGtfc3RhY2tmcmFtZSgpIHN0YXRpYy4KPgo+IFRoaXMgYWxsb3dz
IG1ha2luZyBjaGFuZ2VzIHRvIHdhbGtfc3RhY2tmcmFtZSgpIHdpdGhvdXQgZGlzdHVyYmluZyB0
aGUKPiB1c2VycyBvZiBhcmNoX3N0YWNrX3dhbGsoKSB3aGljaCBpcyB0aGUgZXhwb3NlZCBmdW5j
dGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IFB1cmFuamF5IE1vaGFuIDxwdXJhbmpheTEyQGdtYWls
LmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zdGFja3RyYWNlLmggfCAgMiAt
LQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wZXJmX2NhbGxjaGFpbi5jICB8ICAyICstCj4gIGFyY2gv
cmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYyAgICAgIHwgMjYgKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N0YWNrdHJhY2UuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3RhY2t0cmFjZS5oCj4gaW5kZXggYjE0OTVhN2UwNmNl
Ni4uMzIyMTNlMzdjMzc5ZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N0
YWNrdHJhY2UuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3RhY2t0cmFjZS5oCj4g
QEAgLTExLDggKzExLDYgQEAgc3RydWN0IHN0YWNrZnJhbWUgewo+ICAJdW5zaWduZWQgbG9uZyBy
YTsKPiAgfTsKPiAgCj4gLWV4dGVybiB2b2lkIG5vdHJhY2Ugd2Fsa19zdGFja2ZyYW1lKHN0cnVj
dCB0YXNrX3N0cnVjdCAqdGFzaywgc3RydWN0IHB0X3JlZ3MgKnJlZ3MsCj4gLQkJCQkgICAgYm9v
bCAoKmZuKSh2b2lkICosIHVuc2lnbmVkIGxvbmcpLCB2b2lkICphcmcpOwo+ICBleHRlcm4gdm9p
ZCBkdW1wX2JhY2t0cmFjZShzdHJ1Y3QgcHRfcmVncyAqcmVncywgc3RydWN0IHRhc2tfc3RydWN0
ICp0YXNrLAo+ICAJCQkgICBjb25zdCBjaGFyICpsb2dsdmwpOwo+ICAKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvcGVyZl9jYWxsY2hhaW4uYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Bl
cmZfY2FsbGNoYWluLmMKPiBpbmRleCAzMzQ4YTYxZGU3ZDk5Li5jMDIzZTBiMWViODE0IDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3BlcmZfY2FsbGNoYWluLmMKPiArKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9wZXJmX2NhbGxjaGFpbi5jCj4gQEAgLTc0LDUgKzc0LDUgQEAgc3RhdGlj
IGJvb2wgZmlsbF9jYWxsY2hhaW4odm9pZCAqZW50cnksIHVuc2lnbmVkIGxvbmcgcGMpCj4gIHZv
aWQgcGVyZl9jYWxsY2hhaW5fa2VybmVsKHN0cnVjdCBwZXJmX2NhbGxjaGFpbl9lbnRyeV9jdHgg
KmVudHJ5LAo+ICAJCQkgICBzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAgewo+IC0Jd2Fsa19zdGFj
a2ZyYW1lKE5VTEwsIHJlZ3MsIGZpbGxfY2FsbGNoYWluLCBlbnRyeSk7Cj4gKwlhcmNoX3N0YWNr
X3dhbGsoZmlsbF9jYWxsY2hhaW4sIGVudHJ5LCBOVUxMLCByZWdzKTsKPiAgfQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zdGFja3RyYWNlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9z
dGFja3RyYWNlLmMKPiBpbmRleCA2NGE5YzA5M2FlZjkzLi5lMjhmN2IyZTRiNmE2IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3N0YWNrdHJhY2UuYwo+IEBAIC0xOCw4ICsxOCw5IEBACj4gIAo+ICBleHRlcm4gYXNt
bGlua2FnZSB2b2lkIHJldF9mcm9tX2V4Y2VwdGlvbih2b2lkKTsKPiAgCj4gLXZvaWQgbm90cmFj
ZSB3YWxrX3N0YWNrZnJhbWUoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCBzdHJ1Y3QgcHRfcmVn
cyAqcmVncywKPiAtCQkJICAgICBib29sICgqZm4pKHZvaWQgKiwgdW5zaWduZWQgbG9uZyksIHZv
aWQgKmFyZykKPiArc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkCj4gK3dhbGtfc3RhY2tmcmFt
ZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIHN0cnVjdCBwdF9yZWdzICpyZWdzLAo+ICsJCWJv
b2wgKCpmbikodm9pZCAqLCB1bnNpZ25lZCBsb25nKSwgdm9pZCAqYXJnKQoKUmVhbGx5IGEgbml0
LCBidXQgcGxlYXNlIHRyeSB0byBrZWVwIHRoZSByZXR1cm4gdmFsdWUvbGlua2FnZS9mdW5jdGlv
bgpuYW1lIG9uIG9uZSBsaW5lIGlmIHBvc3NpYmxlLgoKPiAgewo+ICAJdW5zaWduZWQgbG9uZyBm
cCwgc3AsIHBjOwo+ICAJaW50IGxldmVsID0gMDsKPiBAQCAtNzYsOCArNzcsOSBAQCB2b2lkIG5v
dHJhY2Ugd2Fsa19zdGFja2ZyYW1lKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgc3RydWN0IHB0
X3JlZ3MgKnJlZ3MsCj4gIAo+ICAjZWxzZSAvKiAhQ09ORklHX0ZSQU1FX1BPSU5URVIgKi8KPiAg
Cj4gLXZvaWQgbm90cmFjZSB3YWxrX3N0YWNrZnJhbWUoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNr
LAo+IC0Jc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGJvb2wgKCpmbikodm9pZCAqLCB1bnNpZ25lZCBs
b25nKSwgdm9pZCAqYXJnKQo+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQKPiArd2Fsa19z
dGFja2ZyYW1lKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgc3RydWN0IHB0X3JlZ3MgKnJlZ3Ms
Cj4gKwkJYm9vbCAoKmZuKSh2b2lkICosIHVuc2lnbmVkIGxvbmcpLCB2b2lkICphcmcpCgouLi5h
bmQgaGVyZS4KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
