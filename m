Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BEECC6B1F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 09:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f7tO2TcHMi/QRse9CzPUF6dbHK6xSAn8iEFekxtikUk=; b=3KJHGHLlnRnR9m
	koejq4jK9zYyEz0RNhEZHrxEEOn8lEJpYPyYYmOzbCQr7fJ90Tt6JAPEu8ANv7AGiK4WN7fxjWVfi
	VFoPQYTvruUvJH1JWBZizELFLSZ62nRLv/yhOQMZpFv83sb9pJKe/NSTCl00I2WkcHFnXmRmmutH3
	aVPfrusmNHinwOfoO3rk+UeXyjD9Rz8s+CBLkDnkBjNjK3a30PtmdiJQ2FzhEDUQXLfuzx95kD1ze
	EkQ/e463qLSLv3xgMELP3nTY8LZ2/6st+mTCxo1oKFPXd4a78bhpWM/dqsg6cyyBjWLj4039FoQvs
	TjZ76euegfIOW8EKFgBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvIO-0000000F20N-31ET;
	Wed, 14 Oct 2026 09:29:12 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvII-0000000F1zX-2WP5
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 09:29:11 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48b042c0728so884967f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 02:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791970143; cv=none;
        d=google.com; s=arc-20260327;
        b=SdEkmCdOyfhKWMLize5M5rtgwOcmCcjVYnJmL1g2JSU06Lc7D1fTBEb68l0zfQxuOG
         ney0yKsYvrPbU96v//n0KO37/8yliQ3YLZ5jpuT0CWjeoF7JGyFDvb2ueNYQUN1uC0yg
         jhz9Sd4t1qwaX0ktJim6tRouVaGyIpa6xfW4NCDKVSxTjKhWTNUZEbre9C6rpb6pRPyT
         JGWRpyFO4FYSqgzlaSmUGiWpBY8n2YNW199pHrI1ERlcKBU5kAQB2jyu9dzxxVC+nitL
         aIAEGJv8M1mq4Rd6vsCNFYvZ2YKwMQ51b39YNMMViGT+Iw8173UXA82kOC4pSGnnbRxQ
         75HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UM4snv3HyBXCnT4o3yFHC4lEa74fiilyetDqdq6lntg=;
        fh=OExNINxWVpBJG0tKTBwW6ZUy1vlObiX/qr+5k1HR2Ps=;
        b=PP/GPvsOkA8N21vA9FkYzAfmJhmle9T/t7XF5DP0iTO3tJnP6hUMu0eUgoUWeWnCwQ
         OpBaYwulipm4OKZiF7v7y6ld7v6B8oqyTMqITqPEcBKMKiXkKGqgQrBh5DExLYppdmKb
         80+Ta2r5BYe9g2ocUfQjUDestOmX6AWrD4XwEsRO5llfnuuYTaDFKHV3ZHpsupPSYp5h
         eZJZa+8O9hTA/DV+XyRlMT3Taydc5kXwZV0iyw2dwCyOo4ph6Z3ZVb69MWu0h6GTzD33
         Y8ehrjBRHJJ3SjgYofeshhXGDAaqXbU8AIMZ6PiUmbVRbCqh12HTcjixfECxXWWAybAU
         VfEQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791970143; x=1792574943; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UM4snv3HyBXCnT4o3yFHC4lEa74fiilyetDqdq6lntg=;
        b=bQpESnHeNs/AMbIHw5543VWGyIf6sgwaDWPmFarHCnWufoRQWiGjDxUK8M4VwvYtsM
         mHqVmjwhyW5PnZyqJallDH1gDwyWzhud0umq6VNLwN+sZf0t9wAyDb8ksan2pNHKUVZg
         ps8FQJ0sm/F92lLZI4VNMnoVTQ8A2NIEzGnsDzghuS9onKInee82DOI+Xtpk6x9gpqqf
         +TgO2r1G3QIV/zOj2sBMHQtrQXYtgpwXoi6/GL+rjvbiqljb1VlAXXs//4/cYq1/wsch
         9RHMIf1dBcktQJ8Fd3MSD6cWsQsao77fB7zpwlRJrlmZQWE8JHrjOle/wvbSnbtiRiYQ
         ut7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970143; x=1792574943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UM4snv3HyBXCnT4o3yFHC4lEa74fiilyetDqdq6lntg=;
        b=TIC1+NsKHBclZo8VKLHAYf7YspP7kkuMHnGpG7aVaKSzsLbTCXQwwfJuZO2e4Gs9Uq
         ujm38WhspMnfHhfRwXA30GpmFAYOm9+2s/Gvej8iJUI8Lildzxy5yiYFyNqyLOE+Eji1
         hPdkPozmkbEllCr7B4cM6N5kbfqLPmfyKvK8fqP0Vft7to+8ewh7lUmt4Ethjm1/s6qo
         5BmPWwVPrtQWWENFHcwXWtj+Wcg6AVJjmMlRmG7N3HPWhxyT8DSfaHxNYfGttG4cHDTi
         wjPyMlYdXxbE695gms0FnnkDz5nyqNaG1izsmkmpncvS9gi6AjrWqT0oiiiHSAIAl7Gi
         NwrQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2XpyOua3OxNI9Y97ppEm6oJnp2K0KAV5rGwVfsTbX6B9JH0oQr803uF54gWmQiYMJpLqd4tWXkFQQZw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIYwvocrYcBHDCWMFG8efDsOSVVwBLcA9dSDa/46w5n4AVkmiGV
	qEWcvmm0Njw0LMRQD/H2G4xaS5F5ToYyl6Kn0TpDo/ziYktZO+sUlNxl1PNpQ84SZjhE+XtnGZu
	GpeVCGKWxk4giHZEapQtt3IE/EKRKZa4=
