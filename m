Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89970C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TSR3/31rjNVOOeANY311RaZwSjyiAZxiZUHls9UjcsI=; b=Jfk0LSlJPvqfm0
	Fh5HKBic6J02irTUmZBzKpTOmzl2+ZHLmoI8q5scgHfvaWU1oke+zPdv5frlGg6YurHCIaJX6MmMY
	EMZgbX7iTwX8rFk5uR/uGP7P1iwR7ooIGdyEVEfaoaLehS+zrclqF8+PTDM3UaP5y16cqKuwGv2uc
	vEr52s4NIHAJVWUoxRY1nhOl25Y8XNxxbREpmhzKUSdNwDXTylVuDH37KoddYTMXnM+TQS34fdHnr
	A+o6VVbLH4eM3DqHkg3f3Qvn1WOQq5JssHhTjYCRlSQCLLZnNb38emTs3gKJkW61J7Em5ZgCtbiHy
	r33JgUmBjMVR0oeBg/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyaZ4-009rYe-1B;
	Thu, 02 Nov 2023 16:29:02 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyaZ2-009rWe-0x
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 16:29:01 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4083f613272so10102475e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 09:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698942533; x=1699547333; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20owt2l3/cxGLzLA2xbevoL+xSQuNASMB596X3+ow7c=;
        b=ZPNHJEyqtqVWZIzb2lGzfFvTTfPmkrnjZ6xTIdoGoR1VXSmV3tRCwcv8OzmwNvYxz7
         FgCqGno3+G6Qh5IozfO4e98s+lbWxAMzaF9wmyrN6Br/vAfBripHDNgAqZOf7R9lJ+rA
         atMkPwksUmhevjJpZkgz+edIuK35kzahucFGB/O6/p4xH7Mf2RItLcIrtyOSB1ZSxPpj
         4K14c1B4IjkWvtYrPHIrt8D1zSsLAKbKfbzoqKYkKUxrRFhJFB0cRJfDS2x3FVXarHrn
         RNgqWatl5v53q5F+auLjg9b28gbG3lyMeWIYd36574K0wpQfgbRwRzufCA/DPYAJVwFN
         7j+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698942533; x=1699547333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20owt2l3/cxGLzLA2xbevoL+xSQuNASMB596X3+ow7c=;
        b=A6rL2ii221VrMXfte84oph94gqob+yBQXyHOlQfiD+z5WI6DpEFC/gkOXlVdLRj80y
         QNBlGdZLU4jg6jQvlzggK3tn9fZE8xtlv6Ovfd9U32DA09QiSaGgYIWma6T7Boum5sP8
         MM8lQdtNHrmBWYjVS10pxTzsvryZDBESygasrrqq8HlUCdDySZggGB1MGapnOAcOPuw3
         PI/TyhuTwqK09WO4KUCOmTRBxkrpuquODeYrf5qdrukgjbltGdTu1zWgZUMASi4pqxbf
         Ko3Ar2DWgfPUXd7sySbfb9AgA/hq8xp8y2a+NduPE1VbaPVtGkTfi6wYC4tmUcxjHbHv
         PUxQ==
X-Gm-Message-State: AOJu0YyJFJ25QQdame4524JXxKjZ5S+f8oMeuu14IlZIDwT2zZ9ESHa7
	iJ30kzp1PNzcCS1IQ1qocOYq2X8zHQ80fi85PgT5NQ==
X-Google-Smtp-Source: AGHT+IGzC+UPQWsYSxEKly7WToGYHThIxdsAXI0NVkPIoloyom3O4LGBjzNagfuu2dI4j91jKOVPOWF7c1N4gZ20sPc=
X-Received: by 2002:a5d:4b51:0:b0:32d:8e54:29f6 with SMTP id
 w17-20020a5d4b51000000b0032d8e5429f6mr14415276wrs.47.1698942532901; Thu, 02
 Nov 2023 09:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <ZUFGRyQEuWj4RJS0@google.com> <ZUFzZf-YmCRYP6qo@google.com>
 <CALzav=d9eXZfK=op7A=UftbpuPpUbxqV6CmkqqxxBNuNsUU4nw@mail.gmail.com>
 <6642c379-1023-4716-904f-4bbf076744c2@redhat.com> <ZUPIXt1XzZrriswG@google.com>
In-Reply-To: <ZUPIXt1XzZrriswG@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 2 Nov 2023 09:28:23 -0700
Message-ID: <CALzav=eaVc5rzmHwnQr7aotyTKi9Agdte7NAL0NvBeE+f6zYoA@mail.gmail.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To: Sean Christopherson <seanjc@google.com>
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
	Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_092900_337613_CAE105AE 
X-CRM114-Status: GOOD (  26.93  )
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

