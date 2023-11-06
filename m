Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6B8C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 13:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bFlPYoWSM8s4b5nofBAYcZzVOTMKgdHgmz9nj6dV1jw=; b=drdXv3d5h6EH8C
	Au6CdjgwsdIlIK4DLex9wHf6h3vcrrTajzi/j76ZFJVsgaMWSq0CxoV/IkCEmKg1fuZr/2pZucq90
	5K1bwVNOK6bXeVW1AYt07FritEPfjYUqTFqwA/ZTrU1mJR2jM7MjvK9BNcy+8mvIAKIu86KgiavA9
	PkCdZ8Fj3uL9d+CLrBhw9vwdYM7FMy+iwe0We1zxUS4+DfMM3hcdGdCRZRLY4vWULg75yoW/KPgdi
	LNtfZfL/TnbBbKS0I+R7Otind54nk6Jbdl0sh2ivtiK7vNci/XlIebgFnl8Pl/O7ctly1Vp5AvRdU
	c3AM94KgFTthHF7bN/MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzzgw-00Gk4e-12;
	Mon, 06 Nov 2023 13:30:58 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzzgr-00Gk3V-3D;
	Mon, 06 Nov 2023 13:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699277454; x=1730813454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GcPOwqKIRcSDpD/XkGdZ5KVAeJljJ23LDoDjt600Qfg=;
  b=bna4ZdUgFmH30GcE992QPdyL7p7bl2FkYGyZL1/ICons/jTfZaaTi9iG
   JTMLcVeELS53LTXXCKoYxkgwKjHqPH7w1bmRCEkK/HjJpojMy71dNoTBP
   dI1Vfv0+FDNSCeDpKTxQ+K4FCW/5v9h/9OEmFrLNVN/xWK2Ub9TWei2TI
   Q9qCtPdMmUo72doKkQS9oIC1+CDlRMvp+7kjHx6Y2aspjVRqMhjZ9t1rD
   gHCiNcaGdcdsc7HV63uiAmwTGm7vLSKCWYilNyvGpH4ZdKlEvtDxVidcv
   FLteqdDN9h5on7omX9Vj7hkKpHrH+c+dVhLT/ciMoaIYGgKiR8r3bae0O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2263472"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="2263472"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 05:30:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="755855766"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="755855766"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orsmga007.jf.intel.com with ESMTP; 06 Nov 2023 05:30:42 -0800
Date: Mon, 6 Nov 2023 21:29:10 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
	Anish Moorthy <amoorthy@google.com>,
	David Matlack <dmatlack@google.com>,
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	Vlastimil Babka <vbabka@suse.cz>,
	Vishal Annapurve <vannapurve@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Maciej Szmigiero <mail@maciej.szmigiero.name>,
	David Hildenbrand <david@redhat.com>,
	Quentin Perret <qperret@google.com>,
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
	Liam Merwick <liam.merwick@oracle.com>,
	Isaku Yamahata <isaku.yamahata@gmail.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH v13 20/35] KVM: x86/mmu: Handle page fault for private
 memory
Message-ID: <ZUjqJjz0Epf7ii8F@yilunxu-OptiPlex-7050>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-21-seanjc@google.com>
 <ZUeSaAKRemlSRQpO@yilunxu-OptiPlex-7050>
 <CABgObfb1Wf2ptitGhJPM6VcmkCG9haMoQj2BsttjeoV=9F0O9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABgObfb1Wf2ptitGhJPM6VcmkCG9haMoQj2BsttjeoV=9F0O9Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_053054_098475_B0282ADE 
X-CRM114-Status: GOOD (  15.77  )
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

