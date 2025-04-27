Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55695C369D8
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Apr 2025 01:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+pvZwmIvxaY/QRzsuWdi4b6Eq3eOnuCwRfRrYGV73g=; b=ekwwN8lhLE5e5m
	t6XqmxNaYCovsErzf3FMDmoeC9aJAH5f5J4EE8NI6BY/JueS6cOlkTiljEhovUPjQFNZ4WhX3jjJg
	nJHpFIXoWHlYLDt6r1AGhGauLKVAUctVWfYabpYvEMvsNzChGdaOSFWF8N3feHB0v9n0Cgny8HK0S
	i4xrWtGmTBJpW9FrrjcivZbxy9uTIP56fpuQ2G3YkvUOSNPx80jjZd/HC+Adc9klAL5liWEcBZSHd
	+opIm3i3jw71sL6xqzqgY5SkHO5txp1pszGuDz1MQw3obSLwi3pwcpU63r1Ov0i2ZMK2oXVdrP7nA
	TdBF8xEbbyLW9Lr5ePpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8qYP-00000002hkw-3FOa;
	Sun, 27 Apr 2025 01:11:33 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8qUx-00000002hNn-2hzL
	for linux-riscv@lists.infradead.org;
	Sun, 27 Apr 2025 01:08:00 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so4931536a91.3
        for <linux-riscv@lists.infradead.org>; Sat, 26 Apr 2025 18:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745716078; x=1746320878; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qi/DM2NVeWE17m30+tFBeykLvgqkmQd+TLzeOQAEaxA=;
        b=c5i1Lw1YErG2tpmNa8bqrUAlU0Y07sgBWa1lauRVOeJYDOspai8b9gChyv4vS7To0S
         Ltcfw8I72ctlE0mCXsMEZFUN69VWZHoZnizK5Ha26qMZRhFPLT1JMXzRPC/QkA/R7dCF
         KuSo0XTAENyZE0Q3ZCE6rYnjKf+r3TX21FR66Iv3q7e/IMSZDJeW+1S9JSsXE6V03kmE
         6Vbq8LTRDwYILkclBVkTA7BmgZmgCE6oLEJtANyVgXe1b6Ve0QJfta78q1hx4J19vwgc
         d9UcY+jAspPveIWquirTJ4ffHMD7S5MpIrdOAriJpNkAg+0HkGgE6OawY68TUiYqx/oN
         D9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745716078; x=1746320878;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qi/DM2NVeWE17m30+tFBeykLvgqkmQd+TLzeOQAEaxA=;
        b=rb/Gjg53/9DbjV/+hec7xUFJcGiGXuUq2wZxje4D8SmV1atttpVZe6f0OePYHXoh1W
         dPalBmB0SKmLItqIu1z4Zk6bM2GT6sua21wNf2tF8K69r7wTcSucqzpoBbVXUEmKn+2x
         3tsorLGEjRLUkKKed8c3lQX5pUrmbzaB2Njh4KlOfvSAZqrz0/TRFpcF5v/vVRpivn2j
         U/vbVL/SN4ZnGNsb8mN3xi3xv9QqUYtgwMaPpwHubj/3dOfthly7jxqW+6yr9V0t6RkW
         ZFPbQG1MKAYpte5WtjrixSM4YLkaZ0u9874tPsG+gxa+nUGp3xI2cVHDq1rreqPX8c11
         3mVw==
X-Forwarded-Encrypted: i=1; AJvYcCUo1ZTaLaCBdwWvYvCeQphsht29QpOLOtcgs26eraJTzfRJUQf7jwpS1SF8YzBPDXfXV8hrE/nPOCJ+sg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzawQhX3Gdmb0xoNzE/VkAnTe7MS+V6qFJJTStgzuBWetJkbok
	adJZgXN7sH2aaE9yiJdbqJjMJw6EjQ9wP85tfyeRsoXFxbDeZIVPqO7DNQ==
X-Gm-Gg: ASbGncttNu1bQkBgCfjP5EnUZEeRpmog1wMEyUDTdb3hchbmGdn2hpYtYvQ1w0yOH50
	aziEfzqhcMRUBSybqe318FBBBNfLGq07rKUtyE+UpVMydhUf6ghxIsnCJgAbyLm697Z8NG5yOCs
	EaXBd+nM618yQn3Jpv29WPGqPtTX1EyJQImb3vIQoISNxGfVp8sp7I0N4cXbtDIWq5DnONdJ23/
	xlx84wn8PNfQ6gNZLcvbJuhAjsOcQNyUPlVBTYHdGaQDtRTFxC0XjGt6194U9dVsWcckaCD5Zj3
	OTQbzeQGlKn+8aGuXNF3dN2KeSeh7fEz5T425HaFeA==
X-Google-Smtp-Source: AGHT+IEOE2HNR8Z62iAJd3A4G+i2avNNhNGvpebOOqlr1I5tJlN3/vtrc9yI9fUiyGEU1soypp/xSg==
X-Received: by 2002:a17:90b:57c8:b0:2fe:8c22:48b0 with SMTP id 98e67ed59e1d1-309f7dfddc6mr11264812a91.15.1745716078381;
        Sat, 26 Apr 2025 18:07:58 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-309ef1475ccsm6041086a91.44.2025.04.26.18.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 18:07:57 -0700 (PDT)
Date: Sun, 27 Apr 2025 09:07:55 +0800
From: Longbin Li <looong.bin@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v3 0/3] riscv: pwm: sophgo: add pwm support for SG2044
Message-ID: <efpbhawsfg7nlp4waxtp366bemzzoznpoikob4ndzzoibs6n3d@6y3jdfw6zrhi>
References: <20250424012335.6246-1-looong.bin@gmail.com>
 <MA0P287MB2262EA042510853498EDD60CFE872@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0P287MB2262EA042510853498EDD60CFE872@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_180759_686231_FAC84B5C 
X-CRM114-Status: UNSURE (   7.94  )
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

T24gU2F0LCBBcHIgMjYsIDIwMjUgYXQgMDM6MjU6MThQTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3Rl
Ogo+IEhp77yMTG9uZ2Jpbgo+IAo+IFNlZW1zIHlvdSBtaXNzZWQgbXkgIlRlc3RlZC1ieSIgdGFn
IGZvciB2Mi4KPiAKPiBPdGhlcnMgTEdUTSwKPiAKPiBUaGFua3MsCj4gCj4gQ2hlbgo+IAoKU29y
cnkhIEkgd2lsbCBhZGQgdGhhdCwgdGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
