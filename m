Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132ECCAC5B0
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 20:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9YdUzlfZbJhQUvzkTxv3cjr5STbK4E3QB8nqXYVzgBM=; b=QadYBHcvIEMGRO
	bhQTuu1G+2XYPpTNmswgQH9OMeRN2kL89BxQI0Y+Wi/XNtFMrf8m4sGE08GG6y1SrKTAXUuUYcSiX
	C/gTMvXlrZ75L5w5XY917OWb3wRgrvwiv2mi44W7WvSYUXiUGHaQbhg1DGV02IkuxKeHc4FPxu7Wo
	fU5G3oRIZKyvyW5OtIiCOP1k47CSVnNRYcTpyDQDdbyQ4q6UMVY4ijssUKqIBRblEIG/bSQw80h3P
	Q5H1ahUCVG9GSB8ruI88aPj+p7ILZ2gjUOlw9O412RaiEI5FElJS1HwAXZ29jzDI60rncWpVTdycb
	kby1BwL80KdFVX13C/VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4QH5-0000000BD7M-38fj;
	Thu, 02 Oct 2025 20:51:39 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4QH3-0000000BD6g-12NJ
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 20:51:38 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3306b83ebdaso1525312a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Oct 2025 13:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759438295; x=1760043095; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzfulOt3RuNjCZqZotlbZaUDHr7ww1cs1ieFRe/EaTg=;
        b=ofCTyqsMEfmHLgVrRUFPOs8w4pR7Gaw1mBJdfG9h0xkygVp/Vi1IGw6/t5yV8Mmtnk
         1GLQXt6QG5cEvU1ooHmGj+PA/Szghy4iAqpPH7kxdMWyNkaZTMOrTZg1QyteycQZi6YA
         S5zQiReFdVczJMr6ReNCKjsNVe9ezpNFiHExg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759438295; x=1760043095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzfulOt3RuNjCZqZotlbZaUDHr7ww1cs1ieFRe/EaTg=;
        b=GzmrYjgiVsDFM0pA7vNF/jKA6/SsvileGfoTN9Oqb9CjcvSwL8iQjzEjVm+QZSfOq0
         NGCINcykSOPLcAxB5QJUGpDqwgbwyqfwuqHajgXGwPNMwuhAxXVCYOnQPbH3UkHGpZeL
         n2GsQEqLNBhcf6W5g+3VZ3hWaPmWtpIP1l5Uo0sWTPrik0qisaw3PzqSFz/qERWW0ay1
         BkpZjkckkGpYfAxPQ6RHBQTAzP6HJBARWfPmxnpcxyAG7wESVJgZFvaKaMsEozkxekNm
         8O5QYo2Mh5qssWRy+x17ZUGqXGepRA/YEP85YbQyYQRbC2Y1C1xfM9j1BcKEqHxzYvxb
         PxaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+FvurC4DjP51u/oQ8x38PpnqfgvbVCHr41r4tvfeVpNcbsvbPNSBES/FzhMgbi9EzdbUf+KFCn6JCNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyB6WM1IUvwnwyBiYc0IfLVbBeQN0OOyFLdFpVAZlEpIlC/j/cb
	enX5p1KCts6L0jfgJ+xlZJF50PuyObA+Z1cJ/wDi5/41AfPJ5JQ9C81B5d2InzdWDvUkVfCE5Te
	/R0I=
X-Gm-Gg: ASbGncsgRTS+TGRj//dRgMcvrEJB1PiEBw3j8RejKJhlnorFCB2aoNkh5dXzaYWf5O+
	AmaAb4fmLsJesuFLb3icOJEQiiv5w9z5U0iEsbIsvWNY2pi1MBVtFGp0EDo9F5x2LhVo9CXqmAw
	4RPYJkS4v8Ob+QVM3HWt+dMg7XJKvk4/qQ6beGKqhlRYvRu7wKOS4x+67ThS6gV4IML7XFvRBCP
	ENsXx0d8KyNywfefoXc9Gc1G+C3UsRSyiqqBRQD2EH1l7c4rPLpOZCru+jDZjIpweuLEfQw30+L
	CfLWx/lg+IHcMCUGxKSUSLGj0BnN7i2dwEr4rxsCofmJ/9icb1xLkDaE5Z7cDR3dR3QYR1sqqZc
	xb1c2OuMmru+boz+nPWSfGZTDkrS3+gGxbm2h+kUbOD1l24BybvWuZebH52ZmQ0CwO1wYRuRyB6
	4Y3mvZ4aCWpJxVBQ==
