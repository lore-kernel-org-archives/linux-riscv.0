Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E849C001DC
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 16:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tlKONnhlsDrJ4AqQ7lRFhO6ExfCA1riZmEOdiWDQvk4=; b=4eoHI+kUJ7fvsP
	DEEKpITXm9gyaD88aIFFLiXKMcLPW/u1sQlRKwQDQChlHXjKPazvuumnBFJy4LfNGJzlG0fHc/AUy
	q5zcBPTHJN8WWCSdnxGQV5eYrtoRiMHShVHiQPCtmuDwQMvUdlYKwIH5lC7Xu8vqEsyrRUqOJwDLo
	pB1podxkvYTtil5CzBIrQvErg8qQJdkYadd/J0H/kBowfg0BUxfc+B+tovLbV588EZkbRxc7/S1wT
	9SL1b+wK1bf5ikMa6IrCfvC/Cx8ULfBaHT3+a+Ej64fUq6w5PtOQ9K8ZzEWGY3ouqdsXisgPR73pn
	zypspB6VIrqiI4Ku7mmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQVgs-00GYwZ-35;
	Mon, 31 Jul 2023 16:24:14 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQVgp-00GYut-2X
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 16:24:13 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-63d48c3d242so24965846d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 09:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690820650; x=1691425450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bBibAebd9TH21iCDO05hSEk2osKPAFkgUcjQOZN6IE=;
        b=Nxq6zpIl4t0T0IKgYCttihPgWkXDGg2v82UeoDRuJEPiuoZCcaCHDZLE9kkIxiKoGj
         jk+IsC1Guj9oI8nO++cnUqPSWZhSmAdBVc5lsM1hT0kSe4RC/KjMhhSc6wlqkqU2YaQ2
         MlzhwgMrC6YuHdeNmM0ceLnhR0bBMJIyRtICLHnduD/dx0KJOUH8SaivN46+P6VL/13o
         HD2+rdmaVCfzWB1fiLuejcoL89Z+FWgZTnHkXXYaDxZvnDyh2EIFMo2Vuj5jGb8JG448
         0UmR6aeSUdj4a9FGESdjj1akt6y1FHupeca6JLTCIL1tXPbyPZc4VruR8nQPmlFHhYMX
         m2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690820650; x=1691425450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bBibAebd9TH21iCDO05hSEk2osKPAFkgUcjQOZN6IE=;
        b=glE7f7CV4eS1eeT8Y4Fcu/9ddcxCRQFHeNkLjHt3f4gG2it53R5fZX8+pA6OFn0F/j
         JbJgFxjbudfhPX+6Ycw/9CKF9LQCjMxHzuOtKpOxQyew7UZahBlLob2Iw8fxechtdByw
         bqA8j7aj9F/7yUY/12D5ZsdCWZyN3f83Ce7MqJFWtZuVoi3pnSjY1TanUMnmN8BKOi/A
         uCApPBlsCJX7eE4MbnowXHNKYS/ZFMnHv7+jXBZSFzSovAnTQLDoZDrS2MWlqSz/bajV
         2jpfMFiki/s6djsy9RyK2YIkK5oUERG29lVo9hY76PSdzPmWN1YZvJjbiOXvWzaKJDTi
         xhDA==
X-Gm-Message-State: ABy/qLZPlasJdH5YpF0fykezYvEcbouneT8P59cVrD1zX+OkhkcU3Uqr
	t0eJt4gVJTPE4exm9jcQVzAQRq13/+j8uHd5cK3z3w==
X-Google-Smtp-Source: APBJJlHREYUxXxwX9gGy7EcKK3cJKFiEBqZ2OxDI6ULebXBrqt9zCYKQ0hqOpLlGDOWyAd0KbYFFLQMR5e4GSI0P8JE=
X-Received: by 2002:a0c:ef0a:0:b0:63d:281d:d9cd with SMTP id
 t10-20020a0cef0a000000b0063d281dd9cdmr11195773qvr.57.1690820649949; Mon, 31
 Jul 2023 09:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <DS0PR11MB637386533A4A10667BA6DF03DC03A@DS0PR11MB6373.namprd11.prod.outlook.com>
 <ZL/yb4wL4Nhf9snZ@google.com>
