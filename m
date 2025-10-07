Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDB7CCA470
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Oct 2025 16:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hEb2zPJYOl2CgCYdXy+2dRJOOfz3ez/OQ+6j6BI96i8=; b=vOOft54zSHEjZmei0NswxzpZIZ
	5majl2n//lsHYBhuvkEfwb698ONHtkwnzvYbjbqYvikKM4lefCfF0uDxUvTil+2is0Pl5l8NYtbBh
	KruvlixzG+j3+nBSldrnjQYBGseLM844c1wmICnN4v+hk7/Y4FgclVKRnSOPT5hY/h2478zvYlKaO
	Gh4s4vd5YjLyTcYhjfFtPAlqjf9d13qQ5DOCjO0AXrpdz0tDdH5W3GQol7FQFCcd4kNV2lwpEIn3T
	XKktQZXkQr/96VJ+CW7nW2/1g1EkhlOOAScxnbJDynL48ZCs/kUlKD1D6fYlpI3Cao9X8JdIDzgo9
	VelDq1Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6AkH-00000002QTN-17r3;
	Tue, 07 Oct 2025 16:41:01 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6AkF-00000002QSe-0pS9
	for linux-riscv@lists.infradead.org;
	Tue, 07 Oct 2025 16:41:00 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b60968d52a1so11017888a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Oct 2025 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759855257; x=1760460057; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoBAQi7/iDgrxmceyXloAA7pXpj9vi7ah0opPUSIfJI=;
        b=IdxkaLQ6Gt/rhV32YggCV9ZWg6ccnoXvWqP/5Br+0B4bTt09yfTSrmm033VkpPpOTu
         z2ZJgYWMf772Ou69kaU10K1BTQNRyb+4rajqqKWTGpOT+NofkPkkINd8g99BU9zd18nE
         ioKVt+5/N00k5kqCzwFy5KEg57lXuIyhz9OazWwNPYE5dNzhg9jS7OlTgjZ0qCmJcR3X
         W84JxtAyUAwPpdgunqrtfzEBz3ogTO5r6RP9XFRpJG7u/czfUceH4hVuaepKtxaTvtqu
         Mmnj2A0h4HBsFLl6Psq++D2CrpDpkefLPy4grQdPl82FVSHqtvoADs6Wuie4E1wMdNw4
         lEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759855257; x=1760460057;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YoBAQi7/iDgrxmceyXloAA7pXpj9vi7ah0opPUSIfJI=;
        b=UXZvxh36k4ytwGrj7sU9greYr1zYW2M1bXbAn073MLlqzYnBNcGC9EZlYS8xr2jV4B
         WKTdic4oxT3QUKQBeMKwZQ7KqvNvLivUdOHZebMInJLZhYtc1pQGf9gSRJWBHnJBGtaI
         fxHKII2HmfPZ/wWc+VlJ5RjUM9aUBAl1bKnsr3ZUfg9SWqGPRB69aFqAM2ZIbwvHa+CS
         VomskD6VhTbnNWGe7eKEUKr8KBHgLOk9+rMAxCbNzC1yqic5Cm6anMoQ5k6YYPYjR4K6
         Tkxrs+A1UaTadhRA2A5dQZuAs34aLe5jeMol9Q19DrB9h4eE68u4biu4ppfjLcVWhZTC
         NKQg==
X-Forwarded-Encrypted: i=1; AJvYcCXNshJw3V6s3xrm20kpjcyfhHmac2VUAty4jqa2Soju2/Ro0TU5sVABb6uUhr5QLKiOM2LW4hHn42wPFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYRjf5cj0DChx3BPm5z3GxsRELipZZQeoqVhEQlYOWs9L1qkme
	sm3UqKMqHwFq2Hv4XK/C52S7xUZD8jnhv/qT1ehtPwo+j2n9uSUSvAJkXZtypiZry86nbdf3jsL
	830WkQg==
