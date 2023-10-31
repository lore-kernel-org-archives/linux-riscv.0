Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1622FC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 18:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xbe+fzLoPbw1ufok0/rM/Ms3l+Rx7+30I0OY5slv/Dg=; b=lFQV5HQdj68FYc
	t3hmhB2s0KgIRZxCo41BFjc1n2C0YqnncysVTuykZoTViih9FX/E9hBqkZhAkk+UymKu3IXz9X4yf
	rPzDFk8/T0X3I1JsACw4OgzPEd6n7LwYI4V7vf6q7QvOzz+fXMaCHOpS+lUGQTpIg3wUydvjljtcF
	K+hiIX9/LCX1shzqbWIf2Oiz3R6R+McwRCpY4P5gSu+wToBIBoqnLgJIgrZy/isVhKROqGGkhvnX7
	RLaoMWtXg5PsCCidckadq1XL/L2Bj60cvxR5/ZPZYgz80RDYAd6ry4J3c1mewaT2LjoFP5OoCK2zz
	913YA9YLzcifEyUkveNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxtPb-005wtA-2Y;
	Tue, 31 Oct 2023 18:24:23 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxtPY-005wqR-1o
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 18:24:22 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cc1ee2d8dfso41800515ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 11:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698776653; x=1699381453; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fA4BSuC8POmGjMQJ0k8vnna5BPAxY9Ekm8SCU7EDDBY=;
        b=ofL2l/62U8yrQ90hM9BCwDgXAR3/uuCpSfLhVmQhIXziXOZDIiBMLmkadApz1ed4DZ
         h1tnEQrZjnE1QCQJHodnIOnM3OU9oZBcf+k7UBVWexds3WwDRU6OmWtaHxClrXnfBion
         ZTlYaqcNyPT4kNp0myNVeQxix9Ar1/PlxMxn7whiJcJaAASnPU4G7O5Y4noAUJtbAMLB
         Tb8nt0fMBwXKZt3/7k/wS9VeZOYbJN9m0bHRETq80uZzLim7ncenzHMYPD/5HmVNi8aq
         kOGGhk2IfR/FbLBHPcTRDQkM2f7X06EIOp/VrR/eUnuSEtpniUd4LMJS4gFDtyFIvhaS
         /9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698776653; x=1699381453;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fA4BSuC8POmGjMQJ0k8vnna5BPAxY9Ekm8SCU7EDDBY=;
        b=FhIouD4C1YOmJ4sXvLtKdQkHvO09zV3by4q4X6arq42JXSNAzWDFn2CKMT2sB9n4dO
         sFFA0/cXh1sOPGM53CI3tVCSIzLLJeMaCWWLVSlSNpfvKfUUzeNsShPxFrYKjDrvmCq6
         fYdGFE93v3PqwcaXbojAyP6dMS1THwMvx0uocErllr3y59VwWs1e2+OyKN5vz6wTPrwZ
         JG2TDfCoXrkM8oq7cFk0M/qf5nuSPctK+3vJnblh4b2oQID1VYSxQAaPscCVSK/cB2gx
         GIKLwj4YqM+T1CcEMrjYz7Ysa8nmgEfRDgHPvoiFK9qoPhiMaW//8PYeFCbFDE3HXXRx
         vArQ==
X-Gm-Message-State: AOJu0Yx0T9jd9StBBONcGDA5eQ2dQifEezYUOWpaXjG/F3iiYL+X1x1A
	QGe+08BcK4wvUWyvyN1EmeAcLA==
X-Google-Smtp-Source: AGHT+IFxkiDdZGGfHsdazjXYZcfW0cI1Huw/6T3VggKB9s0vUh/sA7Jolgtag5oCOtU2pTLnT1L5FA==
X-Received: by 2002:a17:902:ecca:b0:1cc:54b5:b4fa with SMTP id a10-20020a170902ecca00b001cc54b5b4famr5681643plh.18.1698776652868;
        Tue, 31 Oct 2023 11:24:12 -0700 (PDT)
