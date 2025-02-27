Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0358DC19776
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 00:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqWCD//RZnFqZQRf9FE+K8R5TJBDYWLMkRmHzQ4cCmg=; b=BBAxx4rRyXFXBH
	i+guakj5K+p3etEWmlV4iaBp1CvcD2Fnsx/JWUIXNH0Pk1h/aE664l7XRO7ZsON59LIh/lEI29adv
	459/+n7j0xmJSqnCea7xFraMl3//Rj6i6J8U4iYmAusVYIfw3p73SghwT/gfuwP8ql+pwDNWVnxWz
	neXXyKWxVV76I71RY4X1xmM9TXDcUFXQBDkv4Y5BgeyIubOJdtbRafyQq5voX6pzdmkxaQNqAbaQ0
	b10VEXvZd2mxGPEDX4BciZ/j4Z3W4FTwfY1Xxo7CdaSTkW3tEssgI7X7m7KzYpM+tgKPGyKNfG3E9
	MjKLtBHdrGBIslDUIO6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnROW-00000005lZF-2RPB;
	Thu, 27 Feb 2025 00:04:52 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRMx-00000005lGs-3Z7G
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 00:03:17 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2235189adaeso1552125ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2025 16:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740614595; x=1741219395; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eluzqqf3VmMNWgnnw6mwWFDCXsND3S4l7FpeN+tcY8=;
        b=l+/o9p+2lIxGWg8TK7pDvTQRuXdvjVpFiE6Ffdf8If4EWA77DbfMZOVbC3Xmzpy1P+
         ThK8MebCj8O5M2lbzuD5JWyQDyYW22gUNsIN+5gOrTZ+v2uQd31aO3LHwDMLKY9htRV8
         trrYnMIbEj0dfajpsqIpo7XNM3yR4WGEePcld0KPPwwxBQxBueCgrCl236fASJ9Nak4A
         nyC9PHnM5YVtfTBUACqHa1ZyWHO5bTZ6CLUTY3kHCYw7lQRTCAjWcrh/5/1tTVyz91NS
         a9u4LfrarcM/Oqu4+yWVKhiYf+lfvW+biss35eY8i0Op/zc4vmptlaibV67VO9RIoHYD
         +Nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740614595; x=1741219395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eluzqqf3VmMNWgnnw6mwWFDCXsND3S4l7FpeN+tcY8=;
        b=KNqaIkSaBWNY4ln28u+CSNy2J1VV0NzKwzqlvx0InU3xMiKr0rEoec+7jAR9W17YJ0
         Lzoss+IxKBKC3za14mAHpB1H91/iUlm0WVQ/ApBZvV9WCjgkNm9SA+gnbtcNX0QBGPB7
         B76HBJJtD2tbFlsY1hxrw0AAffuwU1OGi1PjxK9gQZLwehp1RIXNAOcFWxB25iazO/3T
         k2HosfejW18xVr+vJkV2OEQ/By787VFMUnCHRVVgvL6nQEy/jdSw1Bo5vCunF9o+KNoH
         ciaT7gd4A5p0eG7a4n9ttehT26IaqJwIGcK7jGG2mPxy7U+KjF4XUm8mQcUSLFWYJiOV
         eHiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpHlblFII6oXAeSTvBS1wnlqmQAFT6y6H5e2F8RcVwujLN/LfUd3sLO3t9M3vzmbRVAn/qeOoSQfCjCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxE9OEsoWeg6i2uz/iRZPYwaE1zWRefWT35f7h4koTHGRuN3gYF
	d+hrVt1TJwUq/i9xD8pPkB0W60Bs+0O6YQhAt2ujUYnZJ1B3V9VvLWM4WT+q9Q4JM90dAn/guHa
	fL85hXYl2BaFfdd9+NSbYYrozOjoiIMYAInnk9Q==
X-Gm-Gg: ASbGncvxajoRsB1X5QG70HGcENDv7w9nY2HupLddZpjDrJaz6xCLv8lJQtk09mRoAZj
	XcwNSjCHUTrefn2LmSWQgMOIz55pmYpLmAP6ZvbIl/SfsOVRlHpDAet/y7PpQ4w9htQ8MefT/sr
	yEZVFV5A==
X-Google-Smtp-Source: AGHT+IFrt1HFaZ54tMfJQXNhrvI9R+jOmDy/nuxxOKVXc1hJS2IXrvPo+lbSmj1tQY9y14Kf7mMsIhJxPaxk/aVTs/c=
X-Received: by 2002:a17:903:289:b0:21f:3823:482b with SMTP id
 d9443c01a7336-2234b08fc3amr20812385ad.25.1740614594829; Wed, 26 Feb 2025
 16:03:14 -0800 (PST)
