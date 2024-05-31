Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1F2C25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 21:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nMVebUvnonXt0RpK5+ebcMaxMsw/xyO0RUBrYt3OmuE=; b=Zew0SvmC94lZR0
	9h7CCevX9rh1UvznG4tBoLi+1lNsVFsBhBHvh2P8QkTyds6F6UHIF/oM3nIOTS4CBrmADEtz5v7j4
	lc5cOVuRkFlnjynnPq7FdD45TY37NcACDGbDFRY6irqwQyFFGkGQ2+VV4qbIowTYNbsqb6CLMlMIb
	++1Wq+OOsryoahxwen2Yx9lOc6xWD24+qnheS1qXAxC82v48WeBjESlb5m9EKCP8qWys4twFK9xon
	ZFeevbq5FZk7cATBB2uMv2diXifOqJ/yO1UYzxo6tRMY/hTdjxBHppqNeH236LTwsEosgbuhNjgTp
	OmAv/a8uNhVTTa0BPk1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD9TF-0000000BRrE-4AFW;
	Fri, 31 May 2024 21:07:30 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD9TA-0000000BRnC-2grp
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 21:07:26 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-354f14bd80cso1634355f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 31 May 2024 14:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717189638; x=1717794438; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xx3RPcl1E+PKSqvPm+Il1+elz18o0K6zeYgjqcWFZiw=;
        b=biqcHgwFTXIVE5EzpdTBOqtqsaLHRgNKb2uNKCrStIkQoX5H9PqjoBC1UvU7jrKd0Y
         Dgxh2Lf36gJEdNvVC3HlWb7RK/WMcRz4uEe9g+Ul4jj3HJ9GzD37Rd+bP8VMA0EjYD2f
         X0CaKfm1kFq03ep3gJva+9ARYzIHuWYRH/5v7S2LiKskNbLFP4VtjCHzP0OE7mYQB9Yd
         vqp/Y0b+Xq9IJ/JXCDr7EKrjY/lT7P1qtLT+WwVBF4Wlz3vKLIPvqldzMllUo8xoZX4e
         rXNUUP1LdkOy/ZDGayVyRmoOwWwiHzKONtlrbtG3d9Gi/joxsN1GbwoH21iO+KiiwViO
         AQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717189638; x=1717794438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xx3RPcl1E+PKSqvPm+Il1+elz18o0K6zeYgjqcWFZiw=;
        b=mWaiZ/H9Lc4gRDdOtBcbKlq6Dpk4RuZd0k6T7fHBILB9LeilMWT/LbZ0t2k9501CxP
         Dnz3DYNfol1VY6NJQ5X0t9c0AYHdhBKLa5Vlul6MPyEzLnXaGuSLrnBELR75ilEFl/B/
         W+ErI5Vk2v7NsiT/zkB3tuF/2ioPLIwT0iVbFBrdNfeIMdAkwFRpkheQeiFqi2kpM0rq
         Wj+BfCCl75maEp3Sm+ZO4X8b7MV5ec/6Dn8LGaep5sjwYWvQDA2hjlJ55JOVkxMji2x+
         KHtzJxcT1r9fiip2I8pQU6f3Hyz/4amsjWiYacfGPrIuZWcI2J9Swh6qSgLpWqtmzIrH
         /j1A==
X-Forwarded-Encrypted: i=1; AJvYcCUY8lCMXvVQeH32HIm7WHnjWu4alK+8D4Uh2EiGc8chPdaIyuPPLUtnUhxEc7gGWqinYCBIThh1c1Aro+j0AnIWJUBzLfOWqt9Tuiicsu1U
X-Gm-Message-State: AOJu0YylX73GLnTpxBGb9ay0qtuccDVO4MFhYvjpUtrHOHPceznPhYPX
	wd4w9JXrpiK+ZnjS+Bz3rTB8jbJMTtEYcOZ46uE10rzB2PuTczm3uDDFX5zI7U7VXwLgMEmMP6q
	gxQcEYZ/hFLTu6GaVR/7sdUhe//PFwICeDGsE