X-Gm-Gg: AYBFou3m2GyOGUiDQyckROd0llfDXWLLtm3ivN4CTQdVhIBPgRH8c8xP5KC0SIKzg8d
	/gpjLIklGqR6NOyabkMFWoBYCzeauw8M1w9y7dlY3+dLNx/FDFuVwRvqdxwzKXQgCj0vMnydnw3
	wXmuWF0em4YrPyZmluGJe2dcJgp4EmAFVIqmA07tx4vkHIFIgSOWoufR3I/8P3dySP11qH59fa2
	4dXSsIdSDw2JlwpIapxkq+0f3tPVLuXkPW2drH+AUHxaGA9jjE7VYeshK7qShKSH/3ok7SYt5mL
	511CVX7/3aAKk7dxzSWmI0DxPn7+T3dcnfILb30hobvfYhAltdtn8MGGwHAOnRmYZV14D2LdMB4
	tP3A3dFe+LfEbgYX0QEdoO2tZL4QxA8WKMaKo0AgIUB0=
X-Received: by 2002:a05:6000:41db:b0:487:1c89:f158 with SMTP id
 ffacd0b85a97d-48dca3433dfmr21443506f8f.14.1791970143295; Wed, 14 Oct 2026
 02:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <fe117dd44728fe7c96f3e4b3ec88c6ca83c5da9b.1791880574.git.geert+renesas@glider.be>
In-Reply-To: <fe117dd44728fe7c96f3e4b3ec88c6ca83c5da9b.1791880574.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 14 Oct 2026 10:28:36 +0100
X-Gm-Features: AclHuK_hpJt3R0zDHjAZL75ikzTNtzzFWfnolY7PI7Bi35zqbWZzmjfcVJRiUWc
Message-ID: <CA+V-a8tpVEqJTKr4JS2aEcgr6yXzmh8j==x=+54o-rAyBwLrRQ@mail.gmail.com>
Subject: Re: [PATCH] perf/renesas: Remove remaining RISCV_ALTERNATIVE references
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_022906_665216_EB000D61 
X-CRM114-Status: GOOD (  19.52  )
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

