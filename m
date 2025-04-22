Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3903C369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 08:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VfwdGyVqYHOl5vFsQwxm9084vncjwnqCIf6GDl9NYfA=; b=42tuhKjBzEWy7M
	XgjydqQWxf2Em2inPuJAmb5NzUFI29vJMdVyrU6Eege7tliKVlORmsjht4Hzz6BBaY555k8fECfnD
	9YcMgvCb/V42PYCBBaphd8TarUq4kZm3x3y6RTViUoA1zc/1CRueKPHNcmRBEn2H0jCDqh5zAfE2t
	qyIeLE24K1z5ZBVVMS4QIdPenritu2zKjxrAlRNyqDm2os6v7lKsZkQmL3hjZrB2I3o4q4DAslYW8
	xEuq8PM1dxAox3zAcam0+DZocDArS7te7zjESGhnPWZNIeJmoaNXe3rjhqFsZrI4TiaTf9MaCweJO
	HFiE1TxAzimT7oE8Ux7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u799H-00000006Mvz-3bbT;
	Tue, 22 Apr 2025 08:38:35 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78VH-00000006Caw-2cD2
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 07:57:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43d0782d787so34178515e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Apr 2025 00:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745308633; x=1745913433; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EqBOHlwj4256j3dBDjYtf6K6K4BniWJZiGKAMEj4vds=;
        b=fEx7WrQeL98zUBmNZnk1+SHzNeHcS7ulhfIGFF21nrLrYXTGD9nDnPVj4qfOCyqRDg
         OhfNnRCxCrwijFR5K9o9auJt8U7vmf9X7zGiXkdBUEbwMb/lfG9Q/J2PrtcYkL1SoHPE
         RFHMaGN5cwAQeOi004S/AEVmjt3Pojb7NI1NskvYDgsbuVA9n354Tlf7WMO4Sfx6pbKt
         wmcxU2c6DX1xgv7zjPGwsZSvlHBl9MPu34tHJSSb+cvhdOvEUOr6guqHtVpj614+CWV0
         OeqJ+6ebP+y20KTp7kfvNEvJwmtsZXy2RJMQd/d+C4rtrOfqdbAR3TFywxi6Il16av4G
         a+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745308633; x=1745913433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EqBOHlwj4256j3dBDjYtf6K6K4BniWJZiGKAMEj4vds=;
        b=GlEonoZ6eB556yBKuGIT2dXIFiErBWv5ASxPFCLs9O5ZY8evmOlb25T/qxZi32i//d
         oKULLpXRGZk8Qjsm/OXCjnxn5XHktZqKKtk/ZEb5+CA0NWzk2hJfDyDvCvdsdX+JSqVY
         eR4UOJoio3rE1rL8CfE/M2H5w3diAbRYZT9Cwx6vVRCkvQ3ltSF8VxeHAPVFbvLeT6lX
         kEBrx5V3fEwgVgRcNh1CDgCgw3bYID7q/xuscmvDttSAzv2e1N96YSgbNTA5hsT6bBqM
         W/cY2KxbSeB2tdTA75hk3qa1U+2Tax6OnSYfKq0I1Ty6kO3rOQ2aTyZkvyQLckXjqQ/e
         vQ1w==
X-Forwarded-Encrypted: i=1; AJvYcCUMK+nkByc+v5nFb4InO8Kych6NZuGDIn5qG4yQG1WqdZ7Wbt2uMva3b9DrDAPePUEm+M82CeooeVLivw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLP/mp3hHY6NZUCYV6433vVCD4lQS8fVf/NxvNa0V1JEVsFM9X
	4tU7hWu9lOnDv46chPEH4Ud62rx+7OrihoUrn4i2OOWneZPbPS6bCFUxTHvMPlE=