X-Google-Smtp-Source: AGHT+IE03rpUbTjyQuwZWIC8g/9gHa5mH+MWE/NTSPO8cSZrAXipu4jJgjC2128Si67H3Tnp43CK2uN+A9xSwuw2ufM=
X-Received: by 2002:a5d:4cc1:0:b0:34c:d9f5:a8e with SMTP id
 ffacd0b85a97d-35e0f25b1a0mr2178382f8f.7.1717189638221; Fri, 31 May 2024
 14:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <Zll7IuGYGG5uI20W@linux.dev> <CAOUHufa50Dy8CJ5+D10Khs4NU-3Pv0B8qi-GYkcppctTVUkPcA@mail.gmail.com>
In-Reply-To: <CAOUHufa50Dy8CJ5+D10Khs4NU-3Pv0B8qi-GYkcppctTVUkPcA@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 31 May 2024 14:06:49 -0700
Message-ID: <CALzav=e4PmGV6ayuMCwbKWq8EnOomYKBj-0Lj+gV-kPO=h156A@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
To: Yu Zhao <yuzhao@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, James Houghton <jthoughton@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ankit Agrawal <ankita@nvidia.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Bibo Mao <maobibo@loongson.cn>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Rientjes <rientjes@google.com>, 
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
X-CRM114-CacheID: sfid-20240531_140724_714583_CC3259D2 
X-CRM114-Status: GOOD (  38.64  )
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

