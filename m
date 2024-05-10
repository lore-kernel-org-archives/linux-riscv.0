Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A736C25B4F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 09:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/JsH/KSdzyz61a4TZ8yvshAPy82R2w5hacfNFqJZaU=; b=DE99cJL+60Rkci
	AJ+spf5F7nUieubwkD+Vp09/bAVaqMQuN27GE76aR3jPx45Tp5XL9qF4OYRvqDEcAi/SAS/Rxs1mD
	4GTBpBMBSQNy8qHByOpXSbDeCPy/yRBXpJCrXP8MZyj5jG0wv9F9iy+8Wcj1DZZ77NLLTtzJxJdtg
	9/WuHWSoa/PsZKG/NiD3Qc+F08IsI8BWzj0wg+D+uvwst/gy2rLgTSsaWzhvVqX7hCyyXOFdEZ3QV
	qGkFhApJ64duGhocIwd725RCZEShR7EORMCYvKVS6WH4KzCsl/2NMmQSqWl6uodyYErfkLXmx069C
	BjqHPNoOitoMpIiyXtWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MPc-00000004g6m-1pDj;
	Fri, 10 May 2024 09:19:32 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MPZ-00000004g4R-1ptZ
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 09:19:31 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-51f71e4970bso2126974e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 May 2024 02:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715332764; x=1715937564; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fwcye2cmMvVkzOb2RmQWM8DhgejhAa5fax0EB+I/fqo=;
        b=XH2p50i8saeR2TjtJAEDnwvHIvlfRvrx+oXqUpstx7WF06T4mqsp+XS3eM2RF7Yh+I
         Npv16HcatstOpJT0C5VLB4aC2NB8UKV2tjCiRmhP/noL6m8oFBRWj0eP9ygnbDUWuNQF
         THvZMmBzQKIeFadxMA2btBqUpmudPWwN2nI6cwiuqusK3s4p14mpuEEPbivyl6YN5ceD
         u/c/27X2zXauRc1vUCtxyZSmME+GFehpBK/BvcO8RQ8qPvDIDK6yhvNX874QtMvP+o0n
         fyjgy8yCGoeDziTFgK5UaEQtvjRUZzS5xg6RcfhN3z91WrD3WpAu6rdPr7f6I7lkyW+Y
         b8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715332764; x=1715937564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fwcye2cmMvVkzOb2RmQWM8DhgejhAa5fax0EB+I/fqo=;
        b=DEgmpXL4eCmXIUkO4VwSSrYSUjF48h2lcXa16J1GBIk6k1UQpYSI9yMr3YsKj0IaTn
         n1HhU4gCnt+8SR0RC3+oIANVZx5av/l9+L0rgky5NgtTfQQO2fT7yW7cFmUW15mJWhuq
         eyn4ueQDyXKQiATh2uU4wM4vaNwuzwMwXxswyHqUvmrVdB68ko1oUFsIfqbkvlBeQahC
         n14fvhzbsjC6SXmI1kpgIQx27SmHWNVsLYLsvkDoXBHx0lxBweNL5E4C8UmYGSWiXw5i
         lVjXV7pUqYxqEspK3nRFEiiwOXPVkb3c1hQTnA6fdxZKX5XxrVAak6j9iVyuOESZJP3i
         QW4w==
X-Forwarded-Encrypted: i=1; AJvYcCWw1GGNgW0wYtsAjzEjVAY1KCyEiATGGX3Rq/Jnyb2XdNJTRkpujmKKRAkFouT0GcoZXOo50GYb3r+iJ0KUVR+75AWzDaKI+pDmD65ji/Nj
X-Gm-Message-State: AOJu0Yx6+AWh3uwLqJrS9TT5hGZnL7AUyuP2Gz7wGxMlNwT7vpSHDe6L
	l+ZTuoxMC68tsTkeUtpfNcQdXVACOiq8qT/aOdA3M71rGyPDUX4SI3fGujjd/dI+FM3dilPCpIW
	bep0LZVq9knolGpbR46VFM/fAYWA=
X-Google-Smtp-Source: AGHT+IHc8ejS+uh+vZ4ONq0UjpSRCAJS/lYZfonb8VrowpLbGOm9rPid8UtfVuCRbn1pG5g/TjPFUolkPn0uDb6PLKo=
X-Received: by 2002:a05:6512:3e01:b0:515:d1a6:1b07 with SMTP id
 2adb3069b0e04-5220fc7bdc8mr2561142e87.15.1715332763829; Fri, 10 May 2024
 02:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240506155120.83105-1-libang.li@antgroup.com>
 <20240506155120.83105-6-libang.li@antgroup.com> <eb41fcb3-7207-40a8-9b49-0825a2e74e86@arm.com>
