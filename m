Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E8AECAA2B
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Aug 2022 19:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MQ9+askeXf/PAHYMIFb+xdS1rzs0Xtq+HEfSbO3Xmug=; b=tu35YHKbV6NlRx
	nPXFkkp1GYtLSxK2vfYawZTl3HHTdUT8gXcS4p2vNSSjDrO6O0ARqzp0kbvyw3EnBzz2rtQ5vQ/vM
	bvEJsc03uPlquoeOLM/oWUnzj17KXEQKrqThwHApJMjI4lj5Qlp6HgsWw3SMsq5/a59gxT2jIqzDI
	oyTGdEO1N6O+Idi9DzvYYp9jEWZNIItor6fK3P9HRD0DKppjSZJKHFinC9lhOvtr8uDUtgHEyM+ju
	lZLshMIHBGIYnwuE7lSHSjhEEwFtz9Xt8w6neSefKjna+HQGYIFPWtc+RjQ1/J/vmb8B/+o5qa3bg
	wbEb3btaX41EWWWs+eEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRIre-002rdm-6u; Thu, 25 Aug 2022 19:50:06 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRIrb-002ras-2P
	for linux-riscv@lists.infradead.org; Thu, 25 Aug 2022 19:50:05 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8BA283FFB3
	for <linux-riscv@lists.infradead.org>; Thu, 25 Aug 2022 19:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1661456999;
	bh=ElCqit8gPCJv1gvsL3cYIQefN1cLdhhp7VEm0Nv6fXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=SlDGdJjM7as0izD1slTcUH5UKGMafwrDpoSBWIGHjF4CBAsVXFFP2uoP7RzHFN67W
	 m11X0yWM3D90xx9PjewltQLQqFWli+vyCcijSELa5YZi/xYhaBIyMe7jNSCN/iRw8W
	 c17YUXn1jnh7GhyPBUZLcE93GTki31tJGAHu3ijRtI17ATwkbEfroSuqgo42GlY1+x
	 Q3IjhN7mpViUH0lD4Xs1kN46uQDX/nQ2VtPpUi0XGqzxuR6y01QRUomonoxi+B2gH9
	 bDeV2rTJpWUdqKQXURXXZvvEkCrRyVegcEbOGh3VgZu76FNCs8OP+PPPE0cF95rgDB
	 aJYQy2jwTDDxw==
Received: by mail-wm1-f70.google.com with SMTP id c66-20020a1c3545000000b003a5f6dd6a25so2890378wma.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Aug 2022 12:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ElCqit8gPCJv1gvsL3cYIQefN1cLdhhp7VEm0Nv6fXA=;
        b=xDQvvaIq4dtzSv5Vyn3PHXi/a/N3D5/ECoO8h1I7wSv2FCyhSU7TtLB6amp5ujRrbe
         iJRhemVeVhCFmXSwoQ8F/j/vprL6APDTttZSfbp51RG2mWlBS2hfyS1HWOqdP9Xn0Nec
         790kpTPQt00yreulkgllI4+ckERfHqOFuWvfUheZEh0KN+pN25FRLHsf15j3kOUy3yMy
         IlwiHUg29U3cQUxqfBOXRaqctkRfxfL80PZWZUDcRgeKUEe3NbY4HpscuzufM1TBA+m9
         yEK8cUrBtnEltbrfYJi8U6TumnHRbMOCW4UkUFmPp/fihZQnexFLC41tniV51QjQz8uU
         HM9g==
X-Gm-Message-State: ACgBeo27Yv8iIWSSb6THbUaUTUlRUsFpHgx3PFYSsIXtzoeyT5cLyECF
	AuA6nymkh1SidW8gTdajibqEVuzGZf2L5nKNrFxH31YEj5GORHDQdgslSErSo2I9fMy2kdwiJ08
	aC8TCTt+ireElY34rz5s+Djor3OXIYp3whXowNzNB7FvAEw==
X-Received: by 2002:a5d:6daa:0:b0:225:5eeb:f76f with SMTP id u10-20020a5d6daa000000b002255eebf76fmr3038665wrs.479.1661456999196;
        Thu, 25 Aug 2022 12:49:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7ccOUiWZFXjWeags4bNyKLO9yxeQU0b0hr0yejK+PhiplvN9gzD9eUcWufaLD40ZNDCch2pw==
X-Received: by 2002:a5d:6daa:0:b0:225:5eeb:f76f with SMTP id u10-20020a5d6daa000000b002255eebf76fmr3038654wrs.479.1661456998883;
        Thu, 25 Aug 2022 12:49:58 -0700 (PDT)
