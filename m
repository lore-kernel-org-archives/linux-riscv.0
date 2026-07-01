Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C17C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 17:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZGxGEFtJkZo8veRzQnFL9pjxJe3jfHSs8t+kj8iSes=; b=g6AwXn9IP+MJ9V
	AUcwuxjtTjtmZ9VqN/+WdpIwaC2Gi+q1Yy3JyO5xT5pf+RG4hebw5sIKsYNZY2EN/yN+FBmqd/pIB
	smP1Zwj7bcWav3iFZy/OLIrxq2D4MdcSknmwmoB7FO5X0aMO0hE+1WoWOySDlOAo9JLrLntMrcuXm
	227pKweDD51rTix003OMYEr2dwo/+2K4mosbiE6rSsZkIyo6yy7DNo/iDNnUtbFjMaTrIOmRkt2U4
	ONDodrUPOj4dzy9xW5sib9Lz3AjlOjGgLHeGmv/2CQU3A10eMJ1KCvE7FfdyaodGz6kUbWaa6yP7I
	arWKTlEAKDCUp505JeNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyzk-00000002kKb-3F0n;
	Wed, 01 Jul 2026 17:45:08 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyzh-00000002kIm-2Kf9
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 17:45:07 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c81db32393so89105ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 10:45:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782927904; cv=none;
        d=google.com; s=arc-20260327;
        b=KVnZNKQfxQmzdrGgT+9g19rst5R8iozrpHVYOVb/iJMrKro0bLM1h+0VjPMBfc7oVP
         77N4Q2GEIhaXO43YmzKAsjXKEkIVeDhc4k/aCzJiUTbsml6hN65eBEqqo4E6QtSc2sfZ
         iUcagFF6ykqEZwWIdzMFIbUDk90DONcp5KVQgNfuIxVVlPA6LRX8GddDbmi+yv0Zl/pJ
         cdwMtlZz7LPecd5VTYU9706thbEgxrs6dzWd/E0pKReKVfB+Y47RCHKpM9foycjzjuAO
         UrJQi2JQVVR4+3BgEM4NmAcds5iERdATqG8sqhpQU11a7y8s3NIfEzo0ZuRydK2HsYca
         5jTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4WnvY/8pdLerNOMgVcd3eg+mIsfzQdgJqCy+yb7eu3E=;
        fh=HExmywx+J4xJWqq4/etQMp1RYPlNDcWhVzjQgsS3cCE=;
        b=kioIFrm3ej5xpV+ngmoUGyusVvJM8J1nDsA1U3glUdpkdK1mEpcw26oe8lCZx6e5nT
         j1BJp4lmAdjT3s+NF5xqmPyGRruyn4D7GmA+1cn+glMsO9VIkTdnCn/HjuS48zX0/aKi
         HnIND3DOx2hWbvw9Y4sECk5m3VtNaElJJnfHAz4LAedoAeDslX2LLjOyqhwEKRsPXwzo
         7utLxuiv3+saUK9kjlFG2IUbtu8zw7OcNr+Y2Yg87v3sjNXklt4dliP74k3AJAze3xtN
         lCh4216ua6HAqkJ7O8ISGw94AL3zRq2H6OgOH31FlMpO5pRfq+Cm9mHduvsQxE4/gk+V
         ntkg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782927904; x=1783532704; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4WnvY/8pdLerNOMgVcd3eg+mIsfzQdgJqCy+yb7eu3E=;
        b=CYaDetq//aWqLZEAw163VfAy7UMgGtrSLYV3PFFlk5aOoM/CG2iCMGP+x1heG1C6Vy
         NKWvrKMsvbkRf9th019ADAIpMLM+tVAEVynXie8Yxz4BpfJrZhvtkl8hnNcOT2u1ZMMU
         wbTVJSpnGJfQeDmNIAP8bc8z6hQTUmTlbevOoF4H41Kgvt3mo0JeMAueU6bWSrx0z1Ob
         U18Pr02mZXM/EjQzg4ZuseGEPqZtAKfVUTINft2sr0o4chlE/Ln23hkV0MWxDiAhhnF0
         zObHbwI0uCP5OWi0aPKfAnQ5wK+FuIyueJc04YRaJsFZPbclvvULfSPl5HifrEM5YThN
         3QFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782927904; x=1783532704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WnvY/8pdLerNOMgVcd3eg+mIsfzQdgJqCy+yb7eu3E=;
        b=rzWjVzz3CEQcb2jOygsBBIK0ujHB0gxWeFDI5liLYZuclpkT/2uCAOOhvtq2mAvUps
         k3ec1BmKG8c8FYGm2OUpZDDgKdKEQcZJHqatzsVf1Qiry5x5AuNo1Mr6LyQ01V544W1a
         usKrFEu7GqHzGrB/fTIFqxRbl19genYllQKoOb3AEy5Lge7dHco/Rkzfs3AwoBfX7JeM
         h4R990Lh+IbE+UdPHGbrPx56V4Bp+mvb4Jt+rC6+RbfO0PHdGn/HfjNCzjh0v6LbIO6N
         7VP3aJTzQduxpvSU4W9r8u7zGC7rTdN0TMb8om1M5T94wB6xQVi9hmoUNCrcfRGL1yXF
         s7yg==
