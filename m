Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E53BCCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 06:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6jE6psnvWTZcrmpIqZO6zP3sL8NTDTbU0xSCkhPRe4=; b=XjzWh8F4Mx8zgo
	3xpKujSbFCWZ5YCA9/JE17joDIISjffTDPOiKM8+0BXSoHOQJTCW4T6EK49pk33PGQ28VIXg5FftU
	PGKopCjdH+C5z9MS0kIvhAesKtwAVlzPO45+G7BRN0WqJ3KJs0GuHyQ/QFvi3jnol9dANNgTCoLJA
	9wJ3/tEpyLwDvn0UoPQB685xdXdYrsnaSp0+hhSrCa3FT+7mwj1A6ZYsXybhqZK8a6YolYT53ivBT
	bl4/a4JkjSj0HtMD0Ei/eUSGHi+9ucOOSB0VcIRlkHCHncGuqawwCqJQKM4mR2OudV7VgwRBbtr6e
	UuzpkPkxb0n0c7xxz7Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8CQe-0000000CR04-49FD;
	Mon, 13 Oct 2025 06:53:09 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8CQb-0000000CQya-3Ds1
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 06:53:08 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46e4f2696bdso40020025e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Oct 2025 23:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760338383; x=1760943183; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbH3h4P4XxNpCmGDtdwz6GDKeAh4p4S3SJJjZvahGmI=;
        b=NwgakJIP+40pc85j4PuP5r6md79u+xaC7rg0W1YYlI6PfIIhBnfeHvafvxwYqGRIbK
         JCNrfoGDM/tPibgKhiI2xs9W/zjjFbv98ti/AoP/+uI3blux6cX4kZy49I2E0s9LaMKG
         p0zpv49ohktHihrV9mEQMJEwLM2mFTT6Qi9Dz5FFYClnJES0TzbHUpiUJ6hzDOFVSWPs
         txF0JqiTxXZF+AzawGbLzjsauXJdino+xvRj6gc+wXldvgJF8EK0CYgR+NwIsEMorsLk
         91roqU+jT2hXp8SkOfMhRSz5LHpOyeNpT5Om/yCuvemUVW1iUoeXJaqc1NbaZAQev+Jn
         3Vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760338383; x=1760943183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbH3h4P4XxNpCmGDtdwz6GDKeAh4p4S3SJJjZvahGmI=;
        b=EWo1L1I0+lpdU61H38ARrA64Ml5LSQbrmWcV5TlQnZg97zmabjInztTZ6Rli/g33cS
         DeRyjOizNSBtfjQADFsMsRCCGs3KXMNtp4OwlKYuCQ5KUpaaSC7ZbnqVSdrztExg0v6l
         yGKxfurEGXcQTno+30VJFBWSGrsz4QG/i3BEX0ioPBy9VNhGC0DT79O3oqYSEFHfqCUc
         i368tLGsrv8hTcPc0IsvNMgGKMgP5iPsZ+txyctjem8k7oPDNd8wxiQxPMp4WkDtL9/G
         6q822KL+0z8ZrEyCOt1TZca8jjkocJtRLL/u3msIRNujlZvEt/8MLU/kSIk1GXgs+XDP
         fsOg==
X-Forwarded-Encrypted: i=1; AJvYcCVdFjt2TbxhuuJZqb8pQB3RYH3HdGUXajR3dIzGC8iK5ZgSO7RR331JSkyfAOVRoY99rHjPUuNuF5TwlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuJHnUSBL3h5k/wuqkSINsTim/arf3kQLNFI/W/c0ly79FifDd
	SiKAqSKwf4TebjA29JQu+6GCKXFe+GQrz31RqoIiXQTnKiKrw7OBDBHlDW604tg+Bac=