T24gU3VuLCBOb3YgMDUsIDIwMjMgYXQgMDU6MTk6MzZQTSArMDEwMCwgUGFvbG8gQm9uemluaSB3
cm90ZToKPiBPbiBTdW4sIE5vdiA1LCAyMDIzIGF0IDI6MDTigK9QTSBYdSBZaWx1biA8eWlsdW4u
eHVAbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+Cj4gPiA+ICtzdGF0aWMgdm9pZCBrdm1fbW11
X3ByZXBhcmVfbWVtb3J5X2ZhdWx0X2V4aXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrdm1fcGFn
ZV9mYXVsdCAqZmF1bHQpCj4gPiA+ICt7Cj4gPiA+ICsgICAgIGt2bV9wcmVwYXJlX21lbW9yeV9m
YXVsdF9leGl0KHZjcHUsIGZhdWx0LT5nZm4gPDwgUEFHRV9TSElGVCwKPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgUEFHRV9TSVpFLCBmYXVsdC0+d3JpdGUsIGZhdWx0
LT5leGVjLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYXVsdC0+
aXNfcHJpdmF0ZSk7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBpbnQga3ZtX2ZhdWx0
aW5fcGZuX3ByaXZhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX3BhZ2VfZmF1bHQgKmZhdWx0KQo+ID4gPiAr
ewo+ID4gPiArICAgICBpbnQgbWF4X29yZGVyLCByOwo+ID4gPiArCj4gPiA+ICsgICAgIGlmICgh
a3ZtX3Nsb3RfY2FuX2JlX3ByaXZhdGUoZmF1bHQtPnNsb3QpKSB7Cj4gPiA+ICsgICAgICAgICAg
ICAga3ZtX21tdV9wcmVwYXJlX21lbW9yeV9mYXVsdF9leGl0KHZjcHUsIGZhdWx0KTsKPiA+ID4g
KyAgICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsKPiA+ID4gKyAgICAgfQo+ID4gPiArCj4gPiA+
ICsgICAgIHIgPSBrdm1fZ21lbV9nZXRfcGZuKHZjcHUtPmt2bSwgZmF1bHQtPnNsb3QsIGZhdWx0
LT5nZm4sICZmYXVsdC0+cGZuLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAmbWF4
X29yZGVyKTsKPiA+ID4gKyAgICAgaWYgKHIpIHsKPiA+ID4gKyAgICAgICAgICAgICBrdm1fbW11
X3ByZXBhcmVfbWVtb3J5X2ZhdWx0X2V4aXQodmNwdSwgZmF1bHQpOwo+ID4gPiArICAgICAgICAg
ICAgIHJldHVybiByOwo+ID4KPiA+IFdoeSByZXBvcnQgS1ZNX0VYSVRfTUVNT1JZX0ZBVUxUIGhl
cmU/IGV2ZW4gd2l0aCBhIHJldCAhPSAtRUZBVUxUPwo+IAo+IFRoZSBjYXNlcyBhcmUgRUZBVUxU
LCBFSFdQT0lTT04gKHdoaWNoIGNhbiByZXBvcnQKPiBLVk1fRVhJVF9NRU1PUllfRkFVTFQpIGFu
ZCBFTk9NRU0uIEkgdGhpbmsgaXQncyBmaW5lCj4gdGhhdCBldmVuIC1FTk9NRU0gY2FuIHJldHVy
biBLVk1fRVhJVF9NRU1PUllfRkFVTFQsCj4gYW5kIGl0IGRvZXNuJ3QgdmlvbGF0ZSB0aGUgZG9j
dW1lbnRhdGlvbi4gIFRoZSBkb2NzIHRlbGwgeW91ICJ3aGF0Cj4gY2FuIHlvdSBkbyBpZiBlcnJv
ciBpZiBFRkFVTFQgb3IgRUhXUE9JU09OPyI7IHRoZXkgZG9uJ3QKPiBleGNsdWRlIHRoYXQgb3Ro
ZXIgZXJybm9zIHJlc3VsdCBpbiBLVk1fRVhJVF9NRU1PUllfRkFVTFQsCj4gaXQncyBqdXN0IHRo
YXQgeW91J3JlIG5vdCBzdXBwb3NlZCB0byBsb29rIGF0IGl0CgpUaGFua3MsIGl0J3MgT0sgZm9y
IEVOT01FTSArIEtWTV9FWElUX01FTU9SWV9GQVVMVC4KCkFub3RoZXIgY29uY2VybiBpcywgbm93
IDMgcGxhY2VzIHRvIHJlcG9ydCBFRkFVTFQgKyBLVk1fRVhJVF9NRU1PUllfRkFVTFQ6CgogIGlm
ICgha3ZtX3Nsb3RfY2FuX2JlX3ByaXZhdGUoZmF1bHQtPnNsb3QpKSB7Cglrdm1fbW11X3ByZXBh
cmVfbWVtb3J5X2ZhdWx0X2V4aXQodmNwdSwgZmF1bHQpOwoJcmV0dXJuIC1FRkFVTFQ7CiAgfQoK
ICBmaWxlID0ga3ZtX2dtZW1fZ2V0X2ZpbGUoc2xvdCk7CiAgaWYgKCFmaWxlKQoJcmV0dXJuIC1F
RkFVTFQ7CgogIGlmIChmYXVsdC0+aXNfcHJpdmF0ZSAhPSBrdm1fbWVtX2lzX3ByaXZhdGUodmNw
dS0+a3ZtLCBmYXVsdC0+Z2ZuKSkgewoJa3ZtX21tdV9wcmVwYXJlX21lbW9yeV9mYXVsdF9leGl0
KHZjcHUsIGZhdWx0KTsKCXJldHVybiAtRUZBVUxUOwogIH0KClRoZXkgYXJlIGRpZmZlcmVudCBj
YXNlcywgYW5kIHNlZW1zIHVzZXJzcGFjZSBzaG91bGQgaGFuZGxlIHRoZW0KZGlmZmVyZW50bHks
IGJ1dCBub3QgZW5vdWdoIGluZm9ybWF0aW9uIHRvIGRpc3Rpbmd1aXNoIHRoZW0uCgpUaGFua3Ms
CllpbHVuCgo+IAo+IFBhb2xvCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