X-Forwarded-Encrypted: i=1; AHgh+RolGx7eZp+ckEJDUriHhx3azNOe255wwDm24P8U36UKQ/LotgR/NQtw+ytPymvqiWj0dn9zxwRwLm603Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yze+AAUrhtegVrbl5tZEEqOUJUChyJLOKQbvZBjn9g/7Q9PdB5w
	7FwgeGld5IP43uODF1BLh8hIPWXwKFzTaYk07DKU6RtW4/Taat9XSRdaSP1MGLnYWaJ8sXr1sqG
	FFRqXbUaelvh7OHfZAeJL0I5m21QrSJPp2/ESPVwY
X-Gm-Gg: AfdE7clOy70brBPVkpUAYr7ZAfHmuuEB6+/oLDQZBC4XCX3bvA68pbZuCWxuZzQNeLU
	NVzqaSkGBwbv4GS/KNErW2HR0XYX/la0DtwdkxA0qtqgeKjlwp+za3S4qng0Ho9LXH3MCjeBcPc
	3QXOZy14NIK3aDf5TnkphjJMYIYmRKHd+Z/f0ksjB4HJmtbMai8pWYiCR83na0/Z2xG3yLXSNJS
	C70w/RXq9Q/xktAm7fu6MWA0vhd3dJ7nAZ8M3za4pvqeae+9g6wBVGeIJc7ObMwsZQAUWJ9lg==
X-Received: by 2002:a17:903:41d0:b0:2bd:6dad:7ccd with SMTP id
 d9443c01a7336-2ca77f00e4bmr2394415ad.25.1782927903977; Wed, 01 Jul 2026
 10:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com> <20260701-counter_delegation-v8-20-7909f863a645@meta.com>
In-Reply-To: <20260701-counter_delegation-v8-20-7909f863a645@meta.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 1 Jul 2026 10:44:52 -0700
X-Gm-Features: AVVi8CcF30QiINVIR-rPJZ0l--luoek-SQcSIaomJxOhJ6SUjI8adFi78wHcNvk
Message-ID: <CAP-5=fVBe7Rsf4tkaRiMVPcAD1rHr7PxT-8XpR208C4jaANmmQ@mail.gmail.com>
Subject: Re: [PATCH v8 20/22] tools/perf: Add RISC-V CounterIDMask event field
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_104505_594862_EF7E0244 
X-CRM114-Status: GOOD (  19.64  )
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

