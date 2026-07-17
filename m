Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653EEC4451B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 16:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8F4jiqajdIWJKCfZpVH771fO92DkIhpVjb1oyMvfOOc=; b=11W8R7YzFW8IyY
	2xKuORkBEhl2Av8zi65VjllA3OwfcP5yTmd2Ac39N5k7vAwNbIX4hV4+NWiF0ghfuXiD20Yr4suQO
	6Vc40PXvmDGGjfzryHiXzRtj2SDfnyDvhGHouYGp8TYzjv/Fg8FC2bj55KsIkxyAo9quKVH5gOgIe
	ZGzpaSF0AZZJRs5IXpSgaGkb3ha8cR/MdAPo7lr8BS14jW8tJc2rPflapkmiA0WdjA0F/bwdAhliH
	AJhruA78mdUsamiY2KzESNN0rSx17Aavqv7DD2Gh1Bxe42qE6SVcochnKSoLw/lBJgzlw9OLBvjft
	AB7KqmzhA6mQ/kbY6M2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wklsJ-00000002nJd-2ScB;
	Fri, 17 Jul 2026 16:57:23 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wklsG-00000002nIA-1Yp0
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 16:57:22 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-8eeadbc5e21so31282186d6.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jul 2026 09:57:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784307438; cv=none;
        d=google.com; s=arc-20260327;
        b=McfGNawk5CYX206R2x3F1NJWAd/w9U4vSfk/iltCnzd4tWO7vrR+/iJiPzaEkah/kp
         Ml+UyYkzuaps9xr5z28NxWptY5XmtDHvl1HhbW6m1MlvM9x9eczYsjmGTLkDXbUXXhPJ
         hZklalA7ldjgrhBNjMqRgmebTVYlP9qo4XUQdyYwwvZ20H8aiSb1uPu4zhCgz37o2EXT
         XcQJiEP3zmf2qNFV8m20RQeIZR07eumsFPyezhLymu1oxwmO+043tPuZWH5EHXUfhTGU
         nnoLnkQaZoRNY3lML/LnTC4rgD44urqY0Kwm8ceSoc+hddcl3HLQbfog4ZhYLF5G6R47
         UOxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1LBh9YIfmZdgckdI1vRQcjWrVZRt4dn3gC61qTUBJTY=;
        fh=4o/rx50i9cmyOBxqu4QEyr1w5RCrFQH5M9yWt1AdMds=;
        b=mASfvtcKZ9JV0SF0kaSLlxUNeg+NZ6RVi1FWV7Yvg4GFgB2ESl/papSXGpd9TG2ViY
         LXNhma9btxBecOgs8/KIGTYgdePE08YyQPn7yrpPNDLfDFYxFQBgUElX6M2B9SwwKU0Y
         HiG3RMJsIBc5bHpY7rioB9/6raxN15eb443zLxeL546+gLQyOgR5cilB7S6SirAbKHUL
         Jgcw6GcVr8j59amBNxTxVd5JLAONuYYq9TqChtLMOiiPFpuPOQvuYr4HKPHS+YjQC905
         skpBgKqmfWJvIGMVNvbja6urlFtO59Zz4wkH6HzFBvO0yPTgGq2XDN5WpgE+V4AWshxy
         1HqQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784307438; x=1784912238; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1LBh9YIfmZdgckdI1vRQcjWrVZRt4dn3gC61qTUBJTY=;
        b=GywrVa/CO5G/KmKeP1nt5hy6kUYi2ZOMu8cYHmiYFE2bA4pLHRuMZFHDEpRInIPyXi
         02cCGnvmkpBcTQUYrWmQo69Mw3qhzHCYGzz8B1tMmL2PNST7LdmcEojFhI4lNURrqdQp
         a0HoUVTmqDnFm2Z6UHP/uQE6KYXlrGnlt88pfdThLtdriSc1ajlVqYJXm+YB3OX8uj6y
         E3S6EpS5UkC5QCLqc0X9XO5RAqItpuFeNqzE6GOaw+jYVILjZpBXGvE6Ikwh1jGU96j3
         s/w0Et+ZPOU/dv1Xs0U+YmFeTTgbXAAFAXPtmadgnSeLIwIkjzOVysswttbEkppwmMA5
         gepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784307438; x=1784912238;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1LBh9YIfmZdgckdI1vRQcjWrVZRt4dn3gC61qTUBJTY=;
        b=fot/4I3EQpjTLjIsMbtKjIMVBE6+bzczfmv7yCqEw0sEdPszvy8qByM6/Mpp3IUsac
         c0ZsOX88bu1/afh8Eb4/G7uJC8LbPPvQn8DKQbz/8rjSJHUg8Z4hoXwyQhxYQ6pn/oWc
         5xCdIkpXiZt/LOhUJqRROptnDACKULAkwzMtcRtkZheLVDZCodxInSY4AaXsY42VDg67
         HzwJpvN+U6T1mo6eTTkJnOywqWfgLiNBsUMB6iy3/ydljQ3Gc+xBFvjIS/MqzJZo95Ji
         AFlkYBfUVIxaIRSYpecmxYoC5Uk4sYeulKaU8ZDBDq8XzNnTlkHpCDSuUBrMYvC5JWdZ
         5NIA==
