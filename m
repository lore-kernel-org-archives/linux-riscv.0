Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F84CFC60D
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 07:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ib9U9wnEQcseAPt7epjRKEymxwePgCOS8aWTIED0HmI=; b=Zn7EZDgSXkv3Sh
	fmgCQdJV3BQh5Za0u9e/U2zxsx/yXVTL8LpStTMuSvPuZY3YpFNgZmZmLOV+paLxDGHt5c2pQXsxS
	ESba+RgbIbGdYqSbIIHtSgTQEIoUCJOFeUEj/4+UV6tdTZVCxh+fZdjz+QTwghb2LP+oG1dZ507G8
	UgTGeYncVkjWCJOVD71hnKp5mO6R4JRl27YFVzsz3bAsSAktGL0jl4Twiy00R3Rmt+wZAHyDdlwL0
	eo3lBaaSGoX/X9ShM7GBRJ+RX3qLly+x1NCEZKhjZNHuPKMFLKdeAmrzJTcYQCZM6ZJ8Whbpo6PN9
	bEpMkNCfnO/HLrL6VCdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szABi-0000000FYR8-0Y79;
	Fri, 11 Oct 2024 07:35:50 +0000
Received: from mail-yb1-f181.google.com ([209.85.219.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szA2d-0000000FX1A-2qTe
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 07:26:29 +0000
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e2923d5b87aso189854276.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 00:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728631586; x=1729236386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQQ1VEp/hWCoHnkuuRaXbGE5WhacSoFckCw5LF0pLDA=;
        b=oyK0j8o4E2+GGM7gyD6nJp/+D2hLlMJonQX6pWgHo4SQJ0yDAlrp254CwKSe6kd6yb
         R7S4ANqqHzMkwNMyBse56vZZ1jVyWqvsDLn7wEttLfNxIJVYhrUe22iEIzJUsHiuwEA9
         ABsr+NP8OcVElx9Z/iKYk5ODeyBEkZr/sREN/BL58NqcKmk5HaY5xC8iBj9nECLTvwxD
         BXFlb0TcQEBJ1VhDjQ7rgjzDFvfUDc0egmeqCQ8VznU+GhnErm6YzM9WEucdlYvXquYY
         YkIOg0JzF26BEmzeROHHZVQDZ7v7TbcXLTvYZuPf4ED4pmDS43YdLpnEW7XKZ6mfOopO
         NAkw==
X-Forwarded-Encrypted: i=1; AJvYcCUOGAAV0Fjuiq5/UE6eYDhPywt0sBAZyg77hRUb6oj3LdqUwwYa0ozIB5hdBE3E6G3DE9W/tZ3kboZqwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMa1b8qjzd5FUnRJzgB9JvBpCqVs/Pngk6+o20nfpBDHBgl2ej
	EANr4zGndWMcOVNlJUYyESx0wvrfjY8sp4ZmcfYd0z0Bs2DbM7ijhvZ0hEuUXTQ=
X-Google-Smtp-Source: AGHT+IE8zJgjimNGzviMS8+8Lx8oH0oF35rcuUGyEAL9KFuPFWIC481M3McRC4QrMUoRLC72ZZS2Mg==
X-Received: by 2002:a05:690c:7686:b0:6dd:ba22:d946 with SMTP id 00721157ae682-6e3479b9566mr12010717b3.13.1728631585848;
        Fri, 11 Oct 2024 00:26:25 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332b89c66sm4910247b3.41.2024.10.11.00.26.25
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 00:26:25 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e2923d5b87aso189835276.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 00:26:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNICY88l6h217Qq50e4gADpc6JF7D3ZAQFbZ8pmb6JraY3slifQNi3/iERSbaQuF9mHjd7msIgxu4Tug==@lists.infradead.org
X-Received: by 2002:a05:690c:7686:b0:6dd:ba22:d946 with SMTP id
 00721157ae682-6e3479b9566mr12010507b3.13.1728631585096; Fri, 11 Oct 2024
 00:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <0923c114886cbbb322a9802543177c29cedbdbc1.1727958898.git.geert+renesas@glider.be>
 <CA+V-a8sdmGs6h6iUMozgcRG8u8o3dueqY28U37k2weDLDkBEbw@mail.gmail.com>
In-Reply-To: <CA+V-a8sdmGs6h6iUMozgcRG8u8o3dueqY28U37k2weDLDkBEbw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Oct 2024 09:26:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUuu=au0mWfBGPTXbBgyFdHwqRd93subnYX51Hyg0BAg@mail.gmail.com>
Message-ID: <CAMuHMdVUuu=au0mWfBGPTXbBgyFdHwqRd93subnYX51Hyg0BAg@mail.gmail.com>
Subject: Re: [PATCH LOCAL/RFC] riscv: defconfig: Add rzfive_defconfig
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_002627_743835_F6847E3C 
X-CRM114-Status: GOOD (  23.07  )
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

SGkgUHJhYmhha2FyLAoKT24gRnJpLCBPY3QgMTEsIDIwMjQgYXQgMTI6MTnigK9BTSBMYWQsIFBy
YWJoYWthcgo8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IE9uIFRodSwgT2N0
IDMsIDIwMjQgYXQgMTozNuKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbgo+IDxnZWVydCtyZW5lc2Fz
QGdsaWRlci5iZT4gd3JvdGU6Cj4gPiBSWi9GaXZlIGNhbm5vdCBiZSBzdXBwb3J0ZWQgYnkgdGhl
IHN0YW5kYXJkIFJJU0MtViBkZWZjb25maWcgZHVlIHRvIGl0cwo+ID4gZGVwZW5kZW5jeSBvbiBO
T05QT1JUQUJMRS4gIEhlbmNlIGFkZCBhIHNlcGFyYXRlIGRlZmNvbmZpZyBmb3IgUmVuZXNhcwo+
ID4gUlovRml2ZSBib2FyZHMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KPiA+IC0tLQo+ID4gTm90IGludGVuZGVkIGZv
ciB1cHN0cmVhbSBpbnRlZ3JhdGlvbi4KPiA+IFRvIGJlIGFwcGxpZWQgdG8gbXkgdG9waWMvcmVu
ZXNhcy1kZWZjb25maWcgYnJhbmNoLCB3aGljaCBhbHJlYWR5IGhhcwo+ID4gYXJjaC9hcm02NC9j
b25maWdzL3JlbmVzYXNfZGVmY29uZmlnLgo+ID4KPiA+IFRlc3RlZCB3aXRoIE9wZW5FbWJlZGRl
ZCBub2Rpc3Ryby4wIHNtYXJjLXJ6Zml2ZSAoZU1NQyBhbmQgbmZzcm9vdCkuCj4gPgo+ID4gQW55
IG90aGVyIG9wdGlvbnMgdGhhdCBzaG91bGQgYmUgZW5hYmxlZC9kaXNhYmxlZD8KPgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2NvbmZpZ3MvcnpmaXZlX2RlZmNvbmZpZwo+IGIvYXJjaC9yaXNj
di9jb25maWdzL3J6Zml2ZV9kZWZjb25maWcKPiBpbmRleCAzMTQ4M2ExZDUyMGMuLjgyNzA5ZGQ3
MTJlNSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2NvbmZpZ3MvcnpmaXZlX2RlZmNvbmZpZwo+
ICsrKyBiL2FyY2gvcmlzY3YvY29uZmlncy9yemZpdmVfZGVmY29uZmlnCj4gQEAgLTMsNiArMyw3
IEBAIENPTkZJR19QT1NJWF9NUVVFVUU9eQo+ICBDT05GSUdfTk9fSFpfSURMRT15Cj4gIENPTkZJ
R19ISUdIX1JFU19USU1FUlM9eQo+ICBDT05GSUdfQlBGX1NZU0NBTEw9eQo+ICtDT05GSUdfUFJF
RU1QVD15Cj4gIENPTkZJR19JS0NPTkZJRz15Cj4gIENPTkZJR19JS0NPTkZJR19QUk9DPXkKPiAg
Q09ORklHX0NHUk9VUFM9eQo+IEBAIC01NywxMSArNTgsNyBAQCBDT05GSUdfQ0FOPXkKPiAgQ09O
RklHX05FVF85UD15Cj4gIENPTkZJR19ORVRfOVBfVklSVElPPXkKPiAgQ09ORklHX1BBR0VfUE9P
TF9TVEFUUz15Cj4gLUNPTkZJR19QQ0k9eQo+IC1DT05GSUdfUENJRVBPUlRCVVM9eQo+IC1DT05G
SUdfUENJX0hPU1RfR0VORVJJQz15Cj4gLUNPTkZJR19QQ0lFX1hJTElOWD15Cj4gLUNPTkZJR19Q
Q0lFX01JQ1JPQ0hJUF9IT1NUPXkKPiArIyBDT05GSUdfUENJIGlzIG5vdCBzZXQKCkRpc2FibGlu
ZyBDT05GSUdfUENJIGV4cGxpY2l0bHkgaXMgbm90IG5lZWRlZC4KCj4gIENPTkZJR19ERVZUTVBG
Uz15Cj4gIENPTkZJR19ERVZUTVBGU19NT1VOVD15Cj4gIENPTkZJR19NVEQ9eQo+IEBAIC0xMjQs
NiArMTIxLDcgQEAgQ09ORklHX01GRF9EQTkwNjI9eQo+ICBDT05GSUdfUlpfTVRVMz15Cj4gIENP
TkZJR19SRUdVTEFUT1I9eQo+ICBDT05GSUdfUkVHVUxBVE9SX0ZJWEVEX1ZPTFRBR0U9eQo+ICtD
T05GSUdfUkVHVUxBVE9SX0dQSU89eQo+ICBDT05GSUdfQkFDS0xJR0hUX0NMQVNTX0RFVklDRT15
Cj4gIENPTkZJR19TT1VORD15Cj4gIENPTkZJR19TTkQ9eQo+IEBAIC0xNDEsOCArMTM5LDcgQEAg
Q09ORklHX1NORF9TT0NfV004OTc4PXkKPiAgQ09ORklHX1NORF9TSU1QTEVfQ0FSRD15Cj4gIENP
TkZJR19VU0I9eQo+ICBDT05GSUdfVVNCX09URz15Cj4gLUNPTkZJR19VU0JfWEhDSV9IQ0Q9eQo+
IC1DT05GSUdfVVNCX1hIQ0lfUExBVEZPUk09eQo+ICsjIENPTkZJR19VU0JfWEhDSV9IQ0QgaXMg
bm90IHNldAoKRGlzYWJsaW5nIENPTkZJR19VU0JfWEhDSV9IQ0QgZXhwbGljaXRseSBpcyBub3Qg
bmVlZGVkLgoKRGlkIHlvdSBydW4gIm1ha2Ugc2F2ZWRlZmNvbmZpZyI/ClNvbWUgbW9yZSBvcHRp
b25zIGRpc2FwcGVhcmVkIGFmdGVyIGRpc2FibGluZyBQQ0kuCgo+ICBDT05GSUdfVVNCX0VIQ0lf
SENEPXkKPiAgQ09ORklHX1VTQl9FSENJX0hDRF9QTEFURk9STT15Cj4gIENPTkZJR19VU0JfT0hD
SV9IQ0Q9eQo+IEBAIC0yMTAsNiArMjA3LDcgQEAgQ09ORklHX0RFQlVHX01FTU9SWV9JTklUPXkK
PiAgQ09ORklHX1NPRlRMT0NLVVBfREVURUNUT1I9eQo+ICBDT05GSUdfV1FfV0FUQ0hET0c9eQo+
ICBDT05GSUdfV1FfQ1BVX0lOVEVOU0lWRV9SRVBPUlQ9eQo+ICsjIENPTkZJR19TQ0hFRF9ERUJV
RyBpcyBub3Qgc2V0Cj4gIENPTkZJR19ERUJVR19USU1FS0VFUElORz15Cj4gIENPTkZJR19ERUJV
R19SVF9NVVRFWEVTPXkKPiAgQ09ORklHX0RFQlVHX1NQSU5MT0NLPXkKPgo+IEZvciBzb21lIHJl
YXNvbiB3aGVuIENPTkZJR19TQ0hFRF9ERUJVRyBpcyBlbmFibGVkLCB0aGUgVVNCIGhvc3Qgb24K
PiBDTjEgaXNuJ3Qgd29ya2luZyEKClN0cmFuZ2UuLi4KCj4gUmV2aWV3ZWQtYnk6IExhZCBQcmFi
aGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiBUZXN0ZWQt
Ynk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNv
bT4KClRoYW5rcy4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRp
b25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cndo
ZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Ig
c29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
