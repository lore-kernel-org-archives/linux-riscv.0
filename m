Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAEBC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 15:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bddei0eZRnKHVF5VRSASvmfOy9cd7gurXjPwr5/GZ84=; b=PTZbIEoIEfhcTk
	z6zcRbdQTTR/q7+A3NBzzBmT3nSEN3QMBmF+GW1qtE5zpN72I73fy1PZbhiOAL12TPNOqzmPDI6mR
	aeMwLXJkudYB85xt8lhENHnZ7wNybmsQiF1BxU57qBp6L6O/RyRH07qfXGw+NDf4nQrk7muuMxYao
	OIhihzkab/UmCnYS2b9qZ+eflHhJmTaXnwHObHvS+VorQyfldMeLszNIxPnxBfiYJZ3IHnbr+A8Jg
	dIHoN3iqvPCGN7jsh3/C5ESmwkjFl9D7fqADaeVkWy6rdQGfE7mWHprAVxmjH9Lfdn9bdr0LyTUf8
	o+9O35K33rs2hOaL/WBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtAhq-00GQr3-Bx; Fri, 03 Dec 2021 15:42:38 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtAhm-00GQqC-IK
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 15:42:36 +0000
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 414A74003B
 for <linux-riscv@lists.infradead.org>; Fri,  3 Dec 2021 15:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638546148;
 bh=lTk3MNuVLu96YWzY4ffX8Fgx2rZx49FpUrhHnTr7cDA=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=up0Go4dubyJwfQovGf/i5kIuoj1I0dswk8A1A8NKClibaeyUVnXxHZ5aRFgMxAKPM
 0wKT/weKqVHIAa++Y30bmT9b92azDplKuJkN3avauYd2GybxmScJByTp9rYvjk0oZH
 Sq9MEnsdELuH/GRdHSQ3YAEORTlTsVDIHVJXSFVq7jaKpeGRNmZA/Ch7b8f9mH/rKN
 ERBq1UaS83+QST2eiaMp3auTw7Hmxaqo82skdrJGnQpF1xON9zmVqeIhj/TVAH8MFm
 eG28HeKmJT6vsGytHx+Ss0HWIy5lEWZR/tMcdSUFEVO9Lv7HDTSlXrGsnMKs6/4A6t
 Cko2JQLCeIhGQ==
Received: by mail-lj1-f197.google.com with SMTP id
 h17-20020a05651c125100b0021ba28cf54dso1267740ljh.22
 for <linux-riscv@lists.infradead.org>; Fri, 03 Dec 2021 07:42:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lTk3MNuVLu96YWzY4ffX8Fgx2rZx49FpUrhHnTr7cDA=;
 b=VE+Od5CequNkJ7/Q/+aCAAPpNN2lPQRH8mbegM2EldjDWkY2zgxfiEHK3i2S7WKO20
 NdR9QK9MPnDdaIRPzel6XiYyVJ/GQnjqtlqCXnjG3XOet9P1DaCta8TAKcDrfPMWoeIS
 DP3J7h2ca7ELRpftxO5ueqKhOIUHz6RbMld64evOE+X6FVUB/L4rUsm64jvf5Z44tChK
 GkzNhIxdH4aMjI5atBqTA2cDAX+z8tZur3RMuSrrfYVScgUmKNuRkhl1wcGmf4IMvfgc
 H6MPuOQStErR+ESwKsDe64KrpkmsysIafvs83+LvryrTrDzd6pVhA62GZcq4M6yn6JBV
 aUUA==
X-Gm-Message-State: AOAM5338zPkWtn0hHidqEGliwVR2M31l2DkEIc7BifaWrbGhRBU9WJke
 ywc7VFhw6nqJSyYusg4dbnLhuBeTYy7qvBXA0YKcFstLbc1K7Tb8vOrfa+IwRaKgG30Yw9Hnq4I
 gSKM/q3Gyb2uJxGtOO1fg3YNBFLb3HRP/M9B5E9KtitQwwQ==
X-Received: by 2002:a2e:86cb:: with SMTP id n11mr19311947ljj.425.1638546147651; 
 Fri, 03 Dec 2021 07:42:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVhurzOWfS+CPRAFQbogE43XnffisN+K6tfpAmvKw/rqZB/xoa3BGf6i3Le0K3rhbqmZw+MQ==
X-Received: by 2002:a2e:86cb:: with SMTP id n11mr19311918ljj.425.1638546147449; 
 Fri, 03 Dec 2021 07:42:27 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 e17sm406965lfr.296.2021.12.03.07.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 07:42:27 -0800 (PST)
Message-ID: <c3364060-fbf8-1151-2816-3784b1731891@canonical.com>
Date: Fri, 3 Dec 2021 16:42:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 6/9] riscv: dts: microchip: mpfs: Fix reference clock node
Content-Language: en-US
To: Conor.Dooley@microchip.com, geert@linux-m68k.org
Cc: devicetree@vger.kernel.org, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com, robh+dt@kernel.org, damien.lemoal@wdc.com,
 Lewis.Hanly@microchip.com
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-7-geert@linux-m68k.org>
 <3b8442c7-fafb-421b-cd5b-4b57d1b545c3@canonical.com>
 <fc4a0c49-1a3f-68d6-de54-820d3e9c0938@microchip.com>
 <738f161a-038a-b6f1-1ff7-65674ae75d06@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <738f161a-038a-b6f1-1ff7-65674ae75d06@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_074234_786691_4DE63792 
X-CRM114-Status: GOOD (  16.44  )
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

