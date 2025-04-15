Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4652C369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 17:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6lsQALj2KQWawO/ChejxK46BQsgav9OKlZkK3QPxsw=; b=RTWLT5PzKtbEn7
	hoB3yKIVCNiaJdzM574ndIvvn0BsR8RXJvn1aP0gV+/+0RxFQvifjOAiIZ6jr8uNrkxaNmmLbixVT
	M81PbWyB2TI8fx7YjTu26IcneICnHuAbHFjSmqYEsNPJGOc6p3j3JGYZPFVtCsadaWRdo7fe8bCHE
	A+hvBkgzawH6JMb+mIqNgVnp6blp/4eKA7SitP2Y89cnBj3dGrrbEvsuRhQJOuTGdndMZ97pnAqj3
	5yiVNLc69/T6dqLPWETok+xRbocF7xBhHP+OumHYfGM6u7K3AGVmvFyWzXpfSXiOjQfRPTXUYCeC1
	pcVxE961mtpx3g9vCYJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jgc-00000006V2N-1VWM;
	Tue, 15 Apr 2025 17:03:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jNN-00000006Ry6-3S4y
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 16:43:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BA4F61360
	for <linux-riscv@lists.infradead.org>; Tue, 15 Apr 2025 16:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75FFDC4AF09
	for <linux-riscv@lists.infradead.org>; Tue, 15 Apr 2025 16:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744735388;
	bh=u95dBuLRjhdfXitfe59a5c3chs1JKSGBptgj8nnq0po=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SSTRW9oxwi6t6BeOmnz5XKCkgql93kGJJvL3lgjDd3s7AgKf9v2H8X/sQVy78qbRF
	 XlUR/AMhJniKi3dPiKEHsx+DBL1hXeuZrsgvmfb+1nSolGXDHnXjmG+BjElH0lWVm2
	 7KlwCKos259oJJXMaimUODj95ATn1ZH2mqJt18dKTc9p9Wb0s+MKiR7kuEtPVvQWqp
	 E6qvGRZWHtj4qppb2jANy0p3WACo/EV2JsN9c6EUWUvtHRPGuo8vKjgQQ8ibY84S0H
	 ICBokVM6NJhYXK3dHZe5Wcf3CxdTdjphQV5VLTU1Py8nNdtXxehYGJWar/Z4kpO9rq
	 Xdnj5akXzs0og==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2c7b2c14455so3739916fac.2
        for <linux-riscv@lists.infradead.org>; Tue, 15 Apr 2025 09:43:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXbSwJYYp6CSSoi3gqqzjXOpuw5rnjSy6rl94ubOX95WQ2pFuiC4R9GHeXZkztzIWDJOGYQba8D/PllIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwN0A0sChWAXCXWb1a1MVWoBfDuumxjuvyfQVhHWzkj9vKMf0wG
	61mv3QSx9rOOs090dkILT9DDdNg1DoITlMLN+euprh0MBP+EM17Hs8DZjqujXxYVY3tNe9+ygrE
	y5s3WWZqPpMe2gMy4s2rTEM2iod8=
X-Google-Smtp-Source: AGHT+IGyns0wKcIA6JT3DidO5LCfWPBQ89zz6U8ulYdw6epDaXaSmmPM+mVRcjXZP13jUV0tTep4Qgkj6OohB9PkpUw=
X-Received: by 2002:a05:6871:3743:b0:29e:27b6:bea5 with SMTP id
 586e51a60fabf-2d0d5f2462dmr9973324fac.25.1744735387716; Tue, 15 Apr 2025
 09:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250414185314eucas1p1ae57b937773a2ed4ce8d52d5598eb028@eucas1p1.samsung.com>
 <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com> <20250414-apr_14_for_sending-v2-1-70c5af2af96c@samsung.com>
