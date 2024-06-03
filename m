Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C06C25B75
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 23:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jK0v1eUsqLmb+Kxr+C3qdFmxYI2lL80ud8HZN2L8Fqo=; b=A2BGFQToR+zjGK
	ZO3JGwz5l9sBCnesGPzcsikMINLy88/tBzzNxL/lGfFxFHf+HUt1rzLnklqewRPqvWER4G1dHVEjz
	IdYt0L4vcfkzJvFdnu6fdksBKvENg1jH/zRENnkEZ+b0RzzbqH4BmNy3semGqRNYFFvzG4h0YKjI5
	PB7+MMhrZ0eYkERNHBQ2+IDO0uk189zJ5fEURsvc4Y6kpZPvsXZeyBu6ARw9HaokNiZ/ztL/ilbKF
	ttDRAHh3aFryWZrcVPKWFf0dEs5B3rV8aJNSsAjFAPxcCaV3YCMKaJ7Jn1p5i4312Rs9BmdpiCvDC
	BhN4GX5je1o2Jc9NaEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEGva-00000000bTe-39gA;
	Mon, 03 Jun 2024 23:17:22 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEGvX-00000000bRs-1rIa
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 23:17:20 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-43fe3289fc5so57851cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jun 2024 16:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717456638; x=1718061438; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDykUGLfvL3M1lWs+oKStYngTbEIAr5rRwVrwRKKurY=;
        b=sZZsFqQMmaNB3F9jwkhCtu0HCVIDosNzIMQY/9tKOnaDAuYpGGna9j8O11df9JPDj4
         nwVPH4wZu7dO8LsZZpg3yKs9JLQvBYdZ0EW8ijVdBGV7b4shJr5w4mg+33fD+voY1ip8
         NQFMjttRDYqSv/qOYbTbzfoyywQggBYlry5g0UzHDaCbl7yg31Uqg1Lw14qeBSKYRaiE
         dmx14Rjs465DgHbdL2yns902y6hE8lRnSMLAhVSAI3BxZcd5Gyo1RffDk8eVz4KDFwCt
         k/FlN8Mxso8DJDurgxMIn4xpMMea5hiLyS5D7+hO3yfPA4BLLk4VHgOVSSv+/EcJPZYZ
         JD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717456638; x=1718061438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDykUGLfvL3M1lWs+oKStYngTbEIAr5rRwVrwRKKurY=;
        b=Xyle8VsWKNqiD7QvLvFGa7GiBS9VttJiJ+Y2w2l2paHj9KpgNhCiq9sWIOQ7VpRt4I
         0zZsuAkNFG5iZ9mjVEqOM1UUmJG8jO3989w9xaowHQg60WKk5Ei88qrWNrUblANxeGu2
         opoX5PEPyO1F96t/cXC+oPxTQgk7qoMV1kTJKZrg3dr93YmrTthf1xGp8+IcrCP1eRPN
         v1LKUK748vatw30dBvUkCIecHnu0yh5R+LlK0yrjwUeKPRkzuT6N2HdcG2B0vkNBr8eg
         iMskBN8nWICZ3vsZuhn/afT6LsQavFnCj962O6kHYQdvcriuoW+bQMxS0p3fi52w9blb
         KUPg==
X-Forwarded-Encrypted: i=1; AJvYcCUD1WVYQlwB85w9TiWYDNcvqnc8AFyo7cI5fLoctRoQW98QCNzppnc5TQSrttaJgsb8mF4aSdDAmM/rp/AhSQctBNNTkUAuzK2kXUFFWdSy
X-Gm-Message-State: AOJu0Yz0hWegg/GL7dzIj1Cv94MRofqLrp0+9vofQ1kP6RIFMbzB45Hw
	13EV6FYfW0ntRwMOEJB/beArcw4qyqvrGvkOXkj6/ETR11NCDOtKxnvlM0on5lOqBP+tHGj7rJP
	SOYIr36A9qPypjZsdSDBq3scwygXFtbfBbNPO
X-Google-Smtp-Source: AGHT+IERlDy+7BDKGdKU12nHNHCd2TlJ06DKBFhjKpTdcIQ5T8pyrt6cuvlCSmsOxFEEGgqtt5PP7LKTO7CDtdLxk+8=
X-Received: by 2002:a05:622a:4ccc:b0:43a:aa3f:917a with SMTP id
 d75a77b69052e-4401e68c145mr1144381cf.27.1717456637692; Mon, 03 Jun 2024
 16:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com> <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
 <Zley-u_dOlZ-S-a6@google.com> <CADrL8HXHWg_MkApYQTngzmN21NEGNWC6KzJDw_Lm63JHJkR=5A@mail.gmail.com>
 <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com>
 <CADrL8HW44Hx_Ejx_6+FVKt1V17PdgT6rw+sNtKzumqc9UCVDfA@mail.gmail.com> <Zl5LqcusZ88QOGQY@google.com>
