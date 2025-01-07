Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8474EE77188
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 03:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qId21l9jc1ZNUodND5pANtteVo6e5Lk+wcGu0DkcFHk=; b=I1IY7F9ZJCudEh
	3bH5OmJlAkpUSDQVrWcgB5tvZF9Qfvk0txyE5wdwqdv4ryXkMBGmqasXR05hJlRJkaAOTaTvuVHr7
	99p4hLZgEtrOebUNH8BTEFUjE0uxUYGE4K5bn4bXvOVrmvm7mDQpwbCE8iZUTjZPxyvj37JgYYJVS
	GHf5bAHpkC8SlDGOu8Jq1WQrTNUGpzwXdsKqkYiInugvOTyga1y6JrETlNZZCgbtdhYA2KqA/oYt1
	tm2JOB8LLRVl2jHb/TW1YcTbkIVUMqT2Fx2dcGxthhpyho5S/kkVGbi1+mXlFiYsZo6BOwK0E5OtP
	ClwaD1VeW1t04t2IZ6XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV0D7-00000003J4F-043v;
	Tue, 07 Jan 2025 03:24:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV0D1-00000003J2E-3qAB
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 03:24:52 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-436a03197b2so55230905e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 19:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736220286; x=1736825086; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/TYC8R0ISEAYzr7LLQghs/rPBmA96tT1yoZlhbOesM=;
        b=WTBTdLCN6Wz01V9kQsDkc4fs69+0TvZ3P6O+Xntv+es2F+c2cq46q951NGyocVT2ZS
         v4obddWSWjTPUGv+2BpuQdyrMmI/mspxEDbjVSJ7/qYSDr5MVs8lRseoCb3aMYHtXmXq
         mCvICP/99HHe+KjV9o2irWNn86liZL1gJbMHNFn6wX3KR0xrr9slAsRnHdDTJAeVqQK5
         4wxS5IpZvxAu1Pfemcnq0mZL/OeVSt+BbDTryvxDA4fYvQ5ypxTejiqie4VnyAYM3p+5
         OMcH1JN5qk8pjcpvfPEjxgNu3niWP5x/WGLPqqQ3Seg1FYAUvlgWWbVQsJf7BySEkDpQ
         moyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736220286; x=1736825086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/TYC8R0ISEAYzr7LLQghs/rPBmA96tT1yoZlhbOesM=;
        b=K+3FYpJ7j0T0QfwJeUFlreeKbkDQH8zLSfI30cdjltqjIupAxoKhvdALyCZlSRM9rW
         8At4EWcoApcNWjaTFVYntIAcRH5PQMF9cWVXG9U5bbNPEhOnnDi81W7gE26DAiZ22/ue
         1tpV5eFFASuuJBnS66vR9y3Grk7AUPtVjg/Pc/ZUcXkMLbQ862PYuIvUe9lnUFr+4u9D
         x0x8c9cV29KY5LnP1lcwtlNjtPQG0eTmeyNRdmA2Tv1T3vghcomC8O7HUo57Jqw2l4DY
         6Sbp7LfHpIbABwDobZQ6210mZeoWtr4/ramjRjq+eVMBXgDXbYgXoubBTMkz6rSB1ysU
         YcpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXals5R25kjlwndduqNP72sjGDaE+Dn/SycPp6ICPkR/K6GSlQ5kCRVxYXevdLjrFZIDUu2OZnNmnbPIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ654PAGhInbRAMefLmxZ4nhi8DyREU0YLa8RNUnx1hRQ145pT
	i6IBw9uXxDMKmCYGA9+zZ4QCAUrOG1TBxq5T9xXQvLdGJFtS3D78UkPur7ZT5GUdJ4bj7eIVGVB
	unn3NZJbEyQks+XIurrEzKvme9VU=
X-Gm-Gg: ASbGncvlfn85qTtpLpwjE22Fa3+GKfIR3vdwzV+8ZLeUAyh4Sy3hSr9ikyufHYWbcOB
	rYs7v6Hl7E2to1PiNzajFvIpRYiFYWKDyf6MIyg==
X-Google-Smtp-Source: AGHT+IG7w81fflA6fSnORePq/ORJg8n6kS6tHtOG0WYJ5cI7c26tgtAoAEU0ZBtYaC3dcXzQffRDeyzL+7KcLsjvrHc=
X-Received: by 2002:a05:600c:1d07:b0:434:f335:83b with SMTP id
 5b1f17b1804b1-43668548780mr503398755e9.5.1736220286020; Mon, 06 Jan 2025
 19:24:46 -0800 (PST)
