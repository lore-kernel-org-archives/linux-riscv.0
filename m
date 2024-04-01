Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145E2CD1292
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2024 13:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7K7ujGSULnFPbjc+tOTsm0DHVM1I0SHe+8TbyI+r/DU=; b=1Ghe1X4P3HVHT2
	2/8+saFjxwcAmtoCBWyOa7WvSZClXlIQ+9d4dWAG+k1G/jtZHhzCNM4vgeerAfKbiHdLV/g1KLvNU
	Yb99c/Awh4c2fJG5usZDbDEburV3JMPPrVU0LWkUXUYRTasZ0imCHkBDVjI3zhG8Vk/mWQ5bd903v
	Ph9gLKcTS1MFHi188+o7Dhwul2HljVn9XSMI0LeZwMNp+oSBBFhkeYIMSEn+wAm1BBe+wTDiVApPE
	nzHR0kwodfgAu84p6JsiXG8Q6Rmo9PyIwAEEvfmX/GGSs8g/fXmliAtRryz9m/r2pFkcJJOdq0nYr
	m+CTZaYXZkTlrA2a7mHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrHiC-00000007tn6-0TUU;
	Mon, 01 Apr 2024 13:28:32 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrHi9-00000007tlV-04jt
	for linux-riscv@lists.infradead.org;
	Mon, 01 Apr 2024 13:28:31 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4A0303FBD5
	for <linux-riscv@lists.infradead.org>; Mon,  1 Apr 2024 13:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1711978103;
	bh=oGhJ4V2yDKtusjzSQjWAuQewc4y5aRN6k0toC9A0ZI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=UsXjyfG7Z16+CCibcXNyaB1K5B3ExXybv+3x32H5ldmsd0WFP6xeK3A5uUVO2FEA9
	 5PYbxP9A1FeX0uxJMt8SGd9UlwlIO/KBhJbCRte3yyvGtInP1Ut9Z2/SNyaaYJWLIV
	 YkfAvsY/IXoJyl0/3f8jyWjXe0W50VVmdTza7CJeayGeUhe2Zx3nxguXizsny+STuH
	 ktz+lGT7eog90P0B8C5I7RI8aUyszDjITAAuVPj2+xOK72GowueR4bEnSoFYG55rDm
	 MDYtwjXuvaGB7vASMBSVa+ZfVIHE/bIgpmIa4CP0gACdSHhs4vhONQCxfRHuqQQw/O
	 5wLGn1E4W4PxA==
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-41489c04e3aso15471375e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Apr 2024 06:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711978101; x=1712582901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oGhJ4V2yDKtusjzSQjWAuQewc4y5aRN6k0toC9A0ZI0=;
        b=XoXnrsUWXMy9ZxfmKWqrz7J53YsLT4ei5ZdErCWAmKc7/8RFQRt04yhTzDYu3grMPV
         l0y3a5asR8csFdRnR7Uho5JaHvVfYmMqiScN0VPpYqfyo+wu9NeRBNifZXf9fccDru+b
         oN3gzXUSm0qHCNxZuxyeqS5Hy88qbvICdM0NPK8qT/hqf9Hh5pOwQKgfsd/SoloVwzKe
         Sr3ShbOlg6judLwAZmcsHNOjMoI4dWCPPkyDhR2Pgdm/4LmBew2VegkIhZHXOtXjGb27
         z0qxE3PbNxFgQ76tctGCQ+4KpB2nqgWEuWthiSM741teOX80vnXLQ/bl2do6OHAAYfKL
         rbhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEgVDqYdmcT7H2Xpn2OuebstY9Thwf4YmdJPVpX0aLTDKk7bbmEjjnZLevA2Vxzjufx03FQj2eTNvNVlWUe0NuCapX+iGeekycQ3utyk9u