Received: from google.com (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c20d00b001c5dea67c26sm1620267pll.233.2023.10.31.11.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 11:24:11 -0700 (PDT)
Date: Tue, 31 Oct 2023 11:24:07 -0700
From: David Matlack <dmatlack@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
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
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
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
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
Message-ID: <ZUFGRyQEuWj4RJS0@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-17-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027182217.3615211-17-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_112420_601262_DDC4322D 
X-CRM114-Status: GOOD (  19.61  )
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

T24gMjAyMy0xMC0yNyAxMToyMSBBTSwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiBJbnRy
b2R1Y2UgYW4gaW9jdGwoKSwgS1ZNX0NSRUFURV9HVUVTVF9NRU1GRCwgdG8gYWxsb3cgY3JlYXRp
bmcgZmlsZS1iYXNlZAo+IG1lbW9yeSB0aGF0IGlzIHRpZWQgdG8gYSBzcGVjaWZpYyBLVk0gdmly
dHVhbCBtYWNoaW5lIGFuZCB3aG9zZSBwcmltYXJ5Cj4gcHVycG9zZSBpcyB0byBzZXJ2ZSBndWVz
dCBtZW1vcnkuCj4gCj4gQSBndWVzdC1maXJzdCBtZW1vcnkgc3Vic3lzdGVtIGFsbG93cyBmb3Ig
b3B0aW1pemF0aW9ucyBhbmQgZW5oYW5jZW1lbnRzCj4gdGhhdCBhcmUga2x1ZGd5IG9yIG91dHJp
Z2h0IGluZmVhc2libGUgdG8gaW1wbGVtZW50L3N1cHBvcnQgaW4gYSBnZW5lcmljCj4gbWVtb3J5
IHN1YnN5c3RlbS4gIFdpdGggZ3Vlc3RfbWVtZmQsIGd1ZXN0IHByb3RlY3Rpb25zIGFuZCBtYXBw
aW5nIHNpemVzCj4gYXJlIGZ1bGx5IGRlY291cGxlZCBmcm9tIGhvc3QgdXNlcnNwYWNlIG1hcHBp
bmdzLiAgIEUuZy4gS1ZNIGN1cnJlbnRseQo+IGRvZXNuJ3Qgc3VwcG9ydCBtYXBwaW5nIG1lbW9y
eSBhcyB3cml0YWJsZSBpbiB0aGUgZ3Vlc3Qgd2l0aG91dCBpdCBhbHNvCj4gYmVpbmcgd3JpdGFi
bGUgaW4gaG9zdCB1c2Vyc3BhY2UsIGFzIEtWTSdzIEFCSSB1c2VzIFZNQSBwcm90ZWN0aW9ucyB0
bwo+IGRlZmluZSB0aGUgYWxsb3cgZ3Vlc3QgcHJvdGVjdGlvbi4gIFVzZXJzcGFjZSBjYW4gZnVk
Z2UgdGhpcyBieQo+IGVzdGFibGlzaGluZyB0d28gbWFwcGluZ3MsIGEgd3JpdGFibGUgbWFwcGlu
ZyBmb3IgdGhlIGd1ZXN0IGFuZCByZWFkYWJsZQo+IG9uZSBmb3IgaXRzZWxmLCBidXQgdGhhdOKA
mXMgc3Vib3B0aW1hbCBvbiBtdWx0aXBsZSBmcm9udHMuCj4gCj4gU2ltaWxhcmx5LCBLVk0gY3Vy
cmVudGx5IHJlcXVpcmVzIHRoZSBndWVzdCBtYXBwaW5nIHNpemUgdG8gYmUgYSBzdHJpY3QKPiBz
dWJzZXQgb2YgdGhlIGhvc3QgdXNlcnNwYWNlIG1hcHBpbmcgc2l6ZSwgZS5nLiBLVk0gZG9lc27i
gJl0IHN1cHBvcnQKPiBjcmVhdGluZyBhIDFHaUIgZ3Vlc3QgbWFwcGluZyB1bmxlc3MgdXNlcnNw
YWNlIGFsc28gaGFzIGEgMUdpQiBndWVzdAo+IG1hcHBpbmcuICBEZWNvdXBsaW5nIHRoZSBtYXBw
aW5ncyBzaXplcyB3b3VsZCBhbGxvdyB1c2Vyc3BhY2UgdG8gcHJlY2lzZWx5Cj4gbWFwIG9ubHkg
d2hhdCBpcyBuZWVkZWQgd2l0aG91dCBpbXBhY3RpbmcgZ3Vlc3QgcGVyZm9ybWFuY2UsIGUuZy4g
dG8KPiBoYXJkZW4gYWdhaW5zdCB1bmludGVudGlvbmFsIGFjY2Vzc2VzIHRvIGd1ZXN0IG1lbW9y
eS4KPiAKPiBEZWNvdXBsaW5nIGd1ZXN0IGFuZCB1c2Vyc3BhY2UgbWFwcGluZ3MgbWF5IGFsc28g
YWxsb3cgZm9yIGEgY2xlYW5lcgo+IGFsdGVybmF0aXZlIHRvIGhpZ2gtZ3JhbnVsYXJpdHkgbWFw
cGluZ3MgZm9yIEh1Z2VUTEIsIHdoaWNoIGhhcyByZWFjaGVkIGEKPiBiaXQgb2YgYW4gaW1wYXNz
ZSBhbmQgaXMgdW5saWtlbHkgdG8gZXZlciBiZSBtZXJnZWQuCj4gCj4gQSBndWVzdC1maXJzdCBt
ZW1vcnkgc3Vic3lzdGVtIGFsc28gcHJvdmlkZXMgY2xlYXJlciBsaW5lIG9mIHNpZ2h0IHRvCj4g
dGhpbmdzIGxpa2UgYSBkZWRpY2F0ZWQgbWVtb3J5IHBvb2wgKGZvciBzbGljZS1vZi1oYXJkd2Fy
ZSBWTXMpIGFuZAo+IGVsaW1pbmF0aW9uIG9mICJzdHJ1Y3QgcGFnZSIgKGZvciBvZmZsb2FkIHNl
dHVwcyB3aGVyZSB1c2Vyc3BhY2UgX25ldmVyXwo+IG5lZWRzIHRvIG1tYXAoKSBndWVzdCBtZW1v
cnkpLgoKQWxsIG9mIHRoZXNlIHVzZS1jYXNlcyBpbnZvbHZlIHVzaW5nIGd1ZXN0X21lbWZkIGZv
ciBzaGFyZWQgcGFnZXMsIGJ1dAp0aGlzIGVudGlyZSBzZXJpZXMgc2V0cyB1cCBLVk0gdG8gb25s
eSB1c2UgZ3Vlc3RfbWVtZmQgZm9yIHByaXZhdGUKcGFnZXMuCgpGb3IgZXhhbXBsZSwgdGhlIHBl
ci1wYWdlIGF0dHJpYnV0ZXMgYXJlIGEgcHJvcGVydHkgb2YgYSBLVk0gVk0sIG5vdCB0aGUKdW5k
ZXJseWluZyBndWVzdF9tZW1mZC4gU28gdGhhdCBpbXBsaWVzIHdlIHdpbGwgbmVlZCBzZXBhcmF0
ZQpndWVzdF9tZW1mZHMgZm9yIHByaXZhdGUgYW5kIHNoYXJlZCBwYWdlcy4gQnV0IGEgZ2l2ZW4g
bWVtc2xvdCBjYW4gaGF2ZQphIG1peCBvZiBwcml2YXRlIGFuZCBzaGFyZWQgcGFnZXMuIFNvIHRo
YXQgaW1wbGllcyBhIG1lbXNsb3Qgd2lsbCBuZWVkCnRvIHN1cHBvcnQgMiBndWVzdF9tZW1mZHM/
IEJ1dCB0aGUgVUFQSSBvbmx5IGFsbG93cyAxIGFuZCB1c2VzIHRoZSBIVkEKZm9yIHNoYXJlZCBt
YXBwaW5ncy4KCk15IGluaXRpYWwgcmVhY3Rpb24gYWZ0ZXIgcmVhZGluZyB0aHJvdWdoIHRoaXMg
c2VyaWVzIGlzIHRoYXQgdGhlCnBlci1wYWdlIHByaXZhdGUvc2hhcmVkIHNob3VsZCBiZSBhIHBy
b3BlcnR5IG9mIHRoZSBndWVzdF9tZW1mZCwgbm90IHRoZQpWTS4gTWF5YmUgaXQgd291bGQgZXZl
biBiZSBjbGVhbmVyIGluIHRoZSBsb25nLXJ1biB0byBtYWtlIGFsbCBtZW1vcnkKYXR0cmlidXRl
cyBhIHByb3BlcnR5IG9mIHRoZSBndWVzdF9tZW1mZC4gVGhhdCB3YXkgd2UgY2FuIHNjb3BlIHRo
ZQpzdXBwb3J0IHRvIG9ubHkgZ3Vlc3RfbWVtZmRzIGFuZCBub3QgaGF2ZSB0byB3b3JyeSBhYm91
dCBtYWtpbmcgcGVyLXBhZ2UKYXR0cmlidXRlcyB3b3JrIHdpdGggImxlZ2FjeSIgSFZBLWJhc2Vk
IG1lbXNsb3RzLgoKTWF5YmUgY2FuIHlvdSBza2V0Y2ggb3V0IGhvdyB5b3Ugc2VlIHRoaXMgcHJv
cG9zYWwgYmVpbmcgZXh0ZW5zaWJsZSB0bwp1c2luZyBndWVzdF9tZW1mZCBmb3Igc2hhcmVkIG1h
cHBpbmdzPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
