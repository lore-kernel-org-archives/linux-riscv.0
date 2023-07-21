Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4C4C00528
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 17:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=o5Fp0pkDkvWzDsbDw8quGaMQJDwBiKx/d1CoTBG5JR8=; b=WzrQ++6Xo3C3uEMDPxWaCDLj0o
	OT40h0CWrYFkeFbMfYw4OQCtQalyJUrg7sHfL+eCTFi5tarRY9LpiB4iDrOZBIxrBqIuocKS1KUfN
	tRByjksJLFoV7T/uqWvMnF9Nm/uSvHdeXXvh+6SRNEfcwjF8QQVyJ48exyhoaTGWx8xKJZqoZG4WU
	mnK9KAK7ZMYOnncwerZ1xmo1mGPDK6m034e4u5lNw0ZU6nTIIFDsBpffsPBJRUw9ROrKL3K+uUxbM
	c3zubPknk/FMWyHN0A9U3QHBf5laNzApEWNk90uJaOY1iFwMVcHBzwq37KLVZOgLNYmQb+B8FD/r0
	KEQGiudA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMu9f-00Em6W-26;
	Fri, 21 Jul 2023 17:43:03 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMu9c-00Em5A-3C
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 17:43:02 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d00a63fcdefso1470335276.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 10:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689961380; x=1690566180;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7DBmD+NWofmGocm5Vnh+WkykM6ONviwwjpnheMJOIK8=;
        b=Kleh8QpsTsNUhesVcFKaorRemH2b7oCPrjs/EZvvDbSIhnU646cwazqZifDUNyxi+Q
         5JqV9CUAW8QaG2YIfQCin1qnHve1MgXICSxbyDPLV8MjQRP2Kpasi9pL5sbB8O7UYjBa
         jgRp3U3UDnkkD6e19TR7wMGjHPVEilwKuPvhlll1BPS6C8DVpWehyFU2WczctGneBM1v
         8h/JnmhFLy8tlfXVq6NzVrFmSK26MkEiOaRidvtVK6eqi9qhd/VP0gDfCAxADqhE52gi
         5Uc2vJ9HkSFyp91F1M5r9W96Us+3KtG0sWvhTTO0jFsQ1GbEx81tOU6Kjmmi3SIi/0Fk
         yy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689961380; x=1690566180;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7DBmD+NWofmGocm5Vnh+WkykM6ONviwwjpnheMJOIK8=;
        b=kIe++xNGOoqRP5BX3v5pZFF22goiwkVivxY7xNrPl4JB0qm4bW9b0hJ4d1eNUmUS9r
         8FQBfaLD8BnVlJQAAOjglCSA29K8vLBHoRDXlgMI1q0EPRjulZv1hgVXlzh1DJtkNSVn
         tcJjoA9EpftqPad2/QnWnI9RIYusU/bysQg+jfMHssgBBEDSpEuVj0sDkgo2pVmzi9CY
         FdvGrSPReMojbGwXTEEmDUNfydEx2xBpjDnt/ylUYq170Y2M2hfAB1i01A48Ohu07QEp
         8lKrA4oyk3n/N0TT72QxUVwFXu0+xnUAOcObclyfOFDOal55v0024usKYQYWpUpBzEbs
         qMcg==
X-Gm-Message-State: ABy/qLbid9zujYC8g5iJPezFaMp23UqF6KMkDSYLWx92QXSDRYbPDf2u
	g86iu9+1OSqoJI4lzdwxepFXKMt7yWg=
X-Google-Smtp-Source: APBJJlE/aF1pYHHKoAMy1+E4aY5+aL4FeQDb+p2ML0zhZVvr/Ah+OV80Lx1tRjSoeSb0qOhWhlHbRbztBVY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:10cd:b0:c1c:df23:44ee with SMTP id
 w13-20020a05690210cd00b00c1cdf2344eemr19665ybu.0.1689961379855; Fri, 21 Jul
 2023 10:42:59 -0700 (PDT)
