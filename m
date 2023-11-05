Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7C9C4332F
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Nov 2023 16:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdQkPoNGL+DrW6LTBkzsb0tGgtDDc5roxFsDUJ1z8fg=; b=EvQb9k5Qw/BYYh
	fatdrqrJGzPEb1kGdmUJtysvna451bLmKpCNaDk4u9SFfKaxZM+iNz+0FicZVvtNzpTdqBObG80Zi
	BFwa8B5ZDVmv/5P+rRVwgWsN7AVm58+7Un7uyfN23CyBFC0h68g++xrTbWy5uuzZDPo/4b8JcBURW
	Tm3l5VMP5G/ZZrZ54hUuLKb6wvlSgBQv+HWbsb0QKxHJlpkNuRm0UcJZAh77yta0gkACmV7eELReA
	FZ/PuxoNQRvK54rO4GgdYr7TyOViltS1dzuoCwnuwyhiv7rvhU+dInsCWh8I8DQ0Pt4W+3+dlYZVN
	AXlf9fGYwNIP/NddXtyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzfqu-00FAPL-2V;
	Sun, 05 Nov 2023 16:19:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzfqs-00FAO5-0B
	for linux-riscv@lists.infradead.org;
	Sun, 05 Nov 2023 16:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699201191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5S45DCFEET4FUlleAs+X25SSP8exRtkoxGaiIZR36AY=;
	b=Qs3HRrP3qIhpoKM72TcYby7LjkynOYF2uGUiYgOpf4cM1NTdPhrht9wGz/KnO3gBjJxfUq
	mza5kadjnoQ8KRXMz4halkRbOGmF7JZQRnmEXEipVlcbqxqYJs2bJ/KxI1kMpBJJetCEJF
	dDxtT0VknqS2ie5C9oxIB6gY14EdZkk=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-N2HME3HAMW-g_ThdeOoggg-1; Sun, 05 Nov 2023 11:19:50 -0500
X-MC-Unique: N2HME3HAMW-g_ThdeOoggg-1
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-4ac2ffa81f1so312119e0c.0
        for <linux-riscv@lists.infradead.org>; Sun, 05 Nov 2023 08:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699201190; x=1699805990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5S45DCFEET4FUlleAs+X25SSP8exRtkoxGaiIZR36AY=;
        b=mO5Y9+NR7WGvta7Z4Wf3BKhH8quxVh2f+zpd/NGn3xLRKftC4c6yzMR3Wt95wqQ1rR
         NxPEEjVi/D30ykBCFt3Bh1X0j3guy+1XG7GbqZ15qx9ut+W76WyxFhYd2BNfrzukygHu
         gQ4U9UVewOJEODSkuhnb2bBDlIr0M6dJLdRqMYdXtmW6OWFnbUCjKwLfMVuEE9Egeeqb
         osLC4ns7KIDdWBDg5dTQi4pdZ1J4LAlJ7as8wEA049g0lxoFD1zPdjQOejWbkSTnmQL7
         VthMK81Wy9N/OIshnYs3iIYLY7Akf1qbDInJRe/rv4fnzx8Z+DUGYFKgM1dMyYlxK7dX
         jk/w==
X-Gm-Message-State: AOJu0YwbLuf/rikwADkTVupahmov1YnfCFCF2JbHUKO163fC56J1vS4M
	odTsS2UdBS8cX7zUQniGXtmM3RfXX4+E8+EWGHRrdzCeINd/g5ip3u/MxMSaNZtiRXtiu/xDk3+
	8YMiKOAwfG5Li/t1sMs1XvMBP6CMUNGN1HlTl5EvSzD7k
X-Received: by 2002:a05:6102:4743:b0:45d:8f83:e10f with SMTP id ej3-20020a056102474300b0045d8f83e10fmr5351491vsb.4.1699201189798;
        Sun, 05 Nov 2023 08:19:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9PY/ps/exIZhJtEiBPcrHL5I4MFvN3fWtoZJg4K/o1jMHEXmGlTLfpUZIUzDcxTZUf1dOb3c60KPU/ucxafo=
X-Received: by 2002:a05:6102:4743:b0:45d:8f83:e10f with SMTP id
 ej3-20020a056102474300b0045d8f83e10fmr5351461vsb.4.1699201189503; Sun, 05 Nov
 2023 08:19:49 -0800 (PST)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-21-seanjc@google.com>
 <ZUeSaAKRemlSRQpO@yilunxu-OptiPlex-7050>
