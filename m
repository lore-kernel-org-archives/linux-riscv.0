Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11272C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 12:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lXAwMN8TUQ3bWMctw1YvhPYcLykOOaTTK8ICEDrLc1A=; b=oXp+fN8N7hLpyvUCYHVKf+AOD8
	gQuAUt5hpgL2fwnuAZlVcILZjp1TiFVTX5y3Aa/hafSYM5zvwpdSmL0NW+buICHQXi5HzhcvYn7aY
	tSH/hq3qz34tWJ1QK+yusnX5MUUXIFJVwEIve5xNJ1+xlYlFkUeCOfBFa1iXIH8wvE7r4EUP4w9E0
	jHFtdOiZX0PyjhWIu6mROFgLjeELMYBG1el1nq6BupNuYfrhxnn0OHqKwIVHEV/aPNGIGiUNl/V7X
	Zef8k+JO+b4vYPqA1EBNFAEZZfxfrODhHrLFk6jIqY3hX0KL/aFpZuxZ+JtprQBrqCSD9JGAK0i6e
	Xfx7nYZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZps-0000000EwdX-1Vzj;
	Mon, 27 May 2024 12:52:20 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZpq-0000000Ewav-0mot
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 12:52:19 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-24c9f297524so1824351fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 May 2024 05:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1716814330; x=1717419130; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VNs4oFMLk5Bxve1lZWNZ/kvg56aSZ6dBKt3FEfaoOw=;
        b=EUVgyZytWYn0N5IvRf8Ja+T7z8X0LHbPqa6BnBLpo0cRKe9r4jYWtf52oGnNCZO8Az
         iD0VHTBg8eXUxkMO+V+DTkR37D4J4UXACjcuF8GjLZREftKwDDCg2ORd2UnfxmK/pgO/
         MLlTdFlGWiivJ4W2iB9gXBV32WAvt7gXRnniowWmt4S7H/eNxtRAK8zW+6/6iHDfremC
         aa1jjig+nB8tFiO5oqrUXm61Y0aWOEmOPi5fwflvMpBPgRlteVM6Cdnc0Xg7cpGy5EW5
         xPGOBGuowVQ6pOvUuFpsxEI11JS3TJkuD6+aCoIhGNSFoWktF/EGcsX0q6LFjnB171Tl
         pDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814330; x=1717419130;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VNs4oFMLk5Bxve1lZWNZ/kvg56aSZ6dBKt3FEfaoOw=;
        b=DwD8LxUn6Nnyncb68x37TufLpRyYN0yjSnJIkEx+CZXnF1yPJfNB9Ub+UojVrw3Paf
         1QE0EZtXlfYT9p0JzxxaMp5pUnNW6aCFsqqURFKRnT1W3GY8Fj+9Ve4kI3iKhCsbUKnY
         NTCU31qOAft+ysg/WQPDvt0EXLbGuJokvAoRf5mu/SjwPl7YmCZN7W+au0ohYwtEhHzw
         8ahJAVr8HrUUeWpat/bA/cISk7+3VUH3VFBMQZUR26gdx6GYizw+rBYHdy7hNs/9I9hr
         UtIIMmkg57gjQ0lf11fS/zSO8+HhP81TXwT3xIsifElWDqfM6b9tDdYCpGe/wbCdKXq5
         iABQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQA64Sx4YJXBH8k4+BIvjzS1xes5TB44IFixjo29LWgZHkY5sb65SZJK+bHWQ9LB7aMi3z8XQeb+MwGn2Vu8ssziRLk1SVqtA3PCKdtoF5
X-Gm-Message-State: AOJu0YxZn79sAoE931JxjTblClaICTfrYbaqfVyDAyx9NWvSujlTXM2J
	r7f+tKBrQc8V7IYYQ98J9SeT16l4wJzzy8kAHR1OULTBLUu6r4lP9Nib8afZhd4rIqVYr6ldcb5
	NuQWLQDVkB3G7duy+d+54+YEoqtd4HOd4XMWRig==