Received: from [192.168.123.94] (ip-084-118-157-002.um23.pools.vodafone-ip.de. [84.118.157.2])
        by smtp.gmail.com with ESMTPSA id t18-20020a5d49d2000000b00224f5bfa890sm41320wrs.97.2022.08.25.12.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 12:49:57 -0700 (PDT)
Message-ID: <7b635894-5a91-9294-75ab-2fad8f657577@canonical.com>
Date: Thu, 25 Aug 2022 21:49:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/2] dt-bindings: riscv: sifive-l2: add a PolarFire SoC
 compatible
To: Conor.Dooley@microchip.com
Cc: sagar.kadam@sifive.com, atishp@atishpatra.org, paul.walmsley@sifive.com,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, Daire.McNamara@microchip.com, palmer@dabbelt.com,
 robh+dt@kernel.org
References: <20220825180417.1259360-1-mail@conchuod.ie>
 <20220825180417.1259360-2-mail@conchuod.ie>
 <5f00ab85-d5ac-728d-2157-e70f2a46cc90@canonical.com>
 <2d1da51d-d5a0-bb3c-ba63-831f0efc1b3d@microchip.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <2d1da51d-d5a0-bb3c-ba63-831f0efc1b3d@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_125003_554590_36740E2E 
X-CRM114-Status: GOOD (  23.30  )
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

