Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FED0C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 11:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jGIUWYOCkwjJe4muYUN4GZcyY64bFqRQQrAcCYCr1Zw=; b=kJBLgc0NH86ROS
	ck3Q82jAM0L5eZ7immAsUyx5Fsi/ZrRcNDSMPuTSonCX8fH7gDW9HxjvU8a2iIWM+lLb5bMWW3F5R
	URDAKDBecOasMOjAhG2d8QX4FoPU9S5p+/xv5R5VBoTueLVU/+88DsgF8M6d67eMYTEXkDnCaGPT7
	nEwhRK2WXe01GJWOUsq+001tWGvlD0KpYzBeYtgWOmEWQyypJ5nER6JL+ZPV+B0VRXaVwRcfLjcLT
	94eugNZGzcg9Upv+knywsoyaTsGDVq0FyyJWaxo9zDoM2R17+ikW8cCXgCH2zJ9f6Ie91iJPJyqLW
	9IvSg3r9VEFAI3HmOR7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rys39-0000000DP9s-380Y;
	Mon, 22 Apr 2024 11:41:31 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rys37-0000000DP8E-06qj
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 11:41:30 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-347c6d6fc02so651862f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Apr 2024 04:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713786086; x=1714390886; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KGqDQHMjrZlO15Rvq0SOqA/APBPIM6ni8f7xyO7pFgU=;
        b=BRd3DBxJ966te2OtAXEOpsOVrJGUAYKxQl49heu5vk2jKu5q4YwcMhZNVGTiH5KNkD
         eYN6WdNaLEnk9NYG97V4EkDYiox+4rqfn8PfenTJwQfuWRGJbkF1N5tI1N2/e8VlnW7/
         S9Oa7JfeRN1j7zqwPw4pospkIeaT4Ou9xy+aisu11PffAd8oPg2IZ1unqSEdyEt97hHf
         tiPMzPcuJIoIYDYM/qo7pRxXcRKAVmhfTRoN3jSy6kbqxVChnuHHnAZ06J4w+rLHCNTO
         rGQf+FrMgCYheKaMohP/TuQj2Kb6tjA/MjkN9jF9L1hUwLWeDUpFWFmKjIBpqDt4uRa1
         rbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713786086; x=1714390886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KGqDQHMjrZlO15Rvq0SOqA/APBPIM6ni8f7xyO7pFgU=;
        b=m6cQ85hg6sqbp4TYn6SvG8bOc1famnX37jlDQJXyowjzaA0OtCvMf+84MLVbxA2C/6
         XnCtgscl8ncCw6QyXGeiJT91UejHL2yhTvmYcBTM7LT9Ice+GERR2dgFyDagBrkiyA55
         3pvqyA9HSjEaOSwdF7BZqlIpb54a3iy9P/uTpaGke5bWGI8kK83zjCnZ0tSOCLZHnjKc
         92gTE51X4WxIBc66KZuBoC6sY9AI8ZCC3rExVRa1eInM8P7ZK2k3GaO9rJDrKJcX3/JJ
         MzPVU6hkr4hANStAORZL6dwQ0UpY4xaWuczLvlbVk/0xGrdTwbNIYIgBf4u+bjrde2dv
         0JFw==
X-Forwarded-Encrypted: i=1; AJvYcCVYDkZq2rAGVzVgg4zRVu3m9v1/98V3KAdcnfEGEng5OSfJBL9/BLiucq5MAHez+V9Zvbmfnuto5AoPy7/Ohh3kCEDdiSev+HU+wBdZbtt/
X-Gm-Message-State: AOJu0Ywh0VWgp6fYncpwlp3CNm5SgunBKohqSIfPkVXIrVVWqkQwpyWo
	oi98mYij+4gDNEPxnDe1CNyRGXFjhMvTx3rPzlouhW/u9HWcbIlCRN436DbZ/DE=
X-Google-Smtp-Source: AGHT+IHTzRl5EROPxdfWdXZvfgKbo2IebGI7y5OdOSFbmkZ4wmW+9Re1DyIi+sB900+gcrU8oHywLQ==
X-Received: by 2002:a05:600c:468f:b0:418:9941:ca28 with SMTP id p15-20020a05600c468f00b004189941ca28mr6743806wmo.2.1713786086657;
        Mon, 22 Apr 2024 04:41:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:9f43:3ca4:162c:d540? ([2a01:e0a:999:a3a0:9f43:3ca4:162c:d540])
        by smtp.gmail.com with ESMTPSA id m25-20020a05600c3b1900b0041816c3049csm16496334wms.11.2024.04.22.04.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 04:41:26 -0700 (PDT)
