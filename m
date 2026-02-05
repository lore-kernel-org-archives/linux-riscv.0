Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F27BE91287
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 07:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnyKB4crXRJiotIpAy4MAW3dWAwZ9bZIkiuBM/xAYCo=; b=k+3nnN0DXnLzac
	aVT2PErOJ07Q9r2JNfIbODrk7cfye4yxLO8p5eBT0exjpjdyr92nmwDMVpGljPXJw3j9mXCAhQrrA
	LfIkoMtU8Nc29emQLB45BuI3qvG5xq/WKFQ6j2Qldt3dxtA/3x9CZC2oHKZ5ElqDZyrLnjNrUHD+F
	M9182n5XZqVrGkiEeyrIT4N9sWhU/0mVY5n1IjlftOTfYpmy1oihoxqjqih41LbR3XVeLbrdjs8JA
	SGdntutuAils0ePIqlvb9yCeIR4po5FsvM7cmiHy8/W/E0/SKBI7rmkoe7dtVul7Ejzxf5TOlhHhm
	x/ktoNo8W5SuKF+O/QZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnu7y-00000009aDB-1ddP;
	Thu, 05 Feb 2026 07:50:14 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnu7t-00000009aCc-1Bw1
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 07:50:12 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id ABB9A3F788
	for <linux-riscv@lists.infradead.org>; Thu,  5 Feb 2026 07:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1770277806;
	bh=UnRqSzV04ruJ+1tCzWkMo0BH08JoWQU7+eTA9S+H8e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=Ta84+AVhL6Dlqmmid5hcUlKj6SgrnUM3SoD+ZriQoNXHeg9c4FKKWRSjj6P8UtC1k
	 /9t6NOsVD5UbOFNyqnGOgN9jfjkSilhPYfi9rCloUBk6a5K6gA9g115cGr7Q9XTUtY
	 jzuc79hWrfb4gS9GQcxw0fkcx2B9UK4IsuDjm78EjtPWiY69/nIgjyJewFLP03r0tS
	 gpB1W8r9X9m5LynrUoI4ETvAt5P3V6AhMkhAcZi6O3UNhF1MeA+Mu0KZX+ejS8o2TK
	 ojYtgkRgk7bTv393JGWv8+EVhShMUpBxtZ9nTL51+NirTyC3dI7OvD09RhT1kBkRyg
	 qclWD58iqVI/rsI4gQ609240BuP0tdiRpoTxRw1u2mu4tfoNYH8OMPmemD/lF1iK7S
	 x0ZBoGOHKEhLcgfjzAVjsEeNSWBdL2ykPtxPWR/v9+uqpHrAYfywlUSFi+bz5ce9qH
	 aQzV7383kc86DqTTnbbR4QXa3oBtw6ZMdZlG4AnBut0W41g8JsxSFHIbPbhKEt3QF4
	 zhJVd1ohXSAvmjTTLuXbEWDuROY6+lMc7g9oyvbr0TC2wkTsTkgoMSQ7fE/pLz8txo
	 wP929/fLtlPiOJwQ9a6dJeD5laduKOc4x59SOsShU3n1cHowEXLyPUZd1j9P6cJ0d3
	 v3fjZWLdRuFBWj7mmPDamVKU=
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-435ab907109so564608f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 23:50:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770277806; x=1770882606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnRqSzV04ruJ+1tCzWkMo0BH08JoWQU7+eTA9S+H8e8=;
        b=n8+wwBd8FMK87rbVGyr3VjsmvoU8GClwLf5f6ncnTKk281nEp8EvwGMo2qYCXOvPfq
         Vq2eqnXgAFdwTB6xzwpljke3KqF+75uJ3wF5DSctjQt3coRgiSd+p8IZteWLj29zvvzL
         LFshljoE5E+uvZx65WvLimGmL0yOwWKS76FfsnwqD6uD0vdgz4H7BmpDNZSWXgy2zXRf
         dGQBrmPqKKpyDZerPMezwlzyQZJRf6iwRsiZYgXuPHWGXW7G0FaGVIFV9eOFAcLW9DVh
         nMcUBtwBCBx1z4/VOYcU/1Xt2SOd4fS8J8r+9vY4E1cV0ZtsmQSXPu/EMipwDjNBVhjE
         kf2A==
