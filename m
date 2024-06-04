Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D03C27C50
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 23:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMo/D9629xDDOiUhVL8K5tmUAJn9DAX+RBAV389EpoE=; b=T6NDtMVOv+QYAg
	/NjNgrVJOPpTCHxri0UOnIVfFPxRVCWET34XEZZ/x5ukvQ8w6Hcd1aGQCC0xwMaVtoLpJqAUbe5r1
	W0taV1uv2Q5FIN0VlF1cprInwKIzNd4vE/Gy0x+lqT4sGCTWzQBVgIFX5Fr7ZlTHywR3mvzXMiHRN
	301iWfigP+KiOrWllXnpLbt4lVpo58JEuEbk7cUcWuyi9utORVTU4RJaPPEwa4Rt/VWvhKKyah5my
	uKIpZvUEghrritRlt81kL43fZiOH/nBI19CMnolpl/+A+U3qSXjD5axDoZAUO9St4kIHV60prSFP+
	WkMyRofYRjmRaCdh7LXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEd97-000000047gm-2ZFe;
	Tue, 04 Jun 2024 23:00:49 +0000
Received: from out-182.mta1.migadu.com ([2001:41d0:203:375::b6])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEd91-000000047bQ-0Br5;
	Tue, 04 Jun 2024 23:00:45 +0000
X-Envelope-To: jthoughton@google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1717542038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+MGPWWPfczYg0bV6msWVM8wo7iUe4hq2RoxquwpyNXc=;
	b=Y9kw/6fCw7WeofkUSeTV2BTDMr5jngNUCtFMMUMXtMQwQZ57KMcePca1DBVS/t4qEWis16
	iF4e3V2COwO/t2Yct7KRRLkVhD5NRIOHTq7i/FQgEBT9QWzcLz+QujFnkzpcYe5jZDxDJW
	+mCbFXXZogKs/7ZLafe//WQoP8h37Tw=
X-Envelope-To: akpm@linux-foundation.org
X-Envelope-To: pbonzini@redhat.com
X-Envelope-To: aou@eecs.berkeley.edu
X-Envelope-To: ankita@nvidia.com
X-Envelope-To: anup@brainfault.org
X-Envelope-To: atishp@atishpatra.org
X-Envelope-To: axelrasmussen@google.com
X-Envelope-To: maobibo@loongson.cn
X-Envelope-To: catalin.marinas@arm.com
X-Envelope-To: dmatlack@google.com
X-Envelope-To: rientjes@google.com
X-Envelope-To: chenhuacai@kernel.org
X-Envelope-To: james.morse@arm.com
X-Envelope-To: corbet@lwn.net
X-Envelope-To: maz@kernel.org
X-Envelope-To: mpe@ellerman.id.au
X-Envelope-To: npiggin@gmail.com
X-Envelope-To: palmer@dabbelt.com
X-Envelope-To: paul.walmsley@sifive.com
X-Envelope-To: rananta@google.com
X-Envelope-To: ryan.roberts@arm.com
X-Envelope-To: seanjc@google.com
X-Envelope-To: shahuang@redhat.com
X-Envelope-To: shuah@kernel.org
X-Envelope-To: suzuki.poulose@arm.com
X-Envelope-To: zhaotianrui@loongson.cn
X-Envelope-To: will@kernel.org
X-Envelope-To: yuzhao@google.com
X-Envelope-To: yuzenghui@huawei.com
X-Envelope-To: kvm-riscv@lists.infradead.org
X-Envelope-To: kvm@vger.kernel.org
X-Envelope-To: kvmarm@lists.linux.dev
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-doc@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kselftest@vger.kernel.org
X-Envelope-To: linux-mips@vger.kernel.org
X-Envelope-To: linux-mm@kvack.org
X-Envelope-To: linux-riscv@lists.infradead.org
X-Envelope-To: linuxppc-dev@lists.ozlabs.org
X-Envelope-To: loongarch@lists.linux.dev
Date: Tue, 4 Jun 2024 23:00:28 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: James Houghton <jthoughton@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ankit Agrawal <ankita@nvidia.com>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Bibo Mao <maobibo@loongson.cn>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Matlack <dmatlack@google.com>,
	David Rientjes <rientjes@google.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	James Morse <james.morse@arm.com>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sean Christopherson <seanjc@google.com>,
	Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>,
	Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH v4 6/7] KVM: arm64: Relax locking for kvm_test_age_gfn
 and kvm_age_gfn
