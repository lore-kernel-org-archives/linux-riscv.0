Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791B7C47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 15:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAgndb+hlMLeUQaki541mnJakU6U5sBE0tsRTnjhsEo=; b=R+YY7tY79mihL/
	B4G2rNXe6gBbYOuYqZAcen4wY3xjDaxJjfH9o2fKw1TlWSYbwun8QL7uzdas3BjVI9SJ3ABH5XOeO
	avUVwBlN1vxyOz8sphhiYuRZpNAI1IqOGkTBMPqr7XNwhvRrCVyz49NtQCIMKSap5A8Myw76phg9Z
	rT5ypuE0VCQuD93gsYs7em3r50c/XVdiXbAC4bK8cVShP9ULm/Hv0yjXBUnI0hhQvXXzr88G3VkmE
	GmsBi62QU9e2xxBX+43iR5AHezGZVVGbh4Eq9Io0sczVPi4Yjd9WNqgnRmYXz8CU9NfhpxLXXWMvj
	Qn3kkfz8Shw2fPjxNIjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLQ76-00EaNI-39;
	Thu, 04 Jan 2024 15:58:32 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLQ74-00EaM8-1S
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 15:58:31 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-35fd8662acaso1883945ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 07:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704383909; x=1704988709; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+LkB4Vo+u25oWI7sGQO48sDZuLcvpPhc24u586CsWs=;
        b=H5E3BGZue9RB34kcfVL1lDvo9jN/+GmbDX/ZfEdeuHMDugsk7Uiron9E4Z4eCjVGSa
         s4YlqqA8QrgMGW8GKPNzpA4JfHDPBjZkjYi1ed4ZySX7aJiHSnx1JgOrdn2fX8i3eVM2
         +Dv8hhdgjVgD4V8eR4qHaR0xHUhrTNQnh1UUnEBgvM3RE9nPu/NSEZ4Ihif2kUJSHZSk
         HjiENMe9PCjE6pspd6yhZyTWZtvLwA2zoPTOKd4DL2OoktH/kao5uX1r5K0x2sZ5CJsJ
         /i9MI5vfsBzmzyhyy//vOASO+T2O9En65Sz2Ux/VGaCs8kTqAzbS0tsvY/ZhTW6xGi59
         FXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704383909; x=1704988709;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+LkB4Vo+u25oWI7sGQO48sDZuLcvpPhc24u586CsWs=;
        b=p2j9+TBP8kxWOAxyxc5HK0xB9LsDkClv7fdluWGqw7hO3emwcEhPLbd99pTTcVYAlK
         UI3QzmBmWn9I9dCJrPK7O3G5D2bQgbG/Ib+fvIzIXOVaSb80ty4u+wrBxw4yZF2k7H35
         lSbirMlJV6InHppW72iMmHnB9h9oJ5dJtfnnjZTc7hksO6z237IiRZgaL/7sGULk6rIb
         GRli95AcLYjH0sjyyqbDVKepleSw2ZtmCWbP030jTc95nR3ZPHs9jla14PjEXlNsR0hj
         8y/up6OKZsRFs9szAKag4Byhp37OOxvmMFoECQlMeK9L9ZViJKdGeLxmlQ4lQN22adNX
         xJgw==
X-Gm-Message-State: AOJu0YzoIsydY+mts7H7RdiUE/sHlpfAlQR3yXcXdbXdkI5wY75ZeYLz
	5a4YrIldvB5YqBbeDhRTVYnZ6MisWkYDcQ==
X-Google-Smtp-Source: AGHT+IH0j3oQCRY8sxvQe5xsZpHeGls13odOGuU65eTJqn0FYIyylaRiHWDyo9dxY5HyEPL4psyAAg==
X-Received: by 2002:a05:6e02:b48:b0:35f:f023:f8e2 with SMTP id f8-20020a056e020b4800b0035ff023f8e2mr508987ilu.17.1704383909345;
        Thu, 04 Jan 2024 07:58:29 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:b86c:e734:b34:45c6? ([2605:a601:adae:4500:b86c:e734:b34:45c6])
        by smtp.gmail.com with ESMTPSA id v16-20020a92d250000000b0035d6559c5b9sm9232707ilg.64.2024.01.04.07.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 07:58:29 -0800 (PST)
Message-ID: <84389bc3-f2e7-49c5-a820-de60ee00f8a7@sifive.com>
Date: Thu, 4 Jan 2024 09:58:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 x86@kernel.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-arch@vger.kernel.org, WANG Xuerui <git@xen0n.name>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
 <20231228014220.3562640-8-samuel.holland@sifive.com>
 <CAAhV-H5TJPqRcgS6jywWDSNsCvd-PsVacgxgoiF-fJ00ZnS4uA@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAAhV-H5TJPqRcgS6jywWDSNsCvd-PsVacgxgoiF-fJ00ZnS4uA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_075830_491392_BD91292C 
X-CRM114-Status: GOOD (  14.40  )
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

