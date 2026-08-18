Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8C4C5DF81
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 18:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6NBvqGwwoaAadyG5O8SMVvj65iLDtKG0dOBhJNMarU=; b=lPFvkGYrW4khZT
	a1FvrJLVY6SwRJb1VhMj7N0Uv2oylBd6xA8ie0rLogqKzZ3qlgAjvGWmSChNyNG12gAOFQMRwnvHS
	jCQxAaPo9DHXCie6d4m3nO8+otP987hXzYIGkpvfCZj65IW0HBe7LRgxY2BxyC3oCKjZkZVP4C9MH
	P/LRrJo1YY3CHp3D52oQbBWFQDjKjxN75OHDXG67HdQiJ7QimKvxSX77fyiD9X4JguGlSnJ1d72al
	IYC6/+F67Bw7ZuTiBDAE4p/q4bbA6exAV8IKUxkuQsYKNlyyhDBX7y2SLsUwmGMvsCTOsbybljEIr
	eQq5JL7DjgcEuZcpI0GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOjF-00000008Wy2-3b1B;
	Tue, 18 Aug 2026 18:40:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOjC-00000008WxD-3NRG
	for linux-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 18:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787078400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CzedmhxGo98Pjf63Ypc/yiocJEW8goTcelERlhuIJ7g=;
	b=SsXpr9svVELPbdenMlD5CB5EHIHgBiCSoSUEoT4YIW737aADjm00qhDRiadnxXxpECNyVZ
	82PrOpSWKMQ3uflc/oJHWZdmUOlyFD6h/TZTRfdIF0LKlk68BGhxEr1I9XhFbROWl+B10c
	O52FYUC+ezhn3u9P5YancJVjeWg/ADg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-hBPsazdMNnuLAIa0NFFcgQ-1; Tue, 18 Aug 2026 14:39:58 -0400
X-MC-Unique: hBPsazdMNnuLAIa0NFFcgQ-1
X-Mimecast-MFC-AGG-ID: hBPsazdMNnuLAIa0NFFcgQ_1787078397
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49545071724so1578695e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Aug 2026 11:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787078397; x=1787683197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CzedmhxGo98Pjf63Ypc/yiocJEW8goTcelERlhuIJ7g=;
        b=C04s0mfHduUq4638BGDAGEQ8rc7LXXqel/9/WNbB5Ya76dCMn+IH13Pkf8eIuadKaN
         ABtNuFG3C00CnyIr7E70CXvQZFQotfcUe5eRl8W1HBVmCvb/7IFLIIoPTFKXCXkGgVCc
         0mGJsw/yuNCZk7zWeHm7rTD5r+jRxepoWOfZqXA5UK+h78VA6eorYcv8jq+OOXyYHgag
         pF77RmXZunlsDIC3423hKCoor2yX2apGfVXThVVlHpYEQpcV9ZAKxEnxuDjdErIpzBQm
         z0gl6/HpdO5Iol9a0gmmhYSVcOgLVesec1p4Sr0TL/7hYhtZioksxwPlf3uUldl5uSum
         EKNQ==
X-Forwarded-Encrypted: i=1; AHgh+RroN0i5cSAl8hKCMHuKc+6mvZ2RpqHH5sVF+FWQ03IS5N/gHadD0m+cf90qjy1s7viUwEf5bhb9jZNQSw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpoc2f4kYcJ21fJlTYkLT2/nfzEq/59hxQ9rlF0UHsnjkbboR5
	PtjIjZZB9yrObkueDJlXkgN/qEMY5i0MU5d3r2ljfPOiWWIe9bzeeJs5NzzzKBvpB6oFIykl0ZP
	T/WIxDumvio8X9NVStWWZLdLeiHw1imyvZiIfrkNzZsyU+xUrHB97563YbOXxcJtTk7VT67h4zK
	gLTA4NDCf4s6mKxcPYRZob64AJJxRNUWmOts95NXiyDmY+
X-Gm-Gg: AR+sD11X+chBN+WTPKzsf4eoGmdXMNrml27Ch9666iE7rbsjpeOr7PRHMnaHl1QZ3rl
	PcqMW7erSTuPFUc3gYDxBV+UU6fzsgutwajhOULMJGvqhcxKuerkgrFwbFqsk5UhngbDG9lZqF+
	kZbDNKnC8RCov4NwQdwPvkmpG0o+RapBZW1JlL6jytTEcv84KnMSZ8H+Ipc5EKX1jVc190cMd0X
	AZIVlxL27V9crrlaA==
