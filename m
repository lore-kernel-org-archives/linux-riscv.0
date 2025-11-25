Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D498D0EE0D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 18:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bjtwmx/K6wK7ojCtJwhxh9WInt5vgmv9lF/6GQOXExQ=; b=1bMpaUulFgg4T9
	0oFKKRw1fpRGFB4dGVOiHzdBTGl5mwr74J+CddnqShK9E8LCPuohrxS0pmhz4d5yVqKC8iXg+2mOu
	rn3ZCYh/rAaZI1PYZjOQ6X1rHd19z6TRtfIssxLjPuaHPVdXGSYpg3SrxGuTtH542coLc8oPyp/VS
	0wENTcS62X5ucvfgQebJxxQdeHX/oVrIcVAJigB6w9iJKbfb8u+iSN8C0JmoetrgkUA93fHKPLNMc
	sp9BWx3g/u74/TSM1NwBVqy9qIS3FSUVUc6c3rp3BqWYk2HmK+NC0fPI2gTWH9l76amz619W0fl5t
	1MFvryPq/qBP3QJQhsRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxaE-0000000Dki0-3HUR;
	Tue, 25 Nov 2025 18:16:10 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxa9-0000000DkgK-14Gq
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 18:16:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47798f4059fso7046795e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Nov 2025 10:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764094563; x=1764699363; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9v97D+9PLT0uMLapviF3SmaxxpgNNwzI4R+kSRfUcm4=;
        b=bt/ACzDwUJ22vxH456JaGKraP0HmNxW+jSqmQTufx76khOJafXngthOwH/y53Ni9kf
         8i2kMqb7q3DDQmsro607IN8eKEE/hYQWkaxSpsi2iBJS0z6qtOstHVVuZXnt57OVvH44
         oEmjP9+HXL7lajbFibcFn0h0LoPehy0P+OG+cpyw+0/JOeB2R+5G9CaB8p6wTA51Yq5z
         Gs+HnhkA0YDakRbYmje7AVrxdX34vpeklfM1Q1dDPXl5BMcAmNLymg6L1oLmtEyxsHLI
         LlEcAC0Q+UxN5yJYhP7ZuaOvmwymbn56qG+QMTveViyZwM37nlcnunVENrV//VnXv7ie
         PTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764094563; x=1764699363;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9v97D+9PLT0uMLapviF3SmaxxpgNNwzI4R+kSRfUcm4=;
        b=c0Vn3EZuZU5XgBiQj5zeHdysuBzFbf8U0C+P4IO4ATWR/NZoOCyylmOo74bBQWTUcx
         4MqtzmGP7vuGAUJiqDQ8upuseDXTqKECrUAyGvGnz8ZOXuU/S+vKcCnDxBY5JvohF1GH
         6zU17LK3K6VDoe9ajyHqSg6UZhQmOtd3QlSDpqvw49n0KtjMnaHEnWfAcYsaFMi5ZDT1
         GSICH/ZpGv9z9l87Z4gDd9BOZp16AV/PCHGSkwiyY/1nuzqGcPVkQK/BvBBlNSSMXdu1
         TJ8L2Aa3pDDlQ6WqdmIoYUEjNmR37+QO9GHYIuJUzbZbDuUd1JpwUDIsMToW5kR9EbuP
         uRAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZf61FJowKRqS4gVtCGl26YshkZnaO1LT6CYdzPz2KXL25C+NTiLUxIP8iYztDWobTsl1WWwbsZDCZ3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5q7sz3CU1rb6NmUc3qyOJikNjCKkKQB1l4y06CF+w13hMClGK
	UQVjMAjq88Okh7QogsNqP92eFdG4NqydG4SSlOeT+wD9sppeDNSBmLit35Wp1xNMvUY=
