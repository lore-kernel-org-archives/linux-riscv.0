Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AC6C282DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 17:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LdX3AdIzqgNGyEKTv7yxoLpmv8x5Tkz5sLM8CGUed+I=; b=xVHwnRSwxjP/44
	yx9NEC3Xm7ikz12z6TxlAI60A4Jl8MvT7SAW5eXKqFgVTh6xY6vxcNXvDbWLnUTJTia4pZXjBOthj
	N3jpKsHiddshHnQAo9yHpbi4KZZmwkQMugaCIAOWtKugUTkBq+1NRxOzZF84jGCmOEfxSjmidfJ2T
	vM7M5uLMuEtkQKBMA3wOiMDMTdMLYvT8/WJ/IAJs7xGeqmvLXhNGqfJr3Rdvx7kVxSJYTC3oiWhTm
	hDI/BhiswnBFjy4tSkf3lVUGnJyzsdXrLHGbSR2oD3LjjyazYfu4FZlVapxRHH3R0lXQbY0gpm5Y+
	bwAC26ZMfpEo+vZ7NiMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm9R-0000000ByNm-346w;
	Thu, 13 Mar 2025 17:15:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tslcS-0000000BrjP-0t0f
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 16:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741884075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/AOuWXnGYR13C3EsQl2M3GLqAI/OrlKtR5FIj9y6Kyo=;
	b=GmAhBIzCLwZs89TfINHEX5xfDJ67TpQ/S+iKBtHMifOwouPcaI90tIceWep1ov54HVMLY/
	rqmzyILsKedRaOyWxu9FNu8AZgaEj64g2I9zRwDUG9qrExyfNW3+BXJioRFSYYAVr/gstV
	GK7Cq8+Gwn95RoNnyjEFQDJ+DRPHL3E=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-IdyRiDTAOe-gVEmndJQwmA-1; Thu, 13 Mar 2025 12:41:14 -0400
X-MC-Unique: IdyRiDTAOe-gVEmndJQwmA-1
X-Mimecast-MFC-AGG-ID: IdyRiDTAOe-gVEmndJQwmA_1741884072
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3011cfa31f6so2096240a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 09:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741884072; x=1742488872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AOuWXnGYR13C3EsQl2M3GLqAI/OrlKtR5FIj9y6Kyo=;
        b=LhEHxVOpC7cw9Wp7hZSExcstoEPTcgPLKSzj3w8rbZbhuS94VKyTjOX0FddmQyB+bu
         R6Q2E8DhpQUZeTiludl2DG/bCctkR0g+DMVHTQHQrgSoZDbtg8NeP0vZ/ge82yjQMj7p
         qStOHbycK8/hl91ltuGqbGq4PX1szlQKF21wxA/4lOgcJPBOWdq/S64POtL4MmoUWFPu
         os5ql4sYLNtqbl/wcYiR9qvgy8VQESCj9/7E8UnO0zueaLUxRweotbiKrzp6Rfdxdnfb
         GxSvZ0gb2GXPX8MantCMexSDJZ0w46I3KLT/UdR8iIVE3xyvOmXEg4MTAkz6Ws2/QMza
         gojw==
X-Forwarded-Encrypted: i=1; AJvYcCU0z6WLVIXJcCNcALnIjOxC4eIHv2+dRYmtn+uZcBGimhrk8X9ZVT55uNO1t+ZSZ6ANjowUZPI9nlRoAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFh2DZLM2hRjmjK2kJ0EIDBn48fCOpFcFz48TcIJZ8o+DzWEa/
	mfdW2XubPj9IR5Ik9KDbJFZWRYgMlOOXxy3ikDlxWdzYMAcNvD5AI3R4NOVadM7NVmH5wM4p+Gs
	huNAKiC2FtcPOgawjyit4hpWF6hqJCe3wscw94/SaqDbz4RCWlmjOOwmPZnwGnwrane6cXhQTEd
	Y14pwxQMU4thL+FiRwEPDhlB53HYsGH78a4lIrZsTJEGopvio0eZvSgw==