SGkgSHVhY2FpLAoKT24gMjAyNC0wMS0wNCAzOjU1IEFNLCBIdWFjYWkgQ2hlbiB3cm90ZToKPiBI
aSwgU2FtdWVsLAo+IAo+IE9uIFRodSwgRGVjIDI4LCAyMDIzIGF0IDk6NDLigK9BTSBTYW11ZWwg
SG9sbGFuZAo+IDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPj4KPj4gTG9vbmdB
cmNoIGFscmVhZHkgcHJvdmlkZXMga2VybmVsX2ZwdV9iZWdpbigpIGFuZCBrZXJuZWxfZnB1X2Vu
ZCgpIGluCj4+IGFzbS9mcHUuaCwgc28gaXQgb25seSBuZWVkcyB0byBhZGQga2VybmVsX2ZwdV9h
dmFpbGFibGUoKSBhbmQgZXhwb3J0Cj4+IHRoZSBDRkxBR1MgYWRqdXN0bWVudHMuCj4+Cj4+IEFj
a2VkLWJ5OiBXQU5HIFh1ZXJ1aSA8Z2l0QHhlbjBuLm5hbWU+Cj4+IFJldmlld2VkLWJ5OiBDaHJp
c3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxh
bmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4+IC0tLQo+Pgo+PiAobm8gY2hhbmdlcyBz
aW5jZSB2MSkKPj4KPj4gIGFyY2gvbG9vbmdhcmNoL0tjb25maWcgICAgICAgICAgIHwgMSArCj4+
ICBhcmNoL2xvb25nYXJjaC9NYWtlZmlsZSAgICAgICAgICB8IDUgKysrKy0KPj4gIGFyY2gvbG9v
bmdhcmNoL2luY2x1ZGUvYXNtL2ZwdS5oIHwgMSArCj4+ICAzIGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2Fy
Y2gvS2NvbmZpZyBiL2FyY2gvbG9vbmdhcmNoL0tjb25maWcKPj4gaW5kZXggZWUxMjM4MjBhNDc2
Li42NWQ0NDc1NTY1YjggMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvbG9vbmdhcmNoL0tjb25maWcKPj4g
KysrIGIvYXJjaC9sb29uZ2FyY2gvS2NvbmZpZwo+PiBAQCAtMTUsNiArMTUsNyBAQCBjb25maWcg
TE9PTkdBUkNICj4+ICAgICAgICAgc2VsZWN0IEFSQ0hfSEFTX0NQVV9GSU5BTElaRV9JTklUCj4+
ICAgICAgICAgc2VsZWN0IEFSQ0hfSEFTX0ZPUlRJRllfU09VUkNFCj4+ICAgICAgICAgc2VsZWN0
IEFSQ0hfSEFTX0tDT1YKPj4gKyAgICAgICBzZWxlY3QgQVJDSF9IQVNfS0VSTkVMX0ZQVV9TVVBQ
T1JUIGlmIENQVV9IQVNfRlBVCj4+ICAgICAgICAgc2VsZWN0IEFSQ0hfSEFTX05NSV9TQUZFX1RI
SVNfQ1BVX09QUwo+PiAgICAgICAgIHNlbGVjdCBBUkNIX0hBU19OT05fT1ZFUkxBUFBJTkdfQURE
UkVTU19TUEFDRQo+PiAgICAgICAgIHNlbGVjdCBBUkNIX0hBU19QVEVfU1BFQ0lBTAo+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gvTWFrZWZpbGUgYi9hcmNoL2xvb25nYXJjaC9NYWtlZmls
ZQo+PiBpbmRleCA0YmE4ZDY3ZGRiMDkuLjFhZmUyOGZlYWJhNSAxMDA2NDQKPj4gLS0tIGEvYXJj
aC9sb29uZ2FyY2gvTWFrZWZpbGUKPj4gKysrIGIvYXJjaC9sb29uZ2FyY2gvTWFrZWZpbGUKPj4g
QEAgLTI1LDYgKzI1LDkgQEAgZW5kaWYKPj4gIDMyYml0LWVtdWwgICAgICAgICAgICAgPSBlbGYz
Mmxvb25nYXJjaAo+PiAgNjRiaXQtZW11bCAgICAgICAgICAgICA9IGVsZjY0bG9vbmdhcmNoCj4+
Cj4+ICtDQ19GTEFHU19GUFUgICAgICAgICAgIDo9IC1tZnB1PTY0Cj4+ICtDQ19GTEFHU19OT19G
UFUgICAgICAgICAgICAgICAgOj0gLW1zb2Z0LWZsb2F0Cj4gV2Ugd2lsbCBhZGQgTG9vbmdBcmNo
MzIgc3VwcG9ydCBsYXRlciwgbWF5YmUgaXQgc2hvdWxkIGJlIC1tZnB1PTMyIGluCj4gdGhhdCBj
YXNlLCBhbmQgZG8gb3RoZXIgYXJjaHMgaGF2ZSB0aGUgY2FzZSB0aGF0IG9ubHkgc3VwcG9ydCBG
UDMyPwoKRG8geW91IG1lYW4gdGhhdCBMb29uZ0FyY2gzMiBkb2VzIG5vdCBzdXBwb3J0IGRvdWJs
ZS1wcmVjaXNpb24gRlAgaW4gaGFyZHdhcmU/CkF0IGxlYXN0IGJvdGggb2YgdGhlIGNvbnN1bWVy
cyBpbiB0aGlzIHNlcmllcyB1c2UgZG91YmxlLXByZWNpc2lvbiwgc28gbXkgZmlyc3QKdGhvdWdo
dCBpcyB0aGF0IExvb25nQXJjaDMyIGNvdWxkIG5vdCBzZWxlY3QgQVJDSF9IQVNfS0VSTkVMX0ZQ
VV9TVVBQT1JULgoKUmVnYXJkcywKU2FtdWVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
