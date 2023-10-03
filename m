Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D95E75459
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 18:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7F77YqeU0Yhye+liVsmXlqEOw37AhkL3NK75n26mdlU=; b=yc0z4IqhQJfZnn
	pmNDvBG8NleVLTxWGyJEgKwq6PXfwONMUkVnJaueCyJeLDh27IhUxBzlbal9LSKu0JOro9+qID4a5
	YzKaMJcX8+gilRnfzr6oH57xPdZAOL8dZmQwYahdKw1a/PJjOk2ZVfbxz4KQp9HUarHEOWJEm38i1
	qR/zkvg1danke5jpdBwZN8vbFo6Nkh0bgTVw3FoYZtZQHdOIbhSRseDZirYdNK6xsmfcI4jKpyWVH
	WzKem0CVQRUPjwux88tPHimng5fcNxlt0HN3bFpH68xiOui6u2AuzQAYhp0Eyof+uN8uQkb2oFXhb
	eNeiSrqAto82Dhil1rjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnkDR-00F7YJ-0D;
	Tue, 03 Oct 2023 18:33:53 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnkDN-00F7Wn-1b
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 18:33:51 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-65b0a54d436so7090786d6.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 11:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696358027; x=1696962827; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9RZg3twPdN7SJarZ/3IsJk/93o/jgnrY3ylxDmEVWY=;
        b=Cv7CIo1aEz/D4wFfOsX3+ssVeiYdI5epyDhXb18rAatISxk5E4+2NZYlaTgY8uNDLn
         KeyxEngDqsj+J8Oi5FPEBeTfcLiryyKT4KFTxmiUWDxx8/JWFxGuqRfRTRjGft1ILo4A
         Lg63IZUkbPGzhH2p9DUWYz9WGWSLGhuUBO3wKAcV3icmY/C/bKlLcrG4OJCY0Utczy/R
         R5SbLPzmT7X8H5Ox3bwDXM3K97H3uX2ExE7Iy2ge0b99/wtAMHtM9r2wJT84Ax/v3GiO
         YpWxOj5cPEKw2yX4QuldYsJK9CPKD2AdyzH94RuByPum1Us6j3wPc2WaplB7aQ/y03uR
         28dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696358027; x=1696962827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9RZg3twPdN7SJarZ/3IsJk/93o/jgnrY3ylxDmEVWY=;
        b=j1BPrwK+bIAGqv+d6KW34W/U23qnnEiaX7IJ9Ac9rqW2egCGbfrHFfMvWjeqgbukhr
         HCrwpXs18tY6l7dTfRqCae1cghE6qy1Yld8g3SaeiTJUfzwh7sscDsdNngCcRSCz5VnJ
         XNBtBwWPQH8FhFFyCWu7lvbfVtyWCkMM5nLqAFg/G+QPUN+J6czEP1Pql3D5IpNpBL/j
         Qd8k0BxCB61pwWvd3K6D5np0WS8IIZLYKx+SScHj0lAKXG1XuLXyCrKy0PGsZxRuoada
         CB8U9IVYCOk29jo9LZhb8JgikV0hPYWgrf1lb/r42P78fdJmlD6lIf7Ifqofmf76sJts
         YBIw==
X-Gm-Message-State: AOJu0YzLy0EI51yB4wM8/p/qQV55Ph2RMmnVv+5dcqhYeqQsoUynF9iX
	Erc17XBXA7RcpdV0FgvC24LJQRKLNJYp/xrPy5D2/A==
X-Google-Smtp-Source: AGHT+IFD9MiWpIrPl+X1KG+mF8SaIxZsGnEuN1WGAxrVYz5JoBkTLtzwKfCvY0TUsCLlDtWXvgqIVLrhKrhnAnrWPa0=
X-Received: by 2002:a0c:c409:0:b0:64f:3699:90cd with SMTP id
 r9-20020a0cc409000000b0064f369990cdmr170157qvi.42.1696358027177; Tue, 03 Oct
 2023 11:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-12-seanjc@google.com>
 <CA+EHjTzSUXx8P9gWmUERg4owxH6r6yNPm1_RL-BzS_2CNPtRKw@mail.gmail.com> <ZRw6X2BptZnRPNK7@google.com>