T24gVGh1LCBOb3YgMiwgMjAyMyBhdCA5OjAz4oCvQU0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBOb3YgMDIsIDIwMjMsIFBhb2xvIEJv
bnppbmkgd3JvdGU6Cj4gPiBPbiAxMC8zMS8yMyAyMzozOSwgRGF2aWQgTWF0bGFjayB3cm90ZToK
PiA+ID4gPiA+IE1heWJlIGNhbiB5b3Ugc2tldGNoIG91dCBob3cgeW91IHNlZSB0aGlzIHByb3Bv
c2FsIGJlaW5nIGV4dGVuc2libGUgdG8KPiA+ID4gPiA+IHVzaW5nIGd1ZXN0X21lbWZkIGZvciBz
aGFyZWQgbWFwcGluZ3M/Cj4gPiA+ID4gRm9yIGluLXBsYWNlIGNvbnZlcnNpb25zLCBlLmcuIHBL
Vk0sIG5vIGFkZGl0aW9uYWwgZ3Vlc3RfbWVtZmQgaXMgbmVlZGVkLiAgV2hhdCdzCj4gPiA+ID4g
bWlzc2luZyB0aGVyZSBpcyB0aGUgYWJpbGl0eSB0byAoc2FmZWx5KSBtbWFwKCkgZ3Vlc3RfbWVt
ZmQsIGUuZy4gS1ZNIG5lZWRzIHRvCj4gPiA+ID4gZW5zdXJlIHRoZXJlIGFyZSBubyBvdXRzdGFu
ZGluZyByZWZlcmVuY2VzIHdoZW4gY29udmVydGluZyBiYWNrIHRvIHByaXZhdGUuCj4gPiA+ID4K
PiA+ID4gPiBGb3IgVERYL1NOUCwgYXNzdW1pbmcgd2UgZG9uJ3QgZmluZCBhIHBlcmZvcm1hbnQg
YW5kIHJvYnVzdCB3YXkgdG8gZG8gaW4tcGxhY2UKPiA+ID4gPiBjb252ZXJzaW9ucywgYSBzZWNv
bmQgZmQrb2Zmc2V0IHBhaXIgd291bGQgYmUgbmVlZGVkLgo+ID4gPiBJcyB0aGVyZSBhIHdheSB0
byBzdXBwb3J0IG5vbi1pbi1wbGFjZSBjb252ZXJzaW9ucyB3aXRoaW4gYSBzaW5nbGUgZ3Vlc3Rf
bWVtZmQ/Cj4gPgo+ID4gRm9yIFREWC9TTlAsIHlvdSBjb3VsZCBoYXZlIGEgaG9vayBmcm9tIEtW
TV9TRVRfTUVNT1JZX0FUVFJJQlVURVMgdG8gZ3Vlc3QKPiA+IG1lbW9yeS4gIFRoZSBob29rIHdv
dWxkIGludmFsaWRhdGUgbm93LXByaXZhdGUgcGFydHMgaWYgdGhleSBoYXZlIGEgVk1BLAo+ID4g
Y2F1c2luZyBhIFNJR1NFR1YvRUZBVUxUIGlmIHRoZSBob3N0IHRvdWNoZXMgdGhlbS4KPiA+Cj4g
PiBJdCB3b3VsZCBmb3JiaWQgbWFwcGluZ3MgZnJvbSBtdWx0aXBsZSBnZm5zIHRvIGEgc2luZ2xl
IG9mZnNldCBvZiB0aGUKPiA+IGd1ZXN0X21lbWZkLCBiZWNhdXNlIHRoZW4gdGhlIHNoYXJlZCB2
cy4gcHJpdmF0ZSBhdHRyaWJ1dGUgd291bGQgYmUgdGllZCB0bwo+ID4gdGhlIG9mZnNldC4gIFRo
aXMgc2hvdWxkIG5vdCBiZSBhIHByb2JsZW07IGZvciBleGFtcGxlLCBpbiB0aGUgY2FzZSBvZiBT
TlAsCj4gPiB0aGUgUk1QIGFscmVhZHkgcmVxdWlyZXMgYSBzaW5nbGUgbWFwcGluZyBmcm9tIGhv
c3QgcGh5c2ljYWwgYWRkcmVzcyB0bwo+ID4gZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzcy4KPgo+IEkg
ZG9uJ3Qgc2VlIGhvdyB0aGlzIGNhbiB3b3JrLiAgSXQncyBub3QgYSBNOjEgc2NlbmFyaW8gKHdo
ZXJlIE0gaXMgbXVsdGlwbGUgZ2ZucyksCj4gaXQncyBhIDE6TiBzY2VuYXJpbyAod2hlcmVuIE4g
aXMgbXVsdGlwbGUgb2Zmc2V0cykuICBUaGUgKmdmbiogZG9lc24ndCBjaGFuZ2Ugb24KPiBhIGNv
bnZlcnNpb24sIHdoYXQgbmVlZHMgdG8gY2hhbmdlIHRvIGRvIG5vbi1pbi1wbGFjZSBjb252ZXJz
aW9uIGlzIHRoZSBwZm4sIHdoaWNoCj4gaXMgZWZmZWN0aXZlbHkgdGhlIGd1ZXN0X21lbWZkK29m
ZnNldCBwYWlyLgo+Cj4gU28geWVzLCB3ZSAqY291bGQqIHN1cHBvcnQgbm9uLWluLXBsYWNlIGNv
bnZlcnNpb25zIHdpdGhpbiBhIHNpbmdsZSBndWVzdF9tZW1mZCwKPiBidXQgaXQgd291bGQgcmVx
dWlyZSBhIHNlY29uZCBvZmZzZXQsCgpXaHkgY2FuJ3QgS1ZNIGZyZWUgdGhlIGV4aXN0aW5nIHBh
Z2UgYXQgZ3Vlc3RfbWVtZmQrb2Zmc2V0IGFuZAphbGxvY2F0ZSBhIG5ldyBvbmUgd2hlbiBkb2lu
ZyBub24taW4tcGxhY2UgY29udmVyc2lvbnM/Cgo+IGF0IHdoaWNoIHBvaW50IGl0IG1ha2VzIHNl
bnNlIHRvIGFkZCBhCj4gc2Vjb25kIGZpbGUgZGVzY3JpcHRvciBhcyB3ZWxsLiAgVXNlcnNwYWNl
IGNvdWxkIHN0aWxsIHVzZSBhIHNpbmdsZSBndWVzdF9tZW1mZAo+IGluc3RhbmNlLCBpLmUuIHBh
c3MgaW4gdGhlIHNhbWUgZmlsZSBkZXNjcmlwdG9yIGJ1dCBkaWZmZXJlbnQgb2Zmc2V0cy4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
