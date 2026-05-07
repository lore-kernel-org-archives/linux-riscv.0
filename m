Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136C3CD3442
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 09:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4zevQ4lrKAizd5hXaWoeglP86HPrlYD0hpafgBi1Ys=; b=lHnQBuaDhu390P
	2eKPuWvrNp/9N9cV5LynwW4AMaCO2IjMEW84dIFkvhPzwvB1p27oyPaH5DzD8F442qT2LnCivTC4v
	4Cv8aW1qG/P/BmR1wlXXngdgJZl1XR7sQgSk825S/gTebmD8CciR9Z8pxU73QUPemBX9cgZo/uFia
	n952uSpIHhwJY083ahKGG+Y8bNDrDGDrjjayZ9h9wvQx1hOLizHkaQvdpo+vgfu/gZt02+/mSIs/V
	Kng2+MCYm8DVIq9mx9DlgV4bBFLdyktB8paSmoGs0tLKXQgdHlirt41T+KmaYMYX6cfnNGdTDYW9y
	oe5R/M4VZWeoJ5usGABw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvF9-00000003NnD-2bEZ;
	Thu, 07 May 2026 09:42:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvF7-00000003Nls-3Xru
	for linux-riscv@bombadil.infradead.org;
	Thu, 07 May 2026 09:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JUrNwnrnHXKNK1Z+tsaGPk05Wyp59KKsZWMiHJkBCuY=; b=p8HoeoOerompljGWVWnn/tw9+4
	O3e76Dkvfq7vDnNPrCoGdHnV++UtSJOdYyc5LGyT5xVHBytECtZrROBpP9PGuTM7G4XYbTJM6AWla
	VBY4YtFTQOagFQkGVjwf7yD+2ViG3MUuU0bL2Ew0N6zl8C2J2GP3ixBF80LZsf2YrZreWxYJpZYx0
	OljufQyErYmcQOecsap0Ga+ZijmnVWI7TqTbtXZkwPtonA4DCIvwDiadu94hcREci0XW1oU2TO2AY
	A6fuAvEJmcZYVwIlsbug4i2mpg3dWtc5rxB0f7HRmOr7QAFMRhXOnVgNzTZIYkzeJclCqjcD/0Fe1
	dxT5ylYw==;
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvF4-0000000376F-29Pe
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 09:42:04 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-82748257f5fso1103139b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 May 2026 02:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778146921; x=1778751721; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JUrNwnrnHXKNK1Z+tsaGPk05Wyp59KKsZWMiHJkBCuY=;
        b=ITBpeySW6a6eibrRTB32ZR65rtLEkeVANQMTTdWQJPbt/1kMTVPveWzWNfPnC2cBMU
         WYFKebZw8YSOhHQH79tt6o9e3LI0DziiE9kjmMQSSa582fpRFUfKRZqzPYlIgagkvwVs
         ZAvgr6hUyWVDtyL9lGxRWs08DYrHB12h7tUewr1hZLFn5nISFAwyHzLz4fHb/HE4q7Uh
         s4a3CdvqRoFPDNsjMEqoo3KwtSZC3bVistUGZgbwHphEb03dF13LZVkPhFWzhF9XERfo
         M7kjknavjxi3X52Y1SzTiGVtyvewEPAbII2I4ygTJsi0csKBf5lfQJJDIrPUbNkbD9J/
         bh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146921; x=1778751721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUrNwnrnHXKNK1Z+tsaGPk05Wyp59KKsZWMiHJkBCuY=;
        b=DHBE/ON8Nd9aRgll5w0a4875TDIGxqM8oKBCwz/UXK12N+aLVYLU/s59z6PVNhZZY4
         x+CJV2ao5ujqQF2oZ2vTqk30ArXCRak0z/gsdz71BvZK2+5/R1tWBs/dOkzTa7OqxWJU
         2TN7OF90jt/V4hnozBOxZH9eRPlbmS3x+EGLO+K8U5FJ7hfwGht8hErGJEqtWaKJQ2lT
         FK72Gb9uGMEsncL5HX4G9IOVsC4aFmwmZjlcOedg7h4Iid+dCuJM/l+00AtR65RG93pj
         XN0GpWwRcOSxcAHg6g/M8pX5omsN6TZI7dID1v5bFuxgc+X6LnngjyLw6J4NLxma/G2L
         LSJw==
X-Forwarded-Encrypted: i=1; AFNElJ+0jLcA8GYxGgBQNss+dIAoh7LpNblj1d6yP6dBCfMGy/pSAyzbB6pOQPeWwVua2Szinnp06/j/IniA6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YztbH2JD9CMb0qCiw0BJ9KteDxbnGIrebxRGLGYK6ruvwl1FnhF
	1CYQobMXTVCF6El/Cr+koIISUCXLBiskp/l02hF6pMKzVBoNeCO0UaAO
