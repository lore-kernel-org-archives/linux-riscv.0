Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA3CC001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 17:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NWPpG7fAqoUHTHYr7KzTcoabzS02Fne8b37ukDFRuAI=; b=rp15dsOQsKpZud
	Hq6Pyly7lJbZU2iLhEz7DXVUrHoeqtzMnzIgoXSOsMFz4bYmrSW/UC1BtkW5u+Gl7HHaKQksu6ocL
	8PcjBboIQMfKVRt6OlyGmzZpJTHcfT/xUXaUVIIYGvjEy5Jjl3594ib4p4mP3dyPOwA5rrQcrnOR4
	x7RcgitLbz1cOl1Ry5iPmH+yVyN30MS3Yp5kemvcDj4oOicv0Yzsmbf4USDh2pgJkoge+bRbeZacO
	xQb/Le+0d1T25F+6dctakMOxNleLGPXjsQQUhwp7CsbkR+FjvL+ynbZpUPGt1q/iWD3SQv5Ubet/q
	7ReDvHuB80vCvPODKn4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQWpT-00Grvs-0w;
	Mon, 31 Jul 2023 17:37:11 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQWpP-00Grtm-2y
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 17:37:09 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bc0308d1e2so14825ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 10:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690825019; x=1691429819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqwUjf4srHS0GmV2PrhboWOP/pK2frD9PFN9eIO2JAw=;
        b=PW7uXs8te+DjBD/konvGzLWP8g1fMK7bveuEGlOTMiFVF5fJOURsOxjYwDa4V8/7PN
         GfxiTdGyn4gNxwwJEsgm5Sa3Z07XoIws8zOegDuEUNdgEakGsCpulFVJ68YDWRx8hG7J
         pHEIHY9NNGcOKqt3EcY+H5XjDJYzQb9r6s9KF29xhh5Zs48JdBGHLJzvx9IIdfAb6DL2
         uvolYf+4ofy8X/EQBFsrD9bL5wC/3Jo2GpoHAsbLgZmiKj7F/6zz+pRJOqtmGCUykUqb
         cXxdJcVUj2aUL7x0X6KpmqFqe34XSu2p4AB041J8zGtZ22s2J/6FLShweArcanRRNTIu
         x2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690825019; x=1691429819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqwUjf4srHS0GmV2PrhboWOP/pK2frD9PFN9eIO2JAw=;
        b=dwDYSOGhcVAyKN5jbLEw4unP54bCpIvDQFYAFr9/FFIm2099DaQ3VKUNd5tNtF8Ww3
         98p+OncbO0x9Cen0dSJPOsnsWtJoeDV+wcMdRIfoKdLkTWHbloYKlzr9eiT7bfIK2kj7
         od6WsrnusJAw7e/IUBbY88rQRdF2DzG4MwPGTJGV7IKgFoFn78vvTrBNWHtkyoZh4apg
         Wj9B+8F28Eq25iHQclDBRmc4SgVWl/M3AF4IILBipYzNL4EBu+tIf1yfJFGVA1aI/+pc
         +dpGvb475j1ItXTPajX7mY3ZByugl80EV0HC3WJYfDJ5GeK8sY7zLkrl2rw/TYcpwzb6
         TMyw==
X-Gm-Message-State: ABy/qLYwVqy4+QTixhw0Bk5VIJ1nBtkJy1SBse2PtyhQavscezBfF07A
	XuuZCfdR1w8nUiIdkuD/9qpVmhorFcT6/V50PQ1Oxg==
X-Google-Smtp-Source: APBJJlFkMuLyTHjACrkUI9ojOs57IF7oGguBdj8b71/dF8frxz4uOZLWejmA7Zhtt9x/0OUhO69yCloZOMPgYxPCZgE=
X-Received: by 2002:a17:902:c410:b0:1b8:82c6:9e11 with SMTP id
 k16-20020a170902c41000b001b882c69e11mr381793plk.0.1690825018566; Mon, 31 Jul
 2023 10:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-7-rananta@google.com>
 <87r0otr579.wl-maz@kernel.org>