Message-ID: <7d06aaa0-cafc-4396-b5d9-8b64b6a1e643@rivosinc.com>
Date: Mon, 22 Apr 2024 13:41:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-5-cleger@rivosinc.com>
 <20240419-clinic-amusing-d23b1b6d2af2@spud>
 <6ab9e591-f2f2-4267-8bdd-169ef0243e14@rivosinc.com>
 <20240422-daylight-sassy-ff3b0d867fef@wendy>
 <032530b8-a26e-494f-bd9c-3e1661add5d4@rivosinc.com>
 <20240422-matchbook-unlikable-59987a8d8b1f@wendy>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240422-matchbook-unlikable-59987a8d8b1f@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_044129_087984_8A1C3E7D 
X-CRM114-Status: GOOD (  17.12  )
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

CgpPbiAyMi8wNC8yMDI0IDEzOjM2LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gTW9uLCBBcHIg
MjIsIDIwMjQgYXQgMDE6MTQ6MjZQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBP
biAyMi8wNC8yMDI0IDExOjM1LCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBPbiBNb24sIEFwciAy
MiwgMjAyNCBhdCAxMDo1MzoxMEFNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4+Pj4g
T24gMTkvMDQvMjAyNCAxNzo1MSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+Pj4+PiBPbiBUaHUsIEFw
ciAxOCwgMjAyNCBhdCAwMjo0MjoyN1BNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4+
Pj4+PiBUaGUgWmMqIHN0YW5kYXJkIGV4dGVuc2lvbiBmb3IgY29kZSByZWR1Y3Rpb24gaW50cm9k
dWNlcyBuZXcgZXh0ZW5zaW9ucy4KPj4+Pj4+IFRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciBa
Y2EsIFpjZiwgWmNkIGFuZCBaY2IuIFpjZSwgWmNtdCBhbmQgWmNtcAo+Pj4+Pj4gYXJlIGxlZnQg
b3V0IG9mIHRoaXMgcGF0Y2ggc2luY2UgdGhleSBhcmUgdGFyZ2V0aW5nIG1pY3JvY29udHJvbGxl
cnMvCj4+Pj4+PiBlbWJlZGRlZCBDUFVzIGluc3RlYWQgb2YgYXBwbGljYXRpb24gcHJvY2Vzc29y
cy4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3
Y2FwLmggfCA0ICsrKysKPj4+Pj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCA0
ICsrKysKPj4+Pj4+ICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+Pj4+Pj4KPj4+
Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPj4+Pj4+IGluZGV4IDU0M2UzZWEyZGEwZS4uYjc1NTFi
YWQzNDFiIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
Cj4+Pj4+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPj4+Pj4+IEBAIC04
Miw2ICs4MiwxMCBAQAo+Pj4+Pj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQUNBUwkJNzMKPj4+
Pj4+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWEFOREVTUE1VCQk3NAo+Pj4+Pj4gICNkZWZpbmUg
UklTQ1ZfSVNBX0VYVF9aSU1PUAkJNzUKPj4+Pj4+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkNB
CQk3Ngo+Pj4+Pj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0IJCTc3Cj4+Pj4+PiArI2RlZmlu
ZSBSSVNDVl9JU0FfRVhUX1pDRAkJNzgKPj4+Pj4+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkNG
CQk3OQo+Pj4+Pj4gIAo+Pj4+Pj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcJ
MTI3Cj4+Pj4+PiAgCj4+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4+Pj4+PiBpbmRleCAxMTVi
YTAwMWYxYmMuLjA5ZGVlMDcxMjc0ZCAxMDA2NDQKPj4+Pj4+IC0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL2NwdWZlYXR1cmUuYwo+Pj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVy
ZS5jCj4+Pj4+PiBAQCAtMjYxLDYgKzI2MSwxMCBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4
dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKPj4+Pj4+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEo
emZhLCBSSVNDVl9JU0FfRVhUX1pGQSksCj4+Pj4+PiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpm
aCwgUklTQ1ZfSVNBX0VYVF9aRkgpLAo+Pj4+Pj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Zmht
aW4sIFJJU0NWX0lTQV9FWFRfWkZITUlOKSwKPj4+Pj4+ICsJX19SSVNDVl9JU0FfRVhUX0RBVEEo
emNhLCBSSVNDVl9JU0FfRVhUX1pDQSksCj4+Pj4+PiArCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpj
YiwgUklTQ1ZfSVNBX0VYVF9aQ0IpLAo+Pj4+Pj4gKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y2Qs
IFJJU0NWX0lTQV9FWFRfWkNEKSwKPj4+Pj4+ICsJX19SSVNDVl9JU0FfRVhUX0RBVEEoemNmLCBS
SVNDVl9JU0FfRVhUX1pDRiksCj4+Pj4+PiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpiYSwgUklT
Q1ZfSVNBX0VYVF9aQkEpLAo+Pj4+Pj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YmIsIFJJU0NW
X0lTQV9FWFRfWkJCKSwKPj4+Pj4+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemJjLCBSSVNDVl9J
U0FfRVhUX1pCQyksCj4+Pj4+Cj4+Pj4+IFllLCB0aGlzIGxvb2tzIGV4YWN0bHkgbGlrZSB3aGF0
IEkgImZlYXJlZCIuCj4+Pj4KPj4+PiBPayBidXQgZm9yIGluc3RhbmNlLCBRZW11IGFjdHVhbGx5
IHNldCBaYyogYmFzZWQgb24gQy9GL0QuIFNvIHRoZSBJU0EKPj4+PiBzdHJpbmcgY29udGFpbmlu
ZyB0aGVzZXMgZGVwZW5kZW5jaWVzIHNob3VsZCBhY3R1YWxseSBhbHNvIGJlIGFsbG93ZWQuCj4+
Pj4gU28gc2hvdWxkIHdlIHNpbXBseSBpZ25vcmUgdGhlbSBpbiB0aGUgSVNBIHN0cmluZyBhbmQg
YWx3YXlzIGRvIG91ciBvd24KPj4+PiAicG9zdC1wcm9jZXNzaW5nIiBiYXNlZCBvbiBDL0YvRD8K
Pj4+Cj4+PiBJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhlIGNvbnRlbnRzIG9mIGFsbCBvZiB0aGVz
ZSBleHRlbnNpb25zLCBidXQgSQo+Pj4gYXNzdW1lIHRoZSByZWFzb25pbmcgZm9yIHNwbGl0dGlu
ZyB0aGVtIG91dCBpcyB0aGF0IHlvdSBjYW4gaW1wbGVtZW50Cj4+PiB0aGVtIGJ1dCBub3QgbWF5
YmUgbm90IGltcGxlbWVudCBDIChvciBzb21ldGhpbmcgc2ltaWxhcik/IElmIHRoYXQncyB0aGUK
Pj4+IGNhc2UsIHlvdSBjYW5ub3QgYWx3YXlzIGltcGx5Lgo+Pgo+PiBZZWFoLCB0aGV5IGNhbiBi
ZSBpbXBsZW1lbnRlZCBpbmRlcGVuZGVudGx5IHNvIHdlIG5lZWQgdG8gYmUgYWJsZSB0bwo+PiBw
YXJzZSB0aGVtIGluZGVwZW5kZW50bHkuCj4gCj4+IEhvd2V2ZXIsIHRoZSBrZXJuZWwgY3VycmVu
dGx5IHJlcXVpcmVzIEMKPiAKPiBObyBpdCBkb2Vzbid0IQo+IFRoZXJlJ3MgYSBLY29uZmlnIG9w
dGlvbiB0aGF0IGNvbnRyb2xzIHdoZXRoZXIgb3Igbm90IHdlIGJ1aWxkIHdpdGgKPiBjb21wcmVz
c2VkIGluc3RydWN0aW9ucy4KCkFja2VkLCBtaXNzZWQgdGhhdC4gVGhhdCBpcyB0aGVuIGFkdm9j
YXRpbmcgdG8ga2VlcCBzZXBhcmF0ZSBaYyogZXh0ZW5zaW9ucy4KCj4gCj4+IHNvIHdlCj4+IHNo
b3VsZCBhbHdheXMgaGF2ZSBaY2EvWmNmL1pjZC4gQnV0IGlmIHRoYXQgY2hhbmdlcyBpbiB0aGUg
ZnV0dXJlLCB0aGVuLAo+PiB0aGF0IHdvbid0IGJlIHRydWUgYW55bW9yZS4gQmV0dGVyIGtlZXAg
aXQgZ2VuZXJpYyBwcm9iYWJseQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