X-Forwarded-Encrypted: i=1; AHgh+RpaRqkSKIAieGf3PPjMavqAnLPY0N2CZhQ+0pat+OXo8cqo2Bb4VEAnDkzOb/jyXZ2GFQYOPXeZTg2oJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTua3pKcCpHAxKuIiOruB6nkO1DDSlgSuSIXrDQM472FX58mWw
	nlUW6CTTgSPSO6WYy5QSh27rGhSptANkl4s2d6BID//FeUIQzZlp80IDNTb3cbMdUYDY2AqieHc
	amJN3TDJLtZwIP1yoaVKWdTliDg5eis9zhKn+4AlKOg==
X-Gm-Gg: AfdE7cknETVuasHd9U8O/O8wYqj7hgzKST8Stu6mb0/eU2C8c9omTnZNYABgft8n9Om
	s6qqPpbAw0qLQSoZLVSVKAZ6RWHHpWP+WWKRXG2K85t1E3juwYu0HTdKypoUB/8deeLwQrPTYqI
	MKB+D3iojCzDRfTkqTRc8H/uKGkrRu7NGEDkpetpStgneF0ZfKk9Wq0bMAp2Lyi9cpn5G62HBLa
	63PUWbT7DAfk6+gFi+MzRAxoQoUuOLFZ9QsgRIH2Mqz6Jbr/UOn7IHfMEKDY4A3S9Yrg+rskoot
	DvU6kh5Av8PupPPZehHN3j5eGDVDnYBixx8=
X-Received: by 2002:ad4:576f:0:b0:8e9:f62b:8f98 with SMTP id
 6a1803df08f44-907783ced37mr37349356d6.45.1784307437922; Fri, 17 Jul 2026
 09:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260715132009.10634-1-luxu.kernel@bytedance.com>
 <20260715132009.10634-2-luxu.kernel@bytedance.com> <alkD_YBF1HhbycqX@soda.int.kasm.eu>
 <CAPYmKFsA=fFKK5RtsCo1GQA0JqdxQ4h8O=GS+QXOBGPPcJrtuQ@mail.gmail.com>
In-Reply-To: <CAPYmKFsA=fFKK5RtsCo1GQA0JqdxQ4h8O=GS+QXOBGPPcJrtuQ@mail.gmail.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Sat, 18 Jul 2026 00:57:06 +0800
X-Gm-Features: AUfX_mwiUQNht4ePVFrKBZ9HeX4VnR4pM0dDhPDK7EGR3jfJQz2_jxGboLssrRw
Message-ID: <CAPYmKFthTvFo4UJEd0GaNxM_S6j5kg5EK=b0gEr82Tr7ekHc_Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/3] riscv: mm: Use ASID in update_mmu_cache()
To: Klara Modin <klarasmodin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Paul Walmsley <pjw@kernel.org>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	apw@canonical.com, joe@perches.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_095720_761589_36916A2D 
X-CRM114-Status: GOOD (  31.93  )
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