MIME-Version: 1.0
References: <20241026171441.3047904-1-samuel.holland@sifive.com>
In-Reply-To: <20241026171441.3047904-1-samuel.holland@sifive.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Mon, 6 Jan 2025 22:24:10 -0500
X-Gm-Features: AbW1kva7mV16is0ALkRLu-J4X9caBTTgovF5FbcC1s-tgdz1NFLHH69c-RJRoqs
Message-ID: <CAJFTR8Q_7PfCx7TeTWgALdc=M43bvx1LnEdLv_5SzU1wvWqWXw@mail.gmail.com>
Subject: Re: [PATCH 0/6] riscv: Relocatable NOMMU kernels
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_192447_957113_A9AF2159 
X-CRM114-Status: GOOD (  15.65  )
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

T24gU2F0LCBPY3QgMjYsIDIwMjQgYXQgMToxNuKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSwgUklTQy1WIE5PTU1VIGtl
cm5lbHMgYXJlIGxpbmtlZCBhdCBDT05GSUdfUEFHRV9PRkZTRVQsIGFuZAo+IHNpbmNlIHRoZXkg
YXJlIG5vdCByZWxvY2F0YWJsZSwgbXVzdCBiZSBsb2FkZWQgYXQgdGhpcyBhZGRyZXNzIGFzIHdl
bGwuCj4gQ09ORklHX1BBR0VfT0ZGU0VUIGlzIG5vdCBhIHVzZXItdmlzaWJsZSBLY29uZmlnIG9w
dGlvbiwgc28gaXRzIHZhbHVlIGlzCj4gbm90IG9idmlvdXMsIGFuZCB1c2VycyBtdXN0IHBhdGNo
IHRoZSBrZXJuZWwgc291cmNlIGlmIHRoZXkgd2FudCB0byBsb2FkCj4gaXQgYXQgYSBkaWZmZXJl
bnQgYWRkcmVzcy4KPgo+IE1ha2UgTk9NTVUga2VybmVscyBtb3JlIHBvcnRhYmxlIGJ5IG1ha2lu
ZyB0aGVtIHJlbG9jYXRhYmxlIGJ5IGRlZmF1bHQuCj4gVGhpcyBhbGxvd3MgYSBzaW5nbGUga2Vy
bmVsIGJpbmFyeSB0byB3b3JrIHdoZW4gbG9hZGVkIGF0IGFueSBhZGRyZXNzLgo+Cj4KPiBTYW11
ZWwgSG9sbGFuZCAoNik6Cj4gICByaXNjdjogUmVtb3ZlIGR1cGxpY2F0ZSBDT05GSUdfUEFHRV9P
RkZTRVQgZGVmaW5pdGlvbgo+ICAgcmlzY3Y6IEFsbG93IE5PTU1VIGtlcm5lbHMgdG8gYWNjZXNz
IGFsbCBvZiBSQU0KPiAgIHJpc2N2OiBTdXBwb3J0IENPTkZJR19SRUxPQ0FUQUJMRSBvbiBOT01N
VQo+ICAgYXNtLWdlbmVyaWM6IEFsd2F5cyBkZWZpbmUgRWxmX1JlbCBhbmQgRWxmX1JlbGEKPiAg
IHJpc2N2OiBTdXBwb3J0IENPTkZJR19SRUxPQ0FUQUJMRSBvbiByaXNjdjMyCj4gICByaXNjdjog
UmVtb3ZlIENPTkZJR19QQUdFX09GRlNFVAo+Cj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAg
ICAgICAgIHwgMTAgKy0tLQo+ICBhcmNoL3Jpc2N2L01ha2VmaWxlICAgICAgICAgICAgICB8ICAx
IC0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmggICAgfCAyNyArKysrLS0tLS0KPiAg
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCAgNiArLQo+ICBhcmNoL3Jpc2N2L21t
L2luaXQuYyAgICAgICAgICAgICB8IDk3ICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
Cj4gIGluY2x1ZGUvYXNtLWdlbmVyaWMvbW9kdWxlLmggICAgIHwgIDggLS0tCj4gIDYgZmlsZXMg
Y2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKSwgODEgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuNDUu
MQo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2CgpBbnkgdXBkYXRlIG9uIHRoaXM/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