X-Gm-Gg: ASbGncuMJIgJRFxEKDzx0M3kEckc7p8J+WQM0IxHWDwfxcMb8mSAtKF+J7Gam/lDG8H
	GxF8qzu49neuLQrgIB0A6LZ2ZW16Joksas53dml8qXA7+MmrSdOKVMoIeqvb8o4sDUPAEbdqTLc
	42x3VsK+4KnpGvD7Pv3aRz69Eh4SdMIs6uNpZ01SXEoISUl1UuM/NSMnOgAlEILfFNQzEPMIp/+
	AoYyodWY2wrWr8iHkXKXBe0bR153wmHMMz+kjSAUtbD3Haz4ZlpBSHxmcNJDTs8HSsxwkCa1NhN
	Rxc3tfPPmMSbWylFhpi5uY9x4oT+8tAwO1vlvkZpKv3krpYYE3Mx4kQS52/XKbnb4SSO0jaaioZ
	A1nzjXIG/hpVmYHhTf2D7D8RdUmnyh2SbpzppQpE41v80mzNs1sz/sa97wrp3JRetRPp7J+gUhF
	f9u8rbVTWVAQ==
X-Google-Smtp-Source: AGHT+IHS+mxS8XXsx5JY+2orAFN0Rw3+Bxz5ihy+z4tH7rBV7ImQGUUGN7GgYYiyXdTqtgFgFgyyAw==
X-Received: by 2002:a05:600c:1d1b:b0:46f:b32e:4f3e with SMTP id 5b1f17b1804b1-46fb32e4fa5mr108548385e9.37.1760338383336;
        Sun, 12 Oct 2025 23:53:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce589a21sm17022180f8f.23.2025.10.12.23.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Oct 2025 23:53:02 -0700 (PDT)
Message-ID: <628d357c-f462-4dc8-92f2-99006b73e0c7@rivosinc.com>
Date: Mon, 13 Oct 2025 08:53:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] riscv: add support for SBI Supervisor Software
 Events
To: Paul Walmsley <pjw@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Yunhui Cui <cuiyunhui@bytedance.com>
References: <20250908181717.1997461-1-cleger@rivosinc.com>
 <86817f9a-c601-81e8-b95b-0f2396275f95@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <86817f9a-c601-81e8-b95b-0f2396275f95@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_235305_892281_31366516 
X-CRM114-Status: GOOD (  32.08  )
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

