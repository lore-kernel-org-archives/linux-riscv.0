Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163E2EC1451
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 13:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bqL4S2batHQ9SqlOzufuIi28Wlt8UYzhOekBgmISRQw=; b=lTWIM69+ErdH7I
	Dw9QMehahKWRB8weXO7IPLyy2JlDhbtaMrHtsSF16mPj/fVQSjmQZOczOKaCSlZXKP/qMR8SbAV98
	3f5w2Kq6X3H2tYElNDVkulUawKoN69bUaw/fn8XfajUjTzNwGxijcbIO9i1wcx0NUIbWHNmFSCDat
	JcyXtPoycBjFFpKDE8qe+FYAoZgr0uYNmANYnWzj4KyuFmQWfvZzqInL07dsWFs+Lphq9k5rLi4w4
	uAAEGReJLv5P/Suw75+lgLWhfju7h4oskY/L8CTWAEotbzKg3tQn6wRn9E9ka5yRjxEMs2/P+WqoR
	acelD2YWrSXAkEPMIWyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQGb-0000000FGvm-09jN;
	Tue, 03 Mar 2026 13:58:29 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQGY-0000000FGvP-3PwM
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 13:58:27 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-7986fb839f5so47637387b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Mar 2026 05:58:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772546305; cv=none;
        d=google.com; s=arc-20240605;
        b=ZcwL6veWydoTAPgxh2OgmQDfbdMCrVFE0bqvGCnWRJy64xSIcNrKOZ5/58g6N/71zM
         FWO3NlguaKUpNyNZ7exvkE2I3wJ3Aq9U+l1cJrn8n1i7urFLItAOZcJpQhy7s/ACPK/o
         CcFhCtE/XP6DOh4hSf+rwuzAmGHRLebk7Oxmt/Rk/B5ci7DGq+bH/eZgCwXamRHik37N
         F2iLO74tLkvGOqlLQfFBFBC5CQs6qDP68EgZ8HFl2V0ofZH24U4+XR7qVL78hhphVWtW
         PGxZbuQlquPJ1VFwVJngk6XLZvafs5PW15LIdzvXoQAmu9/CrEuONRbGOPPlgmpNxslt
         Re8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=25Zk0eBlVyMNHvv/kU7Q4vGl++ta3IdblXKrhWJCrxQ=;
        fh=XOpgnxssVgFVZeWNEq3a75cEfLDoLS++5mx0qp2gOW4=;
        b=jYvIfHxSme8/eLhpeCCSFfk/iKvOz9DRfsas4nFdu77d0DkxEa0UB8m1s1kTZPM/AJ
         v61o4/73BvP4OFEzBOQ9wcrYtT+OXha7ACM82hkq6avMdyW93RBqF5B9Ulg3EXw3eG8e
         0JbpnHfpW2o8vQZveESkvQHf1gN3lYjXURzBcv0puvuEfb+aikvdhrwIRygIa7ROOM/+
         5L5DKvwDtX3FYtyNZvfdPHgUTEeqEhtQCbCC5Zee9eUBivWWDQGg0iooc8fZ03XR2JJD
         6N+mmmH2QM3laqxozWtptconiYzQF5mFVd7irDDdBAKcQj93ITO7T9BCkZVjI9yb+Hoh
         26NA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772546305; x=1773151105; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25Zk0eBlVyMNHvv/kU7Q4vGl++ta3IdblXKrhWJCrxQ=;
        b=EY2hpsI/FfYOHMB9jTwCa3AZ9yF4MG3iDuNW3A4VaT+ziJEDK1VjRF8qNMhIuS0PXv
         E369ViMimi7lK2tlDUqzMv4oUEGUUC6LwBmWxZCq4ziY0VqbqrjJkqEQwKgxmgbaf19O
         mMbyENU+zD/SNPvK92sY23Djn2PO+SlQwVEBa4IaiDpdx171jOh1OgCyj8/wsMG5MYTR
         b2kUBfJrYvz9wRHWP3SUgUKGK4coabvpB33PU5oGiKpKVkYC/cJX+SNvHNUUVPUKFk5Q
         kV8IUt1jmqJ6wEHjoSAyCpbLdguXd67i9sWUpIdG+vA7oXXlfvJbPrpvZXq6NecG9PQ8
         VMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772546305; x=1773151105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=25Zk0eBlVyMNHvv/kU7Q4vGl++ta3IdblXKrhWJCrxQ=;
        b=c3qSW/DwGDRItyKLZWDGe91hyLNF8qrqrn9kNqZ3YQ4cfdhj2HhNPkBxTvgH7bZRza
         FQu2Rlr4yDcnWugAp/fGD7Rwvza0h0xhWKPKn8Q2mgyuMr6lgSsqfaK2d7TTZnJhvPN4
         DSGYGk+gu93iIdRy80OTnv4kTS3786nrDLBvZbp04ysvGIoMSL3F6k59CoZTMNoFdOuh
         xIFtvVTEohwo8hKaLUhJi7qroeG8lZV6bClvvM3z+nDsWYyS5OqIVtOVqEOcBjHkjKZI
         i++rWUy8GKPt1hpkIw6haNqkIppn4ppo/rM0q8NvDVP3/WGLjFxvwjiCpIV2C6V3FbV1
         oB0w==
