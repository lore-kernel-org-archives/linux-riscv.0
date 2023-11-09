Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45004C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 08:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JI+7uj5vMHhxxPcpOTrIN5tKpoRm1IbblDCoLHz4kow=; b=D5WxIvS2QKKrIh
	yUZmJ+zUwAo6kE0TecimVQrtSUoAYlROLa1Y8Str6QVeE3953JvncGLM+UzOnACw4hbBZr/cuxYO1
	hPZlQ+FpNyuO5pmg9cjXtOqOR28WnhutFny1sjuULqjsZSec1JtMTlBuXsHHAD2I0YrQX4iDxmLdj
	VR0CFaXI581OBLJh66c+wvlxrGyH3es7eo2SGThIOb5m3TaLjWT+8gtVMdOWv4JFlLmT0pczHxtb6
	gntd6ZQDXtHbNCzs5z3rdCvgeTY+cdgeOansrahZFMwIUpdQvdDtRkPHmC3aAQxIPvk74IvHJR5Dj
	8O9zqPvT8TaYJiMWsMZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10pB-005g3c-0E;
	Thu, 09 Nov 2023 08:55:41 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10p8-005g1m-0J
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 08:55:39 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-7ba75345e71so227821241.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 00:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699520132; x=1700124932; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LW/Fx883nWIRZKyM7HAb/UStNZnvbG60FpXDwf7xK7Y=;
        b=0dyKAxYUC+GxocDxm2t2bNCUeoGSSSRUaoZXN45/KOaal0k974ECF8rP4NEJ6LQCTz
         jQ3eEu9xTdEms8/3ZgJayUfBwTxrNFYL/Xr68bCCQSFeMspweu2S0Yx8FilRDDYFrLel
         5a1n7G080GVNVT2+Ap8QqQlEVGCXqQQQWsXKgaVCviulmKVDj6tVi12pO9rRvRCcflwV
         tTFNBZ2vjbhvQ7pkAvXmeuz8vtqNmv6RCdN9LcpiOidWD2hygF6UIBaoHl1n7+7Ooxv5
         LQzjnbf+zgIeUr8HkcOud6EgaIVCMCT8hKcSEGmyGcmpF9WBSrhxBfZM24VQ5waCEvgY
         U8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520132; x=1700124932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LW/Fx883nWIRZKyM7HAb/UStNZnvbG60FpXDwf7xK7Y=;
        b=fBUmgf1cRDsOPe1FAQq0aIOT9HMJ8p67ueSsFv4lFxlyGLEMImKmUisUIw+IjOONDA
         c6ViVBbfjlJydwnnnzkC4BbZ5XK0qAEpi7QylUKcYEkO4F6EuwcYyTmi6jVU3uY+JKiP
         tng0Rc8/uU6L4WXdIrOkPlaiBT4HNNoDphd9563LJXVAYycJ+JFFhnt+H65Ubq5vNZSw
         K76s2mE+gHmQJZKWwwQdUlH9790uhD7QBdhU8JHQkcaI6spenBN/pEVXM+mqvPsT8EkG
         JuYe0G2Ro84frWi7l9KQQS8HHo9sgSBDB8yw8wmVtz/W0utgsNCYg7peHpl7O/dQ+OEd
         MwNg==
X-Gm-Message-State: AOJu0YyQLOK2y34PqmEMr7sjg7IGp1X9tgBOkq5HsyCmTHy8B02DWX+6
	3ZsBX0Sq8vMFLsTIJP4ZNa0Wzilhwgv/TA1qnBwAOw==
X-Google-Smtp-Source: AGHT+IFw1OMfZ7dogx5GHZ5PY3FJDFYi1Xj9fX4uGT6v90sIMw1YGf7XiATC8vKEmYII9um0nqZKnx8f2F+kXqvVgVE=
X-Received: by 2002:a67:c282:0:b0:45f:65e9:f070 with SMTP id
 k2-20020a67c282000000b0045f65e9f070mr3952209vsj.12.1699520132149; Thu, 09 Nov
 2023 00:55:32 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-35-pbonzini@redhat.com>
 <CAF7b7mpmuYLTY6OQfRRoOryfO-2e1ZumQ6SCQDHHPD5XFyhFTQ@mail.gmail.com>