In-Reply-To: <Zl5LqcusZ88QOGQY@google.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 3 Jun 2024 16:16:41 -0700
Message-ID: <CADrL8HU734C_OQhzszWJWMXEXLN6HkBo4yweN2fX4BbOegXrFA@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
To: Sean Christopherson <seanjc@google.com>
Cc: Yu Zhao <yuzhao@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ankit Agrawal <ankita@nvidia.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Bibo Mao <maobibo@loongson.cn>, Catalin Marinas <catalin.marinas@arm.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
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
X-CRM114-CacheID: sfid-20240603_161719_507731_50E1F3D2 
X-CRM114-Status: GOOD (  42.48  )
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

T24gTW9uLCBKdW4gMywgMjAyNCBhdCA0OjAz4oCvUE0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdW4gMDMsIDIwMjQsIEphbWVzIEhv
dWdodG9uIHdyb3RlOgo+ID4gT24gVGh1LCBNYXkgMzAsIDIwMjQgYXQgMTE6MDbigK9QTSBZdSBa
aGFvIDx5dXpoYW9AZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPiA+IFdoYXQgSSBkb24ndCB0aGluayBp
cyBhY2NlcHRhYmxlIGlzIHNpbXBsaWZ5aW5nIHRob3NlIG9wdGltaXphdGlvbnMKPiA+ID4gb3V0
IHdpdGhvdXQgZG9jdW1lbnRpbmcgeW91ciBqdXN0aWZpY2F0aW9ucyAoSSB3b3VsZCBldmVuIGNh
bGwgaXQgYQo+ID4gPiBkZXNpZ24gY2hhbmdlLCByYXRoZXIgdGhhbiBzaW1wbGlmaWNhdGlvbiwg
ZnJvbSB2MyB0byB2NCkuCj4gPgo+ID4gSSdsbCBwdXQgYmFjayBzb21ldGhpbmcgc2ltaWxhciB0
byB3aGF0IHlvdSBoYWQgYmVmb3JlIChsaWtlIGEKPiA+IHRlc3RfY2xlYXJfeW91bmcoKSB3aXRo
IGEgImZhc3QiIHBhcmFtZXRlciBpbnN0ZWFkIG9mICJiaXRtYXAiKS4gSQo+ID4gbGlrZSB0aGUg
aWRlYSBvZiBoYXZpbmcgYSBuZXcgbW11IG5vdGlmaWVyLCBsaWtlCj4gPiBmYXN0X3Rlc3RfY2xl
YXJfeW91bmcoKSwgd2hpbGUgbGVhdmluZyB0ZXN0X3lvdW5nKCkgYW5kIGNsZWFyX3lvdW5nKCkK
PiA+IHVuY2hhbmdlZCAod2hlcmUgImZhc3QiIG1lYW5zICJwcmlvcml0aXplIHNwZWVkIG92ZXIg
YWNjdXJhY3kiKS4KPgo+IFRob3NlIHR3byBzdGF0ZW1lbnRzIGFyZSBjb250cmFkaWN0aW5nIGVh
Y2ggb3RoZXIsIGFyZW4ndCB0aGV5PwoKSSBndWVzcyBpdCBkZXBlbmRzIG9uIGhvdyB5b3UgZGVm
aW5lICJzaW1pbGFyIi4gOikKCj4gQW55d2F5cywgSSB2b3RlCj4gZm9yIGEgImZhc3Qgb25seSIg
dmFyaWFudCwgZS5nLiB0ZXN0X2NsZWFyX3lvdW5nX2Zhc3Rfb25seSgpIG9yIHNvLiAgZ3VwKCkg
aGFzCj4gYWxyZWFkeSBlc3RhYmxpc2hlZCB0aGF0IHRlcm1pbm9sb2d5IGluIG1tLywgc28gaG9w
ZWZ1bGx5IGl0IHdvdWxkIGJlIGZhbWlsaWFyCj4gdG8gcmVhZGVycy4gIFdlIGNvdWxkIHBhc3Mg
YSBwYXJhbSwgYnV0IHRoZW4gdGhlIE1HTFJVIGNvZGUgd291bGQgbGlrZWx5IGVuZCB1cAo+IGRv
aW5nIGEgYnVuY2ggb2YgdXNlbGVzcyBpbmRpcmVjdCBjYWxscyBpbnRvIHNlY29uZGFyeSBNTVVz
LCB3aGVyZWFzIGEgZGVkaWNhdGVkCj4gaG9vayBhbGxvd3MgaW1wbGVtZW50YXRpb25zIHRvIG51
bGxpZnkgdGhlIHBvaW50ZXIgaWYgdGhlIEFQSSBpc24ndCBzdXBwb3J0ZWQKPiBmb3Igd2hhdGV2
ZXIgcmVhc29uLgo+Cj4gQW5kIHB1bGxpbmcgaW4gT2xpdmVyJ3MgY29tbWVudHMgYWJvdXQgbG9j
a2luZywgSSB0aGluayBpdCdzIGltcG9ydGFudCB0aGF0IHRoZQo+IG1tdV9ub3RpZmllciBBUEkg
ZXhwcmVzcyBpdCdzIHJlcXVpcmVtZW50IHRoYXQgdGhlIG9wZXJhdGlvbiBiZSAiZmFzdCIsIG5v
dCB0aGF0Cj4gaXQgYmUgbG9ja2xlc3MuICBFLmcuIGlmIGEgc2Vjb25kYXJ5IE1NVSBjYW4gZ3Vh
cmFudGVlIHRoYXQgYSBsb2NrIHdpbGwgYmUKPiBjb250ZW50ZWQgb25seSBpbiByYXJlLCBzbG93
IGNhc2VzLCB0aGVuIHRha2luZyBhIGxvY2sgaXMgYS1vay4gIE9yIGEgc2Vjb25kYXJ5Cj4gTU1V
IGNvdWxkIGRvIHRyeS1sb2NrIGFuZCBiYWlsIGlmIHRoZSBsb2NrIGlzIGNvbnRlbmRlZC4KPgo+
IFRoYXQgd2F5IEtWTSBjYW4gaG9ub3IgdGhlIGludGVudCBvZiB0aGUgQVBJIHdpdGggYW4gaW1w
bGVtZW50YXRpb24gdGhhdCB3b3Jrcwo+IGJlc3QgZm9yIEtWTSBfYW5kXyBmb3IgTUdSTFUuICBJ
J20gc3VyZSB0aGVyZSB3aWxsIGJlIGZ1dHVyZSBhZGp1c3RtZW50cyBhbmQgZml4ZXMsCj4gYnV0
IHRoYXQncyBqdXN0IG1vcmUgbW90aXZhdGlvbiBmb3IgdXNpbmcgc29tZXRoaW5nIGxpa2UgImZh
c3Qgb25seSIgaW5zdGVhZCBvZgo+ICJsb2NrbGVzcyIuCgpZZXMsIHRoYW5rcywgdGhpcyBpcyBl
eGFjdGx5IHdoYXQgSSBtZWFudC4gSSByZWFsbHkgc2hvdWxkIGhhdmUgIm9ubHkiCmluIHRoZSBu
YW1lIHRvIHNpZ25pZnkgdGhhdCBpdCBpcyBhIHJlcXVpcmVtZW50IHRoYXQgaXQgYmUgZmFzdC4K
VGhhbmtzIGZvciB3b3JkaW5nIGl0IHNvIGNsZWFybHkuCgo+Cj4gPiA+ID4gSSBtYWRlIHRoaXMg
bG9naWMgY2hhbmdlIGFzIHBhcnQgb2YgcmVtb3ZpbmcgYmF0Y2hpbmcuCj4gPiA+ID4KPiA+ID4g
PiBJJ2QgcmVhbGx5IGFwcHJlY2lhdGUgZ3VpZGFuY2Ugb24gd2hhdCB0aGUgY29ycmVjdCB0aGlu
ZyB0byBkbyBpcy4KPiA+ID4gPgo+ID4gPiA+IEluIG15IG1pbmQsIHdoYXQgd291bGQgd29yayBn
cmVhdCBpczogYnkgZGVmYXVsdCwgZG8gYWdpbmcgZXhhY3RseQo+ID4gPiA+IHdoZW4gS1ZNIGNh
biBkbyBpdCBsb2NrbGVzc2x5LCBhbmQgdGhlbiBoYXZlIGEgS2NvbmZpZyB0byBhbHdheXMgaGF2
ZQo+ID4gPiA+IE1HTFJVIHRvIGRvIGFnaW5nIHdpdGggS1ZNIGlmIGEgdXNlciByZWFsbHkgY2Fy
ZXMgYWJvdXQgcHJvYWN0aXZlCj4gPiA+ID4gcmVjbGFpbSAod2hlbiB0aGUgZmVhdHVyZSBiaXQg
aXMgc2V0KS4gVGhlIHNlbGZ0ZXN0IGNhbiBjaGVjayB0aGUKPiA+ID4gPiBLY29uZmlnICsgZmVh
dHVyZSBiaXQgdG8ga25vdyBmb3Igc3VyZSBpZiBhZ2luZyB3aWxsIGJlIGRvbmUuCj4gPiA+Cj4g
PiA+IEkgc3RpbGwgZG9uJ3Qgc2VlIGhvdyB0aGF0IEtjb25maWcgaGVscHMuIE9yIHdoeSB0aGUg
bmV3IHN0YXRpYyBicmFuY2gKPiA+ID4gaXNuJ3QgZW5vdWdoPwo+ID4KPiA+IFdpdGhvdXQgYSBz
cGVjaWFsIEtjb25maWcsIHRoZSBmZWF0dXJlIGJpdCBqdXN0IHRlbGxzIHVzIHRoYXQgYWdpbmcK
PiA+IHdpdGggS1ZNIGlzIHBvc3NpYmxlLCBub3QgdGhhdCBpdCB3aWxsIG5lY2Vzc2FyaWx5IGJl
IGRvbmUuIEZvciB0aGUKPiA+IHNlbGYtdGVzdCwgaXQnZCBiZSBnb29kIHRvIGtub3cgZXhhY3Rs
eSB3aGVuIGFnaW5nIGlzIGJlaW5nIGRvbmUgb3IKPiA+IG5vdCwgc28gaGF2aW5nIGEgS2NvbmZp
ZyBsaWtlIExSVV9HRU5fQUxXQVlTX1dBTEtfU0VDT05EQVJZX01NVSB3b3VsZAo+ID4gaGVscCBt
YWtlIHRoZSBzZWxmLXRlc3Qgc2V0IHRoZSByaWdodCBleHBlY3RhdGlvbnMgZm9yIGFnaW5nLgo+
ID4KPiA+IFRoZSBLY29uZmlnIHdvdWxkIGFsc28gYWxsb3cgYSB1c2VyIHRvIGtub3cgdGhhdCwg
bm8gbWF0dGVyIHdoYXQsCj4gPiB3ZSdyZSBnb2luZyB0byBnZXQgY29ycmVjdCBhZ2UgZGF0YSBm
b3IgVk1zLCBldmVuIGlmLCBzYXksIHdlJ3JlIHVzaW5nCj4gPiB0aGUgc2hhZG93IE1NVS4KPgo+
IEhlaCwgdW5sZXNzIEtWTSBmbHVzaGVzLCB5b3Ugd29uJ3QgZ2V0ICJjb3JyZWN0IiBhZ2UgZGF0
YS4KPgo+ID4gVGhpcyBpcyBzb21ld2hhdCBpbXBvcnRhbnQgZm9yIG1lL0dvb2dsZSBDbG91ZC4g
SXMgdGhhdCByZWFzb25hYmxlPyBNYXliZQo+ID4gdGhlcmUncyBhIGJldHRlciBzb2x1dGlvbi4K
Pgo+IEhtbSwgbm8/ICBUaGVyZSdzIG5vIHJlYXNvbiB0byB1c2UgYSBLY29uZmlnLCBlLmcuIGlm
IHdlIF9yZWFsbHlfIHdhbnQgdG8gcHJpb3JpdGl6ZQo+IGFjY3VyYWN5IG92ZXIgc3BlZWQsIHRo
ZW4gYSBLVk0gKHg4Nj8pIG1vZHVsZSBwYXJhbSB0byBoYXZlIEtWTSB3YWxrIG5lc3RlZCBURFAK
PiBwYWdlIHRhYmxlcyB3b3VsZCBnaXZlIHVzIHdoYXQgd2Ugd2FudC4KPgo+IEJ1dCBiZWZvcmUg
d2UgZG8gdGhhdCwgSSB0aGluayB3ZSBuZWVkIHRvIHBlcmZvcm0gZHVlIGRpbGVnZW5jZSAob3Ig
cHJvdmlkZSBkYXRhKQo+IHNob3dpbmcgdGhhdCBoYXZpbmcgS1ZNIHRha2UgbW11X2xvY2sgZm9y
IHdyaXRlIGluIHRoZSAiZmFzdCBvbmx5IiBBUEkgcHJvdmlkZXMKPiBiZXR0ZXIgdG90YWwgYmVo
YXZpb3IuICBJLmUuIHRoYXQgdGhlIGFkZGl0aW9uYWwgYWNjdXJhY3kgaXMgaW5kZWVkIHdvcnRo
IHRoZSBjb3N0LgoKVGhhdCBzb3VuZHMgZ29vZCB0byBtZS4gSSdsbCBkcm9wIHRoZSBLY29uZmln
LiBJJ20gbm90IHJlYWxseSBzdXJlCndoYXQgdG8gZG8gYWJvdXQgdGhlIHNlbGYtdGVzdCwgYnV0
IHRoYXQncyBub3QgcmVhbGx5IGFsbCB0aGF0CmltcG9ydGFudC4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
