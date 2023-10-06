Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A92E92FDD
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 03:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=18UzxoC3oImJWSR2sgOO4Eszi6mlAUXhoKGJ78DbYt0=; b=ABnYyDVx8MU54+AXujQssjMAoa
	Spz7SdXV1sbpSWZWjoluRyq+yAwm29N2dipHsukhBBeJ8NBnDkoybFHuD2eymZ6KSHZM2tsMELqaP
	d1vjVkmrZsRWfJLUU1OZSTGWxtb1XKWM71WuoWM30Lo1aUB9dEIBQ2dtscHX8yJnnAXbHt2R1mwPt
	Nvlxq9U5KOlstwADSSjVYm6oxokzWHKNL5gnrHFiafqIJmXKtbTyg98b4sJzG9APwBI+bBUhvdpKu
	r38S9G5V9W+7VZjtWESKGvpfqvZfwAvntSuvtSaRzq800eHEqmnENF3Bb2A0LfHtwzd1dFAtja5z9
	7M0mrlkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qobP2-004qfN-2N;
	Fri, 06 Oct 2023 03:21:24 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qobOy-004qcR-1I
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 03:21:23 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-59b59e1ac70so25289957b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Oct 2023 20:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696562477; x=1697167277; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GCfD3J/utVXt7fNFcXS7tndSxc76Lg25lhLquZNVGo=;
        b=j6dJ8gWiLBN0fbJWWKgxrbiJQQrcqNRfU9Kf7QJrDBF2P4juuFkTyecxJ3J3O3Y/NQ
         jUxCZ1YmB1+EG4XeC3NnB7EMJ9Ig/kXZ004yJPAdhMSOOzoGMw0moOF/srrAzo4gn0K9
         p0nK74Qe7HHq/+THNlgRROvlkiET72a9tckmrGzSgvrSDfFu3MhZSrmJ3l5elP35WQ2g
         MYZ27Uox8kjcM+4r2PikdvLqcuN2u1/bTDP0bguUD6eDs5tSp7Svyo8daIIJzGkT6p4d
         yvL2uYjT0FZH+8IXK4X1+lm6X3waGsP8swA/AL/kFHq1gzXfFC2YH3v7TZpMlKUx/mrt
         HxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696562477; x=1697167277;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+GCfD3J/utVXt7fNFcXS7tndSxc76Lg25lhLquZNVGo=;
        b=HKJrW7YNl4p2s8nPIoMmy3b7Y+MUv1UzXg9JayjTcUEF+w+YIGM0cCXLqwTzBbCSeX
         8gzKboXTJFe98BoNBc60G0mvQ30tGei6A7KA8umXvvSvClyi+k40TzSWBVeCGtJ/Uj1Q
         sE6YwYO5/XRa7bPF8K6OLTfAIAGLzv7ueQCPnyMqGiYLMM/0sfB8x0TaBQwACx0pO1hF
         cQrO/sIhk7w9dN2YvpuV3a1O2YnUaj8IM9k0O7ATgVtronnnSqrErtlZd7z0hgxEnMb8
         P0vVa8p75LBY4b8J09WagffwOlMwwz8iK36j1RidIWzyUv95LEsplNAlHar0pfVFQ/i8
         zrJw==
X-Gm-Message-State: AOJu0YzHhEN2MCAgnQ+NVYoYUGqUKHvt8mZbDTDiZmeVeah6ekRKJDqV
	nzCUm8BrpTNJ6RsiNZGX5lPwU6X3BIY=
X-Google-Smtp-Source: AGHT+IHbgJX1dul2brLKqtxy3zNH4Wq8osuz6z+RCm0MrNAV7Qoo4mqOPY/NVTlIcosnwAkmq4EHKfjNEDc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ae41:0:b0:d78:a78:6fc7 with SMTP id
 g1-20020a25ae41000000b00d780a786fc7mr101904ybe.6.1696562477545; Thu, 05 Oct
 2023 20:21:17 -0700 (PDT)
Date: Thu, 5 Oct 2023 20:21:15 -0700
In-Reply-To: <CA+EHjTwTgEVtea7wgef5G6EEgFa0so_GbNXTMZNKyFE=ucyV0g@mail.gmail.com>
Mime-Version: 1.0
References: <CA+EHjTwTgEVtea7wgef5G6EEgFa0so_GbNXTMZNKyFE=ucyV0g@mail.gmail.com>
Message-ID: <ZR99K_ZuWXEtfDuR@google.com>
Subject: Re: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, KVM <kvm@vger.kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, KVMARM <kvmarm@lists.linux.dev>, 
	LinuxMIPS <linux-mips@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_202120_441322_9C2CDAC2 