Date: Fri, 21 Jul 2023 10:42:58 -0700
In-Reply-To: <29baac45-7736-a28c-3b2d-2a6e45171b8b@intel.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <fdc155f5-041b-a1b1-15aa-8f970180a13a@intel.com> <29baac45-7736-a28c-3b2d-2a6e45171b8b@intel.com>
Message-ID: <ZLrDopLH+3vN8rE6@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
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
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, Vlastimil Babka <vbabka@suse.cz>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_104301_026978_7622388B 
X-CRM114-Status: GOOD (  12.27  )
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

T24gRnJpLCBKdWwgMjEsIDIwMjMsIFhpYW95YW8gTGkgd3JvdGU6Cj4gT24gNy8yMS8yMDIzIDEx
OjA1IFBNLCBYaWFveWFvIExpIHdyb3RlOgo+ID4gT24gNy8xOS8yMDIzIDc6NDQgQU0sIFNlYW4g
Q2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4gPiA+IEBAIC02MjU1LDEyICs2Mjk4LDE3IEBAIGludCBr
dm1faW5pdCh1bnNpZ25lZCB2Y3B1X3NpemUsIHVuc2lnbmVkCj4gPiA+IHZjcHVfYWxpZ24sIHN0
cnVjdCBtb2R1bGUgKm1vZHVsZSkKPiA+ID4gwqDCoMKgwqDCoCBpZiAocikKPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgIGdvdG8gZXJyX2FzeW5jX3BmOwo+ID4gPiArwqDCoMKgIHIgPSBrdm1fZ21l
bV9pbml0KCk7Cj4gPiA+ICvCoMKgwqAgaWYgKHIpCj4gPiA+ICvCoMKgwqDCoMKgwqDCoCBnb3Rv
IGVycl9nbWVtOwo+ID4gPiArCj4gPiA+IMKgwqDCoMKgwqAga3ZtX2NoYXJkZXZfb3BzLm93bmVy
ID0gbW9kdWxlOwo+ID4gPiDCoMKgwqDCoMKgIGt2bV9wcmVlbXB0X29wcy5zY2hlZF9pbiA9IGt2
bV9zY2hlZF9pbjsKPiA+ID4gwqDCoMKgwqDCoCBrdm1fcHJlZW1wdF9vcHMuc2NoZWRfb3V0ID0g
a3ZtX3NjaGVkX291dDsKPiA+ID4gwqDCoMKgwqDCoCBrdm1faW5pdF9kZWJ1ZygpOwo+ID4gPiAr
wqDCoMKgIGt2bV9nbWVtX2luaXQoKTsKPiA+IAo+ID4gd2h5IGt2bV9nbWVtX2luaXQoKSBuZWVk
cyB0byBiZSBjYWxsZWQgYWdhaW4/IGJ5IG1pc3Rha2U/Cj4gCj4gSSdtIHN1cmUgaXQncyBhIG1p
c3Rha2UuCgpZZWFoLCBkZWZpbml0ZWx5IGEgYnVnLgoKPiBJJ20gdGVzdGluZyB0aGUgZ21lbSBR
RU1VIHdpdGggdGhpcyBzZXJpZXMuIFNXX1BST1RFQ1RFRF9WTSBnZXRzIHN0dWNrIGluIGEKPiBs
b29wIGluIGVhcmx5IE9WTUYgY29kZSBkdWUgdG8gdHdvIHNoYXJlZCBwYWdlIG9mIE9WTUYgZ2V0
IHphcHBlZCBhbmQKPiByZS1tYXBwZWQgaW5maW5pdGVseS4gUmVtb3ZpbmcgdGhlIHNlY29uZCBj
YWxsIG9mIGt2bV9nbWVtX2luaXQoKSBjYW4gc29sdmUKPiB0aGUgaXNzdWUsIHRob3VnaCBJJ20g
bm90IHN1cmUgYWJvdXQgdGhlIHJlYXNvbi4KCk5vdCB3b3J0aCBpbnZlc3RpZ2F0aW5nIHVubGVz
cyB5b3Ugd2FudCB0byBzYXRpYXRlIHlvdXIgY3VyaW9zaXR5IDotKQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