X-Google-Smtp-Source: AGHT+IF7U+mq2BDYkaM8aeATvVfICkfMbHX5zDaKEX9YG5E4IUTvYp4fOI51RLksknQL8YDaa90eMA==
X-Received: by 2002:a17:90b:4d11:b0:336:bfcf:c50b with SMTP id 98e67ed59e1d1-339c27dad9amr757106a91.20.1759438294739;
        Thu, 02 Oct 2025 13:51:34 -0700 (PDT)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com. [209.85.214.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6e9d22bsm5859216a91.3.2025.10.02.13.51.34
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 13:51:34 -0700 (PDT)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-279e2554c8fso14253025ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Oct 2025 13:51:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxFtvc3i49cz3rnDuIpyhykMCQdV9k2BBDlYERazEwRl1kKvkD6BJdbBhvlKnYZobGTRxton0wnBkslw==@lists.infradead.org
X-Received: by 2002:a17:902:f609:b0:25f:fe5f:c927 with SMTP id
 d9443c01a7336-28e9a61a7a1mr6113515ad.31.1759438293518; Thu, 02 Oct 2025
 13:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250925084806.89715-1-cuiyunhui@bytedance.com>
 <20250925084806.89715-2-cuiyunhui@bytedance.com> <CAD=FV=VZLYqPQCOEhbH4QtndeG5e1-0wey24fgYNTeFiqd8qJg@mail.gmail.com>
 <CAEEQ3wnwNdTgt6ByHCzM43fhZMLSxwXvYx-AGBpsktraXqif2Q@mail.gmail.com>
 <CAD=FV=X6Xv_WYPMXKtOWLJX7skCoQmia3JbQej_u38qxqAbqDg@mail.gmail.com>
 <CAEEQ3wn0UckgNTJCPCNDtHW8DwWAJR1PXURvH57yfHATYqs7Gw@mail.gmail.com>
 <CAD=FV=XoUw6HWoFLMcgyHhYm7oeTOXCAyvBdpOghggmdvYzp6Q@mail.gmail.com>
 <CAEEQ3w==Ekffs4+Z55AXMV52f+8ht1pWm3JexXCSiB7T6rzppA@mail.gmail.com> <CAEEQ3wkUai4-noA6CQDsOs=Hn3bSB5cdV9tZJZR8_g+o9e-Mpg@mail.gmail.com>
In-Reply-To: <CAEEQ3wkUai4-noA6CQDsOs=Hn3bSB5cdV9tZJZR8_g+o9e-Mpg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 Oct 2025 13:51:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uw=TLx1KPKCdBcJ4BP8+hOcCA+7QLrmfGHCb9uw9u3Pg@mail.gmail.com>
X-Gm-Features: AS18NWAzBOpu8L_1YZexH_YKnsyYsn8PoONF8LzYzDqMVfF7ir8YT7oKetO1D5Y
Message-ID: <CAD=FV=Uw=TLx1KPKCdBcJ4BP8+hOcCA+7QLrmfGHCb9uw9u3Pg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/2] watchdog: move arm64 watchdog_hld
 into common code
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	ziqianlu@bytedance.com, akpm@linux-foundation.org, alex@ghiti.fr, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	catalin.marinas@arm.com, johannes@sipsolutions.net, lihuafei1@huawei.com, 
	mark.rutland@arm.com, masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_135137_317531_EE64D5D0 
X-CRM114-Status: GOOD (  40.84  )
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