In-Reply-To: <ZUeSaAKRemlSRQpO@yilunxu-OptiPlex-7050>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 5 Nov 2023 17:19:36 +0100
Message-ID: <CABgObfb1Wf2ptitGhJPM6VcmkCG9haMoQj2BsttjeoV=9F0O9Q@mail.gmail.com>
Subject: Re: [PATCH v13 20/35] KVM: x86/mmu: Handle page fault for private memory
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
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
	Anish Moorthy <amoorthy@google.com>, David Matlack <dmatlack@google.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231105_081954_184906_D3AB4638 
X-CRM114-Status: GOOD (  10.68  )
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

T24gU3VuLCBOb3YgNSwgMjAyMyBhdCAyOjA04oCvUE0gWHUgWWlsdW4gPHlpbHVuLnh1QGxpbnV4
LmludGVsLmNvbT4gd3JvdGU6Cj4KPiA+ICtzdGF0aWMgdm9pZCBrdm1fbW11X3ByZXBhcmVfbWVt
b3J5X2ZhdWx0X2V4aXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX3BhZ2VfZmF1bHQgKmZhdWx0
KQo+ID4gK3sKPiA+ICsgICAgIGt2bV9wcmVwYXJlX21lbW9yeV9mYXVsdF9leGl0KHZjcHUsIGZh
dWx0LT5nZm4gPDwgUEFHRV9TSElGVCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFBBR0VfU0laRSwgZmF1bHQtPndyaXRlLCBmYXVsdC0+ZXhlYywKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhdWx0LT5pc19wcml2YXRlKTsKPiA+ICt9Cj4g
PiArCj4gPiArc3RhdGljIGludCBrdm1fZmF1bHRpbl9wZm5fcHJpdmF0ZShzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3Zt
X3BhZ2VfZmF1bHQgKmZhdWx0KQo+ID4gK3sKPiA+ICsgICAgIGludCBtYXhfb3JkZXIsIHI7Cj4g
PiArCj4gPiArICAgICBpZiAoIWt2bV9zbG90X2Nhbl9iZV9wcml2YXRlKGZhdWx0LT5zbG90KSkg
ewo+ID4gKyAgICAgICAgICAgICBrdm1fbW11X3ByZXBhcmVfbWVtb3J5X2ZhdWx0X2V4aXQodmNw
dSwgZmF1bHQpOwo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsKPiA+ICsgICAgIH0K
PiA+ICsKPiA+ICsgICAgIHIgPSBrdm1fZ21lbV9nZXRfcGZuKHZjcHUtPmt2bSwgZmF1bHQtPnNs
b3QsIGZhdWx0LT5nZm4sICZmYXVsdC0+cGZuLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgJm1heF9vcmRlcik7Cj4gPiArICAgICBpZiAocikgewo+ID4gKyAgICAgICAgICAgICBrdm1f
bW11X3ByZXBhcmVfbWVtb3J5X2ZhdWx0X2V4aXQodmNwdSwgZmF1bHQpOwo+ID4gKyAgICAgICAg
ICAgICByZXR1cm4gcjsKPgo+IFdoeSByZXBvcnQgS1ZNX0VYSVRfTUVNT1JZX0ZBVUxUIGhlcmU/
IGV2ZW4gd2l0aCBhIHJldCAhPSAtRUZBVUxUPwoKVGhlIGNhc2VzIGFyZSBFRkFVTFQsIEVIV1BP
SVNPTiAod2hpY2ggY2FuIHJlcG9ydApLVk1fRVhJVF9NRU1PUllfRkFVTFQpIGFuZCBFTk9NRU0u
IEkgdGhpbmsgaXQncyBmaW5lCnRoYXQgZXZlbiAtRU5PTUVNIGNhbiByZXR1cm4gS1ZNX0VYSVRf
TUVNT1JZX0ZBVUxULAphbmQgaXQgZG9lc24ndCB2aW9sYXRlIHRoZSBkb2N1bWVudGF0aW9uLiAg
VGhlIGRvY3MgdGVsbCB5b3UgIndoYXQKY2FuIHlvdSBkbyBpZiBlcnJvciBpZiBFRkFVTFQgb3Ig
RUhXUE9JU09OPyI7IHRoZXkgZG9uJ3QKZXhjbHVkZSB0aGF0IG90aGVyIGVycm5vcyByZXN1bHQg
aW4gS1ZNX0VYSVRfTUVNT1JZX0ZBVUxULAppdCdzIGp1c3QgdGhhdCB5b3UncmUgbm90IHN1cHBv
c2VkIHRvIGxvb2sgYXQgaXQKClBhb2xvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
