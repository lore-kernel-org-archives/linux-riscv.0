Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D05C28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 08:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IMyL61tRH/sPt8x5H1L5BpgEoUzbwLAdcoUYGmxGmDc=; b=Y/RvXlQWCTmIZF
	2b7RrbgcKQr+k8BUgspRe4Wo0qcvNrOcaflXcndhoA+V4nFLtFoc2ypGtOqPE5LrmgEUxHOBCYhS1
	RJ+apN2tbMMj1txXfRjiGS3zOkdkWDnpFPatRxDZe6wgXToaRmPB8OVCMa9B8dSHfn7H7XaNYZiXp
	oBzxCo5knkAVpB2Fr+quafQ4YoQjjZoxDwkT4xWvO1RS2IwFiAm7bRkfDbr9/pogtMxtVph1aHgQ8
	X/WVIDqs+Jy8bfqIbJO1/deLiPuQ2vn+93nxI45Wlx4iKIT5BaDtiYR/AiogbeJ+DJevVs+CjM8rM
	M0lWfVc9Z3an4Hl80VWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvB7C-0000000BVFi-0V0Y;
	Thu, 20 Mar 2025 08:18:58 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvB4U-0000000BUtT-1YIX
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 08:16:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso2357415e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 01:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742458569; x=1743063369; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E1X6HiCNhqQpbU8h+HCa0tdn7ioFvop7dl7Gz/vECDs=;
        b=0qVD3VUpVWC6oWywQEL34tnyEknwPh1Dl0n77na1kvlID/bw/LeQSAIvIj/vQVYzCZ
         GIPAozVOH1VTX1OjWw554Jn8bjh/o8+ucQ9MBKGEED25lo2PGvTnZ79a7QTPcAVd+/Dt
         0arVsouROFHx2IlinpDWMe92vKOsd7K/LDclyQGC5i1jQroOrcJlqOI3Oa1EqBsISpH6
         E83+bLr/wzngrMF4ktxAUXgF7L/iYFhFbcg1cl1mLJYYA6+eeEzVNfFrSIbKl9wwjRoI
         kEXGSu7JxL1kknxKSQspMrs74WAIx9MCVfIwdQrQ+8xhBC0q6QV8vH10W2AsEzPynHpu
         5eEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458569; x=1743063369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1X6HiCNhqQpbU8h+HCa0tdn7ioFvop7dl7Gz/vECDs=;
        b=QZJmnzXPBZoZVDCE9f7oX+2V393epEGdVzF98umMwHPWoX301n8XO2AJDZczJBq4j3
         irCynpo5ITVR6qedaE5XEViROuim/+yOcZjT3ZjQmXr5ATvbjybxZtRhDnODdckTN7Hh
         w2aLAAcKk+fbyQI6spSPggY7Tpay4aafq4NN8hq2Zc1Fn0aL6d2gyMoO0295yqA9UGRK
         tJKgF3++zY3CyZmHuI47zMe7oHZJRojZsZaTJGatfK6M0iGYpqEC2evQ+Jf7MXfNhRFU
         KpqhnIrjDEUhc613+hviGV2ZcCdjTBDdUVFYQ4OdepNHwn5M2G/x4tGO8QyRS2aiwnq2
         sUsA==
X-Forwarded-Encrypted: i=1; AJvYcCXdpy9hROlfYo5ajKWjp9mpihy/K75XQC66p6WoUP8Ed6FvBRzhaWV4w8ND0ypJWSyq0yBn1udnX8lZuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVXGG0M/CaW78sN0I5Aby8J+WqwbFKNwlsIjZSD8/Gms9rmR6X
	m83nmpBvHd3H47yuXJ39NGK1BoaVsIIqWn1Hc0g0tD+wM71bZEO2aE3eiUl65aI=
