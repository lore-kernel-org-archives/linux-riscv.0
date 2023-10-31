Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FD1C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 21:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QFCb8ktj0kYLYUgkzQdGhYQu5VzxpLAwf/nbQ/xWzlg=; b=FsnfwpRxCTN0Wz49SCB8b59fRZ
	4NRjH96T+Za/qnzmZbzMZCIGL1pVRWey+THY5APy0wTXsokTrBxHJaxIwvWI3UjrTCSYSrIi9FC3v
	xTMbm82hSX2u3OFrRO5+KmcOE8PZGd73nEvBCvY2gHSA+sX3ICkHeyFeljl3h0cIdENFexZZcPHjx
	cdhq7EPvRYDSHLoNJ/dHioTAjQhwcxw9ETorsGACjFBS2X+NtHYg7hIwa3y5hDSKZErIC47iJFO42
	52ThhqwW2cWJsJJeJqRjRbQ1ZzF0UjIdS/nGljH8S08F8j3TdGzYEl5BAwakLNVUQWHlVcqmKaTcP
	SXJB0vrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxwPl-006Aqb-2w;
	Tue, 31 Oct 2023 21:36:45 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxwPi-006ApP-09
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 21:36:44 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1cc23f2226bso32984045ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 14:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698788199; x=1699392999; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qwUJsYeIlwqw805rRX9kqL0ratglmWsD95jLONcl2+Q=;
        b=Re4Cg5sTRefLm/Czl1+lk8zQ4FH2cYBoczyRXuPeV1tY4JFn/gmu52ZrRbE6fe0zH4
         aUjCz0wGPUXd8iCIN3Kje5TD5qbUq3dKpQvF8617F/nAqHfchcEuE0XlmlVxXyEP/z4k
         xg/KCAiQ57w+G4l+zVvMsaEtxt3JDfJvIgl6RPIb8Zb8+m+LIoDCjm7Hbpuzqv8rbcEI
         zJ+XBVUuntSwBLTXs3QX8vfX1uBHvJfqI7CT7WR0GDValOZ1pzuYfv4BYcd0HmOUn1kD
         J7gckasfOKtQlu3r7xyZdWG4wsFo4eJuXHXQlpJSsoqKZfI5+X8hLCx5RtK53ejYfbVx
         kjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698788199; x=1699392999;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qwUJsYeIlwqw805rRX9kqL0ratglmWsD95jLONcl2+Q=;
        b=SwBEAQ1CwF8hTjLWxFEE6Oi0MjYK3uvKndwLXCKb9b7D1DaB7v4p/aC7aMjNGk9txd
         S97gg1hzZ70bye3XmDoMbpIufXw/sKT8xELX2NaHa9hNFvb3sYrnJnKO/KILXPlh/U1t
         lLH0l4GDOT1G24JNt7nbNU3bIBz9duCqx96ySX+ghl3oQ9tyg7sCEHPNfbdkDKMyMLTG
         na6dic1bIGmlcXqW+bYCC8r6MceCHR17UtwtAjxJbgTBkIvG14Us93e1kkXKS+5JQa/C
         haMNN3pHQJip/4aad8Ur7ZVBRQjdMlzVZaE1jZHIkVtnjAwZG3fQRxCEXT9HxDPQCWZE
         eAvA==
X-Gm-Message-State: AOJu0Yyx4Y2Tjy+HtMPwv9bAbwUcx9Mb8DHjJ7iPu7LLTSZL0Kdx0tX2
	JmAsY79Y3QTCrVTRUGda3DpR9SIcSUY=
X-Google-Smtp-Source: AGHT+IErbOn1a7ghsHO7PXtEmrexZ1Aq9PA/AfhJ0FeZy4uT6qmhxk4RVfIH9rjSv+2WH3z2AoAxZzd2jeI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2609:b0:1b8:8c7:31e6 with SMTP id
 jd9-20020a170903260900b001b808c731e6mr249399plb.1.1698788199022; Tue, 31 Oct
 2023 14:36:39 -0700 (PDT)
Date: Tue, 31 Oct 2023 14:36:37 -0700
In-Reply-To: <ZUFGRyQEuWj4RJS0@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <ZUFGRyQEuWj4RJS0@google.com>
Message-ID: <ZUFzZf-YmCRYP6qo@google.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
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
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_143642_087155_E8EA1D99 
X-CRM114-Status: GOOD (  28.17  )
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