SGkgUGF1bCwKCkEgZ2VudGxlIHBpbmcuCgpJIGhhdmUgbm8gaWRlYSB3aGF0IEkgY2FuIGRvIHJl
Z2FyZGluZyBsaW51eC1uZXh0LiBDb3VsZCB5b3UgcGxlYXNlCmhlbHAgcmV2ZXJ0IHRoZSBwYXRj
aCBmcm9tIHZlcnNpb24gMSBhbmQgY2hlcnJ5LXBpY2sgYWxsIHRoZSBwYXRjaGVzCmZyb20gdmVy
c2lvbiAyIGluc3RlYWQ/IE9yIHdoYXQgY2FuIEkgZG8gZm9yIHRoaXM/CgpCZXN0IHJlZ2FyZHMs
Clh1IEx1CgpPbiBGcmksIEp1bCAxNywgMjAyNiBhdCAxMDoxMeKAr0FNIFh1IEx1IDxsdXh1Lmtl
cm5lbEBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IEhpIFBhdWwsCj4KPiBLbGFyYSBmb3VuZCB0
aGF0IGxpbnV4LW5leHQgY2hlcnJ5LXBpY2tzIHRoZSBuZXcgdmVyc2lvbiBvZiBwYXRjaCAyCj4g
d2hpbGUgcGlja2luZyB0aGUgb2xkIHZlcnNpb24gb2YgcGF0Y2ggMSwgd2hpY2ggbGVhZHMgdG8g
YW4KPiB1bmluaXRpYWxpemVkIGFzaWQuIENvdWxkIHlvdSBwbGVhc2UgaGVscCBjb3JyZWN0IHRo
aXM/Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gWHUgTHUKPgo+IE9uIEZyaSwgSnVsIDE3LCAyMDI2IGF0
IDEyOjI14oCvQU0gS2xhcmEgTW9kaW4gPGtsYXJhc21vZGluQGdtYWlsLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gSGksCj4gPgo+ID4gT24gMjAyNi0wNy0xNSAyMToyMDowNyArMDgwMCwgWHUgTHUgd3Jv
dGU6Cj4gPiA+IE9ubHkgZmx1c2ggVExCIGVudHJpZXMgZm9yIHRoZSBzcGVjaWZpZWQgbW0gaW4g
dXBkYXRlX21tdV9jYWNoZV9yYW5nZSgpLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBYdSBM
dSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3BndGFibGUuaCAgfCA0ICsrKy0KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vdGxiZmx1c2guaCB8IDUgKysrKysKPiA+ID4gIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2gu
YyAgICAgICAgICB8IDUgLS0tLS0KPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+
ID4gPiBpbmRleCA1ZDU3NTZiZGE4MmUuLjk5MjY1NTYwOTlhZSAxMDA2NDQKPiA+ID4gLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+ID4gQEAgLTU2OCw2ICs1NjgsOCBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgdXBkYXRlX21tdV9jYWNoZV9yYW5nZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKPiA+
ID4gICAgICAgICAgICAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9u
ZyBhZGRyZXNzLAo+ID4gPiAgICAgICAgICAgICAgIHB0ZV90ICpwdGVwLCB1bnNpZ25lZCBpbnQg
bnIpCj4gPiA+ICB7Cj4gPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgYXNpZCA9IGdldF9tbV9hc2lk
KHZtYS0+dm1fbW0pOwo+ID4gPiArCj4gPgo+ID4gSXQgc2VlbXMgdGhlIG9sZCB2ZXJzaW9uIG9m
IHRoaXMgcGF0Y2ggaXMgc3RpbGwgdXNlZCAoYXQgbGVhc3QgaW4KPiA+IG5leHQtMjAyNjUwNzE2
LCAxNWNlMWQ3YzRkZGZlMGRmZjAwZmNhZWU0Y2NhZWVmM2VmYmM2MmM2KSwgd2hpY2ggbWVhbnMK
PiA+IGFzaWQgaXMgbm90IGluaXRpYWxpc2VkIGhlcmUuIFdlIGluc3RlYWQgaGF2ZToKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gaW5kZXggNWQ1NzU2YmRhODJlLi43NTU0OTVh
NTQyY2MgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+
ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+IEBAIC01NjgsNiAr
NTY4LDggQEAgc3RhdGljIGlubGluZSB2b2lkIHVwZGF0ZV9tbXVfY2FjaGVfcmFuZ2Uoc3RydWN0
IHZtX2ZhdWx0ICp2bWYsCj4gPiAgICAgICAgICAgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywKPiA+ICAgICAgICAgICAgICAgICBwdGVfdCAq
cHRlcCwgdW5zaWduZWQgaW50IG5yKQo+ID4gIHsKPiA+ICsgICAgICAgdW5zaWduZWQgbG9uZyBh
c2lkOwo+ID4gKwo+ID4gICAgICAgICAvKgo+ID4gICAgICAgICAgKiBTdnZwdGMgZ3VhcmFudGVl
cyB0aGF0IHRoZSBuZXcgdmFsaWQgcHRlIHdpbGwgYmUgdmlzaWJsZSB3aXRoaW4KPiA+ICAgICAg
ICAgICogYSBib3VuZGVkIHRpbWVmcmFtZSwgc28gd2hlbiB0aGUgdWFyY2ggZG9lcyBub3QgY2Fj
aGUgaW52YWxpZAo+ID4gQEAgLTU4MywxMCArNTg1LDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB1
cGRhdGVfbW11X2NhY2hlX3JhbmdlKHN0cnVjdCB2bV9mYXVsdCAqdm1mLAo+ID4gICAgICAgICAg
KiBSZWx5aW5nIG9uIGZsdXNoX3RsYl9maXhfc3B1cmlvdXNfZmF1bHQgd291bGQgc3VmZmljZSwg
YnV0Cj4gPiAgICAgICAgICAqIHRoZSBleHRyYSB0cmFwcyByZWR1Y2UgcGVyZm9ybWFuY2UuICBT
bywgZWFnZXJseSBTRkVOQ0UuVk1BLgo+ID4gICAgICAgICAgKi8KPiA+ICsgICAgICAgYXNpZCA9
IGdldF9tbV9hc2lkKHZtYS0+dm1fbW0pOwo+ID4gICAgICAgICB3aGlsZSAobnItLSkKPiA+IC0g
ICAgICAgICAgICAgICBsb2NhbF9mbHVzaF90bGJfcGFnZShhZGRyZXNzICsgbnIgKiBQQUdFX1NJ
WkUpOwo+ID4gLQo+ID4gKyAgICAgICAgICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9wYWdlX2FzaWQo
YWRkcmVzcyArIG5yICogUEFHRV9TSVpFLCBhc2lkKTsKPiA+ICB9Cj4gPiArCj4gPiAgI2RlZmlu
ZSB1cGRhdGVfbW11X2NhY2hlKHZtYSwgYWRkciwgcHRlcCkgXAo+ID4gICAgICAgICB1cGRhdGVf
bW11X2NhY2hlX3JhbmdlKE5VTEwsIHZtYSwgYWRkciwgcHRlcCwgMSkKPiA+Cj4gPgo+ID4gVGhp
cyBtZWFucyB0aGF0IHBhdGNoIDIgb2YgdGhpcyBzZXJpZXMgd2lsbCB1c2UgdGhlIHVuaW5pdGlh
bGlzZWQgYXNpZAo+ID4gZm9yIGxvY2FsX3N2aW52YWxfdm1hKCkgYW5kIEkgZ2V0IHRoZSBzYW1l
IGJlaGF2aW91ciBhcyBiZWZvcmUgKGhhbmcgb24KPiA+IGluaXRyYW1mcykuIElmIEkgcmV2ZXJ0
IHRoZSB0d28gcGF0Y2hlcyBvZiB0aGlzIHNlcmllcyB3aGljaCBhcmUgaW4gbmV4dAo+ID4gYW5k
IGFwcGx5IHRoaXMgYWdhaW4gaXQncyBmaW5lLgo+ID4KPiA+IFJlZ2FyZHMsCj4gPiBLbGFyYSBN
b2Rpbgo+ID4KPiA+ID4gICAgICAgLyoKPiA+ID4gICAgICAgICogU3Z2cHRjIGd1YXJhbnRlZXMg
dGhhdCB0aGUgbmV3IHZhbGlkIHB0ZSB3aWxsIGJlIHZpc2libGUgd2l0aGluCj4gPiA+ICAgICAg
ICAqIGEgYm91bmRlZCB0aW1lZnJhbWUsIHNvIHdoZW4gdGhlIHVhcmNoIGRvZXMgbm90IGNhY2hl
IGludmFsaWQKPiA+ID4gQEAgLTU4NCw3ICs1ODYsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdXBk
YXRlX21tdV9jYWNoZV9yYW5nZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKPiA+ID4gICAgICAgICog
dGhlIGV4dHJhIHRyYXBzIHJlZHVjZSBwZXJmb3JtYW5jZS4gIFNvLCBlYWdlcmx5IFNGRU5DRS5W
TUEuCj4gPiA+ICAgICAgICAqLwo+ID4gPiAgICAgICB3aGlsZSAobnItLSkKPiA+ID4gLSAgICAg
ICAgICAgICBsb2NhbF9mbHVzaF90bGJfcGFnZShhZGRyZXNzICsgbnIgKiBQQUdFX1NJWkUpOwo+
ID4gPiArICAgICAgICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9wYWdlX2FzaWQoYWRkcmVzcyArIG5y
ICogUEFHRV9TSVpFLCBhc2lkKTsKPiA+ID4KPiA+ID4gIH0KPiA+ID4gICNkZWZpbmUgdXBkYXRl
X21tdV9jYWNoZSh2bWEsIGFkZHIsIHB0ZXApIFwKPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1
c2guaAo+ID4gPiBpbmRleCBlZWQwYWJjNDA1MTQuLjdjMmNkNWNjOTJkMyAxMDA2NDQKPiA+ID4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gPiA+ICsrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+ID4gPiBAQCAtMTUsNiArMTUsMTEgQEAKPiA+
ID4gICNkZWZpbmUgRkxVU0hfVExCX05PX0FTSUQgICAgICAgKCh1bnNpZ25lZCBsb25nKS0xKQo+
ID4gPgo+ID4gPiAgI2lmZGVmIENPTkZJR19NTVUKPiA+ID4gK3N0YXRpYyBpbmxpbmUgdW5zaWdu
ZWQgbG9uZyBnZXRfbW1fYXNpZChzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiA+ID4gK3sKPiA+ID4g
KyAgICAgcmV0dXJuIG1tID8gY250eDJhc2lkKGF0b21pY19sb25nX3JlYWQoJm1tLT5jb250ZXh0
LmlkKSkgOiBGTFVTSF9UTEJfTk9fQVNJRDsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiAgc3RhdGlj
IGlubGluZSB2b2lkIGxvY2FsX2ZsdXNoX3RsYl9hbGwodm9pZCkKPiA+ID4gIHsKPiA+ID4gICAg
ICAgX19hc21fXyBfX3ZvbGF0aWxlX18gKCJzZmVuY2Uudm1hIiA6IDogOiAibWVtb3J5Iik7Cj4g
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMgYi9hcmNoL3Jpc2N2L21t
L3RsYmZsdXNoLmMKPiA+ID4gaW5kZXggODQwNDUzMGVjMDBmLi43M2MyMjZmNzE5YzcgMTAwNjQ0
Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ID4gPiArKysgYi9hcmNoL3Jp
c2N2L21tL3RsYmZsdXNoLmMKPiA+ID4gQEAgLTExMCwxMSArMTEwLDYgQEAgc3RhdGljIHZvaWQg
X19pcGlfZmx1c2hfdGxiX3JhbmdlX2FzaWQodm9pZCAqaW5mbykKPiA+ID4gICAgICAgbG9jYWxf
Zmx1c2hfdGxiX3JhbmdlX2FzaWQoZC0+c3RhcnQsIGQtPnNpemUsIGQtPnN0cmlkZSwgZC0+YXNp
ZCk7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+IC1zdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgZ2V0
X21tX2FzaWQoc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4gPiA+IC17Cj4gPiA+IC0gICAgIHJldHVy
biBtbSA/IGNudHgyYXNpZChhdG9taWNfbG9uZ19yZWFkKCZtbS0+Y29udGV4dC5pZCkpIDogRkxV
U0hfVExCX05PX0FTSUQ7Cj4gPiA+IC19Cj4gPiA+IC0KPiA+ID4gIHN0YXRpYyB2b2lkIF9fZmx1
c2hfdGxiX3JhbmdlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNtYXNrLAo+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBzaXpl
LAo+ID4gPiAtLQo+ID4gPiAyLjM5LjUKPiA+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
