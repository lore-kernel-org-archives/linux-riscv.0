Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAD4C021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 15:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JxwMLO/R2wNm2AmnQrJM+G+sRsyAm1EzxixdnNEABBc=; b=sVR90zaW4SFUhP
	gBujiI2bfK6iEB19yjpSsAv294/FiHMtvSoXattXtil1rflQlMxqHQ2puWDYWVEDgo14oMG2TjFii
	hqJhfiDODtM0E6Y+F7WYQexV0jlv1h7DW9Wz/MT6k3vAt7cm/HR0/s0macDE+NKg486jkW/q2hVk9
	OTe7w0fpZdxkBEw4BprlKEl/qfxadU+eN4jfKGWXufl3gK8+haLoGoNiyFkpHQ5me1HqAxIDplwiC
	qnB8dC18AkwlQApG9RAA/9uKvINkTrsj3yrdihjdw92N/Y5gH3IcyFpLc8xR3qsmAzSBcQ0dCNH7C
	XDLvrDr1qVtBv8HKgA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tma1k-0000000EDT7-1Waj;
	Mon, 24 Feb 2025 15:05:48 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZXM-0000000E6zC-30Aa
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 14:34:26 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so8028587a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 06:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740407663; x=1741012463; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkQqnpwYqndRUX8UXmwWgcvggVsTxywAsyTI1tHWoEM=;
        b=vu15AYUNmwYEVqVhpsaq56jFp9Tqin31wYlz5srRB7KObX1qn6JGGSXqFMJ0I+lcpq
         oDV3DZRD/4nmxXSFntqfv4Z5Fuke++sA017n1VK0CZddIpOLNp73OXfEdbipFtF+6beF
         WTly36AzOi/V4xMDtmX7r8R+ed9dILC4JieljgdXeTsWvFSXOHmPGP815rEdu0DBsFfw
         viIypCRYRmXEmjvnpsmR/7R7VVElaXcwvDGbW48HvSZ3nPKuiebut2n6Y5ZR2Nmenp6X
         q93kWRdFe1nil2M8ITqD3NeSht62Z9UhEMb72j4JqjH/gtArMJr5yxuFSFvgz/oGLYI2
         t8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740407663; x=1741012463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkQqnpwYqndRUX8UXmwWgcvggVsTxywAsyTI1tHWoEM=;
        b=nfZUVJhZ0ulfFNlb7+6BIpazmj8vI7Kn9QcxgEOk+8iflGRrCQMctFThzoVeRHlrkC
         LCucQIIEAIuXLyxC1E2SUrJu1HSjzepd/Aviff27UCBl+5WG9eoxie4O4oZOERfD7JMA
         wqCkbso95hmFQ6+oO+WyBVm6ROcZbFpr4sseaOb/P+Nc6cVMouM6ZG3CoHn9/jeldgom
         AA4EkkhPwOaEZgi3dERWiLfGmEz9R76KyRMuqsHLtm56hL1hMbT2SQcq49iNianas3ip
         beeu2eZCmhAN1Y5tk7pZGf1PWi2Nuwg6wrdhpeNw3u53UWo7oDCw+w5J8eN/lr7i4q6/
         KY0A==
X-Forwarded-Encrypted: i=1; AJvYcCV2EWhwlyj4SZSgCIvT0QMh+JPWLOv+NJErflIx/tkdw9HVABuaInvuWFmr7PKPssnN/YSXOiAyuWvUKw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0kzJqIPSGTu3+Hpn+GZSpHufppvzBBg5gJEgAKmXXLwXQW7XQ
	0p23+x8jAljYfg9xdLY7C4E7Ho/OFS1nIlzbT5sBvn1b73CsuxR8p2qJANwmDKuH89KwFFsp1wU
	SSCj+xju9S40/s1xNmoV/XTtfKbvxO7d427Wsfw==
X-Gm-Gg: ASbGncv0KGVcC2pZrYEnIKSZw1Sw1o72odvMDfIik7IAOQibYmqg7HOjuWEAftsd6Cb
	+BvNbT6iljpAoduInn7xGSHNdxk1DuqAa7qIr+EfbvHdP3SRQ5PD/xmiNfA0ITh+NeObD4Mh+Sk
	XA/1j5yPo=
X-Google-Smtp-Source: AGHT+IGwinAFCE/+cod9Wduw27y3lE5NvmD0zotgNUTu5vxJxVcMXBTXPbgxsG+pETb3Ou9qZ9ES5D869/jPdRTLpmg=
X-Received: by 2002:a05:6402:3788:b0:5dc:8fb1:d43e with SMTP id
 4fb4d7f45d1cf-5e0b70e6a03mr11963042a12.12.1740407663035; Mon, 24 Feb 2025
 06:34:23 -0800 (PST)
MIME-Version: 1.0
References: <20250127093530.19548-1-alexghiti@rivosinc.com>
 <20250127093530.19548-3-alexghiti@rivosinc.com> <Z5ePZt61CM84Hb36@casper.infradead.org>
 <CAHVXubhf7aMwsKA0H9OvTg2Lk8U7+bwntVT9Cm-7L4o7=LM4TQ@mail.gmail.com>
