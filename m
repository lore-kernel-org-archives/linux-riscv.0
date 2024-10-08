Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC732CEFC53
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 20:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmTB062GTmh0mu0nstA/m7tmpd9WfM41R5qd6pLdNlo=; b=cGMgMdg4WxX9Gw
	aOGQW+jezX27WpLgwaOSruBU5qgaoqGs2kLMqyrK95pj5DOo5VW/E7OBcCATc06fqiQsHJORlW9VI
	gMrKPA0a8SjcRjWO/8y7CGQbVoZkQ2b+INJ6O6QFT3Kmh62Xni9qjhQvMxExx8nXPoixUUItw4Hqa
	tTDCIHILtD48hUkSSIJjSjY/3gOzb5y5NueYzfSq2N3kfQKnGKxeQ5GKtCVo4xzwcpyR4su8iLfj6
	5HGIAb3nof9kNFaIwDNkS1uZGmE/k9DQrvcuT7BLB45BrEUdRqkBD9KK43LwPPFSxRazU/m2xoufW
	Xw7paZPUBs5frPSyoliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syGW4-0000000718T-1LV1;
	Tue, 08 Oct 2024 20:09:08 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syGW0-00000007180-2ldE
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 20:09:06 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-82ce1cd202cso263723739f.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 13:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728418143; x=1729022943; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9huRF/wNisHHqCSWMJS/4iRoGweiDoPtDUbse6lb6K4=;
        b=CT2Sc9hJ6MzrPckB6bux+aykNI109gV+dvCC8pJyopcBUDL+Xorv0TDn2oWBANIDan
         I+7RLEtyHLrfuzCD0HziNxi5fvDZrdONOVyfPdAP3LBS2PFizgLqmbKpIG5RSloveZOp
         dq6effJG2cPTYwKf7ZPcTe3o+eLmEFNW4UaUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728418143; x=1729022943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9huRF/wNisHHqCSWMJS/4iRoGweiDoPtDUbse6lb6K4=;
        b=YxTQgnby6IjmsmuULtRI57sN3bmTWqgz4mn0fq6VIDV5C3iroA29Gbbv8L0ETiep7B
         ibYXmSsTkO4gqR7YMmsAIgLZu2SmkRaBIWI8fxkediInMSeaZdfoosu4tg6gaBDwUbbD
         d/8UDrdns+8+Tvfa4VSyLrz6kHprqex9sgwxgJlqP0UbsXXgiQE4bYfsppCg5NzO3C7B
         qD+IvBWaWQVS79SomQcCFTWlYpdSLEaTIzKBvWcg0BJx9fpfG8ptYWwU7sgQlbDxPyE8
         vk8zTk4qUsOMfO1TLCxfi2LvS9ih560R+a2a6sIdnZojiR/YSXKp3wK1Ns/lfbK7kIpz
         EpdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC6p8vS85CL8VCF1y/Y3fsq5U1y+SFAOBPXiK+LnBN/mkRPwpgaZtvxLU+UB/s/4HhXVAgZVfOBFhiQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ4wasODfYpnjCl9iRWfy4Mt4MQtlsFplbmHzJ8JdaPxNRH+ah
	Qod6DNr1+YRV5mFKlcjrK7FmXuU/e+e0sdnhspp8X1mR8S3jwL7tDVn8U0gYo1U=
X-Google-Smtp-Source: AGHT+IGHl7cgy6p1Go9Zcy53EN9p/6bAdeTKO57a6EqLNuq/Hk7nBTr1o35VUqdXGpWut7AJPDr5dw==
X-Received: by 2002:a05:6602:2b87:b0:82a:2a0b:1c7d with SMTP id ca18e2360f4ac-8353d484d1emr23105639f.5.1728418142626;
        Tue, 08 Oct 2024 13:09:02 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4db83190a9asm1220476173.91.2024.10.08.13.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 13:09:02 -0700 (PDT)
Message-ID: <efee099b-f478-4bfb-8c6c-90934934477e@linuxfoundation.org>
Date: Tue, 8 Oct 2024 14:09:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] selftests: sched_ext: Add sched_ext as proper selftest
 target
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 Anders Roxell <anders.roxell@linaro.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241008153519.1270862-1-bjorn@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241008153519.1270862-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_130904_834063_B63691CA 
X-CRM114-Status: GOOD (  14.24  )
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

