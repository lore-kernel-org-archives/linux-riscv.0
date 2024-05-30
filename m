Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9A1C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 08:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMfJHwT14K8CCyeAygEHlsOeW/kzq3GQL43NMsdK9KI=; b=OrnR6W+JtOBvYZ
	oIiel6NuehxVEOg3dvG/mNxaOZ+WBVKFRG6gCtBUQfZzPXASgxvl+zmuSrr9ihJc9u7avIia596ED
	59SQB8pvy7EudSiI5Czp8YhJLfGCtUF/Za/lmvvraKxigvAepPevrPBQ75rzKY9eZs+/K3FDtzUzx
	3Ow4Cy2odxDnr7Ab6K37n6MRPOst/KLnM5FtyWq3HHN0vnluAlG3WbIihIlBVQbR6epdv66mAqk3H
	39dRqthv92fEb4tWsMcIUmlBwLgGiJ1gRepvEj7rtsB/lJq8/2lJFanb82s+oGdTQl/wwT0xWd70v
	d4tZMS/vJyH2kuxiJK9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCauD-00000006avJ-3h4j;
	Thu, 30 May 2024 08:13:02 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCau6-00000006apO-1XGj
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 08:12:57 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5295f2f6ba2so33116e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 01:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717056762; x=1717661562; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0RoFCn1cKvd1zoXQP5ZuJdh9HnrCwhzMajErjx8js2Q=;
        b=plRV2VV2yIdMJ6Miozmjg7FiEOQwlo6wXwI5iLspssUzZBdm0BfzuS8MLrMv2hh0CP
         GkEjvDQOVxNEL/IgrX9qNwI/9NsGSPgWeoLwW+PIEDnA06tPEEU9yWk5fzHUv3soOJnZ
         NX+ZnKnfeCeorL0V/xStcajBf3Qe+eRrNNboXXjw7rm0qJY9+UZ0i7abovn4seenH0qM
         A0BVcTMobiL4IJ1Hp5mCLZbqBZ+IXKNQE749DkSMMOLilrNixMQp3JzIwTVRRtBsTuoC
         PPwAwEPmLN5MpJsA17w9U3Z/AVZ0zoGm0tuYeUoASHrDjDjhQ/niDGyPE2ZKS7TK+wmQ
         jFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717056762; x=1717661562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0RoFCn1cKvd1zoXQP5ZuJdh9HnrCwhzMajErjx8js2Q=;
        b=BXSkzOTThJv2oQwlyy8IoC9f1T46cQhqDv7EfzvNq3DN2aT1Rbu/DS+VKkF4wUy5OT
         fp7sKJ/mGZD+6OEN9n0xnSrpZc7MiIoxuGf5YHe5MIsAqk09idrrKlyQobo8L22unLhU
         +umRa4KPFSlF4AInhnDIDXW//5VabUjrxxCqiSxpYfKejIw5V2oir0hKbP/dyKtDgpmc
         DKPuLBhmsegMCY9RIRg6hCRdA9J0q1gFLeugA45yGHEKbRBXolEbiCWKIoZFoOk6NqCF
         L8ntXdbnwScgV3qFwZObVfLASQeWmrXBA0LUYtYr1u8pP/GAMKDCxZUmf1Wkwc4g14yD
         mJoA==
X-Forwarded-Encrypted: i=1; AJvYcCVPDoDMcPA01yvelQedN+lxDbfw38aG657XZV8JCaHylL7iodZ+AkAT8ljE89JdlgyO3DrejG9p5RbFgxZajdr2zbzDovt9UgWtGEM89NNe
X-Gm-Message-State: AOJu0YyN8s8zxup12JQdVkLUhDkvGmbvVn9ykUjHRQPR4A9JMnlJx/MC
	jK4KhKvJ6w23CWtrA6df5iPhHxl6dd1tkff/Al1rsj7oQPzJ06kIs2Rgj2Bc5ow=