X-Google-Smtp-Source: AGHT+IFVFWgWxhliY5IXKCFKP9m7cDXkraybWH9+iqYWLKMEa+9I0GGRzLeE9MBVs6oZk8aZlQsaGyKMaOogBnll8yY=
X-Received: by 2002:a05:6870:1495:b0:24f:eced:8a38 with SMTP id
 586e51a60fabf-24fecedcff3mr4083403fac.56.1716814329558; Mon, 27 May 2024
 05:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240523111322.19243-1-cuiyunhui@bytedance.com> <20240523111322.19243-3-cuiyunhui@bytedance.com>
In-Reply-To: <20240523111322.19243-3-cuiyunhui@bytedance.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 27 May 2024 20:51:58 +0800
Message-ID: <CAEEQ3wnE+8FXXf76zapqNnC5vruoR9C-y0qjjFw47cHYP57MmQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 3/3] RISC-V: Select ACPI PPTT drivers
To: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	sunilvl@ventanamicro.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, bhelgaas@google.com, james.morse@arm.com, 
	jeremy.linton@arm.com, Jonathan.Cameron@huawei.com, pierre.gondois@arm.com, 
	sudeep.holla@arm.com, tiantao6@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_055218_250116_4E3C470C 
X-CRM114-Status: GOOD (  11.50  )
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

SGkgUGFsbWVyLAoKR2VudGxlIHBpbmcgLi4uCgpPbiBUaHUsIE1heSAyMywgMjAyNCBhdCA3OjEz
4oCvUE0gWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gQWZ0
ZXIgYWRkaW5nIEFDUEkgc3VwcG9ydCB0byBwb3B1bGF0ZV9jYWNoZV9sZWF2ZXMoKSwgUklTQy1W
IGNhbiBidWlsZAo+IGNhY2hlaW5mbyB0aHJvdWdoIHRoZSBBQ1BJIFBQVFQgdGFibGUsIHRodXMg
ZW5hYmxpbmcgdGhlIEFDUElfUFBUVAo+IGNvbmZpZ3VyYXRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5
OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiBSZXZpZXdlZC1ieTogSmVy
ZW15IExpbnRvbiA8amVyZW15LmxpbnRvbkBhcm0uY29tPgo+IFJldmlld2VkLWJ5OiBTdWRlZXAg
SG9sbGEgPHN1ZGVlcC5ob2xsYUBhcm0uY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L0tjb25maWcg
fCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gaW5kZXggZjk2MTQ0OWNh
MDc3Li5hOWViZWNkNzIwNTIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gKysr
IGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gQEAgLTE0LDYgKzE0LDcgQEAgY29uZmlnIFJJU0NWCj4g
ICAgICAgICBkZWZfYm9vbCB5Cj4gICAgICAgICBzZWxlY3QgQUNQSV9HRU5FUklDX0dTSSBpZiBB
Q1BJCj4gICAgICAgICBzZWxlY3QgQUNQSV9SRURVQ0VEX0hBUkRXQVJFX09OTFkgaWYgQUNQSQo+
ICsgICAgICAgc2VsZWN0IEFDUElfUFBUVCBpZiBBQ1BJCj4gICAgICAgICBzZWxlY3QgQVJDSF9E
TUFfREVGQVVMVF9DT0hFUkVOVAo+ICAgICAgICAgc2VsZWN0IEFSQ0hfRU5BQkxFX0hVR0VQQUdF
X01JR1JBVElPTiBpZiBIVUdFVExCX1BBR0UgJiYgTUlHUkFUSU9OCj4gICAgICAgICBzZWxlY3Qg
QVJDSF9FTkFCTEVfU1BMSVRfUE1EX1BUTE9DSyBpZiBQR1RBQkxFX0xFVkVMUyA+IDIKPiAtLQo+
IDIuMjAuMQo+CgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
