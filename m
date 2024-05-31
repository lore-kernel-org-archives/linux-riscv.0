Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D25C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 20:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IEljSMeuSZ+wGOl/FWVSrCKtyInLOKriDkghMzlIQgw=; b=iK4yYAnlE4d7nF
	k89hMWs+w0shJFJprnyxo/8PCzaTWXDAqYbbDMH99RS0s6s6EwyKxYPPpCMWyRq70ofRXgG5p/QIR
	j3XzyblOM1ttXgoGPVk7Pajj0fkvemyBTd48HBcotRS9L+EJfKjXToWK5LjPJNiWPTjeV2QZZmIIy
	KBBttDmilrCrH08gr+5wPbeHMbZ22WgsZJ0qJrAcdKSJN8xbaHN98Z2mtOqX5eiTEa4kgyxt2I8Y5
	kbTguY++pCq4JcQ6RCdkqod2FINaf/jGxxZYY6a43dJCcg6UmqdpuuPeoKMVeyRF13pPc43bu/WW/
	DselpjnJIpAVEOCBP4Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD8v4-0000000BNY4-2s6p;
	Fri, 31 May 2024 20:32:11 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD8ux-0000000BNUG-13av
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 20:32:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-41fef5dda72so4045e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 31 May 2024 13:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717187516; x=1717792316; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InPM3IgrwlWAIe+nSHKsuhmVDndDnlj7rMcdOWuFi5w=;
        b=PGSGIZUnM/0OxAoREh9Qw16+U8WraiW0dZUetaMz7DzwF2iwDdgiVIPGpyuRGHLtxF
         7Br/kpWaLRjL3cTIVeOwoWdJo5TNmoHAWAoT9vMt1HwRbuj8XULVM+nulErARq+ju5ZD
         lQShOY8np8snNEoFJ/LP4bQ/9rCsgl9KrTVBMto4wTuMn4y3K1VRmCTiohUWZczi4T71
         x6FFs+oXOiZiA54/DYY57zk4tSiPdHt7veiPIKJpOjG0L97nzJlktWD3IC/zYVpRNOwQ
         YogMCwlMl7nYH1KnH9DSbntegfAUArQzDvHAEK+XR1nC0pCych3Z/FpKAIzYYbyGpygh
         fHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717187516; x=1717792316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InPM3IgrwlWAIe+nSHKsuhmVDndDnlj7rMcdOWuFi5w=;
        b=oKF5FCbrGyrKivfDz0SjR/lT8jGvGN7aEzjP3P7d65xVFW3WLNQjqSNj03YPnbh6GW
         aszf4YULqzZNJkhfC3SqBN1ug2SR2kJI9GZR5FcxmB6hDt7htxH/48fCRX2XVSFZ3iLT
         sy9Y1U1CAY5xCWYa0WUDRucmVoo0j3XJMLGONfWFIoLHfjdewvk78njkEI9kN3Ty2mIY
         BBpFFIG8LmdqJB7xDmK3Sbt6W7Dtg/gcWC/F92krw8x+3iG4pV+e+YxR3oJXzATC5MQQ
         vLruuOR5W/sulfIkh8zPukmsJlP4UzrB4M053qVUuxRM/8/+7qvpozJfLVVT+X2SeCfr
         y/Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVjUxvAHjs/G5OM444fo3NRPtom57xbfhnfk4nII/inP0T7nqgOHXarQVM7z1rq7yDnrb6GdJQY9VkdMsfYzYzi0LiWSWYOrATRfRSxtFD8
X-Gm-Message-State: AOJu0Yx5RrAhslxTJJG1PnK4b38w0/MPzdd7DRN6frXdHOQX1UPgr3Wy
	5a4Ea2F2lmSKOfTbMWeeHN66dU0KjtlZeJY1Wox5A8g8QQ2bIEP+FL/O6WdSsAqN/9c0epueP4g
	x46qUc/JTpC2wqV2Rl4zxyFUNvrdcpLcbjDkN
X-Google-Smtp-Source: AGHT+IECr7zScct/L9KDZG2FMT9+ZV9pueXumB1G4qrj8mkBEYnZr/Z/kM44zsq5c/gUQqURoi9spkN6RMIRJ4Ct+FE=
X-Received: by 2002:a05:600c:299:b0:418:97c6:188d with SMTP id
 5b1f17b1804b1-421358ce41bmr41075e9.7.1717187515962; Fri, 31 May 2024 13:31:55
 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <Zll7IuGYGG5uI20W@linux.dev>
In-Reply-To: <Zll7IuGYGG5uI20W@linux.dev>
From: Yu Zhao <yuzhao@google.com>
Date: Fri, 31 May 2024 14:31:17 -0600
Message-ID: <CAOUHufa50Dy8CJ5+D10Khs4NU-3Pv0B8qi-GYkcppctTVUkPcA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
To: Oliver Upton <oliver.upton@linux.dev>
Cc: James Houghton <jthoughton@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ankit Agrawal <ankita@nvidia.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Bibo Mao <maobibo@loongson.cn>, Catalin Marinas <catalin.marinas@arm.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Sean Christopherson <seanjc@google.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_133203_371353_EE15320D 
X-CRM114-Status: GOOD (  27.81  )
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