X-Gm-Gg: AeBDies2ZvYknLGlpYSkinU+noiFWTLmLvQ2gBR0Ue/weQT6fVYhsNIrCmeUIKyPAqZ
	LJTW8fK8JHkfXcYsoiz8KdG7RXuLXNFFixZIjY9Fj5SS3ifnfYDGUUcJA2Nhv4a19m5Qp39jhJl
	kGbrx4OXlZBxGiX5XwMp+KXGJIZHkyl2CSedhBxWEKpxGTPTLk5XwgPgHIS2S2WJG1vh/98hRTq
	584A90v0lasT5WliYKCShuVQC56hmTPptvB7JGTEmtJPnEXWYmLnHhAK/N8hIZOPuDU2XBaVG/7
	H1BEqmH39Y7LMvtcaMKO2LPYVJWDyxM3V6fzVIpEH0LA8+6b3H2m7x3msn5JGk7R94jyiBojXAv
	ig1ZELZgnP30nEYgZ9O7vwAPTT6OwjDgllD0gPvEJX6hAWvTS4cGSL0TnCq5Z9XtI8czW/ElXDA
	lIA6w4v6cbFgeIO6GdYokppOdy5j6BVPuBsXxinXyXMAQO7a4IO21Z
X-Received: by 2002:a05:6a00:4093:b0:82f:3e9:7bec with SMTP id d2e1a72fcca58-83bb7abceeemr1949432b3a.12.1778146920796;
        Thu, 07 May 2026 02:42:00 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965c30ddasm10264549b3a.21.2026.05.07.02.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:42:00 -0700 (PDT)
Message-ID: <eece7690-634a-43c5-9b20-0afc174a89a0@gmail.com>
Date: Thu, 7 May 2026 17:41:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] of: reserved_mem: add linux,no-dump property
 support for reserved memory regions
To: Rob Herring <robh@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, saravanak@kernel.org, chenwandun@lixiang.com,
 zhaomeijing@lixiang.com, everyzhao@126.com
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
 <20260429065831.1510858-6-chenwandun@lixiang.com>
 <20260506144542.GA2072596-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260506144542.GA2072596-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_104203_019832_7434FF32 
X-CRM114-Status: GOOD (  17.92  )
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

