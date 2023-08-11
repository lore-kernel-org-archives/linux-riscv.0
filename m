Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05021EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 04:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T9pBsr1kfwAnjDozigr/TeJnNq1LtmSDWkZtQQ7aAQE=; b=vy710gY4eSBltv
	E3swM68AY+xvVboeVonKZbReH1vPBS20y/f4omDH8eAC7iTq0n5Ua0pAkLcsMZJPmxJ+mXhGk9UX7
	rqSH5Xc8jn0taNWJIW4i02//dROPjzEzHk/1iTwpyi9NoGc8Q8RHjIfxgGz4N9mRTcNG8wfTu3aCB
	japOKF35oPXRPUb3ef0wi5WifRGBw/bu3SV0f/XyHDHV6SmljvFP61t2esYsM3zyjqjgkLG8QXdgj
	dHQWv9hiW5eR8S6RcA/f5c9Emwb3qBPIRTkAHVTzlXKJRf9gZWv5R9afHKOJrSKRTqXB/SZG2L1RB
	r2uAUxRSRJ26u2mrCloQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUJSv-009LHr-1l;
	Fri, 11 Aug 2023 04:09:33 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUJSp-009LFD-2Y
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 04:09:31 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-40a47e8e38dso97091cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 21:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691726966; x=1692331766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrDrETV1MisK8Z8veMIfL3s41yT4QCG2F0LEIUYQOaY=;
        b=Ys/jY+yPMYklBKhfVgbfOydhc4kNHDE8icVjMrsLLgu+fpHp8tUAe/Z8tQi5EyliBP
         FOXJo9inc1/IlqmQUsyG0TlG4zYcizGN4mXKt2I7CrUe3Ao8uvjVv8FwEd4dfFhoFeJb
         EaGW5q3lZFFVwjmb97adxCHURuV9bY6SqtS9lgUeSR9+V77/nlLuuf3/oSVAakTdOloX
         il2Gz+HPmT8k90isCCKyijsYum0oCwD4qP5kG1ysYzFemHSs4mYGnOyByWqXQlx7/BBu
         InwZUI0LlaFdHMN/1iO1q/vbjsa3pUycjM3BfA+9gzpC1x5/svN9LNkTs9kPqTE82DYN
         CLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691726966; x=1692331766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrDrETV1MisK8Z8veMIfL3s41yT4QCG2F0LEIUYQOaY=;
        b=P1lrKw3100nTMVF/zrxW0OE/wdbh9Rk7mmkYa0o/DLSBhvDT2cV/3pb219VBiTqOMD
         tNciYV0KRm92ZHFRtNsnQC+dyFIGRVl2taK2lk6znyqWQNq32CyD6gj+81FFFnU4pG7O
         RbUf1RqZIO/fNVB8wCyMYoHsmvLCG/E6oz+OPkB+eahxUIy0TcdJiASX4KF7VnTOcEDR
         RzA7sPzKWeR4q8PdtZkLhwr/UBsjCEee+RF4Ey0rOGKe20Xga7fOfgXN1TGYlZAC4sdL
         12leiC19yM9OJ+IoWGgYYbqKwKcrGQs5TwP8ALBRMICG9PwWH2BTyAFErbJNzt9/6olU
         RE8Q==
X-Gm-Message-State: AOJu0Yy/MDHOqDkJnR2OsP+I8RWxL67n6Fj5BdSIIbUUFgWH/oiTXGJR
	ZuagC2hewcr/6fidzvYxritdczEewmtYn7lQdxRy4g==
