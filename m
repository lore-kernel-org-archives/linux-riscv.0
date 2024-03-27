Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D55C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 20:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5pMbCqiGGVhkLw/PgtzxI5cU8ZwS0LxbhnMJ927nlzg=; b=VJrNdeGH/ekASU
	fwlsesI4Y1LxKd7FuwnUkr1lIrL1Ldw6bqIqjnLCi/HM+I0RQWcZ/RH0FmkTE2UhPKDCVBG+ZrZa5
	KEBk8kr2493HgsXeOBT4XL9cRQWDR4BC4FcUgmTNyCfuAmVUi45uB1x+/vNU++qag+qM8RErAev2E
	SzsL8zWmlVu1fykzz6i0YJBrEed6/zy0vdwD/fWn5ca0adEmKTxm6fDMbjRJrrSWNZFMJsGEd3KTe
	ZmAD7KEmZJ0JjJaO27DjPmlYCT5DfEw7jNITna7WQ2Bn34XiWXIO2HqGIH6GkCMyope5tM4f96hbL
	abQWfZkyBr6lQ1OIShqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZfd-0000000Ayb5-21ru;
	Wed, 27 Mar 2024 20:14:49 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZfZ-0000000AyZr-2n1G
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 20:14:47 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7d08aea7546so431839f.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 13:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711570484; x=1712175284; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NCYK7bXPxC3buWagK44KXlYoaMMqT9xkSSzlJu6d89E=;
        b=C9h77p+ouERKK1OFlR65WvxD8m+YadQR/tbiy83TbQVFN8DrEwqarGfirR2dx+4PE4
         qfNsbImv+UNWqiVdMaTnHPGgu8ocBqQ9ET0KCbxOjMd0OSuEejI5sLG6dvyul78YhxA1
         TzOUJg2XpgTtTmeB1/CrgdEO2vSzpOxmIWF35jqRJ/LGMe0gIgTY9YmXr6cOSGadlVem
         0os5Jfm1522GYFl+tyws8fO4g5NTjoBARrg4tIMggKkA4hrmXOYpg5kTvKkpmgyUoJl8
         67zudZn28RFVRx8JshSmmGi0efGj14hv5nD89Sj6IXYGIfnDC1xk/5TryyYEv9rFYdV0
         lGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711570484; x=1712175284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NCYK7bXPxC3buWagK44KXlYoaMMqT9xkSSzlJu6d89E=;
        b=BWref1glj4WeFezpUNLgGptWN+D7YhZRfIZXrJKz43c1YSEbYnbWK71IVV1yu6l97Y
         HBtCCYxvbUELhm+46X9Kixxpqg09a6PVKEFeQVXXWaRi/GjtyZ4FpuwE5cg6EtQV2m9U
         3LlA5B87eod8bM7aDO5gxoqtemETWqoy5b9l4jBCm4/pvgFiBu4UoqieV0M1U/O6w/MU
         SOFC2yVcQKE01lX2tZyf/Jnxzjwl8dFyWtq0VrTVUmWHw4mgKNiPYCbjJbom2t5gQW0E
         37XdhdB36qIx7zh3aRwR9hgl1dQr1hloETYES92mCCoJtft/YmSYd9G2oa41SmOKWss3
         Jf/g==
X-Forwarded-Encrypted: i=1; AJvYcCXmk6IoHLeruoOPNb84AIhxEkXPogbTisyIFpTqvlXRbytPG6rEm99jO7GL55AT6zphVgZPf66kH38X2hERCwM9DsI76gYRTlWLzDsXa6Rk
X-Gm-Message-State: AOJu0YxLd8Bm8alKdB4BKlzRxPCs9U9/JkisF2x8unm7JX54zwg7bWMl
	rd6FT1AlNW9EV/fXZxnZlgNzy8Wp06P9KaiX9RoiTFLZBN9uz68XuWr/3R8lumQ=