Message-ID: <Zl-cjHVKaQ0iQE5d@linux.dev>
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-7-jthoughton@google.com>
 <Zlog5Yk_Pjq0jQhC@linux.dev>
 <Zloicw4IU8_-V5Ns@linux.dev>
 <CADrL8HV4SZ9BEQg1j3ojG-v5umL_d3sa4e1k2vMQCMmBEgeFpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADrL8HV4SZ9BEQg1j3ojG-v5umL_d3sa4e1k2vMQCMmBEgeFpQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_160043_325462_59B5F64C 
X-CRM114-Status: GOOD (  29.25  )
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

T24gVHVlLCBKdW4gMDQsIDIwMjQgYXQgMDM6MjA6MjBQTSAtMDcwMCwgSmFtZXMgSG91Z2h0b24g
d3JvdGU6Cj4gT24gRnJpLCBNYXkgMzEsIDIwMjQgYXQgMTI6MTjigK9QTSBPbGl2ZXIgVXB0b24g
PG9saXZlci51cHRvbkBsaW51eC5kZXY+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgTWF5IDMxLCAy
MDI0IGF0IDEyOjExOjMzUE0gLTA3MDAsIE9saXZlciBVcHRvbiB3cm90ZToKPiA+ID4gT24gV2Vk
LCBNYXkgMjksIDIwMjQgYXQgMDY6MDU6MDlQTSArMDAwMCwgSmFtZXMgSG91Z2h0b24gd3JvdGU6
Cj4gPiA+Cj4gPiA+IFsuLi5dCj4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
a3ZtL2h5cC9wZ3RhYmxlLmMgYi9hcmNoL2FybTY0L2t2bS9oeXAvcGd0YWJsZS5jCj4gPiA+ID4g
aW5kZXggOWUyYmJlZTc3NDkxLi5lYWJiMDdjNjZhMDcgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJj
aC9hcm02NC9rdm0vaHlwL3BndGFibGUuYwo+ID4gPiA+ICsrKyBiL2FyY2gvYXJtNjQva3ZtL2h5
cC9wZ3RhYmxlLmMKPiA+ID4gPiBAQCAtMTMxOSwxMCArMTMxOSw4IEBAIHN0YXRpYyBpbnQgc3Rh
Z2UyX2FnZV93YWxrZXIoY29uc3Qgc3RydWN0IGt2bV9wZ3RhYmxlX3Zpc2l0X2N0eCAqY3R4LAo+
ID4gPiA+ICAgICBkYXRhLT55b3VuZyA9IHRydWU7Cj4gPiA+ID4KPiA+ID4gPiAgICAgLyoKPiA+
ID4gPiAtICAgICogc3RhZ2UyX2FnZV93YWxrZXIoKSBpcyBhbHdheXMgY2FsbGVkIHdoaWxlIGhv
bGRpbmcgdGhlIE1NVSBsb2NrIGZvcgo+ID4gPiA+IC0gICAgKiB3cml0ZSwgc28gdGhpcyB3aWxs
IGFsd2F5cyBzdWNjZWVkLiBOb25ldGhlbGVzcywgdGhpcyBkZWxpYmVyYXRlbHkKPiA+ID4gPiAt
ICAgICogZm9sbG93cyB0aGUgcmFjZSBkZXRlY3Rpb24gcGF0dGVybiBvZiB0aGUgb3RoZXIgc3Rh
Z2UtMiB3YWxrZXJzIGluCj4gPiA+ID4gLSAgICAqIGNhc2UgdGhlIGxvY2tpbmcgbWVjaGFuaWNz
IG9mIHRoZSBNTVUgbm90aWZpZXJzIGlzIGV2ZXIgY2hhbmdlZC4KPiA+ID4gPiArICAgICogVGhp
cyB3YWxrIG1heSBub3QgYmUgZXhjbHVzaXZlOyB0aGUgUFRFIGlzIHBlcm1pdHRlZCB0byBjaGFu
Z2UKPiA+ID4gPiArICAgICogZnJvbSB1bmRlciB1cy4KPiA+ID4gPiAgICAgICovCj4gPiA+ID4g
ICAgIGlmIChkYXRhLT5ta29sZCAmJiAhc3RhZ2UyX3RyeV9zZXRfcHRlKGN0eCwgbmV3KSkKPiA+
ID4gPiAgICAgICAgICAgICByZXR1cm4gLUVBR0FJTjsKPiA+ID4KPiA+ID4gSXQgaXMgcHJvYmFi
bHkgd29ydGggbWVudGlvbmluZyB0aGF0IGlmIHRoZXJlIHdhcyBhIHJhY2UgdG8gdXBkYXRlIHRo
ZQo+ID4gPiBQVEUgdGhlbiB0aGUgR0ZOIGlzIG1vc3QgbGlrZWx5IHlvdW5nLCBzbyBmYWlsaW5n
IHRvIGNsZWFyIEFGIHByb2JhYmx5Cj4gPiA+IGlzbid0IGV2ZW4gY29uc2VxdWVudGlhbC4KPiAK
PiBUaGFua3MgT2xpdmVyLgo+IAo+ID4KPiA+IE9oLCBhbmQgdGhlIFdBUk5fT04oKSBpbiBrdm1f
cGd0YWJsZV9zdGFnZTJfdGVzdF9jbGVhcl95b3VuZygpIGlzIGJvZ3VzCj4gPiBub3cuIE1heWJl
IGRlbW90ZSBpdCB0bzoKPiA+Cj4gPiAgIHIgPSBrdm1fcGd0YWJsZV93YWxrKC4uLik7Cj4gPiAg
IFdBUk5fT05fT05DRShyICYmIHIgIT0gLUVBR0FJTik7Cj4gCj4gT2gsIGluZGVlZCwgdGhhbmsg
eW91LiBKdXN0IHRvIG1ha2Ugc3VyZSAtLSBkb2VzIGl0IG1ha2Ugc2Vuc2UgdG8KPiByZXRyeSB0
aGUgY21weGNoZyBpZiBpdCBmYWlscz8gRm9yIGV4YW1wbGUsIHRoZSB3YXkgSSBoYXZlIGl0IG5v
dyBmb3IKPiB4ODZbMV0sIHdlIHJldHJ5IHRoZSBjbXB4Y2hnIGlmIHRoZSBzcHRlIGlzIHN0aWxs
IGEgbGVhZiwgb3RoZXJ3aXNlIHdlCj4gbW92ZSBvbiB0byB0aGUgbmV4dCBvbmUgaGF2aW5nIGRv
bmUgbm90aGluZy4gRG9lcyBzb21ldGhpbmcgbGlrZSB0aGF0Cj4gbWFrZSBzZW5zZSBmb3IgYXJt
NjQ/CgpBdCBsZWFzdCBmb3IgYXJtNjQgSSBkbyBub3Qgc2VlIGEgbmVlZCBmb3IgcmV0cnkuIFRo
ZSBvbmx5IHBvc3NpYmxlCnJhY2VzIGFyZToKCiAtIEEgc3RhZ2UtMiBmYXVsdCBoYW5kbGVyIGVz
dGFibGlzaGluZyAvIGFkanVzdGluZyB0aGUgbWFwcGluZyBmb3IgdGhlCiAgIEdGTi4gSWYgdGhl
IGd1ZXN0IGlzIGRpcmVjdGx5IGFjY2Vzc2luZyB0aGUgR0ZOIGluIHF1ZXN0aW9uLCB3aGF0J3MK
ICAgdGhlIHBvaW50IG9mIHdpcGluZyBvdXQgQUY/CgogICBFdmVuIHdoZW4gcmV0dXJuaW5nIC1F
QUdBSU4gd2UndmUgYWxyZWFkeSBwcmltZWQgc3RhZ2UyX2FnZV9kYXRhOjp5b3VuZywKICAgc28g
d2UgcmVwb3J0IHRoZSBjb3JyZWN0IHN0YXRlIGJhY2sgdG8gdGhlIHByaW1hcnkgTU1VLgoKIC0g
QW5vdGhlciBrdm1fYWdlX2dmbigpIHRyeWluZyB0byBhZ2UgdGhlIHNhbWUgR0ZOLiBJIGhhdmVu
J3QgZXZlbgogICBsb29rZWQgdG8gc2VlIGlmIHRoaXMgaXMgcG9zc2libGUgZnJvbSB0aGUgcHJp
bWFyeSBNTVUgUE9WLCBidXQgaW4KICAgdGhlb3J5IG9uZSBvZiB0aGUgY2FsbHMgd2lsbCB3aW4g
dGhlIHJhY2UgYW5kIGNsZWFyIEFGLgoKR2l2ZW4gWXUncyBjb25jZXJucyBhYm91dCBtYWtpbmcg
cGVuZGluZyB3cml0ZXJzIHdhaXQsIHdlIHNob3VsZCB0YWtlCmV2ZXJ5IG9wcG9ydHVuaXR5IHRv
IGJhaWwgb24gdGhlIHdhbGsuCgotLSAKVGhhbmtzLApPbGl2ZXIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