X-Forwarded-Encrypted: i=1; AJvYcCUdv6hvfv3nY80BBN+aG2Aq7jI5M7t4G0YSmnnloNk5zLlrAZiP+oMDXgOmTryPWrt65nHqW18W6kRCuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnOeVAX33YdWN2A2KMt4QZ4S+OEOir0Oj4SP34T2gK5OXH1Ih2
	oJgKNnYbKiMlE0grtAsd4fZsDEXkMq+9TYdlWy9qOvQD5CkwBExg7FLCakZxAfYr0WKYENBTAfG
	0UIUdD1tHmwd4M2K2RGv5ElSoj3ASt5A=
X-Gm-Gg: ATEYQzzHZ5u+/qyKJAkvESGgoRWIx3AD7fkMYZhqrvUl9XDlepwrgRe9OMowOsq6Jvx
	Z7uz7Cz6poMpreNyHHUEDIeDMPIaWh2UrZ4SBoZGYldjPJ5gQ5tQNdo7VkWXlLOav26BC2KpmwF
	gv8Pw4ybxxML19zVkf5hBCasWGDjtViL9KF1wyKrujad907Gh3DM18ipNx+0QUhKmfe6ywtbhRN
	FFWUEveg3GKpq2dVwx6pWQe3sH+MlSFvpKRSXhrCxMemqzHcyuERDD0HMNFNzwGwWvUO9h4Z6AH
	W6zznnX9
X-Received: by 2002:a53:ecd5:0:b0:64c:bae1:2168 with SMTP id
 956f58d0204a3-64cc201e46fmr9653985d50.12.1772546305463; Tue, 03 Mar 2026
 05:58:25 -0800 (PST)
MIME-Version: 1.0
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
 <20260302-orangepi-sd-card-uhs-v1-3-89c219973c0c@gmail.com> <aaZfVZoCe3AxTzAf@pie>
In-Reply-To: <aaZfVZoCe3AxTzAf@pie>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 3 Mar 2026 14:58:13 +0100
X-Gm-Features: AaiRm52kBZDv7RHaHk__HaURlrgDL3u1uXFkZRgyX5QSdwPI4llWUBVCuA0ve_E
Message-ID: <CABdCQ=NporA_1wRZx-dG3pXE3mmqT1g=M18Utpqpewt5qXLiCg@mail.gmail.com>
Subject: Re: [PATCH 03/10] mmc: sdhci-of-k1: add regulator framework support
To: Yao Zi <me@ziyao.cc>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_055826_866428_66164DEA 
X-CRM114-Status: GOOD (  20.25  )
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