X-Gm-Gg: ASbGncsc13Fma30/KqWVPzYMmlRA33nOdTh6H8KOEPHDi3eUA7Ea8lsr6dWIG0/tRHi
	i14Sp1r657bdmMkSwoikw1BlBHl7mw1z7ecQN2fnb6hXlQpXCgfJFQPAmL/W+zfk6sISk56IjaG
	bX8RmWxqg47HLyYnpImwlifWdAg0popqqfAp4sG37Ea0CcsUMbikg8HD70tVPchGd2qSdto4fCo
	vM4I5dSE64TSoh+eJFx56rUjj5pBzHILA4e0jzwsPpQd+kxsCpom7GwPurWV6wbmGGnMMS1oWJw
	K++qsGxsRYPCIdClGjunTh9ldPfvnNiO1kqNq2pdekXEePPFn3prZvwKjNKB6kHyCKk/ZszDlxT
	ehm21HdWvMxEiYGMOSH2lUhGI
X-Google-Smtp-Source: AGHT+IHYWdVATok5OeQt7CfFPf3qhSrzissvd7+Tw9VxEB8HsbKeIOWAY9VTxxUIqbY9hRBee5DGgw==
X-Received: by 2002:a05:600c:1e0b:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-43d437a9655mr50996955e9.13.1742458568551;
        Thu, 20 Mar 2025 01:16:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39973c9d93bsm4176927f8f.65.2025.03.20.01.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 01:16:08 -0700 (PDT)
Message-ID: <b3fbd730-295f-4491-b0d6-d4e258941ae5@rivosinc.com>
Date: Thu, 20 Mar 2025 09:16:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] riscv: add support for SBI Supervisor Software
 Events extension
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>
References: <20241206163102.843505-1-cleger@rivosinc.com>
 <20241206163102.843505-3-cleger@rivosinc.com>
 <20250319-46b625cf8b771616d4c7c053@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250319-46b625cf8b771616d4c7c053@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_011610_401154_AD3BC918 
X-CRM114-Status: GOOD (  21.62  )
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

