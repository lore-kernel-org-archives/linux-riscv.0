Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61390C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 17:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gM/JJi1W+AeoQW/EqqiV/Ku1BxHAY5IBV0epQUFUi/w=; b=nWjdYmZzHJw1SQ
	735/3CWM6lKXB4pzxsM53QCyjpdyrH/Py4hXc1+LtPndCFZ0AYExYdrEmRwwFcFoKbz330Sh/wZtj
	kb7udjTAWFwGHWpA1oEFH/FaEWylG7JD57RXpebWHc8ygu7r6fZcICYhwFEDwWf1Pnkr/c1g5piS5
	TuFCLVdDBs3uGoSUSmM4pueJhIlyc/C1TWWl3rRN5ax/EqujHDVh44cOPnpB6uR/CNCA+JBrDNTvU
	hsDaRU3zFYMBtGZITcWaNzoyiAtYVLUwKM2W5YHeqDKqKsJ5ikBwdZeQM4leojUR9IIEw0jm4F4ca
	WpY35sVORI+pGExffkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMAsV-008K3P-0j;
	Wed, 19 Jul 2023 17:22:19 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMAsR-008JyI-1I
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 17:22:17 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-98e39784a85so225953666b.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 10:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689787326; x=1692379326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muf27eIntjXr3Sa3gdcQLPN4y9AYfVWt2TffDnLSMcw=;
        b=yA9Vox816zD+aJ/FVd+gHS1eUUrpLebV0UPRWoTOQXRhwbDjiEzKfZKLt7ZPO+mtvH
         SaibLGPqQv8DRVnknibkmwFWbPPfcXmr6c+ujgDGBFuCW/F/BitDoK4IVXsvCkVTbM2a
         UUXFrIHyb9EtmF0G0jSo223YyW0H9eb4QyBBeSzBXy3UqItMc2tyGgaUGUFrdupt+8A5
         dLZgmELLzzoUW2SKSL+4MBdgHsq0BaZC4v7p3QuLBtrY+JwzHEa0w4RaSfJgn6bTpTvs
         oKq8cg7sWg40yA0HzTTcfPzlRvV46kkywbP49vwd3eHSPLgVvqkoTlu6Tp2eaYz6GzrZ
         sQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689787326; x=1692379326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muf27eIntjXr3Sa3gdcQLPN4y9AYfVWt2TffDnLSMcw=;
        b=VocyaroHT4v/+HYVFmyV9v6cA72mQ98BFv1HKlBjZ1SB03SgBbZpQ4WtH/ru7Ee1Rk
         U+pHWfkNy6HfALAdJg5uTO4YPsrX/s52WMmJl3FiAfOGw0Ag8PIvVmq8SoIQIevdSDXF
         sNRW57YTZFb1rughIC1mSFRi0pOVxXA8FZ/C2nUMSZzeVxchLJi48tmK7KGjXsiKmVfn
         xv3LRRH7AKkc8/D1DD9oW5b+67oD2CJuH1XSBBcotbJoZs13yfE+lbMeBMg6u9z4PRt/
         uXOY7OZ5xqMe+xnRB6HGEx3rUeSxlSOgwvcBVhe11aN8E9XeFFVVeqa/qDwQfFGi8M2R
         lDRw==
X-Gm-Message-State: ABy/qLZyLCxZRUhgDQx3JEeoZUSdUilZHyGKTmChmVzBdaXTbrrOnQFw
	xJW61Qx4/uPFEMuvbx93uBUfdCn6vfUgM6WPJKHtyA==
X-Google-Smtp-Source: APBJJlHLONYvTW7m5Fbx16RlTb/fOqinzIvyTzihLXJQXLhrTmtvBuSogp90ZclD7PbARqJZdKXYR/WVY9tuMb+Y5tE=
X-Received: by 2002:a17:906:292:b0:97e:17cc:cc95 with SMTP id
 18-20020a170906029200b0097e17cccc95mr3045374ejf.36.1689787326540; Wed, 19 Jul
 2023 10:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 19 Jul 2023 10:21:55 -0700
Message-ID: <CAGtprH9a2jX-hdww9GPuMrO9noNeXkoqE8oejtVn2vD0AZa3zA@mail.gmail.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
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
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_102215_436930_1626FC14 
X-CRM114-Status: GOOD (  12.44  )
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