In-Reply-To: <eb41fcb3-7207-40a8-9b49-0825a2e74e86@arm.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Fri, 10 May 2024 17:19:12 +0800
Message-ID: <CAK1f24mNZ5=HubBNcnuabzWAEqAALnnKVd3N9D5+jNBjxO6p+w@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] mm: Add update_mmu_tlb_range()
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Bang Li <libang.li@antgroup.com>, akpm@linux-foundation.org, 
	chenhuacai@kernel.org, tsbogend@alpha.franken.de, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, chris@zankel.net, jcmvbkbc@gmail.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, david@redhat.com, libang.linux@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_021929_521352_6ABB3D01 
X-CRM114-Status: GOOD (  27.00  )
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

T24gRnJpLCBNYXkgMTAsIDIwMjQgYXQgNTowNeKAr1BNIFJ5YW4gUm9iZXJ0cyA8cnlhbi5yb2Jl
cnRzQGFybS5jb20+IHdyb3RlOgo+Cj4gT24gMDYvMDUvMjAyNCAxNjo1MSwgQmFuZyBMaSB3cm90
ZToKPiA+IEFmdGVyIHRoZSBjb21taXQgMTllYWY0NDk1NGRmICgibW06IHRocDogc3VwcG9ydCBh
bGxvY2F0aW9uIG9mIGFub255bW91cwo+ID4gbXVsdGktc2l6ZSBUSFAiKSwgaXQgbWF5IG5lZWQg
dG8gYmF0Y2ggdXBkYXRlIHRsYiBvZiBhbiBhZGRyZXNzIHJhbmdlCj4gPiB0aHJvdWdoIHRoZSB1
cGRhdGVfbW11X3RsYiBmdW5jdGlvbi4gV2UgY2FuIHNpbXBsaWZ5IHRoaXMgb3BlcmF0aW9uIGJ5
Cj4gPiBhZGRpbmcgdGhlIHVwZGF0ZV9tbXVfdGxiX3JhbmdlIGZ1bmN0aW9uLCB3aGljaCBtYXkg
YWxzbyByZWR1Y2UgdGhlCj4gPiBleGVjdXRpb24gb2Ygc29tZSB1bm5lY2Vzc2FyeSBjb2RlIGlu
IHNvbWUgYXJjaGl0ZWN0dXJlcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCYW5nIExpIDxsaWJh
bmcubGlAYW50Z3JvdXAuY29tPgo+ID4gLS0tCj4gPiAgaW5jbHVkZS9saW51eC9wZ3RhYmxlLmgg
fCA4ICsrKysrKysrCj4gPiAgbW0vbWVtb3J5LmMgICAgICAgICAgICAgfCA0ICstLS0KPiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wZ3RhYmxlLmggYi9pbmNsdWRlL2xpbnV4L3BndGFi
bGUuaAo+ID4gaW5kZXggMTgwMTlmMDM3YmFlLi44NjliZmU2MDU0ZjEgMTAwNjQ0Cj4gPiAtLS0g
YS9pbmNsdWRlL2xpbnV4L3BndGFibGUuaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9wZ3RhYmxl
LmgKPiA+IEBAIC03MzcsNiArNzM3LDE0IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB1cGRhdGVfbW11
X3RsYihzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiA+ICAjZGVmaW5lIF9fSEFWRV9BUkNI
X1VQREFURV9NTVVfVExCCj4gPiAgI2VuZGlmCj4KPiBHaXZlbiB5b3UgYXJlIGltcGxlbWVudGlu
ZyB1cGRhdGVfbW11X3RsYl9yYW5nZSgpIGluIGFsbCB0aGUgYXJjaGVzIHRoYXQKPiBjdXJyZW50
bHkgb3ZlcnJpZGUgdXBkYXRlX21tdV90bGIoKSBJIHdvbmRlciBpZiBpdCB3b3VsZCBiZSBjbGVh
bmVyIHRvIHJlbW92ZQo+IHVwZGF0ZV9tbXVfdGxiKCkgZnJvbSBhbGwgdGhvc2UgYXJjaGVzLCBh
bmQgZGVmaW5lIGdlbmVyaWNhbGx5LCByZW1vdmluZyB0aGUKPiBhYmlsaXR5IGZvciBhcmNoZXMg
dG8gb3ZlcnJpZGUgaXQ6CgpTb3VuZHMgZ3JlYXQhIExldCdzIGdldCBpdCBkb25lLgoKPgo+IHN0
YXRpYyBpbmxpbmUgdm9pZCB1cGRhdGVfbW11X3RsYihzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZt
YSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkcmVz
cywgcHRlX3QgKnB0ZXApCj4gewo+ICAgICAgICAgdXBkYXRlX21tdV90bGJfcmFuZ2Uodm1hLCBh
ZGRyZXNzLCBwdGVwLCAxKTsKPiB9Cj4KPiA+Cj4gPiArI2lmbmRlZiBfX0hBVkVfQVJDSF9VUERB
VEVfTU1VX1RMQl9SQU5HRQo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCB1cGRhdGVfbW11X3RsYl9y
YW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgcHRlX3QgKnB0ZXAsIHVuc2lnbmVkIGlu
dCBucikKPiA+ICt7Cj4gPiArfQo+ID4gKyNkZWZpbmUgX19IQVZFX0FSQ0hfVVBEQVRFX01NVV9U
TEJfUkFOR0UKPiA+ICsjZW5kaWYKPgo+IFRoZW4geW91IGNvdWxkIHVzZSB0aGUgbW9kZXJuIG92
ZXJyaWRlIHNjaGVtZSBhcyBMYW5jZSBzdWdnZXN0ZWQgYW5kIHlvdSB3b24ndAo+IGhhdmUgYW55
IGNvbmZ1c2lvbiB3aXRoIF9fSEFWRV9BUkNIX1VQREFURV9NTVVfVExCIGJlY2F1c2UgaXQgd29u
J3QgZXhpc3QgYW55bW9yZS4KCisxLiBJdCBtaWdodCBiZSBiZXR0ZXIgdG8gdXNlIHRoZSBtb2Rl
cm4gb3ZlcnJpZGUgc2NoZW1lIDopCgpUaGFua3MsCkxhbmNlCgo+Cj4gPiArCj4gPiAgLyoKPiA+
ICAgKiBTb21lIGFyY2hpdGVjdHVyZXMgbWF5IGJlIGFibGUgdG8gYXZvaWQgZXhwZW5zaXZlIHN5
bmNocm9uaXphdGlvbgo+ID4gICAqIHByaW1pdGl2ZXMgd2hlbiBtb2RpZmljYXRpb25zIGFyZSBt
YWRlIHRvIFBURSdzIHdoaWNoIGFyZSBhbHJlYWR5Cj4gPiBkaWZmIC0tZ2l0IGEvbW0vbWVtb3J5
LmMgYi9tbS9tZW1vcnkuYwo+ID4gaW5kZXggZWVhNmU0OTg0ZWFlLi4yZDUzZTI5Y2Y3NmUgMTAw
NjQ0Cj4gPiAtLS0gYS9tbS9tZW1vcnkuYwo+ID4gKysrIGIvbW0vbWVtb3J5LmMKPiA+IEBAIC00
NDIxLDcgKzQ0MjEsNiBAQCBzdGF0aWMgdm1fZmF1bHRfdCBkb19hbm9ueW1vdXNfcGFnZShzdHJ1
Y3Qgdm1fZmF1bHQgKnZtZikKPiA+ICAgICAgIHZtX2ZhdWx0X3QgcmV0ID0gMDsKPiA+ICAgICAg
IGludCBucl9wYWdlcyA9IDE7Cj4gPiAgICAgICBwdGVfdCBlbnRyeTsKPiA+IC0gICAgIGludCBp
Owo+ID4KPiA+ICAgICAgIC8qIEZpbGUgbWFwcGluZyB3aXRob3V0IC0+dm1fb3BzID8gKi8KPiA+
ICAgICAgIGlmICh2bWEtPnZtX2ZsYWdzICYgVk1fU0hBUkVEKQo+ID4gQEAgLTQ0OTEsOCArNDQ5
MCw3IEBAIHN0YXRpYyB2bV9mYXVsdF90IGRvX2Fub255bW91c19wYWdlKHN0cnVjdCB2bV9mYXVs
dCAqdm1mKQo+ID4gICAgICAgICAgICAgICB1cGRhdGVfbW11X3RsYih2bWEsIGFkZHIsIHZtZi0+
cHRlKTsKPiA+ICAgICAgICAgICAgICAgZ290byByZWxlYXNlOwo+ID4gICAgICAgfSBlbHNlIGlm
IChucl9wYWdlcyA+IDEgJiYgIXB0ZV9yYW5nZV9ub25lKHZtZi0+cHRlLCBucl9wYWdlcykpIHsK
PiA+IC0gICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IG5yX3BhZ2VzOyBpKyspCj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgdXBkYXRlX21tdV90bGIodm1hLCBhZGRyICsgUEFHRV9TSVpFICog
aSwgdm1mLT5wdGUgKyBpKTsKPiA+ICsgICAgICAgICAgICAgdXBkYXRlX21tdV90bGJfcmFuZ2Uo
dm1hLCBhZGRyLCB2bWYtPnB0ZSwgbnJfcGFnZXMpOwo+Cj4gSSBjZXJ0YWlubHkgYWdyZWUgdGhh
dCB0aGlzIHdpbGwgYmUgYSB1c2VmdWwgaGVscGVyIHRvIGhhdmUuIEkgZXhwZWN0IHRoZXJlIHdp
bGwKPiBiZSBtb3JlIHVzZXJzIGluIGZ1dHVyZS4KPgo+ID4gICAgICAgICAgICAgICBnb3RvIHJl
bGVhc2U7Cj4gPiAgICAgICB9Cj4gPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