X-Google-Smtp-Source: AGHT+IHMAxFXSNCpcy2QB9U1hGdsPt6F2OIhTV8ziEnxB0IpNc9MS9/ILkbKDyBlu4LIoOvbAQ+67cSqZwr61oRzfZI=
X-Received: by 2002:ac8:580a:0:b0:403:ac17:c18a with SMTP id
 g10-20020ac8580a000000b00403ac17c18amr165255qtg.14.1691726965568; Thu, 10 Aug
 2023 21:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com> <20230808231330.3855936-3-rananta@google.com>
 <c33b0518-6e64-7acf-efa8-f404fce1ccac@redhat.com> <CAJHc60yCJANBQOizaoSPhEJH9e8a9C6n68x4qdVkOhVZiiWqkw@mail.gmail.com>
 <30e45ef3-309a-63de-e085-be1645c1be79@redhat.com> <CAJHc60x=bhXS3PahuRPwRVdqN4LeX-PBdjdEeCEomhf2YAJ1mw@mail.gmail.com>
 <ZNVfsxdYKu9Nt+j+@google.com> <CAJHc60w0By2Q+PCsfwReGXsN5zf5k1ww3Ov4m9Eb-pFH-UKBDg@mail.gmail.com>
 <ZNVtBQvjM45tmbce@google.com>
In-Reply-To: <ZNVtBQvjM45tmbce@google.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Thu, 10 Aug 2023 21:09:14 -0700
Message-ID: <CAJHc60y0izDbTE+XETkSURBzJiRrzmMwQB3+eNJ3YXR-kcg30g@mail.gmail.com>
Subject: Re: [PATCH v8 02/14] KVM: Declare kvm_arch_flush_remote_tlbs() globally
To: Sean Christopherson <seanjc@google.com>
Cc: Shaoqin Huang <shahuang@redhat.com>, Gavin Shan <gshan@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_210927_859623_41F6783D 
X-CRM114-Status: GOOD (  41.31  )
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