In-Reply-To: <20250414-apr_14_for_sending-v2-1-70c5af2af96c@samsung.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 15 Apr 2025 18:42:56 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0irRq8_p35vf41_ZgomW0X=KZN+0HqwU2K9PvPRm8iZQA@mail.gmail.com>
X-Gm-Features: ATxdqUFwFy97e7VWF90uH5loEGafOroniuxmOCaFHFC3QunM9DSgMFJWfDaMgSM
Message-ID: <CAJZ5v0irRq8_p35vf41_ZgomW0X=KZN+0HqwU2K9PvPRm8iZQA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] PM: device: Introduce platform_resources_managed flag
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
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

T24gTW9uLCBBcHIgMTQsIDIwMjUgYXQgODo1M+KAr1BNIE1pY2hhbCBXaWxjenluc2tpCjxtLndp
bGN6eW5za2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Cj4gSW50cm9kdWNlIGEgbmV3IGRldl9wbV9p
bmZvIGZsYWcgLSBwbGF0Zm9ybV9yZXNvdXJjZXNfbWFuYWdlZCwgdG8KPiBpbmRpY2F0ZSB3aGV0
aGVyIHBsYXRmb3JtIFBNIHJlc291cmNlcyBzdWNoIGFzIGNsb2NrcyBvciByZXNldHMgYXJlCj4g
bWFuYWdlZCBleHRlcm5hbGx5IChlLmcuIGJ5IGEgZ2VuZXJpYyBwb3dlciBkb21haW4gZHJpdmVy
KSBpbnN0ZWFkIG9mCj4gZGlyZWN0bHkgYnkgdGhlIGNvbnN1bWVyIGRldmljZSBkcml2ZXIuCgpJ
IHRoaW5rIHRoYXQgdGhpcyBpcyBnZW5wZC1zcGVjaWZpYyBhbmQgc28gSSBkb24ndCB0aGluayBp
dCBiZWxvbmdzIGluCnN0cnVjdCBkZXZfcG1faW5mby4KClRoZXJlIGlzIGRldi0+cG93ZXIuc3Vi
c3lzX2RhdGEtPmRvbWFpbl9kYXRhLCB3aHkgbm90IHVzZSBpdCBmb3IgdGhpcz8KCkFsc28sIGl0
IHNob3VsZCBiZSBkb2N1bWVudGVkIHdheSBtb3JlIGNvbXByZWhlbnNpdmVseSBJTVYuCgpXaG8g
aXMgc3VwcG9zZWQgdG8gc2V0IGl0IGFuZCB3aGVuPyAgV2hhdCBkb2VzIGl0IG1lYW4gd2hlbiBp
dCBpcyBzZXQ/Cgo+IFRoaXMgZmxhZyBlbmFibGVzIGRldmljZSBkcml2ZXJzIHRvIGNvb3BlcmF0
ZSB3aXRoIFNvQy1zcGVjaWZpYyBQTQo+IGRvbWFpbnMgYnkgY29uZGl0aW9uYWxseSBza2lwcGlu
ZyBtYW5hZ2VtZW50IG9mIGNsb2NrcyBhbmQgcmVzZXRzIHdoZW4KPiB0aGUgcGxhdGZvcm0gb3du
cyB0aGVtLgo+Cj4gVGhpcyBpZGVhIHdhcyBkaXNjdXNzZWQgb24gdGhlIG1haWxpbmcgbGlzdCBb
MV0uCj4KPiBbMV0gLSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FQRHlLRnE9QkY1ZjJp
X1NyMWNtVnF0VkFNZ3I9MEZxc2tzTDdSSFpMS24rK3kwdXdnQG1haWwuZ21haWwuY29tLwo+Cj4g
U2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNv
bT4KPiAtLS0KPiAgaW5jbHVkZS9saW51eC9kZXZpY2UuaCB8IDExICsrKysrKysrKysrCj4gIGlu
Y2x1ZGUvbGludXgvcG0uaCAgICAgfCAgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZGV2aWNlLmggYi9pbmNsdWRl
L2xpbnV4L2RldmljZS5oCj4gaW5kZXggNzllNDlmZTQ5NGI3YzRjNzBkOTAyODg2ZGI2M2M0Y2Zl
NWI0ZGU0Zi4uM2U3YTM2ZGQ4NzRjZmI2Yjk4ZTI0NTFjN2E4NzY5ODlhYTlmMTkxMyAxMDA2NDQK
PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2RldmljZS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9kZXZp
Y2UuaAo+IEBAIC04ODEsNiArODgxLDE3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBkZXZpY2VfYXN5
bmNfc3VzcGVuZF9lbmFibGVkKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgICAgICAgIHJldHVybiAh
IWRldi0+cG93ZXIuYXN5bmNfc3VzcGVuZDsKPiAgfQo+Cj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBk
ZXZpY2VfcGxhdGZvcm1fcmVzb3VyY2VzX3BtX21hbmFnZWQoc3RydWN0IGRldmljZSAqZGV2KQoK
Q291bGQgdGhpcyBmdW5jdGlvbiBuYW1lIGJlIHNob3J0ZXI/Cgo+ICt7Cj4gKyAgICAgICByZXR1
cm4gZGV2LT5wb3dlci5wbGF0Zm9ybV9yZXNvdXJjZXNfbWFuYWdlZDsKPiArfQo+ICsKPiArc3Rh
dGljIGlubGluZSB2b2lkIGRldmljZV9wbGF0Zm9ybV9yZXNvdXJjZXNfc2V0X3BtX21hbmFnZWQo
c3RydWN0IGRldmljZSAqZGV2LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgdmFsKQoKRGl0dG8/Cgo+ICt7Cj4gKyAgICAg
ICBkZXYtPnBvd2VyLnBsYXRmb3JtX3Jlc291cmNlc19tYW5hZ2VkID0gdmFsOwo+ICt9Cj4gKwo+
ICBzdGF0aWMgaW5saW5lIGJvb2wgZGV2aWNlX3BtX25vdF9yZXF1aXJlZChzdHJ1Y3QgZGV2aWNl
ICpkZXYpCj4gIHsKPiAgICAgICAgIHJldHVybiBkZXYtPnBvd2VyLm5vX3BtOwo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L3BtLmggYi9pbmNsdWRlL2xpbnV4L3BtLmgKPiBpbmRleCBmMGJk
OGZiYWU0ZjJjMDljNjNkNzgwYmIyNTI4NjkzYWNmMmQyZGExLi5jZDZjYjU5Njg2ZTRhNWU5ZWFh
MjcwMWQxZTQ0YWYyYWJiZmQ4OGQxIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvcG0uaAo+
ICsrKyBiL2luY2x1ZGUvbGludXgvcG0uaAo+IEBAIC02NzAsNiArNjcwLDcgQEAgc3RydWN0IGRl
dl9wbV9pbmZvIHsKPiAgICAgICAgIGJvb2wgICAgICAgICAgICAgICAgICAgIG5vX3BtOjE7Cj4g
ICAgICAgICBib29sICAgICAgICAgICAgICAgICAgICBlYXJseV9pbml0OjE7ICAgLyogT3duZWQg
YnkgdGhlIFBNIGNvcmUgKi8KPiAgICAgICAgIGJvb2wgICAgICAgICAgICAgICAgICAgIGRpcmVj
dF9jb21wbGV0ZToxOyAgICAgIC8qIE93bmVkIGJ5IHRoZSBQTSBjb3JlICovCj4gKyAgICAgICBi
b29sICAgICAgICAgICAgICAgICAgICBwbGF0Zm9ybV9yZXNvdXJjZXNfbWFuYWdlZDoxOwo+ICAg
ICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgZHJpdmVyX2ZsYWdzOwo+ICAgICAgICAgc3Bp
bmxvY2tfdCAgICAgICAgICAgICAgbG9jazsKPiAgI2lmZGVmIENPTkZJR19QTV9TTEVFUAo+Cj4g
LS0KPiAyLjM0LjEKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