T24gMTAvOC8yNCAwOTozNSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2
cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gCj4gVGhlIHNjaGVkX2V4dCBzZWxmdGVzdHMgaXMg
bWlzc2luZyBwcm9wZXIgY3Jvc3MtY29tcGlsYXRpb24gc3VwcG9ydCwgYQo+IHByb3BlciB0YXJn
ZXQgZW50cnksIGFuZCBvdXQtb2YtdHJlZSBidWlsZCBzdXBwb3J0Lgo+IAo+IFdoZW4gYnVpbGRp
bmcgdGhlIGtzZWxmdGVzdCBzdWl0ZSwgZS5nLjoKPiAKPiAgICBtYWtlIEFSQ0g9cmlzY3YgQ1JP
U1NfQ09NUElMRT1yaXNjdjY0LWxpbnV4LWdudS0gIFwKPiAgICAgIFRBUkdFVFM9c2NoZWRfZXh0
IFNLSVBfVEFSR0VUUz0iIiBPPS9vdXRwdXQvZm9vIFwKPiAgICAgIC1DIHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzIGluc3RhbGwKPiAKPiBvcjoKPiAKPiAgICBtYWtlIEFSQ0g9YXJtNjQgTExWTT0x
IFRBUkdFVFM9c2NoZWRfZXh0IFNLSVBfVEFSR0VUUz0iIiBcCj4gICAgICBPPS9vdXRwdXQvZm9v
IC1DIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzIGluc3RhbGwKPiAKPiBUaGUgZXhwZWN0YXRpb24g
aXMgdGhhdCB0aGUgc2NoZWRfZXh0IGlzIGluY2x1ZGVkLCBjcm9zcy1idWlsdCwgdGhlCj4gY29y
cmVjdCB0b29sY2hhaW4gaXMgcGlja2VkIHVwLCBhbmQgcGxhY2VkIGludG8gL291dHB1dC9mb28u
Cj4gCj4gSW4gY29udHJhc3QgdG8gdGhlIEJQRiBzZWxmdGVzdHMsIHRoZSBzY2hlZF9leHQgc3Vp
dGUgZG9lcyBub3QgdXNlCj4gYnBmdG9vbCBhdCB0ZXN0IHJ1bi10aW1lLCBzbyBpdCBpcyBzdWZm
aWNpZW50IHRvIGJ1aWxkIGJwZnRvb2wgZm9yIHRoZQo+IGJ1aWxkIGhvc3Qgb25seS4KPiAKPiBB
ZGQgQVJDSCwgQ1JPU1NfQ09NUElMRSwgT1VUUFVULCBhbmQgVEFSR0VUUyBzdXBwb3J0IHRvIHRo
ZSBzY2hlZF9leHQKPiBzZWxmdGVzdC4gQWxzbywgcmVtb3ZlIHNvbWUgdmFyaWFibGVzIHRoYXQg
d2VyZSB1bnVzZWQgYnkgdGhlCj4gTWFrZWZpbGUuCgpUaGFuayB5b3UgZm9yIGFkZGluZyB0aGlz
IHRvIGNoYW5nZSBsb2cuCk1heWJlIHdlIG5lZWQgdG8gYWRkIHRoaXMgdG8ga3NlbGZ0ZXN0LnJz
dCBhdCBzb21lIHBvaW50LgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9y
bkByaXZvc2luYy5jb20+Cj4gLS0tCj4gdjM6ICogQWx3YXlzIGJ1aWxkIGEgYnVpbGQgaG9zdCB2
ZXJzaW9uIG9mIGJwZnRvb2wgKE1hcmspCj4gICAgICAqIE1ha2Ugc3VyZSBMTFZNIHN0eWxlICJB
UkNIIG9ubHkiIGNyb3NzLWJ1aWxkIHdvcmtzIChNYXJrKQo+ICAgICAgCj4gdjI6ICogUmVtb3Zl
ZCB0aGUgZHVwbGljYXRlZCBMTFZNIHByZWZpeCBwYXJzaW5nIChEYXZpZCkKPiAgICAgICogTWFk
ZSBzdXJlIG1ha2UgY2xlYW4gZGlkbid0IGRvIGEgY29tcGxldGUgbWVzcyAoRGF2aWQpCj4gICAg
ICAqIEFkZGVkIHNjaGVkX2V4dCB0byBkZWZhdWx0IHNraXAgKFNodWFoKQoKVGhhbmsgeW91LgoK
UmV2aWV3ZWQtYnk6IFNodWFoIEtoYW4gPHNraGFuQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cgp0aGFu
a3MsCi0tIFNodWFoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
