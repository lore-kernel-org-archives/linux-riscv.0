Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B362C48BF6
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 14:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0xRZshg8ShU51iPKv+UxJ0F5KxTHHE3t/V0dPrGdfo=; b=m8z//j7CozZf+Q
	erLABc6lH/G6yKtnfmNyK8rXKIGrKROKvBQWIMNdX6Y+B9Y7IobB016+W4B6BsFfppfULIFrKqb6m
	GcHhIFH5VFvbmWeWdNDrXI3Ui39cq7C+3Ad+2xkE7269mDKtnsoEKmTASODfB4XWsQZJ8B2RcPz5a
	2UxGmvNIvS4ugqMIdDTUqLIQNJ31dVGmB/uARJC8Yl5pq5OrFAD7dyxskfevx2oiER73vK6OGYdQo
	WzFslFAl4nzXfjHquv1q97gO7JGlZ4f/mLXLDO6SRODIiy+U+99zCyIEBa6RtEwJGw5A6PddVJ9RT
	y9cmhvz7+PEYH22RzbhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcn9n-00000001AnF-2dyL;
	Wed, 21 Feb 2024 14:01:07 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcn9l-00000001Alu-0E9h
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 14:01:06 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so830240966b.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 06:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708524063; x=1709128863; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3caPR64aW0Svj0ZX8QTL9rwtxXC0T3Jv42aHF/VUGoU=;
        b=wm9MA+/r5jaHROX+/SvQSZEbfjhQqfnu9jTV0ln3qoz/ilMGSo+bvrbh11CYOHosun
         qu0cnAHE759qxVt6RYfX6d5HPXx2Jl+xqYr/PAdpA2Fe464kPQthvPlJjw/9TzaHLz38
         dsz49cfM00Q/+VLDKssHEAc8g7ofAEFJVwbMZlZyqhVpAzHSh4FOUvCtSy9tXWELadK5
         s22tcZUkdfN32vKUl24CmH1q7cC2X8Q3p4OMewN7DqZ6ZqGEqOU1eAj/ERBNv6v2u9IN
         gnowcDbGfz8rupe7tXhaSPJST4Wmuk5mQF6hLdcFVRBpFXXxTbjww6UUr5q/DBm2tt5o
         gCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708524063; x=1709128863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3caPR64aW0Svj0ZX8QTL9rwtxXC0T3Jv42aHF/VUGoU=;
        b=muqJcOF1Mt/+Vv+XOg9s0fKoJm54tRRstQ0dQrS+eQuSitsOUEMwqboZ0rQKpOIBiD
         X6v1dEN/j7m21NBhQ9/DRmLd9Rf/GIWhW2dZQ0bE2c9FKZy0OAMQ+GSW4R5NOnyvq7+w
         9PvO+s2n006XZNRdFqbaZ3dv/qQ5TQDc/klqMMxpBg56+Kv1TExv/Oz6+zMQDYj33ymN
         /qwGefYv+IxGUCtos5OFJqGDA+uYzgvX9O6FUw1A9f56nYUmUdJatnOajWq0QKaSxB5Y
         ESSQIV6acPm6saTXBgJe9WaBatOcmyyBJjjrTqddwPp51SW7u9eJWB6mBn8Azi19OCtt
         wX5g==
X-Gm-Message-State: AOJu0Yy191coJHnVT2VfHdVHY3UbOvlrHSGAvd3o/ardUoOxdAfuJUlg
	9M4KFriLKrUjvVeU55atkR1ZGpLsu/G2671jzj1Nk+CZnVwTIUK2pdA/23vDR+JFmmcQPVhPCd6
	wsdl4pVGhDhVSCagwQrSBFA15xlvVD8dvB0Ddvw==
X-Google-Smtp-Source: AGHT+IGWq07YBN/0D1Kwd3+FXXv8z5twwI8IjTPKU5ChXbfb9HGU6ARHkKhT7hS7EdZH4WB7xJFXUbF27VM8Q1T7lzc=
X-Received: by 2002:a17:906:b0d9:b0:a3d:2e0e:3f52 with SMTP id
 bk25-20020a170906b0d900b00a3d2e0e3f52mr13650667ejb.37.1708524062956; Wed, 21
 Feb 2024 06:01:02 -0800 (PST)