X-CRM114-Status: GOOD (  27.58  )
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

T24gVGh1LCBPY3QgMDUsIDIwMjMsIEZ1YWQgVGFiYmEgd3JvdGU6Cj4gSGkgU2VhbiwKPiAKPiBP
biBUdWUsIE9jdCAzLCAyMDIzIGF0IDk6NTHigK9QTSBTZWFuIENocmlzdG9waGVyc29uIDxzZWFu
amNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPiA+IExpa2UgSSBzYWlkLCBwS1ZNIGRvZXNuJ3QgbmVl
ZCBhIHVzZXJzcGFjZSBBQkkgZm9yIG1hbmFnaW5nIFBSSVZBVEUvU0hBUkVELAo+ID4gPiBqdXN0
IGEgd2F5IG9mIHRyYWNraW5nIGluIHRoZSBob3N0IGtlcm5lbCBvZiB3aGF0IGlzIHNoYXJlZCAo
YXMgb3Bwb3NlZCB0bwo+ID4gPiB0aGUgaHlwZXJ2aXNvciwgd2hpY2ggYWxyZWFkeSBoYXMgdGhl
IGtub3dsZWRnZSkuIFRoZSBzb2x1dGlvbiBjb3VsZCBzaW1wbHkKPiA+ID4gYmUgdGhhdCBwS1ZN
IGRvZXMgbm90IGVuYWJsZSBLVk1fR0VORVJJQ19NRU1PUllfQVRUUklCVVRFUywgaGFzIGl0cyBv
d24KPiA+ID4gdHJhY2tpbmcgb2YgdGhlIHN0YXR1cyBvZiB0aGUgZ3Vlc3QgcGFnZXMsIGFuZCBv
bmx5IHNlbGVjdHMgS1ZNX1BSSVZBVEVfTUVNLgo+ID4KPiA+IEF0IHRoZSByaXNrIG9mIG92ZXJz
dGVwcGluZyBteSBib3VuZHMsIEkgdGhpbmsgdGhhdCBlZmZlY3RpdmVseSBnaXZpbmcgdGhlIGd1
ZXN0Cj4gPiBmdWxsIGNvbnRyb2wgb3ZlciB3aGF0IGlzIHNoYXJlZCB2cy4gcHJpdmF0ZSBpcyBh
IG1pc3Rha2UuICBJdCBtb3JlIG9yIGxlc3MgbG9ja3MKPiA+IHBLVk0gaW50byBhIHNpbmdsZSBt
b2RlbCwgYW5kIGV2ZW4gd2l0aGluIHRoYXQgbW9kZWwsIGRlYWxpbmcgd2l0aCBlcnJvcnMgYW5k
L29yCj4gPiBtaXNiZWhhdmluZyBndWVzdHMgYmVjb21lcyB1bm5lY2Vzc2FyaWx5IHByb2JsZW1h
dGljLgo+ID4KPiA+IFVzaW5nIEtWTV9TRVRfTUVNT1JZX0FUVFJJQlVURVMgbWF5IG5vdCBwcm92
aWRlIHZhbHVlICp0b2RheSosIGUuZy4gdGhlIHVzZXJzcGFjZQo+ID4gc2lkZSBvZiBwS1ZNIGNv
dWxkIHNpbXBseSAicmVmbGVjdCIgYWxsIGNvbnZlcnNpb24gaHlwZXJjYWxscywgYW5kIHRlcm1p
bmF0ZSB0aGUKPiA+IFZNIG9uIGVycm9ycy4gIEJ1dCB0aGUgY29zdCBpcyB2ZXJ5IG1pbmltYWws
IGUuZy4gYSBzaW5nbGUgZXh0cmEgaW9jdGwoKSBwZXIKPiA+IGNvbnZlcmlvbiwgYW5kIHRoZSB1
cHNpZGUgaXMgdGhhdCBwS1ZNIHdvbid0IGJlIHN0dWNrIGlmIGEgdXNlIGNhc2UgY29tZXMgYWxv
bmcKPiA+IHRoYXQgd2FudHMgdG8gZ28gYmV5b25kICJhbGwgY29udmVyc2lvbiByZXF1ZXN0cyBl
aXRoZXIgaW1tZWRpYXRlbHkgc3VjY2VlZCBvcgo+ID4gdGVybWluYXRlIHRoZSBndWVzdCIuCj4g
Cj4gTm93IHRoYXQgSSB1bmRlcnN0YW5kIHRoZSBwdXJwb3NlIG9mIEtWTV9TRVRfTUVNT1JZX0FU
VFJJQlVURVMsIEkKPiBhZ3JlZS4gSG93ZXZlciwgcEtWTSBuZWVkcyB0byB0cmFjayBhdCB0aGUg
aG9zdCBrZXJuZWwgKGkuZS4sIEVMMSkKPiB3aGV0aGVyIGd1ZXN0IG1lbW9yeSBpcyBzaGFyZWQg
b3IgcHJpdmF0ZS4KCldoeSBkb2VzIEVMMSBuZWVkIGl0J3Mgb3duIHZpZXcvb3Bpbmlvbj8gIEUu
Zy4gaXMgaXQgdG8gYXZvaWQgYSBhY2Nlc3NpbmcgZGF0YQp0aGF0IGlzIHN0aWxsIHByaXZhdGUg
YWNjb3JkaW5nIHRvIEVMMiAob24gYmVoYWxmIG9mIHRoZSBndWVzdCk/CgpBc3N1bWluZyB0aGF0
J3MgdGhlIGNhc2UsIHdoeSBjYW4ndCBFTDEgd2FpdCB1bnRpbCBpdCBnZXRzIGNvbmZpcm1hdGlv
biBmcm9tIEVMMgp0aGF0IHRoZSBkYXRhIGlzIGZ1bGx5IHNoYXJlZCBiZWZvcmUgZG9pbmcgd2hh
dGV2ZXIgaXQgaXMgdGhhdCBuZWVkcyB0byBiZSBkb25lPwoKQWgsIGlzIHRoZSBwcm9ibGVtIHRo
YXQgd2hldGhlciBvciBub3QgLm1tYXAoKSBpcyBhbGxvd2VkIGtleXMgb2ZmIG9mIHRoZSBzdGF0
ZQpvZiB0aGUgbWVtb3J5IGF0dHJpYnV0ZXM/ICBJZiB0aGF0J3Mgc28sIHRoZW4geWVhaCwgYW4g
aW50ZXJuYWwgZmxhZyBpbiBhdHRyaWJ1dGVzCmlzIHByb2JhYmx5IHRoZSB3YXkgdG8gZ28uICBJ
dCBkb2Vzbid0IG5lZWQgdG8gYmUgYSAiaG9zdCBrZXJuZWwgcHJpdmF0ZSIgZmxhZwp0aG91Z2gs
IGUuZy4gYW4gSU5fRkxVWCBmbGFnIHRvIGNhcHR1cmUgdGhhdCB0aGUgYXR0cmlidXRlcyBhcmVu
J3QgZnVsbHkgcmVhbGl6ZWQKbWlnaHQgYmUgbW9yZSBpbnR1aXRpdmUgZm9yIHJlYWRlcnMsIGFu
ZCBtaWdodCBoYXZlIHV0aWxpdHkgZm9yIG90aGVyIGF0dHJpYnV0ZXMKaW4gdGhlIGZ1dHVyZSB0
b28uCgo+IE9uZSBhcHByb2FjaCB3b3VsZCBiZSB0byBhZGQgYW5vdGhlciBmbGFnIHRvIHRoZSBh
dHRyaWJ1dGVzIHRoYXQKPiB0cmFja3MgdGhlIGhvc3Qga2VybmVsIHZpZXcuIFRoZSB3YXkgS1ZN
X1NFVF9NRU1PUllfQVRUUklCVVRFUyBpcwo+IGltcGxlbWVudGVkIG5vdywgdXNlcnNwYWNlIGNh
biB6ZXJvIGl0LCBzbyBpbiB0aGF0IGNhc2UsIHRoYXQKPiBvcGVyYXRpb24gd291bGQgbmVlZCB0
byBiZSBtYXNrZWQgdG8gYXZvaWQgdGhhdC4KPiAKPiBBbm90aGVyIGFwcHJvYWNoIHdvdWxkIGJl
IHRvIGhhdmUgYSBwS1ZNLXNwZWNpZmljIHhhcnJheSAob3Igc2ltaWxhcikKPiB0byBkbyB0aGUg
dHJhY2tpbmcsIGJ1dCBzaW5jZSB0aGVyZSBpcyBhIHN0cnVjdHVyZSB0aGF0J3MgYWxyZWFkeQo+
IGRvaW5nIHNvbWV0aGluZyBzaW1pbGFyIChpLmUuLHRoZSBhdHRyaWJ1dGVzIGFycmF5KSwgaXQg
c2VlbXMgbGlrZSBpdAo+IHdvdWxkIGJlIHVubmVjZXNzYXJ5IG92ZXJoZWFkLgo+IAo+IERvIHlv
dSBoYXZlIGFueSBpZGVhcyBvciBwcmVmZXJlbmNlcz8KPiAKPiBDaGVlcnMsCj4gL2Z1YWQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
