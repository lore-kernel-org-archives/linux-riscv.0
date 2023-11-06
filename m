Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F098C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 16:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7lUCNOtonbP/ICUph5uhWmMJXvN4AJHaDTfQcqZH8sg=; b=RGtchK03Y7xlSN0ZaKQ/j7qsxc
	rwaw0iW2Yd5b8s5irm506v8beLOvF5f1ixd5iwLv7iX3svAD/NRt4qRthFeJ+ye3EXjSIV7n+pv55
	NW32J/9PVudMewndQ2l4iXWXIC5ZcOBM4CQNbANVKlH8B340ZAyyhJDW0UK6QdQ804cdHIlj8qpZT
	r5Uz3oInYMwsluMgqjGn34vtqHwQX787dFfumjM6Cror+WAjG5lLJ0CdlLjqiUwb94PFsGNOTtHBL
	GGRco9Vd28ZdiICy/940O61cYlr3oA45dYyQZVlLMgKvBH6N+CzQbyNL4CLCEQacOOp84A8qhfnMb
	r7JsPiMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r02Dr-00H56n-1d;
	Mon, 06 Nov 2023 16:13:07 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r02Do-00H54Y-2V
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 16:13:06 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a828bdcfbaso63790777b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 08:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699287183; x=1699891983; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mmoUoGnC/t23H3IPxV2qsT2AAyd7sUSE5gGiJgJlDX0=;
        b=T7SSdw8t/0F0Y05zz3uHGQQ+U7sffwSikxNfFNiQOgbx25yz/uV3eNi7YxhUiXSqec
         ff3odUNEWHWP61g3kYDxZF2I68F7nKx/3dhqzMckk9PmCtBmfxx1wTyDBAdZCDyBDysd
         n/NcBPSxZAq0Mr7rSxiTZOcdj5V86WDB9m94C24yikgXCzzLV/ImrGLHs5NLwvVZDB6P
         Jk6k4vxkgJZ/0SuRPk8gC9QOCxfcuQ2yrFiGlNwh4JctYatXdiY1WtGmvuOx4EoNmoyn
         xoxCgPe0IkkpiMfSW111V9Nk7c2LvswKxaPnjLZ7I0fxi0BVokLAOE7EvPDn6uImTJmz
         tJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699287183; x=1699891983;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mmoUoGnC/t23H3IPxV2qsT2AAyd7sUSE5gGiJgJlDX0=;
        b=f8qkBwVbxC+xnJTnhWxYxx4Edooylcvk8c9terYsNThr8V0JBZpy8Yf7fm/XUTfMtM
         OUYM9imLt3cj97bPWjfBrWXCUbw0aW2k5JwnSWC7mDt6EFnneYYpTUvKtHwaA9GkmoOw
         52hJsluOiSVmAzSYEWpTbxnxgIqxmg5cLrzX01WtE+XB7SNjUAa9bjeRwRb/Qm79XrO3
         gS1ewNlrj/OZgU5/TS8H20z8DpBw0JlliJfugPdsiClZ0PqXqLmnWntI2zb+qYuJDkI1
         JZbE+3I+070p149/4hijhD6sxyiRdy+KpB3K2MR/tlVdFoA+gHHNEsfc/26wGUXj/ZuA
         X28A==
X-Gm-Message-State: AOJu0YzwYZHOzYyx4qaDJ0qppwCoK+FkYqML3HO2BoDtyuxH0B0PEQxq
	ZEoQeRemyBG20sBc7cIe4DIWeVV/EQk=
X-Google-Smtp-Source: AGHT+IEuz2kxbbqGFRlRrYjmJAAmCd5YL62xYCCumvx9nTcHzja2SicRUTSCOZ5GtJw0RknzXE1Az5YHDFw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:d5d2:0:b0:5a7:ad67:b4b6 with SMTP id
 x201-20020a0dd5d2000000b005a7ad67b4b6mr228755ywd.2.1699287183068; Mon, 06 Nov
 2023 08:13:03 -0800 (PST)