SGkgUGF1bCwKClRoYW5rcyBmb3IgY2FyaW5nIGFib3V0IHRoaXMgc2VyaWVzIDspCgpPbiAxMC8x
MC8yMDI1IDAzOjMyLCBQYXVsIFdhbG1zbGV5IHdyb3RlOgo+IEhpIENsw6ltZW50LCAKPiAKPiBP
biBNb24sIDggU2VwIDIwMjUsIENsw6ltZW50IEzDqWdlciB3cm90ZToKPiAKPj4gVGhlIFNCSSBT
dXBlcnZpc29yIFNvZnR3YXJlIEV2ZW50cyAoU1NFKSBleHRlbnNpb25zIHByb3ZpZGVzIGEgbWVj
aGFuaXNtCj4+IHRvIGluamVjdCBzb2Z0d2FyZSBldmVudHMgZnJvbSBhbiBTQkkgaW1wbGVtZW50
YXRpb24gdG8gc3VwZXJ2aXNvcgo+PiBzb2Z0d2FyZSBzdWNoIHRoYXQgaXQgcHJlZW1wdHMgYWxs
IG90aGVyIHN1cGVydmlzb3IgbGV2ZWwgdHJhcHMgYW5kCj4+IGludGVycnVwdHMuIFRoaXMgZXh0
ZW5zaW9uIGlzIGludHJvZHVjZWQgYnkgdGhlIFNCSSB2My4wIHNwZWNpZmljYXRpb25bMV0uCj4+
Cj4+IFZhcmlvdXMgZXZlbnRzIGFyZSBkZWZpbmVkIGFuZCBjYW4gYmUgc2VuZCBhc3luY2hyb25v
dXNseSB0byBzdXBlcnZpc29yCj4+IHNvZnR3YXJlIChSQVMsIFBNVSwgREVCVUcsIEFzeW5jaHJv
bm91cyBwYWdlIGZhdWx0KSBmcm9tIFNCSSBhcyB3ZWxsCj4+IGFzIHBsYXRmb3JtIHNwZWNpZmlj
IGV2ZW50cy4gRXZlbnRzIGNhbiBiZSBlaXRoZXIgbG9jYWwgKHBlci1oYXJ0KSBvcgo+PiBnbG9i
YWwuIEV2ZW50cyBjYW4gYmUgbmVzdGVkIG9uIHRvcCBvZiBlYWNoIG90aGVyIGJhc2VkIG9uIHBy
aW9yaXR5IGFuZAo+PiBjYW4gaW50ZXJydXB0IHRoZSBrZXJuZWwgYXQgYW55IHRpbWUuCj4+Cj4+
IEZpcnN0IHBhdGNoIGFkZHMgdGhlIFNTRSBkZWZpbml0aW9ucy4gU2Vjb25kIG9uZSBhZGRzIHN1
cHBvcnQgZm9yIFNTRQo+PiBhdCBhcmNoIGxldmVsIChlbnRyeSBjb2RlIGFuZCBzdGFjayBhbGxv
Y2F0aW9ucykgYW5kIHRoaXJkIG9uZSBhdCBkcml2ZXIKPj4gbGV2ZWwuIEZpbmFsbHksIHRoZSBs
YXN0IHBhdGNoIGFkZCBzdXBwb3J0IGZvciBTU0UgZXZlbnRzIGluIHRoZSBTQkkgUE1VCj4+IGRy
aXZlci4gQWRkaXRpb25hbCB0ZXN0aW5nIGZvciB0aGF0IHBhcnQgaXMgaGlnaGx5IHdlbGNvbWVk
IHNpbmNlIHRoZXJlCj4+IGFyZSBhIGxvdCBvZiBwb3NzaWJsZSBwYXRoIHRoYXQgbmVlZHMgdG8g
YmUgZXhlcmNpc2VkLgo+Pgo+PiBBbW9uZ3N0IHRoZSBzcGVjaWZpYyBwb2ludHMgdGhhdCBuZWVk
cyB0byBiZSBoYW5kbGUgaXMgdGhlIGludGVycnVwdGlvbgo+PiBhdCBhbnkgcG9pbnQgb2YgdGhl
IGtlcm5lbCBleGVjdXRpb24gYW5kIG1vcmUgc3BlY2lmaWNhbGx5IGF0IHRoZQo+PiBiZWdpbm5p
bmcgb2YgZXhjZXB0aW9uIGhhbmRsaW5nLiBEdWUgdG8gdGhlIGZhY3QgdGhhdCB0aGUgZXhjZXB0
aW9uIGVudHJ5Cj4+IGltcGxlbWVudGF0aW9uIHVzZXMgdGhlIFNDUkFUQ0ggQ1NSIGFzIGJvdGgg
dGhlIGN1cnJlbnQgdGFzayBzdHJ1Y3QgYW5kCj4+IGFzIHRoZSB0ZW1wb3JhcnkgcmVnaXN0ZXIg
dG8gc3dpdGNoIHRoZSBzdGFjayBhbmQgc2F2ZSByZWdpc3RlciwgaXQgaXMKPj4gZGlmZmljdWx0
IHRvIHJlbGlhYmx5IGdldCB0aGUgY3VycmVudCB0YXNrIHN0cnVjdCBpZiB3ZSBnZXQgaW50ZXJy
dXB0ZWQKPj4gYXQgdGhpcyBzcGVjaWZpYyBtb21lbnQgKGllLCBpdCBtaWdodCBjb250YWluIDAs
IHRoZSB0YXNrIHBvaW50ZXIgb3IgdHApLgo+PiBBIGZpeHVwLWxpa2UgbWVjaGFuaXNtIGlzIG5v
dCBwb3NzaWJsZSBkdWUgdG8gdGhlIG5lc3RlZCBuYXR1cmUgb2YgU1NFCj4+IHdoaWNoIG1ha2Vz
IGl0IHJlYWxseSBoYXJkIHRvIG9idGFpbiB0aGUgb3JpZ2luYWwgaW50ZXJydXB0aW9uIHNpdGUu
IEluCj4+IG9yZGVyIHRvIHJldHJpZXZlIHRoZSB0YXNrIGluIGEgcmVsaWFibGUgbWFubmVyLCBh
ZGQgYW4gYWRkaXRpb25hbAo+PiBfX3NzZV9lbnRyeV90YXNrIHBlcl9jcHUgYXJyYXkgd2hpY2gg
c3RvcmVzIHRoZSBjdXJyZW50IHRhc2suIElkZWFsbHksCj4+IHdlIHdvdWxkIG5lZWQgdG8gbW9k
aWZ5IHRoZSB3YXkgd2UgcmV0cmlldmUvc3RvcmUgdGhlIGN1cnJlbnQgdGFzayBpbgo+PiBleGNl
cHRpb24gaGFuZGxpbmcgc28gdGhhdCBpdCBkb2VzIG5vdCBkZXBlbmQgb24gdGhlIHBsYWNlIHdo
ZXJlIGl0J3MKPj4gaW50ZXJydXB0ZWQuCj4+Cj4+IENvbnRyYXJ5IHRvIHBzZXVkbyBOTUkgWzJd
LCBTU0UgZG9lcyBub3QgbW9kaWZpZXMgdGhlIHdheSBpbnRlcnJ1cHRzIGFyZQo+PiBoYW5kbGVk
IGFuZCBkb2VzIG5vdCBhZGRzIGFueSBvdmVyaGVhZCB0byBleGlzdGluZyBjb2RlLiBNb3Jlb3Zl
ciwgaXQKPj4gcHJvdmlkZXMgInRydWUiIE5NSS1saWtlIGludGVycnVwdHMgd2hpY2ggY2FuIGlu
dGVycnVwdCB0aGUga2VybmVsIGF0Cj4+IGFueSB0aW1lIChldmVuIGluIGV4Y2VwdGlvbiBoYW5k
bGluZykuIFRoaXMgaXMgcGFydGljdWxhcmx5IGNydWNpYWwgZm9yCj4+IFJBUyBlcnJvcnMgd2hp
Y2ggbmVlZHMgdG8gYmUgaGFuZGxlZCBhcyBmYXN0IGFzIHBvc3NpYmxlIHRvIGF2b2lkIGFueQo+
PiBmYXVsdCBwcm9wYWdhdGlvbi4KPj4KPj4gQSB0ZXN0IHN1aXRlIGlzIGF2YWlsYWJsZSBhcyBh
IHNlcGFyYXRlIGtzZWxmdGVzdCBtb2R1bGUuIEluIG9yZGVyIHRvCj4+IGJ1aWxkIGl0LCB5b3Ug
Y2FuIHVzZSB0aGUgZm9sbG93aW5nIGNvbW1hbmQ6Cj4+Cj4+ICQgS0RJUj08YnVpbGRfZGlyPiBt
YWtlIE89YnVpbGQgVEFSR0VUUz0icmlzY3Yvc3NlIi1qICQoKCQobnByb2MpLTEpKSAtQyB0b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cwo+Pgo+PiBUaGVuIGxvYWQgdGhlIG1vZHVsZSB1c2luZzoKPj4K
Pj4gJCBzaCBydW5fc3NlX3Rlc3Quc2gKPj4KPj4gQSBLVk0gU0JJIFNTRSBleHRlbnNpb24gaW1w
bGVtZW50YXRpb24gaXMgYXZhaWxhYmxlIGF0IFsyXS4KPj4KPj4gTGluazogaHR0cHM6Ly9naXRo
dWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3Ytc2JpLWRvYy9yZWxlYXNlcy9kb3dubG9hZC92My4w
LXJjNy9yaXNjdi1zYmkucGRmIFsxXQo+PiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcml2b3Np
bmMvbGludXgvdHJlZS9kZXYvY2xlZ2VyL3NzZV9rdm0gWzJdCj4gCj4gSSB1cGRhdGVkIHRoZXNl
IHRvIGFwcGx5IG9uIExpbnVzJyBjdXJyZW50IG1hc3RlciwgY29tbWl0IDU0NzJkNjBjMTI5Ziwg
Cj4gY2xlYW5lZCB1cCB0aGUgY2hlY2twYXRjaC5wbCAtLXN0cmljdCBpc3N1ZXMsIGFwcGxpZWQg
QW51cCdzIHByX2luZm8oKSAKPiBzdWdnZXN0aW9uLCBhbmQgcHVzaGVkIHRoZW0gdXAgaGVyZSB0
byBtYWtlIGl0IGNvbnZlbmllbnQgZm9yIGZvbGtzIHRvIAo+IGludGVncmF0ZSBhbmQgdGVzdDoK
PiAKPiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Bq
dy9yaXNjdi5naXQvP2g9cmlzY3YtZXhwZXJpbWVudGFsLWZvci12Ni4xOAo+IAo+IEFtIGFzc3Vt
aW5nIHlvdSBkaWRuJ3QgaGF2ZSBvdGhlciBjaGFuZ2VzIHRoYXQgeW91IHdhbnRlZCB0byBtYWtl
OyBsZXQgbWUgCj4ga25vdyBpZiB0aGF0J3Mgbm90IHRoZSBjYXNlLgoKSW5kZWVkLCBJIGRvIG5v
dCBoYXZlIHBlbmRpbmcgbW9kaWZpY2F0aW9uIGZvciB0aGlzIHNlcmllcy4gVGhlIEtWTSBTQkkK
U1NFIHN1cHBvcnQgd2lsbCBiZSBzdWJtaXR0ZWQgbGF0ZXIgdGhhdCB5ZWFyLgoKPiAKPiBJIG5v
dGljZWQgdGhhdCB5b3UgYXNrZWQgZm9yIGZvbGtzIHRvIGRvIGFkZGl0aW9uYWwgdGVzdGluZywg
cGFydGljdWxhcmx5IAo+IG9mIHRoZSBTQkkgUE1VIGRyaXZlciBpbnRlZ3JhdGlvbiwgYnV0IGRp
ZG4ndCBub3RpY2UgYW55IGFkZGl0aW9uYWwgCj4gVGVzdGVkLWJ5OnMuICBJdCB3b3VsZCBiZSBn
cmVhdCBpZiBvdGhlciBmb2xrcyBvbiB0aGUgbGlzdCBjb3VsZCBkbyBzb21lIAo+IGZvY3VzZWQg
dGVzdGluZyBub3csIHBhcnRpY3VsYXJseSBzaW5jZSB3ZSdyZSBvbiB2NyBvZiB0aGlzIHNlcmll
cywgYW5kIAo+IEknbSBzdXJlIG90aGVycyBjYXJlIGFib3V0IHRoaXMuCgogSSB3b3VsZCBoYXZl
IHByZWZlciBhIGJpdCBtb3JlIHJldmlld3MgYW5kIHRlc3RpbmcgYmVmb3JlIGdvaW5nIHRocm91
Z2gKc2luY2UgU1NFIGNhbiBiZSBxdWl0ZSBpbnRydXNpdmUgYXQgZXhlY3V0aW9uIHRpbWUgKGV2
ZW4gdGhvdWdoIHRoZQpjbGFzc2ljIElSUSBwYXRoIHNob3VsZCBub3QgYmUgaW1wYWN0ZWQsIEkg
ZXhwZWN0IG1vc3RseSBmZWVkYmFjay9idWdzCmZyb20gdGhlIFNTRSBoYW5kbGluZyBwYXRoIGl0
c2VsZikuIFdlJ2xsIHNlZSBpbiBhIGZldyBkYXlzIGlmIHBlb3BsZQpmaW5kIHN1Y2ggcHJvYmxl
bXMuCgpUaGFua3MsCgpDbMOpbWVudAoKCj4gCj4gCj4gdGhhbmtzLAo+IAo+IC0gUGF1bAo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