X-Gm-Gg: ASbGncvoHDjg03IxRemAaZOSIuNFN0Y0QyAcI0zNF+Jbgt8YmmxgjKRFaTFh/04wv60
	LZj5hrDQtptHH5sGnoye2UaqGb8oMEOADtw0OLKxUGgnX2aFD7PyhhPISGoC8IWygHw0/rsfYBR
	aCG1Xn7GCDWx3zn7/onOVzegIvXrl05iAyDJcBC0ftLdBXmb3GrOdHMgjK+2E0xC+HbIXdF5uI9
	SdtrxGS9qMI1HwNtJh1xbecrntzE3XwAIDne6zrcVxdWgUqXCNeKuLPidSiCPnqUfboaeZIQDvb
	DG6CKvvjWfPlZIR9glCFFe1J1hFVcbGf4pLaRnAGAFkgJ+vKLbcl4u3XRjlMt0VNpXNBI74u6Ce
	Rd5wrb1dK8A==
X-Google-Smtp-Source: AGHT+IGhvdPbJvZOktQCBqw/2wUTXP1WKMQk4VP2N0DETPu5Pgx5Z2h8MnL3dE4kU4vPi/MEVPmpBQ==
X-Received: by 2002:a05:600c:1547:b0:439:6118:c188 with SMTP id 5b1f17b1804b1-4406aba756emr107164305e9.19.1745308633516;
        Tue, 22 Apr 2025 00:57:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5d7a3dsm160623495e9.38.2025.04.22.00.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 00:57:12 -0700 (PDT)
Message-ID: <2c4f4422-d9c9-4d36-b0ef-f68779b91ee9@rivosinc.com>
Date: Tue, 22 Apr 2025 09:57:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] riscv: misaligned: factorize trap handling
To: Alexandre Ghiti <alex@ghiti.fr>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
 Andrew Jones <ajones@ventanamicro.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>
References: <20250414123543.1615478-1-cleger@rivosinc.com>
 <20250414123543.1615478-2-cleger@rivosinc.com>
 <ba11b910-9959-4845-b3a3-dd9a52466823@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <ba11b910-9959-4845-b3a3-dd9a52466823@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_005716_645572_FB48B743 
X-CRM114-Status: GOOD (  22.23  )
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