X-Gm-Gg: ASbGncudFBW8p+WaEy385R4iyYfQlXGERUOsZ2h9yBw4afXfC6lf8UJw82EiX7mFDuw
	UqjnDzAjvRuKZgE9yALNgA6T04bLegzalpaypMCMp3Xq8ZS1j0PEUDPwt1xXRqy5T05uo7ug=
X-Received: by 2002:a17:90b:2812:b0:2fe:6942:370e with SMTP id 98e67ed59e1d1-3014e814787mr282598a91.7.1741884071601;
        Thu, 13 Mar 2025 09:41:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZSR0GKOgpT9qIwRRXIxVMEVNcO4hzEa3HpTc2cVefBnUNShY5U2qKEnTkHJXaXXzQjc2Wb29JilB9GlX1pNU=
X-Received: by 2002:a17:90b:2812:b0:2fe:6942:370e with SMTP id
 98e67ed59e1d1-3014e814787mr282561a91.7.1741884071208; Thu, 13 Mar 2025
 09:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250313114329.284104-1-acarmina@redhat.com> <20250313114329.284104-8-acarmina@redhat.com>
 <20250313122503.GA7438@willie-the-truck>
In-Reply-To: <20250313122503.GA7438@willie-the-truck>
From: Alessandro Carminati <acarmina@redhat.com>
Date: Thu, 13 Mar 2025 17:40:59 +0100
X-Gm-Features: AQ5f1JoRjBn0wYL3TNCgo2Be9gEw3kQ3UV-S3_DQ-XzPf4lVXAvFHPCcZEOjQyQ
Message-ID: <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning backtraces
To: Will Deacon <will@kernel.org>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>, 
	Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>, 
	Arthur Grillo <arthurgrillo@riseup.net>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Guenter Roeck <linux@roeck-us.net>, Alessandro Carminati <alessandro.carminati@gmail.com>, 
	Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org, 
	kunit-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	loongarch@lists.linux.dev, x86@kernel.org, 
	Linux Kernel Functional Testing <lkft@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SxNhLuzSdmqVYe7DONr3PNKby09xRX1I2rLWi9F6qUY_1741884072
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_094116_319754_EE1C8D3D 
X-CRM114-Status: GOOD (  18.30  )
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