T24gVHVlLCBKdWwgMTgsIDIwMjMgYXQgNDo0OeKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPiAuLi4KPiArc3RhdGljIGludCBrdm1fZ21lbV9lcnJv
cl9wYWdlKHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLCBzdHJ1Y3QgcGFnZSAqcGFnZSkK
PiArewo+ICsgICAgICAgc3RydWN0IGxpc3RfaGVhZCAqZ21lbV9saXN0ID0gJm1hcHBpbmctPnBy
aXZhdGVfbGlzdDsKPiArICAgICAgIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3Q7Cj4gKyAg
ICAgICBzdHJ1Y3Qga3ZtX2dtZW0gKmdtZW07Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGluZGV4
Owo+ICsgICAgICAgcGdvZmZfdCBzdGFydCwgZW5kOwo+ICsgICAgICAgZ2ZuX3QgZ2ZuOwo+ICsK
PiArICAgICAgIGZpbGVtYXBfaW52YWxpZGF0ZV9sb2NrX3NoYXJlZChtYXBwaW5nKTsKPiArCj4g
KyAgICAgICBzdGFydCA9IHBhZ2UtPmluZGV4Owo+ICsgICAgICAgZW5kID0gc3RhcnQgKyB0aHBf
bnJfcGFnZXMocGFnZSk7Cj4gKwo+ICsgICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeShnbWVtLCBn
bWVtX2xpc3QsIGVudHJ5KSB7Cj4gKyAgICAgICAgICAgICAgIHhhX2Zvcl9lYWNoX3JhbmdlKCZn
bWVtLT5iaW5kaW5ncywgaW5kZXgsIHNsb3QsIHN0YXJ0LCBlbmQgLSAxKSB7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgZm9yIChnZm4gPSBzdGFydDsgZ2ZuIDwgZW5kOyBnZm4rKykgewo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKFdBUk5fT05fT05DRShnZm4gPCBzbG90
LT5iYXNlX2dmbiB8fAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGdmbiA+PSBzbG90LT5iYXNlX2dmbiArIHNsb3QtPm5wYWdlcykpCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKiBGSVhNRTogVGVsbCB1c2Vyc3BhY2UgdGhhdCB0aGUgKnByaXZhdGUqCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKiBtZW1vcnkgZW5jb3VudGVyZWQgYW4gZXJyb3IuCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHNlbmRfc2lnX21jZWVycihCVVNfTUNFRVJSX0FSLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh2b2lkIF9fdXNlciAqKWdmbl90
b19odmFfbWVtc2xvdChzbG90LCBnZm4pLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFBBR0VfU0hJRlQsIGN1cnJlbnQpOwoKRG9lcyBpdCBtYWtlIHNl
bnNlIHRvIHJlcGxpY2F0ZSB3aGF0IGhhcHBlbnMgd2l0aCBNQ0UgaGFuZGxpbmcgb24KdG1wZnMg
YmFja2VkIGd1ZXN0IG1lbW9yeToKMSkgVW5tYXAgZ3BhIGZyb20gZ3Vlc3QKMikgT24gdGhlIG5l
eHQgZ3Vlc3QgRVBUIGZhdWx0LCBleGl0IHRvIHVzZXJzcGFjZSB0byBoYW5kbGUvbG9nIHRoZQpt
Y2UgZXJyb3IgZm9yIHRoZSBncGEuCgpJSVVDLCBzdWNoIE1DRXMgY291bGQgYmUgYXN5bmNocm9u
b3VzIGFuZCAiY3VycmVudCIgbWlnaHQgbm90IGFsd2F5cwpiZSB0aGUgaW50ZW5kZWQgcmVjaXBp
ZW50IG9mIHRoaXMgc2lnbmFsLgoKPiArICAgICAgICAgICAgICAgICAgICAgICB9Cj4gKyAgICAg
ICAgICAgICAgIH0KPiArICAgICAgIH0KPiArCj4gKyAgICAgICBmaWxlbWFwX2ludmFsaWRhdGVf
dW5sb2NrX3NoYXJlZChtYXBwaW5nKTsKPiArCj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