X-Google-Smtp-Source: AGHT+IHArrUZ80t/eXJZKroHHqkbiALvVHQS5BBBYEYiCZs7tGJ4Cghzk8R/zMpAhn4GHHOEFd8u4hse3Ng=
X-Received: from pjbos15.prod.google.com ([2002:a17:90b:1ccf:b0:32e:b34b:92e8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:350e:b0:329:ca48:7090
 with SMTP id 98e67ed59e1d1-33b513ebc36mr139267a91.37.1759855257571; Tue, 07
 Oct 2025 09:40:57 -0700 (PDT)
Date: Tue, 7 Oct 2025 09:40:56 -0700
In-Reply-To: <CALzav=c0Wgcc60_dGJuYffS3f3vD9mpdSjFguaE00L1Zr-YcbA@mail.gmail.com>
Mime-Version: 1.0
References: <20250724213130.3374922-1-dmatlack@google.com> <CALzav=c0Wgcc60_dGJuYffS3f3vD9mpdSjFguaE00L1Zr-YcbA@mail.gmail.com>
Message-ID: <aOVCmIu0Dv7vJ0M5@google.com>
Subject: Re: [PATCH v2 0/2] KVM: selftests: Use $(SRCARCH) and share
 definition with top-level Makefile
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_094059_235583_D4A418BC 
X-CRM114-Status: GOOD (  18.25  )
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

T24gTW9uLCBTZXAgMTUsIDIwMjUsIERhdmlkIE1hdGxhY2sgd3JvdGU6Cj4gT24gVGh1LCBKdWwg
MjQsIDIwMjUgYXQgMjozMeKAr1BNIERhdmlkIE1hdGxhY2sgPGRtYXRsYWNrQGdvb2dsZS5jb20+
IHdyb3RlOgo+ID4KPiA+IFRoaXMgc2VyaWVzIHN3aXRjaGVzIHRoZSBLVk0gc2VsZnRlc3RzIE1h
a2VmaWxlIHRvIHVzZSAkKFNSQ0FSQ0gpCj4gPiBpbnN0ZWFkIG9mICQoQVJDSCkgdG8gZml4IGEg
YnVpbGQgaXNzdWUgd2hlbiBBUkNIPXg4Nl82NCBpcyBzcGVjaWZpZWQgb24KPiA+IHRoZSBjb21t
YW5kIGxpbmUuCj4gPgo+ID4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS8yMDI1MDQz
MDIyNDcyMC4xODgyMTQ1LTEtZG1hdGxhY2tAZ29vZ2xlLmNvbS8KPiA+ICAtIFNwbGl0IG91dCB0
aGUgcmV2ZXJ0IG9mIGNvbW1pdCA5YWYwNDUzOWQ0NzQgKCJLVk06IHNlbGZ0ZXN0czoKPiA+ICAg
IE92ZXJyaWRlIEFSQ0ggZm9yIHg4Nl82NCBpbnN0ZWFkIG9mIHVzaW5nIEFSQ0hfRElSIikgZnJv
bSB0aGUgcmVuYW1lCj4gPiAgICB0byBTUkNBUkNICj4gPgo+ID4gRGF2aWQgTWF0bGFjayAoMik6
Cj4gPiAgIFJldmVydCAiS1ZNOiBzZWxmdGVzdHM6IE92ZXJyaWRlIEFSQ0ggZm9yIHg4Nl82NCBp
bnN0ZWFkIG9mIHVzaW5nCj4gPiAgICAgQVJDSF9ESVIiCj4gPiAgIEtWTTogc2VsZnRlc3RzOiBS
ZW5hbWUgJChBUkNIX0RJUikgdG8gJChTUkNBUkNIKQo+IAo+IEdlbnRsZSBwaW5nLiBQYW9sbyBh
bmQgU2VhbiBkbyB5b3UgdGhpbmsgdGhpcyBjb3VsZCBnZXQgbWVyZ2VkCj4gdXBzdHJlYW0gYXQg
c29tZSBwb2ludD8KPiAKPiBHb29nbGUncyBrZXJuZWwgYnVpbGQgdG9vbHMgdW5jb25kaXRpb25h
bGx5IHNldCBBUkNIPXg4Nl82NCB3aGVuCj4gYnVpbGRpbmcgc2VsZnRlc3RzLCB3aGljaCBjYXVz
ZXMgdGhlIEtWTSBzZWxmdGVzdHMgdG8gZmFpbCB0byBidWlsZC4KCkknbSBwcmV0dHkgc3VyZSB3
ZSBjYW4gc2ltcGx5IG92ZXJyaWRlIHRoZSB1c2VyLiAgRG9lcyB0aGlzIGZpeCB0aGluZ3Mgb24g
eW91cgplbmQ/CgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL01ha2Vm
aWxlIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL01ha2VmaWxlCmluZGV4IGQ5ZmZmZTA2
ZDNlYS4uZjJiMjIzMDcyYjYyIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
dm0vTWFrZWZpbGUKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL01ha2VmaWxlCkBA
IC02LDcgKzYsNyBAQCBBUkNIICAgICAgICAgICAgPz0gJChTVUJBUkNIKQogaWZlcSAoJChBUkNI
KSwkKGZpbHRlciAkKEFSQ0gpLGFybTY0IHMzOTAgcmlzY3YgeDg2IHg4Nl82NCBsb29uZ2FyY2gp
KQogIyBUb3AtbGV2ZWwgc2VsZnRlc3RzIGFsbG93cyBBUkNIPXg4Nl82NCA6LSgKIGlmZXEgKCQo
QVJDSCkseDg2XzY0KQotICAgICAgIEFSQ0ggOj0geDg2CisgICAgICAgb3ZlcnJpZGUgQVJDSCA6
PSB4ODYKIGVuZGlmCiBpbmNsdWRlIE1ha2VmaWxlLmt2bQogZWxzZQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