X-Gm-Message-State: AOJu0YwQrXs99zl2mXnj5wkSX0PqVl4xxgn5636Xp3iE3LWhYiR2h1hB
	DY1S6A/v197YtdtOLXH1nhhphzjFi0g3Y6v8ymxOCRJyLx/5dIchvqxOqogcLBHcim2IdRROQze
	Gf+qMPZ4qj2lYGnHqIsTNWXm2fofrJMx9mcZ8pnenvTjJu+2pcWGPEXvi3AQD+clDvsIVqwwMXf
	dAOMlQ0A==
X-Received: by 2002:a05:600c:518c:b0:412:e50f:acaf with SMTP id fa12-20020a05600c518c00b00412e50facafmr6537221wmb.24.1711978101145;
        Mon, 01 Apr 2024 06:28:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG77GrT37y7AXBR0yP7ysvCrsDvNzKjaHeo2yWsHXviI75ub8SUq3xJ1ZazdnQ47jEOmC0cdA==
X-Received: by 2002:a05:600c:518c:b0:412:e50f:acaf with SMTP id fa12-20020a05600c518c00b00412e50facafmr6537199wmb.24.1711978100772;
        Mon, 01 Apr 2024 06:28:20 -0700 (PDT)
Received: from [192.168.123.161] (ip-062-143-245-032.um16.pools.vodafone-ip.de. [62.143.245.32])
        by smtp.gmail.com with ESMTPSA id r11-20020a05600c35cb00b004149530aa97sm14908053wmq.10.2024.04.01.06.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Apr 2024 06:28:19 -0700 (PDT)
Message-ID: <013f6d51-7f78-4de0-945d-8902f32c850a@canonical.com>
Date: Mon, 1 Apr 2024 15:28:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] riscv: dts: starfive: add Milkv Mars board device
 tree
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
References: <20240131132600.4067-1-jszhang@kernel.org>
 <20240131132600.4067-7-jszhang@kernel.org>
 <20240206-magma-deem-2c88e45a545a@spud>
 <43918921-0d05-41d3-a19b-f137314e868d@canonical.com>
 <ZgYn9t4akccWuHyf@xhacker>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <ZgYn9t4akccWuHyf@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_062829_509461_A2EFF065 
X-CRM114-Status: GOOD (  25.19  )
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

