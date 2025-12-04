Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BE5D20690
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 13:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5VHRKd/ZpXG1icr8F1XimXkxhM2yqoCbGlYIQ9b2H1c=; b=aweeuvY3sPPc3K
	JjBgHhX+XFPiMB5f6l62PjqqAL/26DMQagF7QKiTMrBKQ4mUoW2XH+k1wrYVNF8h6SR5AUIID7GC0
	iGc3jidRlEDWWy9phOxOoRLzlL8pDj02DEdKxMoyqp8OO4V+Sojtx/s6E+W5InnyG8GiP2Gcgjkx4
	2dhXsV10pbUfoINu+Azas8n2h/mGRpnd+wU0+O+db+t7grhDY9NhQJVOWLYO4sB4cpdIijuuV3btq
	Y2dWhRiANjk1T0CjYDsr/uPZW2bnIbcFiwbkZEkdC9fYkgG/PDo2ciEjdHvmNSsyOVxh0J9lfkiJu
	0JOOuM32ZKI0rqxilXGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9NJ-000000083gU-2lER;
	Thu, 04 Dec 2025 13:28:01 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR9NG-000000083fu-43zr
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 13:28:00 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6597a87048bso486232eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Dec 2025 05:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764854877; x=1765459677; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRNI2GngROAbMHhooaeidrwp91WrmVmozMVfUeKXecU=;
        b=nCLdYSeEqnGvrcvxZH7vjLXGLYQN31HsO2SJ8ItJZjI3XWYKnceWh7d3yQskzlQ8GC
         2vHsreU6I8vixmVSOzw7ek1xtXB+mZE3eTlUYLtE24Pl3kXw/UB6rdO5nF7eYn4RLQSR
         OYVaP6W6lTmnyJg1jVwscFZfPxvdvwi11eA5RiB7UXzQRQlH0NqL8MhI+wl/uVG1TC+V
         TvTlbD2Un1AXlqmFoh6WZZcb+75G/CTV5GS3YuK+SRW0iWH6GI69YI5LX5yNZq0sgn/R
         2v8BWAGmO8YAz0M4Fj6CNiK6koyuq8OxGm2f6zca+sX3Mh92FgUh4lH8DkOHo582FiV1
         rYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764854877; x=1765459677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TRNI2GngROAbMHhooaeidrwp91WrmVmozMVfUeKXecU=;
        b=FOmgFt++8DCr2deRUusrx0r64qPfM0cMzusYy/TuuKUrmMLMI1RNdFv3SRRESVNfse
         0AlR77zKeun8lzz55po/O2AzigtXgK8pafQmaf4MqVV54uXjdj2tabXpavYOhO4efJu1
         cd6qpLG+jcYD9MHNdNm5sq8KftYFrmbLtvCtmK2gGuuvMMV5P5R/jNKKLrUuf6RBTgNE
         Szj9b78EypOZajHjfCQB6Zd8gadQFO1z+DDo889tmQPACmI0fULy704zOQHfqtgImqHz
         KmwasxcU6ywtZol+8UETCMlY/m1EhrL41f9YBGwwqRKkPKDb3cxL+2Ypg0WS29vAspdy
         N1iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLDP6Ful4R+XyY+GsK+aHPME95xXtedP52mAPo4HLbaFhcX3gyp5q5n8wn7S3+Xs13W8uae6tU+3QJvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZhvCfenjoX5LdUCrywiKDFgYr4SKgxyEQIsoN75HfBdXsgQoz
	w3HL/cZqslIdRlzKlZln6EHr6tp7pLUIdjOi1DaMfC3CTDdRcBKWhiShLkr8caV48P3YZECW6Ry
	7iYlepmH5Q9ZosXcqeANP8+wtGTXeIUN4Is45eF0vCg==
X-Gm-Gg: ASbGncv6JF0Fxd5EsPZ1RFgiPsn9E3iCeU2NFIhW4HuXCsB6oBc61exA9RtnQiT8lN8
	xy2hTC+NdxM7P5OBWI5RUTECFAZaPlh52gk0f2odq1uGM46GJMTNjJONcPa3UTvSRD/flso3jjw
	ZGhINdh+3qrP64Eck+v7mclCHyfaTw4y0JHq7chn4Br8Um3ki/a55Zy2fj23KRtCIxYBVAX3UuG
	yE/XpC+zeklo5AXLIIzCNmE3ngxduX3gvdSHVcVp8QCq9QVTRf31O0nNNknwLccfQCTEnOls8/n
	6cWde8m5dG7ZAGDnIHAlDKBMPOxZ9vgA10ul
X-Google-Smtp-Source: AGHT+IFE0WHEsoH4r/5yGkoBCcbCLiaOv8+DdubyNxb7JgCyTy3EXLKNZPZtGfXilMxcjQUuTBPNLLSzQQGQpDdkiAs=
X-Received: by 2002:a05:6820:2289:b0:657:5f19:55fa with SMTP id
 006d021491bc7-6597b4d8098mr1587072eaf.3.1764854877385; Thu, 04 Dec 2025
 05:27:57 -0800 (PST)
MIME-Version: 1.0
References: <20251204101730.1036671-1-arnd@kernel.org>
In-Reply-To: <20251204101730.1036671-1-arnd@kernel.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 4 Dec 2025 14:27:46 +0100
X-Gm-Features: AWmQ_blmiz1umR-cV_gCGB3wL15iwJgHmYeYQznK94DqSfYPLJnQazL36er0_uo
Message-ID: <CAHUa44H1Ejbbuzr1hF1HrT69JGgnvfkkDkh+9KvEvBT+eWBDhw@mail.gmail.com>
Subject: Re: [PATCH] tee: fix tee_ioctl_object_invoke_arg padding
To: Arnd Bergmann <arnd@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Sumit Garg <sumit.garg@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Etienne Carriere <etienne.carriere@foss.st.com>, Randy Dunlap <rdunlap@infradead.org>, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_052759_014860_3AEF9EB5 
X-CRM114-Status: GOOD (  23.22  )
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

