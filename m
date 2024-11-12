Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22A4D42BAC
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 16:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZmLBJuExtRiDd7iBV/iL6Z26pXJxaBvAze33Yhunx8=; b=c9j9wynAiwGb1M
	oeJQiKVvf5JdBhTyjRytmTvjqvIUq3C2bo4XmXdDLHwPC42S81doW0LgTmC8W4yB9KEAtFdVJ8cH3
	rbc7bxdDIvBjcbZ1wwJhOJZBY62kMQ77xdbuzq3uj0MTHUT+lMvy75On6uSLoVWLKTCmzfqGQUft0
	HtN/8hme9JjmxQxNehI+DcML31tdpXsYUxvc+pU2uLDr8UMWg07bVQWLTYdps5u1c2cO+7BVb+Gti
	7Z27AYTluh8WKW8AxXvJQjP8p9czz4jnc5j4/ZxqrZbI2hIaT4MFu9Ypuo0uf+JgvuoVl9Cg9ui2d
	WZeKaobtk2ZYOwoJHZAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAu2p-00000004ClT-2aSL;
	Tue, 12 Nov 2024 16:47:11 +0000
Received: from mail-yb1-f179.google.com ([209.85.219.179])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAu06-00000004CJA-0PRe
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 16:44:23 +0000
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e30d821c3e0so5576614276.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Nov 2024 08:44:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731429860; x=1732034660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zTjZnNxgN7bW2/C60743NYitcoHzCR9nvm3BqV+HmI=;
        b=hVaQW3s01sXPq1dzZYzkk5VbrP9IswfuAQ6r4oWUiWzajNhNx90kt++zUOvuwix228
         jCnIsZfQ05dOo0p/GjUbAM5Oc24GGElspJFRhd0q8BkAXHx87F8QawtyD6npF7YiuBRx
         cu2GtjKouCupzUc21HPm8kmUgjZ/gx+FsYQUSc5/bZ6SM4gJq/Xzq9rHrs9lyzNutnyA
         gt3/Y1lN8QroOEFhGJFVVHCD8qpUJI2YkfJUmwPCbn7U+gyRbgPe3rs8sZQxIu4Yv4Rv
         Upp8UEBKTxI1f/SpgQls92cqEjKrMH4sDEzI9LZBhIlT1Eo183zFAByctIJBwxCNNScK
         am7A==
X-Forwarded-Encrypted: i=1; AJvYcCVFRMG3ICe0Rb3KBjIsBht6N0wSU1gqy8tcj6FX0B+vmw9qUgDgjFK9rySbmBaLnO3l7RR1BzEih5h+sg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRofy6TDQaN8kOB0yCSfcbU005MoK7WGMbD5kis2KZPjg53SJH
	p+wMHmpJPWPnz0pbvU9ex/e29HFO6wZf0R86SWTGxFLQ71XtT5yN5R7MpmKu
X-Google-Smtp-Source: AGHT+IEP2PwovW5Xj3d0xAYPFFvynIjWqLLqyB9JRC10x0KgFFQ18exhIZgP23y/HuOyXjAIEEx+cQ==
X-Received: by 2002:a05:690c:4d43:b0:6ea:98d8:a61 with SMTP id 00721157ae682-6eaddf8ad22mr184504607b3.28.1731429859958;
        Tue, 12 Nov 2024 08:44:19 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eaf7befa6csm16118857b3.116.2024.11.12.08.44.19
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 08:44:19 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e35e9e993f9so321143276.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Nov 2024 08:44:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTh6Nak7YqPSwI2LaVmvWh8WNLmw8vzLtF0DxJBdCsue8MN/2bhEWRe87lQnbMlBNAChH88a/jKRwERQ==@lists.infradead.org
X-Received: by 2002:a05:690c:c93:b0:6e3:3336:7932 with SMTP id
 00721157ae682-6eaddf8dc3emr154639957b3.27.1731429859569; Tue, 12 Nov 2024
 08:44:19 -0800 (PST)
MIME-Version: 1.0
References: <1097d054ed4c67f714679de1253e45a034e647a0.1731425416.git.geert+renesas@glider.be>
 <338c06d8-627e-4ca9-b5d0-6ce87b5cc83c@sifive.com>
In-Reply-To: <338c06d8-627e-4ca9-b5d0-6ce87b5cc83c@sifive.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Nov 2024 17:44:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-MV1W2MBV0WQuXkEU-qvfbsb_pcAFrHCGWUFT7TYd6Q@mail.gmail.com>
Message-ID: <CAMuHMdX-MV1W2MBV0WQuXkEU-qvfbsb_pcAFrHCGWUFT7TYd6Q@mail.gmail.com>
Subject: Re: [PATCH] irqchip: THEAD_C901_ACLINT_SSWI should depend on ARCH_THEAD
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_084422_196845_4149FA7E 
X-CRM114-Status: GOOD (  16.98  )
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

SGkgU2FtdWVsLAoKT24gVHVlLCBOb3YgMTIsIDIwMjQgYXQgNTozOOKAr1BNIFNhbXVlbCBIb2xs
YW5kCjxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPiBPbiAyMDI0LTExLTEyIDk6
MzEgQU0sIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+IFRoZSBULUhFQUQgQUNMSU5UIFMt
bW9kZSBJUEkgSW50ZXJydXB0IENvbnRyb2xsZXIgaXMgb25seSBwcmVzZW50IG9uCj4gPiBULUhF
QUQgU29Dcy4gIEhlbmNlIGFkZCBhIGRlcGVuZGVuY3kgb24gQVJDSF9USEVBRCwgdG8gcHJldmVu
dCBhc2tpbmcKPgo+IFRoaXMgaXMgbm90IGNvcnJlY3QuIFRoaXMgaW50ZXJydXB0IGNvbnRyb2xs
ZXIgaXMgcGFydCBvZiB0aGUgVC1IRUFEIENQVSBJUCwgc28KPiBpdCBpcyBpbmNsdWRlZCBpbiBT
b0NzIGZyb20gb3RoZXIgdmVuZG9ycyAoQWxsd2lubmVyLCBTb3BoZ28sIGV0Yy4pIHRoYXQgdXNl
Cj4gVC1IRUFEIENQVXMgYXMgd2VsbC4KCkluIHRoYXQgY2FzZSBJIGFtIHdpdGhkcmF3aW5nIHRo
aXMgcGF0Y2guClRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uIQoKR3J7b2V0amUsZWV0aW5nfXMs
CgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5v
cmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJ
IGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