CgpPbiAyMS8wNC8yMDI1IDA5OjA2LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gSGkgQ2zDqW1l
bnQsCj4gCj4gCj4gT24gMTQvMDQvMjAyNSAxNDozNCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+
PiBtaXNhbGlnbmVkIGFjY2Vzc2VzIHRyYXBzIGFyZSBub3Qgbm1pIGFuZCBzaG91bGQgYmUgdHJl
YXRlZCBhcyBub3JtYWwKPj4gb25lIHVzaW5nIGlycWVudHJ5X2VudGVyKCkvZXhpdCgpLgo+IAo+
IAo+IEFsbCB0aGUgdHJhcHMgdGhhdCBjb21lIGZyb20ga2VybmVsIG1vZGUgYXJlIHRyZWF0ZWQg
YXMgbm1pIGFzIGl0IHdhcwo+IHN1Z2dlc3RlZCBieSBQZXRlciBoZXJlOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi8KPiBZeWh2NFVVWHVTZnZNT3crQGhpcmV6LnByb2dyYW1t
aW5nLmtpY2tzLWFzcy5uZXQvCj4gCj4gSSBkb24ndCBrbm93IHRoZSBkaWZmZXJlbmNlcyBiZXR3
ZWVuIGlycV9ubWlfZW50cnkvZXhpdCgpIGFuZCBpcnFfZW50cnkvCj4gZXhpdCgpLCBzbyBpcyB0
aGF0IHN0aWxsIGNvcnJlY3QgdG8gbm93IHRyZWF0IHRoZSBrZXJuZWwgdHJhcHMgYXMgbm9uLW5t
aT8KCkhpIEFsZXgsCgpBY3R1YWxseSwgdGhpcyBkaXNjdXNzaW9uIHdhcyByYWlzZWQgb24gYSBw
cmV2aW91cyBzZXJpZXMgWzFdIGJ5IE1hY2llagp3aGljaCByZXBsaWVkIHRoYXQgd2Ugc2hvdWxk
IGFjdHVhbGx5IHJlZW5hYmxlIGludGVycnVwdCBkZXBlbmRpbmcgb24KdGhlIHN0YXRlIHRoYXQg
d2FzIGludGVycnVwdGVkLiBMb29raW5nIGF0IG90aGVyIGFyY2hpdGVjdHVyZS9jb2RlLCBpdApz
ZWVtcyBsaWtlIHRyZWF0aW5nIG1pc2FsaWduZWQgYWNjZXNzZXMgYXMgTk1JIGlzIHByb2JhYmx5
IG5vdCB0aGUgcmlnaHQKd2F5LiBGb3IgaW5zdGFuY2UsIGxvb25nYXJjaCB0cmVhdHMgdGhlbSBh
cyBub3JtYWwgSVJRIHVzaW5nIGEKaXJxZW50cnlfZW50ZXIoKS9leGl0KCkgYW5kIHJlZW5hYmxp
bmcgSVJRUyBpZiBwb3NzaWJsZS4KCk1vcmVvdmVyLCBpdCBsb29rcyBsaWtlIHRvIG1lIHRoYXQg
bWlzYWxpZ25lZCBhY2Nlc3MgdHJhcHMgYXJlIHNpbWlsYXIKKGluIHRoZSB3YXkgdGhleSBjYW4g
YmUgaGFuZGxlZCkgdG8gaG93IHRoZSBwYWdlIGZhdWx0IGFyZSBoYW5kbGVkIGluClJJU0MtVi4g
SXQgdXNlcyBpcnFlbnRyeV9lbnRlcigpL2V4aXQoKSBhbmQgcmVlbmFibGVzIGludGVycnVwdHMg
aWYKbmVlZGVkLiBBZGRpdGlvbmFsbHksIHRoZSBtaXNhbGlnbmVkIGFjY2VzcyBoYW5kbGluZyBk
b2VzIHdpbGwgbm90IHRha2UKYW55IGxvY2tzIGlmIGhhbmRsaW5nIGEgbWlzYWxpZ25lZCBhY2Nl
c3MgdGFrZW4gd2hpbGUgaW4ga2VybmVsIHNvIGV2ZW4KaWYgd2UgaW50ZXJydXB0IGEga2VybmVs
IGNyaXRpY2FsIHNlY3Rpb24gdGhhdCBkb2VzIG5vdCBoYXZlIGludGVycnVwdHMKZGlzYWJsZSwg
d2UgYXJlIGdvb2QgdG8gZ28uIEJ1dCBteSB1bmRlcnN0YW5kaW5nIG1pZ2h0IGJlIHdyb25nIGFz
IHdlbGwKYW5kIEkgbWlnaHQgYmUgbWlzc2luZyBzcGVjaWZpYyBjYXNlcyA6KQoKVGhhbmtzLAoK
Q2zDqW1lbnQKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvYWxwaW5lLkRFQi4yLjIxLjI1
MDEwNzAxNDMyNTAuMTg4ODlAYW5naWUub3JjYW0ubWUudWsvClsxXQoKPiAKPiBUaGFua3MsCj4g
Cj4gQWxleAo+IAo+IAo+PiBTaW5jZSBib3RoIGxvYWQvc3RvcmUgYW5kIHVzZXIva2VybmVsCj4+
IHNob3VsZCB1c2UgYWxtb3N0IHRoZSBzYW1lIHBhdGggYW5kIHRoYXQgd2UgYXJlIGdvaW5nIHRv
IGFkZCBzb21lIGNvZGUKPj4gYXJvdW5kIHRoYXQsIGZhY3Rvcml6ZSBpdC4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyPGNsZWdlckByaXZvc2luYy5jb20+Cj4+IC0tLQo+PiDC
oCBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIHwgNDkgKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAy
OSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4+IGluZGV4IDhmZjhlOGIzNjUyNC4uNTVk
OWYzNDUwMzk4IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4+ICsr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPj4gQEAgLTE5OCw0NyArMTk4LDM4IEBAIGFz
bWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQKPj4gZG9fdHJhcF9pbnNuX2ls
bGVnYWwoc3RydWN0IHB0X3JlZ3MgKnJlCj4+IMKgIERPX0VSUk9SX0lORk8oZG9fdHJhcF9sb2Fk
X2ZhdWx0LAo+PiDCoMKgwqDCoMKgIFNJR1NFR1YsIFNFR1ZfQUNDRVJSLCAibG9hZCBhY2Nlc3Mg
ZmF1bHQiKTsKPj4gwqAgLWFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQK
Pj4gZG9fdHJhcF9sb2FkX21pc2FsaWduZWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+ICtlbnVt
IG1pc2FsaWduZWRfYWNjZXNzX3R5cGUgewo+PiArwqDCoMKgIE1JU0FMSUdORURfU1RPUkUsCj4+
ICvCoMKgwqAgTUlTQUxJR05FRF9MT0FELAo+PiArfTsKPj4gKwo+PiArc3RhdGljIHZvaWQgZG9f
dHJhcF9taXNhbGlnbmVkKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBlbnVtCj4+IG1pc2FsaWduZWRf
YWNjZXNzX3R5cGUgdHlwZSkKPj4gwqAgewo+PiAtwqDCoMKgIGlmICh1c2VyX21vZGUocmVncykp
IHsKPj4gLcKgwqDCoMKgwqDCoMKgIGlycWVudHJ5X2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3Mp
Owo+PiArwqDCoMKgIGlycWVudHJ5X3N0YXRlX3Qgc3RhdGUgPSBpcnFlbnRyeV9lbnRlcihyZWdz
KTsKPj4gwqAgK8KgwqDCoCBpZiAodHlwZSA9PcKgIE1JU0FMSUdORURfTE9BRCkgewo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKGhhbmRsZV9taXNhbGlnbmVkX2xvYWQocmVncykpCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRvX3RyYXBfZXJyb3IocmVncywgU0lHQlVTLCBCVVNfQURS
QUxOLCByZWdzLT5lcGMsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJP
b3BzIC0gbG9hZCBhZGRyZXNzIG1pc2FsaWduZWQiKTsKPj4gLQo+PiAtwqDCoMKgwqDCoMKgwqAg
aXJxZW50cnlfZXhpdF90b191c2VyX21vZGUocmVncyk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIk9vcHMgLSBsb2FkIGFkZHJlc3MgbWlzYWxpZ25lZCIp
Owo+PiDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+IC3CoMKgwqDCoMKgwqDCoCBpcnFlbnRyeV9zdGF0
ZV90IHN0YXRlID0gaXJxZW50cnlfbm1pX2VudGVyKHJlZ3MpOwo+PiAtCj4+IC3CoMKgwqDCoMKg
wqDCoCBpZiAoaGFuZGxlX21pc2FsaWduZWRfbG9hZChyZWdzKSkKPj4gK8KgwqDCoMKgwqDCoMKg
IGlmIChoYW5kbGVfbWlzYWxpZ25lZF9zdG9yZShyZWdzKSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZG9fdHJhcF9lcnJvcihyZWdzLCBTSUdCVVMsIEJVU19BRFJBTE4sIHJlZ3MtPmVw
YywKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIk9vcHMgLSBsb2FkIGFk
ZHJlc3MgbWlzYWxpZ25lZCIpOwo+PiAtCj4+IC3CoMKgwqDCoMKgwqDCoCBpcnFlbnRyeV9ubWlf
ZXhpdChyZWdzLCBzdGF0ZSk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgIk9vcHMgLSBzdG9yZSAob3IgQU1PKSBhZGRyZXNzIG1pc2FsaWduZWQiKTsKPj4g
wqDCoMKgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCBpcnFlbnRyeV9leGl0KHJlZ3MsIHN0YXRlKTsK
Pj4gwqAgfQo+PiDCoCAtYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZAo+
PiBkb190cmFwX3N0b3JlX21pc2FsaWduZWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+ICthc21s
aW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkCj4+IGRvX3RyYXBfbG9hZF9taXNh
bGlnbmVkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+PiDCoCB7Cj4+IC3CoMKgwqAgaWYgKHVzZXJf
bW9kZShyZWdzKSkgewo+PiAtwqDCoMKgwqDCoMKgwqAgaXJxZW50cnlfZW50ZXJfZnJvbV91c2Vy
X21vZGUocmVncyk7Cj4+IC0KPj4gLcKgwqDCoMKgwqDCoMKgIGlmIChoYW5kbGVfbWlzYWxpZ25l
ZF9zdG9yZShyZWdzKSkKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG9fdHJhcF9lcnJvcihy
ZWdzLCBTSUdCVVMsIEJVU19BRFJBTE4sIHJlZ3MtPmVwYywKPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAiT29wcyAtIHN0b3JlIChvciBBTU8pIGFkZHJlc3MgbWlzYWxpZ25lZCIp
Owo+PiAtCj4+IC3CoMKgwqDCoMKgwqDCoCBpcnFlbnRyeV9leGl0X3RvX3VzZXJfbW9kZShyZWdz
KTsKPj4gLcKgwqDCoCB9IGVsc2Ugewo+PiAtwqDCoMKgwqDCoMKgwqAgaXJxZW50cnlfc3RhdGVf
dCBzdGF0ZSA9IGlycWVudHJ5X25taV9lbnRlcihyZWdzKTsKPj4gLQo+PiAtwqDCoMKgwqDCoMKg
wqAgaWYgKGhhbmRsZV9taXNhbGlnbmVkX3N0b3JlKHJlZ3MpKQo+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkb190cmFwX2Vycm9yKHJlZ3MsIFNJR0JVUywgQlVTX0FEUkFMTiwgcmVncy0+ZXBj
LAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJPb3BzIC0gc3RvcmUgKG9yIEFN
TykgYWRkcmVzcyBtaXNhbGlnbmVkIik7Cj4+ICvCoMKgwqAgZG9fdHJhcF9taXNhbGlnbmVkKHJl
Z3MsIE1JU0FMSUdORURfTE9BRCk7Cj4+ICt9Cj4+IMKgIC3CoMKgwqDCoMKgwqDCoCBpcnFlbnRy
eV9ubWlfZXhpdChyZWdzLCBzdGF0ZSk7Cj4+IC3CoMKgwqAgfQo+PiArYXNtbGlua2FnZSBfX3Zp
c2libGUgX190cmFwX3NlY3Rpb24gdm9pZAo+PiBkb190cmFwX3N0b3JlX21pc2FsaWduZWQoc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MpCj4+ICt7Cj4+ICvCoMKgwqAgZG9fdHJhcF9taXNhbGlnbmVkKHJl
Z3MsIE1JU0FMSUdORURfU1RPUkUpOwo+PiDCoCB9Cj4+ICsKPj4gwqAgRE9fRVJST1JfSU5GTyhk
b190cmFwX3N0b3JlX2ZhdWx0LAo+PiDCoMKgwqDCoMKgIFNJR1NFR1YsIFNFR1ZfQUNDRVJSLCAi
c3RvcmUgKG9yIEFNTykgYWNjZXNzIGZhdWx0Iik7Cj4+IMKgIERPX0VSUk9SX0lORk8oZG9fdHJh
cF9lY2FsbF9zLAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