T24gV2VkLCBKdWwgMSwgMjAyNiBhdCAxOjQ44oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJh
QGxpbnV4LmRldj4gd3JvdGU6Cj4KPiBGcm9tOiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5j
LmNvbT4KPgo+IENvdW50ZXIgZGVsZWdhdGlvbiBsZXRzIHN1cGVydmlzb3IgbW9kZSBjaG9vc2Ug
dGhlIGhwbWNvdW50ZXIgZm9yIGFuIGV2ZW50LAo+IGJ1dCB0aGUgaGFyZHdhcmUgbWF5IG9ubHkg
YWxsb3cgYSBnaXZlbiBldmVudCBvbiBhIHN1YnNldCBvZiBjb3VudGVycy4gQWRkCj4gYSBSSVND
LVYgc3BlY2lmaWMgIkNvdW50ZXJJRE1hc2siIGpzb24gZXZlbnQgZmllbGQsIGhhbmRsZWQgbGlr
ZSB0aGUgb3RoZXIKPiBhcmNoLXNwZWNpZmljIGVudHJpZXMgaW4gZXZlbnRfZmllbGRzW10sIHRo
YXQgY2FycmllcyB0aGUgYWxsb3dlZC1jb3VudGVyCj4gYml0bWFzayB0aHJvdWdoIHRvIHRoZSBk
cml2ZXIncyBleGlzdGluZyBjb3VudGVyaWRfbWFzayAoY29uZmlnMjowLTMxKQo+IGZvcm1hdC4K
Pgo+IFRoZSB2YWx1ZSBpcyB0aGUgYml0bWFzayBkaXJlY3RseSBzbyBubyBjb3VudGVyLWxpc3Qg
dG8gYml0bWFzawo+IGNvbnZlcnNpb24gaXMgbmVlZGVkLCBhbmQgYmVjYXVzZSB0aGUgZmllbGQg
aXMgUklTQy1WIHNwZWNpZmljIGl0IGlzIGEKPiBuby1vcCBmb3IgZXZlcnkgb3RoZXIgYXJjaGl0
ZWN0dXJlJ3MgZXZlbnRzICh1bmxpa2UgdGhlIHNoYXJlZCAiQ291bnRlciIKPiBmaWVsZCkuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KClJldmll
d2VkLWJ5OiBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+CgpUaGFua3MsCklhbgoKPiAt
LS0KPiAgdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2pldmVudHMucHkgfCAxICsKPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi9wbXUtZXZl
bnRzL2pldmVudHMucHkgYi90b29scy9wZXJmL3BtdS1ldmVudHMvamV2ZW50cy5weQo+IGluZGV4
IDBjZjlkMjYzMTViMy4uNTE2ZmI3Mzg4NmVkIDEwMDc1NQo+IC0tLSBhL3Rvb2xzL3BlcmYvcG11
LWV2ZW50cy9qZXZlbnRzLnB5Cj4gKysrIGIvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2pldmVudHMu
cHkKPiBAQCAtMzk2LDYgKzM5Niw3IEBAIGNsYXNzIEpzb25FdmVudDoKPiAgICAgICAgICAoJ0Vu
QWxsU2xpY2VzJywgJ2VuYWxsc2xpY2VzPScpLAo+ICAgICAgICAgICgnU2xpY2VJZCcsICdzbGlj
ZWlkPScpLAo+ICAgICAgICAgICgnVGhyZWFkTWFzaycsICd0aHJlYWRtYXNrPScpLAo+ICsgICAg
ICAgICgnQ291bnRlcklETWFzaycsICdjb3VudGVyaWRfbWFzaz0nKSwKPiAgICAgIF0KPiAgICAg
IGZvciBrZXksIHZhbHVlIGluIGV2ZW50X2ZpZWxkczoKPiAgICAgICAgaWYga2V5IGluIGpkIGFu
ZCBub3QgaXNfemVybyhqZFtrZXldKToKPgo+IC0tCj4gMi41My4wLU1ldGEKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
