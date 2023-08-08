Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A359C001DF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 10:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xr90nrkgmv3CoqzGWEseC0JLVg/0q9x6axq4BqRL9+c=; b=QoB1qDiHlZfjVp
	T4u4rzz0VjEhYMLxPmU3+XMFgg5M9gys9y1JSto0vAZU1ncALuvGq3tNCOzSE+idymAoAAjUKqKrB
	0fpW6Ci1wowPPpFyD9zR4xZsJLO6zbKbXE+sGjyF6AVwHgf7gSR37b7RH1Dq0cU6jMf9Mj2Y3B2AN
	S7AvlZ6JbZNGUQNsU+9hfHvVDmrNNzgDmeUmECfjoponSPwL/X/dCmbNUxJDyOWm99JH5/WNgz5t5
	uxAexUiPC+LoNAXFWNx8Wri2/dQD9HT9NseFL00+z8MMdURQV2VypTlSkxDqDHJMO4QJR6LSUTHhW
	cSCYkoG8L6Ji0UPlFg8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTKP8-002QD1-1f;
	Tue, 08 Aug 2023 10:57:34 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTKP5-002QBp-0y
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 10:57:32 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-267fc1d776eso3035509a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 03:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691492249; x=1692097049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9zS30PvoHblPo8YN82wx1JKihZIxwLEMzYHF89G6sU=;
        b=JZx+H6vFagq//HJtpeS4QjluWt8j37aOSgjXzNOxSTvkP562wtx3qlKXWcMbYDd2Iv
         qAfntOHi/Gc9ZeBlOg02irjmGZ31lW1YasfgssuCXA9mvl7/+ZX4krhmMZDMfeGcGSO/
         sP2XEsszUSp/8Z35tK7O+qejS7H63kOWvxN9SNxDwxAc9epEOd5Ywxv2HDCGisBqQ2IZ
         Xb1UlUpeMhcbPucb8tADAni6yfP0gUvCsVJfyBleu+zfulfuSGST5jH6RFE/6at3wwgZ
         wSKueZ9dQdz2UQnuh0zWY4YshVjIfuxjyRvpHvOvEjNf/6OO4EbUp9ShidPrGPdguI5J
         x2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691492249; x=1692097049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9zS30PvoHblPo8YN82wx1JKihZIxwLEMzYHF89G6sU=;
        b=VO+cAXe4hh0X2Pb49qs8aw29zhKXVx0V6MucikLu/N+xorhCrJ9o6UQnYW8L9Zopq3
         BWgA0tqcEh3lVBw+7PW5IBGKlFYp1VYyvEVlABQMebon1hMJnnTyNn5njDnI6ObkP797
         6flGGMWJW4/MsyBOKX1p8lEDEqaj4IEk02eF4xsh2YgolPAEeEAJ9tzUzQKhuAf4TcLt
         Kze0Q5pHJ4e8EvflrMWXO6WO9YXBeUXqa6ZyJWlzt2apLuCuumx/3XAmJzAHw1+T2FAp
         sTrwuYjfbUYAfgiiqr4GGXiALdmxHfOVMv8isa9L4xzQiv1NjER1Gui/+FjgT/9eLXnV
         2CUQ==
X-Gm-Message-State: AOJu0YzGPAwxyODgMGCtTEMgccTNhl83t4mWCraCT5+n8S2IN7gc0KEq
	EItk/JlcnrCiWEduObO5LZqUqL3yo4yimWo0oKpFoA==
X-Google-Smtp-Source: AGHT+IHwj3koprvncE8FX41F8VhQ9ofHcuhvfeQaw4c/xsViq681+NAYgINd4xXSKcG2d8KRUWa6MORkInxl0+tlgIk=
X-Received: by 2002:a17:90a:c583:b0:263:5c6a:1956 with SMTP id
 l3-20020a17090ac58300b002635c6a1956mr9160440pjt.25.1691492249057; Tue, 08 Aug
 2023 03:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-21-sunilvl@ventanamicro.com> <20230808-chalice-easing-1369c7386082@spud>
