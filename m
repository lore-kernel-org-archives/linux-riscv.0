Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403D0C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4fxryph1F6wdm4QRz13AGEUHhc5Z4s7PP3glZDZu1DA=; b=vhJxYuccSyHB0A
	QmJOylNIlieY7lSlgR0zI5b/JYzM6hCXfkReiRojcZPFUMssvf8am1MXlIAxHKRdhcG//YFc+JcCB
	8K7aBhrmk+N0ggCqUVhpmEXOVSraTkhKkF1j+79DNJxZ5ki08D9utOtQrngXx6AeIO1gXB/oC8bz/
	1KOwaH6qXe+D/YcyndYO3FFFW84vkKB5vQ5qwm70wMwttIOpYv+fZp7UmVHJbv6f9wA0ckGiTsZcs
	7WkSuJ14NImdQwBnBkSkWW2vs4fL808AIHslm1RXrboM1xyeqfU3FgRGF3ZB2KQriZp9WaSDi6XOD
	hxxjwJeL+dTpbKCuI8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzy2p-00GSkW-1C;
	Mon, 06 Nov 2023 11:45:27 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzy2m-00GSgr-1M
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 11:45:25 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-66d0f945893so36014196d6.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 03:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699271123; x=1699875923; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3+w7KiTzzQhCpJeg/0ek2R61CW1ssLM/7mTLxlOjqg=;
        b=u14T7TtdaHZa6/jG+ynHS5ZgHVUsV4e9TOTWSax6Qx+wqm5LREFIYqRPXPoVUulZb5
         NzveSiq36ybSrZpeL9N3SzqaoyrK4Mq7Nq8Gogl1la9btzryr3Ik6elI8WQg8zO7nMUo
         2VpfYKnIsyfDLr5Loy6yMsFznWXrC4kLh5nhtNTbeyqbWGKhQqNKB70I1qh7GjDVVjpc
         V4620EfvN0UvGn43/N6odXNCtzErUXlO56MpTPXiA7CGGkLJNRwFG7P3dUZ+/DaYnZt+
         LLj2cgYxKQmxC+RnzASI8zD0lpzvqxxpZ4dNmerDZdXwg364bKH02u1dvzoZTbgMJL74
         y35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699271123; x=1699875923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3+w7KiTzzQhCpJeg/0ek2R61CW1ssLM/7mTLxlOjqg=;
        b=EgkYSU8da1gR8uK3B43M4nK6sQ++MdGfnHdEAhwF4OFBuvOz8C6a1SYru6d5NF6o4v
         3yXKTQ+D/WuM9HCIt28tmz1sE5Bb/Cn2ZpITTYvFHze1r5tZR4GKjWAykHkt8fuHJMdU
         /ZvVbMlkgEHoDldgr3itEd79N9fGz/ApdNGcE3S/UApdqELLh95JDLn7il0T2ciZ+7t0
         igFihuxKlv5MiUY3zMkN+dMbDDXX63CEpxrAfUYZoyYb8NEHnd51UCfQ7QyJAIThTbHz
         yI2n+yRfsjYjspjNWY2pGCt7WgdQE5oTKOswkcTsCAM9X9wdJA2PN35KALvAtGQwsv80
         hz4A==
X-Gm-Message-State: AOJu0YwacwG5b43zw8Bze+yqIW47YFk2nAN60ZnNxjpkRsMc1zfu16+8
	/F/DqFIdJExib6BhpRv/YWTbMmPK/E+L+yIpNT1gSw==
X-Google-Smtp-Source: AGHT+IEl8/TeQ8yyhv97l+6UdWpd06zPBShx21QRSHFWAyL7jvCOyQqirpZN3XS/gBNGYYwpqQ32Yp/yP3xLHN3ZnjE=
X-Received: by 2002:a05:6214:252f:b0:66d:13c2:1c31 with SMTP id
 gg15-20020a056214252f00b0066d13c21c31mr13196146qvb.24.1699271123298; Mon, 06
 Nov 2023 03:45:23 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-29-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-29-pbonzini@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 11:44:47 +0000
Message-ID: <CA+EHjTyxH9JNL67Kz0y90CjrP_HMhmePav7qukJvMOcJrk81pg@mail.gmail.com>
Subject: Re: [PATCH 28/34] KVM: selftests: Add GUEST_SYNC[1-6] macros for
 synchronizing more data
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
X-CRM114-CacheID: sfid-20231106_034524_482713_9377E3A6 
X-CRM114-Status: GOOD (  12.59  )
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