X-Forwarded-Encrypted: i=1; AJvYcCVRNo4vl/G/QTDL/TlSOZ7e0UBePOtvGqmf52FT/LG+3CjDkGR2kgyULl0nAX28UcQGlUzZox6Fl4CB9A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6gc22jgqWRlTnnR68JILFribubyXSzjApokdm/OrNQgsB42y5
	Nm6/Z7CQ7/kHtNXrwYhZWfzJarCT/aKszBw3aOem7QWdAaN8AcQtPStLDSuMky2PFDP4+n1nAe+
	EU+Ar0AIaN2UC+0lbpo94uuKx/L9i4Ias865hw6qXniqYNc2YDKA7od1hWZXrvuWOB/HBqmBoxP
	hu89DaORJJKQ==
X-Gm-Gg: AZuq6aJL6hbEiCoXVjFUNJyTjSI+yLVQxpLiApACh5QTgPorVdRWMLjAnesZPbJ/DJT
	ND/zBlG6361NX0PN8NzaIWFVhd9hzJf/3AJtfDyA1ryutmxPJiEq+J0d/SXwb51Nhsxlsj44hul
	NYS19+bEw7hh2CTxKvW/yCrD52+r9QkdmXwOLMWIRwF6Gsf+ofgSqUsfSR2PLZySWXUbTsXnqcN
	hfKb6J1kl+c/0uaTqm96r5swBIwSqeQlExtQDlxWBcjsu4Z9eAZUb460xvNxeSH3LgqsGQ3Hnwp
	hSuqFqdUQi/BncVJc+VHoUprEGQlRQMUq7OvaajwqAXa7nybPyFLb7MRzXES3lSrLXkfy381/mx
	TWwtFNL7Z3O9eHmk2hxq5YwDJks2zpwUXcQImjIhSK+tBNGBg0DJN+SzxjNrSppMGwCbSSmb5db
	e0NVcft3Y=
X-Received: by 2002:a05:6000:2505:b0:435:95dc:b8ca with SMTP id ffacd0b85a97d-43618052805mr7916330f8f.40.1770277804615;
        Wed, 04 Feb 2026 23:50:04 -0800 (PST)
X-Received: by 2002:a05:6000:2505:b0:435:95dc:b8ca with SMTP id ffacd0b85a97d-43618052805mr7916240f8f.40.1770277803126;
        Wed, 04 Feb 2026 23:50:03 -0800 (PST)
Received: from [192.168.123.154] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43617e38ec5sm12764912f8f.14.2026.02.04.23.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 23:50:02 -0800 (PST)
Message-ID: <3166f7d5-b526-411d-b337-27981a7ed14d@canonical.com>
Date: Thu, 5 Feb 2026 08:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: dts: starfive: Milk-V Mars CM Lite broken-cd
To: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260204101602.30184-1-heinrich.schuchardt@canonical.com>
 <46d5d249-8cf2-46d1-a90c-1f2c5f146e15@canonical.com>
 <e2394c64-af36-428f-ad6e-4c7038c0301e@freeshell.de>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <e2394c64-af36-428f-ad6e-4c7038c0301e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_235009_461239_EBEA75EB 