MIME-Version: 1.0
References: <tencent_E19FA1A095768063102E654C6FC858A32F06@qq.com>
In-Reply-To: <tencent_E19FA1A095768063102E654C6FC858A32F06@qq.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 21 Feb 2024 15:00:49 +0100
Message-ID: <CAHVXubg8NKBdeutbwrJh5hdZwhRFsgyTPknM=xUhV=VG+o2Lrw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: mm: fix NOCACHE_THEAD does not set bit[61] correctly
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Jisheng Zhang <jszhang@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Guo Ren <guoren@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_060105_344973_5BAAC3C1 
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

SGkgWWFuZ3l1LAoKT24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgNDowNOKAr0FNIFlhbmd5dSBDaGVu
IDxjeXlAY3l5c2VsZi5uYW1lPiB3cm90ZToKPgo+IFByZXZpb3VzIGNvbW1pdCBkYmZiZGEzYmQ2
YmYgKCJyaXNjdjogbW06IHVwZGF0ZSBULUhlYWQgbWVtb3J5IHR5cGUKPiBkZWZpbml0aW9ucyIp
IGZyb20gcGF0Y2ggWzFdIG1pc3NlZCBhIGA8YCBmb3IgYml0IHNoaWZ0aW5nLCByZXN1bHQgaW4K
PiBiaXQoNjEpIGRvZXMgbm90IHNldCBpbiBfUEFHRV9OT0NBQ0hFX1RIRUFEIGFuZCBsZWF2ZXMg
Yml0KDApIHNldCBpbnN0ZWFkLgo+IFRoaXMgcGF0Y2ggZ2V0IHRoaXMgZml4ZWQuCj4KPiBDaGFu
Z2VzIHNpbmNlIHYxOgo+ICogcmV3b3JkIGNvbW1pdCBtZXNzYWdlIGFuZCBhZGQgcmV2aWV3ZWQt
YnkKPgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwOTEy
MDcyNTEwLjI1MTAtMS1qc3poYW5nQGtlcm5lbC5vcmcvIFsxXQo+IEZpeGVzOiBkYmZiZGEzYmQ2
YmYgKCJyaXNjdjogbW06IHVwZGF0ZSBULUhlYWQgbWVtb3J5IHR5cGUgZGVmaW5pdGlvbnMiKQo+
IFNpZ25lZC1vZmYtYnk6IFlhbmd5dSBDaGVuIDxjeXlAY3l5c2VsZi5uYW1lPgo+IFJldmlld2Vk
LWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiBSZXZpZXdlZC1ieTogSmlzaGVuZyBa
aGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3BndGFibGUtNjQuaCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLTY0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtNjQuaAo+IGluZGV4IGI0
MjAxN2Q3NjkyNC4uYjk5YmQ2NjEwN2E2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGd0YWJsZS02NC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxl
LTY0LmgKPiBAQCAtMTM2LDcgKzEzNiw3IEBAIGVudW0gbmFwb3RfY29udF9vcmRlciB7Cj4gICAq
IDEwMDEwIC0gSU8gICBTdHJvbmdseS1vcmRlcmVkLCBOb24tY2FjaGVhYmxlLCBOb24tYnVmZmVy
YWJsZSwgU2hhcmVhYmxlLCBOb24tdHJ1c3RhYmxlCj4gICAqLwo+ICAjZGVmaW5lIF9QQUdFX1BN
QV9USEVBRCAgICAgICAgICAgICAgICAoKDFVTCA8PCA2MikgfCAoMVVMIDw8IDYxKSB8ICgxVUwg
PDwgNjApKQo+IC0jZGVmaW5lIF9QQUdFX05PQ0FDSEVfVEhFQUQgICAgKCgxVUwgPCA2MSkgfCAo
MVVMIDw8IDYwKSkKPiArI2RlZmluZSBfUEFHRV9OT0NBQ0hFX1RIRUFEICAgICgoMVVMIDw8IDYx
KSB8ICgxVUwgPDwgNjApKQo+ICAjZGVmaW5lIF9QQUdFX0lPX1RIRUFEICAgICAgICAgKCgxVUwg
PDwgNjMpIHwgKDFVTCA8PCA2MCkpCj4gICNkZWZpbmUgX1BBR0VfTVRNQVNLX1RIRUFEICAgICAo
X1BBR0VfUE1BX1RIRUFEIHwgX1BBR0VfSU9fVEhFQUQgfCAoMVVMIDw8IDU5KSkKPgo+IC0tCj4g
Mi40My4wCj4KCkkgZmVlbCBwcmV0dHkgY29uZmlkZW50IG9uIHRoaXMgb25lIDopCgpSZXZpZXdl
ZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKVGhhbmtzLAoK
QWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