CgpPbiA4LzI1LzIyIDIwOjU2LCBDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToKPiBP
biAyNS8wOC8yMDIyIDE5OjM2LCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOgo+PiBPbiA4LzI1
LzIyIDIwOjA0LCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBGcm9tOiBDb25vciBEb29sZXkgPGNv
bm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Pj4KPj4+IFRoZSBsMiBjYWNoZSBvbiBQb2xhckZp
cmUgU29DIGlzIGNyb3NzIGJldHdlZW4gdGhhdCBvZiB0aGUgZnU1NDAgYW5kCj4+PiB0aGUgZnU3
NDAuIEl0IGhhcyB0aGUgZXh0cmEgaW50ZXJydXB0IGZyb20gdGhlIGZ1NzQwIGJ1dCB0aGUgbG93
ZXIKPj4+IG51bWJlciBvZiBjYWNoZS1zZXRzLiBBZGQgYSBzcGVjaWZpYyBjb21wYXRpYmxlIHRv
IGF2b2lkIHRoZSBsaWtlcwo+Pj4gb2Y6Cj4+Pgo+Pj4gbXBmcy1wb2xhcmJlcnJ5LmR0YjogY2Fj
aGUtY29udHJvbGxlckAyMDEwMDAwOiBpbnRlcnJ1cHRzOiBbWzFdLCBbM10sIFs0XSwgWzJdXSBp
cyB0b28gbG9uZwo+Pgo+PiBXaGVyZSBpcyBzdWNoIGEgbWVzc2FnZSB3cml0dGVuPyBJIGNvdWxk
bid0IGZpbmQgdGhlIHN0cmluZyBpbgo+PiBuZXh0LTIwMjIwODI1IChnaXQgZ3JlcCAtbiAnaXMg
dG9vIGxvbmciJykuCj4gCj4gZHRic19jaGVjayBvbiBuZXh0LTIwMjIwODI1ICh3aXRoIGR0LXNj
aGVtYSB2MjIuMDggRldJVyk6Cj4gbXBmcy1wb2xhcmJlcnJ5LmR0YjogY2FjaGUtY29udHJvbGxl
ckAyMDEwMDAwOiBpbnRlcnJ1cHRzOiBbWzFdLCBbM10sIFs0XSwgWzJdXSBpcyB0b28gbG9uZwo+
IG1wZnMtaWNpY2xlLWtpdC5kdGI6IGNhY2hlLWNvbnRyb2xsZXJAMjAxMDAwMDogaW50ZXJydXB0
czogW1sxXSwgWzNdLCBbNF0sIFsyXV0gaXMgdG9vIGxvbmcKPiAKPiBJIHNob3VsZCBoYXZlIGNh
dWdodCB0aGlzIGJlZm9yZSBhcHBseWluZywgYnV0IEkgZ290IGRpc3RyYWN0ZWQKPiBieSB0aGUg
dW51c2FibGUgc3lzdGVtLgo+IAo+Pgo+PiBXaHkgc2hvdWxkIGEgZGlmZmVyZW50IG51bWJlciBv
ZiBjYWNoZSBzZXRzIHJlcXVpcmUgYW4gZXh0cmEKPj4gY29tcGF0aWJsZSBzdHJpbmcuIGNhY2hl
LXNpemUgaXMgc2ltcGx5IGEgcGFyYW1ldGVyIGdvaW5nIHdpdGg+IHRoZSBleGlzdGluZyBjb21w
YXRpYmxlIHN0cmluZ3MuCj4gCj4gcy9jYWNoZSBzZXRzL2ludGVycnVwdHMKPiBCZWNhdXNlIHRo
ZSBjb3JyZWN0IHZhbHVlIGZvciB0aGUgZnU1NDAgaXMgMyAmIHRoaXMgaXMgcmVndWxhdGVkIGJ5
Cj4gdGhlIGJpbmRpbmcuIFRoZSBhbHRlcm5hdGl2ZSB3b3VsZCBiZSByZWxheGluZyB0aGUgYmlu
ZGluZyB0byBub3QKPiByZWd1bGF0ZSB0aGUgbnVtYmVyIG9mIGludGVycnVwdHMuCj4gCj4+Cj4+
IEkgd291bGQgYXNzdW1lIHRoYXQgeW91IG9ubHkgbmVlZCBhbiBleHRyYSBjb21wYXRpYmxlIHN0
cmluZyBpZgo+PiB0aGVyZSBpcyBhIGZ1bmN0aW9uYWwgZGlmZmVyZW5jZSB0aGF0IGNhbiBub3Qg
YmUgZXhwcmVzc2VkIHdpdGgKPj4gdGhlIGV4aXN0aW5nIHBhcmFtZXRlcnMuCj4+Cj4+Pgo+Pj4g
Rml4ZXM6IDM0ZmM5Y2MzYWViZSAoInJpc2N2OiBkdHM6IG1pY3JvY2hpcDogY29ycmVjdCBMMiBj
YWNoZSBpbnRlcnJ1cHRzIikKPj4+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3Iu
ZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4+PiAtLS0KPj4+ICDCoCAuLi4vYmluZGluZ3MvcmlzY3Yv
c2lmaXZlLWwyLWNhY2hlLnlhbWzCoMKgwqDCoMKgwqAgfCA3OSArKysrKysrKysrKystLS0tLS0t
Cj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygt
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3Yvc2lmaXZlLWwyLWNhY2hlLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmlzY3Yvc2lmaXZlLWwyLWNhY2hlLnlhbWwKPj4+IGluZGV4IDY5Y2RhYjE4ZDYyOS4u
Y2EzYjliZTU4MDU4IDEwMDY0NAo+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jpc2N2L3NpZml2ZS1sMi1jYWNoZS55YW1sCj4+PiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc2lmaXZlLWwyLWNhY2hlLnlhbWwKPj4+IEBAIC0x
Nyw5ICsxNyw2IEBAIGRlc2NyaXB0aW9uOgo+Pj4gIMKgwqDCoCBhY3RzIGFzIGRpcmVjdG9yeS1i
YXNlZCBjb2hlcmVuY3kgbWFuYWdlci4KPj4+ICDCoMKgwqAgQWxsIHRoZSBwcm9wZXJ0aWVzIGlu
IGVQQVBSL0RldmljZVRyZWUgc3BlY2lmaWNhdGlvbiBhcHBsaWVzIGZvciB0aGlzIHBsYXRmb3Jt
Lgo+Pj4gIMKgIC1hbGxPZjoKPj4+IC3CoCAtICRyZWY6IC9zY2hlbWFzL2NhY2hlLWNvbnRyb2xs
ZXIueWFtbCMKPj4+IC0KPj4+ICDCoCBzZWxlY3Q6Cj4+PiAgwqDCoMKgIHByb3BlcnRpZXM6Cj4+
PiAgwqDCoMKgwqDCoCBjb21wYXRpYmxlOgo+Pj4gQEAgLTMzLDExICszMCwxNiBAQCBzZWxlY3Q6
Cj4+PiAgwqAgwqAgcHJvcGVydGllczoKPj4+ICDCoMKgwqAgY29tcGF0aWJsZToKPj4+IC3CoMKg
wqAgaXRlbXM6Cj4+PiAtwqDCoMKgwqDCoCAtIGVudW06Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
IC0gc2lmaXZlLGZ1NTQwLWMwMDAtY2NhY2hlCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgIC0gc2lm
aXZlLGZ1NzQwLWMwMDAtY2NhY2hlCj4+Cj4+IFdoeSBjYW4ndCB5b3Ugc2ltcGx5IGFkZCBtaWNy
b2NoaXAsbXBmcy1jY2FjaGUgaGVyZT8KPiAKPiBJICpjb3VsZCogYnV0IEkgb3B0ZWQgbm90IHRv
IGJlY2F1c2UgdGhlIGZ1NTQwIHN1cHBvcnRzIGEgY29tcGF0aWJsZQo+IHN1YnNldCBvZiB0aGUg
ZmVhdHVyZXMgJiBrZWVwaW5nIHRoZSBjb21wYXRpYmxlIGZvciBpdCBhbGxvd3Mgc3lzdGVtcwo+
IHdpdGggYSBuZXdlciBkdHMgdG8gd29yayB3aXRoIGFuIG9sZGVyIGtlcm5lbC4KClRoYXQgbWFr
ZXMgaXQgY2xlYXJlci4KCj4gCj4+Cj4+PiAtwqDCoMKgwqDCoCAtIGNvbnN0OiBjYWNoZQo+Pj4g
K8KgwqDCoCBvbmVPZjoKPj4+ICvCoMKgwqDCoMKgIC0gaXRlbXM6Cj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgIC0gZW51bToKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHNpZml2ZSxm
dTU0MC1jMDAwLWNjYWNoZQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gc2lmaXZl
LGZ1NzQwLWMwMDAtY2NhY2hlCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IGNhY2hl
Cj4+PiArwqDCoMKgwqDCoCAtIGl0ZW1zOgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0
OiBtaWNyb2NoaXAsbXBmcy1jY2FjaGUKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDog
c2lmaXZlLGZ1NTQwLWMwMDAtY2NhY2hlCj4+Cj4+IFdoeSBkbyB3ZSBuZWVkICdzaWZpdmUsZnU1
NDAtYzAwMC1jY2FjaGUnIHR3aWNlPwo+IAo+IElzIHRoZXJlIGEgYmV0dGVyIHdheSB0byB3cml0
ZSBpdCBnaXZlbiB0aGUgYWJvdmUgY2F2ZWF0Pwo+IAo+IFRoYW5rcywKPiBDb25vci4KPiAKPiAK
Pj4KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogY2FjaGUKPj4+ICDCoCDCoMKgwqAg
Y2FjaGUtYmxvY2stc2l6ZToKPj4+ICDCoMKgwqDCoMKgIGNvbnN0OiA2NAo+Pj4gQEAgLTcyLDI5
ICs3NCw0NiBAQCBwcm9wZXJ0aWVzOgo+Pj4gIMKgwqDCoMKgwqDCoMKgIFRoZSByZWZlcmVuY2Ug
dG8gdGhlIHJlc2VydmVkLW1lbW9yeSBmb3IgdGhlIEwyIExvb3NlbHkgSW50ZWdyYXRlZCBNZW1v
cnkgcmVnaW9uLgo+Pj4gIMKgwqDCoMKgwqDCoMKgIFRoZSByZXNlcnZlZCBtZW1vcnkgbm9kZSBz
aG91bGQgYmUgZGVmaW5lZCBhcyBwZXIgdGhlIGJpbmRpbmdzIGluIHJlc2VydmVkLW1lbW9yeS50
eHQuCj4+PiAgwqAgLWlmOgo+Pj4gLcKgIHByb3BlcnRpZXM6Cj4+PiAtwqDCoMKgIGNvbXBhdGli
bGU6Cj4+PiAtwqDCoMKgwqDCoCBjb250YWluczoKPj4+IC3CoMKgwqDCoMKgwqDCoCBjb25zdDog
c2lmaXZlLGZ1NTQwLWMwMDAtY2NhY2hlCj4+PiArYWxsT2Y6Cj4+PiArwqAgLSAkcmVmOiAvc2No
ZW1hcy9jYWNoZS1jb250cm9sbGVyLnlhbWwjCj4+PiAgwqAgLXRoZW46Cj4+PiAtwqAgcHJvcGVy
dGllczoKPj4+IC3CoMKgwqAgaW50ZXJydXB0czoKPj4+IC3CoMKgwqDCoMKgIGRlc2NyaXB0aW9u
OiB8Cj4+PiAtwqDCoMKgwqDCoMKgwqAgTXVzdCBjb250YWluIGVudHJpZXMgZm9yIERpckVycm9y
LCBEYXRhRXJyb3IgYW5kIERhdGFGYWlsIHNpZ25hbHMuCj4+PiAtwqDCoMKgwqDCoCBtYXhJdGVt
czogMwo+Pj4gLcKgwqDCoCBjYWNoZS1zZXRzOgo+Pj4gLcKgwqDCoMKgwqAgY29uc3Q6IDEwMjQK
Pj4+IC0KPj4+IC1lbHNlOgo+Pj4gLcKgIHByb3BlcnRpZXM6Cj4+PiAtwqDCoMKgIGludGVycnVw
dHM6Cj4+PiAtwqDCoMKgwqDCoCBkZXNjcmlwdGlvbjogfAo+Pj4gLcKgwqDCoMKgwqDCoMKgIE11
c3QgY29udGFpbiBlbnRyaWVzIGZvciBEaXJFcnJvciwgRGF0YUVycm9yLCBEYXRhRmFpbCwgRGly
RmFpbCBzaWduYWxzLgo+Pj4gLcKgwqDCoMKgwqAgbWluSXRlbXM6IDQKPj4+IC3CoMKgwqAgY2Fj
aGUtc2V0czoKPj4+IC3CoMKgwqDCoMKgIGNvbnN0OiAyMDQ4Cj4+PiArwqAgLSBpZjoKPj4+ICvC
oMKgwqDCoMKgIHByb3BlcnRpZXM6Cj4+PiArwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZToKPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqAgY29udGFpbnM6Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBlbnVtOgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gc2lmaXZlLGZ1NzQwLWMw
MDAtY2NhY2hlCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBtaWNyb2NoaXAsbXBm
cy1jY2FjaGUKPj4+ICsKPj4+ICvCoMKgwqAgdGhlbjoKPj4+ICvCoMKgwqDCoMKgIHByb3BlcnRp
ZXM6Cj4+PiArwqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0czoKPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqAgZGVzY3JpcHRpb246IHwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE11c3QgY29udGFp
biBlbnRyaWVzIGZvciBEaXJFcnJvciwgRGF0YUVycm9yLCBEYXRhRmFpbCwgRGlyRmFpbCBzaWdu
YWxzLgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBtaW5JdGVtczogNAoKQWJvdmUgeW91IGluZGlj
YXRlZCB0aGF0IHlvdSB3YW50IHN0cmljdCBsaW1pdHMgZm9yIHRoZSBpbnRlcnJ1cHQgY291bnQu
IApZb3UgZXhwZWN0IGV4YWN0bHkgNCBpdGVtcyBoZXJlLiBIYXZpbmcgNSBlbnRyaWVzIHdvdWxk
IG5vdCBiZSBjb3JyZWN0LgpQbGVhc2UsIGFkZCAnbWF4SXRlbXM6IDQnLgoKPj4+ICsKPj4+ICvC
oMKgwqAgZWxzZToKPj4+ICvCoMKgwqDCoMKgIHByb3BlcnRpZXM6Cj4+PiArwqDCoMKgwqDCoMKg
wqAgaW50ZXJydXB0czoKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgZGVzY3JpcHRpb246IHwKPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE11c3QgY29udGFpbiBlbnRyaWVzIGZvciBEaXJFcnJv
ciwgRGF0YUVycm9yIGFuZCBEYXRhRmFpbCBzaWduYWxzLgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oCBtYXhJdGVtczogMwoKVGhlIGl0ZW0gY291bnQgc2hvdWxkIGJlIGV4YWN0bHkgMy4gSGF2aW5n
IDIgZW50cmllcyB3b3VsZCBub3QgYmUgY29ycmVjdC4KUGxlYXNlLCBhZGQgJ21pbkl0ZW1zOiAz
Jy4KCkJlc3QgcmVnYXJkcwoKSGVpbnJpY2gKCj4+PiArCj4+PiArwqAgLSBpZjoKPj4+ICvCoMKg
wqDCoMKgIHByb3BlcnRpZXM6Cj4+PiArwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZToKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqAgY29udGFpbnM6Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b25zdDogc2lmaXZlLGZ1NzQwLWMwMDAtY2NhY2hlCj4+PiArCj4+PiArwqDCoMKgIHRoZW46Cj4+
PiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+Pj4gK8KgwqDCoMKgwqDCoMKgIGNhY2hlLXNldHM6
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0OiAyMDQ4Cj4+PiArCj4+PiArwqDCoMKgIGVs
c2U6Cj4+PiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+Pj4gK8KgwqDCoMKgwqDCoMKgIGNhY2hl
LXNldHM6Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0OiAxMDI0Cj4+PiAgwqAgwqAgYWRk
aXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4+PiAgICAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