SGksCgpPbiBUdWUsIFNlcCAzMCwgMjAyNSBhdCAxMjoxMeKAr0FNIHl1bmh1aSBjdWkgPGN1aXl1
bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+ID4gPiA+ID4gPiA+ID4gK3N0YXRpYyBpbnQg
X19pbml0IGluaXRfd2F0Y2hkb2dfZnJlcV9ub3RpZmllcih2b2lkKQo+ID4gPiA+ID4gPiA+ID4g
K3sKPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgcmV0dXJuIGNwdWZyZXFfcmVnaXN0ZXJfbm90aWZp
ZXIoJndhdGNoZG9nX2ZyZXFfbm90aWZpZXIsCj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIENQVUZSRVFfUE9MSUNZX05PVElGSUVSKTsKPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEkgdGhpbmsgeW91IG5lZWQgdG8gZG8gc29tZXRoaW5n
IHRvIHByZXZlbnQgdGhpcyBmcm9tIGhhcHBlbmluZyBvbiBhbnkKPiA+ID4gPiA+ID4gPiBwbGF0
Zm9ybXMgdGhhdCBvdmVycmlkZSBod19ubWlfZ2V0X3NhbXBsZV9wZXJpb2QoKSwgcmlnaHQ/IFRo
ZXNlCj4gPiA+ID4gPiA+ID4gY3B1ZnJlcSBub3RpZmllcnMgd2lsbCBiZSB1c2VsZXNzIGluIHRo
YXQgY2FzZS4uLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJIHVuZGVyc3RhbmQgdGhpcyBpcyBu
b3QgYSBwcm9ibGVtLiB3YXRjaGRvZ19wZXJmIHVzZXMKPiA+ID4gPiA+ID4gUEVSRl9DT1VOVF9I
V19DUFVfQ1lDTEVTLCB3aGljaCBtZWFucyBpdCBpcyBpbmhlcmVudGx5IGxpbWl0ZWQgYnkgdGhl
Cj4gPiA+ID4gPiA+IENQVSdzIG1haW4gZnJlcXVlbmN5LiBBZnRlciB3ZSBtYWtlIHN1Y2ggYSBj
aGFuZ2UsIGEgbGFyZ2VyIHZhbHVlIG1heQo+ID4gPiA+ID4gPiBiZSB1c2VkIGFzIHRoZSBwZXJp
b2QsIHNvIHRoZSBOTUkgcGVyaW9kIHdpbGwgYmVjb21lIGxvbmdlciwgYnV0IHRoaXMKPiA+ID4g
PiA+ID4gdmFsdWUgd2lsbCBub3QgY2hhbmdlIGFmdGVyIHRoZSBzeXN0ZW0gc3RhcnRzLgo+ID4g
PiA+ID4KPiA+ID4gPiA+IEknbSBub3Qgc3VyZSBJIGZvbGxvdy4gT24geDg2LCBod19ubWlfZ2V0
X3NhbXBsZV9wZXJpb2QoKSBpczoKPiA+ID4gPiA+Cj4gPiA+ID4gPiB1NjQgaHdfbm1pX2dldF9z
YW1wbGVfcGVyaW9kKGludCB3YXRjaGRvZ190aHJlc2gpCj4gPiA+ID4gPiB7Cj4gPiA+ID4gPiAg
IHJldHVybiAodTY0KShjcHVfa2h6KSAqIDEwMDAgKiB3YXRjaGRvZ190aHJlc2g7Cj4gPiA+ID4g
PiB9Cj4gPiA+ID4KPiA+ID4gPiBJIGhhdmUgYWRkZWQgdGhlIG1haW50YWluZXJzIGZvciBhcmNo
L3g4Ni4KPiA+ID4gPgo+ID4gPiA+IDEuIGNwdV9raHogY2FuIGJlIHVuZGVyc3Rvb2QgYXMgcmV0
dXJuaW5nIHRoZSBiYXNlIG9wZXJhdGluZyBmcmVxdWVuY3kKPiA+ID4gPiBvZiBhIENQVSwgc3Vj
aCBhcyAyLjNHSHouIEluIHByYWN0aWNlLCB0aGUgQ1BVJ3MgY29yZSBmcmVxdWVuY3kgbWF5Cj4g
PiA+ID4gZG93bmNsb2NrIHRvIDgwME1IeiB1bmRlciBsb3cgbG9hZCBhbmQgb3ZlcmNsb2NrIHRv
IDQuNEdIeiB1bmRlciBoaWdoCj4gPiA+ID4gbG9hZC4KPiA+ID4gPgo+ID4gPiA+IDIuIEJlY2F1
c2UgdGhlIGV2ZW50IHByb3ZpZGVkIHRvIHRoZSBQTVUgaGFzIHRoZQo+ID4gPiA+IFBFUkZfQ09V
TlRfSFdfQ1BVX0NZQ0xFUyBhdHRyaWJ1dGUsIGFuZCB0aGUgY291bnRlcidzIHZhbHVlIGlzIGJh
c2VkCj4gPiA+ID4gb24gMi4zR0h6LCB0aGUgZXhlY3V0aW9uIGN5Y2xlIG9mIHdhdGNoZG9nX292
ZXJmbG93X2NhbGxiYWNrKCkgaXMgbm90Cj4gPiA+ID4gZml4ZWQ7IGl0IHZhcmllcyB3aXRoIHRo
ZSBDUFUncyBjb3JlIGZyZXF1ZW5jeS4gV2hlbiB0aGUgQ1BVIHJ1bnMgYXQgYQo+ID4gPiA+IGZy
ZXF1ZW5jeSBoaWdoZXIgdGhhbiAyLjNHSHosIHRoZSBOTUkgY3ljbGUgd2lsbCBzaG9ydGVuOyBv
dGhlcndpc2UsCj4gPiA+ID4gaXQgd2lsbCBsZW5ndGhlbi4KPiA+ID4gPgo+ID4gPiA+IDMuIEFm
dGVyIG91ciBtb2RpZmljYXRpb24sIGlmIHRoZSBhcmNoaXRlY3R1cmUgaXMgbm90IGludGVncmF0
ZWQgd2l0aAo+ID4gPiA+IGNwdWZyZXEsIGl0IHJldHVybnMgMCBhbmQgd2lsbCBub3QgdXBkYXRl
IHRoZSBjeWNsZS4gSWYgaW50ZWdyYXRlZAo+ID4gPiA+IHdpdGggY3B1ZnJlcSwgaXQgcmV0dXJu
cyB0aGUgbWF4aW11bSBmcmVxdWVuY3kgc3VwcG9ydGVkIGJ5IHRoZSBDUFUsCj4gPiA+ID4gc28g
dGhlIE5NSSBjeWNsZSBpcyBvbmx5IHNsaWdodGx5IGxlbmd0aGVuZWQsIHdpdGggbm8gaW1wYWN0
IG9uIHRoZQo+ID4gPiA+IGFjdHVhbCBoYXJkbG9ja3VwIGRldGVjdGlvbiBmdW5jdGlvbi4KPiA+
ID4gPgo+ID4gPiA+IDQuIEkgaGF2ZSBhbHNvIGNvbmR1Y3RlZCB0ZXN0czoKPiA+ID4gPiBzdHJl
c3MtbmcgLS1jcHUgMSAtLXRhc2tzZXQgMSAtLWNwdS1sb2FkIDgwCj4gPiA+ID4gZWNobyA4MDAw
MDAgPiBzY2FsaW5nX21heF9mcmVxCj4gPiA+ID4gdHVyYm9zdGF0IHNob3dzIHRoYXQgQnp5X01I
eiBhbmQgVFNDX01IeiBhcmUgODAwIGFuZCAyMzAwIHJlc3BlY3RpdmVseS4KPiA+ID4gPiBBbmQg
dGhlIE5NSSBjeWNsZSBiZWNhbWUgYXBwcm94aW1hdGVseSAzMCBzZWNvbmRzOgo+ID4gPiA+IFsg
MjMwOS40NDI3NDNdIE5NSSB3YXRjaGRvZzogLS0tLS0tIHdhdGNoZG9nIG92ZXJmbG93IGNhbGxi
YWNrLCBjcHUgPSAxCj4gPiA+ID4gWyAyMzQxLjUyNjAzMl0gTk1JIHdhdGNoZG9nOiAtLS0tLS0g
d2F0Y2hkb2cgb3ZlcmZsb3cgY2FsbGJhY2ssIGNwdSA9IDEKPiA+ID4KPiA+ID4gV2hldGhlciBv
ciBub3QgaGF2aW5nIHg4NiBhbmQgcG93ZXJwYyBzdGFydCBsb29raW5nIGF0IGNwdWZyZXEgaXMg
YW4KPiA+ID4gaW1wcm92ZW1lbnQsIGNlcnRhaW5seSBpdCBpcyBhIGNoYW5nZSBpbiBiZWhhdmlv
ciwgcmlnaHQ/IElmIHdlJ3JlCj4gPiA+IHJlYWxseSBjaGFuZ2luZyB0aGUgYmVoYXZpb3IgaGVy
ZSB0aGVuIHRoZSBjb21taXQgc3ViamVjdCBhbmQgY29tbWl0Cj4gPiA+IG1lc3NhZ2UgbmVlZCB0
byBtZW50aW9uIHRoaXMuIFJpZ2h0IG5vdyB0aGlzIGlzIGJpbGxlZCBhcyBhIHNpbXBsZQo+ID4g
PiByZW5hbWUuLi4KPiA+ID4KPiA+ID4gSSBkb24ndCBwZXJzb25hbGx5IGhhdmUgbG90cyBvZiBl
eHBlcmllbmNlIHdpdGggeDg2IGNwdWZyZXEgYnV0IEkgZG8KPiA+ID4ga25vdyBpdCBkb2Vzbid0
IHdvcmsgcXVpdGUgdGhlIHNhbWUgYXMgaG93IGl0IGRvZXMgb24gYXJtLiBJdCB3b3VsZAo+ID4g
PiBkZWZpbml0ZWx5IGJlIGdvb2QgdG8gZ2V0IHNvbWVvbmUgb24geDg2IC8gcG93ZXJwYyB0byBt
YWtlIHN1cmUgdGhhdAo+ID4gPiB0aGV5IGFyZSBoYXBweSB3aXRoIHRoaXMuIC4uLm9yIHlvdSBq
dXN0IGtlZXAgbWFraW5nIGl0IHdvcmsgdGhlIHdheQo+ID4gPiBpdCBkaWQgYmVmb3JlIGFuZCB0
aGVuIHlvdSBkb24ndCBoYXZlIHRvIHdvcnJ5IGFib3V0IGdldHRpbmcgYW55Cj4gPiA+IGJ1eS1p
biBmcm9tIHg4NiAvIHBvd2VycGMgZm9sa3MuIFVwIHRvIHlvdSwgSSBndWVzcy4KPiA+Cj4gPiBX
ZWxsLCBJIGZ1bGx5IGFncmVlIHdpdGggeW91ciBzdWdnZXN0aW9uLiBXaGF0IEkgY2FuIHRoaW5r
IG9mIGZvciBub3cKPiA+IGlzIHdyYXBwaW5nIHRoZSBuZXdseSBhZGRlZCBjb250ZW50IHdpdGgg
I2lmIGRlZmluZWQoQ09ORklHX0FSTTY0KSB8fAo+ID4gZGVmaW5lZChDT05GSUdfUklTQ1YpLgo+
Cj4gSeKAmXZlIGFsc28gdGhvdWdodCBvZiBhbiBhbHRlcm5hdGl2ZSBhcHByb2FjaDogYWRkIGEg
Z2VuZXJpYwo+IFdBVENIRE9HX1BFUkZfQURKVVNUX1BFUklPRCB0byAvbGliL0tjb25maWcuZGVi
dWcsIHRoZW4gaGF2ZSB0aGUKPiBLY29uZmlnIGZpbGVzIGZvciBhcmNoL2FybTY0IGFuZCByaXNj
diBzZWxlY3QKPiBXQVRDSERPR19QRVJGX0FESlVTVF9QRVJJT0QuIFdoYXTigJlzIHlvdXIgdGFr
ZSBvbiB0aGlzPwo+Cj4gRG8geW91IGhhdmUgYSBtb3JlIGVsZWdhbnQgYXBwcm9hY2ggdG8KClll
cywgdGhpcyBmZWVscyByaWdodCB0byBtZS4gSSB3YXMgZ29pbmcgdG8gc3VnZ2VzdCB0aGlzIGlu
IHJlc3BvbnNlCnRvIHlvdXIgb3RoZXIgbWVzc2FnZSBhbmQgdGhlbiBJIHNhdyB0aGlzIGZvbGxv
d3VwLiA6LSkKCi1Eb3VnCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