X-Google-Smtp-Source: AGHT+IGrYJKauK6ZcJyKJz7JlCwCofgjda6+JxtqTQ2saoYuavom2kgtDdRJaPeiZoY+65A1na55Lg==
X-Received: by 2002:a6b:7311:0:b0:7c8:4c27:810e with SMTP id e17-20020a6b7311000000b007c84c27810emr520564ioh.18.1711570483944;
        Wed, 27 Mar 2024 13:14:43 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.190])
        by smtp.gmail.com with ESMTPSA id g8-20020a02b708000000b0047469b04c35sm3465108jam.65.2024.03.27.13.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 13:14:43 -0700 (PDT)
Message-ID: <e409d77b-0dad-45c2-a507-a8b697ff4702@sifive.com>
Date: Wed, 27 Mar 2024 15:14:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] [PATCH v6 05/13] riscv: Only send remote fences when
 some other CPU is online
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>
References: <20240327045035.368512-1-samuel.holland@sifive.com>
 <20240327045035.368512-6-samuel.holland@sifive.com>
 <CAEEQ3wm4SoC6rvv2qtVdP+4ZF1q41EEHUpwnagNgFwxkG5iw_w@mail.gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAEEQ3wm4SoC6rvv2qtVdP+4ZF1q41EEHUpwnagNgFwxkG5iw_w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_131445_860033_B101DAD3 
X-CRM114-Status: GOOD (  18.14  )
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