T24gVHVlLCBPY3QgMzEsIDIwMjMsIERhdmlkIE1hdGxhY2sgd3JvdGU6Cj4gT24gMjAyMy0xMC0y
NyAxMToyMSBBTSwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiA+IEludHJvZHVjZSBhbiBp
b2N0bCgpLCBLVk1fQ1JFQVRFX0dVRVNUX01FTUZELCB0byBhbGxvdyBjcmVhdGluZyBmaWxlLWJh
c2VkCj4gPiBtZW1vcnkgdGhhdCBpcyB0aWVkIHRvIGEgc3BlY2lmaWMgS1ZNIHZpcnR1YWwgbWFj
aGluZSBhbmQgd2hvc2UgcHJpbWFyeQo+ID4gcHVycG9zZSBpcyB0byBzZXJ2ZSBndWVzdCBtZW1v
cnkuCj4gPiAKPiA+IEEgZ3Vlc3QtZmlyc3QgbWVtb3J5IHN1YnN5c3RlbSBhbGxvd3MgZm9yIG9w
dGltaXphdGlvbnMgYW5kIGVuaGFuY2VtZW50cwo+ID4gdGhhdCBhcmUga2x1ZGd5IG9yIG91dHJp
Z2h0IGluZmVhc2libGUgdG8gaW1wbGVtZW50L3N1cHBvcnQgaW4gYSBnZW5lcmljCj4gPiBtZW1v
cnkgc3Vic3lzdGVtLiAgV2l0aCBndWVzdF9tZW1mZCwgZ3Vlc3QgcHJvdGVjdGlvbnMgYW5kIG1h
cHBpbmcgc2l6ZXMKPiA+IGFyZSBmdWxseSBkZWNvdXBsZWQgZnJvbSBob3N0IHVzZXJzcGFjZSBt
YXBwaW5ncy4gICBFLmcuIEtWTSBjdXJyZW50bHkKPiA+IGRvZXNuJ3Qgc3VwcG9ydCBtYXBwaW5n
IG1lbW9yeSBhcyB3cml0YWJsZSBpbiB0aGUgZ3Vlc3Qgd2l0aG91dCBpdCBhbHNvCj4gPiBiZWlu
ZyB3cml0YWJsZSBpbiBob3N0IHVzZXJzcGFjZSwgYXMgS1ZNJ3MgQUJJIHVzZXMgVk1BIHByb3Rl
Y3Rpb25zIHRvCj4gPiBkZWZpbmUgdGhlIGFsbG93IGd1ZXN0IHByb3RlY3Rpb24uICBVc2Vyc3Bh
Y2UgY2FuIGZ1ZGdlIHRoaXMgYnkKPiA+IGVzdGFibGlzaGluZyB0d28gbWFwcGluZ3MsIGEgd3Jp
dGFibGUgbWFwcGluZyBmb3IgdGhlIGd1ZXN0IGFuZCByZWFkYWJsZQo+ID4gb25lIGZvciBpdHNl
bGYsIGJ1dCB0aGF04oCZcyBzdWJvcHRpbWFsIG9uIG11bHRpcGxlIGZyb250cy4KPiA+IAo+ID4g
U2ltaWxhcmx5LCBLVk0gY3VycmVudGx5IHJlcXVpcmVzIHRoZSBndWVzdCBtYXBwaW5nIHNpemUg
dG8gYmUgYSBzdHJpY3QKPiA+IHN1YnNldCBvZiB0aGUgaG9zdCB1c2Vyc3BhY2UgbWFwcGluZyBz
aXplLCBlLmcuIEtWTSBkb2VzbuKAmXQgc3VwcG9ydAo+ID4gY3JlYXRpbmcgYSAxR2lCIGd1ZXN0
IG1hcHBpbmcgdW5sZXNzIHVzZXJzcGFjZSBhbHNvIGhhcyBhIDFHaUIgZ3Vlc3QKPiA+IG1hcHBp
bmcuICBEZWNvdXBsaW5nIHRoZSBtYXBwaW5ncyBzaXplcyB3b3VsZCBhbGxvdyB1c2Vyc3BhY2Ug
dG8gcHJlY2lzZWx5Cj4gPiBtYXAgb25seSB3aGF0IGlzIG5lZWRlZCB3aXRob3V0IGltcGFjdGlu
ZyBndWVzdCBwZXJmb3JtYW5jZSwgZS5nLiB0bwo+ID4gaGFyZGVuIGFnYWluc3QgdW5pbnRlbnRp
b25hbCBhY2Nlc3NlcyB0byBndWVzdCBtZW1vcnkuCj4gPiAKPiA+IERlY291cGxpbmcgZ3Vlc3Qg
YW5kIHVzZXJzcGFjZSBtYXBwaW5ncyBtYXkgYWxzbyBhbGxvdyBmb3IgYSBjbGVhbmVyCj4gPiBh
bHRlcm5hdGl2ZSB0byBoaWdoLWdyYW51bGFyaXR5IG1hcHBpbmdzIGZvciBIdWdlVExCLCB3aGlj
aCBoYXMgcmVhY2hlZCBhCj4gPiBiaXQgb2YgYW4gaW1wYXNzZSBhbmQgaXMgdW5saWtlbHkgdG8g
ZXZlciBiZSBtZXJnZWQuCj4gPiAKPiA+IEEgZ3Vlc3QtZmlyc3QgbWVtb3J5IHN1YnN5c3RlbSBh
bHNvIHByb3ZpZGVzIGNsZWFyZXIgbGluZSBvZiBzaWdodCB0bwo+ID4gdGhpbmdzIGxpa2UgYSBk
ZWRpY2F0ZWQgbWVtb3J5IHBvb2wgKGZvciBzbGljZS1vZi1oYXJkd2FyZSBWTXMpIGFuZAo+ID4g
ZWxpbWluYXRpb24gb2YgInN0cnVjdCBwYWdlIiAoZm9yIG9mZmxvYWQgc2V0dXBzIHdoZXJlIHVz
ZXJzcGFjZSBfbmV2ZXJfCj4gPiBuZWVkcyB0byBtbWFwKCkgZ3Vlc3QgbWVtb3J5KS4KPiAKPiBB
bGwgb2YgdGhlc2UgdXNlLWNhc2VzIGludm9sdmUgdXNpbmcgZ3Vlc3RfbWVtZmQgZm9yIHNoYXJl
ZCBwYWdlcywgYnV0Cj4gdGhpcyBlbnRpcmUgc2VyaWVzIHNldHMgdXAgS1ZNIHRvIG9ubHkgdXNl
IGd1ZXN0X21lbWZkIGZvciBwcml2YXRlCj4gcGFnZXMuCj4gCj4gRm9yIGV4YW1wbGUsIHRoZSBw
ZXItcGFnZSBhdHRyaWJ1dGVzIGFyZSBhIHByb3BlcnR5IG9mIGEgS1ZNIFZNLCBub3QgdGhlCj4g
dW5kZXJseWluZyBndWVzdF9tZW1mZC4gU28gdGhhdCBpbXBsaWVzIHdlIHdpbGwgbmVlZCBzZXBh
cmF0ZQo+IGd1ZXN0X21lbWZkcyBmb3IgcHJpdmF0ZSBhbmQgc2hhcmVkIHBhZ2VzLiBCdXQgYSBn
aXZlbiBtZW1zbG90IGNhbiBoYXZlCj4gYSBtaXggb2YgcHJpdmF0ZSBhbmQgc2hhcmVkIHBhZ2Vz
LiBTbyB0aGF0IGltcGxpZXMgYSBtZW1zbG90IHdpbGwgbmVlZAo+IHRvIHN1cHBvcnQgMiBndWVz
dF9tZW1mZHM/CgpZZXMsIHNvbWVkYXkgdGhpcyBtYXkgYmUgdHJ1ZS4gIEFsbG93aW5nIGd1ZXN0
X21lbWZkIChpdCB3YXMgcHJvYmFibHkgY2FsbGVkCnNvbWV0aGluZyBlbHNlIGF0IHRoYXQgcG9p
bnQpIGZvciAicmVndWxhciIgbWVtb3J5IHdhcyBkaXNjdXNzZWQgaW4gSSB0aGluayB2MTA/Cldl
IG1hZGUgYSBjb25jaW91cyBkZWNpc2lvbiB0byBkZWZlciBzdXBwb3J0aW5nIDIgZ3Vlc3RfbWVt
ZmRzIGJlY2F1c2UgaXQgaXNuJ3Qgc3RyaWN0bHkKbmVjZXNzYXJ5IHRvIHN1cHBvcnQgdGhlIFRE
WC9TTlAgdXNlIGNhc2VzIGZvciB3aGljaCBhbGwgb2YgdGhpcyB3YXMgaW5pdGlhbGx5CmRlc2ln
bmVkLCBhbmQgYWRkaW5nIGEgc2Vjb25kIGd1ZXN0X21lbWZkIGFuZCB0aGUgaW5mcmFzdHJ1Y3R1
cmUgbmVlZGVkIHRvIGxldAp1c2Vyc3BhY2UgbWFwIGEgZ3Vlc3RfbWVtZmQgY2FuIGJlIGRvbmUg
b24gdG9wIHdpdGggbWluaW1hbCBvdmVyaGVhZC4KCj4gQnV0IHRoZSBVQVBJIG9ubHkgYWxsb3dz
IDEgYW5kIHVzZXMgdGhlIEhWQSBmb3Igc2hhcmVkIG1hcHBpbmdzLgo+IAo+IE15IGluaXRpYWwg
cmVhY3Rpb24gYWZ0ZXIgcmVhZGluZyB0aHJvdWdoIHRoaXMgc2VyaWVzIGlzIHRoYXQgdGhlCj4g
cGVyLXBhZ2UgcHJpdmF0ZS9zaGFyZWQgc2hvdWxkIGJlIGEgcHJvcGVydHkgb2YgdGhlIGd1ZXN0
X21lbWZkLCBub3QgdGhlCj4gVk0uIE1heWJlIGl0IHdvdWxkIGV2ZW4gYmUgY2xlYW5lciBpbiB0
aGUgbG9uZy1ydW4gdG8gbWFrZSBhbGwgbWVtb3J5Cj4gYXR0cmlidXRlcyBhIHByb3BlcnR5IG9m
IHRoZSBndWVzdF9tZW1mZC4gVGhhdCB3YXkgd2UgY2FuIHNjb3BlIHRoZQo+IHN1cHBvcnQgdG8g
b25seSBndWVzdF9tZW1mZHMgYW5kIG5vdCBoYXZlIHRvIHdvcnJ5IGFib3V0IG1ha2luZyBwZXIt
cGFnZQo+IGF0dHJpYnV0ZXMgd29yayB3aXRoICJsZWdhY3kiIEhWQS1iYXNlZCBtZW1zbG90cy4K
Ck1ha2luZyB0aGUgcHJpdmF0ZSB2cy4gc2hhcmVkIHN0YXRlIGEgcHJvcGVydHkgb2YgdGhlIGd1
ZXN0X21lbWZkIGRvZXNuJ3Qgd29yawpmb3IgVERYIGFuZCBTTlAuICBXZSAodXBzdHJlYW0geDg2
IGFuZCBLVk0gbWFpbnRhaW5lcnMpIGhhdmUgdGFrZW4gYSBoYXJkIHN0YW5jZQp0aGF0IGluLXBs
YWNlIGNvbnZlcnNpb24gd2lsbCBub3QgYmUgYWxsb3dlZCBmb3IgVERYL1NOUCBkdWUgdG8gdGhl
IGVhc2Ugd2l0aAp3aGljaCBhIG1pc2JlaGF2aW5nIHVzZXJzcGFjZSBhbmQvb3IgZ3Vlc3QgY2Fu
IGNyYXNoIHRoZSBob3N0LgoKV2UnZCBhbHNvIGJlIGJldHRpbmcgdGhhdCB0aGVyZSB3b3VsZCAq
bmV2ZXIqIGJlIGEgdXNlIGNhc2UgZm9yIHBlci1nZm4gYXR0cmlidXRlcwpmb3Igbm9uLXN0YW5k
YXJkIG1lbW9yeSwgZS5nLiB2aXJ0aW8tZ3B1IGJ1ZmZlcnMsIGFueSBraW5kIG9mIGRldmljZSBt
ZW1vcnksIGV0Yy4KCldlJ2QgYWxzbyBlZmZlY3RpdmVseSBiZSBzaWduaW5nIHVwIHRvIGVpdGhl
ciBzdXBwb3J0IHN3YXAgYW5kIHBhZ2UgbWlncmF0aW9uIGluCmd1ZXN0X21lbWZkLCBvciBtYWtl
IHRob3NlIG11dHVhbGx5IGV4Y2x1c2l2ZSB3aXRoIHBlci1nZm4gYXR0cmlidXRlcyB0b28uCgpn
dWVzdF9tZW1mZCBpcyBvbmx5IGludGVuZGVkIGZvciBndWVzdCBEUkFNLCBhbmQgaWYgSSBnZXQg
bXkgd2F5LCB3aWxsIG5ldmVyIHN1cHBvcnQKc3dhcCAocGFnZSBtaWdyYXRpb24gaXMgbGVzcyBz
Y2FyeSkuICBJLmUuIGd1ZXN0X21lbWZkIGlzbid0IGludGVuZGVkIHRvIGJlIGEKb25lLXNpemUt
Zml0cy1hbGwgc29sdXRpb24sIG5vciBpcyBpdCBpbnRlbmRlZCB0byB3aG9sZXNhbGUgcmVwbGFj
ZSBtZW1zbG90cywKd2hpY2ggaXMgZWZmZWN0aXZlbHkgd2hhdCB3ZSdkIGJlIGRvaW5nIGJ5IGRl
cHJlY2F0aW5nIGh2YS1iYXNlZCBndWVzdCBtZW1vcnkuCgpBbmQgaWdub3JpbmcgYWxsIHRoYXQs
IHRoZSBBQkkgd291bGQgZW5kIHVwIGJlaW5nIHJhdGhlciBiaXphcnJlIGR1ZSB0byB3YXkgZ3Vl
c3RfbWVtZmQKaW50ZXJhY3RzIHdpdGggbWVtc2xvdHMuICBndWVzdF9tZW1mZCBpdHNlbGYgaGFz
IG5vIHJlYWwgbm90aW9uIG9mIGdmbnMsIGkuZS4gdGhlCnNoYXJlZCB2cy4gcHJpdmF0ZSBzdGF0
ZSB3b3VsZCBiZSB0aWVkIHRvIGEgZmlsZSBvZmZzZXQsIG5vdCBhIGdmbi4gIFRoYXQncyBhIHNv
bHZhYmxlCnByb2JsZW0sIGUuZy4gd2UgY291bGQgbWFrZSBhIGdmbjpvZmZzZXQgYmluZGluZyAi
c3RpY2t5IiwgYnV0IHRoYXQgd291bGQgZWRkIGV4dHJhCmNvbXBsZXhpdHkgdG8gdGhlIEFCSSwg
YW5kIEFGQUlDVCB3b3VsZG4ndCBidXkgdXMgdGhhdCBtdWNoLCBpZiBhbnl0aGluZy4KCj4gTWF5
YmUgY2FuIHlvdSBza2V0Y2ggb3V0IGhvdyB5b3Ugc2VlIHRoaXMgcHJvcG9zYWwgYmVpbmcgZXh0
ZW5zaWJsZSB0bwo+IHVzaW5nIGd1ZXN0X21lbWZkIGZvciBzaGFyZWQgbWFwcGluZ3M/CgpGb3Ig
aW4tcGxhY2UgY29udmVyc2lvbnMsIGUuZy4gcEtWTSwgbm8gYWRkaXRpb25hbCBndWVzdF9tZW1m
ZCBpcyBuZWVkZWQuICBXaGF0J3MKbWlzc2luZyB0aGVyZSBpcyB0aGUgYWJpbGl0eSB0byAoc2Fm
ZWx5KSBtbWFwKCkgZ3Vlc3RfbWVtZmQsIGUuZy4gS1ZNIG5lZWRzIHRvCmVuc3VyZSB0aGVyZSBh
cmUgbm8gb3V0c3RhbmRpbmcgcmVmZXJlbmNlcyB3aGVuIGNvbnZlcnRpbmcgYmFjayB0byBwcml2
YXRlLgoKRm9yIFREWC9TTlAsIGFzc3VtaW5nIHdlIGRvbid0IGZpbmQgYSBwZXJmb3JtYW50IGFu
ZCByb2J1c3Qgd2F5IHRvIGRvIGluLXBsYWNlCmNvbnZlcnNpb25zLCBhIHNlY29uZCBmZCtvZmZz
ZXQgcGFpciB3b3VsZCBiZSBuZWVkZWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