T24gMy8yOS8yNCAwMzozMSwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPiBPbiBUaHUsIE1hciAyOCwg
MjAyNCBhdCAxMDoyODoyOFBNICswMTAwLCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOgo+PiBP
biAyLzYvMjQgMjA6MTMsIENvbm9yIERvb2xleSB3cm90ZToKPj4+IE9uIFdlZCwgSmFuIDMxLCAy
MDI0IGF0IDA5OjI2OjAwUE0gKzA4MDAsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4+Pj4gVGhlIE1p
bGt2IE1hcnMgaXMgYSBkZXZlbG9wbWVudCBib2FyZCBiYXNlZCBvbiB0aGUgU3RhcmZpdmUgSkg3
MTEwIFNvQy4KPj4+PiBUaGUgYm9hcmQgZmVhdHVyZXM6Cj4+Pj4KPj4+PiAtIEpINzExMCBTb0MK
Pj4+PiAtIDEvMi80LzggR2lCIExQRERSNCBEUkFNCj4+Pj4gLSBBWFAxNTA2MCBQTUlDCj4+Pj4g
LSA0MCBwaW4gR1BJTyBoZWFkZXIKPj4+PiAtIDN4IFVTQiAzLjAgaG9zdCBwb3J0Cj4+Pj4gLSAx
eCBVU0IgMi4wIGhvc3QgcG9ydAo+Pj4+IC0gMXggTS4yIEUtS2V5Cj4+Pj4gLSAxeCBlTU1DIHNs
b3QKPj4+PiAtIDF4IE1pY3JvU0Qgc2xvdAo+Pj4+IC0gMXggUVNQSSBGbGFzaAo+Pj4+IC0gMXgg
MUdicHMgRXRoZXJuZXQgcG9ydAo+Pj4+IC0gMXggSERNSSBwb3J0Cj4+Pj4gLSAxeCAyLWxhbmUg
RFNJIGFuZCAxeCA0LWxhbmUgRFNJCj4+Pj4gLSAxeCAyLWxhbmUgQ1NJCj4+Pj4KPj4+PiBBZGQg
dGhlIGRldmljZXRyZWUgZmlsZSBkZXNjcmliaW5nIHRoZSBjdXJyZW50bHkgc3VwcG9ydGVkIGZl
YXR1cmVzLAo+Pj4+IG5hbWVseSBQTUlDLCBVQVJULCBJMkMsIEdQSU8sIFNEIGNhcmQsIFFTUEkg
Rmxhc2gsIGVNTUMgYW5kIEV0aGVybmV0Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSmlzaGVu
ZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+Pj4KPj4+IEdvdCBhIGR0YnNfY2hlY2sgaXNz
dWUgaW4gdGhlIHBhdGNod29yayBDSToKPj4+Cj4+PiAgICAgK2FyY2gvcmlzY3YvYm9vdC9kdHMv
c3RhcmZpdmUvamg3MTEwLW1pbGt2LW1hcnMuZHRiOiBnbWFjMS1yZ21paS1yeGluLWNsb2NrOiAn
Y2xvY2stZnJlcXVlbmN5JyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5Cj4+PiAgICAgKwlmcm9tIHNj
aGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Nsb2NrL2ZpeGVkLWNsb2Nr
LnlhbWwjCj4+PiAgICAgK2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLW1pbGt2
LW1hcnMuZHRiOiBnbWFjMS1ybWlpLXJlZmluLWNsb2NrOiAnY2xvY2stZnJlcXVlbmN5JyBpcyBh
IHJlcXVpcmVkIHByb3BlcnR5Cj4+PiAgICAgKwlmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL2Nsb2NrL2ZpeGVkLWNsb2NrLnlhbWwjCj4+Pgo+Pj4gQ2FuIHlv
dSBmaXggdGhhdCBwbGVhc2U/IEFsc28sIEkgYXBwbGllZCBzb21lIHBhdGNoZXMgdGhlIG90aGVy
IGRheSB0aGF0Cj4+PiBzZWVtIHRvIGNvbmZsaWN0IHF1aXRlIGEgYml0IHdpdGggdGhlIGNvbW1v
biBib2FyZCBkdHMgcGF0Y2guIFdvdWxkIHlvdQo+Pj4gcGxlYXNlIGRvIGEgcmViYXNlIG9uIHRv
cCBvZiB0aGF0IHBsZWFzZT8KPj4+Cj4+PiBDaGVlcnMsCj4+PiBDb25vci4KPj4+Cj4+Pj4gLS0t
Cj4+Pj4gICAgYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9NYWtlZmlsZSAgICAgICAgIHwg
IDEgKwo+Pj4+ICAgIC4uLi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFycy5kdHMg
ICB8IDM1ICsrKysrKysrKysrKysrKysrKysKPj4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDM2IGlu
c2VydGlvbnMoKykKPj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0
cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFycy5kdHMKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9ib290L2R0
cy9zdGFyZml2ZS9NYWtlZmlsZQo+Pj4+IGluZGV4IDAxNDE1MDRjMGY1Yy4uMmZhMGNkN2YzMWMz
IDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvTWFrZWZpbGUK
Pj4+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL01ha2VmaWxlCj4+Pj4gQEAg
LTgsNSArOCw2IEBAIERUQ19GTEFHU19qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLXYxLjNi
IDo9IC1ACj4+Pj4gICAgZHRiLSQoQ09ORklHX0FSQ0hfU1RBUkZJVkUpICs9IGpoNzEwMC1iZWFn
bGV2LXN0YXJsaWdodC5kdGIKPj4+PiAgICBkdGItJChDT05GSUdfQVJDSF9TVEFSRklWRSkgKz0g
amg3MTAwLXN0YXJmaXZlLXZpc2lvbmZpdmUtdjEuZHRiCj4+Pj4gK2R0Yi0kKENPTkZJR19BUkNI
X1NUQVJGSVZFKSArPSBqaDcxMTAtbWlsa3YtbWFycy5kdGIKPj4+PiAgICBkdGItJChDT05GSUdf
QVJDSF9TVEFSRklWRSkgKz0gamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi12MS4yYS5kdGIK
Pj4+PiAgICBkdGItJChDT05GSUdfQVJDSF9TVEFSRklWRSkgKz0gamg3MTEwLXN0YXJmaXZlLXZp
c2lvbmZpdmUtMi12MS4zYi5kdGIKPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0
cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFycy5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0
YXJmaXZlL2poNzExMC1taWxrdi1tYXJzLmR0cwo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+
Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5kZTYwMGU3OTllN2QKPj4+PiAtLS0gL2Rldi9udWxsCj4+
Pj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFycy5k
dHMKPj4+PiBAQCAtMCwwICsxLDM1IEBACj4+Pj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wIE9SIE1JVAo+Pj4+ICsvKgo+Pj4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjMgSmlz
aGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+Pj4+ICsgKi8KPj4+PiArCj4+Pj4gKy9k
dHMtdjEvOwo+Pj4+ICsjaW5jbHVkZSAiamg3MTEwLXZpc2lvbmZpdmUyLW1hcnMtY29tbW9uLmR0
c2kiCj4+Pj4gKwo+Pj4+ICsvIHsKPj4+PiArCW1vZGVsID0gIk1pbGstViBNYXJzIjsKPj4+PiAr
CWNvbXBhdGlibGUgPSAibWlsa3YsbWFycyIsICJzdGFyZml2ZSxqaDcxMTAiOwo+Pj4+ICt9Owo+
Pj4+ICsKPj4+PiArJmdtYWMwIHsKPj4+PiArCXN0YXJmaXZlLHR4LXVzZS1yZ21paS1jbGs7Cj4+
Pj4gKwlhc3NpZ25lZC1jbG9ja3MgPSA8JmFvbmNyZyBKSDcxMTBfQU9OQ0xLX0dNQUMwX1RYPjsK
Pj4+PiArCWFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JmFvbmNyZyBKSDcxMTBfQU9OQ0xLX0dN
QUMwX1JNSUlfUlRYPjsKPj4+PiArfTsKPj4+PiArCj4+Pj4gKwo+Pj4+ICsmcGh5MCB7Cj4+Pj4g
Kwltb3RvcmNvbW0sdHgtY2xrLWFkai1lbmFibGVkOwo+Pj4+ICsJbW90b3Jjb21tLHR4LWNsay0x
MC1pbnZlcnRlZDsKPj4+PiArCW1vdG9yY29tbSx0eC1jbGstMTAwLWludmVydGVkOwo+Pj4+ICsJ
bW90b3Jjb21tLHR4LWNsay0xMDAwLWludmVydGVkOwo+Pj4+ICsJbW90b3Jjb21tLHJ4LWNsay1k
cnYtbWljcm9hbXAgPSA8Mzk3MD47Cj4+Pj4gKwltb3RvcmNvbW0scngtZGF0YS1kcnYtbWljcm9h
bXAgPSA8MjkxMD47Cj4+Pj4gKwlyeC1pbnRlcm5hbC1kZWxheS1wcyA9IDwxNTAwPjsKPj4+PiAr
CXR4LWludGVybmFsLWRlbGF5LXBzID0gPDE1MDA+Owo+Pj4+ICt9Owo+Pj4+ICsKPj4+PiArJm1t
YzEgewo+Pj4+ICsJZGlzYWJsZS13cDsKPj4KPj4gRHVlIHRvIHdoaWNoIGRpZmZlcmVuY2UgaXMg
J2Rpc2FibGUtd3AnIG5lY2Vzc2FyeSBmb3IgdGhlIE1hcnMgYm9hcmQgYW5kIG5vdAo+PiBuZWNl
c3NhcnkgZm9yIHRoZSBWaXNpb25GaXZlIDIgYm9hcmQ/Cj4gCj4gTWFycyBkb2Vzbid0IGhhdmUg
d3AgcGluLCBidXQgZHVubm8gdmYyIGNhc2Ugc2luY2UgSSBkb24ndCBoYXZlIGEgVkYyCj4gYm9h
cmQgOykKCklmIHRoZSBNaWxrLVYgTWFycyBkb2VzIG5vdCBoYXZlIGEgV1AgR1BJTywgd2Ugc2hv
dWxkIGJlIGFibGUgdG8gZHJvcCAKdGhpcyBwcm9wZXJ0eS4gVGhlIFZpc2lvbkZpdmUgMiBkb2Vz
IG5vdCBuZWVkIGl0IGVpdGhlci4KCj4+Cj4+Pj4gKwljZC1ncGlvcyA9IDwmc3lzZ3BpbyA0MSBH
UElPX0FDVElWRV9MT1c+Owo+Pgo+PiBPbiBteSBWaXNpb25GaXZlIDIgMS4yQiwgYW5kIDEuM0Eg
Ym9hcmRzIEdQSU8gNDEgcmVmbGVjdHMgaWYgYW4gU0QtY2FyZCBpcwo+PiBpbnNlcnRlZCAoYXMg
c2hvd24gaW4gVS1Cb290IGJ5IGdwaW8gc3RhdHVzIC1hKS4gU28gc2hvdWxkbid0IHRoaXMgdmFs
dWUgYmUKPj4gbW92ZWQgdG8gdGhlIGNvbW1vbiBpbmNsdWRlICJqaDcxMTAtdmlzaW9uZml2ZTIt
bWFycy1jb21tb24uZHRzaSIgYW5kCj4+IGJyb2tlbi1jZCByZW1vdmVkIGZyb20gdGhlIFZpc2lv
bkZpdmUyIGJvYXJkPwo+IAo+IEkgdGVzdGVkIHRoZSBDRCBwaW4gYW5kIGNhbiBjb25maXJtIGl0
IHdvcmtzIG9uIE1hcnMsIGJ1dCBJIGR1bm5vIHdoZXRoZXIKPiB0aGlzIHdvcmtzIG9uIFZGMiBz
aW5jZSBJIGhhdmUgbm8gVkYyIGJvYXJkLgo+IENvdWxkIHlvdSBwbGVhc2UgY2hlY2sgd2hldGhl
ciBpdCB3b3JrcyBvciBub3Qgb24gVkYyPwoKQXMgbWVudGlvbmVkIGluIG15IHByaW9yIG1haWwg
dGhlIGNhcmQgZGV0ZWN0IEdQSU8gaXMgd29ya2luZyBvbiB0aGUgClZpc2lvbkZpdmUgMi4gU3Rh
ckZpdmUgYWNrbm93bGVkZ2VkIG15IFUtQm9vdCBwYXRjaDoKCmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3UtYm9vdC9TSFhQUjAxTUIwODYzMTRDNDdDMjgxQjNERERGN0JBRTlFNjNBQUBTSFhQUjAx
TUIwODYzLkNITlBSMDEucHJvZC5wYXJ0bmVyLm91dGxvb2suY24vCgpCZXN0IHJlZ2FyZHMKCkhl
aW5yaWNoCgo+IAo+Pgo+PiBodHRwczovL2RvYy1lbi5ydnNwYWNlLm9yZy9WaXNpb25GaXZlMi9Q
REYvU0NIX1JWMDAyX1YxLjJBXzIwMjIxMjE2LnBkZgo+PiBoYXMgYSBsaW5lCj4+Cj4+ICAgICAg
R1BJTzQxIHwgU0RfU0RJTzBfQ0RfR1BJTzQxIHwgTWljcm8gU0TvvJpKMTAKPj4KPj4gQmVzdCBy
ZWdhcmRzCj4+Cj4+IEhlaW5yaWNoCj4+Cj4+Pj4gK307Cj4+Pj4gLS0gCj4+Pj4gMi40My4wCj4+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
