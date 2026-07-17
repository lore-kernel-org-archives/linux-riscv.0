Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7ACC4451B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 17:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvQ/sfSlURAMpVRZg7H6VF6eqsUBmB424wumXkB9Cxg=; b=dezTp+heJPeH+j
	pjxlQqZSsKpUWbHK+cU/9GyKNRiVcUAqcuBHSo8DBA+1QIAqryMMnGFwFXRfqABpxZhyIGkcunEar
	t2MSKG/r/OIO/17kobGhEHI7tVdtCla2qEt+tb+WgVCNPoOYDpLv3JZBQTaw6OISnztVZ9bjA1+dv
	KXVHIZuRGB29umln17b4eOKJPGPC6ChyFG9q1COv3GGZUebuRyoj3DQ8Mp9D9kpJYjS/dCpVKCEwB
	LzK5oCX6AtPsLkH7i1sfjBKmdzPr+UNYqCRU+EKR7HYbQfrXkM+wAFY4fi1aSVBDlNfXykIUiEoks
	jm5VpzpGjKBcWZyuULdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkm9Q-00000002qX1-11zm;
	Fri, 17 Jul 2026 17:15:04 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkm9N-00000002qVN-0XDS
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 17:15:02 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5aeb5e85378so8695655e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jul 2026 10:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784308498; x=1784913298; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R8FryPYFYCyHP2tVntQjof5QiNSW+WztEMic5mCIZYA=;
        b=bmTGruSxOKADoUVGSChHQrIvQ6MiZ4pNDfZDrDin3GwiIeN8i/8cjdPHqEkz0b6o9w
         Ykv4/W1h8OG4RkOzQxtAfCehnmfPzVWFxMIbX/AnmV/axBjbIF6Tyw19+wxKPg2vxne3
         8MzR8OfDqdJeEKl2d4RSEjo7rkl9mJ9+S+4tpuzu5KDdrbrsEyTljaHpjJNBg2Q6F/8s
         MHyKaSluc5OMPCRZ5zssJIGL5e0Ab3BUifm2ieye/xzw2cbTANghuoJIbOAYg0iwG/uX
         CtuT7dn+q1pTCg0o3pK+OSfTHcM30uv97WBAIAK8Ju5ysxvLkrnEu+vY1KYDlFoCKpOl
         xFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784308498; x=1784913298;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R8FryPYFYCyHP2tVntQjof5QiNSW+WztEMic5mCIZYA=;
        b=W2AbFNu3gMB9xSMoYfG4C/bRTXE6u/iyJ9pO5NLQGurekazMpAuuHpt9EqmPHmLAk4
         0NU+s6ctz3ebSgNpVngPDGQWgV0L4dTUFtX4XLL8bpj+s3kzn2sHWVN+5xnlPGsnjvqI
         VcgmyqAwyhp6YUD9Va8GUCB3McBym3sDRA39Ms3ZkoYujD+Cj3k4L1UyFMdO9wpwVJDG
         5aJnVRh+Ix605J6jgeX5iIRDuHSG/XG8vGm8luTnQ9D/Rd86gVD++rHD5loF5ttC+VG/
         Ga5htlJHlVTLbRX3H1Yx/KVflkprcDIo3TA5i+2hui8dRyUgDOa7f4GHIoJDXI5ku247
         PIrw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/Oq0c+KJk/zc6oQmYWndhXui3UZtfnT0SKiHp30Lljt4kKQivoWwEG3ToprffhLmTTknGeNL92ydG2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrdHRu7bnc3CWFXsdwXfaigCEgT6LX7XakLiWIYojKGYMkbrjO
	EWdKhiyYO3ONViuEuzXfdkfh+RszRZmQsAn2/jxi2J2Af+PaeRRgvMV7