MIME-Version: 1.0
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-8-835cfa88e3b1@rivosinc.com> <bcb10a3a-162b-4a8c-a479-38f4168cea9a@rivosinc.com>
In-Reply-To: <bcb10a3a-162b-4a8c-a479-38f4168cea9a@rivosinc.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 26 Feb 2025 16:03:04 -0800
X-Gm-Features: AQ5f1Jpty0qq-pYufASOZ8Op-YJ_VW5jRuImaN1P7f7dzUah8vHjK9-7awdIFLs
Message-ID: <CAHBxVyHZ+iw9dC=4xzbW-UdEELdpr-E=FtExGOMnPzUKSRwFvg@mail.gmail.com>
Subject: Re: [PATCH v4 08/21] RISC-V: Add Sscfg extension CSR definition
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_160316_077400_3C369F88 
X-CRM114-Status: GOOD (  18.21  )
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

T24gRnJpLCBGZWIgNywgMjAyNSBhdCAxOjMw4oCvQU0gQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJA
cml2b3NpbmMuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAwNi8wMi8yMDI1IDA4OjIzLCBBdGlzaCBQ
YXRyYSB3cm90ZToKPiA+IEZyb206IEthaXdlbiBYdWUgPGthaXdlbnhAcml2b3NpbmMuY29tPgo+
ID4KPiA+IFRoaXMgYWRkcyB0aGUgc2NvdW50aW5oaWJpdCBDU1IgZGVmaW5pdGlvbiBhbmQgUy1t
b2RlIGFjY2Vzc2libGUgaHBtZXZlbnQKPiA+IGJpdHMgZGVmaW5lZCBieSBzbWNkZWxlZy9zc2Nj
ZmcuIHNjb3VudGluaGliaXQgYWxsb3dzIFMtbW9kZSB0byBzdGFydC9zdG9wCj4gPiBjb3VudGVy
cyBkaXJlY3RseSBmcm9tIFMtbW9kZSB3aXRob3V0IGludm9raW5nIFNCSSBjYWxscyB0byBNLW1v
ZGUuIEl0IGlzCj4gPiBhbHNvIHVzZWQgdG8gZmlndXJlIG91dCB0aGUgY291bnRlcnMgZGVsZWdh
dGVkIHRvIFMtbW9kZSBieSB0aGUgTS1tb2RlIGFzCj4gPiB3ZWxsLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEthaXdlbiBYdWUgPGthaXdlbnhAcml2b3NpbmMuY29tPgo+ID4gLS0tCj4gPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y3NyLmgKPiA+IGluZGV4IDJhZDJkNDkyZTZiNC4uNDJiN2Y0ZjdlYzBmIDEwMDY0NAo+ID4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9jc3IuaAo+ID4gQEAgLTIyNCw2ICsyMjQsMzEgQEAKPiA+ICAjZGVmaW5lIFNNU1RB
VEVFTjBfSFNFTlZDRkcgICAgICAgICAgKF9VTEwoMSkgPDwgU01TVEFURUVOMF9IU0VOVkNGR19T
SElGVCkKPiA+ICAjZGVmaW5lIFNNU1RBVEVFTjBfU1NUQVRFRU4wX1NISUZUICAgNjMKPiA+ICAj
ZGVmaW5lIFNNU1RBVEVFTjBfU1NUQVRFRU4wICAgICAgICAgKF9VTEwoMSkgPDwgU01TVEFURUVO
MF9TU1RBVEVFTjBfU0hJRlQpCj4gPiArLyogSFBNRVZFTlQgYml0cy4gVGhlc2UgYXJlIGFjY2Vz
c2libGUgaW4gUy1tb2RlIHZpYSBTbWNkZWxlZy9Tc2NjZmcgKi8KPiA+ICsjaWZkZWYgQ09ORklH
XzY0QklUCj4gPiArI2RlZmluZSBIUE1FVkVOVF9PRiAgICAgICAgICAgICAgICAgIChfVUwoMSkg
PDwgNjMpCj4gPiArI2RlZmluZSBIUE1FVkVOVF9NSU5IICAgICAgICAgICAgICAgICAgICAgICAg
KF9VTCgxKSA8PCA2MikKPiA+ICsjZGVmaW5lIEhQTUVWRU5UX1NJTkggICAgICAgICAgICAgICAg
ICAgICAgICAoX1VMKDEpIDw8IDYxKQo+ID4gKyNkZWZpbmUgSFBNRVZFTlRfVUlOSCAgICAgICAg
ICAgICAgICAgICAgICAgIChfVUwoMSkgPDwgNjApCj4gPiArI2RlZmluZSBIUE1FVkVOVF9WU0lO
SCAgICAgICAgICAgICAgICAgICAgICAgKF9VTCgxKSA8PCA1OSkKPiA+ICsjZGVmaW5lIEhQTUVW
RU5UX1ZVSU5IICAgICAgICAgICAgICAgICAgICAgICAoX1VMKDEpIDw8IDU4KQo+ID4gKyNlbHNl
Cj4gPiArI2RlZmluZSBIUE1FVkVOVEhfT0YgICAgICAgICAgICAgICAgIChfVUxMKDEpIDw8IDMx
KQo+ID4gKyNkZWZpbmUgSFBNRVZFTlRIX01JTkggICAgICAgICAgICAgICAgICAgICAgIChfVUxM
KDEpIDw8IDMwKQo+ID4gKyNkZWZpbmUgSFBNRVZFTlRIX1NJTkggICAgICAgICAgICAgICAgICAg
ICAgIChfVUxMKDEpIDw8IDI5KQo+ID4gKyNkZWZpbmUgSFBNRVZFTlRIX1VJTkggICAgICAgICAg
ICAgICAgICAgICAgIChfVUxMKDEpIDw8IDI4KQo+ID4gKyNkZWZpbmUgSFBNRVZFTlRIX1ZTSU5I
ICAgICAgICAgICAgICAgICAgICAgIChfVUxMKDEpIDw8IDI3KQo+ID4gKyNkZWZpbmUgSFBNRVZF
TlRIX1ZVSU5IICAgICAgICAgICAgICAgICAgICAgIChfVUxMKDEpIDw8IDI2KQo+Cj4gSGkgQXRp
c2gsCj4KPiBDb3VsZCB5b3UgdXNlIEJJVF9VTC9CSVRfVUxMKCkgPyBXaXRoIHRoYXQgZml4ZWQs
Cj4KCkRvbmUuCgo+IFJldmlld2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2lu
Yy5jb20+Cj4KClRoYW5rcyEKCj4gVGhhbmtzLAo+Cj4gQ2zDqW1lbnQKPgo+ID4gKwo+ID4gKyNk
ZWZpbmUgSFBNRVZFTlRfT0YgICAgICAgICAgICAgICAgICAoSFBNRVZFTlRIX09GIDw8IDMyKQo+
ID4gKyNkZWZpbmUgSFBNRVZFTlRfTUlOSCAgICAgICAgICAgICAgICAgICAgICAgIChIUE1FVkVO
VEhfTUlOSCA8PCAzMikKPiA+ICsjZGVmaW5lIEhQTUVWRU5UX1NJTkggICAgICAgICAgICAgICAg
ICAgICAgICAoSFBNRVZFTlRIX1NJTkggPDwgMzIpCj4gPiArI2RlZmluZSBIUE1FVkVOVF9VSU5I
ICAgICAgICAgICAgICAgICAgICAgICAgKEhQTUVWRU5USF9VSU5IIDw8IDMyKQo+ID4gKyNkZWZp
bmUgSFBNRVZFTlRfVlNJTkggICAgICAgICAgICAgICAgICAgICAgIChIUE1FVkVOVEhfVlNJTkgg
PDwgMzIpCj4gPiArI2RlZmluZSBIUE1FVkVOVF9WVUlOSCAgICAgICAgICAgICAgICAgICAgICAg
KEhQTUVWRU5USF9WVUlOSCA8PCAzMikKPiA+ICsjZW5kaWYKPiA+ICsKPiA+ICsjZGVmaW5lIFNJ
U0VMRUNUX1NTQ0NGR19CQVNFICAgICAgICAgMHg0MAo+ID4KPiA+ICAvKiBtc2VjY2ZnIGJpdHMg
Ki8KPiA+ICAjZGVmaW5lIE1TRUNDRkdfUE1NICAgICAgICAgICAgICAgICAgRU5WQ0ZHX1BNTQo+
ID4gQEAgLTMwNSw2ICszMzAsNyBAQAo+ID4gICNkZWZpbmUgQ1NSX1NDT1VOVEVSRU4gICAgICAg
ICAgICAgICAweDEwNgo+ID4gICNkZWZpbmUgQ1NSX1NFTlZDRkcgICAgICAgICAgMHgxMGEKPiA+
ICAjZGVmaW5lIENTUl9TU1RBVEVFTjAgICAgICAgICAgICAgICAgMHgxMGMKPiA+ICsjZGVmaW5l
IENTUl9TQ09VTlRJTkhJQklUICAgIDB4MTIwCj4gPiAgI2RlZmluZSBDU1JfU1NDUkFUQ0ggICAg
ICAgICAweDE0MAo+ID4gICNkZWZpbmUgQ1NSX1NFUEMgICAgICAgICAgICAgMHgxNDEKPiA+ICAj
ZGVmaW5lIENTUl9TQ0FVU0UgICAgICAgICAgIDB4MTQyCj4gPgo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
