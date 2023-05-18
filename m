Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F3EC77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 08:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3U6pJvwfAeQx4jfsN5OI0nFHv715Wwr2fWhThjVMFE=; b=ff/q2LFirdUB8B
	Ohnb0v2Alf2dDFVifsVhrzkm53rf5uvKGKYevfl4KgLQmuQTJ/sEwHImU8cxtTgyZL+TUjEEcYSW4
	BT09CIZMzV/Ri46M91FKyBR+bmbqD46B9hxOj9YS0RAn/QWdNYzGrU8216bWDu/DvzbMJyOJJ3Eii
	6kxMfcfMU3oNTJ+pWwxLCmwQsl3dVSs8KN/amxV8586qLHp2veDix4CQZaYXzPjGX7Y0e95p+V6P4
	sn9wgqfiFFJpYPujfG0VCxPbY0n0m+GVmeUvIlH6Tdwc7nDjIDFt0EqmXW4tNISJEnXVJolDGce0c
	v72I650p33Wf/oBLNo2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzYio-00CIuG-0J;
	Thu, 18 May 2023 08:10:50 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzYik-00CIsM-1K;
	Thu, 18 May 2023 08:10:47 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-253340db64fso1784437a91.2;
        Thu, 18 May 2023 01:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684397445; x=1686989445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0YTm0IoXUd5c4n5YN9L5DUYWH7WIf1ootPhSesQtpw=;
        b=ZcxKVWxTbbBRXRzIs4OQ4ef+VAjO+ndMZFtzZExu3rBaoSOYhiRDwTrHtb1FY0hdJG
         HGUxEL1az8vR0xr+PEWkNyfoZC7VZmxHQS8puY4JFtyDdFdQdEYCq982C2v+7yQiHUTh
         2CcMtV71QYcBV9Rd/bRK9tb3hDnWe8UdCiSe01V+/0u30JCDIBXYS27rsgHe3ATjCoJA
         VK9YXNtMXWhb9c2YGvxMkJ2Y3Joq5SDZMHybJnW4WPe47EY9cGMiT9Du9pGgftpjuTf4
         HQXcKIEsJ/dQ001VUznykafhZ8OKqYbGpZPg9PjPfzyONW9OZTc1r3x9VXJKDVRo4n9D
         G4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684397445; x=1686989445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0YTm0IoXUd5c4n5YN9L5DUYWH7WIf1ootPhSesQtpw=;
        b=HD9NYqDEP46xfB5ZfKL3v7eFl0PsvLG6io7f5/VPWMG3YKX+htahh1XjAVEv7N+rSb
         HOeKLblNd2vgGzED7fS3zcJDmcy4OoglAwbWmjTlOKbdFgNj7zIkck9q8/ercApr+bEM
         u4+8XqZHmZHb4p1Q9o3mYAgeJM904sF6gxhw6k04aGJ5f4lJZnYfil0slEsu6M6B3TTJ
         Nv+SC8XDh5P8AYXF4ceF3R7kBWi0NaGXTuG8cvk9l8gB6WuvXla9XiCO/anJxIzruuaG
         s9/hMUqDiJPIiIUTHgMJVZGhIZ+L4qkojSxwrbnQgh+C/GZ3ebwWRRjcM53XU2QwTnuY
         ngoQ==
X-Gm-Message-State: AC+VfDx6fUZ3E3gjX+hAEQtnzGT7M/3Unib+KgqnCx85krHsJj7fy/oE
	PJjoIQLhCavcUpifb1JPaxwHDM5EbHJfEod5/pV7XIIFiYk=
X-Google-Smtp-Source: ACHHUZ6onfAai2ygXURVPYRaxZVnlUv+nfcC3Xm7KTFlJ9Cq8cFTmGv8mjKjQj7PLNnBVWE+ADL4xKVZrtzP+tH9rm0=
X-Received: by 2002:a17:90a:764d:b0:253:30f9:1849 with SMTP id
 s13-20020a17090a764d00b0025330f91849mr1748821pjl.12.1684397444829; Thu, 18
 May 2023 01:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683791148.git.haibo1.xu@intel.com> <751a84a9691c86df0e65cdb02abf1e073892d1ca.1683791148.git.haibo1.xu@intel.com>
 <20230511-28ec368a8168342c68ca2187@orel> <CAJve8okVFr-m6go6dCg7Cf=Uq3Yt9Xmxi0Z3B2vbWvahvx4GgA@mail.gmail.com>
 <20230518-60da3b82641bdaccec589b8b@orel>
In-Reply-To: <20230518-60da3b82641bdaccec589b8b@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Thu, 18 May 2023 16:10:33 +0800
Message-ID: <CAJve8on1qzEZ6MsaV4ZOJoKHwymeEPtd_vmY6ki1Nq9bnUPT2g@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Add riscv get-reg-list test
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_011046_468859_2930A556 
X-CRM114-Status: GOOD (  26.60  )
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