T24gU3VuLCBOb3YgNSwgMjAyMyBhdCA0OjM04oCvUE0gUGFvbG8gQm9uemluaSA8cGJvbnppbmlA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNA
Z29vZ2xlLmNvbT4KPgo+IEFkZCBHVUVTVF9TWU5DWzEtNl0oKSBzbyB0aGF0IHRlc3RzIGNhbiBw
YXNzIHRoZSBtYXhpbXVtIGFtb3VudCBvZgo+IGluZm9ybWF0aW9uIHN1cHBvcnRlZCB2aWEgdWNh
bGwoKSwgd2l0aG91dCBuZWVkaW5nIHRvIHJlc29ydCB0byBzaGFyZWQKPiBtZW1vcnkuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KPiBN
ZXNzYWdlLUlkOiA8MjAyMzEwMjcxODIyMTcuMzYxNTIxMS0zMS1zZWFuamNAZ29vZ2xlLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgo+IC0t
LQoKUmV2aWV3ZWQtYnk6IEZ1YWQgVGFiYmEgPHRhYmJhQGdvb2dsZS5jb20+ClRlc3RlZC1ieTog
RnVhZCBUYWJiYSA8dGFiYmFAZ29vZ2xlLmNvbT4KCkNoZWVycywKL2Z1YWQKCj4gIHRvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3VjYWxsX2NvbW1vbi5oIHwgMTEgKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS91Y2FsbF9jb21tb24uaCBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3VjYWxsX2NvbW1vbi5oCj4gaW5kZXggY2Uz
M2QzMDZjMmNiLi4wZmI0NzJhNWEwNTggMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL2luY2x1ZGUvdWNhbGxfY29tbW9uLmgKPiArKysgYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0vaW5jbHVkZS91Y2FsbF9jb21tb24uaAo+IEBAIC01Miw2ICs1MiwxNyBAQCBp
bnQgdWNhbGxfbnJfcGFnZXNfcmVxdWlyZWQodWludDY0X3QgcGFnZV9zaXplKTsKPiAgI2RlZmlu
ZSBHVUVTVF9TWU5DX0FSR1Moc3RhZ2UsIGFyZzEsIGFyZzIsIGFyZzMsIGFyZzQpIFwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVjYWxsKFVDQUxMX1NZTkMsIDYsICJoZWxsbyIs
IHN0YWdlLCBhcmcxLCBhcmcyLCBhcmczLCBhcmc0KQo+ICAjZGVmaW5lIEdVRVNUX1NZTkMoc3Rh
Z2UpICAgICAgdWNhbGwoVUNBTExfU1lOQywgMiwgImhlbGxvIiwgc3RhZ2UpCj4gKyNkZWZpbmUg
R1VFU1RfU1lOQzEoYXJnMCkgICAgICB1Y2FsbChVQ0FMTF9TWU5DLCAxLCBhcmcwKQo+ICsjZGVm
aW5lIEdVRVNUX1NZTkMyKGFyZzAsIGFyZzEpICAgICAgICB1Y2FsbChVQ0FMTF9TWU5DLCAyLCBh
cmcwLCBhcmcxKQo+ICsjZGVmaW5lIEdVRVNUX1NZTkMzKGFyZzAsIGFyZzEsIGFyZzIpIFwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVjYWxsKFVDQUxMX1NZTkMsIDMsIGFyZzAs
IGFyZzEsIGFyZzIpCj4gKyNkZWZpbmUgR1VFU1RfU1lOQzQoYXJnMCwgYXJnMSwgYXJnMiwgYXJn
MykgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWNhbGwoVUNBTExfU1lOQywg
NCwgYXJnMCwgYXJnMSwgYXJnMiwgYXJnMykKPiArI2RlZmluZSBHVUVTVF9TWU5DNShhcmcwLCBh
cmcxLCBhcmcyLCBhcmczLCBhcmc0KSBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1Y2FsbChVQ0FMTF9TWU5DLCA1LCBhcmcwLCBhcmcxLCBhcmcyLCBhcmczLCBhcmc0KQo+ICsj
ZGVmaW5lIEdVRVNUX1NZTkM2KGFyZzAsIGFyZzEsIGFyZzIsIGFyZzMsIGFyZzQsIGFyZzUpIFwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVjYWxsKFVDQUxMX1NZTkMsIDYsIGFy
ZzAsIGFyZzEsIGFyZzIsIGFyZzMsIGFyZzQsIGFyZzUpCj4gKwo+ICAjZGVmaW5lIEdVRVNUX1BS
SU5URihfZm10LCBfYXJncy4uLikgdWNhbGxfZm10KFVDQUxMX1BSSU5URiwgX2ZtdCwgIyNfYXJn
cykKPiAgI2RlZmluZSBHVUVTVF9ET05FKCkgICAgICAgICAgIHVjYWxsKFVDQUxMX0RPTkUsIDAp
Cj4KPiAtLQo+IDIuMzkuMQo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