SGVsbG8gV2lsbCwKCk9uIFRodSwgTWFyIDEzLCAyMDI1IGF0IDE6MjXigK9QTSBXaWxsIERlYWNv
biA8d2lsbEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTWFyIDEzLCAyMDI1IGF0IDEx
OjQzOjIyQU0gKzAwMDAsIEFsZXNzYW5kcm8gQ2FybWluYXRpIHdyb3RlOgo+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vYnVnLmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNt
L2J1Zy5oCj4gPiBpbmRleCAyOGJlMDQ4ZGIzZjYuLjA0NGM1ZTI0YTE3ZCAxMDA2NDQKPiA+IC0t
LSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vYnVnLmgKPiA+ICsrKyBiL2FyY2gvYXJtNjQvaW5j
bHVkZS9hc20vYnVnLmgKPiA+IEBAIC0xMSw4ICsxMSwxNCBAQAo+ID4KPiA+ICAjaW5jbHVkZSA8
YXNtL2FzbS1idWcuaD4KPiA+Cj4gPiArI2lmZGVmIEhBVkVfQlVHX0ZVTkNUSU9OCj4gPiArIyBk
ZWZpbmUgX19CVUdfRlVOQyAgX19mdW5jX18KPiA+ICsjZWxzZQo+ID4gKyMgZGVmaW5lIF9fQlVH
X0ZVTkMgIE5VTEwKPiA+ICsjZW5kaWYKPiA+ICsKPiA+ICAjZGVmaW5lIF9fQlVHX0ZMQUdTKGZs
YWdzKSAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+IC0gICAgIGFzbSB2b2xhdGlsZSAo
X19zdHJpbmdpZnkoQVNNX0JVR19GTEFHUyhmbGFncykpKTsKPiA+ICsgICAgIGFzbSB2b2xhdGls
ZSAoX19zdHJpbmdpZnkoQVNNX0JVR19GTEFHUyhmbGFncywgJWMwKSkgOiA6ICJpIiAoX19CVUdf
RlVOQykpOwo+Cj4gV2h5IGlzICdpJyB0aGUgcmlnaHQgYXNtIGNvbnN0cmFpbnQgdG8gdXNlIGhl
cmU/IEl0IHNlZW1zIGEgYml0IG9kZCB0bwo+IHVzZSB0aGF0IGZvciBhIHBvaW50ZXIuCgpJIHJl
Y2VpdmVkIHRoaXMgY29kZSBhcyBsZWdhY3kgZnJvbSBhIHByZXZpb3VzIHZlcnNpb24uCkluIG15
IHJldmlldywgSSBjb25zaWRlcmVkIHRoZSBjYXNlIHdoZW4gSEFWRV9CVUdfRlVOQ1RJT04gaXMg
ZGVmaW5lZDoKSGVyZSwgX19CVUdfRlVOQyBpcyBkZWZpbmVkIGFzIF9fZnVuY19fLCB3aGljaCBp
cyB0aGUgbmFtZSBvZiB0aGUKY3VycmVudCBmdW5jdGlvbiBhcyBhIHN0cmluZyBsaXRlcmFsLgpV
c2luZyB0aGUgY29uc3RyYWludCAiaSIgc2VlbXMgYXBwcm9wcmlhdGUgdG8gbWUgaW4gdGhpcyBj
YXNlLgoKSG93ZXZlciwgd2hlbiBIQVZFX0JVR19GVU5DVElPTiBpcyBub3QgZGVmaW5lZDoKX19C
VUdfRlVOQyBpcyBkZWZpbmVkIGFzIE5VTEwuIEluaXRpYWxseSwgSSBjb25zaWRlcmVkIGl0IGxp
dGVyYWwgMCwKYnV0IGFmdGVyIGludmVzdGlnYXRpbmcgeW91ciBjb25jZXJuLCBJIGZvdW5kOgoK
YGBgCiQgZWNobyAtRSAiI2luY2x1ZGUgPHN0ZGlvLmg+XG4jaW5jbHVkZSA8c3RkZGVmLmg+XG5p
bnQgbWFpbigpCntcbnJldHVybiAwO1xufSIgfCBhYXJjaDY0LWxpbnV4LWdudS1nY2MgLUUgLWRN
IC0gfCBncmVwIE5VTEwKI2RlZmluZSBOVUxMICgodm9pZCAqKTApCmBgYAoKSSByZWFsaXplZCB0
aGF0IE5VTEwgaXMgYWN0dWFsbHkgYSBwb2ludGVyIHRoYXQgaXMgbm90IGEgbGluayB0aW1lCnN5
bWJvbCwgYW5kIHVzaW5nIHRoZSAiaSIgY29uc3RyYWludCB3aXRoIE5VTEwgbWF5IHJlc3VsdCBp
biB1bmRlZmluZWQKYmVoYXZpb3IuCgpXb3VsZCB0aGUgZm9sbG93aW5nIGFsdGVybmF0aXZlIGRl
ZmluaXRpb24gZm9yIF9fQlVHX0ZVTkMgYmUgbW9yZSBjb252aW5jaW5nPwoKYGBgCiNpZmRlZiBI
QVZFX0JVR19GVU5DVElPTgogICAgI2RlZmluZSBfX0JVR19GVU5DIF9fZnVuY19fCiNlbHNlCiAg
ICAjZGVmaW5lIF9fQlVHX0ZVTkMgKHVpbnRwdHJfdCkwCiNlbmRpZgpgYGAKTGV0IG1lIGtub3cg
eW91ciB0aG91Z2h0cy4KCj4KPiBXaWxsCj4KCgoKLS0KLS0tCjE3MgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