T24gVGh1LCBNYXkgMTgsIDIwMjMgYXQgMzozMuKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBNYXkgMTgsIDIwMjMgYXQgMTI6MTc6
MThQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gLi4uCj4gPiA+IFRoZSBpZGVhIG9mIHRoZXNl
ICp0b19zdHIgZnVuY3Rpb25zIGlzIHRvIGR1bXAgb3V0cHV0IHRoYXQgY2FuIGJlCj4gPiA+IGNv
cHkrcGFzdGVkIGludG8gYSByZWcgYXJyYXkgKGhlbmNlIHRoZSB0cmFpbGluZyBjb21tYXMgaW4g
cHJpbnRfcmVnCj4gPiA+IGxpbmVzKS4gU28gd2UgY2FuJ3QganVzdCBwcmludCByYW5kb20gbGlu
ZXMgaGVyZSBvciByZXR1cm4gJyMjVU5LT1dOIyMnLAo+ID4gPiBhcyB0aGF0IHdvbid0IGNvbXBp
bGUuIEluc3RlYWQsIHRoZSBkZWZhdWx0IHNob3VsZCByZXR1cm4KPiA+ID4KPiA+ID4gICBzdHJf
d2l0aF9pbmRleCgiS1ZNX1JFR19SSVNDVl9DT05GSUdfUkVHKCMjKSIsIHJlZ19vZmYpCj4gPiA+
Cj4gPgo+ID4gVGhhbmtzIGZvciBzaGFyaW5nIHRoZSBkZXRhaWxlZCBpZGVhLCB3aWxsIGZpeCBp
dCBpbiBuZXh0IHZlcnNpb24hCj4KPiBJIGd1ZXNzIHdlIGNvdWxkIGFsc28gcmV0dXJuIGEgc3Ry
aW5nIGxpa2UsCj4KPiAiS1ZNX1JFR19SSVNDVl9DT05GSUdfUkVHKCMjKSAvKiBVTktOT1dOICov
Igo+Cj4gYXMgdGhhdCB3b3VsZCBzdGlsbCBjb21waWxlIGFuZCBhbHNvIGNvbnZleSB0aGUgbWVz
c2FnZSB0aGF0IHRoaXMKPiByZWdpc3RlciBkb2Vzbid0IGhhdmUgYSBuYW1lIGJlY2F1c2UgdGhl
IHRlc3QgZG9lc24ndCBrbm93IGl0IHlldC4KPgoKWWVzLCB0aGF0J3MgbW9yZSBmcmllbmRseSBh
bmQgc2VsZiBleHBsYW5hdG9yeS4gVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiEKCj4gLi4uCj4g
PiA+IFdlIHNob3VsZCBzaGFyZSBhbGwgdGhlIGNvZGUgYWJvdmUsIGV4Y2VwdCBwcmludF9yZWco
KSwgd2l0aCBhYXJjaDY0Lgo+ID4gPiBJJ2xsIHNlbmQgYSBwYXRjaCBzZXJpZXMgdGhhdCBzcGxp
dHMgdGhlIGFyY2gtbmV1dHJhbCBjb2RlIG91dCBvZgo+ID4gPiB0aGUgYWFyY2g2NCB0ZXN0IHRo
YXQgeW91IGNhbiBiYXNlIHRoaXMgdGVzdCBvbi4KPiA+ID4KPiA+Cj4gPiBHb29kIGlkZWEhIEkg
d2lsbCByZWJhc2UgdGhlIHBhdGNoIGJhc2VkIG9uIHlvdXIgd29yay4KPiA+Cj4KPiBPaywgSSd2
ZSBwdXNoZWQgcGF0Y2hlcyB0byBbMV0uIFRoaXMgc2VyaWVzIGludHJvZHVjZXMgdHdvIHRoaW5n
cyB0byBLVk0KPiBzZWxmdGVzdHMuIFByaW1hcmlseSBpdCBzcGxpdHMgdGhlIGFhcmNoNjQvZ2V0
LXJlZy1saXN0IHRlc3QgaW50byBhCj4gY3Jvc3MtYXJjaCBnZXQtcmVnLWxpc3QgdGVzdCBhbmQg
YW4gJEFSQ0hfRElSL2dldC1yZWctbGlzdC5vIG9iamVjdCBmaWxlLAo+IHdoaWNoIHRoZSBjcm9z
cy1hcmNoIHRlc3QgZGVwZW5kcyBvbi4gVG8gZG8gdGhhdCwgaXQgYWxzbyBpbnRyb2R1Y2VzIHRo
ZQo+IGNvbmNlcHQgb2YgYSAic3BsaXQgdGVzdCIsIGEgdGVzdCB0aGF0IGhhcyBhIGNyb3NzLWFy
Y2ggcGFydCB3aGljaCBkZXBlbmRzCj4gb24gYW4gYXJjaC1zcGVjaWZpYyBwYXJ0LiBVc2luZyBh
IHNwbGl0IHRlc3QgaXMgY2xlYW5lciB0aGFuIHRoZQo+ICNpZmRlZmZlcnkgd2UgdXN1YWxseSBk
byBmb3IgY3Jvc3MtYXJjaCB0ZXN0cy4KPgo+IEkndmUgYWRkZWQga3ZtYXJtQGxpc3RzLmxpbnV4
LmRldiwgTWFyYywgT2xpdmVyLCBhbmQgU2VhbiB0byB0aGUgQ0Mgb2YKPiB0aGlzIG1lc3NhZ2Uu
IFlvdSdsbCB3YW50IHRvIGFkZCB0aGVtIHdoZW4geW91IHBvc3QgdjIgYXMgd2VsbC4KPgoKU3Vy
ZSwgSSB3aWxsIHJlYmFzZSB5b3VyIHBhdGNoIGluIHYyLiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3
IQoKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2pvbmVzLWRyZXcvbGludXgvY29tbWl0cy9hcm02
NC9rc2VsZi9nZXQtcmVnLWxpc3QKPgo+IFRoYW5rcywKPiBkcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