SGkgWXVuaHVpLAoKT24gMjAyNC0wMy0yNyAxOjE2IEFNLCB5dW5odWkgY3VpIHdyb3RlOgo+IE9u
IFdlZCwgTWFyIDI3LCAyMDI0IGF0IDEyOjUw4oCvUE0gU2FtdWVsIEhvbGxhbmQKPiA8c2FtdWVs
LmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4+Cj4+IElmIG5vIG90aGVyIENQVSBpcyBvbmxp
bmUsIGEgbG9jYWwgY2FjaGUgb3IgVExCIGZsdXNoIGlzIHN1ZmZpY2llbnQuCj4+IFRoZXNlIGNo
ZWNrcyBjYW4gYmUgY29uc3RhbnQtZm9sZGVkIHdoZW4gU01QIGlzIGRpc2FibGVkLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4K
Pj4gLS0tCj4+Cj4+IChubyBjaGFuZ2VzIHNpbmNlIHY0KQo+Pgo+PiBDaGFuZ2VzIGluIHY0Ogo+
PiAgLSBOZXcgcGF0Y2ggZm9yIHY0Cj4+Cj4+ICBhcmNoL3Jpc2N2L21tL2NhY2hlZmx1c2guYyB8
IDQgKysrLQo+PiAgYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jICAgfCA0ICsrKy0KPj4gIDIgZmls
ZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMgYi9hcmNoL3Jpc2N2L21tL2NhY2hlZmx1
c2guYwo+PiBpbmRleCBkNzZmYzczZTU5NGIuLmY1YmUxZmVjODE5MSAxMDA2NDQKPj4gLS0tIGEv
YXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9tbS9jYWNoZWZs
dXNoLmMKPj4gQEAgLTIxLDcgKzIxLDkgQEAgdm9pZCBmbHVzaF9pY2FjaGVfYWxsKHZvaWQpCj4+
ICB7Cj4+ICAgICAgICAgbG9jYWxfZmx1c2hfaWNhY2hlX2FsbCgpOwo+Pgo+PiAtICAgICAgIGlm
IChyaXNjdl91c2Vfc2JpX2Zvcl9yZmVuY2UoKSkKPj4gKyAgICAgICBpZiAobnVtX29ubGluZV9j
cHVzKCkgPCAyKQo+PiArICAgICAgICAgICAgICAgcmV0dXJuOwo+PiArICAgICAgIGVsc2UgaWYg
KHJpc2N2X3VzZV9zYmlfZm9yX3JmZW5jZSgpKQo+PiAgICAgICAgICAgICAgICAgc2JpX3JlbW90
ZV9mZW5jZV9pKE5VTEwpOwo+PiAgICAgICAgIGVsc2UKPj4gICAgICAgICAgICAgICAgIG9uX2Vh
Y2hfY3B1KGlwaV9yZW1vdGVfZmVuY2VfaSwgTlVMTCwgMSk7Cj4+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L21tL3RsYmZsdXNoLmMgYi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPj4gaW5kZXgg
ZGE4MjEzMTVkNDNlLi4wOTAxYWE0N2I1OGYgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0v
dGxiZmx1c2guYwo+PiArKysgYi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPj4gQEAgLTc5LDcg
Kzc5LDkgQEAgc3RhdGljIHZvaWQgX19pcGlfZmx1c2hfdGxiX2FsbCh2b2lkICppbmZvKQo+Pgo+
PiAgdm9pZCBmbHVzaF90bGJfYWxsKHZvaWQpCj4+ICB7Cj4+IC0gICAgICAgaWYgKHJpc2N2X3Vz
ZV9zYmlfZm9yX3JmZW5jZSgpKQo+PiArICAgICAgIGlmIChudW1fb25saW5lX2NwdXMoKSA8IDIp
Cj4+ICsgICAgICAgICAgICAgICBsb2NhbF9mbHVzaF90bGJfYWxsKCk7Cj4+ICsgICAgICAgZWxz
ZSBpZiAocmlzY3ZfdXNlX3NiaV9mb3JfcmZlbmNlKCkpCj4+ICAgICAgICAgICAgICAgICBzYmlf
cmVtb3RlX3NmZW5jZV92bWFfYXNpZChOVUxMLCAwLCBGTFVTSF9UTEJfTUFYX1NJWkUsIEZMVVNI
X1RMQl9OT19BU0lEKTsKPj4gICAgICAgICBlbHNlCj4+ICAgICAgICAgICAgICAgICBvbl9lYWNo
X2NwdShfX2lwaV9mbHVzaF90bGJfYWxsLCBOVUxMLCAxKTsKPj4gLS0KPj4gMi40My4xCj4+Cj4g
Cj4gRnJvbSBhIHBlcmNlcHR1YWwgcG9pbnQgb2YgdmlldywgdGhlIG1vZGlmaWNhdGlvbiBoZXJl
IGlzIG5vdAo+IG5lY2Vzc2FyeS4gVGhlcmUgaXMgc3VjaCBsb2dpYyBpbiBvbl9lYWNoX2NwdSgp
LiBDYW4geW91IHNoYXJlIHlvdXIKPiB0ZXN0IGRhdGE/CgpUaGUgbG9naWMgaW4gb25fZWFjaF9j
cHUoKSBkb2Vzbid0IGFwcGx5IHdoZW4gcmlzY3ZfdXNlX3NiaV9mb3JfcmZlbmNlKCkgaXMKdHJ1
ZSwgc28gd2Ugd291bGQgbWFrZSB1bm5lY2Vzc2FyeSBTQkkgY2FsbHMsIGFuZCBjYW5ub3QgYmUg
b3BwaW1pemVkIG91dCB3aGVuCkNPTkZJR19TTVA9bi4gVGhlIGNvdmVyIGxldHRlciBpbmNsdWRl
cyBiZW5jaG1hcmtzIGZvciBhIHJlcHJlc2VudGF0aXZlCnNpbmdsZS1jb3JlIHN5c3RlbSAoRDEp
LiBUaGVyZSB3YXMgbm8gbWVhc3VyYWJsZSBwZXJmb3JtYW5jZSBpbXBhY3QgZnJvbSB0aGlzCnBv
cnRpb24gb2YgdGhlIHNlcmllcyBvbiBtdWx0aS1jb3JlIHN5c3RlbXMuIElmIHRoZXJlIGFyZSBz
cGVjaWZpYyBiZW5jaG1hcmtzCnlvdSB0aGluayBJIHNob3VsZCBydW4sIHBsZWFzZSBsZXQgbWUg
a25vdy4KClJlZ2FyZHMsClNhbXVlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