In-Reply-To: <CAHVXubhf7aMwsKA0H9OvTg2Lk8U7+bwntVT9Cm-7L4o7=LM4TQ@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 24 Feb 2025 15:34:12 +0100
X-Gm-Features: AWEUYZn3wPoYfPCBnGXzuvofr3D1NoWw4LTFmErwOP5gdYPjvL31yv0cddSq81Q
Message-ID: <CAHVXubjhkDvFKtK4mQDxJrRekOEAF2P9tmQ-4dyyE9A2O8ojGw@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] riscv: Restore the pfn in a NAPOT pte when
 manipulated by core mm code
To: Matthew Wilcox <willy@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_063425_027713_4B084EB2 
X-CRM114-Status: GOOD (  33.17  )
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

SGkgTWF0dGhldywKCk9uIEZyaSwgRmViIDE0LCAyMDI1IGF0IDE6MznigK9QTSBBbGV4YW5kcmUg
R2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gSGkgTWF0dGhldywKPgo+
IFNvcnJ5IGZvciB0aGUgdmVyeSBsYXRlIHJlcGx5LCB0aGUgZmx1IGhpdCBtZSEKPgo+IE9uIE1v
biwgSmFuIDI3LCAyMDI1IGF0IDI6NTHigK9QTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFk
ZWFkLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBKYW4gMjcsIDIwMjUgYXQgMTA6MzU6MjNB
TSArMDEwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gPiArI2lmZGVmIENPTkZJR19SSVND
Vl9JU0FfU1ZOQVBPVAo+ID4gPiArc3RhdGljIGlubGluZSB2b2lkIHNldF9wdGVzKHN0cnVjdCBt
bV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgcHRlX3QgKnB0ZXAsIHB0ZV90IHB0ZXZhbCwgdW5zaWduZWQgaW50IG5yKQo+ID4g
PiArewo+ID4gPiArICAgICBpZiAodW5saWtlbHkocHRlX3ZhbGlkX25hcG90KHB0ZXZhbCkpKSB7
Cj4gPiA+ICsgICAgICAgICAgICAgdW5zaWduZWQgaW50IG9yZGVyID0gaWxvZzIobnIpOwo+ID4g
PiArCj4gPiA+ICsgICAgICAgICAgICAgaWYgKCFpc19uYXBvdF9vcmRlcihvcmRlcikpIHsKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgIC8qCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
KiBTb21ldGhpbmcncyB3ZWlyZCwgd2UgYXJlIGdpdmVuIGEgTkFQT1QgcHRlIGJ1dCB0aGUKPiA+
Cj4gPiBObywgbm90aGluZyBpcyB3ZWlyZC4gIFRoaXMgY2FuIGhhcHBlbiB1bmRlciBhIGxvdCBv
ZiBkaWZmZXJlbnQKPiA+IGNpcmN1bXN0YW5jZXMuICBGb3IgZXhhbXBsZSwgb25lIG1pZ2h0IG1t
YXAoKSBwYXJ0IG9mIGEgZmlsZSBhbmQgdGhlCj4gPiBmb2xpbyBjb250YWluaW5nIHRoZSBkYXRh
IGlzIG9ubHkgcGFydGlhbGx5IG1hcHBlZC4KPgo+IEkgZG9uJ3Qgc2VlIGhvdy93aGVuIHdlIHdv
dWxkIG1hcmsgYSBQVEUgYXMgbmFwb3QgaWYgd2UgdHJ5IHRvIG1tYXAgYW4KPiBhZGRyZXNzIHRo
YXQgaXMgbm90IGFsaWduZWQgb24gdGhlIHNpemUgb2YgYSBuYXBvdCBtYXBwaW5nIG9yIGRvZXMg
bm90Cj4gaGF2ZSBhIG5hcG90IG1hcHBpbmcgc2l6ZS4KPgo+ID4gVGhlIGZpbGVzeXN0ZW0gLwo+
ID4gcGFnZSBjYWNoZSBtaWdodCBjaG9vc2UgdG8gdXNlIGEgZm9saW8gb3JkZXIgdGhhdCBpc24n
dCBvbmUgb2YgeW91cgo+ID4gbWFnaWMgaGFyZHdhcmUgb3JkZXJzLgo+ID4KPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAqIHNpemUgb2YgdGhlIG1hcHBpbmcgaXMgbm90IGEga25vd24gTkFQ
T1QgbWFwcGluZwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICogc2l6ZSwgc28gY2xlYXIg
dGhlIE5BUE9UIGJpdCBhbmQgbWFwIHRoaXMgd2l0aG91dAo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICogTkFQT1Qgc3VwcG9ydDogY29yZSBtbSBvbmx5IG1hbmlwdWxhdGVzIHB0ZSB3aXRo
IHRoZQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICogcmVhbCBwZm4gc28gd2Uga25vdyB0
aGUgcHRlIGlzIHZhbGlkIHdpdGhvdXQgdGhlIE4KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAqIGJpdC4KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAqLwo+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgcHJfZXJyKCJJbmNvcnJlY3QgTkFQT1QgbWFwcGluZywgcmVzZXR0aW5nLlxu
Iik7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBwdGV2YWwgPSBwdGVfY2xlYXJfbmFwb3Qo
cHRldmFsKTsKPiA+ID4gKyAgICAgICAgICAgICB9IGVsc2Ugewo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgLyoKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAqIE5BUE9UIHB0ZXMgdGhh
dCBhcnJpdmUgaGVyZSBvbmx5IGhhdmUgdGhlIE4gYml0IHNldAo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICogYW5kIHRoZWlyIHBmbiBkb2VzIG5vdCBjb250YWluIHRoZSBtYXBwaW5nIHNp
emUsIHNvCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgKiBzZXQgdGhhdCBoZXJlLgo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICovCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBw
dGV2YWwgPSBwdGVfbWtuYXBvdChwdGV2YWwsIG9yZGVyKTsKPiA+Cj4gPiBZb3UncmUgYXNzdW1p
bmcgdGhhdCBwdGV2YWwgaXMgYWxpZ25lZCB0byB0aGUgb3JkZXIgdGhhdCB5b3UndmUKPiA+IGNh
bGN1bGF0ZWQsIGFuZCBhZ2FpbiB0aGF0J3Mgbm90IHRydWUuICBGb3IgZXhhbXBsZSwgdGhlIHVz
ZXIgbWF5IGhhdmUKPiA+IGNhbGxlZCBtbWFwKCkgb24gcmFuZ2UgMHgyMTAwMC0weDQwMDAwIG9m
IGEgZmlsZSB3aGljaCBpcyBjb3ZlcmVkIGJ5Cj4gPiBhIDEyOGtCIGZvbGlvLiAgWW91J2xsIGJl
IGNhbGxlZCB3aXRoIGEgcHRldmFsIHBvaW50aW5nIHRvIDB4MjEwMDAgYW5kCj4gPiBjYWxjdWxh
dGUgdGhhdCB5b3UgY2FuIHB1dCBhIDY0a0IgZW50cnkgdGhlcmUgLi4uIG5vLgo+Cj4gWWVzLCBJ
IGFncmVlIHdpdGggdGhpcywgdGhlbiB3ZSBoYXZlIHRvIGdvIHRocm91Z2ggdGhlIGxpc3Qgb2Yg
cHRlcwo+IGFuZCBjaGVjayBpZiBpbnNpZGUgdGhlIHJlZ2lvbiB3ZSBhcmUgY3VycmVudGx5IHNl
dHRpbmcsIHNvbWUKPiBzdWJyZWdpb25zIGNvcnJlc3BvbmQgdG8gYSBuYXBvdCBtYXBwaW5nLgoK
U28gSSBsb29rZWQgYXQgdGhhdCBhbmQgSSB0aGluayB3ZSBhcmUgc2FmZSB3aXRoIHRoZSBpbXBs
ZW1lbnRhdGlvbiBpbgp0aGlzIHBhdGNoIGJlY2F1c2U6CgotIHRoaXMgcGF0Y2hzZXQgb25seSBk
ZWFscyB3aXRoIGh1Z2V0bGIsIHdoaWNoIGNhbm5vdCBiZSBwYXJ0aWFsbHkKbWFwcGVkIChyaWdo
dD8pCi0gd2hlbiB3ZSdsbCBhZGQgc3VwcG9ydCBmb3IgVEhQICh1cGNvbWluZyBzZXJpZXMpLCB3
ZSdsbCB1c2UgYXJtNjQKc2V0X3B0ZXMoKSBpbXBsZW1lbnRhdGlvbiB3aGljaCBzcGxpdHMgdGhl
IHJlZ2lvbiB0byBtYXAgdXNpbmcgdGhlCmNvbnRwdGUgbWFwcGluZyBzaXplCihodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC92Ni4xMy40L3NvdXJjZS9hcmNoL2FybTY0L21tL2NvbnRw
dGUuYyNMMjY4KSwKc28gd2UgY2FuJ3QgbWFyayBhbiB1bmFsaWduZWQgcmVnaW9uIHdpdGggdGhl
IGNvbnRwdGUgYml0LgoKTGV0IG1lIGtub3cgaWYgSSBtaXNzZWQgc29tZXRoaW5nLAoKVGhhbmtz
IGFnYWluLAoKQWxleAoKPgo+IFRoYW5rcyBmb3IgeW91ciBmZWVkYmFjaywKPgo+IEFsZXgKPgo+
Cj4gPgo+ID4gSSdkIHN1Z2dlc3QgeW91IGRvIHNvbWUgdGVzdGluZyB3aXRoIGZzdGVzdHMgYW5k
IHhmcyBhcyB5b3VyIHVuZGVybHlpbmcKPiA+IGZpbGVzeXN0ZW0uICBJdCBzaG91bGQgY2F0Y2gg
dGhlc2Uga2luZHMgb2YgbWlzdGFrZXMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