In-Reply-To: <CAF7b7mpmuYLTY6OQfRRoOryfO-2e1ZumQ6SCQDHHPD5XFyhFTQ@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 9 Nov 2023 08:54:55 +0000
Message-ID: <CA+EHjTxxBUHX9Rg=vZ-UTWHUPKf0ujTsOsynueG7JAMt=GZQ0A@mail.gmail.com>
Subject: Re: [PATCH 34/34] KVM: selftests: Add a memory region subtest to
 validate invalid flags
To: Anish Moorthy <amoorthy@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, David Matlack <dmatlack@google.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_005538_135919_F6E94353 
X-CRM114-Status: GOOD (  11.80  )
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

SGkgQW5pc2gsCgpPbiBUaHUsIE5vdiA5LCAyMDIzIGF0IDE6MDjigK9BTSBBbmlzaCBNb29ydGh5
IDxhbW9vcnRoeUBnb29nbGUuY29tPiB3cm90ZToKPgo+IEFwcGx5aW5nIFsxXSBhbmQgWzJdIHJl
dmVhbHMgdGhhdCB0aGlzIGFsc28gYnJlYWtzIG5vbi14ODYgYnVpbGRzLSB0aGUKPiBNRU1fUkVH
SU9OX0dQQS9TTE9UIGRlZmluaXRpb25zIGFyZSBndWFyZGVkIGJlaGluZCBhbiAjaWZkZWYKPiBf
X3g4Nl82NF9fLCB3aGlsZSB0aGUgdXNhZ2VzIGludHJvZHVjZWQgaGVyZSBhcmVuJ3QuCj4KPiBT
aG91bGQKPgo+IE9uIFN1biwgTm92IDUsIDIwMjMgYXQgODozNeKAr0FNIFBhb2xvIEJvbnppbmkg
PHBib256aW5pQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+ICsgICAgICAgdGVzdF9pbnZhbGlk
X21lbW9yeV9yZWdpb25fZmxhZ3MoKTsKPgo+IGJlICNpZmRlZidkLCBwZXJoYXBzPyBJJ20gbm90
IHF1aXRlIHN1cmUgd2hhdCB0aGUgaW50ZW50IGlzLgo+Cj4gU2lkZSBub3RlOiBJIHdhc24ndCBh
YmxlIHRvIGdldCBbMl0gdG8gYXBwbHkgYnkgY29weS1wYXN0aW5nIHRoZSBkaWZmCj4gYW5kIHRy
eWluZyAiZ2l0IGFwcGx5IiwgYW5kIHRoYXQgd2FzIGFmdGVyIGNoZWNraW5nIG91dCB0aGUgcmVs
ZXZhbnQKPiBjb21taXQuIEV2ZW50dWFsbHkgSSBqdXN0IGRpZCBpdCBtYW51YWxseS4gSWYgYW55
b25lIGNhbiBzdWNjZXNzZnVsbHkKPiBhcHBseSBpdCwgcGxlYXNlIGxldCBtZSBrbm93IHdoYXQg
eW91IGRpZCBzbyBJIGNhbiBzZWUgd2hhdCBJIHdhcwo+IGRvaW5nIHdyb25nIDopCgpGb3IgbWUg
SSBhcHBsaWVkIHRoZSB3aG9sZSBzZXJpZXMgYXMgZm9sbG93czoKCkNoZWNrb3V0IGt2bS14ODYt
bmV4dC0yMDIzLjExLjAxICg0NWI4OTBmNzY4OWUpIGZyb20KaHR0cHM6Ly9naXRodWIuY29tL2t2
bS14ODYvbGludXguZ2l0IC4gVGhlbiB1c2UgYjQ6CmI0IGFtIC1vIC0gIDIwMjMxMTA1MTYzMDQw
LjE0OTA0LTEtcGJvbnppbmlAcmVkaGF0LmNvbSAgfCBnaXQgYW0gLTMKCkNoZWVycywKL2Z1YWQK
Cj4KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcva3ZtLzIwMjMxMTA4MjMzNzIzLjMzODAw
NDItMS1hbW9vcnRoeUBnb29nbGUuY29tLwo+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9r
dm0vYWZmY2E3YTgtMTE2ZS00YjBmLTllZGYtNmNkYzA1YmE2NWNhQHJlZGhhdC5jb20vCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
