Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEC0C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 13:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KY7yhNNkDkpamlpvHrLkZmOuRG8pKPe8Y56PJS08CDE=; b=BIzy9/mXrHZ5aw
	Qz1h7DIIyMT7BSMosmFjlUhx4VHX0wXt6+g5U5MXdd8+9MSd8qxwGq8DHDPhxr00QMrNFXqKqqGuc
	jnL82JkIwId8wfjAmfjzm4/FL/rc1UY/heHH8guYCXN8wH6HZZsg7QTnYaRd2cibNLjjynRNqYb1P
	LXTWCiY+rTZlb2PE+r5ImIacMnH9AK1QNiodYK5jZgqal9/40VgR+7GQDZd+FnDGWAqwEO/aw+JUj
	tYOrWFM4ataMByOIsXQCiars2snQTX76mWTROtj9o2LPN1BV9TUEhW1yGhYYosDspNK4tq7UjRMR/
	yvAFUAdmCRykgupcatFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyY8D-009ZgR-2c;
	Thu, 02 Nov 2023 13:53:09 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyY8A-009Ze4-2X
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 13:53:09 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-66d0169cf43so5726316d6.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 06:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698933181; x=1699537981; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MiH+OD80Lz6N2WkoQWVzzSH5wdFrVwABmyWNvMjndg=;
        b=QacR+Q6rJLvYhf7a/MMYIHcS4ztDxcGTDq6/5fIgrB35XuWDpdQvkNy2yse3CVC8OV
         KtVnVFqSq5buxSyzbPPwMT/MuOii3sd93Nly0IU3KgnMwJtyy2vm5o+AAEk3trnFQY1w
         2IXNZYTwuz7ojWE0ZgUXsSG1Dgan9NtOOhdl2+Xw8xmATsUCnJMW0cULcRaX2uUS2dYb
         C72cyhYMPg79s5MykoBI664RPEATh2i1La0fHoPvRMZaRYQvcsYS3M2KNbM7lulVpBo7
         AYgWfGzY5PBQOxVX5dqcG5siWueq/KRdflDB4rOtCUO3rt01ffBC0WbW5UkLumv9mXEX
         dmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698933181; x=1699537981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MiH+OD80Lz6N2WkoQWVzzSH5wdFrVwABmyWNvMjndg=;
        b=mCRSWW/PgO01yZGZDrWwhC8fGo+okaJ3/Gj0l6PjZ93kzjQ+hj4WSJ/NGntPKKDHZS
         n4vDtJAi7+WxpQk1ARixxW9znYKBH+07r7hB62+fX+FLTC4huGkyY+4GqySPx5OPicth
         Q4J8h1vgIqHYBG8NmpDl39c+prgJ6FD9I80CNojy8EHTZKYe1t8pK77abaKUJLapWtXr
         GVf8DoXeStE84X4wo+F/Mvedhy3Os7y0hoko791wS78ZOCobmzwuO5VQ873/DkEptmN2
         jo2yhpnL1Cy4a9/ue2A7VytV1i1na6rtSwbyL3OLWUq6QYLac3dn7H6x3FSSKdAJnE0R
         jwsg==
X-Gm-Message-State: AOJu0Yz9Ib5+nGFMPI/VPVoOjkHFo1Bia65G2bTZgrXSwhrOUlaH5pFQ
	mC931I/1foh9G0fiv2hxZZoA0fWvS4u9K845y5f5dA==
X-Google-Smtp-Source: AGHT+IHABEQi7q2gF4GYbu+6KWyVOhp4LTc7vcuWRR/ds6omy7P2Nr93O+4ItCwG4g8ZUZhgbGUZVOPe8u3aj0mVGQs=
X-Received: by 2002:ad4:5761:0:b0:672:4e8c:9aa5 with SMTP id
 r1-20020ad45761000000b006724e8c9aa5mr14682447qvx.47.1698933180583; Thu, 02
 Nov 2023 06:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <CA+EHjTzj4drYKONVOLP19DYpJ4O8kSXcFzw2AKier1QdcFKx_Q@mail.gmail.com>
 <ZUF8A5KpwpA6IKUH@google.com> <CA+EHjTwTT9cFzYTtwT43nLJS01Sgt0NqzUgKAnfo2fiV3tEvXg@mail.gmail.com>
 <ZULJYg5cf1UrNq3e@google.com>
In-Reply-To: <ZULJYg5cf1UrNq3e@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 2 Nov 2023 13:52:23 +0000
Message-ID: <CA+EHjTzGzXnfXHh0m5iHt9m3BxerkUS56EVPDA_az6n2FRnk3w@mail.gmail.com>
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
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_065306_826610_3980BEA6 
X-CRM114-Status: GOOD (  42.21  )
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