T24gRnJpLCBNYXkgMzEsIDIwMjQgYXQgMTozMeKAr1BNIFl1IFpoYW8gPHl1emhhb0Bnb29nbGUu
Y29tPiB3cm90ZToKPgo+IE9uIEZyaSwgTWF5IDMxLCAyMDI0IGF0IDE6MjTigK9BTSBPbGl2ZXIg
VXB0b24gPG9saXZlci51cHRvbkBsaW51eC5kZXY+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgTWF5
IDI5LCAyMDI0IGF0IDAzOjAzOjIxUE0gLTA2MDAsIFl1IFpoYW8gd3JvdGU6Cj4gPiA+IE9uIFdl
ZCwgTWF5IDI5LCAyMDI0IGF0IDEyOjA14oCvUE0gSmFtZXMgSG91Z2h0b24gPGp0aG91Z2h0b25A
Z29vZ2xlLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBTZWNvbmRhcnkgTU1VcyBhcmUgY3Vy
cmVudGx5IGNvbnN1bHRlZCBmb3IgYWNjZXNzL2FnZSBpbmZvcm1hdGlvbiBhdAo+ID4gPiA+IGV2
aWN0aW9uIHRpbWUsIGJ1dCBiZWZvcmUgdGhlbiwgd2UgZG9uJ3QgZ2V0IGFjY3VyYXRlIGFnZSBp
bmZvcm1hdGlvbi4KPiA+ID4gPiBUaGF0IGlzLCBwYWdlcyB0aGF0IGFyZSBtb3N0bHkgYWNjZXNz
ZWQgdGhyb3VnaCBhIHNlY29uZGFyeSBNTVUgKGxpa2UKPiA+ID4gPiBndWVzdCBtZW1vcnksIHVz
ZWQgYnkgS1ZNKSB3aWxsIGFsd2F5cyBqdXN0IHByb2NlZWQgZG93biB0byB0aGUgb2xkZXN0Cj4g
PiA+ID4gZ2VuZXJhdGlvbiwgYW5kIHRoZW4gYXQgZXZpY3Rpb24gdGltZSwgaWYgS1ZNIHJlcG9y
dHMgdGhlIHBhZ2UgdG8gYmUKPiA+ID4gPiB5b3VuZywgdGhlIHBhZ2Ugd2lsbCBiZSBhY3RpdmF0
ZWQvcHJvbW90ZWQgYmFjayB0byB0aGUgeW91bmdlc3QKPiA+ID4gPiBnZW5lcmF0aW9uLgo+ID4g
Pgo+ID4gPiBDb3JyZWN0LCBhbmQgYXMgSSBleHBsYWluZWQgb2ZmbGluZSwgdGhpcyBpcyB0aGUg
b25seSByZWFzb25hYmxlCj4gPiA+IGJlaGF2aW9yIGlmIHdlIGNhbid0IGxvY2tsZXNzbHkgd2Fs
ayBzZWNvbmRhcnkgTU1Vcy4KPiA+ID4KPiA+ID4gSnVzdCBmb3IgdGhlIHJlY29yZCwgdGhlIChj
cnVkZSkgYW5hbG9neSBJIHVzZWQgd2FzOgo+ID4gPiBJbWFnaW5lIGEgbGFyZ2Ugcm9vbSB3aXRo
IG1hbnkgYmlsbHMgKCQxLCAkNSwgJDEwLCAuLi4pIG9uIHRoZSBmbG9vciwKPiA+ID4gYnV0IHlv
dSBhcmUgb25seSBhbGxvd2VkIHRvIHBpY2sgdXAgMTAgb2YgdGhlbSAoYW5kIHB1dCB0aGVtIGlu
IHlvdXIKPiA+ID4gcG9ja2V0KS4gQSBzbWFydCBtb3ZlIHdvdWxkIGJlIHRvIHN1cnZleSB0aGUg
cm9vbSAqZmlyc3QgYW5kIHRoZW4qCj4gPiA+IHBpY2sgdXAgdGhlIGxhcmdlc3Qgb25lcy4gQnV0
IGlmIHlvdSBhcmUgY2FycnlpbmcgYSA1MDAgbGJzIGJhY2twYWNrLAo+ID4gPiB5b3Ugd291bGQg
anVzdCB3YW50IHRvIHBpY2sgdXAgd2hpY2hldmVyIHRoYXQncyBpbiBmcm9udCBvZiB5b3UgcmF0
aGVyCj4gPiA+IHRoYW4gd2FsayB0aGUgZW50aXJlIHJvb20uCj4gPiA+Cj4gPiA+IE1HTFJVIHNo
b3VsZCBvbmx5IHNjYW4gKG9yIGxvb2thcm91bmQpIHNlY29uZGFyeSBNTVVzIGlmIGl0IGNhbiBi
ZQo+ID4gPiBkb25lIGxvY2tsZXNzLiBPdGhlcndpc2UsIGl0IHNob3VsZCBqdXN0IGZhbGwgYmFj
ayB0byB0aGUgZXhpc3RpbmcKPiA+ID4gYXBwcm9hY2gsIHdoaWNoIGV4aXN0ZWQgaW4gcHJldmlv
dXMgdmVyc2lvbnMgYnV0IGlzIHJlbW92ZWQgaW4gdGhpcwo+ID4gPiB2ZXJzaW9uLgo+ID4KPiA+
IEdyYWJiaW5nIHRoZSBNTVUgbG9jayBmb3Igd3JpdGUgdG8gc2NhbiBzdWNrcywgbm8gYXJndW1l
bnQgdGhlcmUuIEJ1dAo+ID4gY2FuIHlvdSBwbGVhc2UgYmUgc3BlY2lmaWMgYWJvdXQgdGhlIGlt
cGFjdCBvZiByZWFkIGxvY2sgdi4gUkNVIGluIHRoZQo+ID4gY2FzZSBvZiBhcm02ND8gSSBoYWQg
YXNrZWQgYWJvdXQgdGhpcyBiZWZvcmUgYW5kIHlvdSBuZXZlciByZXBsaWVkLgo+ID4KPiA+IE15
IGNvbmNlcm4gcmVtYWlucyB0aGF0IGFkZGluZyBzdXBwb3J0IGZvciBzb2Z0d2FyZSB0YWJsZSB3
YWxrZXJzCj4gPiBvdXRzaWRlIG9mIHRoZSBNTVUgbG9jayBlbnRpcmVseSByZXF1aXJlcyBtb3Jl
IHdvcmsgdGhhbiBqdXN0IGRlZmVycmluZwo+ID4gdGhlIGRlYWxsb2NhdGlvbiB0byBhbiBSQ1Ug
Y2FsbGJhY2suIFdhbGtlcnMgdGhhdCBwcmV2aW91c2x5IGFzc3VtZWQKPiA+ICdleGNsdXNpdmUn
IGFjY2VzcyB3aGlsZSBob2xkaW5nIHRoZSBNTVUgbG9jayBmb3Igd3JpdGUgbXVzdCBub3cgY29w
ZQo+ID4gd2l0aCB2b2xhdGlsZSBQVEVzLgo+ID4KPiA+IFllcywgdGhpcyBwcm9ibGVtIGFscmVh
ZHkgZXhpc3RzIHdoZW4gaGFyZHdhcmUgc2V0cyB0aGUgQUYsIGJ1dCB0aGUKPiA+IGxvY2stZnJl
ZSB3YWxrZXIgaW1wbGVtZW50YXRpb24gbmVlZHMgdG8gYmUgZ2VuZXJpYyBzbyBpdCBjYW4gYmUg
YXBwbGllZAo+ID4gZm9yIG90aGVyIFBURSBiaXRzLgo+Cj4gRGlyZWN0IHJlY2xhaW0gaXMgbXVs
dGktdGhyZWFkZWQgYW5kIGVhY2ggcmVjbGFpbWVyIGNhbiB0YWtlIHRoZSBtbXUKPiBsb2NrIGZv
ciByZWFkICh0ZXN0aW5nIHRoZSBBLWJpdCkgb3Igd3JpdGUgKHVubWFwcGluZyBiZWZvcmUgcGFn
aW5nCj4gb3V0KSBvbiBhcm02NC4gVGhlIGZ1bmRhbWVudGFsIHByb2JsZW0gb2YgdXNpbmcgdGhl
IHJlYWRlcnMtd3JpdGVyCj4gbG9jayBpbiB0aGlzIGNhc2UgaXMgcHJpb3JpdHkgaW52ZXJzaW9u
OiB0aGUgcmVhZGVycyBoYXZlIGxvd2VyCj4gcHJpb3JpdHkgdGhhbiB0aGUgd3JpdGVycywgc28g
aWRlYWxseSwgd2UgZG9uJ3Qgd2FudCB0aGUgcmVhZGVycyB0bwo+IGJsb2NrIHRoZSB3cml0ZXJz
IGF0IGFsbC4KPgo+IFVzaW5nIG15IHByZXZpb3VzIChjcnVkZSkgYW5hbG9neTogcHV0aW5nIHRo
ZSBiaWxsIHJpZ2h0IGluIGZyb250IG9mCj4geW91ICh0aGUgd3JpdGVycykgcHJvZml0cyBpbW1l
ZGlhdGVseSB3aGVyZWFzIHNlYXJjaGluZyBmb3IgdGhlCj4gbGFyZ2VzdCBiaWxsICh0aGUgcmVh
ZGVycykgY2FuIGJlIGZ1dGlsZS4KPgo+IEFzIEkgc2FpZCBlYXJsaWVyLCBJIHByZWZlciB3ZSBk
cm9wIHRoZSBhcm02NCBzdXBwb3J0IGZvciBub3csIGJ1dCBJCj4gd2lsbCBub3Qgb2JqZWN0IHRv
IHRha2luZyB0aGUgbW11IGxvY2sgZm9yIHJlYWQgd2hlbiBjbGVhcmluZyB0aGUKPiBBLWJpdCwg
YXMgbG9uZyBhcyB3ZSBmdWxseSB1bmRlcnN0YW5kIHRoZSBwcm9ibGVtIGhlcmUgYW5kIGRvY3Vt
ZW50IGl0Cj4gY2xlYXJseS4KCkZXSVcsIEdvb2dsZSBDbG91ZCBoYXMgYmVlbiBkb2luZyBwcm9h
Y3RpdmUgcmVjbGFpbSBhbmQga3N0YWxlZC1iYXNlZAphZ2luZyAoYSBHb29nbGUtaW50ZXJuYWwg
cGFnZSBhZ2luZyBkYWVtb24sIGZvciB0aG9zZSBvdXRzaWRlIG9mCkdvb2dsZSkgZm9yIG1hbnkg
eWVhcnMgb24geDg2IFZNcyB3aXRoIHRoZSBBLWJpdCBoYXJ2ZXN0aW5nCnVuZGVyIHRoZSB3cml0
ZS1sb2NrLiBTbyBJJ20gc2tlcHRpY2FsIHRoYXQgbWFraW5nIEFSTTY0IGxvY2tsZXNzIGlzCm5l
Y2Vzc2FyeSB0byBhbGxvdyBTZWNvbmRhcnkgTU1VcyB0byBwYXJ0aWNpcGF0ZSBpbiBNR0xSVSBh
Z2luZyB3aXRoCmFjY2VwdGFibGUgcGVyZm9ybWFuY2UgZm9yIENsb3VkIHVzZWNhc2VzLiBJIGRv
bid0IGV2ZW4gdGhpbmsgaXQncwpuZWNlc3Nhcnkgb24geDg2IGJ1dCBpdCdzIGEgc2ltcGxlIGVu
b3VnaCBjaGFuZ2UgdGhhdCB3ZSBtaWdodCBhcyB3ZWxsCmp1c3QgZG8gaXQuCgpJIHN1c3BlY3Qg
dW5kZXIgcGF0aG9sb2dpY2FsIGNvbmRpdGlvbnMgKGhvc3QgdW5kZXIgaW50ZW5zZSBtZW1vcnkK
cHJlc3N1cmUgYW5kIGhpZ2ggcmF0ZSBvZiByZWNsYWltIG9jY3VycmluZykgbWFraW5nIEEtYml0
IGhhcnZlc3RpbmcKbG9ja2xlc3Mgd2lsbCBwZXJmb3JtIGJldHRlci4gQnV0IHVuZGVyIHN1Y2gg
Y29uZGl0aW9ucyBWTSBwZXJmb3JtYW5jZQppcyBsaWtlbHkgZ29pbmcgdG8gc3VmZmVyIHJlZ2Fy
ZGxlc3MuIEluIGEgQ2xvdWQgZW52aXJvbm1lbnQgd2UgZGVhbAp3aXRoIHRoYXQgdGhyb3VnaCBv
dGhlciBtZWNoYW5pc21zIHRvIHJlZHVjZSB0aGUgcmF0ZSBvZiByZWNsYWltIGFuZAptYWtlIHRo
ZSBob3N0IGhlYWx0aHkuCgpGb3IgdGhlc2UgcmVhc29ucywgSSB0aGluayB0aGVyZSdzIHZhbHVl
IGluIGdpdmluZyB1c2VycyB0aGUgb3B0aW9uIHRvCmVuYWJsZSBTZWNvbmRhcnkgTU1VcyBwYXJ0
aWNpcGF0aW9uIE1HTFJVIGFnaW5nIGV2ZW4gd2hlbiBBLWJpdAp0ZXN0L2NsZWFyaW5nIGlzIG5v
dCBkb25lIGxvY2tsZXNzbHkuIEkgYmVsaWV2ZSB0aGlzIHdhcyBKYW1lcycgaW50ZW50CndpdGgg
dGhlIEtjb25maWcuIFBlcmhhcHMgYSBkZWZhdWx0LW9mZiB3cml0YWJsZSBtb2R1bGUgcGFyYW1l
dGVyCndvdWxkIGJlIGJldHRlciB0byBhdm9pZCBkaXN0cm9zIGFjY2lkZW50YWxseSB0dXJuaW5n
IGl0IG9uPwoKSWYgYW5kIHdoZW4gdGhlcmUgaXMgYSB1c2VjYXNlIGZvciBvcHRpbWl6aW5nIFZN
IHBlcmZvcm1hbmNlIHVuZGVyCnBhdGhvbG9naWNhbCByZWNsYWltIGNvbmRpdGlvbnMgb24gQVJN
LCB3ZSBjYW4gbWFrZSBpdCBsb2NrbGVzcyB0aGVuLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