X-Received: by 2002:a05:600c:6091:b0:499:48bb:417e with SMTP id 5b1f17b1804b1-499a8f1446amr2469435e9.2.1787078396856;
        Tue, 18 Aug 2026 11:39:56 -0700 (PDT)
X-Received: by 2002:a05:600c:6091:b0:499:48bb:417e with SMTP id
 5b1f17b1804b1-499a8f1446amr2468815e9.2.1787078396490; Tue, 18 Aug 2026
 11:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260723-p8700-zalrsc-v4-1-59c21b252e29@htecgroup.com> <20260810-preoccupy-earwig-c8d98044c1da@spud>
In-Reply-To: <20260810-preoccupy-earwig-c8d98044c1da@spud>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Tue, 18 Aug 2026 14:39:45 -0400
X-Gm-Features: AcwNN1W_5_815GdcZYDUV0gMyxhSZwdF6G0K_cxz_g1LfttZV2HqaMMdEXOUixI
Message-ID: <CADRr4bcd5Bm7bdB7RwE=XBBq7igH0H4x2Ok0MLTMEv8P0+S-8g@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: Use Zalrsc extension to implement atomic functions
To: Conor Dooley <conor@kernel.org>
Cc: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Yury Norov <yury.norov@gmail.com>, 
	Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Charlie Jenkins <charlie@rivosinc.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Paul Walmsley <pjw@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Chao-ying Fu <cfu@mips.com>, Aleksandar Rikalo <arikalo@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5EeG7edmn541nQbRznsvVdL8GXNF9qmRZksGT57O6tQ_1787078397
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_114002_945995_D087322C 
X-CRM114-Status: GOOD (  38.32  )
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