X-Gm-Gg: AfdE7cnUNWmNx9pg7lyM/0WuFWXC6cx2PvZL0SgAFETDwWEaP5lpFIn/wDw3GLTVLap
	5KNnWiLvrdjtFt+qmBUfu0DWwvAfB5wdMyiM4ml5HjI5bAtqUWCYRecz2IsMe4TYbR1YazB7FmI
	LEyFxI6qE+RJGS16PdwODRUaptxt65v/nt+6iX/LM8McM3c01eAWI0rMYHoqidvV/IcJ52SVFkj
	1aVgdur6d4tTCkuoVmuI3YvZt8GH62KeaqqLfTID5Qg2q2hQdG2zl0SGSLi4uSpPqIg9fYAUVbX
	XCg24VGmSHCfBCOGfaE4hqKgYpLdseslYWI307I9q9zLXLNmun9gcrJjdU/rBRq/5+70z8ClSzw
	xWimz3qtdkXtTeg5jLr6pAd6WoLvLMRPciZe12Irzh66Jh2Bt2qtncUyzCO0kYLTFRTT/ehH1fF
	xPUNKNE85z4hKvXDik
X-Received: by 2002:a05:6512:2250:b0:5b0:1708:afa6 with SMTP id 2adb3069b0e04-5b28f9a7933mr815354e87.43.1784308498311;
        Fri, 17 Jul 2026 10:14:58 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e26118sm485318e87.79.2026.07.17.10.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 10:14:57 -0700 (PDT)
Date: Fri, 17 Jul 2026 19:14:57 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Paul Walmsley <pjw@kernel.org>, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com
Subject: Re: [External] Re: [PATCH v2 1/3] riscv: mm: Use ASID in
 update_mmu_cache()
Message-ID: <alphELxiS4tIEymG@soda.int.kasm.eu>
References: <20260715132009.10634-1-luxu.kernel@bytedance.com>
 <20260715132009.10634-2-luxu.kernel@bytedance.com>
 <alkD_YBF1HhbycqX@soda.int.kasm.eu>
 <CAPYmKFsA=fFKK5RtsCo1GQA0JqdxQ4h8O=GS+QXOBGPPcJrtuQ@mail.gmail.com>
 <CAPYmKFthTvFo4UJEd0GaNxM_S6j5kg5EK=b0gEr82Tr7ekHc_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPYmKFthTvFo4UJEd0GaNxM_S6j5kg5EK=b0gEr82Tr7ekHc_Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_101501_210131_8FB5064C 
X-CRM114-Status: GOOD (  36.27  )
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

