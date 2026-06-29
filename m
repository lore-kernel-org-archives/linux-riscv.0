Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25E2C43602
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 11:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5V//LFOxNZwnH0gCLUVcnFWE6dOdctqzyRfDmMRI9w=; b=RRbqFVvGQpikkZ
	CBdc+UepVviJyFn89IcqkYN2oUtKNVfoF69mmCny+BiUxJgcHQB8B/wxeAoo1hvFl0ZZyR/DHPm7z
	0e737bK+HPkxv79tQzYrXkIWQ49xfw4gV/o0ww/hzciWeOgs9ykAlVrWEtFqVBrsL2a2rqhx4djXs
	fITwBf4tB8snkuAejUC1QAErZ6ZoR/SfHWd3p5b70lbH+RaZevWplbJoWbLdGvjeKlZtMo2bBiR0j
	ntKC+xQP+h2L4+ml5+/GDPDmRPaR+S7dkeXcAAXCAI6cpHbDB2WZlngqhJySaHz/TcQtq4a2cgykl
	Secyuf7ZPAi0daQotIaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAPL-0000000ETtq-2SmC;
	Mon, 29 Jun 2026 11:44:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weAPK-0000000ETtS-0G9w;
	Mon, 29 Jun 2026 11:44:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A71B6001D;
	Mon, 29 Jun 2026 11:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D281F000E9;
	Mon, 29 Jun 2026 11:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782733448;
	bh=ViaMG4AIx4t7Xw8EOKV5lY2S4wNOCDcLNhNIuR/tVoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q8m5WZPQxys7TASSEPS79b1PS7Camd9Fn+c6d1C9gq57MCQiYrcQnCXQfgL5Pom18
	 DEi/W04AGewzD/rKoMQlj7PH7ZlvfhgT5wCxco8mN/yozzeDJebmnwHsmAjUc92Hvw
	 6FvQmlN57DCT6ekazGvEXvtaVtlZGacM99DDCOSxpOBVSleTe4irqCX5KbtC2izNKF
	 T291dor9anDtABM3b/yxgkDP56ANzslcvn4NGksr9xxTxzQ33O68zYsFM+1kAbKewL
	 8f2NZFEXGGeHuNzx86QM2uiAaWdYbAx+u9ZKEshlHOlDMKPf26u4dffwBuDK6k7Dw4
	 85OiP+UwZqwrw==
Date: Mon, 29 Jun 2026 14:43:57 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Will Deacon <will@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	WANG Xuerui <kernel@xen0n.name>
Subject: Re: [PATCH 0/6] treewide: remove unnecessary invalid range checks in
 memblock iteration loops
Message-ID: <akJafRKJJBd5Jrv0@kernel.org>
References: <20260621145919.1453-1-ekffu200098@gmail.com>
 <aj426bA-YiOKt06m@kernel.org>
 <CABFDxME8wej3m8T5gn8y4dmpOLZutm=tDTa7ZcfhbWwScTu_5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABFDxME8wej3m8T5gn8y4dmpOLZutm=tDTa7ZcfhbWwScTu_5Q@mail.gmail.com>
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

