Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EA8C001DE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 17:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=meP7ojMNYD/wjRgbpefQO2QNv9ULnSvPLu0+zyhIMsA=; b=KJz9ADtwH0R3osJUhQOqo3ZCbr
	QdD5xPPeJMTtzti7dlKabSPqpEGvXHNuKVFP9ovAYhHq57FjIORzcOJFr800Nup+QyrfCBBFXQVCV
	wcOJxzLeJFjYv4TN3qCzTvk6B/avhYmjm/ELT/c5LJuVbgjb6Vfi/LEE30piePmB4y1NQFbaplkQj
	6TPuknZ0sQNZU8RivebvJVFiX247A2ET0v0kXTE8OofGP+W9HUwTab2k8196HumM4QfxtrRz7YI/u
	SJXW48XaVupJKpyFS5N+gvaCfqSW5lTt3vNUIxykO6FA0e0k48ER4GZ/hl/+Gm3aLKnth12Ry2h9/
	qJZklTcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMBHE-008P3S-2t;
	Wed, 19 Jul 2023 17:47:52 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMBHA-008OxI-29
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 17:47:50 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-ca8e5f39e09so1760322276.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 10:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689788864; x=1692380864;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZrpSlfvy8CWa29HQgq0qreuIOXt/Wldn9lf0s+IQ19g=;
        b=ArpFLxX4pd+nE6yhxk4kfQsyY2cBj0283wyB2UFD4pQNpbkrc+ZAbqxw+z+OgClanI
         8Bmj2Z7j2c1NhNgCvBdv83cjgOHHCOOMDHYftHtZeAL3vo412/Xbeep/S+CdApdBGNVE
         aduoGH7mk12lxFjmYh58eVW/1Ksc0OT9NLaSC1w5eMBSYs+0sTNoL7N0w3aZ0n2P+aH0
         VnFxLOrHPJ9r2ezOXOfj0cBYblwBN0Ye2w9Cgtba6HWxXo2yyLAo7PNbRfr5GAzKlZhF
         ic8thdmStV5nJQreXCY0jlMVC8WTwDKkeNH3l7/QHaf5X+Z1Dsac59JBXIEJlOoDRy4l
         I3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689788864; x=1692380864;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZrpSlfvy8CWa29HQgq0qreuIOXt/Wldn9lf0s+IQ19g=;
        b=HvTzcoglGo8bjf4c7P5T8LkP7rariXchJ+kBH6tLY7Hg6FQG1AgGnkk11i2KvQl8AL
         kyvPRJT5OlCA2PeGn+GIQ+BspurK3MotwVVcjk85lyGDBxroro7M4TGxNlBHLi3MKDxI
         r+RmtsspTxbkO9eeijNDeYY0vz1u7ZEo2wfTAzmsRFA4GuLYNQABX/2N9ZakVz8LDxJ6
         gG+xyOds9tHMgrob0IimN2nWmbCvN9Mf6aPfbDdPtx6hom0JXb6vAPObYRSRnR0J2A/l
         6xRQuItMuvo9oB1/q8vetQa+yB4BllxFwMO2Na3/ozJgBm4EGvZvDx/uAoDz3rsb0WUz
         BLQw==
X-Gm-Message-State: ABy/qLZKXzXOdm/QQEM4tVVg4lnB8OevuRGfXmPPibp3jQ7xGI+dJ/3T
	BdzjVnzUqwUVcpofCCKkdk/9lVvRF2c=
X-Google-Smtp-Source: APBJJlFlYUVvIIObTojpJ8UchQ4CwQtQGAVrCh++KpJ7LgJpdZRIA9xQwbGLQUVWTMKWnIrBZUJv99cvfhs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:f509:0:b0:ca3:3341:6315 with SMTP id
 a9-20020a25f509000000b00ca333416315mr42238ybe.0.1689788863726; Wed, 19 Jul
 2023 10:47:43 -0700 (PDT)
Date: Wed, 19 Jul 2023 10:47:41 -0700
In-Reply-To: <CAGtprH9a2jX-hdww9GPuMrO9noNeXkoqE8oejtVn2vD0AZa3zA@mail.gmail.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <CAGtprH9a2jX-hdww9GPuMrO9noNeXkoqE8oejtVn2vD0AZa3zA@mail.gmail.com>
Message-ID: <ZLghvU4QzE0PtfNG@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Vishal Annapurve <vannapurve@google.com>
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
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_104748_727508_AFD1A8F9 
X-CRM114-Status: GOOD (  16.68  )
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