In-Reply-To: <20230808-chalice-easing-1369c7386082@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 8 Aug 2023 16:27:16 +0530
Message-ID: <CAK9=C2XZ7_tfSK6HNN1Em5fAHrknWBqGaD9gPL8yGs8AzE3vQg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 20/21] RISC-V: ACPI: Create PLIC platform device
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_035731_343418_9298CF3E 
X-CRM114-Status: GOOD (  19.99  )
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Daniel Scally <djrscally@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBBdWcgOCwgMjAyMyBhdCAyOjEy4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDAzLCAyMDIzIGF0IDExOjI5OjE1UE0gKzA1
MzAsIFN1bmlsIFYgTCB3cm90ZToKPiA+IFNpbmNlIFBMSUMgbmVlZHMgdG8gYmUgYSBwbGF0Zm9y
bSBkZXZpY2UKPgo+IEZvciB0aGUgdW53YXNoZWQsIHdoeSBkb2VzIHRoZSBQTENJIG5lZWQgdG8g
YmUgYSBwbGF0Zm9ybSBkZXZpY2U/Cj4gKEFuZCB3aGlsZSB5b3UncmUgYXQgdGhhdCwgcGxlYXNl
IHRyeSB0byBtYWtlIHVzZSBvZiB0aGUgZXh0cmEgfjIwCj4gY2hhcmFjdGVycyBwZXIgbGluZSB0
aGF0IHlvdSBjYW4gdXNlIGhlcmUuKQoKQXMgc3VnZ2VzdGVkIGJ5IE1hcmMgWiwgb25seSB0aW1l
cnMgYW5kIElQSXMgbmVlZCB0byBiZSBwcm9iZWQgZWFybHkuCkV2ZXJ5dGhpbmcgZWxzZSBuZWVk
cyB0byBiZSBhIHBsYXRmb3JtIGRldmljZS4gVGhlIGRldmxpbmsgZmVhdHVyZSBvZgpMaW51eCBE
RCBmcmFtZXdvcmsgZW5zdXJlcyB0aGF0IHBsYXRmb3JtIGRldmljZXMgYXJlIHByb2JlZCBpbiB0
aGUKcmlnaHQgb3JkZXIgYmFzZWQgb24gdGhlIGludGVyZGVwZW5kZW5jeS4KClRoZSBQQVRDSDUg
b2YgdGhlIHY3IEFJQSBzZXJpZXMgY29udmVydHMgdGhlIFBMSUMgZHJpdmVyIGludG8gYQpwbGF0
Zm9ybSBkcml2ZXIuIFRoaXMgd29ya3MgcGVyZmVjdGx5IGZpbmUuCgo+Cj4gPiBwcm9iZSB0aGUK
PiA+IE1BRFQgYW5kIGNyZWF0ZSBwbGF0Zm9ybSBkZXZpY2VzIGZvciBlYWNoIFBMSUMgaW4gdGhl
Cj4gPiBzeXN0ZW0uIFVzZSBzb2Z0d2FyZSBub2RlIGZyYW1ld29yayBmb3IgdGhlIGZ3bm9kZQo+
ID4gd2hpY2ggYWxsb3dzIHRvIGNyZWF0ZSBwcm9wZXJ0aWVzIGFuZCBoZW5jZSB0aGUKPiA+IGFj
dHVhbCBpcnFjaGlwIGRyaXZlciBkb2Vzbid0IG5lZWQgdG8gZG8gYW55dGhpbmcKPiA+IGRpZmZl
cmVudCBmb3IgQUNQSSB2cyBEVC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTdW5pbCBWIEwgPHN1
bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IENvLWRldmVsb3BlZC1ieTogSGFpYm8gWHUgPGhh
aWJvMS54dUBpbnRlbC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIYWlibyBYdSA8aGFpYm8xLnh1
QGludGVsLmNvbT4KPgo+ID4gK3N0YXRpYyBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqYWNwaV9wbGlj
X2NyZWF0ZV9md25vZGUoc3RydWN0IGFjcGlfbWFkdF9wbGljICpwbGljKQo+ID4gK3sKPiA+ICsg
ICAgIHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsICpwYXJlbnRfZndub2RlOwo+ID4gKyAg
ICAgc3RydWN0IHJpc2N2X2lycWNoaXBfbGlzdCAqcGxpY19lbGVtZW50Owo+ID4gKyAgICAgc3Ry
dWN0IHNvZnR3YXJlX25vZGVfcmVmX2FyZ3MgKnJlZnM7Cj4gPiArICAgICBzdHJ1Y3QgcHJvcGVy
dHlfZW50cnkgcHJvcHNbOF0gPSB7fTsKPiA+ICsgICAgIGludCBucl9jb250ZXh0czsKPiA+ICsK
PiA+ICsgICAgIHByb3BzWzBdID0gUFJPUEVSVFlfRU5UUllfVTMyKCJyaXNjdixnc2ktYmFzZSIs
IHBsaWMtPmdzaV9iYXNlKTsKPiA+ICsgICAgIHByb3BzWzFdID0gUFJPUEVSVFlfRU5UUllfVTMy
KCJyaXNjdixuZGV2IiwgcGxpYy0+bnVtX2lycXMpOwo+ID4gKyAgICAgcHJvcHNbMl0gPSBQUk9Q
RVJUWV9FTlRSWV9VMzIoInJpc2N2LG1heF9wcmlvIiwgcGxpYy0+bWF4X3ByaW8pOwo+Cj4gTXkg
T0NEIHdhbnRzIHRvIGtub3cgd2h5IHRoaXMgZ2V0cyBhbiBfIGJ1dCB0aGUgb3RoZXJzIGhhdmUg
YSAtLgo+Cj4gPiArICAgICBwcm9wc1szXSA9IFBST1BFUlRZX0VOVFJZX1U4KCJyaXNjdixwbGlj
LWlkIiwgcGxpYy0+aWQpOwo+ID4gKyAgICAgcHJvcHNbNF0gPSBQUk9QRVJUWV9FTlRSWV9VNjQo
InJpc2N2LHBsaWMtYmFzZSIsIHBsaWMtPmJhc2VfYWRkcik7Cj4gPiArICAgICBwcm9wc1s1XSA9
IFBST1BFUlRZX0VOVFJZX1UzMigicmlzY3YscGxpYy1zaXplIiwgcGxpYy0+c2l6ZSk7Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKUmVnYXJk
cywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