T24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgMDc6NTk6MjJQTSArMDkwMCwgU2FuZy1IZW9uIEplb24g
d3JvdGU6Cj4gT24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgNToyM+KAr1BNIE1pa2UgUmFwb3BvcnQg
PHJwcHRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gU3VuLCBKdW4gMjEsIDIwMjYgYXQg
MTE6NTk6MTBQTSArMDkwMCwgU2FuZy1IZW9uIEplb24gd3JvdGU6Cj4gPiA+IFRoZSBtZW1ibG9j
ayBBUEkgZ3VhcmFudGVlcyB0aGF0IGZvcl9lYWNoX21lbV9yYW5nZSgpIGFuZAo+ID4gPiBmb3Jf
ZWFjaF9tZW1fcGZuX3JhbmdlKCkgbmV2ZXIgcmV0dXJuIGFuIGludmFsaWQgcmFuZ2UsIG1lYW5p
bmcgc3RhcnQgaXMKPiA+ID4gYWx3YXlzIGxlc3MgdGhhbiBlbmQuCj4gPiA+Cj4gPiA+IFNldmVy
YWwgbWVtYmxvY2sgY2FsbGVycyBzdGlsbCBoYXZlIHVubmVjZXNzYXJ5IGludmFsaWQgcmFuZ2Ug
Y2hlY2tzIGluCj4gPiA+IHRoZWlyIGxvb3AgYm9kaWVzLCBzbyByZW1vdmUgdGhlbS4KPiA+ID4K
PiA+ID4gU2FuZy1IZW9uIEplb24gKDYpOgo+ID4gPiAgIGFybTY0OiBtbTogcmVtb3ZlIHVucmVh
Y2hhYmxlIGludmFsaWQgcmFuZ2UgY2hlY2sgaW4KPiA+ID4gICAgIGthc2FuX2luaXRfc2hhZG93
KCkKPiA+ID4gICBMb29uZ0FyY2g6IHJlbW92ZSB1bnJlYWNoYWJsZSBpbnZhbGlkIHJhbmdlIGNo
ZWNrIGluIGthc2FuX2luaXQoKQo+ID4gPiAgIHJpc2N2OiByZW1vdmUgdW5yZWFjaGFibGUgaW52
YWxpZCByYW5nZSBjaGVjayBpbgo+ID4gPiAgICAgY3JlYXRlX2xpbmVhcl9tYXBwaW5nX3BhZ2Vf
dGFibGUoKQo+ID4gPiAgIHJpc2N2OiByZW1vdmUgdW5yZWFjaGFibGUgaW52YWxpZCByYW5nZSBj
aGVjayBpbiBrYXNhbl9pbml0KCkKPiA+ID4gICBtbTogcmVtb3ZlIHVubmVjZXNzYXJ5IGVtcHR5
IHJhbmdlIGNoZWNrIGluCj4gPiA+ICAgICBlYXJseV9jYWxjdWxhdGVfdG90YWxwYWdlcygpCj4g
PiA+ICAgbW0vaHVnZXRsYjogcmVtb3ZlIHVubmVjZXNzYXJ5IGVtcHR5IHJhbmdlIGNoZWNrIGlu
Cj4gPiA+ICAgICBodWdldGxiX2Jvb3RtZW1fc2V0X25vZGVzKCkKPiA+Cj4gPiBJIHF1ZXVlZCB0
aGlzIGZvciBpbmNsdXNpb24gaW50byBtZW1ibG9jayB0cmVlLgo+IAo+IFRoYW5rIHlvdSwgTWlr
ZS4KPiAKPiBDb3VsZCB5b3UgcGxlYXNlIHJldmlldyBhbmQgcXVldWUgdGhpcyBwYXRjaCBbMV0g
YXMgd2VsbD8gSXQgZG9lcyB0aGUKPiBzYW1lIGtpbmQgb2YgY2xlYW4gdXAsIEkganVzdCBtaXNz
ZWQgaXQgYXQgdGhlIHRpbWUuCgpDYW4geW91IHBsZWFzZSByZXNlbmQgdGhlbSBhbGwgYXMgYSBz
aW5nbGUgc2V0PwogCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDYyNjAz
MjkwMi43MDM5NDQtMS1la2ZmdTIwMDA5OEBnbWFpbC5jb20vCj4gCj4gPiA+ICBhcmNoL2FybTY0
L21tL2thc2FuX2luaXQuYyAgICAgfCAzIC0tLQo+ID4gPiAgYXJjaC9sb29uZ2FyY2gvbW0va2Fz
YW5faW5pdC5jIHwgMyAtLS0KPiA+ID4gIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgICB8
IDIgLS0KPiA+ID4gIGFyY2gvcmlzY3YvbW0va2FzYW5faW5pdC5jICAgICB8IDMgLS0tCj4gPiA+
ICBtbS9odWdldGxiLmMgICAgICAgICAgICAgICAgICAgfCAzICstLQo+ID4gPiAgbW0vbW1faW5p
dC5jICAgICAgICAgICAgICAgICAgIHwgMyArLS0KPiA+ID4gIDYgZmlsZXMgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gLS0KPiA+ID4gMi40My4w
Cj4gPiA+Cj4gPgo+ID4gLS0KPiA+IFNpbmNlcmVseSB5b3VycywKPiA+IE1pa2UuCj4gCj4gQmVz
dCBSZWdhcmRzLAo+IFNhbmctSGVvbiBKZW9uCgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