CgpPbiAxOS8wMy8yMDI1IDE4OjA4LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gRnJpLCBEZWMg
MDYsIDIwMjQgYXQgMDU6MzA6NThQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IC4u
Lgo+PiAraW50IGFyY2hfc3NlX2luaXRfZXZlbnQoc3RydWN0IHNzZV9ldmVudF9hcmNoX2RhdGEg
KmFyY2hfZXZ0LCB1MzIgZXZ0X2lkLCBpbnQgY3B1KQo+PiArewo+PiArCXZvaWQgKnN0YWNrOwo+
PiArCj4+ICsJYXJjaF9ldnQtPmV2dF9pZCA9IGV2dF9pZDsKPj4gKwlzdGFjayA9IHNzZV9zdGFj
a19hbGxvYyhjcHUsIFNTRV9TVEFDS19TSVpFKTsKPj4gKwlpZiAoIXN0YWNrKQo+PiArCQlyZXR1
cm4gLUVOT01FTTsKPj4gKwo+PiArCWFyY2hfZXZ0LT5zdGFjayA9IHN0YWNrICsgU1NFX1NUQUNL
X1NJWkU7Cj4+ICsKPj4gKwlpZiAoc3NlX2luaXRfc2NzKGNwdSwgYXJjaF9ldnQpKQo+PiArCQln
b3RvIGZyZWVfc3RhY2s7Cj4+ICsKPj4gKwlpZiAoaXNfa2VybmVsX3BlcmNwdV9hZGRyZXNzKCh1
bnNpZ25lZCBsb25nKSZhcmNoX2V2dC0+aW50ZXJydXB0ZWQpKSB7Cj4+ICsJCWFyY2hfZXZ0LT5p
bnRlcnJ1cHRlZF9zdGF0ZV9waHlzID0KPj4gKwkJCQlwZXJfY3B1X3B0cl90b19waHlzKCZhcmNo
X2V2dC0+aW50ZXJydXB0ZWQpOwo+PiArCX0gZWxzZSB7Cj4+ICsJCWFyY2hfZXZ0LT5pbnRlcnJ1
cHRlZF9zdGF0ZV9waHlzID0KPj4gKwkJCQl2aXJ0X3RvX3BoeXMoJmFyY2hfZXZ0LT5pbnRlcnJ1
cHRlZCk7Cj4+ICsJfQo+PiArCj4+ICsJcmV0dXJuIDA7Cj4gCj4gSGkgQ2zDqW1lbnQsCj4gCj4g
VGVzdGluZyBTU0Ugc3VwcG9ydCB3aXRoIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNj
di9zYmlfcG11X3Rlc3QKPiBsZWQgdG8gYW4gb3BlbnNiaSBzYmlfdHJhcF9lcnJvciBiZWNhdXNl
IHRoZSBvdXRwdXRfcGh5c19sbyBhZGRyZXNzIHBhc3NlZAo+IHRvIHNiaV9zc2VfcmVhZF9hdHRy
cygpIHdhc24ndCBhIHBoeXNpY2FsIGFkZHJlc3MuIFRoZSByZWFzb24gaXMgdGhhdAo+IGlzX2tl
cm5lbF9wZXJjcHVfYWRkcmVzcygpIGNhbiBvbmx5IGJlIHVzZWQgb24gc3RhdGljIHBlcmNwdSBh
ZGRyZXNzZXMsCj4gYnV0IGxvY2FsIHNzZSBldmVudHMgZ2V0IHRoZWlyIHBlcmNwdSBhZGRyZXNz
ZXMgd2l0aCBhbGxvY19wZXJjcHUoKSwgc28KPiBpc19rZXJuZWxfcGVyY3B1X2FkZHJlc3MoKSB3
YXMgcmV0dXJuaW5nIGZhbHNlIGV2ZW4gZm9yIGxvY2FsIGV2ZW50cy4gSQo+IG1hZGUgdGhlIGZv
bGxvd2luZyBjaGFuZ2VzIHRvIGdldCB0aGluZ3Mgd29ya2luZy4KCkhpIEFuZHJldywKCkRpZCBz
b21ldGhpbmcgY2hhbmdlZCByZWNlbnRseSA/IEJlY2F1c2UgSSB0ZXN0ZWQgdGhhdCB3aGVuIGl0
IHdhcyBzZW5kCihQTVUgKyBzb21lIGtlcm5lbCBpbnRlcm5hbCB0ZXN0c3VpdGUpIGFuZCBkaWRu
J3Qgc2F3IHRoYXQuIEFueXdheSwgSSdsbApyZXNwaW4gaXQgd2l0aCB5b3VyIGNoYW5nZXMgYXMg
d2VsbC4KClRoYW5rcyAhCgpDbMOpbWVudAoKPiAKPiBUaGFua3MsCj4gZHJldwo+IAo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zc2UuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NzZS5j
Cj4gaW5kZXggYjQ4YWU2OWRhZDhkLi5mNDY4OTM5NDYwODYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvc3NlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zc2UuYwo+IEBAIC0x
MDAsMTIgKzEwMCwxMiBAQCBpbnQgYXJjaF9zc2VfaW5pdF9ldmVudChzdHJ1Y3Qgc3NlX2V2ZW50
X2FyY2hfZGF0YSAqYXJjaF9ldnQsIHUzMiBldnRfaWQsIGludCBjcAo+ICAgICAgICAgaWYgKHNz
ZV9pbml0X3NjcyhjcHUsIGFyY2hfZXZ0KSkKPiAgICAgICAgICAgICAgICAgZ290byBmcmVlX3N0
YWNrOwo+IAo+IC0gICAgICAgaWYgKGlzX2tlcm5lbF9wZXJjcHVfYWRkcmVzcygodW5zaWduZWQg
bG9uZykmYXJjaF9ldnQtPmludGVycnVwdGVkKSkgewo+ICsgICAgICAgaWYgKHNzZV9ldmVudF9p
c19nbG9iYWwoZXZ0X2lkKSkgewo+ICAgICAgICAgICAgICAgICBhcmNoX2V2dC0+aW50ZXJydXB0
ZWRfc3RhdGVfcGh5cyA9Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwZXJfY3B1
X3B0cl90b19waHlzKCZhcmNoX2V2dC0+aW50ZXJydXB0ZWQpOwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdmlydF90b19waHlzKCZhcmNoX2V2dC0+aW50ZXJydXB0ZWQpOwo+ICAg
ICAgICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgYXJjaF9ldnQtPmludGVycnVwdGVkX3N0
YXRlX3BoeXMgPQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmlydF90b19waHlz
KCZhcmNoX2V2dC0+aW50ZXJydXB0ZWQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGVyX2NwdV9wdHJfdG9fcGh5cygmYXJjaF9ldnQtPmludGVycnVwdGVkKTsKPiAgICAgICAg
IH0KPiAKPiAgICAgICAgIHJldHVybiAwOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13YXJl
L3Jpc2N2L3Jpc2N2X3NzZS5jIGIvZHJpdmVycy9maXJtd2FyZS9yaXNjdi9yaXNjdl9zc2UuYwo+
IGluZGV4IDUxMWRiOWFkN2E5ZS4uZmVmMzc1MDQ2Zjc1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
ZmlybXdhcmUvcmlzY3YvcmlzY3Zfc3NlLmMKPiArKysgYi9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2
L3Jpc2N2X3NzZS5jCj4gQEAgLTYyLDExICs2Miw2IEBAIHZvaWQgc3NlX2hhbmRsZV9ldmVudChz
dHJ1Y3Qgc3NlX2V2ZW50X2FyY2hfZGF0YSAqYXJjaF9ldmVudCwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICByZXQpOwo+ICB9Cj4gCj4gLXN0YXRpYyBib29sIHNzZV9ldmVudF9pc19nbG9iYWwo
dTMyIGV2dCkKPiAtewo+IC0gICAgICAgcmV0dXJuICEhKGV2dCAmIFNCSV9TU0VfRVZFTlRfR0xP
QkFMKTsKPiAtfQo+IC0KPiAgc3RhdGljCj4gIHN0cnVjdCBzc2VfZXZlbnQgKnNzZV9ldmVudF9n
ZXQodTMyIGV2dCkKPiAgewo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3Jpc2N2X3NzZS5o
IGIvaW5jbHVkZS9saW51eC9yaXNjdl9zc2UuaAo+IGluZGV4IDE2NzAwNjc3ZjFlOC4uMDZiNzU3
YjAzNmIwIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvcmlzY3Zfc3NlLmgKPiArKysgYi9p
bmNsdWRlL2xpbnV4L3Jpc2N2X3NzZS5oCj4gQEAgLTgsNiArOCw3IEBACj4gCj4gICNpbmNsdWRl
IDxsaW51eC90eXBlcy5oPgo+ICAjaW5jbHVkZSA8bGludXgvbGlua2FnZS5oPgo+ICsjaW5jbHVk
ZSA8YXNtL3NiaS5oPgo+IAo+ICBzdHJ1Y3Qgc3NlX2V2ZW50Owo+ICBzdHJ1Y3QgcHRfcmVnczsK
PiBAQCAtMTYsNiArMTcsMTEgQEAgc3RydWN0IGdoZXM7Cj4gCj4gIHR5cGVkZWYgaW50IChzc2Vf
ZXZlbnRfaGFuZGxlcikodTMyIGV2ZW50X251bSwgdm9pZCAqYXJnLCBzdHJ1Y3QgcHRfcmVncyAq
cmVncyk7Cj4gCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBzc2VfZXZlbnRfaXNfZ2xvYmFsKHUzMiBl
dnQpCj4gK3sKPiArICAgICAgIHJldHVybiAhIShldnQgJiBTQklfU1NFX0VWRU5UX0dMT0JBTCk7
Cj4gK30KPiArCj4gICNpZmRlZiBDT05GSUdfUklTQ1ZfU1NFCj4gCj4gIHN0cnVjdCBzc2VfZXZl
bnQgKnNzZV9ldmVudF9yZWdpc3Rlcih1MzIgZXZlbnRfbnVtLCB1MzIgcHJpb3JpdHksCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