T24gMDMvMTIvMjAyMSAxNjoyOSwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4g
T24gMjYvMTEvMjAyMSAxMDoxNiwgY29ub3Igd3JvdGU6Cj4+IE9uIDI2LzExLzIwMjEgMDk6NDgs
IEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNs
aWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IAo+Pj4gdGhlIGNv
bnRlbnQgaXMgc2FmZQo+Pj4KPj4+IE9uIDI1LzExLzIwMjEgMTY6MzEsIEdlZXJ0IFV5dHRlcmhv
ZXZlbiB3cm90ZToKPj4+PiAibWFrZSBkdGJzX2NoZWNrIiByZXBvcnRzOgo+Pj4+Cj4+Pj4gwqDC
oMKgwqAgYXJjaC9yaXNjdi9ib290L2R0cy9taWNyb2NoaXAvbWljcm9jaGlwLW1wZnMtaWNpY2xl
LWtpdC5kdC55YW1sOiAKPj4+PiBzb2M6IHJlZmNsazogeydjb21wYXRpYmxlJzogWydmaXhlZC1j
bG9jayddLCAnI2Nsb2NrLWNlbGxzJzogW1swXV0sIAo+Pj4+ICdjbG9jay1mcmVxdWVuY3knOiBb
WzYwMDAwMDAwMF1dLCAnY2xvY2stb3V0cHV0LW5hbWVzJzogCj4+Pj4gWydtc3NwbGxjbGsnXSwg
J3BoYW5kbGUnOiBbWzddXX0gc2hvdWxkIG5vdCBiZSB2YWxpZCB1bmRlciB7J3R5cGUnOiAKPj4+
PiAnb2JqZWN0J30KPj4+PiDCoMKgwqDCoMKgwqAgRnJvbSBzY2hlbWE6IGR0c2NoZW1hL3NjaGVt
YXMvc2ltcGxlLWJ1cy55YW1sCj4+Pj4KPj4+PiBGaXggdGhpcyBieSBtb3ZpbmcgdGhlIG5vZGUg
b3V0IG9mIHRoZSAic29jIiBzdWJub2RlLgo+Pj4+IFdoaWxlIGF0IGl0LCByZW5hbWUgaXQgdG8g
Im1zc3BsbGNsayIsIGFuZCBkcm9wIHRoZSBub3cgc3VwZXJmbHVvdXMKPj4+PiAiY2xvY2stb3V0
cHV0LW5hbWVzIiBwcm9wZXJ0eS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4+Pj4gLS0tCj4+Pj4gwqAgYXJjaC9yaXNj
di9ib290L2R0cy9taWNyb2NoaXAvbWljcm9jaGlwLW1wZnMuZHRzaSB8IDEzICsrKysrKy0tLS0t
LS0KPj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQo+Pj4+Cj4+Pgo+Pj4gSXQgaXMgYWxzbyBsb2dpY2FsIGJlY2F1c2UgcmVmY2xrIHVzdWFsbHkg
aXMgbm90IGEgcHJvcGVydHkgb2YgdGhlIFNvQy4KPj4+IEl0IGFjdHVhbGx5IG1pZ2h0IGJlIGEg
cHJvcGVydHkgb2YgYm9hcmQuLi4KPj4gVGhpcyBpcyBvbmUgb2YgdGhlIGZ1biBGUEdBaXNtcyBs
aWtlIHRoZSBHUElPIGludGVycnVwdCBjb25maWd1cmF0aW9uLiAKPj4gVGhpcyBjbG9jayBzZXR0
aW5nIGlzIGRldGVybWluZWQgYnkgd2hhdCBkZXNpZ24gaGFzIGJlZW4gbG9hZGVkIG9udG8gdGhl
IAo+PiBGUEdBIC0gdGhlIG1zc3BsbCBvdXRwdXRzIGFyZSBjb25maWd1cmFibGUsIEkgY291bGQg
cmVkbyBteSBGUEdBIGRlc2lnbiAKPj4gYW5kIGNoYW5nZSB0aGlzIHRvIDUwMCBNSHogZXRjLiBJ
biB0dXJuIHRoZSBtc3NwbGwgY2xvY2sgaXMgc2V0IGJ5IAo+PiBhbm90aGVyIGNsb2NrIHNvdXJj
ZSB0aGF0IGlzIGFjdHVhbGx5IG9uIHRoZSBib2FyZCBvZiBlaXRoZXIgMTAwIG9yIDEyNSAKPj4g
TUh6Lgo+Pgo+PiBTaW5jZSBpdCdzIG5vdCBzZXQgdW50aWwgYml0c3RyZWFtIHByb2dyYW1taW5n
IHRpbWUsIEkgd291bGQgYWdyZWUgdGhhdCAKPj4gdGhhdCBwcm9wZXJ0eSBzaG91bGQgYmUgbW92
ZWQgdG8gb3V0IG9mIG1wZnMuZHRzaS4gKHR5cG8gZml4ZWQpCj4gR2VlcnQvS3J6eXN6dG9mLAo+
IFdvdWxkIHRoZSBmb2xsb3dpbmcgbWFrZSBzZW5zZToKPiAtIFNpbmNlIHRoZSByZWZjbGsgaGFy
ZHdhcmUgaXMgYSBwYXJ0IG9mIHRoZSBjaGlwLCBtb3ZlIHRoZSByZWZjbGsgb3V0IAo+IG9mIHRo
ZSBzb2Mgbm9kZSBidXQgbGVhdmUgaXQgaW4gbWZwcy5kdHNpCj4gLSBUaGUgY2xrIGZyZXEgaXRz
ZWxmIGlzIHNldCBieSB0aGUgZnBnYSBiaXRzdHJlYW0sIHNvIG1vdmUgdGhlIAo+IGNsb2NrLWZy
ZXF1ZW5jeSBwcm9wZXJ0eSB0byBtcGZzLWljaWNsZS1raXQuZHRzPwoKWWVzLCBtYWtlcyBzZW5z
ZSB0byBtZS4KCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