T24gVGh1LCBBdWcgMTAsIDIwMjMgYXQgNDowNOKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDEwLCAyMDIzLCBSYWdoYXZl
bmRyYSBSYW8gQW5hbnRhIHdyb3RlOgo+ID4gT24gVGh1LCBBdWcgMTAsIDIwMjMgYXQgMzoyMOKA
r1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPiA+ID4g
T24gVGh1LCBBdWcgMTAsIDIwMjMsIFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEgd3JvdGU6Cj4gPiA+
ID4gQWZ0ZXIgZG9pbmcgc29tZSBleHBlcmltZW50cywgSSB0aGluayBpdCB3b3JrcyBiZWNhdXNl
IG9mIHRoZSBvcmRlciBpbgo+ID4gPiA+IHdoaWNoIHRoZSBpbmxpbmUtZGVmaW5pdGlvbiBhbmQg
dGhlIGRlY2xhcmF0aW9uIGFyZSBsYWlkIG91dC4gSWYgdGhlCj4gPiA+ID4gJ2lubGluZScgcGFy
dCBvZiB0aGUgZnVuY3Rpb24gY29tZXMgZmlyc3QgYW5kIHRoZW4gdGhlIGRlY2xhcmF0aW9uLCB3
ZQo+ID4gPiA+IGRvbid0IHNlZSBhbnkgZXJyb3IuIEhvd2V2ZXIgaWYgdGhlIHBvc2l0aW9ucyB3
ZXJlIHJldmVyc2VkLCB3ZSB3b3VsZAo+ID4gPiA+IHNlZSBhbiBlcnJvci4gKEknbSBub3Qgc3Vy
ZSB3aGF0IHRoZSB0ZWNobmljYWwgcmVhc29uIGZvciB0aGlzIGlzKS4KPiA+ID4gPgo+ID4gPiA+
IEp1c3QgdG8gYmUgc2FmZSwgSSBjYW4gbW92ZSB0aGUgZGVmaW5pdGlvbiB0byBhcmNoL3g4Ni9r
dm0vbW11L21tdS5jCj4gPiA+ID4gYXMgYSBub24taW5saW5lIGZ1bmN0aW9uLgo+ID4gPgo+ID4g
PiBObyBuZWVkLCBhc20va3ZtX2hvc3QuaCBfbXVzdF8gYmUgaW5jbHVkZWQgYmVmb3JlIHRoZSBk
ZWNsYXJhdGlvbiwgb3RoZXJ3aXNlIHRoZQo+ID4gPiBkZWNsYXJhdGlvbiB3b3VsZG4ndCBiZSBt
YWRlIGJlY2F1c2UgX19LVk1fSEFWRV9BUkNIX0ZMVVNIX1JFTU9URV9UTEJTIHdvdWxkbid0Cj4g
PiA+IGJlIGRlZmluZWQuICBJLmUuIHdlIHdvbid0IHJ1biBpbnRvIGlzc3VlcyB3aGVyZSB0aGUg
bm9uLXN0YXRpYyBkZWNsYXJhdGlvbiBjb21lcwo+ID4gPiBiZWZvcmUgdGhlIHN0YXRpYyBpbmxp
bmUgZGVmaW5pdGlvbi4KPiA+ID4KPiA+ID4gQzk5IGV4cGxpY2l0bHkgY292ZXJzIHRoaXMgY2Fz
ZToKPiA+ID4KPiA+ID4gICA2LjIuMiBMaW5rYWdlcyBvZiBpZGVudGlmaWVycwo+ID4gPgo+ID4g
PiAgIC4uLgo+ID4gPgo+ID4gPiAgIElmIHRoZSBkZWNsYXJhdGlvbiBvZiBhIGZpbGUgc2NvcGUg
aWRlbnRpZmllciBmb3IgYW4gb2JqZWN0IG9yIGEgZnVuY3Rpb24gY29udGFpbnMgdGhlIHN0b3Jh
Z2UtCj4gPiA+ICAgY2xhc3Mgc3BlY2lmaWVyIHN0YXRpYywgdGhlIGlkZW50aWZpZXIgaGFzIGlu
dGVybmFsIGxpbmthZ2UuCj4gPiA+Cj4gPiA+ICAgRm9yIGFuIGlkZW50aWZpZXIgZGVjbGFyZWQg
d2l0aCB0aGUgc3RvcmFnZS1jbGFzcyBzcGVjaWZpZXIgZXh0ZXJuIGluIGEgc2NvcGUgaW4gd2hp
Y2ggYQo+ID4gPiAgIHByaW9yIGRlY2xhcmF0aW9uIG9mIHRoYXQgaWRlbnRpZmllciBpcyB2aXNp
YmxlIGlmIHRoZSBwcmlvciBkZWNsYXJhdGlvbiBzcGVjaWZpZXMgaW50ZXJuYWwgb3IKPiA+ID4g
ICBleHRlcm5hbCBsaW5rYWdlLCB0aGUgbGlua2FnZSBvZiB0aGUgaWRlbnRpZmllciBhdCB0aGUg
bGF0ZXIgZGVjbGFyYXRpb24gaXMgdGhlIHNhbWUgYXMgdGhlCj4gPiA+ICAgbGlua2FnZSBzcGVj
aWZpZWQgYXQgdGhlIHByaW9yIGRlY2xhcmF0aW9uLiBJZiBubyBwcmlvciBkZWNsYXJhdGlvbiBp
cyB2aXNpYmxlLCBvciBpZiB0aGUgcHJpb3IKPiA+ID4gICBkZWNsYXJhdGlvbiBzcGVjaWZpZXMg
bm8gbGlua2FnZSwgdGhlbiB0aGUgaWRlbnRpZmllciBoYXMgZXh0ZXJuYWwgbGlua2FnZS4KPiA+
ID4KPiA+ID4gSW4gc2hvcnQsIGJlY2F1c2UgdGhlICJzdGF0aWMgaW5saW5lIiBkZWNsYXJlZCBp
bnRlcm5hbCBsaW5rYWdlIGZpcnN0LCBpdCB3aW5zLgo+ID4gVGhhbmtzIGZvciBzaGFyaW5nIHRo
aXMhIEkgY2FuIGtlZXAgdGhlICdzdGF0aWMgaW5saW5lJyBkZWZpbml0aW9uIGFzCj4gPiBpcyB0
aGVuLiBIb3dldmVyLCBzaW5jZSBhIGxhdGVyIHBhdGNoIChwYXRjaC0wNS8xNCkgZGVmaW5lcwo+
ID4ga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2UoKSBpbiBhcmNoL3g4Ni9rdm0vbW11
L21tdS5jLCBkbyB5b3UKPiA+IHRoaW5rIHdlIGNhbiBtb3ZlIHRoaXMgZGVmaW5pdGlvbiB0byB0
aGUgLmMgZmlsZSBhcyB3ZWxsIGZvcgo+ID4gY29uc2lzdGVuY3k/Cj4KPiBXZSAiY2FuIiwgYnV0
IEkgZG9uJ3Qgc2VlIGFueSByZWFzb24gdG8gZG8gc28uICBUcnlpbmcgdG8gbWFrZSBoZWxwZXJz
IGNvbnNpc3RlbnRseQo+IGlubGluZSBvciBub3QgaXMgdXN1YWxseSBhIGZvb2xzIGVycmFuZC4g
IEFuZCBpbiB0aGlzIGNhc2UsIEknZCBhY3R1YWxseSByYXRoZXIgZ28KPiB0aGUgb3Bwb3NpdGUg
ZGlyZWN0aW9uIGFuZCBtYWtlIHRoZSByYW5nZSB2YXJpYW50IGFuIGlubGluZS4KPgo+IEhhISAg
QW5kIEkgY2FuIGp1c3RpZnkgdGhhdCB3aXRoIG1pbmltYWwgZWZmb3J0LiAgVGhlIGJlbG93IG1h
a2VzIHRoZSBoZWxwZXIgYQo+IHN0cmFpZ2h0IHBhc3N0aHJvdWdoIGZvciBDT05GSUdfSFlQRVJW
PW4gYnVpbGRzLCBhdCB3aGljaCBwb2ludCBJIHRoaW5rIGl0IG1ha2VzCj4gc2Vuc2UgZm9yIGl0
IHRvIGJlIGlubGluZS4KPgo+IElmIGl0IHdvbid0IHNsb3cgeW91ciBzZXJpZXMgZG93biBldmVu
IG1vcmUsIGFueSBvYmplY3Rpb24gdG8gc2xpZGluZyB0aGUgYmVsb3cKPiBwYXRjaCBpbiBzb21l
d2hlcmUgYmVmb3JlIHBhdGNoIDU/ICBBbmQgdGhlbiBhZGQgYSBwYXRjaCB0byBpbmxpbmUgdGhl
IHJhbmdlLWJhc2VkCj4gaGVscGVyPwo+ClNpbmNlIGl0IGlzIGEgbGl0dGxlIGRpdmVydGVkIGZy
b20gdGhlIHJlc3Qgb2YgdGhlIHNlcmllcycgZ29hbCAoYW5kCnllcywgdGhlIHNsb3dpbmcgZG93
biBwYXJ0KSwgZG8geW91IG1pbmQgaWYgd2Ugc2VuZCBpdCBhcyBhIHNlcGFyYXRlCnNlcmllcz8g
OikKSSdsbCBrZWVwIHRoZSBmdW5jdGlvbnMgYXMgd2UgaGF2ZSBvbiB2OCBmb3Igbm93LgoKVGhh
bmsgeW91LgpSYWdoYXZlbmRyYQo+IERpc2NsYWltZXI6IGNvbXBpbGUgdGVzdGVkIG9ubHkuCj4K
PiAtLS0KPiBGcm9tOiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KPiBE
YXRlOiBUaHUsIDEwIEF1ZyAyMDIzIDE1OjU4OjUzIC0wNzAwCj4gU3ViamVjdDogW1BBVENIXSBL
Vk06IHg4Ni9tbXU6IERlY2xhcmUgZmx1c2hfcmVtb3RlX3RsYnN7X3JhbmdlfSgpIGhvb2tzIGlm
Zgo+ICBIWVBFUlYhPW4KPgo+IERlY2xhcmUgdGhlIGt2bV94ODZfb3BzIGhvb2tzIHVzZWQgdG8g
d2lyZSB1cCBwYXJhdmlydCBUTEIgZmx1c2hlcyB3aGVuCj4gcnVubmluZyB1bmRlciBIeXBlci1W
IGlmIGFuZCBvbmx5IGlmIENPTkZJR19IWVBFUlYhPW4uICBXcmFwcGluZyB5ZXQgbW9yZQo+IGNv
ZGUgd2l0aCBJU19FTkFCTEVEKENPTkZJR19IWVBFUlYpIGVsaW1pbmF0ZXMgYSBoYW5kZnVsIG9m
IGNvbmRpdGlvbmFsCj4gYnJhbmNoZXMsIGFuZCBtYWtlcyBpdCBzdXBlciBvYnZpb3VzIHdoeSB0
aGUgaG9va3MgKm1pZ2h0KiBiZSB2YWxpZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0
b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgo+IC0tLQo+ICBhcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9rdm0teDg2LW9wcy5oIHwgMiArKwo+ICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5o
ICAgIHwgNCArKysrCj4gIGFyY2gveDg2L2t2bS9tbXUvbW11LmMgICAgICAgICAgICAgfCA2ICsr
KysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm0teDg2LW9wcy5oIGIvYXJjaC94ODYvaW5jbHVkZS9h
c20va3ZtLXg4Ni1vcHMuaAo+IGluZGV4IDEzYmMyMTJjZDRiYy4uNmJjMWFiMDYyN2I3IDEwMDY0
NAo+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bS14ODYtb3BzLmgKPiArKysgYi9hcmNo
L3g4Ni9pbmNsdWRlL2FzbS9rdm0teDg2LW9wcy5oCj4gQEAgLTU0LDggKzU0LDEwIEBAIEtWTV9Y
ODZfT1Aoc2V0X3JmbGFncykKPiAgS1ZNX1g4Nl9PUChnZXRfaWZfZmxhZykKPiAgS1ZNX1g4Nl9P
UChmbHVzaF90bGJfYWxsKQo+ICBLVk1fWDg2X09QKGZsdXNoX3RsYl9jdXJyZW50KQo+ICsjaWYg
SVNfRU5BQkxFRChDT05GSUdfSFlQRVJWKQo+ICBLVk1fWDg2X09QX09QVElPTkFMKGZsdXNoX3Jl
bW90ZV90bGJzKQo+ICBLVk1fWDg2X09QX09QVElPTkFMKGZsdXNoX3JlbW90ZV90bGJzX3Jhbmdl
KQo+ICsjZW5kaWYKPiAgS1ZNX1g4Nl9PUChmbHVzaF90bGJfZ3ZhKQo+ICBLVk1fWDg2X09QKGZs
dXNoX3RsYl9ndWVzdCkKPiAgS1ZNX1g4Nl9PUCh2Y3B1X3ByZV9ydW4pCj4gZGlmZiAtLWdpdCBh
L2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9r
dm1faG9zdC5oCj4gaW5kZXggNjBkNDMwYjQ2NTBmLi4wNGZjODAxMTJkZmUgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+ICsrKyBiL2FyY2gveDg2L2luY2x1
ZGUvYXNtL2t2bV9ob3N0LmgKPiBAQCAtMTYwNCw5ICsxNjA0LDExIEBAIHN0cnVjdCBrdm1feDg2
X29wcyB7Cj4KPiAgICAgICAgIHZvaWQgKCpmbHVzaF90bGJfYWxsKShzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpOwo+ICAgICAgICAgdm9pZCAoKmZsdXNoX3RsYl9jdXJyZW50KShzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUpOwo+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfSFlQRVJWKQo+ICAgICAgICAgaW50
ICAoKmZsdXNoX3JlbW90ZV90bGJzKShzdHJ1Y3Qga3ZtICprdm0pOwo+ICAgICAgICAgaW50ICAo
KmZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKShzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IGdmbiwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2ZuX3QgbnJfcGFnZXMpOwo+
ICsjZW5kaWYKPgo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIEZsdXNoIGFueSBUTEIgZW50cmll
cyBhc3NvY2lhdGVkIHdpdGggdGhlIGdpdmVuIEdWQS4KPiBAQCAtMTgxNCw2ICsxODE2LDcgQEAg
c3RhdGljIGlubGluZSBzdHJ1Y3Qga3ZtICprdm1fYXJjaF9hbGxvY192bSh2b2lkKQo+ICAjZGVm
aW5lIF9fS1ZNX0hBVkVfQVJDSF9WTV9GUkVFCj4gIHZvaWQga3ZtX2FyY2hfZnJlZV92bShzdHJ1
Y3Qga3ZtICprdm0pOwo+Cj4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19IWVBFUlYpCj4gICNkZWZp
bmUgX19LVk1fSEFWRV9BUkNIX0ZMVVNIX1JFTU9URV9UTEIKPiAgc3RhdGljIGlubGluZSBpbnQg
a3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYihzdHJ1Y3Qga3ZtICprdm0pCj4gIHsKPiBAQCAtMTgy
Myw2ICsxODI2LDcgQEAgc3RhdGljIGlubGluZSBpbnQga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3Rs
YihzdHJ1Y3Qga3ZtICprdm0pCj4gICAgICAgICBlbHNlCj4gICAgICAgICAgICAgICAgIHJldHVy
biAtRU5PVFNVUFA7Cj4gIH0KPiArI2VuZGlmCj4KPiAgI2RlZmluZSBrdm1fYXJjaF9wbWlfaW5f
Z3Vlc3QodmNwdSkgXAo+ICAgICAgICAgKCh2Y3B1KSAmJiAodmNwdSktPmFyY2guaGFuZGxpbmdf
aW50cl9mcm9tX2d1ZXN0KQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vbW11L21tdS5jIGIv
YXJjaC94ODYva3ZtL21tdS9tbXUuYwo+IGluZGV4IDllNGNkOGI0YTIwMi4uMDE4OWRmZWNjZTFm
IDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKPiArKysgYi9hcmNoL3g4Ni9r
dm0vbW11L21tdS5jCj4gQEAgLTI3MSwxOCArMjcxLDI0IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWdu
ZWQgbG9uZyBrdm1fbW11X2dldF9ndWVzdF9wZ2Qoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+Cj4g
IHN0YXRpYyBpbmxpbmUgYm9vbCBrdm1fYXZhaWxhYmxlX2ZsdXNoX3JlbW90ZV90bGJzX3Jhbmdl
KHZvaWQpCj4gIHsKPiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0hZUEVSVikKPiAgICAgICAgIHJl
dHVybiBrdm1feDg2X29wcy5mbHVzaF9yZW1vdGVfdGxic19yYW5nZTsKPiArI2Vsc2UKPiArICAg
ICAgIHJldHVybiBmYWxzZTsKPiArI2VuZGlmCj4gIH0KPgo+ICB2b2lkIGt2bV9mbHVzaF9yZW1v
dGVfdGxic19yYW5nZShzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IHN0YXJ0X2dmbiwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBnZm5fdCBucl9wYWdlcykKPiAgewo+ICsjaWYgSVNf
RU5BQkxFRChDT05GSUdfSFlQRVJWKQo+ICAgICAgICAgaW50IHJldCA9IC1FT1BOT1RTVVBQOwo+
Cj4gICAgICAgICBpZiAoa3ZtX3g4Nl9vcHMuZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2UpCj4gICAg
ICAgICAgICAgICAgIHJldCA9IHN0YXRpY19jYWxsKGt2bV94ODZfZmx1c2hfcmVtb3RlX3RsYnNf
cmFuZ2UpKGt2bSwgc3RhcnRfZ2ZuLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBucl9wYWdlcyk7Cj4gICAgICAgICBp
ZiAocmV0KQo+ICsjZW5kaWYKPiAgICAgICAgICAgICAgICAga3ZtX2ZsdXNoX3JlbW90ZV90bGJz
KGt2bSk7Cj4gIH0KPgo+Cj4gYmFzZS1jb21taXQ6IGJjOWU2ODgyMDI3NGMwMjU4NDBkMzA1NmQ2
M2Y5MzhkNzRjYTM1YmIKPiAtLQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