X-Gm-Gg: ASbGncs4WrbbI6k3m5n04KzZLJNP7zpSbkoglrr+Zbp407Dt1KUKmdlciennOLP7+nc
	xCPIHhdMsZyrYbn/xJBoZ/ThFltyGw299WVw0BIBDTiP0+124doixFCFvVoM0iYaNuA1bZq1B7+
	lvsrncVfkqs38przlqDCuLiB8qXmwgFe9zCZQDPbJSV5RSr1L92StmQbf6IVVN5vdv2/MVmEl/k
	eBtSy1p3N8dfH1kAWHtxTlmUUr99DMSTeykNWdvDNacp74oy7NpAoKZYBB8d/Fmusm7BTeQlM3z
	Bc8OAm0g4T5h2Iuso6C027vfCucCyJz6FsZZ32TlkNhHUsLxcGnelMnZGu3XpvicETxFFFyZ+FZ
	43EANXkhq6YMd7bT39AJqx3hE6zIc4MysYdbbjByGHyMxEQN385v6xCFTYrZHs8tnE/dHqTpiX2
	o=
X-Google-Smtp-Source: AGHT+IFoy5K/jbEe3lAZa+6Mn4nHERrUuG7oU2Mf+OYZ+BYbMR2pW+d1vv3kWbQEl+fQTgVqW0Ju2A==
X-Received: by 2002:a05:600c:1552:b0:477:9c9e:ec6c with SMTP id 5b1f17b1804b1-477c01f4ed3mr85974315e9.8.1764094563308;
        Tue, 25 Nov 2025 10:16:03 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::3052])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7f3635bsm36230521f8f.17.2025.11.25.10.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 10:16:02 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 25 Nov 2025 19:15:28 +0100
Message-Id: <DEHZBIAB842A.1AUCJS0OR923@ventanamicro.com>
Subject: Re: [PATCH] RISC-V: KVM: Allow to downgrade HGATP mode via SATP
 mode
Cc: <alex@ghiti.fr>, <anup@brainfault.org>, <aou@eecs.berkeley.edu>,
 <atish.patra@linux.dev>, <guoren@kernel.org>,
 <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <palmer@dabbelt.com>, <pjw@kernel.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: <fangyu.yu@linux.alibaba.com>, <ajones@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20251124-4ecf1b6b91b8f0688b762698@orel>
 <20251125141811.39964-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20251125141811.39964-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_101605_313860_CE9DDC5D 
X-CRM114-Status: GOOD (  15.85  )
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