T24gVHVlLCBPY3QgMTMsIDIwMjYgYXQgOTo0MOKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbgo8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+IHdyb3RlOgo+Cj4gQXMgcmlzY3YgYWx3YXlzIHNlbGVjdHMg
UklTQ1ZfQUxURVJOQVRJVkUsIHRoZSBvcHRpb24gd2FzIHJlbW92ZWQuCj4gSG93ZXZlciwgYSBm
ZXcgcmVmZXJlbmNlcyB3ZXJlIGxlZnQsIG1ha2luZyBpdCBpbXBvc3NpYmxlIHRvIGVuYWJsZQo+
IFJaL0ZpdmUgc3VwcG9ydCAoQVJDSF9SOUEwN0cwNDMpLgo+Cj4gRml4IHRoaXMgYnkgcmVtb3Zp
bmcgYWxsIHJlbWFpbmluZyByZWZlcmVuY2VzLgo+Cj4gRml4ZXM6IGI5MjQyMTBmNTQyZTEzYzcg
KCJyaXNjdjogcmVtb3ZlIFJJU0NWX0FMVEVSTkFUSVZFIEtjb25maWcgb3B0aW9uIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+
IC0tLQo+IFRvIGJlIGFwcGxpZWQgdG8gcmlzY3YvZm9yLW5leHQsIG9yIGZvbGRlZCBpbnRvIHRo
ZSBvcmlnaW5hbCBjb21taXQuCj4gLS0tCj4gIGRyaXZlcnMvcGVyZi9LY29uZmlnICAgICAgICB8
IDIgKy0KPiAgZHJpdmVycy9zb2MvcmVuZXNhcy9LY29uZmlnIHwgMSAtCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4KUmV2aWV3ZWQtYnk6IExhZCBQ
cmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KCkNoZWVy
cywKUHJhYmhha2FyCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvS2NvbmZpZyBiL2RyaXZl
cnMvcGVyZi9LY29uZmlnCj4gaW5kZXggMjQ1ZTdiYjc2M2I5OTQ3YS4uOGNlZjRiZGVmNzZhZWNh
YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BlcmYvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvcGVy
Zi9LY29uZmlnCj4gQEAgLTExNyw3ICsxMTcsNyBAQCBjb25maWcgU1RBUkZJVkVfU1RBUkxJTktf
UE1VCj4KPiAgY29uZmlnIEFOREVTX0NVU1RPTV9QTVUKPiAgICAgICAgIGJvb2wgIkFuZGVzIGN1
c3RvbSBQTVUgc3VwcG9ydCIKPiAtICAgICAgIGRlcGVuZHMgb24gQVJDSF9SRU5FU0FTICYmIFJJ
U0NWX0FMVEVSTkFUSVZFICYmIFJJU0NWX1BNVV9TQkkKPiArICAgICAgIGRlcGVuZHMgb24gQVJD
SF9SRU5FU0FTICYmIFJJU0NWX1BNVV9TQkkKPiAgICAgICAgIGRlZmF1bHQgeQo+ICAgICAgICAg
aGVscAo+ICAgICAgICAgICBUaGUgQW5kZXMgY29yZXMgaW1wbGVtZW50IHRoZSBQTVUgb3ZlcmZs
b3cgZXh0ZW5zaW9uIHZlcnkKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvcmVuZXNhcy9LY29u
ZmlnIGIvZHJpdmVycy9zb2MvcmVuZXNhcy9LY29uZmlnCj4gaW5kZXggYTYzZGYyOGRmM2I1ZTdj
Ny4uMGI2ODc2ZWY2ZGNhMjI4YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9yZW5lc2FzL0tj
b25maWcKPiArKysgYi9kcml2ZXJzL3NvYy9yZW5lc2FzL0tjb25maWcKPiBAQCAtNDYxLDcgKzQ2
MSw2IEBAIGNvbmZpZyBBUkNIX1I5QTA3RzA0Mwo+ICAgICAgICAgYm9vbCAiUklTQy1WIFBsYXRm
b3JtIHN1cHBvcnQgZm9yIFI5QTA3RzA0M0YgKFJaL0ZpdmUpIgo+ICAgICAgICAgZGVwZW5kcyBv
biBOT05QT1JUQUJMRQo+ICAgICAgICAgZGVwZW5kcyBvbiAhRE1BX0RJUkVDVF9SRU1BUAo+IC0g
ICAgICAgZGVwZW5kcyBvbiBSSVNDVl9BTFRFUk5BVElWRQo+ICAgICAgICAgZGVwZW5kcyBvbiAh
UklTQ1ZfSVNBX1pJQ0JPTQo+ICAgICAgICAgZGVwZW5kcyBvbiBSSVNDVl9TQkkKPiAgICAgICAg
IHNlbGVjdCBBUkNIX1JaRzJMCj4gLS0KPiAyLjQzLjAKPgo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