In-Reply-To: <87r0otr579.wl-maz@kernel.org>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Mon, 31 Jul 2023 10:36:47 -0700
Message-ID: <CAJHc60zqOeWXf3kh5hKL6DL3g4znmHaH-TqC0QDcBrWPsHAEXQ@mail.gmail.com>
Subject: Re: [PATCH v7 06/12] arm64: tlb: Refactor the core flush algorithm of __flush_tlb_range
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Gavin Shan <gshan@redhat.com>, 
	Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_103707_959026_D9A2F81A 
X-CRM114-Status: GOOD (  22.24  )
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

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMzo1OOKAr0FNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCAyMiBKdWwgMjAyMyAwMzoyMjo0NSArMDEwMCwKPiBS
YWdoYXZlbmRyYSBSYW8gQW5hbnRhIDxyYW5hbnRhQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4KPiA+
IEN1cnJlbnRseSwgdGhlIGNvcmUgVExCIGZsdXNoIGZ1bmN0aW9uYWxpdHkgb2YgX19mbHVzaF90
bGJfcmFuZ2UoKQo+ID4gaGFyZGNvZGVzIHZhZTFpcyAoYW5kIHZhcmlhbnRzKSBmb3IgdGhlIGZs
dXNoIG9wZXJhdGlvbi4gSW4gdGhlCj4gPiB1cGNvbWluZyBwYXRjaGVzLCB0aGUgS1ZNIGNvZGUg
cmV1c2VzIHRoaXMgY29yZSBhbGdvcml0aG0gd2l0aAo+ID4gaXBhczJlMWlzIGZvciByYW5nZSBi
YXNlZCBUTEIgaW52YWxpZGF0aW9ucyBiYXNlZCBvbiB0aGUgSVBBLgo+ID4gSGVuY2UsIGV4dHJh
Y3QgdGhlIGNvcmUgZmx1c2ggZnVuY3Rpb25hbGl0eSBvZiBfX2ZsdXNoX3RsYl9yYW5nZSgpCj4g
PiBpbnRvIGl0cyBvd24gbWFjcm8gdGhhdCBhY2NlcHRzIGFuICdvcCcgYXJndW1lbnQgdG8gcGFz
cyBhbnkKPiA+IFRMQkkgb3BlcmF0aW9uLCBzdWNoIHRoYXQgb3RoZXIgY2FsbGVycyAoS1ZNKSBj
YW4gYmVuZWZpdC4KPiA+Cj4gPiBObyBmdW5jdGlvbmFsIGNoYW5nZXMgaW50ZW5kZWQuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogUmFnaGF2ZW5kcmEgUmFvIEFuYW50YSA8cmFuYW50YUBnb29nbGUu
Y29tPgo+ID4gUmV2aWV3ZWQtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFy
bS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4KPiA+
IFJldmlld2VkLWJ5OiBTaGFvcWluIEh1YW5nIDxzaGFodWFuZ0ByZWRoYXQuY29tPgo+ID4gLS0t
Cj4gPiAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIHwgMTA5ICsrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCsp
LCA1MyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRl
L2FzbS90bGJmbHVzaC5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gPiBp
bmRleCA0MTJhM2I5YTNjMjUuLmY3ZmFmYmEyNWFkZCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJt
NjQvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+ID4gKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2Fz
bS90bGJmbHVzaC5oCj4gPiBAQCAtMjc4LDE0ICsyNzgsNjIgQEAgc3RhdGljIGlubGluZSB2b2lk
IGZsdXNoX3RsYl9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAo+ID4gICAqLwo+ID4g
ICNkZWZpbmUgTUFYX1RMQklfT1BTIFBUUlNfUEVSX1BURQo+ID4KPiA+ICsvKiBXaGVuIHRoZSBD
UFUgZG9lcyBub3Qgc3VwcG9ydCBUTEIgcmFuZ2Ugb3BlcmF0aW9ucywgZmx1c2ggdGhlIFRMQgo+
ID4gKyAqIGVudHJpZXMgb25lIGJ5IG9uZSBhdCB0aGUgZ3JhbnVsYXJpdHkgb2YgJ3N0cmlkZScu
IElmIHRoZSBUTEIKPiA+ICsgKiByYW5nZSBvcHMgYXJlIHN1cHBvcnRlZCwgdGhlbjoKPgo+IENv
bW1lbnQgZm9ybWF0ICh0aGUgb3JpZ2luYWwgd2FzIGNvcnJlY3QpLgo+Cklzbid0IHRoZSBmb3Jt
YXQgdGhlIHNhbWUgYXMgb3JpZ2luYWw/IE9yIGFyZSB5b3UgcmVmZXJyaW5nIHRvIHRoZQpmYWN0
IHRoYXQgaXQgbmVlZHMgdG8gYmUgcGxhY2VkIGluc2lkZSB0aGUgbWFjcm8gZGVmaW5pdGlvbj8K
PiA+ICsgKgo+ID4gKyAqIDEuIElmICdwYWdlcycgaXMgb2RkLCBmbHVzaCB0aGUgZmlyc3QgcGFn
ZSB0aHJvdWdoIG5vbi1yYW5nZQo+ID4gKyAqICAgIG9wZXJhdGlvbnM7Cj4gPiArICoKPiA+ICsg
KiAyLiBGb3IgcmVtYWluaW5nIHBhZ2VzOiB0aGUgbWluaW11bSByYW5nZSBncmFudWxhcml0eSBp
cyBkZWNpZGVkCj4gPiArICogICAgYnkgJ3NjYWxlJywgc28gbXVsdGlwbGUgcmFuZ2UgVExCSSBv
cGVyYXRpb25zIG1heSBiZSByZXF1aXJlZC4KPiA+ICsgKiAgICBTdGFydCBmcm9tIHNjYWxlID0g
MCwgZmx1c2ggdGhlIGNvcnJlc3BvbmRpbmcgbnVtYmVyIG9mIHBhZ2VzCj4gPiArICogICAgKChu
dW0rMSkqMl4oNSpzY2FsZSsxKSBzdGFydGluZyBmcm9tICdhZGRyJyksIHRoZW4gaW5jcmVhc2Ug
aXQKPiA+ICsgKiAgICB1bnRpbCBubyBwYWdlcyBsZWZ0Lgo+ID4gKyAqCj4gPiArICogTm90ZSB0
aGF0IGNlcnRhaW4gcmFuZ2VzIGNhbiBiZSByZXByZXNlbnRlZCBieSBlaXRoZXIgbnVtID0gMzEg
YW5kCj4gPiArICogc2NhbGUgb3IgbnVtID0gMCBhbmQgc2NhbGUgKyAxLiBUaGUgbG9vcCBiZWxv
dyBmYXZvdXJzIHRoZSBsYXR0ZXIKPiA+ICsgKiBzaW5jZSBudW0gaXMgbGltaXRlZCB0byAzMCBi
eSB0aGUgX19UTEJJX1JBTkdFX05VTSgpIG1hY3JvLgo+ID4gKyAqLwo+ID4gKyNkZWZpbmUgX19m
bHVzaF90bGJfcmFuZ2Vfb3Aob3AsIHN0YXJ0LCBwYWdlcywgc3RyaWRlLCAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYXNpZCwgdGxiX2xl
dmVsLCB0bGJpX3VzZXIpICAgICAgICAgICAgIFwKPgo+IElmIHlvdSBtYWtlIHRoaXMgYSBjb21t
b24gbWFjcm8sIHBsZWFzZSBkb2N1bWVudCB0aGUgcGFyYW1ldGVycywgYW5kCj4gd2hhdCB0aGUg
Y29uc3RyYWludHMgYXJlLiBGb3IgZXhhbXBsZSwgd2hhdCBkb2VzIHRsYmlfdXNlciBtZWFuIGZv
ciBhbgo+IElQQSBpbnZhbGlkYXRpb24/Cj4KU3VyZSwgSSdsbCBkb2N1bWVudCB0aGUgcGFyYW1l
dGVycy4gVGhhdCdsbCBiZSBoZWxwZnVsLgoKLSBSYWdoYXZlbmRyYQo+ICAgICAgICAgTS4KPgo+
IC0tCj4gV2l0aG91dCBkZXZpYXRpb24gZnJvbSB0aGUgbm9ybSwgcHJvZ3Jlc3MgaXMgbm90IHBv
c3NpYmxlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