T24gRnJpLCBNYXkgMzEsIDIwMjQgYXQgMToyNOKAr0FNIE9saXZlciBVcHRvbiA8b2xpdmVyLnVw
dG9uQGxpbnV4LmRldj4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAyOSwgMjAyNCBhdCAwMzowMzoy
MVBNIC0wNjAwLCBZdSBaaGFvIHdyb3RlOgo+ID4gT24gV2VkLCBNYXkgMjksIDIwMjQgYXQgMTI6
MDXigK9QTSBKYW1lcyBIb3VnaHRvbiA8anRob3VnaHRvbkBnb29nbGUuY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gU2Vjb25kYXJ5IE1NVXMgYXJlIGN1cnJlbnRseSBjb25zdWx0ZWQgZm9yIGFjY2Vz
cy9hZ2UgaW5mb3JtYXRpb24gYXQKPiA+ID4gZXZpY3Rpb24gdGltZSwgYnV0IGJlZm9yZSB0aGVu
LCB3ZSBkb24ndCBnZXQgYWNjdXJhdGUgYWdlIGluZm9ybWF0aW9uLgo+ID4gPiBUaGF0IGlzLCBw
YWdlcyB0aGF0IGFyZSBtb3N0bHkgYWNjZXNzZWQgdGhyb3VnaCBhIHNlY29uZGFyeSBNTVUgKGxp
a2UKPiA+ID4gZ3Vlc3QgbWVtb3J5LCB1c2VkIGJ5IEtWTSkgd2lsbCBhbHdheXMganVzdCBwcm9j
ZWVkIGRvd24gdG8gdGhlIG9sZGVzdAo+ID4gPiBnZW5lcmF0aW9uLCBhbmQgdGhlbiBhdCBldmlj
dGlvbiB0aW1lLCBpZiBLVk0gcmVwb3J0cyB0aGUgcGFnZSB0byBiZQo+ID4gPiB5b3VuZywgdGhl
IHBhZ2Ugd2lsbCBiZSBhY3RpdmF0ZWQvcHJvbW90ZWQgYmFjayB0byB0aGUgeW91bmdlc3QKPiA+
ID4gZ2VuZXJhdGlvbi4KPiA+Cj4gPiBDb3JyZWN0LCBhbmQgYXMgSSBleHBsYWluZWQgb2ZmbGlu
ZSwgdGhpcyBpcyB0aGUgb25seSByZWFzb25hYmxlCj4gPiBiZWhhdmlvciBpZiB3ZSBjYW4ndCBs
b2NrbGVzc2x5IHdhbGsgc2Vjb25kYXJ5IE1NVXMuCj4gPgo+ID4gSnVzdCBmb3IgdGhlIHJlY29y
ZCwgdGhlIChjcnVkZSkgYW5hbG9neSBJIHVzZWQgd2FzOgo+ID4gSW1hZ2luZSBhIGxhcmdlIHJv
b20gd2l0aCBtYW55IGJpbGxzICgkMSwgJDUsICQxMCwgLi4uKSBvbiB0aGUgZmxvb3IsCj4gPiBi
dXQgeW91IGFyZSBvbmx5IGFsbG93ZWQgdG8gcGljayB1cCAxMCBvZiB0aGVtIChhbmQgcHV0IHRo
ZW0gaW4geW91cgo+ID4gcG9ja2V0KS4gQSBzbWFydCBtb3ZlIHdvdWxkIGJlIHRvIHN1cnZleSB0
aGUgcm9vbSAqZmlyc3QgYW5kIHRoZW4qCj4gPiBwaWNrIHVwIHRoZSBsYXJnZXN0IG9uZXMuIEJ1
dCBpZiB5b3UgYXJlIGNhcnJ5aW5nIGEgNTAwIGxicyBiYWNrcGFjaywKPiA+IHlvdSB3b3VsZCBq
dXN0IHdhbnQgdG8gcGljayB1cCB3aGljaGV2ZXIgdGhhdCdzIGluIGZyb250IG9mIHlvdSByYXRo
ZXIKPiA+IHRoYW4gd2FsayB0aGUgZW50aXJlIHJvb20uCj4gPgo+ID4gTUdMUlUgc2hvdWxkIG9u
bHkgc2NhbiAob3IgbG9va2Fyb3VuZCkgc2Vjb25kYXJ5IE1NVXMgaWYgaXQgY2FuIGJlCj4gPiBk
b25lIGxvY2tsZXNzLiBPdGhlcndpc2UsIGl0IHNob3VsZCBqdXN0IGZhbGwgYmFjayB0byB0aGUg
ZXhpc3RpbmcKPiA+IGFwcHJvYWNoLCB3aGljaCBleGlzdGVkIGluIHByZXZpb3VzIHZlcnNpb25z
IGJ1dCBpcyByZW1vdmVkIGluIHRoaXMKPiA+IHZlcnNpb24uCj4KPiBHcmFiYmluZyB0aGUgTU1V
IGxvY2sgZm9yIHdyaXRlIHRvIHNjYW4gc3Vja3MsIG5vIGFyZ3VtZW50IHRoZXJlLiBCdXQKPiBj
YW4geW91IHBsZWFzZSBiZSBzcGVjaWZpYyBhYm91dCB0aGUgaW1wYWN0IG9mIHJlYWQgbG9jayB2
LiBSQ1UgaW4gdGhlCj4gY2FzZSBvZiBhcm02ND8gSSBoYWQgYXNrZWQgYWJvdXQgdGhpcyBiZWZv
cmUgYW5kIHlvdSBuZXZlciByZXBsaWVkLgo+Cj4gTXkgY29uY2VybiByZW1haW5zIHRoYXQgYWRk
aW5nIHN1cHBvcnQgZm9yIHNvZnR3YXJlIHRhYmxlIHdhbGtlcnMKPiBvdXRzaWRlIG9mIHRoZSBN
TVUgbG9jayBlbnRpcmVseSByZXF1aXJlcyBtb3JlIHdvcmsgdGhhbiBqdXN0IGRlZmVycmluZwo+
IHRoZSBkZWFsbG9jYXRpb24gdG8gYW4gUkNVIGNhbGxiYWNrLiBXYWxrZXJzIHRoYXQgcHJldmlv
dXNseSBhc3N1bWVkCj4gJ2V4Y2x1c2l2ZScgYWNjZXNzIHdoaWxlIGhvbGRpbmcgdGhlIE1NVSBs
b2NrIGZvciB3cml0ZSBtdXN0IG5vdyBjb3BlCj4gd2l0aCB2b2xhdGlsZSBQVEVzLgo+Cj4gWWVz
LCB0aGlzIHByb2JsZW0gYWxyZWFkeSBleGlzdHMgd2hlbiBoYXJkd2FyZSBzZXRzIHRoZSBBRiwg
YnV0IHRoZQo+IGxvY2stZnJlZSB3YWxrZXIgaW1wbGVtZW50YXRpb24gbmVlZHMgdG8gYmUgZ2Vu
ZXJpYyBzbyBpdCBjYW4gYmUgYXBwbGllZAo+IGZvciBvdGhlciBQVEUgYml0cy4KCkRpcmVjdCBy
ZWNsYWltIGlzIG11bHRpLXRocmVhZGVkIGFuZCBlYWNoIHJlY2xhaW1lciBjYW4gdGFrZSB0aGUg
bW11CmxvY2sgZm9yIHJlYWQgKHRlc3RpbmcgdGhlIEEtYml0KSBvciB3cml0ZSAodW5tYXBwaW5n
IGJlZm9yZSBwYWdpbmcKb3V0KSBvbiBhcm02NC4gVGhlIGZ1bmRhbWVudGFsIHByb2JsZW0gb2Yg
dXNpbmcgdGhlIHJlYWRlcnMtd3JpdGVyCmxvY2sgaW4gdGhpcyBjYXNlIGlzIHByaW9yaXR5IGlu
dmVyc2lvbjogdGhlIHJlYWRlcnMgaGF2ZSBsb3dlcgpwcmlvcml0eSB0aGFuIHRoZSB3cml0ZXJz
LCBzbyBpZGVhbGx5LCB3ZSBkb24ndCB3YW50IHRoZSByZWFkZXJzIHRvCmJsb2NrIHRoZSB3cml0
ZXJzIGF0IGFsbC4KClVzaW5nIG15IHByZXZpb3VzIChjcnVkZSkgYW5hbG9neTogcHV0aW5nIHRo
ZSBiaWxsIHJpZ2h0IGluIGZyb250IG9mCnlvdSAodGhlIHdyaXRlcnMpIHByb2ZpdHMgaW1tZWRp
YXRlbHkgd2hlcmVhcyBzZWFyY2hpbmcgZm9yIHRoZQpsYXJnZXN0IGJpbGwgKHRoZSByZWFkZXJz
KSBjYW4gYmUgZnV0aWxlLgoKQXMgSSBzYWlkIGVhcmxpZXIsIEkgcHJlZmVyIHdlIGRyb3AgdGhl
IGFybTY0IHN1cHBvcnQgZm9yIG5vdywgYnV0IEkKd2lsbCBub3Qgb2JqZWN0IHRvIHRha2luZyB0
aGUgbW11IGxvY2sgZm9yIHJlYWQgd2hlbiBjbGVhcmluZyB0aGUKQS1iaXQsIGFzIGxvbmcgYXMg
d2UgZnVsbHkgdW5kZXJzdGFuZCB0aGUgcHJvYmxlbSBoZXJlIGFuZCBkb2N1bWVudCBpdApjbGVh
cmx5LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
