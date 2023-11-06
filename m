Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECD2C4167D
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 16:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RLs/o9i7T1wHgNGuaGhh1J98xHnrP8uEsOZqH9TMZNY=; b=MVIuo2E0WfpGRTR3liHi2NIWiv
	KQ2EWRpnJvYJl1TWpv4A5NyQexW38AJL2xJj+eNvwGwJVOo0K+3ZRiJRT9d6XQ8+3tEOcLQiG9QTF
	J3iCwYWDINkUJWbHcaoX4GjjtvoNrKoNyGKrRLzvJ3tDv30mwpjcyC1oH1CeVA7gNL/cJyd3QPmtG
	edGV9UwUWFKn2FrTxI0eelnoJ27e9LUVKL1XUrWqyNxabWBJwDIdTZS3W9+9L1mQN4tYMuvvRkk5t
	hn/DbBDPfZ1u3vne2uPP3Lw5vXxzmLSwQWQvuNajy3unLycvD9T7Lr9ED0lUsfmEeBEp0nE76DBbI
	M5B+yV6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r025O-00H4Gd-2E;
	Mon, 06 Nov 2023 16:04:22 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r025M-00H4F8-2h
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 16:04:22 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5afa86b8d66so64245387b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 08:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699286659; x=1699891459; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBcfSXW+7b0RYZr/CwodaGuIC1t2rSK8z82L7NdJqdg=;
        b=tlBdXjZWfmc8YSzY2r2SDhRhTwISgiO2ReFzM7f5Ugg3eh8fXAbFhLjo6FB5f9Qvx5
         pxgb33fFTQsxNlO0JmghKz2xk4pcYBFAwSjU45l4VeZmK7RVu3eeC45cUzERwtjgyBw9
         WnlzZwSLg9YhcAdeJH8t8a2gQsXraJMuQ6CNcXfmrnsV9gGzPMCJ2vAG+x/TAaUXIjF8
         BVuPSOTj4qP1dMg2jFLg1td0y1NaW/BKIIZOWNKwro5h/WzOyydlX7vyoc6SJupdZS5M
         4Sv0k9S8pySYF071nNUxa8csWId9xUqlggtjVxFV9PkXi5uAY3+faO5OPEvxBPp4Vves
         5Awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699286659; x=1699891459;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vBcfSXW+7b0RYZr/CwodaGuIC1t2rSK8z82L7NdJqdg=;
        b=f15gkv4TsC9aKF9uaLsAYcfMN31akuQrP04uEz5EplgzA7sAzAPbfxKHIWBOROUyWl
         4wqbrMITflcbyopBumgwZ8LE6CSGY5vGOqr9svQl8KQt9vVWQfkgVM8BQ8GwDy3lhpVR
         PKDt1JVrgeSYqvAluHxDqV0O0tw2OUswmVlT3Cjdgv0g07OZPfuvjjtTuoF9ZAxStYiL
         wNT8bxAJbRiYfhjQHaFmhIdHKC+xm9DGnaSm2EeWVb2kIxvJYGxxhsi05wf6TG5JEiDv
         YzluhnvJbOeuriX+ov5qaXhd7tJSj32MbaCqBTEH/phK5vc4fgAKAAVw5B5u0Q2bCrTL
         MoAw==
X-Gm-Message-State: AOJu0Yy6tNkHP/GZQixnEmOM2G+dF7ibRjaH7rGTjEguLRQ5NTYojvMz
	ldR/U3qqyTGyu2OcpTeQLoFsnmbyFTo=
X-Google-Smtp-Source: AGHT+IG4M/eznhqFxpL/eWUumIXP2aANvxiOg95OzhM2lh4aiDVuodrpXWON7UbLhWxQPiRYqqCoKKt9NcE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:830d:0:b0:5a8:6162:b69 with SMTP id
 t13-20020a81830d000000b005a861620b69mr214046ywf.3.1699286659321; Mon, 06 Nov
 2023 08:04:19 -0800 (PST)
Date: Mon, 6 Nov 2023 08:04:17 -0800
In-Reply-To: <CA+EHjTxz-e_JKYTtEjjYJTXmpvizRXe8EUbhY2E7bwFjkkHVFw@mail.gmail.com>
Mime-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-28-pbonzini@redhat.com>
 <CA+EHjTxz-e_JKYTtEjjYJTXmpvizRXe8EUbhY2E7bwFjkkHVFw@mail.gmail.com>