T24gTW9uLCBBdWcgMTAsIDIwMjYgYXQgMTI6NDbigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdWwgMjMsIDIwMjYgYXQgMDU6NTE6NTNQTSAr
MDIwMCwgQWxla3NhIFBhdW5vdmljIHdyb3RlOgo+ID4gRnJvbTogQ2hhby15aW5nIEZ1IDxjZnVA
bWlwcy5jb20+Cj4gPgo+ID4gTUlQUyBQODcwMCBkb2VzIG5vdCBuYXRpdmVseSBzdXBwb3J0IFph
YW1vIGluc3RydWN0aW9ucy4KPiA+IFRoZXkgYXJlIGVtdWxhdGVkIHdpdGggWmFscnNjIGV4dGVu
c2lvbiBpbnN0cnVjdGlvbnMgaW5zdGVhZCBbMV0uCj4gPiBTaW5jZSB0aGUgZW11bGF0aW9uIGlz
IGltcGxlbWVudGVkIHRocm91Z2ggTS1tb2RlIHRyYXBzIGluIHRoZSBTQkkKPiA+IGxheWVyLCBp
dCBpcyBiZXN0IHRvIGF2b2lkIHVzaW5nIHRoZXNlIGluc3RydWN0aW9ucyB3aGVyZXZlciBwb3Nz
aWJsZSBvbgo+ID4gdGhlIFA4NzAwLgo+ID4KPiA+IEltcGxlbWVudCBrZXJuZWwgYXRvbWljIG9w
ZXJhdGlvbnMgdXNpbmcgTFIvU0Mgc2VxdWVuY2VzIG9ubHkuCj4KPiA+IFRoaXMgaXMgYWNoaWV2
ZWQgYnkgdXNpbmcgdGhlIGVycmF0YSBtZWNoYW5pc20sIHdpdGggbWluaW1hbAo+ID4gaW50ZXJm
ZXJlbmNlIG9uIG90aGVyIGNvcmVzLgo+Cj4gVGhpcyBkb2VzIG5vdCBzZWVtIGFwcHJvcHJpYXRl
LCB5b3UgZG9uJ3QgaGF2ZSBhbiBhY3R1YWwgZXJyYXR1bS4KPiBSYXRoZXIsIHlvdSBkb24ndCBt
ZWV0IHRoZSBtaW5pbXVtIGV4dGVuc2lvbiByZXF1aXJlbWVudHMgdGhhdCBsaW51eAo+IGN1cnJl
bnRseSBoYXMgYW5kIHdhbnQgdG8gYXZvaWQgZW11bGF0aW9uLgo+Cj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogQ2hhby15aW5nIEZ1IDxjZnVAbWlwcy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGVr
c2FuZGFyIFJpa2FsbyA8YXJpa2Fsb0BnbWFpbC5jb20+Cj4gPiBDby1kZXZlbG9wZWQtYnk6IEFs
ZWtzYSBQYXVub3ZpYyA8YWxla3NhLnBhdW5vdmljQGh0ZWNncm91cC5jb20+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBBbGVrc2EgUGF1bm92aWMgPGFsZWtzYS5wYXVub3ZpY0BodGVjZ3JvdXAuY29tPgo+
ID4KPiA+IFsxXSBodHRwczovL21pcHMuY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDI2LzAzL01J
UFNfUDg3MDBfUDg3MDAtRl9Qcm9ncmFtbWVyc19SZWZlcmVuY2VfR3VpZGVfUmV2MS44Nl8yLTE3
LTIwMjYucGRmCj4KPiBUaGlzIHNob3VsZCBiZSBhIExpbms6IHRhZywgYW5kIGJlIGFib3ZlIHRo
ZSBzaWdub2Zmcy4KPiA+Cj4gPiAtLS0KPiA+IFRoZSBwYXRjaCB3YXMgdGVzdGVkIG9uIFFFTVUg
Y29uZmlndXJlZCB0byBlbXVsYXRlIGFuIGVpZ2h0LWhhcnQgTUlQUyBQODcwMCBDUFUuCj4gPiBU
ZXN0aW5nIGRvbmUgc2luY2UgdjM6IGZ1dGV4IGtzZWxmdGVzdHMgYW5kIHBlcmYgZnV0ZXggdGVz
dHMuIFRoZXNlIHRlc3RzIGNhdWdodCB0aGUgaXNzdWVzIGRlc2NyaWJlZCBiZWxvdy4KPiA+IFRo
ZSBzYW1lIHRlc3RzIHdlcmUgZXhlY3V0ZWQgb24gdGhlIEJvc3RvbiBib2FyZCB3aXRoIGEgc2lu
Z2xlLWhhcnQgUDg3MDAgY29yZS4KPiA+Cj4gPiBTaW5jZSB0aGUgbWFpbiBpc3N1ZSB3YXMgd2l0
aCBhbiBpbmNvcnJlY3RseSB3cml0dGVuIGVycmF0dW0sIGl0IHNob3VsZG4ndCBhZmZlY3QgVmxh
ZGltaXIncyB2ZXJzaW9uIFsxXS4KPiA+IEhvd2V2ZXIsIHNpbmNlIGNoaXBzIHN1cHBvcnRpbmcg
b25seSBvbmUgcGFydCBvZiB0aGUgQSBleHRlbnNpb24gYXJlIHJhcmUsIHdlIGJlbGlldmUgaXQg
bWlnaHQgYmUKPiA+IGJldHRlciB0byBhZGRyZXNzIHRoaXMgdXNpbmcgdGhlIGFsdGVybmF0aXZl
IG1lY2hhbmlzbSwgaW5zdGVhZCBvZiBkZW1hbmRpbmcgdGhhdCB0aGUgd2lkZXIgY29tbXVuaXR5
Cj4gPiByZWxheCB0aGUgQSBleHRlbnNpb24gcmVxdWlyZW1lbnQuCj4KPiBBbHRlcm5hdGl2ZXMs
IHN1cmUuIFJlbGF4aW5nIHRoZSBBIGV4dGVuc2lvbiByZXF1aXJlbWVudCBvbiB0aGUgb3RoZXIK
PiBoYW5kIGJhc2ljYWxseSBtYWtlcyBubyBkaWZmZXJlbmNlLCBpZiB3ZSBoYXZlIHRvIGluc2Vy
dCBhbiBhbHRlcm5hdGl2ZSBpbnRvCj4gYW55dGhpbmcgdXNpbmcgQU1PIGluc3RydWN0aW9ucywg
bWF5IGFzIHdlbGwgZG8gaXQgcHJvcGVybHkgYW5kIHN1cHBvcnQgWmFscnNjCj4gb25seSBzeXN0
ZW1zIHJhdGhlciB0aGFuIGFidXNlIHRoZSBlcnJhdGEgbWVjaGFuaXNtcy4KCkkgdGhpbmsgdGhl
IGlzc3VlIHdvdWxkIGJlIHJpc2N2X2NwdWZlYXR1cmVfcGF0Y2hfZnVuYyBkb2Vzbid0IGdldCBj
YWxsZWQKaW4gUklTQ1ZfQUxURVJOQVRJVkVTX0VBUkxZX0JPT1QuIEkgYWxzbyB0aGluayB0aGF0
IHdlIHNob3VsZApkbyBpdCBwcm9wZXJseSBhbmQgc3VwcG9ydCBaYWxyc2Mgb25seSBzeXN0ZW1z
LCBidXQgdGhpcyBpcyBhIHN0ZXAgaW4KdGhlIHJpZ2h0IGRpcmVjdGlvbi4KSSd2ZSBiZWVuIHBl
cnNvbmFsbHkgaW50ZXJlc3RlZCBpbiBnZXR0aW5nIHRoaXMgdG8gd29yayBmb3IgYSB3aGlsZSwK
YW5kIHdhbnQgdG8gY29udGludWUgbXkgZWZmb3J0cwplc3BlY2lhbGx5IG5vdyB0aGF0IHRoZXJl
IGFyZSBwcm9kdWN0cyBiYWNraW5nIGl0LgoKPiBBbnkgbXVsdGlwbGF0Zm9ybSBrZXJuZWwKPiAo
c28gYW55dGhpbmcgcHJvdmlkZWQgYnkgYSBkaXN0cm8pIGlzIGdvaW5nIHRvIHR1cm4gb24gYW55
IGVycmF0YSB0aGF0IGFyZSBub3QKPiBsaXN0ZWQgYXMgYmVpbmcgbm9uLXBvcnRhYmxlLgo+Cj4g
VGhlIG1pbmltdW0gcmVxdWlyZW1lbnRzIGhhdmUgYmVlbiBrbm93biBmb3IgYSBsb25nIHRpbWUg
dG9vLCBzaW5jZSB0aGUKPiBwb3J0IHdhcyBtZXJnZWQsIHNvIEkgcGVyc29uYWxseSBkb24ndCBm
ZWVsIGNoYXJpdGFibGUgaGVyZS4gWW91cgo+IGZpcm13YXJlIGFscmVhZHkgY2FuIGRlYWwgd2l0
aCB0aGUgZW11bGF0aW9uLCBzbyBJIGRvbid0IHJlYWxseSBzZWUgd2h5Cj4gd2Ugc2hvdWxkIGJl
IGFkZGluZyBhbHRlcm5hdGl2ZXMgYmVjYXVzZSBwZW9wbGUgc2VsbGluZyAob3IgYnV5aW5nKSBJ
UAo+IGNhbm5vdCBiZSBib3RoZXJlZCB0byBtZWV0IHRoZSBleHRyZW1lbHkgYmFzaWMgbWluaW11
bSByZXF1aXJlbWVudHMgb2YgdGhlCj4gc29mdHdhcmUgdGhleSB3YW50IHRvIHN1cHBvcnQuCgpJ
IHdvdWxkIGFzc3VtZSBpdCdzIGJlY2F1c2UgZW11bGF0aW9uIGlzIHZlcnkgc2xvdy4KClRoYW5r
cywKSmVzc2UgVGF1YmUKCj4KPiA+Cj4gPiBDaGFuZ2VzIGluIHY0Ogo+ID4gLSBUaGUgYW1vIHBh
cnQgb2YgdGhlIEFMVF9URVNUX0FORF9PUF9CSVRfT1JEIGVycmF0dW0gZXJyb25lb3VzbHkgaGFy
ZGNvZGVkIHplcm8gYXMgdGhlIGRlc3RpbmF0aW9uIHJlZ2lzdGVyLgo+ID4gICBUaGlzIGlzIGZp
eGVkIGluIHY0Lgo+ID4gLSBmdXRleC5oIHdhcyBtaXNzaW5nIHRoZSBBTkROIGNhc2UuCj4gPiAt
IExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA5MDEtcDg3MDAtemFs
cnNjLXYzLTEtZWM2NGZhYmJlMDkzQGh0ZWNncm91cC5jb20KPiA+Cj4gPiBDaGFuZ2VzIGluIHYz
Ogo+ID4gLSBVc2UgYWx0ZXJuYXRpdmVzIHRvIHJlcGxhY2UgQU1PIGluc3RydWN0aW9ucyB3aXRo
IExSL1NDCj4gPiAtIFJlYmFzZSBvbiBBbGV4YW5kcmUgR2hpdGkncyAiZm9yLW5leHQiIGJyYW5j
aC4KPiA+IC0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3Yv
MjAyNDEyMjUwODI0MTIuMzY3MjctMS1hcmlrYWxvQGdtYWlsLmNvbS8KPiA+Cj4gPiBMaW5rczoK
PiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI2MDEyMC1scnNj
LW9ubHktdjItMC1hNTIyZTY0MGQyN2RAbW9iaWxleWUuY29tLwo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEFsZWtzYSBQYXVub3ZpYyA8YWxla3NhLnBhdW5vdmljQGh0ZWNncm91cC5jb20+Cj4gPiAt
LS0KPiA+ICBhcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhICAgICAgICAgICAgICAgICAgICB8ICAx
MSArKwo+ID4gIGFyY2gvcmlzY3YvZXJyYXRhL21pcHMvZXJyYXRhLmMgICAgICAgICAgICAgIHwg
IDEzICstCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hdG9taWMuaCAgICAgICAgICAgICAg
fCAgMjkgKystLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYml0b3BzLmggICAgICAgICAg
ICAgIHwgIDI4ICsrLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaCAgICAg
ICAgICAgICB8ICAgOSArLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3Qu
aCAgICAgICAgIHwgMjE1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3RfdmVuZG9ycy5oIHwgICAzICstCj4gPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9mdXRleC5oICAgICAgICAgICAgICAgfCAgNDAgKystLS0KPiA+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TICAgICAgICAgICAgICAgICAgICB8ICAxMCArLQo+ID4g
IDkgZmlsZXMgY2hhbmdlZCwgMjkwIGluc2VydGlvbnMoKyksIDY4IGRlbGV0aW9ucygtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhIGIvYXJjaC9yaXNjdi9L
Y29uZmlnLmVycmF0YQo+ID4gaW5kZXggM2M5NDVkMDg2YzdkMDI2NmI2ODVmOTUwNmQ1OGIwNjYy
YWYwNzFjNC4uY2Q1YmQ1ZThlYjM5NTQxOGMzYWQxMDNkYmQ4MzZjNzc1YjdmZDkwMSAxMDA2NDQK
PiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
S2NvbmZpZy5lcnJhdGEKPiA+IEBAIC00NCw2ICs0NCwxNyBAQCBjb25maWcgRVJSQVRBX01JUFNf
UDg3MDBfUEFVU0VfT1BDT0RFCj4gPgo+ID4gICAgICAgICAgSWYgeW91IGFyZSBub3QgdXNpbmcg
dGhlIFA4NzAwIHByb2Nlc3Nvciwgc2F5IG4uCj4gPgo+ID4gK2NvbmZpZyBFUlJBVEFfTUlQU19Q
ODcwMF9BTU9fWkFMUlNDCj4gPiArICAgICBib29sICJSZXBsYWNlIEFNTyBpbnN0cnVjdGlvbnMg
d2l0aCBMUi9TQyBvbiBNSVBTIFA4NzAwIgo+ID4gKyAgICAgZGVwZW5kcyBvbiBFUlJBVEFfTUlQ
UyAmJiA2NEJJVAo+ID4gKyAgICAgZGVmYXVsdCBuCj4KPiBXaHkgaXMgdGhpcyBkZWZhdWx0IG4g
aWYgeW91ciBwbGF0Zm9ybSBkb2VzIG5vdCB3b3JrIHdpdGhvdXQgaXQ/Cj4KPiBDaGVlcnMsCj4g
Q29ub3IuCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
