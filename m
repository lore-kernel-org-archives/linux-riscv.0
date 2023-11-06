Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6A7C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SIN7IYYJYmGJb0SbXpggGGK4rjbs85iYVWbmEAhwQhc=; b=m3qVx/8q+lUxKn
	Cm/Q6RYr3VWspx+rP7CCvrvgMjlYNSgRhNBXIq5UXdB4G78RrBmfHKXO0nL80mQVqemhuh+JE48y6
	JYwMJC7L3udcsKutVxiaE1WSzbLpSUwvRHPRV8QgQ/sjOEJpyyM/vdH9Mq/BBsfeUS41CyhlD5KnO
	DGZ840HQ+4FXy/nfv5G8RSg7PqrpyUtSvUJFKwLqRRjHh+fm+uq90parQU2RnjvF9tPWyYoqagVwk
	hw5K234TTnXNlWWfQULmbig/ZoBAQtylURowNVlx3Q6zP7dxROJWj7DkMnkJa3XW/2rReodKvuKdX
	gMwVJM5ymi0ir/eqFHKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzxO9-00GJT0-2z;
	Mon, 06 Nov 2023 11:03:25 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzxO2-00GJLI-2Y
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 11:03:23 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7788db95652so305098785a.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 03:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699268596; x=1699873396; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KU+b2mECXXvQ5slHB7/YEPM4eq1YPpk0J5Rl/yZ7AP8=;
        b=eOP4upOv6yvJI1oPBOdZqjG0od0kXqYHKjIEKNnbDsdY76hMKg7+woUZXYf0c61MY3
         6EMrLszJ0a32Civ1aY9i0mnywI1LRWqTblrZLQdbY+/znonbxSjHkjoLYd8G09vRys86
         w7265+cUwz5y/jTwt9FaUyXG93Aczl0WJe7Z/oTMjtDM9bwIwLSv6VnQqWzn60b/iBgm
         GppOgikRf9fGalIcdvZtoMk0/oatEgdcY8vWzqIPrBwn9z842y/wfAPEGivsRuLxro78
         Ij/HRc9mWECpFuJMy3d3CL5WpqnUmuxfHAY82aZ7XEQo3zvZVYAdhHCl2UsEP9gjJ3cm
         B4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268596; x=1699873396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KU+b2mECXXvQ5slHB7/YEPM4eq1YPpk0J5Rl/yZ7AP8=;
        b=Pkmqv5q1zFI99EQYQtDoCmATAZwGm2xjrfovtJTa8wa+IOpFSfK8JMqimyOP7l2WkU
         PrlNTpseYCUpehbDWUgnWLzRfNfRYEoNJ2tUyeH/C8PM68mruyTp0MRj236wVaBp6KLc
         vlBKu+EA3QzPjp+iBEPT5f1WrslsNRToU6ygrds/gRCVoiNOaSUtzP/sdYXSyBLWWLTG
         8iEcyV8aEyrQGDMkZ23maWyzb+HL8U+7WMAI67RFtKX5YIGsy+kL6BfDBloIlDD7GUWv
         DJOYUv/gdLmMBf5CYfg+QAjnyiNs9HOkq/FZSJwq6a3SJg4WUEFAUl2m8Nsudj3A9Noy
         YqNA==
X-Gm-Message-State: AOJu0YzRSnFumFKN2EpQ5KQfIDMGlDUw4txRSERdHXKb7OqQHZB8sKkY
	YGZLEmSyci1hvwCuwvYBeDmOiNPmHitUfVvnmDuZlA==
X-Google-Smtp-Source: AGHT+IH064K0ZtIRC0Ddcf2wpRdR9qcn5N+rpiGlH1rS/nMIj84KwquVAyvAa55WjBkBZ58J/DOu2Zh9h49soweI3jk=
X-Received: by 2002:a05:6214:2582:b0:671:3493:61e8 with SMTP id
 fq2-20020a056214258200b00671349361e8mr28685929qvb.26.1699268596310; Mon, 06
 Nov 2023 03:03:16 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-23-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-23-pbonzini@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 11:02:40 +0000