SGksCgpPbiBUaHUsIERlYyA0LCAyMDI1IGF0IDExOjE34oCvQU0gQXJuZCBCZXJnbWFubiA8YXJu
ZEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+Cj4KPiBUaGUgdGVlX2lvY3RsX29iamVjdF9pbnZva2VfYXJnIHN0cnVjdHVyZSBoYXMgcGFk
ZGluZyBvbiBzb21lCj4gYXJjaGl0ZWN0dXJlcyBidXQgbm90IG9uIHg4Ni0zMiBhbmQgYSBmZXcg
b3RoZXJzOgo+Cj4gaW5jbHVkZS9saW51eC90ZWUuaDo0NzQ6MzI6IGVycm9yOiBwYWRkaW5nIHN0
cnVjdCB0byBhbGlnbiAncGFyYW1zJyBbLVdlcnJvcj1wYWRkZWRdCj4KPiBJIGV4cGVjdCB0aGF0
IGFsbCBjdXJyZW50IHVzZXJzIG9mIHRoaXMgYXJlIG9uIGFyY2hpdGVjdHVyZXMgdGhhdCBkbwo+
IGhhdmUgaW1wbGljaXQgcGFkZGluZyBoZXJlIChhcm02NCwgYXJtLCB4ODYsIHJpc2N2KSwgc28g
bWFrZSB0aGUgcGFkZGluZwo+IGV4cGxpY2l0IGluIG9yZGVyIHRvIGF2b2lkIHN1cnByaXNlcyBp
ZiB0aGlzIGxhdGVyIGdldHMgdXNlZCBlbHNld2hlcmUuCj4KPiBGaXhlczogZDViOGIwZmExNzc1
ICgidGVlOiBhZGQgVEVFX0lPQ1RMX1BBUkFNX0FUVFJfVFlQRV9PQkpSRUYiKQo+IFNpZ25lZC1v
ZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4gVGhlIG5ldyBpbnRl
cmZhY2Ugc2hvd2VkIHVwIGluIDYuMTgsIGJ1dCBJIG9ubHkgY2FtZSBhY3Jvc3MgdGhpcyBhZnRl
cgo+IHRoYXQgd2FzIHJlbGVhc2VkLiBDaGFuZ2luZyBpdCBub3cgaXMgdGVjaG5pY2FsbHkgYW4g
QUJJIGNoYW5nZSBvbgo+IGFyY2hpdGVjdHVyZXMgd2l0aCB1bnVzdWFsIHBhZGRpbmcgcnVsZXMs
IHNvIHBsZWFzZSBjb25zaWRlciBjYXJlZnVsbHkKPiB3aGV0aGVyIHdlIHdhbnQgdG8gZG8gaXQg
dGhpcyB3YXkgb3Igbm90Lgo+Cj4gV29ya2luZyBhcm91bmQgdGhlIEFCSSBkaWZmZXJlbmNlcyB3
aXRob3V0IGFuIEFCSSBjaGFuZ2UgaXMgcG9zc2libGUsCj4gYnV0IGFkZHMgYSBsb3Qgb2YgY29t
cGxleGl0eSBmb3IgY29tcGF0IGhhbmRsaW5nLgoKVGhpcyBpcyBjdXJyZW50bHkgb25seSB1c2Vk
IGJ5IHRoZSByZWNlbnRseSBpbnRyb2R1Y2VkIHFjb210ZWUgYmFja2VuZApkcml2ZXIuIFNvIGl0
J3Mgb25seSB1c2VkIG9uIGEgZmV3IGFybTY0IFF1YWxjb21tIHBsYXRmb3JtcyByaWdodCBub3cu
CgpJIHRoaW5rIHdlIHNob3VsZCB0YWtlIHRoaXMgcGF0Y2gsIGJ1dCBsZXQncyBoZWFyIHdoYXQg
b3RoZXJzIHRoaW5rLgoKVGhhbmtzLApKZW5zCgo+IC0tLQo+ICBpbmNsdWRlL3VhcGkvbGludXgv
dGVlLmggfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L3RlZS5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L3RlZS5o
Cj4gaW5kZXggY2FiNWNhZGNhOGVmLi41MjAzOTc3ZWQzNWQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS91YXBpL2xpbnV4L3RlZS5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3RlZS5oCj4gQEAg
LTQ3MCw2ICs0NzAsNyBAQCBzdHJ1Y3QgdGVlX2lvY3RsX29iamVjdF9pbnZva2VfYXJnIHsKPiAg
ICAgICAgIF9fdTMyIG9wOwo+ICAgICAgICAgX191MzIgcmV0Owo+ICAgICAgICAgX191MzIgbnVt
X3BhcmFtczsKPiArICAgICAgIF9fdTMyIDozMjsKPiAgICAgICAgIC8qIG51bV9wYXJhbXMgdGVs
bHMgdGhlIGFjdHVhbCBudW1iZXIgb2YgZWxlbWVudCBpbiBwYXJhbXMgKi8KPiAgICAgICAgIHN0
cnVjdCB0ZWVfaW9jdGxfcGFyYW0gcGFyYW1zW107Cj4gIH07Cj4gLS0KPiAyLjM5LjUKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
