Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEA0D6ACDF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 14:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pBYGlvMoYmhhn/k3Q4WpSY48DayyMzpuoXUaLD4l5Uk=; b=wDk68l6NXAme82
	bDPUxtLnlDM8G30PSavOty5vmrY2w+fCB0s2uj0o9VKF64pTpGdPskwPuCoYF7VsGBOCzbP6M8cMG
	gzM+xnXVhvVUH1lUOyeoguwWV8x4AY7w+fN1g/4HuJXfBhah4Jj5Ox049TztBgAuCuxX2s5MCMDAs
	vCxkaL5CVeIVnJHt6xcFLc+vU9nCjfz45DmVDlLjjveUXQ/bpwnKKvBU/oxy6VhicdxsBpQmZ8EGY
	LuiXGz3xoyT4aZoMQwYqPx+chhncDspStmn4QfCMbmfNQA/ksR+8qjHe3l5g6QQ2iIj3B34VTnxKB
	dKKTGe/14dtcgtIS1Tgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIsC-0000000DM5C-1c76;
	Wed, 27 Nov 2024 14:18:32 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIs9-0000000DM4p-04X1
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 14:18:30 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-434a1639637so25436765e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 06:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732717107; x=1733321907; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CTHvqJquQDkugGQStOPmvdUb7cxp5w9lqzDRujNjCrY=;
        b=cNPGK4WG1V785iVT8eFuLVvmzwKwQn3xxJ3jGT8+2cQKCmK7Jekljj0blJ1CgMYOE/
         yBAJgt9CsVGQR0hqZbZbTPMG3NSdf93ulLQYxPHUfOKlBlwkHpLoSmvh8OaqX5RE2Lft
         6Zuwe8pYRIZqqxtMNtKExvAw3OzNFaKlPxG6OkS8ZHeT1gMrfhHNXiBJWrCHODp1+WVY
         1oWd0K+/ybxfivo9BlQAa0zvABU52P4HDdGItWVMg3YC5dwCJmgWQ2GswrMQwswoB3vV
         oZSd+J419tka4AVtrCaBo/166GGtBfB+/jtCGStM2REdo1+wyQdHOdT/l7u8AM5WEP9X
         CSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732717107; x=1733321907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CTHvqJquQDkugGQStOPmvdUb7cxp5w9lqzDRujNjCrY=;
        b=mob2VK4A/JztbyLLqdADV5tc9XGwnNUYzzxlZx20pINnev9UJ+G6le5wNL4OSuIH8z
         RaQtlTM+o4splRj0XiMdjI/hghS9yzxugfUFkH8IpRVWIKShHK0llaem/mKzcVrT8ggC
         GyA9U9k5RVxNSoJXTmwbmqqaCBY6mKiMCmt02e/W0Ex4YzF1FhNKYthjo104wIeyDxI7
         rXCdxp1ZGf3N3Ep56sxi+J0sz1IFC4e3Xi/C9cTkoZcRAVePj5QEaMmndgpa3vRCiAZ4
         FAA9f49zrx4HIhYvRMMvDvHBkfp9CojBbMzAzZ7eqRQtYIXwbTTXCGbNe5XEJHEL5gXV
         /ERg==
X-Forwarded-Encrypted: i=1; AJvYcCWOZ5Q3vw6e/Zy2a5pPT0+UgtMW4SSEX/mCOgWIWxU1uWAqcGc5LhUio6185/oZfov0XjjmnXox5BdDww==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn/5fCnYcEKXMQXJ6PYNEu6OUxm+Vi3YV/YXkXYvdXVUwfkFMb
	kiYz5nTzu7hI+swHTRtL8c4GaqrOeQl/XsETnITTGWodhrF5tPOV9pfCEj5cJ0Y=
X-Gm-Gg: ASbGncu1NLC97BKeEv5l0OoztFTjElX4FiR8NnxcZo/uERTnZP1fmMK0nbHfZ1rTlSy
	mAwGAoHNcB7N7wPgoPs/jQXYzuqicAB/JVn6eN5SgIWldVkNeJGb/N2iKEY71Q/WJy3uAnJJ0uD
	XJZI9kNjTHUHQZLgmRvPYzfcQCoOcwdkGts6OKzILg8abScgW61lADOKzuf606B70KQsP++v4Y/
	DHscPXnWIweeaXBEOM9jdbZ8LctLUZmeX7b+NyOdW5lRTEM9quhPUw8+rKMId5QEHwkwBYO/IzC
	ZDy6vDXn5sSBkrBoWP8=