T24gV2VkLCBOb3YgMSwgMjAyMyBhdCA5OjU14oCvUE0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMDEsIDIwMjMsIEZ1YWQgVGFi
YmEgd3JvdGU6Cj4gPiA+ID4gPiBAQCAtMTAzNCw2ICsxMDM0LDkgQEAgc3RhdGljIHZvaWQga3Zt
X2Rlc3Ryb3lfZGlydHlfYml0bWFwKHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKm1lbXNsb3QpCj4g
PiA+ID4gPiAgLyogVGhpcyBkb2VzIG5vdCByZW1vdmUgdGhlIHNsb3QgZnJvbSBzdHJ1Y3Qga3Zt
X21lbXNsb3RzIGRhdGEgc3RydWN0dXJlcyAqLwo+ID4gPiA+ID4gIHN0YXRpYyB2b2lkIGt2bV9m
cmVlX21lbXNsb3Qoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90
KQo+ID4gPiA+ID4gIHsKPiA+ID4gPiA+ICsgICAgICAgaWYgKHNsb3QtPmZsYWdzICYgS1ZNX01F
TV9QUklWQVRFKQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGt2bV9nbWVtX3VuYmluZChzbG90
KTsKPiA+ID4gPiA+ICsKPiA+ID4gPgo+ID4gPiA+IFNob3VsZCB0aGlzIGJlIGNhbGxlZCBhZnRl
ciBrdm1fYXJjaF9mcmVlX21lbXNsb3QoKT8gQXJjaC1zcGVjaWZpYyBvZGUKPiA+ID4gPiBtaWdo
dCBuZWVkIHNvbWUgb2YgdGhlIGRhdGEgYmVmb3JlIHRoZSB1bmJpbmRpbmcsIHNvbWV0aGluZyBJ
IHRob3VnaHQKPiA+ID4gPiBtaWdodCBiZSBuZWNlc3NhcnkgYXQgb25lIHBvaW50IGZvciB0aGUg
cEtWTSBwb3J0IHdoZW4gZGVsZXRpbmcgYQo+ID4gPiA+IG1lbXNsb3QsIGJ1dCByZWFsaXplZCBs
YXRlciB0aGF0IGt2bV9pbnZhbGlkYXRlX21lbXNsb3QoKSAtPgo+ID4gPiA+IGt2bV9hcmNoX2d1
ZXN0X21lbW9yeV9yZWNsYWltZWQoKSB3YXMgdGhlIG1vcmUgbG9naWNhbCBwbGFjZSBmb3IgaXQu
Cj4gPiA+ID4gQWxzbywgc2luY2UgdGhhdCBzZWVtcyB0byBiZSB0aGUgcGF0dGVybiBmb3IgYXJj
aC1zcGVjaWZpYyBoYW5kbGVycyBpbgo+ID4gPiA+IEtWTS4KPiA+ID4KPiA+ID4gTWF5YmU/ICBC
dXQgb25seSBpZiB3ZSBjYW4gYWJvdXQgc3ltbWV0cnkgYmV0d2VlbiB0aGUgYWxsb2NhdGlvbiBh
bmQgZnJlZSBwYXRocwo+ID4gPiBJIHJlYWxseSBkb24ndCB0aGluayBrdm1fYXJjaF9mcmVlX21l
bXNsb3QoKSBzaG91bGQgYmUgZG9pbmcgYW55dGhpbmcgYmV5b25kIGEKPiA+ID4gInB1cmUiIGZy
ZWUuICBFLmcuIGt2bV9hcmNoX2ZyZWVfbWVtc2xvdCgpIGlzIGFsc28gY2FsbGVkIGFmdGVyIG1v
dmluZyBhIG1lbXNsb3QsCj4gPiA+IHdoaWNoIGhvcGVmdWxseSB3ZSBuZXZlciBhY3R1YWxseSBo
YXZlIHRvIGFsbG93IGZvciBndWVzdF9tZW1mZCwgYnV0IGFueSBjb2RlIGluCj4gPiA+IGt2bV9h
cmNoX2ZyZWVfbWVtc2xvdCgpIHdvdWxkIGJyaW5nIGFib3V0ICJ3aGF0IGlmIiBxdWVzdGlvbnMg
cmVnYXJkaW5nIG1lbXNsb3QKPiA+ID4gbW92ZW1lbnQuICBJLmUuIHRoZSBBUEkgaXMgaW50ZW5k
ZWQgdG8gYmUgYSAiZnJlZSBhcmNoIG1ldGFkYXRhIGFzc29jaWF0ZWQgd2l0aAo+ID4gPiB0aGUg
bWVtc2xvdCIuCj4gPiA+Cj4gPiA+IE91dCBvZiBjdXJpb3NpdHksIHdoYXQgZG9lcyBwS1ZNIG5l
ZWQgdG8gZG8gYXQga3ZtX2FyY2hfZ3Vlc3RfbWVtb3J5X3JlY2xhaW1lZCgpPwo+ID4KPiA+IEl0
J3MgYWJvdXQgdGhlIGhvc3QgcmVjbGFpbWluZyBvd25lcnNoaXAgb2YgZ3Vlc3QgbWVtb3J5IHdo
ZW4gdGVhcmluZwo+ID4gZG93biBhIHByb3RlY3RlZCBndWVzdC4gSW4gcEtWTSwgd2UgY3VycmVu
dGx5IHRlYXJkb3duIHRoZSBndWVzdCBhbmQKPiA+IHJlY2xhaW0gaXRzIG1lbW9yeSB3aGVuIGt2
bV9hcmNoX2Rlc3Ryb3lfdm0oKSBpcyBjYWxsZWQuIFRoZSBwcm9ibGVtCj4gPiB3aXRoIGd1ZXN0
bWVtIGlzIHRoYXQga3ZtX2dtZW1fdW5iaW5kKCkgY291bGQgZ2V0IGNhbGxlZCBiZWZvcmUgdGhh
dAo+ID4gaGFwcGVucywgYWZ0ZXIgd2hpY2ggdGhlIGhvc3QgbWlnaHQgdHJ5IHRvIGFjY2VzcyB0
aGUgdW5ib3VuZCBndWVzdAo+ID4gbWVtb3J5LiBTaW5jZSB0aGUgaG9zdCBoYXNuJ3QgcmVjbGFp
bWVkIG93bmVyc2hpcCBvZiB0aGUgZ3Vlc3QgbWVtb3J5Cj4gPiBmcm9tIGh5cCwgaGlsYXJpdHkg
ZW5zdWVzIChpdCBjcmFzaGVzKS4KPiA+Cj4gPiBJbml0aWFsbHksIEkgaG9va2VkIHJlY2xhaW0g
Z3Vlc3QgbWVtb3J5IHRvIGt2bV9mcmVlX21lbXNsb3QoKSwgYnV0Cj4gPiB0aGVuIEkgbmVlZGVk
IHRvIG1vdmUgdGhlIHVuYmluZCBsYXRlciBpbiB0aGUgZnVuY3Rpb24uIEkgcmVhbGl6ZWQKPiA+
IGxhdGVyIHRoYXQga3ZtX2FyY2hfZ3Vlc3RfbWVtb3J5X3JlY2xhaW1lZCgpIGdldHMgY2FsbGVk
IGVhcmxpZXIgKGF0Cj4gPiB0aGUgcmlnaHQgdGltZSksIGFuZCBpcyBtb3JlIGFwdGx5IG5hbWVk
Lgo+Cj4gQWhhISAgSSBzdXNwZWN0ZWQgdGhhdCBtaWdodCBiZSB0aGUgY2FzZS4KPgo+IFREWCBh
bmQgU05QIGFsc28gbmVlZCB0byBzb2x2ZSB0aGUgc2FtZSBwcm9ibGVtIG9mICJyZWNsYWltaW5n
IiBtZW1vcnkgYmVmb3JlIGl0Cj4gY2FuIGJlIHNhZmVseSBhY2Nlc3NlZCBieSB0aGUgaG9zdC4g
IFRoZSBwbGFuIGlzIHRvIGFkZCBhbiBhcmNoIGhvb2sgKG9yIHR3bz8pCj4gaW50byBndWVzdF9t
ZW1mZCB0aGF0IGlzIGludm9rZWQgd2hlbiBtZW1vcnkgaXMgZnJlZWQgZnJvbSBndWVzdF9tZW1m
ZC4KPgo+IEhvb2tpbmcga3ZtX2FyY2hfZ3Vlc3RfbWVtb3J5X3JlY2xhaW1lZCgpIGlzbid0IGNv
bXBsZXRlbHkgY29ycmVjdCBhcyBkZWxldGluZyBhCj4gbWVtc2xvdCBkb2Vzbid0ICpndWFyYW50
ZWUqIHRoYXQgZ3Vlc3QgbWVtb3J5IGlzIGFjdHVhbGx5IHJlY2xhaW1lZCAod2hpY2ggcmVtaW5k
cwo+IG1lLCB3ZSBuZWVkIHRvIGZpZ3VyZSBvdXQgYSBiZXR0ZXIgbmFtZSBmb3IgdGhhdCB0aGlu
ZyBiZWZvcmUgaW50cm9kdWNpbmcKPiBrdm1fYXJjaF9nbWVtX2ludmFsaWRhdGUoKSkuCgpJIHNl
ZS4gSSdkIGFzc3VtZWQgdGhhdCB0aGF0IHdhcyB3aGF0IHlvdSdyZSB1c2luZy4gSSBhZ3JlZSB0
aGF0IGl0J3MKbm90IGNvbXBsZXRlbHkgY29ycmVjdCwgc28gZm9yIHRoZSBtb21lbnQsIEkgYXNz
dW1lIHRoYXQgaWYgdGhhdApoYXBwZW5zIHdlIGhhdmUgYSBtaXNiZWhhdmluZyBob3N0LCB0ZWFy
ZG93biB0aGUgZ3Vlc3QgYW5kIHJlY2xhaW0gaXRzCm1lbW9yeS4KCj4gVGhlIGVmZmVjdGl2ZSBm
YWxzZSBwb3NpdGl2ZXMgYXJlbid0IGZhdGFsIGZvciB0aGUgY3VycmVudCB1c2FnZSBiZWNhdXNl
IHRoZSBob29rCj4gaXMgdXNlZCBvbmx5IGZvciB4ODYgU0VWIGd1ZXN0cyB0byBmbHVzaCBjYWNo
ZXMuICBBbiB1bm5lY2Vzc2FyeSBmbHVzaCBjYW4gY2F1c2UKPiBwZXJmb3JtYW5jZSBpc3N1ZXMs
IGJ1dCBpdCBkb2Vzbid0IGFmZmVjdCBjb3JyZWN0bmVzcy4gRm9yIFREWCBhbmQgU05QLCBhbmQg
SUlVQwo+IHBLVk0sIGZhbHNlIHBvc2l0aXZlcyBhcmUgZmF0YWwgYmVjYXVzZSBLVk0gY291bGQg
YXNzaWduIG1lbW9yeSBiYWNrIHRvIHRoZSBob3N0Cj4gdGhhdCBpcyBzdGlsbCBvd25lZCBieSBn
dWVzdF9tZW1mZC4KCll1cC4KCj4gRS5nLiBhIG1pc2JlaGF2aW5nIHVzZXJzcGFjZSBjb3VsZCBw
cmVtYXR1cmVseSBkZWxldGUgYSBtZW1zbG90LiAgQW5kIHRoZSBtb3JlCj4gZnVuIGV4YW1wbGUg
aXMgaW50cmFob3N0IG1pZ3JhdGlvbiwgd2hlcmUgdGhlIHBsYW4gaXMgdG8gYWxsb3cgcG9pbnRp
bmcgbXVsdGlwbGUKPiBndWVzdF9tZW1mZCBmaWxlcyBhdCBhIHNpbmdsZSBndWVzdF9tZW1mZCBp
bm9kZToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvY292ZXIuMTY5MTQ0Njk0Ni5naXQu
YWNrZXJsZXl0bmdAZ29vZ2xlLmNvbQo+Cj4gVGhlcmUgd2FzIGEgbG90IG9mIGRpc2N1c3Npb24g
Zm9yIHRoaXMsIGJ1dCBpdCdzIHNjYXR0ZXJlZCBhbGwgb3ZlciB0aGUgcGxhY2UuCj4gVGhlIFRM
O0RSIGlzIGlzIHRoYXQgdGhlIGlub2RlIHdpbGwgcmVwcmVzZW50IHBoeXNpY2FsIG1lbW9yeSwg
YW5kIGEgZmlsZSB3aWxsCj4gcmVwcmVzZW50IGEgZ2l2ZW4gInN0cnVjdCBrdm0iIGluc3RhbmNl
J3MgdmlldyBvZiB0aGF0IG1lbW9yeS4gIEFuZCBzbyB0aGUgbWVtb3J5Cj4gaXNuJ3QgcmVjbGFp
bWVkIHVudGlsIHRoZSBpbm9kZSBpcyB0cnVuY2F0ZWQvcHVuY2hlZC4KPgo+IEkgX3RoaW5rXyB0
aGlzIHJlZmxlY3RzIHRoZSBtb3N0IHJlY2VudCBwbGFuIGZyb20gdGhlIGd1ZXN0X21lbWZkIHNp
ZGU6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzEyMzNkNzQ5MjExYzA4ZDUxZjljYTVk
NDI3OTM4ZDQ3ZjAwOGFmMWYuMTY4OTg5MzQwMy5naXQuaXNha3UueWFtYWhhdGFAaW50ZWwuY29t
CgpUaGFua3MgZm9yIHBvaW50aW5nIHRoYXQgb3V0LiBJIHRoaW5rIHRoaXMgbWlnaHQgYmUgdGhl
IHdheSB0byBnby4KSSdsbCBoYXZlIGEgY2xvc2VyIGxvb2sgYXQgdGhpcyBhbmQgc2VlIGhvdyB0
byBnZXQgaXQgdG8gd29yayB3aXRoCnBLVk0uCgpDaGVlcnMsCi9mdWFkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