CgpPbiA1LzYvMjYgMjI6NDUsIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIFdlZCwgQXByIDI5LCAy
MDI2IGF0IDAyOjU4OjI1UE0gKzA4MDAsIENoZW4gV2FuZHVuIHdyb3RlOgo+PiBBZGQgYSAnbm9f
ZHVtcCcgZmllbGQgdG8gc3RydWN0IHJlc2VydmVkX21lbSBhbmQgcGFyc2UgdGhlCj4+ICdsaW51
eCxuby1kdW1wJyBkZXZpY2UgdHJlZSBwcm9wZXJ0eSBkdXJpbmcgcmVzZXJ2ZWQgbWVtb3J5IG5v
ZGUKPj4gaW5pdGlhbGl6YXRpb24uIFRoaXMgcHJvcGVydHkgYWxsb3dzIGRldmljZSB0cmVlIGF1
dGhvcnMgdG8gbWFyawo+PiBzcGVjaWZpYyByZXNlcnZlZCBtZW1vcnkgcmVnaW9ucyB0aGF0IHNo
b3VsZCBiZSBleGNsdWRlZCBmcm9tIGtkdW1wCj4+IHZtY29yZSBkdW1wcy4KPj4KPj4gUmVzZXJ2
ZWQgbWVtb3J5IHJlZ2lvbnMgdXNlZCBieSBkZXZpY2UgZmlybXdhcmUgKGUuZy4sIEdQVSwgRFNQ
LCBtb2RlbSkKPj4gdHlwaWNhbGx5IGNvbnRhaW4gZGF0YSB0aGF0IGlzIG5vdCB1c2VmdWwgZm9y
IGtlcm5lbCBjcmFzaCBhbmFseXNpcyBhbmQKPj4gY2FuIHNpZ25pZmljYW50bHkgaW5jcmVhc2Ug
dm1jb3JlIHNpemUuIFRoZSAnbGludXgsbm8tZHVtcCcgcHJvcGVydHkKPj4gcHJvdmlkZXMgYSBk
ZWNsYXJhdGl2ZSB3YXkgdG8gaW5kaWNhdGUgdGhlc2UgcmVnaW9ucyBzaG91bGQgYmUgZmlsdGVy
ZWQKPj4gb3V0IHdoZW4gY29uc3RydWN0aW5nIHRoZSBlbGZjb3JlaGRyIGZvciBrZHVtcC4KPj4K
Pj4gVGhlIHByb3BlcnR5IGlzIG5hbWVkIHdpdGggYSAnbGludXgsJyBwcmVmaXggYmVjYXVzZSBr
ZHVtcC92bWNvcmUgaXMKPj4gTGludXgtc3BlY2lmaWMgYW5kIHRoZSBwcm9wZXJ0eSBpcyBhbiBP
UyBoaW50IHJhdGhlciB0aGFuIGEgaGFyZHdhcmUKPj4gZGVzY3JpcHRpb24sIG1hdGNoaW5nIGV4
aXN0aW5nIHByb3BlcnRpZXMgc3VjaCBhcyAnbGludXgsY21hLWRlZmF1bHQnCj4+IGFuZCAnbGlu
dXgsdXNhYmxlLW1lbW9yeS1yYW5nZScuCj4+Cj4+IFRoZSAnbGludXgsbm8tZHVtcCcgcHJvcGVy
dHkgaXMgb25seSBlZmZlY3RpdmUgd2hlbiB0aGUgcmVnaW9uOgo+PiAgIC0gRG9lcyBub3QgaGF2
ZSAnbm8tbWFwJzogdGhlc2UgcmVnaW9ucyBhcmUgYWxyZWFkeSBleGNsdWRlZCBmcm9tCj4+ICAg
ICB2bWNvcmUgc2luY2UgdGhleSBhcmUgcmVtb3ZlZCBmcm9tIHRoZSBsaW5lYXIgbWFwcGluZyAo
TUVNQkxPQ0tfTk9NQVApLgo+PiAgIC0gRG9lcyBub3QgaGF2ZSAncmV1c2FibGUnOiBDTUEgcmV1
c2FibGUgcmVnaW9ucyBhcmUgYWN0aXZlbHkgdXNlZCBieQo+PiAgICAgdGhlIGtlcm5lbCBmb3Ig
bW92YWJsZSBwYWdlIGFsbG9jYXRpb25zLCBhbmQgdGhlaXIgY29udGVudHMgYXJlCj4+ICAgICB2
YWx1YWJsZSBmb3IgY3Jhc2ggYW5hbHlzaXMuCj4+Cj4+IFRoZSBuby1kdW1wIHN0YXR1cyBpcyBh
bHNvIHByaW50ZWQgaW4gdGhlIGJvb3QgbG9nIGFsb25nc2lkZSB0aGUKPj4gZXhpc3Rpbmcgbm9t
YXAgYW5kIHJldXNhYmxlIGZsYWdzIGZvciBkaWFnbm9zdGljIHB1cnBvc2VzLgo+IEkgdGhpbmsg
dGhpcyBwcm9wZXJ0eSBpcyB0aGUgd3Jvbmcgd2F5IGFyb3VuZCBhbmQgcHJvYmFibHkgbm90IG5l
ZWRlZC4KPiBUaGUgZGVmYXVsdCBzaG91bGQgYmUgZXhjbHVkZSB0aGUgcmVnaW9ucywgYnV0IGlm
IExpbnV4IGlzIHVzaW5nIHRoZQo+IHJlZ2lvbnMgKGxpa2UgQ01BKSB0aGVuIGl0IGNhbiBkZWNp
ZGUgb24gaXRzIG93biB0byBpbmNsdWRlIHRoZW0uCj4KPiBXaXRoIHRoZSByZXN0cnVjdHVyaW5n
IHRoYXQgd2VudCBpbnRvIDcuMSwgaXQgc2hvdWxkIGJlIHBvc3NpYmxlIGZvciB0aGUKPiBDTUEg
Y29kZSAoYW5kIGNvZGUgZm9yIGFueSBvdGhlciByZWdpb25zKSB0byBzZXQgc29tZSBmbGFnIGZv
ciB0aGUKPiByZWdpb24uCkFncmVlIHRoYXQgdGhlIHByb3BlcnR5IGRpcmVjdGlvbiBpcyB3cm9u
Zy4gUmV3b3JrIGluIHYyOgogwqAgLSBEZWZhdWx0OiBleGNsdWRlIHJlc2VydmVkIHJlZ2lvbnMg
ZnJvbSB2bWNvcmUKIMKgIC0gQ01BIChyZXVzYWJsZSkgc2V0dXAgcGF0aCBtYXJrcyByZWdpb25z
IGFzIGtlcm5lbC1tYW5hZ2VkIGdlbmVyYWwgCm1lbW9yeSDihpIgaW5jbHVkZQogwqAgLSBObyBE
VCBiaW5kaW5nIG5lZWRlZDsgbGludXgsbm8tZHVtcCBwcm9wb3NhbCB3aXRoZHJhd24KClRoYW5r
cy4KPgo+IFJvYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