MjAyNS0xMS0yNVQyMjoxODoxMSswODowMCwgPGZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT46
Cj4+PiBPbiBTYXQsIE5vdiAyMiwgMjAyNSBhdCAzOjUw4oCvUE0gPGZhbmd5dS55dUBsaW51eC5h
bGliYWJhLmNvbT4gd3JvdGU6Cj4+PiA+Cj4+PiA+IEZyb206IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1
QGxpbnV4LmFsaWJhYmEuY29tPgo+Pj4gPgo+Pj4gPiBDdXJyZW50bHksIEhHQVRQIG1vZGUgdXNl
cyB0aGUgbWF4aW11bSB2YWx1ZSBkZXRlY3RlZCBieSB0aGUgaGFyZHdhcmUKPj4+ID4gYnV0IG9m
dGVuIHN1Y2ggYSB3aWRlIEdQQSBpcyB1bm5lY2Vzc2FyeSwganVzdCBhcyBhIGhvc3Qgc29tZXRp
bWVzCj4+PiA+IGRvZXNuJ3QgbmVlZCBzdjU3Lgo+Pj4gPiBJdCdzIGxpa2VseSB0aGF0IG5vIGFk
ZGl0aW9uYWwgcGFyYW1ldGVycyAobGlrZSBubzVsdmwgYW5kIG5vNGx2bCkgYXJlCj4+PiA+IG5l
ZWRlZCwgYWxpZ25pbmcgSEdBVFAgbW9kZSB0byBTQVRQIG1vZGUgc2hvdWxkIG1lZXQgdGhlIHJl
cXVpcmVtZW50cwo+Pj4gPiBvZiBtb3N0IHNjZW5hcmlvcy4KPj4+IFllcywgbm81LzRsdmwgaXMg
bm90IGNsZWFyIGFib3V0IHNhdHAgb3IgaGdhdHAuIFNvLCBjb3ZlcmluZyBIR1BBVFAgaXMKPj4+
IHJlYXNvbmFibGUuCj4+Cj4+VGhlIGRvY3VtZW50YXRpb24gc2hvdWxkIGJlIGltcHJvdmVkLCBi
dXQgSSBkb24ndCB0aGluayB3ZSB3YW50IHRvIHN0YXRlCj4+dGhhdCB0aGVzZSBwYXJhbWV0ZXJz
IGFwcGx5IHRvIGJvdGggcy0gYW5kIGctc3RhZ2UuIElmIHdlIG5lZWQgcGFyYW1ldGVycwo+PnRv
IGRpY3RhdGUgS1ZNIGJlaGF2aW9yIChnLXN0YWdlIG1hbmFnZW1lbnQpLCB0aGVuIHdlIHNob3Vs
ZCBhZGQgS1ZNCj4+bW9kdWxlIHBhcmFtZXRlcnMuCj4KPiBSaWdodCwgYWRkaW5nIG5ldyBwYXJh
bWV0ZXJzIGZvciBnLXN0YWdlIG1hbmFnZW1lbnQgaXMgY2xlYXIuCj4KPiBPciB3ZSBjb3VsZCBk
aXNjdXNzIHRoaXMgdG9waWMsIGZyb20gYSB2aXJ0dWFsIG1hY2hpbmUgcGVyc3BlY3RpdmUsCj4g
aXQgbWF5IG5vdCBiZSBuZWNlc3NhcnkgdG8gcHJvdmlkZSBhbGwgaGFyZHdhcmUgY29uZmlndXJh
dGlvbgo+IGNvbWJpbmF0aW9ucy4gRm9yIGV4YW1wbGUsIHdoZW4gU0FUUCBpcyBjb25maWd1cmVk
IGFzIHN2NDgsCj4gY29uZmlndXJpbmcgSEdBVFAgYXMgc3Y1Nyo0IGlzIG5vdCB2ZXJ5IG1lYW5p
bmdmdWwsIEJlY2F1c2UgdGhlCj4gVk0gY2Fubm90IGFjdHVhbGx5IHVzZSBtb3JlIHRoYW4gNDgg
Yml0cyBvZiBHUEEgcmFuZ2UuCgpUaGUgY2hvaWNlIG9mIGhnYXRwIG1vZGUgZGVwZW5kcyBvbiBo
b3cgdXNlcnMgY29uZmlndXJlIGd1ZXN0J3MgbWVtb3J5Cm1hcCwgcmVnYXJkbGVzcyBvZiB3aGF0
IHNhdHAgb3IgdnNhdHAgbW9kZXMgYXJlLgooQWxsIFJWNjQgU3ZYWSBtb2RlcyBtYXAgWFkgYml0
IFZBIHRvIDU2IGJpdCBQQS4pCgpJZiB0aGUgbWFjaGluZSBtb2RlbCBtYXBzIG1lbW9yeSB3aXRo
IHNldCBiaXQgNTUsIHRoZW4gS1ZNIG5lZWRzIHRvCmNvbmZpZ3VyZSBTdjU3eDQsIGFuZCBpZiBu
b3RoaW5nIGlzIG1hcHBlZCBhYm92ZSAyIFRpQiwgdGhlbiBLVk0gaXMKY29tcGxldGVseSBmaW5l
IHdpdGggU3YzOXg0LgoKQSBtb2R1bGUgcGFyYW1ldGVyIHdvcmtzLCBidXQgSSB0aGluayBpdCB3
b3VsZCBiZSBuaWNlciB0byBzZXQgdGhlIGhnYXRwCm1vZGUgcGVyLVZNLCBiZWNhdXNlIG1vc3Qg
Vk1zIGNvdWxkIHVzZSB0aGUgZWZmaWNpZW50IFN2Mzl4NCwgd2hpbGUgaXQncwpub3QgYSBnb29k
IGlkZWEgdG8gcGljayBpdCBhcyB0aGUgZGVmYXVsdC4KSSB0aGluayBLVk0gaGFzIGVub3VnaCBp
bmZvcm1hdGlvbiB0byBkbyBpdCBhdXRvbWF0aWNhbGx5IChhbmQgd2l0aG91dAp0b28gbXVjaCBj
b21wbGV4aXR5KSBieSBzdGFydGluZyB3aXRoIFN2Mzl4NCwgYW5kIGV4cGFuZGluZyBhcyBuZWVk
ZWQuCgpUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