In-Reply-To: <ZRw6X2BptZnRPNK7@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 3 Oct 2023 19:33:09 +0100
Message-ID: <CA+EHjTzx+0pxh7DYONZUeJsm1GCiC6L8Vg_Tm9MLVEae-FKuQg@mail.gmail.com>
Subject: Re: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Peng <chao.p.peng@linux.intel.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_113349_535971_DAC934DC 
X-CRM114-Status: GOOD (  45.14  )
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

SGkgU2VhbiwKCgpPbiBUdWUsIE9jdCAzLCAyMDIzIGF0IDQ6NTnigK9QTSBTZWFuIENocmlzdG9w
aGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE9jdCAwMywgMjAy
MywgRnVhZCBUYWJiYSB3cm90ZToKPiA+IEhpLAo+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvdWFwaS9saW51eC9rdm0uaCBiL2luY2x1ZGUvdWFwaS9saW51eC9rdm0uaAo+ID4gPiBpbmRl
eCBkMmQ5MTNhY2YwZGYuLmY4NjQyZmYyZWI5ZCAxMDA2NDQKPiA+ID4gLS0tIGEvaW5jbHVkZS91
YXBpL2xpbnV4L2t2bS5oCj4gPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9rdm0uaAo+ID4g
PiBAQCAtMTIyNyw2ICsxMjI3LDcgQEAgc3RydWN0IGt2bV9wcGNfcmVzaXplX2hwdCB7Cj4gPiA+
ICAjZGVmaW5lIEtWTV9DQVBfQVJNX0VBR0VSX1NQTElUX0NIVU5LX1NJWkUgMjI4Cj4gPiA+ICAj
ZGVmaW5lIEtWTV9DQVBfQVJNX1NVUFBPUlRFRF9CTE9DS19TSVpFUyAyMjkKPiA+ID4gICNkZWZp
bmUgS1ZNX0NBUF9VU0VSX01FTU9SWTIgMjMwCj4gPiA+ICsjZGVmaW5lIEtWTV9DQVBfTUVNT1JZ
X0FUVFJJQlVURVMgMjMxCj4gPiA+Cj4gPiA+ICAjaWZkZWYgS1ZNX0NBUF9JUlFfUk9VVElORwo+
ID4gPgo+ID4gPiBAQCAtMjI5Myw0ICsyMjk0LDE3IEBAIHN0cnVjdCBrdm1fczM5MF96cGNpX29w
IHsKPiA+ID4gIC8qIGZsYWdzIGZvciBrdm1fczM5MF96cGNpX29wLT51LnJlZ19hZW4uZmxhZ3Mg
Ki8KPiA+ID4gICNkZWZpbmUgS1ZNX1MzOTBfWlBDSU9QX1JFR0FFTl9IT1NUICAgICgxIDw8IDAp
Cj4gPiA+Cj4gPiA+ICsvKiBBdmFpbGFibGUgd2l0aCBLVk1fQ0FQX01FTU9SWV9BVFRSSUJVVEVT
ICovCj4gPiA+ICsjZGVmaW5lIEtWTV9HRVRfU1VQUE9SVEVEX01FTU9SWV9BVFRSSUJVVEVTICAg
IF9JT1IoS1ZNSU8sICAweGQyLCBfX3U2NCkKPiA+ID4gKyNkZWZpbmUgS1ZNX1NFVF9NRU1PUllf
QVRUUklCVVRFUyAgICAgICAgICAgICAgX0lPVyhLVk1JTywgIDB4ZDMsIHN0cnVjdCBrdm1fbWVt
b3J5X2F0dHJpYnV0ZXMpCj4gPiA+ICsKPiA+ID4gK3N0cnVjdCBrdm1fbWVtb3J5X2F0dHJpYnV0
ZXMgewo+ID4gPiArICAgICAgIF9fdTY0IGFkZHJlc3M7Cj4gPiA+ICsgICAgICAgX191NjQgc2l6
ZTsKPiA+ID4gKyAgICAgICBfX3U2NCBhdHRyaWJ1dGVzOwo+ID4gPiArICAgICAgIF9fdTY0IGZs
YWdzOwo+ID4gPiArfTsKPiA+ID4gKwo+ID4gPiArI2RlZmluZSBLVk1fTUVNT1JZX0FUVFJJQlVU
RV9QUklWQVRFICAgICAgICAgICAoMVVMTCA8PCAzKQo+ID4gPiArCj4gPgo+ID4gSW4gcEtWTSwg
d2UgZG9uJ3Qgd2FudCB0byBhbGxvdyBzZXR0aW5nIChvciBjbGVhcmluZykgb2YgUFJJVkFURS9T
SEFSRUQKPiA+IGF0dHJpYnV0ZXMgZnJvbSB1c2Vyc3BhY2UuCj4KPiBXaHkgbm90PyAgVGhlIHdo
b2xlIHRoaW5nIGZhbGxzIGFwYXJ0IGlmIHVzZXJzcGFjZSBkb2Vzbid0ICprbm93KiB0aGUgc3Rh
dGUgb2YgYQo+IHBhZ2UsIGFuZCB0aGUgb25seSB3YXkgZm9yIHVzZXJzcGFjZSB0byBrbm93IHRo
ZSBzdGF0ZSBvZiBhIHBhZ2UgYXQgYSBnaXZlbiBtb21lbnQKPiBpbiB0aW1lIGlzIGlmIHVzZXJz
cGFjZSBjb250cm9scyB0aGUgYXR0cmlidXRlcy4gIEUuZy4gZXZlbiBpZiBLVk0gd2VyZSB0byBw
cm92aWRlCj4gYSB3YXkgZm9yIHVzZXJzcGFjZSB0byBxdWVyeSBhdHRyaWJ1dGVzLCB0aGUgYXR0
cmlidXRlcyBleHBvc2VkIHRvIHVzcnNwYWNlIHdvdWxkCj4gYmVjb21lIHN0YWxlIHRoZSBpbnN0
YW50IEtWTSBkcm9wcyBzbG90c19sb2NrIChvciB3aGF0ZXZlciBsb2NrIHByb3RlY3RzIHRoZSBh
dHRyaWJ1dGVzKQo+IHNpbmNlIHVzZXJzcGFjZSBjb3VsZG4ndCBwcmV2ZW50IGZ1dHVyZSBjaGFu
Z2VzLgoKSSB0aGluayBJIG1pZ2h0IG5vdCBxdWl0ZSB1bmRlcnN0YW5kIHRoZSBwdXJwb3NlIG9m
IHRoZQpLVk1fU0VUX01FTU9SWV9BVFRSSUJVVEVTIEFCSS4gSW4gcEtWTSwgYWxsIG9mIGEgcHJv
dGVjdGVkIGd1ZXN0J3MKbWVtb3J5IGlzIHByaXZhdGUgYnkgZGVmYXVsdCwgdW50aWwgdGhlIGd1
ZXN0IHNoYXJlcyBpdCB3aXRoIHRoZSBob3N0Cih2aWEgYSBoeXBlcmNhbGwpLCBvciBhbm90aGVy
IGd1ZXN0IChmdXR1cmUgd29yaykuIFdoZW4gdGhlIGd1ZXN0CnNoYXJlcyBpdCwgdXNlcnNwYWNl
IGlzIG5vdGlmaWVkIHZpYSBLVk1fRVhJVF9IWVBFUkNBTEwuIEluIG1hbnkgdXNlCmNhc2VzLCB1
c2Vyc3BhY2UgZG9lc24ndCBuZWVkIHRvIGtlZXAgdHJhY2sgZGlyZWN0bHkgb2YgYWxsIG9mIHRo
aXMsCmJ1dCBjYW4gcmVhY3RpdmVseSB1bi9tYXAgdGhlIG1lbW9yeSBiZWluZyB1bi9zaGFyZWQu
Cgo+IFdoeSBkb2VzIHBLVk0gbmVlZCB0byBwcmV2ZW50IHVzZXJzcGFjZSBmcm9tIHN0YXRpbmcg
Kml0cyogdmlldyBvZiBhdHRyaWJ1dGVzPwo+Cj4gSWYgdGhlIGdvYWwgaXMgdG8gcmVkdWNlIG1l
bW9yeSBvdmVyaGVhZCwgdGhhdCBjYW4gYmUgc29sdmVkIGJ5IHVzaW5nIGFuIGludGVybmFsLAo+
IG5vbi1BQkkgYXR0cmlidXRlcyBmbGFnIHRvIHRyYWNrIHBLVk0ncyB2aWV3IG9mIFNIQVJFRCB2
cy4gUFJJVkFURS4gIElmIHRoZSBndWVzdAo+IGF0dGVtcHRzIHRvIGFjY2VzcyBtZW1vcnkgd2hl
cmUgcEtWTSBhbmQgdXNlcnNwYWNlIGRvbid0IGFncmVlIG9uIHRoZSBzdGF0ZSwKPiBnZW5lcmF0
ZSBhbiBleGl0IHRvIHVzZXJzcGFjZS4gIE9yIGtpbGwgdGhlIGd1ZXN0LiAgT3IgZG8gc29tZXRo
aW5nIGVsc2UgZW50aXJlbHkuCgpGb3IgdGhlIHBLVk0gaHlwZXJ2aXNvciB0aGUgZ3Vlc3QncyB2
aWV3IG9mIHRoZSBhdHRyaWJ1dGVzIGRvZXNuJ3QKbWF0dGVyLiBUaGUgaHlwZXJ2aXNvciBhdCB0
aGUgZW5kIG9mIHRoZSBkYXkgaXMgdGhlIHVsdGltYXRlIGFyYml0ZXIKZm9yIHdoYXQgaXMgc2hh
cmVkIGFuZCB3aXRoIGhvdy4gRm9yIHBLVk0gKGF0IGxlYXN0IGluIG15IHBvcnQgb2YKZ3Vlc3Rt
ZW0pLCB3ZSB1c2UgdGhlIG1lbW9yeSBhdHRyaWJ1dGVzIGZyb20gZ3Vlc3RtZW0gZXNzZW50aWFs
bHkgdG8KY29udHJvbCB3aGljaCBtZW1vcnkgY2FuIGJlIG1hcHBlZCBieSB0aGUgaG9zdC4KCk9u
ZSBkaWZmZXJlbmNlIGJldHdlZW4gcEtWTSBhbmQgVERYIChhcyBJIHVuZGVyc3RhbmQgaXQpLCBp
cyB0aGF0IFREWAp1c2VzIHRoZSBtc2Igb2YgdGhlIGd1ZXN0J3MgSVBBIHRvIGluZGljYXRlIHdo
ZXRoZXIgbWVtb3J5IGlzIHNoYXJlZApvciBwcml2YXRlLCBhbmQgdGhhdCBjYW4gZ2VuZXJhdGUg
YSBtaXNtYXRjaCBvbiBndWVzdCBtZW1vcnkgYWNjZXNzCmJldHdlZW4gd2hhdCBpdCB0aGlua3Mg
dGhlIHN0YXRlIGlzLCBhbmQgd2hhdCB0aGUgc2hhcmluZyBzdGF0ZSBpbgpyZWFsaXR5IGlzLiBw
S1ZNIGRvZXNuJ3QgaGF2ZSB0aGF0LiBNZW1vcnkgaXMgcHJpdmF0ZSBieSBkZWZhdWx0LCBhbmQK
Y2FuIGJlIHNoYXJlZCBpbi1wbGFjZSwgYm90aCBpbiB0aGUgZ3Vlc3QncyBJUEEgc3BhY2UgYXMg
d2VsbCBhcyB0aGUKdW5kZXJseWluZyBwaHlzaWNhbCBwYWdlLgoKPiA+IEhvd2V2ZXIsIHdlJ2Qg
bGlrZSB0byB1c2UgdGhlIGF0dHJpYnV0ZXMgeGFycmF5IHRvIHRyYWNrIHRoZSBzaGFyaW5nIHN0
YXRlIG9mCj4gPiBndWVzdCBwYWdlcyBhdCB0aGUgaG9zdCBrZXJuZWwuCj4gPgo+ID4gTW9yZW92
ZXIsIHdlJ2QgcmF0aGVyIHRoZSBkZWZhdWx0IGd1ZXN0IHBhZ2Ugc3RhdGUgYmUgUFJJVkFURSwg
YW5kCj4gPiBvbmx5IHNwZWNpZnkgd2hpY2ggcGFnZXMgYXJlIHNoYXJlZC4gQWxsIHBLVk0gZ3Vl
c3QgcGFnZXMgc3RhcnQgb2ZmIGFzCj4gPiBwcml2YXRlLCBhbmQgdGhlIG1ham9yaXR5IHdpbGwg
cmVtYWluIHNvLgo+Cj4gSSB3b3VsZCByYXRoZXIgb3B0aW1pemUga3ZtX3ZtX3NldF9tZW1fYXR0
cmlidXRlcygpIHRvIGdlbmVyYXRlIHJhbmdlLWJhc2VkCj4geGFycmF5IGVudHJpZXMsIGF0IHdo
aWNoIHBvaW50IGl0IHNob3VsZG4ndCBtYXR0ZXIgYWxsIHRoYXQgbXVjaCB3aGV0aGVyIFBSSVZB
VEUKPiBvciBTSEFSRUQgaXMgdGhlIGRlZmF1bHQgImVtcHR5IiBzdGF0ZS4gIFdlIG9wdGVkIG5v
dCB0byBkbyB0aGF0IGZvciB0aGUgaW5pdGlhbAo+IG1lcmdlIHB1cmVseSB0byBrZWVwIHRoZSBj
b2RlIGFzIHNpbXBsZSBhcyBwb3NzaWJsZSAod2hpY2ggaXMgb2J2aW91c2x5IHN0aWxsIG5vdAo+
IGV4YWN0bHkgc2ltcGxlKS4KPgo+IFdpdGggcmFuZ2UtYmFzZWQgeGFycmF5IGVudHJpZXMsIHRo
ZSBjb3N0IG9mIHRhZ2dpbmcgaHVnZSBjaHVua3Mgb2YgbWVtb3J5IGFzCj4gUFJJVkFURSBzaG91
bGQgYmUgYSBub24taXNzdWUuICBBbmQgaWYgdGhhdCdzIG5vdCBlbm91Z2ggZm9yIHdoYXRldmVy
IHJlYXNvbiwgSQo+IHdvdWxkIHJhdGhlciBkZWZpbmUgdGhlIHBvbGFyaXR5IG9mIFBSSVZBVEUg
b24gYSBwZXItVk0gYmFzaXMsIGJ1dCBvbmx5IGZvciBpbnRlcm5hbAo+IHN0b3JhZ2UuCgpTb3Vu
ZHMgZ29vZC4KCj4gPiBJJ20gbm90IHN1cmUgaWYgdGhpcyBpcyB0aGUgYmVzdCB3YXkgdG8gZG8g
dGhpczogT25lIGlkZWEgd291bGQgYmUgdG8gbW92ZQo+ID4gdGhlIGRlZmluaXRpb24gb2YgS1ZN
X01FTU9SWV9BVFRSSUJVVEVfUFJJVkFURSB0bwo+ID4gYXJjaC8qL2luY2x1ZGUvYXNtL2t2bV9o
b3N0LmgsIHdoaWNoIGlzIHdoZXJlIGt2bV9hcmNoX3N1cHBvcnRlZF9hdHRyaWJ1dGVzKCkKPiA+
IGxpdmVzIGFzIHdlbGwuIFRoaXMgd291bGQgYWxsb3cgZGlmZmVyZW50IGFyY2hpdGVjdHVyZXMg
dG8gc3BlY2lmeSB0aGVpciBvd24KPiA+IGF0dHJpYnV0ZXMgKGkuZS4sIGluc3RlYWQgd2UnZCBo
YXZlIGEgS1ZNX01FTU9SWV9BVFRSSUJVVEVfU0hBUkVEIGZvciBwS1ZNKS4KPiA+IFRoaXMgd291
bGRuJ3QgaGVscCBpbiB0ZXJtcyBvZiBwcmV2ZW50aW5nIHVzZXJzcGFjZSBmcm9tIGNsZWFyaW5n
IGF0dHJpYnV0ZXMKPiA+IChpLmUuLCBzZXR0aW5nIGEgMCBhdHRyaWJ1dGUpIHRob3VnaC4KPiA+
Cj4gPiBUaGUgb3RoZXIgdGhpbmcsIHdoaWNoIHdlIG5lZWQgZm9yIHBLVk0gYW55d2F5LCBpcyB0
byBtYWtlCj4gPiBrdm1fdm1fc2V0X21lbV9hdHRyaWJ1dGVzKCkgZ2xvYmFsLCBzbyB0aGF0IGl0
IGNhbiBiZSBjYWxsZWQgZnJvbSBvdXRzaWRlIG9mCj4gPiBrdm1fbWFpbi5jIChhbHJlYWR5IGhh
dmUgYSBsb2NhbCBwYXRjaCBmb3IgdGhpcyB0aGF0IGRlY2xhcmVzIGl0IGluCj4gPiBrdm1faG9z
dC5oKSwKPgo+IFRoYXQncyBubyBwcm9ibGVtLCBidXQgSSBhbSBkZWZpbml0ZWx5IG9wcG9zZWQg
dG8gS1ZNIG1vZGlmeWluZyBhdHRyaWJ1dGVzIHRoYXQKPiBhcmUgb3duZWQgYnkgdXNlcnNwYWNl
Lgo+Cj4gPiBhbmQgbm90IGdhdGUgdGhpcyBmdW5jdGlvbiBieSBLVk1fR0VORVJJQ19NRU1PUllf
QVRUUklCVVRFUy4KPgo+IEFzIGFib3ZlLCBJIGFtIG9wcG9zZWQgdG8gcEtWTSBoYXZpbmcgYSBj
b21wbGV0ZWx5IGRpZmZlcmVudCBBQkkgZm9yIG1hbmFnaW5nCj4gUFJJVkFURSB2cy4gU0hBUkVE
LiAgSSBoYXZlIG5vIG9iamVjdGlvbiB0byBwS1ZNIHVzaW5nIHVuY2xhaW1lZCBmbGFncyBpbiB0
aGUKPiBhdHRyaWJ1dGVzIHRvIHN0b3JlIGV4dHJhIG1ldGFkYXRhLCBidXQgaWYgS1ZNX1NFVF9N
RU1PUllfQVRUUklCVVRFUyBkb2Vzbid0IHdvcmsKPiBmb3IgcEtWTSwgdGhlbiB3ZSd2ZSBmYWls
ZWQgbWlzZXJhYmx5IGFuZCBzaG91bGQgcmV2aXN0IHRoZSB1QVBJLgoKTGlrZSBJIHNhaWQsIHBL
Vk0gZG9lc24ndCBuZWVkIGEgdXNlcnNwYWNlIEFCSSBmb3IgbWFuYWdpbmcKUFJJVkFURS9TSEFS
RUQsIGp1c3QgYSB3YXkgb2YgdHJhY2tpbmcgaW4gdGhlIGhvc3Qga2VybmVsIG9mIHdoYXQgaXMK
c2hhcmVkIChhcyBvcHBvc2VkIHRvIHRoZSBoeXBlcnZpc29yLCB3aGljaCBhbHJlYWR5IGhhcyB0
aGUKa25vd2xlZGdlKS4gVGhlIHNvbHV0aW9uIGNvdWxkIHNpbXBseSBiZSB0aGF0IHBLVk0gZG9l
cyBub3QgZW5hYmxlCktWTV9HRU5FUklDX01FTU9SWV9BVFRSSUJVVEVTLCBoYXMgaXRzIG93biB0
cmFja2luZyBvZiB0aGUgc3RhdHVzIG9mCnRoZSBndWVzdCBwYWdlcywgYW5kIG9ubHkgc2VsZWN0
cyBLVk1fUFJJVkFURV9NRU0uCgpUaGFua3MhCi9mdWFkCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