T24gMjAyNi0wNy0xOCAwMDo1NzowNiArMDgwMCwgWHUgTHUgd3JvdGU6Cj4gSGkgUGF1bCwKPiAK
PiBBIGdlbnRsZSBwaW5nLgo+IAo+IEkgaGF2ZSBubyBpZGVhIHdoYXQgSSBjYW4gZG8gcmVnYXJk
aW5nIGxpbnV4LW5leHQuIENvdWxkIHlvdSBwbGVhc2UKPiBoZWxwIHJldmVydCB0aGUgcGF0Y2gg
ZnJvbSB2ZXJzaW9uIDEgYW5kIGNoZXJyeS1waWNrIGFsbCB0aGUgcGF0Y2hlcwo+IGZyb20gdmVy
c2lvbiAyIGluc3RlYWQ/IE9yIHdoYXQgY2FuIEkgZG8gZm9yIHRoaXM/CgpQYXVsIGhhcyB1cGRh
dGVkIHRoZSBmb3ItbmV4dCBicmFuY2ggYXQKZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3Jpc2N2L2xpbnV4LmdpdCBzbyBpdCBzaG91bGQKc29ydCBpdHNlbGYgb3V0IHRv
IGVpdGhlciB0b2RheSdzIG9yIG1vbmRheSdzIG5leHQgdmVyc2lvbiAoZGVwZW5kaW5nIG9uCmlm
IHRoZSB0cmVlIGhhcyBhbHJlYWR5IGJlZW4gcHVsbGVkIG9yIG5vdCkuIEV2ZW4gaWYgaXQgaXMg
bm90IHB1bGxlZAp1bnRpbCBtb25kYXkgSSB0aGluayBpdCB3aWxsIGJlIGZpbmUsIHRoaXMgaXMg
d2hhdCBsaW51eC1uZXh0IGlzIGZvcgphZnRlciBhbGwuCgpSZWdhcmRzLApLbGFyYSBNb2RpbgoK
PiAKPiBCZXN0IHJlZ2FyZHMsCj4gWHUgTHUKPiAKPiBPbiBGcmksIEp1bCAxNywgMjAyNiBhdCAx
MDoxMeKAr0FNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+Cj4g
PiBIaSBQYXVsLAo+ID4KPiA+IEtsYXJhIGZvdW5kIHRoYXQgbGludXgtbmV4dCBjaGVycnktcGlj
a3MgdGhlIG5ldyB2ZXJzaW9uIG9mIHBhdGNoIDIKPiA+IHdoaWxlIHBpY2tpbmcgdGhlIG9sZCB2
ZXJzaW9uIG9mIHBhdGNoIDEsIHdoaWNoIGxlYWRzIHRvIGFuCj4gPiB1bmluaXRpYWxpemVkIGFz
aWQuIENvdWxkIHlvdSBwbGVhc2UgaGVscCBjb3JyZWN0IHRoaXM/Cj4gPgo+ID4gQmVzdCByZWdh
cmRzLAo+ID4gWHUgTHUKPiA+Cj4gPiBPbiBGcmksIEp1bCAxNywgMjAyNiBhdCAxMjoyNeKAr0FN
IEtsYXJhIE1vZGluIDxrbGFyYXNtb2RpbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBI
aSwKPiA+ID4KPiA+ID4gT24gMjAyNi0wNy0xNSAyMToyMDowNyArMDgwMCwgWHUgTHUgd3JvdGU6
Cj4gPiA+ID4gT25seSBmbHVzaCBUTEIgZW50cmllcyBmb3IgdGhlIHNwZWNpZmllZCBtbSBpbiB1
cGRhdGVfbW11X2NhY2hlX3JhbmdlKCkuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBY
dSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggIHwgNCArKystCj4gPiA+ID4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8IDUgKysrKysKPiA+ID4gPiAgYXJjaC9yaXNjdi9t
bS90bGJmbHVzaC5jICAgICAgICAgIHwgNSAtLS0tLQo+ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGd0YWJsZS5oCj4gPiA+ID4gaW5kZXggNWQ1NzU2YmRhODJlLi45OTI2NTU2MDk5YWUg
MTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+
ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gPiA+IEBAIC01
NjgsNiArNTY4LDggQEAgc3RhdGljIGlubGluZSB2b2lkIHVwZGF0ZV9tbXVfY2FjaGVfcmFuZ2Uo
c3RydWN0IHZtX2ZhdWx0ICp2bWYsCj4gPiA+ID4gICAgICAgICAgICAgICBzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyZXNzLAo+ID4gPiA+ICAgICAgICAgICAg
ICAgcHRlX3QgKnB0ZXAsIHVuc2lnbmVkIGludCBucikKPiA+ID4gPiAgewo+ID4gPiA+ICsgICAg
IHVuc2lnbmVkIGxvbmcgYXNpZCA9IGdldF9tbV9hc2lkKHZtYS0+dm1fbW0pOwo+ID4gPiA+ICsK
PiA+ID4KPiA+ID4gSXQgc2VlbXMgdGhlIG9sZCB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2ggaXMgc3Rp
bGwgdXNlZCAoYXQgbGVhc3QgaW4KPiA+ID4gbmV4dC0yMDI2NTA3MTYsIDE1Y2UxZDdjNGRkZmUw
ZGZmMDBmY2FlZTRjY2FlZWYzZWZiYzYyYzYpLCB3aGljaCBtZWFucwo+ID4gPiBhc2lkIGlzIG5v
dCBpbml0aWFsaXNlZCBoZXJlLiBXZSBpbnN0ZWFkIGhhdmU6Cj4gPiA+Cj4gPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGd0YWJsZS5oCj4gPiA+IGluZGV4IDVkNTc1NmJkYTgyZS4uNzU1NDk1YTU0MmNjIDEw
MDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gPiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gPiBAQCAtNTY4LDYgKzU2
OCw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB1cGRhdGVfbW11X2NhY2hlX3JhbmdlKHN0cnVjdCB2
bV9mYXVsdCAqdm1mLAo+ID4gPiAgICAgICAgICAgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywKPiA+ID4gICAgICAgICAgICAgICAgIHB0ZV90
ICpwdGVwLCB1bnNpZ25lZCBpbnQgbnIpCj4gPiA+ICB7Cj4gPiA+ICsgICAgICAgdW5zaWduZWQg
bG9uZyBhc2lkOwo+ID4gPiArCj4gPiA+ICAgICAgICAgLyoKPiA+ID4gICAgICAgICAgKiBTdnZw
dGMgZ3VhcmFudGVlcyB0aGF0IHRoZSBuZXcgdmFsaWQgcHRlIHdpbGwgYmUgdmlzaWJsZSB3aXRo
aW4KPiA+ID4gICAgICAgICAgKiBhIGJvdW5kZWQgdGltZWZyYW1lLCBzbyB3aGVuIHRoZSB1YXJj
aCBkb2VzIG5vdCBjYWNoZSBpbnZhbGlkCj4gPiA+IEBAIC01ODMsMTAgKzU4NSwxMSBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgdXBkYXRlX21tdV9jYWNoZV9yYW5nZShzdHJ1Y3Qgdm1fZmF1bHQgKnZt
ZiwKPiA+ID4gICAgICAgICAgKiBSZWx5aW5nIG9uIGZsdXNoX3RsYl9maXhfc3B1cmlvdXNfZmF1
bHQgd291bGQgc3VmZmljZSwgYnV0Cj4gPiA+ICAgICAgICAgICogdGhlIGV4dHJhIHRyYXBzIHJl
ZHVjZSBwZXJmb3JtYW5jZS4gIFNvLCBlYWdlcmx5IFNGRU5DRS5WTUEuCj4gPiA+ICAgICAgICAg
ICovCj4gPiA+ICsgICAgICAgYXNpZCA9IGdldF9tbV9hc2lkKHZtYS0+dm1fbW0pOwo+ID4gPiAg
ICAgICAgIHdoaWxlIChuci0tKQo+ID4gPiAtICAgICAgICAgICAgICAgbG9jYWxfZmx1c2hfdGxi
X3BhZ2UoYWRkcmVzcyArIG5yICogUEFHRV9TSVpFKTsKPiA+ID4gLQo+ID4gPiArICAgICAgICAg
ICAgICAgbG9jYWxfZmx1c2hfdGxiX3BhZ2VfYXNpZChhZGRyZXNzICsgbnIgKiBQQUdFX1NJWkUs
IGFzaWQpOwo+ID4gPiAgfQo+ID4gPiArCj4gPiA+ICAjZGVmaW5lIHVwZGF0ZV9tbXVfY2FjaGUo
dm1hLCBhZGRyLCBwdGVwKSBcCj4gPiA+ICAgICAgICAgdXBkYXRlX21tdV9jYWNoZV9yYW5nZShO
VUxMLCB2bWEsIGFkZHIsIHB0ZXAsIDEpCj4gPiA+Cj4gPiA+Cj4gPiA+IFRoaXMgbWVhbnMgdGhh
dCBwYXRjaCAyIG9mIHRoaXMgc2VyaWVzIHdpbGwgdXNlIHRoZSB1bmluaXRpYWxpc2VkIGFzaWQK
PiA+ID4gZm9yIGxvY2FsX3N2aW52YWxfdm1hKCkgYW5kIEkgZ2V0IHRoZSBzYW1lIGJlaGF2aW91
ciBhcyBiZWZvcmUgKGhhbmcgb24KPiA+ID4gaW5pdHJhbWZzKS4gSWYgSSByZXZlcnQgdGhlIHR3
byBwYXRjaGVzIG9mIHRoaXMgc2VyaWVzIHdoaWNoIGFyZSBpbiBuZXh0Cj4gPiA+IGFuZCBhcHBs
eSB0aGlzIGFnYWluIGl0J3MgZmluZS4KPiA+ID4KPiA+ID4gUmVnYXJkcywKPiA+ID4gS2xhcmEg
TW9kaW4KCi4uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