Message-ID: <ZUkOgdTMbH40XFGE@google.com>
Subject: Re: [PATCH 27/34] KVM: selftests: Introduce VM "shape" to allow tests
 to specify the VM type
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
X-CRM114-CacheID: sfid-20231106_080420_874485_FEE6AB9D 
X-CRM114-Status: GOOD (  15.15  )
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
dGU6Cj4gPgo+ID4gRnJvbTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+
Cj4gPgo+ID4gQWRkIGEgInZtX3NoYXBlIiBzdHJ1Y3R1cmUgdG8gZW5jYXBzdWxhdGUgdGhlIHNl
bGZ0ZXN0cy1kZWZpbmVkICJtb2RlIiwKPiA+IGFsb25nIHdpdGggdGhlIEtWTS1kZWZpbmVkICJ0
eXBlIiBmb3IgdXNlIHdoZW4gY3JlYXRpbmcgYSBuZXcgVk0uICAibW9kZSIKPiA+IHRyYWNrcyBw
aHlzaWNhbCBhbmQgdmlydHVhbCBhZGRyZXNzIHByb3BlcnRpZXMsIGFzIHdlbGwgYXMgdGhlIHBy
ZWZlcnJlZAo+ID4gYmFja2luZyBtZW1vcnkgdHlwZSwgd2hpbGUgInR5cGUiIGNvcnJlc3BvbmRz
IHRvIHRoZSBWTSB0eXBlLgo+ID4KPiA+IFRha2luZyB0aGUgVk0gdHlwZSB3aWxsIGFsbG93IGFk
ZGluZyB0ZXN0cyBmb3IgS1ZNX0NSRUFURV9HVUVTVF9NRU1GRCwKPiA+IGEuay5hLiBndWVzdCBw
cml2YXRlIG1lbW9yeSwgd2l0aG91dCBuZWVkaW5nIGFuIGVudGlyZWx5IHNlcGFyYXRlIHNldCBv
Zgo+ID4gaGVscGVycy4gIEd1ZXN0IHByaXZhdGUgbWVtb3J5IGlzIGVmZmVjdGl2ZWx5IHVzYWJs
ZSBvbmx5IGJ5IGNvbmZpZGVudGlhbAo+ID4gVk0gdHlwZXMsIGFuZCBpdCdzIGV4cGVjdGVkIHRo
YXQgeDg2IHdpbGwgZG91YmxlIGRvd24gYW5kIHJlcXVpcmUgdW5pcXVlCj4gPiBWTSB0eXBlcyBm
b3IgVERYIGFuZCBTTlAgZ3Vlc3RzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0
b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgo+ID4gTWVzc2FnZS1JZDogPDIwMjMxMDI3MTgy
MjE3LjM2MTUyMTEtMzAtc2VhbmpjQGdvb2dsZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQYW9s
byBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgo+ID4gLS0tCj4gCj4gbml0OiBhcyBpbiBh
IHByaW9yIHNlbGZ0ZXN0IGNvbW1pdCBtZXNzYWdlcywgcmVmZXJlbmNlcyBpbiB0aGUgY29tbWl0
Cj4gbWVzc2FnZSB0byBndWVzdCBfcHJpdmF0ZV8gbWVtb3J5LiBTaG91bGQgdGhlc2UgYmUgY2hh
bmdlZCB0byBqdXN0Cj4gZ3Vlc3QgbWVtb3J5PwoKSG1tLCBubywgInByaXZhdGUiIGlzIG1vc3Rs
eSBhcHByb3ByaWF0ZSBoZXJlLiAgQXQgdGhpcyBwb2ludCBpbiB0aW1lLCBvbmx5IHg4NgpzdXBw
b3J0cyBLVk1fQ1JFQVRFX0dVRVNUX01FTUZELCBhbmQgeDg2IG9ubHkgc3VwcG9ydHMgaXQgZm9y
IHByaXZhdGUgbWVtb3J5LgpBbmQgdGhlIHB1cnBvc2Ugb2YgbGV0dGluZyB4ODYgc2VsZnRlc3Rz
IHNwZWNpZnkgS1ZNX1g4Nl9TV19QUk9URUNURURfVk0sIGkuZS4KdGhlIHJlYXNvbiB0aGlzIHBh
dGNoIGV4aXN0cywgaXMgcHVyZWx5IHRvIGdldCBwcml2YXRlIG1lbW9yeS4KCk1heWJlIHR3ZWFr
IHRoZSBzZWNvbmQgcGFyYWdyYXBoIHRvIHRoaXM/CgpUYWtpbmcgdGhlIFZNIHR5cGUgd2lsbCBh
bGxvdyBhZGRpbmcgdGVzdHMgZm9yIEtWTV9DUkVBVEVfR1VFU1RfTUVNRkQKd2l0aG91dCBuZWVk
aW5nIGFuIGVudGlyZWx5IHNlcGFyYXRlIHNldCBvZiBoZWxwZXJzLiAgQXQgdGhpcyB0aW1lLApn
dWVzdF9tZW1mZCBpcyBlZmZlY3RpdmVseSB1c2FibGUgb25seSBieSBjb25maWRlbnRpYWwgVk0g
dHlwZXMgaW4gdGhlCmZvcm0gb2YgZ3Vlc3QgcHJpdmF0ZSBtZW1vcnksIGFuZCBpdCdzIGV4cGVj
dGVkIHRoYXQgeDg2IHdpbGwgZG91YmxlIGRvd24KYW5kIHJlcXVpcmUgdW5pcXVlIFZNIHR5cGVz
IGZvciBURFggYW5kIFNOUCBndWVzdHMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
