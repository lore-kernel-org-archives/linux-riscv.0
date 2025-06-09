Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B11C5B552
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 17:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GXIbfG9oaMNZHYnZrlmGLu//dkFxW0PW/Uda6PlxC8w=; b=0s8bs8ufVwJpzk
	a0o6WM5Lu4qjz7IoqhcYy24Ib4wkBz25hI7p+dS9GIXN4Y+tb1ZSYnBeu/sgrAlqiUJY+7jgpwGe3
	n8voWxhK1SYE/tTzL8QFWp3vM5nhHjIxMZiN2av/3mNIVN+i5Opw6A4aMN1KQI/X03L3kKytX68yc
	O1nnSPshcX+78PlqHtUWi0N0VViwGQeF0DbYs8eLuwFE1YMPa5Fq8+AqjdznyYKZ6SJPL70+NwhJC
	sE8bqjrVSBtjBE2bZDhbtuAQHtQQVQ9lTeX3wOBFTT6zn8lc/N6JrhchKnVo0Fiptaw5IuiwdIJ2N
	LdjhjXZ/IShx3/sq0ooA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgfS-00000004qbv-3LxN;
	Mon, 09 Jun 2025 17:52:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfYk-00000004iAH-0JWn
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 16:41:19 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-451d7b50815so39073275e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 09:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749487276; x=1750092076; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SS1ghkgByas5aSVYoAcXnpxd4fVUVMPVtRUUyrprOiI=;
        b=j5dCBRxN5Kor3tmdEZ/aTutPlZzyrRqV8nRpcg+XeClha8zpx+ZAV0n6ZdPa1Ro3Q5
         Y35tBAxTW/uft8ypfzRNAJqp2kYxPNH2gbazATh+YFc2q+kki9gccIYKmbxNatXEWX0T
         1zW92cEmPFR8cAJv9QyNcpsWI2A9rVjBCjKTmSET456psm9VsTD3lCP7NOWXK0ZHt+up
         f6fjWlPAXq4RaClqd2SUtY+yI+MAXdja0YhBHYSWCnxHsv7sEiHOOr6BwWh3epN3G/j+
         6cHO2Y+rdPFTb6AJ8ySJsw+zxwvq4RbSJTTbCf6mlCnAoY5ATJ6JKXQrg8gCLXDIeasW
         H6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749487276; x=1750092076;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SS1ghkgByas5aSVYoAcXnpxd4fVUVMPVtRUUyrprOiI=;
        b=CuLWf4mA1xtDaWwgLFoAWKwQUNRN/l5kKoabUkyNRtxDrj4Q14fPtoLpqRLD6ce5jk
         yHDf6mTdRprcbqnyFxgfHc38y0K8qbu4rSpqTFnfyfXu1LPBoc2Jxr3GP9rFchP3raWs
         EEqsum16eWuoF+lEa+3OkUjHojZsWauAdzW9GfchRbahKocsSFdNolO10LGDqQuJqpx2
         bFBaaozH8ncgDJkZUeHWYfcAHU4lAqCoCBLE6y0WCdsxETl21sQfiBwe8WFpMqM/vj1O
         aY5rQJlbUTb4ZYR5an7UZGXVumbQP/X9OCVafKV65HRLyEWpdIvPvrq0/bETG0ShA29K
         BHpA==
X-Forwarded-Encrypted: i=1; AJvYcCV3cVg/fyEl+c0bTx0GE6sG6FUsF8vBWa7TzY6rr9AvQgwvK39WWQMwc+6Oz0gfkxQLgAgjVwIiKA0DSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ7zkFqDLInf8LJPKInPQqQt07bw+OOEy3KCkmEcDgzoeqHY3B
	AybORXdx3AT3NMqz9kcBIcatcPYU7Nuswcb7nL2OXsjUkWk4UhAUpXRC
X-Gm-Gg: ASbGncsePnWjzGzONWDV3K4RIsCsFtR5i9eeVWkPI6BlcP/C9s/rgbVcJfiEoh/5a0y
	XSGLacYQLmd+BhNCy3lI7zW2dhKmrJez/3hGbR66Vr1Wnd0JUinbCBj9RLUWup4i7BzzGKEXQyc
	cVvNPkTPaxqbVxq7CPIVIwl567S8hFQk3fpuhM07FdBhDLnSJeHd4fdzJLh2JQRkkEwJP3ZseZ8
	QuHe6zM5XQtsLmzUrB6lgrVcDHW8rPV8NvFDqgitAGHfaJkbbW9TeMdzts7rerwraPa9hNgj4dP
	a7TtXJ6RCOKJJQDjXf8hsMRlQ1JGTL0WI28twBWrDehTpZN5WYT4o1sGQeRMD5nLL/V+kjf9ZLY
	RHhU9KL5qwfVUjJ8q
X-Google-Smtp-Source: AGHT+IE2ObE00bmXtNKeLj6UQ2w2+eAieeGAdLJ0M/xXCi/xaTy8JC6h8IF0f4vMWbYgt2AIXHQI2Q==
X-Received: by 2002:a05:6000:220d:b0:3a4:f744:e013 with SMTP id ffacd0b85a97d-3a531cb8521mr9854409f8f.30.1749487276093;
        Mon, 09 Jun 2025 09:41:16 -0700 (PDT)
Received: from giga-mm-5.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209bc6d50sm115775715e9.5.2025.06.09.09.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 09:41:15 -0700 (PDT)
Message-ID: <5a738b35e388f7c339b94e792a79d0d1b93d0345.camel@gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: dts: sophgo: add reset configuration for
 Sophgo CV1800 series SoC
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Chen
 Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti	 <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, Thomas
 Bonnefille	 <thomas.bonnefille@bootlin.com>, Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Date: Mon, 09 Jun 2025 18:41:16 +0200
In-Reply-To: <20250608232214.771855-5-inochiama@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
	 <20250608232214.771855-5-inochiama@gmail.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_094118_117183_5343EA10 
X-CRM114-Status: UNSURE (   6.88  )
X-CRM114-Notice: Please train this message.
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

T24gTW9uLCAyMDI1LTA2LTA5IGF0IDA3OjIyICswODAwLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+
IEFkZCBrbm93biByZXNldCBjb25maWd1cmF0aW9uIGZvciBleGlzdGVkIGRldmljZS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29tPgoKUmV2aWV3
ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4K
Cj4gLS0tCj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MHguZHRzaSB8IDE4ICsr
KysrKysrKysrKysrKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKCi0t
IApBbGV4YW5kZXIgU3ZlcmRsaW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