X-Google-Smtp-Source: AGHT+IF1TPsR60czgurK0Oh0ZEUJ56o8Yas+xvOtUbO1mBqDbtgWDtoYJrA43n6OxY5lncVFMEgseQ==
X-Received: by 2002:a05:600c:3b88:b0:434:a765:7f9c with SMTP id 5b1f17b1804b1-434a9db839emr28451645e9.6.1732717106761;
        Wed, 27 Nov 2024 06:18:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7b875bsm22370895e9.16.2024.11.27.06.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 06:18:26 -0800 (PST)
Message-ID: <2a902c69-1115-451d-82b7-dcf7641a7c4b@rivosinc.com>
Date: Wed, 27 Nov 2024 15:18:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: module: use a plain variable for list_head instead
 of a pointer
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Charlie Jenkins <charlie@rivosinc.com>, zhangkai@iscas.ac.cn
References: <20241127103016.2699179-1-cleger@rivosinc.com>
 <20241127-2c074e38cc599c7e2d0da505@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20241127-2c074e38cc599c7e2d0da505@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_061829_264390_5CE68406 
X-CRM114-Status: GOOD (  19.06  )
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

CgpPbiAyNy8xMS8yMDI0IDE1OjAyLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gV2VkLCBOb3Yg
MjcsIDIwMjQgYXQgMTE6MzA6MTRBTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBs
aXN0X2hlYWQgZG9lcyBub3QgbmVlZCB0byBiZSBhbGxvY2F0ZWQsIGl0IGNhbiBiZSBhIHBsYWlu
IHZhcmlhYmxlLgo+IAo+IHJlbF9oZWFkJ3MgbGlzdF9oZWFkIG1lbWJlciwgcmVsX2VudHJ5LCBk
b2Vzbid0IG5lZWQgdG8gYmUgYWxsb2NhdGVkLAo+IGl0cyBzdG9yYWdlIGNhbiBqdXN0IGJlIHBh
cnQgb2YgdGhlIGFsbG9jYXRlZCByZWxfaGVhZC4KPiAKPj4gUmVtb3ZlIHRoZSBwb2ludGVyIHdo
aWNoIGFsbG93cyB0byBnZXQgcmlkIG9mIHRoZSBhbGxvY2F0aW9uIGFzIHdlbGwgYXMKPj4gYW4g
ZXhpc3RpbmcgbWVtb3J5IGxlYWsuCj4gCj4gSXQnZCBiZSBuaWNlIHRvIGFkZCBob3cgdGhlIG1l
bW9yeSBsZWFrIHdhcyBmb3VuZC4gSW5zcGVjdGlvbiBvciBzb21lCj4gdG9vbD8KClllYWggc3Vy
ZSwgaXQgd2FzIGFjdHVhbGx5IGZvdW5kIGJ5IEthaSBaYW5nLCBJIGhhdmUgYWRkZWQgaGltIGFz
IENjIGJ1dApJIGNhbiBzdXJlbHkgZ2l2ZSBoaW0gY3JlZGl0IGZvciBmaW5kaW5nIHRoZSBtZW1s
ZWFrLCBJJ2xsIGFkZCBoaW0gd2l0aAphIFJlcG9ydGVkLWJ5LgoKVGhhbmtzLAoKQ2zDqW1lbnQK
Cj4gCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5j
LmNvbT4KPj4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYyB8IDE4ICsrKyst
LS0tLS0tLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTQgZGVs
ZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jCj4+IGluZGV4IDFjZDQ2MWYzZDg3Mi4uNDdkMGVi
ZWVjOTNjIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYwo+PiArKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYwo+PiBAQCAtMjMsNyArMjMsNyBAQCBzdHJ1Y3Qg
dXNlZF9idWNrZXQgewo+PiAgCj4+ICBzdHJ1Y3QgcmVsb2NhdGlvbl9oZWFkIHsKPj4gIAlzdHJ1
Y3QgaGxpc3Rfbm9kZSBub2RlOwo+PiAtCXN0cnVjdCBsaXN0X2hlYWQgKnJlbF9lbnRyeTsKPj4g
KwlzdHJ1Y3QgbGlzdF9oZWFkIHJlbF9lbnRyeTsKPj4gIAl2b2lkICpsb2NhdGlvbjsKPj4gIH07
Cj4+ICAKPj4gQEAgLTYzNCw3ICs2MzQsNyBAQCBwcm9jZXNzX2FjY3VtdWxhdGVkX3JlbG9jYXRp
b25zKHN0cnVjdCBtb2R1bGUgKm1lLAo+PiAgCQkJbG9jYXRpb24gPSByZWxfaGVhZF9pdGVyLT5s
b2NhdGlvbjsKPj4gIAkJCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShyZWxfZW50cnlfaXRlciwK
Pj4gIAkJCQkJCSByZWxfZW50cnlfaXRlcl90bXAsCj4+IC0JCQkJCQkgcmVsX2hlYWRfaXRlci0+
cmVsX2VudHJ5LAo+PiArCQkJCQkJICZyZWxfaGVhZF9pdGVyLT5yZWxfZW50cnksCj4+ICAJCQkJ
CQkgaGVhZCkgewo+PiAgCQkJCWN1cnJfdHlwZSA9IHJlbF9lbnRyeV9pdGVyLT50eXBlOwo+PiAg
CQkJCXJlbG9jX2hhbmRsZXJzW2N1cnJfdHlwZV0ucmVsb2NfaGFuZGxlcigKPj4gQEAgLTcwNCwx
NiArNzA0LDcgQEAgc3RhdGljIGludCBhZGRfcmVsb2NhdGlvbl90b19hY2N1bXVsYXRlKHN0cnVj
dCBtb2R1bGUgKm1lLCBpbnQgdHlwZSwKPj4gIAkJCXJldHVybiAtRU5PTUVNOwo+PiAgCQl9Cj4+
ICAKPj4gLQkJcmVsX2hlYWQtPnJlbF9lbnRyeSA9Cj4+IC0JCQlrbWFsbG9jKHNpemVvZihzdHJ1
Y3QgbGlzdF9oZWFkKSwgR0ZQX0tFUk5FTCk7Cj4+IC0KPj4gLQkJaWYgKCFyZWxfaGVhZC0+cmVs
X2VudHJ5KSB7Cj4+IC0JCQlrZnJlZShlbnRyeSk7Cj4+IC0JCQlrZnJlZShyZWxfaGVhZCk7Cj4+
IC0JCQlyZXR1cm4gLUVOT01FTTsKPj4gLQkJfQo+PiAtCj4+IC0JCUlOSVRfTElTVF9IRUFEKHJl
bF9oZWFkLT5yZWxfZW50cnkpOwo+PiArCQlJTklUX0xJU1RfSEVBRCgmcmVsX2hlYWQtPnJlbF9l
bnRyeSk7Cj4+ICAJCXJlbF9oZWFkLT5sb2NhdGlvbiA9IGxvY2F0aW9uOwo+PiAgCQlJTklUX0hM
SVNUX05PREUoJnJlbF9oZWFkLT5ub2RlKTsKPj4gIAkJaWYgKCFjdXJyZW50X2hlYWQtPmZpcnN0
KSB7Cj4+IEBAIC03MjIsNyArNzEzLDYgQEAgc3RhdGljIGludCBhZGRfcmVsb2NhdGlvbl90b19h
Y2N1bXVsYXRlKHN0cnVjdCBtb2R1bGUgKm1lLCBpbnQgdHlwZSwKPj4gIAo+PiAgCQkJaWYgKCFi
dWNrZXQpIHsKPj4gIAkJCQlrZnJlZShlbnRyeSk7Cj4+IC0JCQkJa2ZyZWUocmVsX2hlYWQtPnJl
bF9lbnRyeSk7Cj4+ICAJCQkJa2ZyZWUocmVsX2hlYWQpOwo+PiAgCQkJCXJldHVybiAtRU5PTUVN
Owo+PiAgCQkJfQo+PiBAQCAtNzM1LDcgKzcyNSw3IEBAIHN0YXRpYyBpbnQgYWRkX3JlbG9jYXRp
b25fdG9fYWNjdW11bGF0ZShzdHJ1Y3QgbW9kdWxlICptZSwgaW50IHR5cGUsCj4+ICAJfQo+PiAg
Cj4+ICAJLyogQWRkIHJlbG9jYXRpb24gdG8gaGVhZCBvZiBkaXNjb3ZlcmVkIHJlbF9oZWFkICov
Cj4+IC0JbGlzdF9hZGRfdGFpbCgmZW50cnktPmhlYWQsIHJlbF9oZWFkLT5yZWxfZW50cnkpOwo+
PiArCWxpc3RfYWRkX3RhaWwoJmVudHJ5LT5oZWFkLCAmcmVsX2hlYWQtPnJlbF9lbnRyeSk7Cj4+
ICAKPj4gIAlyZXR1cm4gMDsKPj4gIH0KPj4gLS0gCj4+IDIuNDUuMgo+Pgo+Pgo+IAo+IE90aGVy
IHRoYW4gdGhlIGNvbW1pdCBtZXNzYWdlIGNoYW5nZSBzdWdnZXN0aW9ucywKPiAKPiBSZXZpZXdl
ZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
