Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97874C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 23:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDfqk7w19CzlRs8e0sA8x2YA/panRvjIGznoKs3OAag=; b=lKs8LfUp2K8O4V
	+oWBc8BBOaetBLQ+/+If4S97ZzFxoHiVj8B3Djk5+PVSQ3ZbriGVwO7saE3LO8PKXbWOI1WHm1ueJ
	t14osgGIA61WULxdls4TAbZsJdOcPHJzUaj9uPhTBFDbkqSSC2uClU0YOI51KQNmmCikbv7ElgjE3
	8PY2cpWAtGoEzXHOqMLS1bF/zEkHNCBX6PiCsdyRiaNhX1yUH/xvymeZIhuI/oekIPgK+yKoQpV0E
	ncF1TgMtZJdAhetLoE176wmysQfL/Xl0T/HCZ6tj42YLmYd6B7qE+q/YcOROHpjGQ2wkfFF0n+EO5
	Vnb1LztsIXH+UPlnAmCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK4KF-00000002yBu-37Gt;
	Wed, 19 Jun 2024 23:02:47 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK4K6-00000002y6Z-35RX
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 23:02:45 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2c7cd2f077fso54728a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 16:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1718838153; x=1719442953; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dWkQUm9OfoeajTLTENIn0KJlC31Px5cJJWI4W24MQ0=;
        b=RUuEw66iH1o91t2FVdnhamiFYoamOdhux39zo5ACWLCOlvFD5r+bBMxNvLrr6zAR0B
         LXKXfnfCuJrqSqP7t04EpnPTvTEY5yCxRtWstOUMe/8LM5j90g9FOP6AOQWhLi2mf4dr
         6jUz3JKRWwYyinXZDBfhokPqg31j5D/hSnSpRtOrzsZcNOCYrJ5Zk51fJWEwnWxy/TDY
         XMrblNyGb4wHSH3QvNh5sHVLMdOIDw560g8OYXPX1HVhMRFFSyG45CRJx+qwpS2eptwY
         wPF1bsNQ2Djlv1F6HNTQRZZzcUlKQB++SlSxcMb07dvGdpy1NKMDyrGFp9wnlOeF8LUa
         svkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718838153; x=1719442953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dWkQUm9OfoeajTLTENIn0KJlC31Px5cJJWI4W24MQ0=;
        b=dZq2kvufI/72grPoghQ8btH7o5L1qyxOeYdcTXaewzUu8vryxPdkaPwqH7tGKfaDtd
         c21WnsEECwQpiuGkHcNgbSl1p6kyCmgiJRm7e5502wvomFEZy2R4tobfP2FrqwBfTQfx
         cFagKOrAB44GUfNb8pKo9itzbq337Hb9/vCFyC5WR9iqYxOEw/XhBQKw4M0l1LAnJzRG
         IBSWHuR/7TgapCj8wOyw021r4E3QNPTlE56qjOHgooVQHFEls65aSdlKEq0wcdLf0VfP
         xDTQq3H80PYqoN/dVw6zFKWH04VLl92SYCrRt5JFoqeDQEAAAjYwQ0p41I9j6hBR7eY1
         cXow==
X-Forwarded-Encrypted: i=1; AJvYcCVFXQ0JP6KhzqFslfKazhSX3Dtq4yoQd8k0VE5kKrr0fE0sr2/SS46zp2nfc1QAoq03wlvoLRQqg4/UNdsNv5Ph9OAwMHs6euE+cxU3CWa5
X-Gm-Message-State: AOJu0YyzMBD9NlUKxbUeUtKStvhRpcvwm9mklcZ/U0f1ZY9pIKj5geQF
	3lhnp2RcI3+FtRGTZuGnrmUBfFHhHNXYcozb8RwM79pRYT3kBi8ekeHt1+ajq0n1SvYUY96w8rS
	6Byf9zq9TQzX2hyhz3Qp6flObFerrUN1FEbOR
X-Google-Smtp-Source: AGHT+IFp9XjlaNwKpDcHheqgWJaXZAWTOxzQ7d7NnVWmLR8GKXgj3RDZPizKzrUy0sHdB8foZjeJ62eKyxCGWbss+Ro=
X-Received: by 2002:a17:90b:3113:b0:2c4:cd15:3e4b with SMTP id
 98e67ed59e1d1-2c7b5db2a79mr3640661a91.4.1718838152744; Wed, 19 Jun 2024
 16:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240616170553.2832-1-jszhang@kernel.org> <20240616170553.2832-3-jszhang@kernel.org>
In-Reply-To: <20240616170553.2832-3-jszhang@kernel.org>
From: Cyril Bur <cyrilbur@tenstorrent.com>
Date: Thu, 20 Jun 2024 09:02:20 +1000
Message-ID: <CANtDSirgLW2_QCOO7kLLotONcgnYC_mHOxW3=-2d+FJ3FfBduQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] riscv: avoid corrupting the RAS
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_160238_983712_8D86B45B 
X-CRM114-Status: GOOD (  17.10  )
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

T24gTW9uLCBKdW4gMTcsIDIwMjQgYXQgMzoyMeKAr0FNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBJbnNwaXJlZCBieVsxXSwgIm1vZGlmeWluZyB0aGUgcmV0
dXJuIGFkZHJlc3Mgb2YgdG8gcG9pbnQgdG8KPiByZXRfZnJvbV9leGNlcHRpb24gd2lsbCBjb3Jy
dXB0IHRoZSBSQVMiLCBzbyBtb2RpZnkgdGhlIGNvZGUKPiB0byByZW1vdmUgdGhlIGNvZGUgb2Yg
bW9kaWZ5aW5nIHJhLgo+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlz
Y3YvMjAyNDA2MDcwNjEzMzUuMjE5NzM4My0xLWN5cmlsYnVyQHRlbnN0b3JyZW50LmNvbS8gWzFd
Cj4gU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgoKSSd2
ZSBydW4gdGhpcyBhbmQgaXQgaXMgdGhlIHNhbWUgaWRlYSB0aGF0IEFudG9uIHVzZWQgaW4gdGhl
IHByZXZpb3VzIHBhdGNoClJldmlld2VkLWJ5OiBDeXJpbCBCdXIgPGN5cmlsYnVyQHRlbnN0b3Jy
ZW50LmNvbT4KCj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgfCA0ICsrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50
cnkuUwo+IGluZGV4IGM5MzM0NjBlZDNlOS4uODFkZWM2MjdhOGQ0IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5T
Cj4gQEAgLTIzNSw4ICsyMzUsOCBAQCBTWU1fQ09ERV9TVEFSVChyZXRfZnJvbV9mb3JrKQo+ICAg
ICAgICAgamFsciBzMAo+ICAxOgo+ICAgICAgICAgbW92ZSBhMCwgc3AgLyogcHRfcmVncyAqLwo+
IC0gICAgICAgbGEgcmEsIHJldF9mcm9tX2V4Y2VwdGlvbgo+IC0gICAgICAgdGFpbCBzeXNjYWxs
X2V4aXRfdG9fdXNlcl9tb2RlCj4gKyAgICAgICBjYWxsIHN5c2NhbGxfZXhpdF90b191c2VyX21v
ZGUKPiArICAgICAgIGogcmV0X2Zyb21fZXhjZXB0aW9uCj4gIFNZTV9DT0RFX0VORChyZXRfZnJv
bV9mb3JrKQo+Cj4gICNpZmRlZiBDT05GSUdfSVJRX1NUQUNLUwo+IC0tCj4gMi40My4wCj4KPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