X-CRM114-Status: GOOD (  27.32  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMi81LzI2IDAwOjE2LCBFIFNoYXR0b3cgd3JvdGU6Cj4gSGksCj4gCj4gSSB0aGluayB0aGUg
Y29ycmVjdCBmaXggd2lsbCBiZSBkZXZpY2UgdHJlZSBvdmVybGF5cyBwZXItY2FycmllciBib2Fy
ZAo+IGFuZCBub3QgdGhpcyBvbmUtc2l6ZS1maXRzLWFsbCB3b3JrYXJvdW5kIHdpdGggdGhlIFN5
c3RlbS1vbi1Nb2R1bGUuCj4gUmV2aWV3IGJlbG93Ogo+IAo+IE9uIDIvNC8yNiAwODozOCwgSGVp
bnJpY2ggU2NodWNoYXJkdCB3cm90ZToKPj4gT24gMi80LzI2IDExOjE2LCBIZWlucmljaCBTY2h1
Y2hhcmR0IHdyb3RlOgo+Pj4gVGhlIGNhcmQgZGV0ZWN0IEdQSU8gZGVwZW5kcyBvbiBzdXBwb3J0
IGJ5IHRoZSBiYXNlIGJvYXJkLgo+Pj4KPj4+IERldGVjdGluZyBhbiBTRC1jYXJkIGRpZCBub3Qg
d29yayBmb3IgbWUgd2l0aCBhIE1pbGstViBNYXJzIENNIExpdGUKPj4+IG1vdW50ZWQgb24gYW4g
V2F2ZXNoYXJlIENNNC1JTy1CQVNFLUEgYm9hcmQuCj4+Cj4+IFRoZSBzY2hlbWF0aWMgb2YgdGhl
IFdhdmVzaGFyZSBDTTQtSU8tQkFTRS1BIGJvYXJkIGlzIGF2YWlsYWJsZSBhdAo+PiBodHRwczov
L2ZpbGVzLndhdmVzaGFyZS5jb20vdXBsb2FkL2EvYWEvQ000LUlPLUJBU0UtQV9WNF9TY2hEb2Mu
cGRmCj4+IHNob3dpbmcgcGluIDc2IGlzIG5vdCBjb25uZWN0ZWQuCj4+Cj4+IEluIGh0dHBzOi8v
Zm9ydW1zLnJhc3BiZXJyeXBpLmNvbS92aWV3dG9waWMucGhwP3Q9MjkxMDQxIHRoZSBSYXNwYmVy
cnkKPj4gRm91bmRhdGlvbiBleHBsaWNpdGx5IHdyb3RlIHRoYXQgcGluIDc2IHNob3VsZCBub3Qg
YmUgY29ubmVjdGVkIHdoZW4KPj4gdXNpbmcgYSBjb21wdXRlIG1vZHVsZSBzb2NrZXQuCj4+Cj4+
IEUuIFNoYXR0b3cgcG9pbnRlZCBtZSB0byBhIGJvYXJkCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9O
YWJ1Q2FzYS95ZWxsb3cvcmVsZWFzZXMvZG93bmxvYWQvdjEuM2MvCj4+IFllbGxvd192MS4zY19T
Y2hlbWF0aWNfZ2l0Ljg5NTdiNDQwYWRkYS5wZGYKPj4gdGhhdCBhY3R1YWxseSBkaXNyZWdhcmRl
ZCB0aGlzIGFkdmljZSBhbmQgdXNlcyBwaW4gNzYgYWN0dWFsbHkgYXMgY2QtCj4+IGdwaW8uIFRo
aXMgdXNhZ2Ugb2YgR1BJTyA0MSBpcyBhIHByb3BlcnR5IG9mIHRoZSBzcGVjaWZpYyBiYXNlIGJv
YXJkIGFuZAo+PiBub3Qgb2YgdGhlIE1pbGstViBNYXJzIENNIGFuZCBzaG91bGQgYmUgZGVzY3Jp
YmVkIGluIGEgZGV2aWNlLXRyZWUKPj4gb3ZlcmxheSBpZiBuZWVkZWQuCj4+Cj4+IEJlc3QgcmVn
YXJkcwo+Pgo+PiBIZWlucmljaAo+Pgo+Pj4KPj4+IEFjY29yZGluZyB0byBbMV0gU0RfU0RJTzBf
Q0RfR1BJTzQxIGlzIGNvbm5lY3RlZCB0byBwaW4gNzYgcmVzZXJ2ZWQuCj4+PiBUaGUgUmFzcGJl
cnJ5IFBpIENvbXB1dGUgTW9kdWxlIDQgSU8gQm9hcmQgZG9jdW1lbnRhdGlvbiBtYXJrcyB0aGF0
Cj4+PiBwaW4gYXMKPj4+IHJlc2VydmVkLiBUaGUgUmFzcGJlcnJ5IFBpIENvbXB1dGUgTW9kdWxl
IDUgSU8gQm9hcmQgZG9jdW1lbnRhdGlvbgo+Pj4gbWFya3MgdGhlIHBpbiBhcyBWQkFULgo+Pj4K
Pj4+IFJlbW92ZSB0aGUgY2QtZ3Bpb3MgZGVmaW5pdGlvbiBhbmQgYWRkIGJyb2tlbi1jZC4KPj4+
Cj4+PiBbMV3CoCBodHRwczovL2dpdGh1Yi5jb20vbWlsa3YtbWFycy9tYXJzLWZpbGVzL2Jsb2Iv
bWFpbi9NYXJzLQo+Pj4gQ01fSGFyZHdhcmVfU2NoZW1hdGljZXMvTWlsay1WX01hcnMtQ01fU0NI
X1YxLjAtMjAyMy0wOTA1X0xpdGUucGRmCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSGVpbnJpY2gg
U2NodWNoYXJkdCA8aGVpbnJpY2guc2NodWNoYXJkdEBjYW5vbmljYWwuY29tPgo+Pj4gLS0tCj4+
PiAgwqAgYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFyc2NtLWxp
dGUuZHRzIHwgMiArLQo+Pj4gIMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJm
aXZlL2poNzExMC1taWxrdi1tYXJzY20tbGl0ZS5kdHMKPj4+IGIvYXJjaC9yaXNjdi9ib290L2R0
cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFyc2NtLWxpdGUuZHRzCj4+PiBpbmRleCA2M2FhOTRk
NjVhYjU1Li41NjZiMGJkYzI4MDBkIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0
cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFyc2NtLWxpdGUuZHRzCj4+PiArKysgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1taWxrdi1tYXJzY20tbGl0ZS5kdHMKPj4+IEBA
IC0xMyw3ICsxMyw3IEBAIC8gewo+Pj4gIMKgIMKgICZtbWMwIHsKPj4+ICDCoMKgwqDCoMKgIGJ1
cy13aWR0aCA9IDw0PjsKPiAKPiArIC8qIFNjaGVtYXRpYyBzaWduYWwgU0RfU0RJTzBfQ0RfR1BJ
TzQxIHRvIENNNCBjb25uZWN0b3IgcGluIDc2Ki8KPiArIC8qIFJhc3BiZXJyeSBQaSBDTTQgc3Bl
Y2lmaWNhdGlvbiBwaW4gNzYgcmVzZXJ2ZWQgZG8gbm90IGNvbm5lY3QgKi8KPiAKPj4+IC3CoMKg
wqAgY2QtZ3Bpb3MgPSA8JnN5c2dwaW8gNDEgR1BJT19BQ1RJVkVfTE9XPjsKPj4+ICvCoMKgwqAg
YnJva2VuLWNkOwo+IAo+IEFsbCBzY2hlbWF0aWMgZG9jdW1lbnRzIGZvciBNYXJzIENNIExpdGUg
bGlzdCB0aGlzIHNpZ25hbCBuYW1lIGFzCj4gYFNEX1NESU8wX0NEX0dQSU80MWAuCj4gCj4+PiAg
wqDCoMKgwqDCoCBkaXNhYmxlLXdwOwo+Pj4gIMKgIH07Cj4+PiAgICAKPiAKPiBUaGUgY2Fycmll
ciBib2FyZCBJIGhhdmUgYSBzY2hlbWF0aWMgZG9jdW1lbnQgZm9yIC0gSG9tZSBBc3Npc3RhbnQK
PiBZZWxsb3cgUG9FIHJldiAxLjMgLSBsaXN0cyB0aGlzIGFzIFNEX0RFVEVDVCwgYXBwYXJlbnRs
eSBpZ25vcmluZyB0aGUKPiBSYXNwYmVycnkgUGkgRm91bmRhdGlvbiBkb2N1bWVudCBhYm91dCBD
TTQgQ29tcHV0ZSBJTyBzcGVjaWZpY2F0aW9uIHRoYXQKPiBleHBsaWNpdGx5IHNheXMgZG8gbm90
IGNvbm5lY3QgdGhpcyBwaW4gdG8gYW55dGhpbmcuCj4gCj4gVGhlIGNhcnJpZXIgYm9hcmQgSSBk
byBub3QgaGF2ZSBhIHNjaGVtYXRpYyBkb2N1bWVudCBmb3IgLSBERlJvYm90Cj4gQ29tcHV0ZSBN
b2R1bGUgNCBJb1QgUm91dGVyIEJvYXJkIE1pbmkgLSBvbmx5IGhhcyBTRCBDYXJkIGFuZCBpcwo+
IG9wZXJhdGlvbmFsIGFzLWlzLgo+IAo+IFRoZSBjb21wYXRpYmlsaXR5IGlzc3VlIGZvciBjYXJy
aWVyIGJvYXJkcyB0aGF0IG1vcmUgc3RyaWN0bHkgZm9sbG93IHRoZQo+IFJhc3BiZXJyeSBQaSBD
TTQgSU8gc3BlY2lmaWNhdGlvbiBtYXkgYmUgYmV0dGVyIGhhbmRsZWQgYnkgZGV2aWNlIHRyZWUK
PiBvdmVybGF5cy4gVGhvdWdoIHRoaXMgaXMgbm90IGNvbnZlbmllbnQgZm9yIHVzZXJzIGFuZCBy
ZXF1aXJlcyBtb3JlCj4gZGV2ZWxvcGVyIGVmZm9ydCwgb3ZlcmxheXMgd291bGQgYmUgYmVzdCB0
byBhZG9wdCBkdGJvIHBlci1jYXJyaWVyIGJvYXJkCj4gdG8gZGVzY3JpYmUgaGFyZHdhcmUgYWNj
dXJhdGVseS4KPiAKPiBXaGF0IGlzIG5lZWRlZCB0byBpbnRyb2R1Y2Ugb3ZlcmxheXM/Cj4gCj4g
LSBFCgpEZXZpY2UtdHJlZSBvdmVybGF5cyB3b3VsZCBoYXZlIHRvIGJlIGFwcGxpZWQgYnkgdGhl
IGZpcm13YXJlLCB0eXBpY2FsbHkgClUtQm9vdC4KClRoZSBmaXJtd2FyZSBoYXMgbm8gd2F5IHRv
IGRldGVybWluZSBpZiBpdCBpcyBydW5uaW5nIG9uIGFuIElPLWJvYXJkIAp3aXRoIG9yIHdpdGhv
dXQgYSBjYXJkIGRldGVjdCBzd2l0Y2guIFNvIHRoZSBzZWxlY3Rpb24gb2YgYW4gb3ZlcmxheSAK
d2lsbCBiZSBhIG1hbnVhbCBwcm9jZXNzLiBJbiBtYW55IGNhc2VzIHVzZXJzIHdpbGwgbm90IGtu
b3cgYWJvdXQgdGhlIAppc3N1ZSBvZiBjYXJkIGRldGVjdCBzd2l0Y2hlcyBhbmQgaWYgdGhlaXIg
Ym9hcmQgaGFzIG9uZSBvciBub3QuCgpUaGUgZGVmYXVsdCB2YWx1ZSB3aXRob3V0IGFueSBvdmVy
bGF5IHNob3VsZCBiZSBvbmUgdGhhdCBhbGxvd3MgdG8gdXNlIAp0aGUgU0QtY2FyZCBvbiBhbGwg
SU8tYm9hcmRzLCBpLmUuICdicm9rZW4tY2QnLgoKVGhpcyBpcyBhbHNvIHRoZSB2YWx1ZSB1c2Vk
IGJlIHRoZSBib2FyZCBzdXBwb3J0IHBhY2thZ2UKaHR0cHM6Ly9naXRodWIuY29tL21pbGt2LW1h
cnMvbWFycy1idWlsZHJvb3Qtc2RrL2Jsb2IvMWZkNmJhYzlmMmVmZGU0N2ZiYjhhZmQyOGQyOTAz
YzQ5Zjg5M2UzZi9saW51eC9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1taWxr
di1tYXJzLWNtLXNkY2FyZC5kdHMjTDI2NQoKQmVzdCByZWdhcmRzCgpIZWlucmljaAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