T24gV2VkLCBKdWwgMTksIDIwMjMsIFZpc2hhbCBBbm5hcHVydmUgd3JvdGU6Cj4gT24gVHVlLCBK
dWwgMTgsIDIwMjMgYXQgNDo0OeKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29n
bGUuY29tPiB3cm90ZToKPiA+IC4uLgo+ID4gK3N0YXRpYyBpbnQga3ZtX2dtZW1fZXJyb3JfcGFn
ZShzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywgc3RydWN0IHBhZ2UgKnBhZ2UpCj4gPiAr
ewo+ID4gKyAgICAgICBzdHJ1Y3QgbGlzdF9oZWFkICpnbWVtX2xpc3QgPSAmbWFwcGluZy0+cHJp
dmF0ZV9saXN0Owo+ID4gKyAgICAgICBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90Owo+ID4g
KyAgICAgICBzdHJ1Y3Qga3ZtX2dtZW0gKmdtZW07Cj4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcg
aW5kZXg7Cj4gPiArICAgICAgIHBnb2ZmX3Qgc3RhcnQsIGVuZDsKPiA+ICsgICAgICAgZ2ZuX3Qg
Z2ZuOwo+ID4gKwo+ID4gKyAgICAgICBmaWxlbWFwX2ludmFsaWRhdGVfbG9ja19zaGFyZWQobWFw
cGluZyk7Cj4gPiArCj4gPiArICAgICAgIHN0YXJ0ID0gcGFnZS0+aW5kZXg7Cj4gPiArICAgICAg
IGVuZCA9IHN0YXJ0ICsgdGhwX25yX3BhZ2VzKHBhZ2UpOwo+ID4gKwo+ID4gKyAgICAgICBsaXN0
X2Zvcl9lYWNoX2VudHJ5KGdtZW0sIGdtZW1fbGlzdCwgZW50cnkpIHsKPiA+ICsgICAgICAgICAg
ICAgICB4YV9mb3JfZWFjaF9yYW5nZSgmZ21lbS0+YmluZGluZ3MsIGluZGV4LCBzbG90LCBzdGFy
dCwgZW5kIC0gMSkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZm9yIChnZm4gPSBzdGFy
dDsgZ2ZuIDwgZW5kOyBnZm4rKykgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpZiAoV0FSTl9PTl9PTkNFKGdmbiA8IHNsb3QtPmJhc2VfZ2ZuIHx8Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZm4gPj0gc2xvdC0+YmFzZV9n
Zm4gKyBzbG90LT5ucGFnZXMpKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnRpbnVlOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAvKgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBGSVhNRTogVGVsbCB1
c2Vyc3BhY2UgdGhhdCB0aGUgKnByaXZhdGUqCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAqIG1lbW9yeSBlbmNvdW50ZXJlZCBhbiBlcnJvci4KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICovCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHNlbmRfc2lnX21jZWVycihCVVNfTUNFRVJSX0FSLAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZvaWQgX191c2VyICopZ2ZuX3RvX2h2YV9tZW1z
bG90KHNsb3QsIGdmbiksCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBQQUdFX1NISUZULCBjdXJyZW50KTsKPiAKPiBEb2VzIGl0IG1ha2Ugc2Vuc2Ug
dG8gcmVwbGljYXRlIHdoYXQgaGFwcGVucyB3aXRoIE1DRSBoYW5kbGluZyBvbgo+IHRtcGZzIGJh
Y2tlZCBndWVzdCBtZW1vcnk6Cj4gMSkgVW5tYXAgZ3BhIGZyb20gZ3Vlc3QKPiAyKSBPbiB0aGUg
bmV4dCBndWVzdCBFUFQgZmF1bHQsIGV4aXQgdG8gdXNlcnNwYWNlIHRvIGhhbmRsZS9sb2cgdGhl
Cj4gbWNlIGVycm9yIGZvciB0aGUgZ3BhLgoKSG1tLCB5ZXMsIHRoYXQgd291bGQgYmUgbXVjaCBi
ZXR0ZXIuICBBaCwgYW5kIGt2bV9nbWVtX2dldF9wZm4oKSBuZWVkcyB0byBjaGVjawpmb2xpb190
ZXN0X2h3cG9pc29uKCkgYW5kIHBvdGVudGlhbGx5IFBhZ2VIV1BvaXNvbigpLiAgRS5nLiBpZiB0
aGUgZm9saW8gaXMgaHVnZSwKS1ZNIG5lZWRzIHRvIHJlc3RyaWN0IHRoZSBtYXBwaW5nIHRvIG9y
ZGVyLTAgKHRhcmdldCBwYWdlIGlzbid0IHBvaXNvbmVkKSwgb3IKcmV0dXJuIEtWTV9QRk5fRVJS
X0hXUE9JU09OICh0YWdldCBwYWdlIElTIHBvaXNvbmVkKS4KCkFsdGVybmF0aXZlbHksIEtWTSBj
b3VsZCBwdW5jaCBhIGhvbGUgaW4ga3ZtX2dtZW1fZXJyb3JfcGFnZSgpLCBidXQgSSBkb24ndCB0
aGluawp3ZSB3YW50IHRvIGRvIHRoYXQgYmVjYXVzZSB0aGF0IHdvdWxkIHByZXZlbnQgZm9yd2Fy
ZGluZyB0aGUgI01DIHRvIHRoZSBndWVzdC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