In-Reply-To: <ZL/yb4wL4Nhf9snZ@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 31 Jul 2023 17:23:33 +0100
Message-ID: <CA+EHjTwGoMgoTEktL9zq2190TMY=vU29xv+oQ7X2Eeu8c8AmjQ@mail.gmail.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To: Sean Christopherson <seanjc@google.com>
Cc: Wei W Wang <wei.w.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, Vlastimil Babka <vbabka@suse.cz>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Liam Merwick <liam.merwick@oracle.com>, 
	Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_092411_825399_76044DA2 
X-CRM114-Status: GOOD (  22.23  )
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

SGkgU2VhbiwKCk9uIFR1ZSwgSnVsIDI1LCAyMDIzIGF0IDU6MDTigK9QTSBTZWFuIENocmlzdG9w
aGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1bCAyNSwgMjAy
MywgV2VpIFcgV2FuZyB3cm90ZToKPiA+IE9uIFdlZG5lc2RheSwgSnVseSAxOSwgMjAyMyA3OjQ1
IEFNLCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOgo+ID4gPiAraW50IGt2bV9nbWVtX2dldF9w
Zm4oc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LAo+ID4gPiAr
ICAgICAgICAgICAgICAgIGdmbl90IGdmbiwga3ZtX3Bmbl90ICpwZm4sIGludCAqbWF4X29yZGVy
KSB7Cj4gPiA+ICsgICBwZ29mZl90IGluZGV4ID0gZ2ZuIC0gc2xvdC0+YmFzZV9nZm4gKyBzbG90
LT5nbWVtLnBnb2ZmOwo+ID4gPiArICAgc3RydWN0IGt2bV9nbWVtICpnbWVtOwo+ID4gPiArICAg
c3RydWN0IGZvbGlvICpmb2xpbzsKPiA+ID4gKyAgIHN0cnVjdCBwYWdlICpwYWdlOwo+ID4gPiAr
ICAgc3RydWN0IGZpbGUgKmZpbGU7Cj4gPiA+ICsKPiA+ID4gKyAgIGZpbGUgPSBrdm1fZ21lbV9n
ZXRfZmlsZShzbG90KTsKPiA+ID4gKyAgIGlmICghZmlsZSkKPiA+ID4gKyAgICAgICAgICAgcmV0
dXJuIC1FRkFVTFQ7Cj4gPiA+ICsKPiA+ID4gKyAgIGdtZW0gPSBmaWxlLT5wcml2YXRlX2RhdGE7
Cj4gPiA+ICsKPiA+ID4gKyAgIGlmIChXQVJOX09OX09OQ0UoeGFfbG9hZCgmZ21lbS0+YmluZGlu
Z3MsIGluZGV4KSAhPSBzbG90KSkgewo+ID4gPiArICAgICAgICAgICBmcHV0KGZpbGUpOwo+ID4g
PiArICAgICAgICAgICByZXR1cm4gLUVJTzsKPiA+ID4gKyAgIH0KPiA+ID4gKwo+ID4gPiArICAg
Zm9saW8gPSBrdm1fZ21lbV9nZXRfZm9saW8oZmlsZV9pbm9kZShmaWxlKSwgaW5kZXgpOwo+ID4g
PiArICAgaWYgKCFmb2xpbykgewo+ID4gPiArICAgICAgICAgICBmcHV0KGZpbGUpOwo+ID4gPiAr
ICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiA+ID4gKyAgIH0KPiA+ID4gKwo+ID4gPiArICAg
cGFnZSA9IGZvbGlvX2ZpbGVfcGFnZShmb2xpbywgaW5kZXgpOwo+ID4gPiArCj4gPiA+ICsgICAq
cGZuID0gcGFnZV90b19wZm4ocGFnZSk7Cj4gPiA+ICsgICAqbWF4X29yZGVyID0gY29tcG91bmRf
b3JkZXIoY29tcG91bmRfaGVhZChwYWdlKSk7Cj4gPgo+ID4gTWF5YmUgYmV0dGVyIHRvIGNoZWNr
IGlmIGNhbGxlciBwcm92aWRlZCBhIGJ1ZmZlciB0byBnZXQgdGhlIG1heF9vcmRlcjoKPiA+IGlm
IChtYXhfb3JkZXIpCj4gPiAgICAgICAqbWF4X29yZGVyID0gY29tcG91bmRfb3JkZXIoY29tcG91
bmRfaGVhZChwYWdlKSk7Cj4gPgo+ID4gVGhpcyBpcyB3aGF0IHRoZSBwcmV2aW91cyB2ZXJzaW9u
IGRpZCAocmVzdHJpY3RlZG1lbV9nZXRfcGFnZSksCj4gPiBzbyB0aGF0IGNhbGxlcnMgd2hvIG9u
bHkgd2FudCB0byBnZXQgYSBwZm4gZG9uJ3QgbmVlZCB0byBkZWZpbmUKPiA+IGFuIHVudXNlZCAi
b3JkZXIiIHBhcmFtLgo+Cj4gTXkgcHJlZmVyZW5jZSB3b3VsZCBiZSB0byByZXF1aXJlIEBtYXhf
b3JkZXIuICBJIGNhbiBraW5kYSBzb3J0YSBzZWUgd2h5IGEgZ2VuZXJpYwo+IGltcGxlbWVudGF0
aW9uIChyZXN0cmljdGVkbWVtKSB3b3VsZCBtYWtlIHRoZSBwYXJhbSBvcHRpb25hbCwgYnV0IHdp
dGggZ21lbSBiZWluZwo+IEtWTS1pbnRlcm5hbCBJIHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIHJl
cXVpcmUgdGhlIHBhcmFtLiAgRXZlbiBpZiBwS1ZNIGRvZXNuJ3QKPiBfY3VycmVudGx5XyBuZWVk
L3dhbnQgdGhlIG9yZGVyIG9mIHRoZSBiYWNraW5nIGFsbG9jYXRpb24sIHByZXN1bWFibHkgdGhh
dCdzIGJlY2F1c2UKPiBodWdlcGFnZSBzdXBwb3J0IGlzIHN0aWxsIG9uIHRoZSBUT0RPIGxpc3Qs
IG5vdCBiZWNhdXNlIHBLVk0gZnVuZGFtZW50YWxseSBkb2Vzbid0Cj4gbmVlZCB0byBrbm93IHRo
ZSBvcmRlciBvZiB0aGUgYmFja2luZyBhbGxvY2F0aW9uLgoKWW91J3JlIHJpZ2h0IHRoYXQgd2l0
aCBodWdlIHBhZ2VzIHBLVk0gd2lsbCBldmVudHVhbGx5IG5lZWQgdG8ga25vdwp0aGUgb3JkZXIg
b2YgdGhlIGJhY2tpbmcgYWxsb2NhdGlvbiwgYnV0IHRoZXJlIGlzIGF0IGxlYXN0IG9uZSB1c2UK
Y2FzZSB3aGVyZSBpdCBkb2Vzbid0LCB3aGljaCBJIHJhbiBpbnRvIGluIHRoZSBwcmV2aW91cyBw
b3J0cyBhcyB3ZWxsCmFzIHRoaXMgb25lLiBJbiBwS1ZNIChhbmQgaW4gcG9zc2libHkgb3RoZXIg
aW1wbGVtZW50YXRpb25zKSwgdGhlIGhvc3QKbmVlZHMgdG8gYWNjZXNzIChzaGFyZWQpIGd1ZXN0
IG1lbW9yeSB0aGF0IGlzbid0IG1hcHBlZC4gRm9yIHRoYXQsCkkndmUgdXNlZCBrdm1fKl9nZXRf
cGZuKCksIG9ubHkgcmVxdWlyaW5nIHRoZSBwZm4sIHNvIGdldCB0aGUgcGFnZSB2aWEKcGZuX3Rv
X3BhZ2UoKS4KCkFsdGhvdWdoIGl0J3Mgbm90IHRoYXQgYmlnLCBteSBwcmVmZXJlbmNlIHdvdWxk
IGJlIGZvciBtYXhfb3JkZXIgdG8gYmUgb3B0aW9uYWwuCgpUaGFua3MhCi9mdWFkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