X-Google-Smtp-Source: AGHT+IFDH/BtR0IqfU1MMNNRmaYz2QjK/JKuYYRlqhpvwnINHfFSvpEeQs/Qm8e5sz1sHPGcXd9sFQ==
X-Received: by 2002:a05:6512:1111:b0:51f:1bf8:3ea9 with SMTP id 2adb3069b0e04-52b7d49951fmr1181406e87.3.1717056761685;
        Thu, 30 May 2024 01:12:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:a3c2:7707:741:7c5c? ([2a01:e0a:999:a3a0:a3c2:7707:741:7c5c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42126fea343sm17505945e9.0.2024.05.30.01.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 01:12:41 -0700 (PDT)
Message-ID: <4d23f17e-cc1e-45e3-9ca2-a884baacf207@rivosinc.com>
Date: Thu, 30 May 2024 10:12:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/16] riscv: add ISA extension parsing for Zimop
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
 Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-3-cleger@rivosinc.com> <ZlenZ+NvXxOxvqEO@ghost>
 <ZleqVUhDW+xgiTwu@ghost>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <ZleqVUhDW+xgiTwu@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_011254_426587_6752CBEE 
X-CRM114-Status: GOOD (  16.11  )
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

CgpPbiAzMC8wNS8yMDI0IDAwOjIxLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gT24gV2VkLCBN
YXkgMjksIDIwMjQgYXQgMDM6MDg6MzlQTSAtMDcwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+
PiBPbiBGcmksIE1heSAxNywgMjAyNCBhdCAwNDo1Mjo0MlBNICswMjAwLCBDbMOpbWVudCBMw6ln
ZXIgd3JvdGU6Cj4+PiBBZGQgcGFyc2luZyBmb3IgWmltb3AgSVNBIGV4dGVuc2lvbiB3aGljaCB3
YXMgcmF0aWZpZWQgaW4gY29tbWl0Cj4+PiA1ODIyMDYxNGE1ZiBvZiB0aGUgcmlzY3YtaXNhLW1h
bnVhbC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZv
c2luYy5jb20+Cj4+PiAtLS0KPj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAx
ICsKPj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAxICsKPj4+ICAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPj4+
IGluZGV4IDFmMmQyNTk5YzY1NS4uYjE4OTZkYWRlNzRjIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2h3Y2FwLmgKPj4+IEBAIC04MCw2ICs4MCw3IEBACj4+PiAgI2RlZmluZSBSSVNDVl9JU0FfRVhU
X1pGQQkJNzEKPj4+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlRTTwkJNzIKPj4+ICAjZGVmaW5l
IFJJU0NWX0lTQV9FWFRfWkFDQVMJCTczCj4+PiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJTU9Q
CQk3NAo+Pgo+PiBTaW5jZSBteSBjaGFuZ2VzIGZvciByZW1vdmluZyB4YW5kZXNwbXUgaGF2ZW4n
dCBsYW5kZWQgaGVyZSB5ZXQgSSB0aGluawo+PiB5b3Ugc2hvdWxkIGtlZXAgUklTQ1ZfSVNBX0VY
VF9YQU5ERVNQTVUgaW4gdGhlIGRpZmYgaGVyZSBhbmQgbWFrZQo+PiBSSVNDVl9JU0FfRVhUX1pJ
TU9QIGhhdmUgYSBrZXkgb2YgNzUuIFBhbG1lciBjYW4gcHJvYmFibHkgcmVzb2x2ZSB0aGUKPj4g
Y29uZmxpY3Rpbmcga2V5cyB3aGVuIHRoZXNlIHR3byBzZXJpZXMgYXJlIG1lcmdlZC4KPj4KPj4g
LSBDaGFybGllCj4gCj4gSSBtaXNzZWQgdGhhdCBvdGhlciBwYXRjaGVzIGluIHRoaXMgc2VyaWVz
IHdlcmUgYmFzZWQgb2ZmIG15Cj4geHRoZWFkdmVjdG9yIGNoYW5nZXMuIEl0J3Mgbm90IGluIHRo
ZSBjb3ZlciBsZXR0ZXIgdGhhdCB0aGVyZSBpcyBhCj4gZGVwZW5kZW5jeSB0aG91Z2guIFdoYXQg
ZG8geW91IG5lZWQgZnJvbSB0aGF0IHNlcmllcyBmb3IgdGhpcyBzZXJpZXMgdG8KPiB3b3JrPwoK
SGV5IENoYXJsaWUsIEknbSBub3QgYmFzZWQgZGlyZWN0bHkgb24gYW55IG9mIHlvdXIgc2VyaWVz
LCBidXQgb24KcmlzY3YvZm9yLW5leHQgd2hpY2ggcHJvYmFibHkgYWxyZWFkeSBjb250YWlucyB5
b3VyIHBhdGNoZXMuCgpDbMOpbWVudAoKPiAKPiAtIENoYXJsaWUKPiAKPj4KPj4+ICAKPj4+ICAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZHCTEyNwo+Pj4gIAo+Pj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2Nw
dWZlYXR1cmUuYwo+Pj4gaW5kZXggMjk5MzMxOGI4ZWEyLi40MWY4YWUyMmU3YTAgMTAwNjQ0Cj4+
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPj4+ICsrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+Pj4gQEAgLTI0MSw2ICsyNDEsNyBAQCBjb25zdCBzdHJ1
Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKPj4+ICAJX19SSVNDVl9J
U0FfRVhUX0RBVEEoemloaW50bnRsLCBSSVNDVl9JU0FfRVhUX1pJSElOVE5UTCksCj4+PiAgCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHppaGludHBhdXNlLCBSSVNDVl9JU0FfRVhUX1pJSElOVFBBVVNF
KSwKPj4+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemlocG0sIFJJU0NWX0lTQV9FWFRfWklIUE0p
LAo+Pj4gKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aW1vcCwgUklTQ1ZfSVNBX0VYVF9aSU1PUCks
Cj4+PiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHphY2FzLCBSSVNDVl9JU0FfRVhUX1pBQ0FTKSwK
Pj4+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemZhLCBSSVNDVl9JU0FfRVhUX1pGQSksCj4+PiAg
CV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpmaCwgUklTQ1ZfSVNBX0VYVF9aRkgpLAo+Pj4gLS0gCj4+
PiAyLjQzLjAKPj4+Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+Pj4gbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