Message-ID: <CA+EHjTwB-jssz7+8ZiLgXdQREp8U3r3tYN2NOH28g54=QNdQmg@mail.gmail.com>
Subject: Re: [PATCH 22/34] KVM: selftests: Drop unused kvm_userspace_memory_region_find()
 helper
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_030318_885561_0AD50E8B 
X-CRM114-Status: GOOD (  14.86  )
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

T24gU3VuLCBOb3YgNSwgMjAyMyBhdCA0OjMz4oCvUE0gUGFvbG8gQm9uemluaSA8cGJvbnppbmlA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNA
Z29vZ2xlLmNvbT4KPgo+IERyb3Aga3ZtX3VzZXJzcGFjZV9tZW1vcnlfcmVnaW9uX2ZpbmQoKSwg
aXQncyB1bnVzZWQgYW5kIGEgdGVycmlibGUgQVBJCj4gKHByb2JhYmx5IHdoeSBpdCdzIHVudXNl
ZCkuICBJZiBhbnl0aGluZyBvdXRzaWRlIG9mIGt2bV91dGlsLmMgbmVlZHMgdG8KPiBnZXQgYXQg
dGhlIG1lbXNsb3QsIHVzZXJzcGFjZV9tZW1fcmVnaW9uX2ZpbmQoKSBjYW4gYmUgZXhwb3NlZCB0
byBnaXZlCj4gb3RoZXJzIGZ1bGwgYWNjZXNzIHRvIGFsbCBtZW1vcnkgcmVnaW9uL3Nsb3QgaW5m
b3JtYXRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNA
Z29vZ2xlLmNvbT4KPiBNZXNzYWdlLUlkOiA8MjAyMzEwMjcxODIyMTcuMzYxNTIxMS0yNS1zZWFu
amNAZ29vZ2xlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBQYW9sbyBCb256aW5pIDxwYm9uemluaUBy
ZWRoYXQuY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IEZ1YWQgVGFiYmEgPHRhYmJhQGdvb2dsZS5j
b20+ClRlc3RlZC1ieTogRnVhZCBUYWJiYSA8dGFiYmFAZ29vZ2xlLmNvbT4KCkNoZWVycywKL2Z1
YWQKCj4gIC4uLi9zZWxmdGVzdHMva3ZtL2luY2x1ZGUva3ZtX3V0aWxfYmFzZS5oICAgICB8ICA0
IC0tLQo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL2t2bV91dGlsLmMgICAgfCAy
OSAtLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzMgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUva3Zt
X3V0aWxfYmFzZS5oIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUva3ZtX3V0
aWxfYmFzZS5oCj4gaW5kZXggYTE4ZGI2YTdiM2NmLi45NjdlYWFlYWNkNzUgMTAwNjQ0Cj4gLS0t
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUva3ZtX3V0aWxfYmFzZS5oCj4g
KysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUva3ZtX3V0aWxfYmFzZS5o
Cj4gQEAgLTc3NiwxMCArNzc2LDYgQEAgdm1fYWRqdXN0X251bV9ndWVzdF9wYWdlcyhlbnVtIHZt
X2d1ZXN0X21vZGUgbW9kZSwgdW5zaWduZWQgaW50IG51bV9ndWVzdF9wYWdlcykKPiAgICAgICAg
IHJldHVybiBuOwo+ICB9Cj4KPiAtc3RydWN0IGt2bV91c2Vyc3BhY2VfbWVtb3J5X3JlZ2lvbiAq
Cj4gLWt2bV91c2Vyc3BhY2VfbWVtb3J5X3JlZ2lvbl9maW5kKHN0cnVjdCBrdm1fdm0gKnZtLCB1
aW50NjRfdCBzdGFydCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50NjRf
dCBlbmQpOwo+IC0KPiAgI2RlZmluZSBzeW5jX2dsb2JhbF90b19ndWVzdCh2bSwgZykgKHsgICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgdHlwZW9mKGcpICpfcCA9IGFkZHJfZ3Zh
Mmh2YSh2bSwgKHZtX3ZhZGRyX3QpJihnKSk7ICAgICBcCj4gICAgICAgICBtZW1jcHkoX3AsICYo
ZyksIHNpemVvZihnKSk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9rdm1fdXRpbC5jIGIvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL2xpYi9rdm1fdXRpbC5jCj4gaW5kZXggN2E4YWYxODIxZjVkLi5m
MDkyOTVkNTZjMjMgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xp
Yi9rdm1fdXRpbC5jCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9rdm1f
dXRpbC5jCj4gQEAgLTU5MCwzNSArNTkwLDYgQEAgdXNlcnNwYWNlX21lbV9yZWdpb25fZmluZChz
dHJ1Y3Qga3ZtX3ZtICp2bSwgdWludDY0X3Qgc3RhcnQsIHVpbnQ2NF90IGVuZCkKPiAgICAgICAg
IHJldHVybiBOVUxMOwo+ICB9Cj4KPiAtLyoKPiAtICogS1ZNIFVzZXJzcGFjZSBNZW1vcnkgUmVn
aW9uIEZpbmQKPiAtICoKPiAtICogSW5wdXQgQXJnczoKPiAtICogICB2bSAtIFZpcnR1YWwgTWFj
aGluZQo+IC0gKiAgIHN0YXJ0IC0gU3RhcnRpbmcgVk0gcGh5c2ljYWwgYWRkcmVzcwo+IC0gKiAg
IGVuZCAtIEVuZGluZyBWTSBwaHlzaWNhbCBhZGRyZXNzLCBpbmNsdXNpdmUuCj4gLSAqCj4gLSAq
IE91dHB1dCBBcmdzOiBOb25lCj4gLSAqCj4gLSAqIFJldHVybjoKPiAtICogICBQb2ludGVyIHRv
IG92ZXJsYXBwaW5nIHJlZ2lvbiwgTlVMTCBpZiBubyBzdWNoIHJlZ2lvbi4KPiAtICoKPiAtICog
UHVibGljIGludGVyZmFjZSB0byB1c2Vyc3BhY2VfbWVtX3JlZ2lvbl9maW5kLiBBbGxvd3MgdGVz
dHMgdG8gbG9vayB1cAo+IC0gKiB0aGUgbWVtc2xvdCBkYXRhc3RydWN0dXJlIGZvciBhIGdpdmVu
IHJhbmdlIG9mIGd1ZXN0IHBoeXNpY2FsIG1lbW9yeS4KPiAtICovCj4gLXN0cnVjdCBrdm1fdXNl
cnNwYWNlX21lbW9yeV9yZWdpb24gKgo+IC1rdm1fdXNlcnNwYWNlX21lbW9yeV9yZWdpb25fZmlu
ZChzdHJ1Y3Qga3ZtX3ZtICp2bSwgdWludDY0X3Qgc3RhcnQsCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdWludDY0X3QgZW5kKQo+IC17Cj4gLSAgICAgICBzdHJ1Y3QgdXNlcnNw
YWNlX21lbV9yZWdpb24gKnJlZ2lvbjsKPiAtCj4gLSAgICAgICByZWdpb24gPSB1c2Vyc3BhY2Vf
bWVtX3JlZ2lvbl9maW5kKHZtLCBzdGFydCwgZW5kKTsKPiAtICAgICAgIGlmICghcmVnaW9uKQo+
IC0gICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiAtCj4gLSAgICAgICByZXR1cm4gJnJlZ2lv
bi0+cmVnaW9uOwo+IC19Cj4gLQo+ICBfX3dlYWsgdm9pZCB2Y3B1X2FyY2hfZnJlZShzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpCj4gIHsKPgo+IC0tCj4gMi4zOS4xCj4KPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