Date: Mon, 6 Nov 2023 08:13:01 -0800
In-Reply-To: <CA+EHjTxy6TWM3oBG0Q6v5090XTrs+M8_m5=6Z2E1P-HyTkrGWg@mail.gmail.com>
Mime-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-26-pbonzini@redhat.com>
 <CA+EHjTxy6TWM3oBG0Q6v5090XTrs+M8_m5=6Z2E1P-HyTkrGWg@mail.gmail.com>
Message-ID: <ZUkQjW-yMnLfD7XW@google.com>
Subject: Re: [PATCH 25/34] KVM: selftests: Add helpers to convert guest memory
 b/w private and shared
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
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
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_081304_812317_774023AC 
X-CRM114-Status: GOOD (  11.08  )
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

T24gTW9uLCBOb3YgMDYsIDIwMjMsIEZ1YWQgVGFiYmEgd3JvdGU6Cj4gT24gU3VuLCBOb3YgNSwg
MjAyMyBhdCA0OjM04oCvUE0gUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4gd3Jv
dGU6Cj4gPiArdm9pZCB2bV9ndWVzdF9tZW1fZmFsbG9jYXRlKHN0cnVjdCBrdm1fdm0gKnZtLCB1
aW50NjRfdCBiYXNlLCB1aW50NjRfdCBzaXplLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGJvb2wgcHVuY2hfaG9sZSkKPiA+ICt7Cj4gPiArICAgICAgIGNvbnN0IGludCBtb2RlID0g
RkFMTE9DX0ZMX0tFRVBfU0laRSB8IChwdW5jaF9ob2xlID8gRkFMTE9DX0ZMX1BVTkNIX0hPTEUg
OiAwKTsKPiA+ICsgICAgICAgc3RydWN0IHVzZXJzcGFjZV9tZW1fcmVnaW9uICpyZWdpb247Cj4g
PiArICAgICAgIHVpbnQ2NF90IGVuZCA9IGJhc2UgKyBzaXplOwo+ID4gKyAgICAgICB1aW50NjRf
dCBncGEsIGxlbjsKPiA+ICsgICAgICAgb2ZmX3QgZmRfb2Zmc2V0Owo+ID4gKyAgICAgICBpbnQg
cmV0Owo+ID4gKwo+ID4gKyAgICAgICBmb3IgKGdwYSA9IGJhc2U7IGdwYSA8IGVuZDsgZ3BhICs9
IGxlbikgewo+ID4gKyAgICAgICAgICAgICAgIHVpbnQ2NF90IG9mZnNldDsKPiA+ICsKPiA+ICsg
ICAgICAgICAgICAgICByZWdpb24gPSB1c2Vyc3BhY2VfbWVtX3JlZ2lvbl9maW5kKHZtLCBncGEs
IGdwYSk7Cj4gPiArICAgICAgICAgICAgICAgVEVTVF9BU1NFUlQocmVnaW9uICYmIHJlZ2lvbi0+
cmVnaW9uLmZsYWdzICYgS1ZNX01FTV9HVUVTVF9NRU1GRCwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAiUHJpdmF0ZSBtZW1vcnkgcmVnaW9uIG5vdCBmb3VuZCBmb3IgR1BBIDB4JWx4
IiwgZ3BhKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICBvZmZzZXQgPSAoZ3BhIC0gcmVnaW9u
LT5yZWdpb24uZ3Vlc3RfcGh5c19hZGRyKTsKPiAKPiBuaXQ6IHdoeSB0aGUgcGFyZW50aGVzZXM/
CgpJIHNpbXBseSBmb3Jnb3QgdG8gcmVtb3ZlIHRoZW0gd2hlbiBJIGNoYW5nZWQgdGhlIGZ1bmN0
aW9uIHRvIHN1cHBvcnQgc3Bhbm5pbmcKbXVsdGlwbGUgbWVtc2xvdHMsIGkuZS4gd2hlbiB0aGUg
Y29kZSB3ZW50IGZyb20gdGhpcwoKCWZkX29mZnNldCA9IHJlZ2lvbi0+cmVnaW9uLmdtZW1fb2Zm
c2V0ICsKCQkgICAgKGdwYSAtIHJlZ2lvbi0+cmVnaW9uLmd1ZXN0X3BoeXNfYWRkcik7Cgp0byB3
aGF0IHlvdSBzZWUgYWJvdmUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