RWwgbWFyLCAzIG1hciAyMDI2IGEgbGFzIDU6MTEsIFlhbyBaaSAoPG1lQHppeWFvLmNjPikgZXNj
cmliacOzOgo+Cj4gT24gTW9uLCBNYXIgMDIsIDIwMjYgYXQgMDQ6MTM6MjRQTSArMDEwMCwgSWtl
ciBQZWRyb3NhIHdyb3RlOgo+ID4gQWRkIHJlZ3VsYXRvciBmcmFtZXdvcmsgc3VwcG9ydCBmb3Ig
dm9sdGFnZSBzd2l0Y2hpbmcgb3BlcmF0aW9ucy4gVGhpcwo+ID4gZW5hYmxlcyBwcm9wZXIgUE1J
QyBjb250cm9sIGZvciBVSFMgdm9sdGFnZSBzd2l0Y2hpbmcgYmV0d2VlbiAzLjNWIGFuZAo+ID4g
MS44ViBzaWduYWxpbmcgbGV2ZWxzLgo+ID4KPiA+IC0gQWRkIHJlZ3VsYXRvciBzdXBwbHkgcGFy
c2luZwo+ID4gLSBJbXBsZW1lbnQgdm9sdGFnZSBzd2l0Y2hpbmcgY2FsbGJhY2sKPiA+IC0gRW5h
YmxlIG1tYyByZWd1bGF0b3IgZnJhbWV3b3JrIGludGVncmF0aW9uCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogSWtlciBQZWRyb3NhIDxpa2VycGVkcm9zYW1AZ21haWwuY29tPgo+ID4gLS0tCj4gPiAg
ZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1rMS5jIHwgMTIgKysrKysrKysrKysrCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPgo+IEl0IHNlZW1zIFBBVENIIDQgc2hvdWxk
IGJlIHNxdWFzaGVkIGludG8gdGhpcyBvbmUsIG9yIHRoZSBmdW5jdGlvbmFsaXR5Cj4gb2Ygdm9s
dGFnZSBzd2l0Y2hpbmcgaXNuJ3QgcmVhbGx5IGNvbXBsZXRlLgoKVGhhdCBtYWtlcyBzZW5zZS4g
SSdtIHN0aWxsIGxlYXJuaW5nIHRoZSBiZXN0IHdheSB0byBzdHJ1Y3R1cmUgdGhlc2UKc2VyaWVz
IGZvciB0aGUga2VybmVsLCBzbyBJIGFwcHJlY2lhdGUgdGhlIGd1aWRhbmNlLiBJJ2xsIHNxdWFz
aCBwYXRjaAo0IGludG8gdGhpcyBvbmUgZm9yIHYyIHRvIGVuc3VyZSB0aGUgdm9sdGFnZSBzd2l0
Y2hpbmcgbG9naWMgaXMKYXRvbWljLgoKPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hv
c3Qvc2RoY2ktb2YtazEuYyBiL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtazEuYwo+ID4gaW5k
ZXggYjcwM2I3ODI4MmVkOGQ4OTE4M2M4MTY0NzdjMTQ5YzBhNTY1NjE4YS4uYzI2MGNiODk3MDRh
ZTdhMjViZWMwZjA3ODMxZDQ5NTU1MzQwNWJiZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbW1j
L2hvc3Qvc2RoY2ktb2YtazEuYwo+ID4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1r
MS5jCj4KPiAuLi4KPgo+ID4gQEAgLTI5MSw2ICsyOTcsMTIgQEAgc3RhdGljIGludCBzcGFjZW1p
dF9zZGhjaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4KPiA+ICAgICAg
IGhvc3QtPm1tYy0+Y2FwcyB8PSBNTUNfQ0FQX05FRURfUlNQX0JVU1k7Cj4gPgo+ID4gKyAgICAg
cmV0ID0gbW1jX3JlZ3VsYXRvcl9nZXRfc3VwcGx5KGhvc3QtPm1tYyk7Cj4gPiArICAgICBpZiAo
cmV0KQo+ID4gKyAgICAgICAgICAgICBkZXZfd2FybihkZXYsICJGYWlsZWQgdG8gZ2V0IHJlZ3Vs
YXRvcnM6ICVkXG4iLCByZXQpOwo+ID4gKwo+ID4gKyAgICAgaG9zdC0+bW1jX2hvc3Rfb3BzLnN0
YXJ0X3NpZ25hbF92b2x0YWdlX3N3aXRjaCA9IHNwYWNlbWl0X3NkaGNpX3N0YXJ0X3NpZ25hbF92
b2x0YWdlX3N3aXRjaDsKPgo+IFdoeSBub3QgYXNzaWduIHN0YXJ0X3NpZ25hbF92b2x0YWdlX3N3
aXRjaCBpbiB0aGUgZGVjbGFyYXRpb24gb2YKPiBzcGFjZW1pdF9zZGhjaV9vcHM/CgpZb3UncmUg
cmlnaHQsIHRoYXTigJlzIG11Y2ggY2xlYW5lci4gSSdsbCBtb3ZlIHRoZSBhc3NpZ25tZW50IGlu
dG8gdGhlCnNwYWNlbWl0X3NkaGNpX29wcyBkZWNsYXJhdGlvbiBmb3IgdjIuIFRoYW5rcyBmb3Ig
dGhlIHN1Z2dlc3Rpb24hCgo+Cj4gPiAgICAgICByZXQgPSBzcGFjZW1pdF9zZGhjaV9nZXRfY2xv
Y2tzKGRldiwgcGx0Zm1faG9zdCk7Cj4gPiAgICAgICBpZiAocmV0KQo+ID4gICAgICAgICAgICAg
ICBnb3RvIGVycl9wbHRmbTsKPiA+Cj4gPiAtLQo+ID4gMi41My4wCj4KPiBCZXN0IHJlZ2FyZHMs
Cj4gWWFvIFppCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
