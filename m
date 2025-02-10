Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85A5C0219E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qd6470ii4SIruB3HCfMKsK1doYSmXuHkQS2rQVHuI3Y=; b=shxmAQrdFUo1Qf
	jCf0F33ugkEjQy6g4xqC5kfDNE1HSMGEl3Ahv4+8tHStO8CZBU7G1D2/kPHVZXIfLH2i8xW7YPb09
	SmQbOIbfETpA2R0TOPGyEZvlDY5vAXrGjYjoHgr6lvI2y4Lrqnm4TImPj4P8htcrRU07TVs43Rolu
	QKSkDGx1TN5kPXOR1O7t7tHurUkrFBGzynBmmo+P77M8zLPV0gA3x7mKg1zz2qQgD1EMiXokctHq5
	PPw+yIqERzp1Ptt9SF7hNcSpdrtNO0l7u+6FeWNocTQ8QQosMhKw+ny57BrgLY7OXJu/nByloWZyP
	uGHS0KklQcJkpw5zsjjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbaz-00000001YLW-0pF8;
	Mon, 10 Feb 2025 21:45:37 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbRq-00000001VMg-2ZPZ
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 21:36:11 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38dcb97e8a3so2878618f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 13:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223369; x=1739828169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KnDLY3kffZnCGFmPEexJUKlO/NVt183lUvBn/SEPO0=;
        b=yckjVFBaDxPvJECVvBCYNXrF+7XfZ8qQoP8JjI9lmxtcpCqkx4anjf0XQEW4+0TkPk
         fHnGvEQSnnKvaNsHPegOPxMM8xns0drnkfKiDXo0WasF0yHVIgZ15YLwJ+4suKRv8DP6
         3Y5aLYX1THLKFzUrfrw4MjU286aara8qAFm4T/z9tf6j9ykrO7O3TE0pPRn+PbK0qICh
         u0tK869mlb8j7JCPrclwZY5Xs9qLitwUlyn+JKVFGkBpC1GMHURnGBFJf9c9z+hsUvHj
         qxFOHm8pxGnfwjXHqxRZFsXZrp5ocMI3eBR+Z4MpafyiqyUgsm/ULu6IThNCFtzVlcOL
         ngHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223369; x=1739828169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KnDLY3kffZnCGFmPEexJUKlO/NVt183lUvBn/SEPO0=;
        b=MIQ/2fOkXPS/yXTYbm77zipp/jhlQnesWqrkWRoIGgMWrydO/RWw85NQdxQsExCRif
         AScmaR2uVW/GjO0prJEXv0P1kYQi0OtXzcN5MRaOz6vc51XwEgBNLzNYbQPSvOGltGP0
         3W+Np87ShKPtE5gSMfDtWwAHOQusJqiXIHbipcXqgTtkm0Yq4intKSy/2ohG7x4RbmTN
         Ic8ym9AiH2dYp4Eiq4OInxYUJIt7LU8EbhPiEB372g3mb3jZQ3hYAfhndrYkWyJO1L5A
         dyg6MioKgVyeFQjk46zHpzhessVzz5MRe+B1RGk/sAaAlQWbquxlP9j1imvJdF8iTyJC
         chGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWENLDCtEJ+4kdiiPBsMr0Vl8/FIMyxSbaTBFeKqtKdiPjpQN9gWgbbBfzb7CPt0QXgleW0//06s0WgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRo8Kfj7PHb4nvTPOfYsNsxf3b6PHuyres1mWjnFUD1LqroaCF
	GJYDu3aNjxXHRQQq3Gp/sUJDpL4710twvj698+jmRIeJGBl+JHJK7XVNZJaw0yI=
X-Gm-Gg: ASbGncvy/P0Ck+irzTqbqzNmsi1E7bEYBscWi2AHKwci2Wca0gko2Dw/QyAqv3ZZpHx
	6XaVGg3U0VLrjwWRDgvq1OtfS+0Nq8c0cc8gA5rtliyXGBY4YJEt0Nr1dr2S0xhkmLyfW3F10fe
	8lTdG81NnEuDQ366oSlo1btIc5PS7joV2cOL9eAWDA71XJHYq+86qzx22h/bep2I2uGpMX9to2A
	C5KsPtHpJX/sJ5RN/EfPGgXPxEIHEhmgBXCOwFPVuuwN8MJi4Trpx/0Ur9nA/xRO+ckedqYPbP4
	3hBTsTsWREb6rdpX
X-Google-Smtp-Source: AGHT+IEE/P9vsQR8DRZBtCxEbVJartmy037BYwcdFf30+Y++Re0XNH996Xl3DeOOL//RGxNKuAEJ9g==
X-Received: by 2002:a05:6000:1562:b0:38d:da11:df3c with SMTP id ffacd0b85a97d-38dda11e134mr7050032f8f.48.1739223368915;
        Mon, 10 Feb 2025 13:36:08 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:08 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 04/15] riscv: misaligned: use correct CONFIG_ ifdef for misaligned_access_speed
Date: Mon, 10 Feb 2025 22:35:37 +0100
Message-ID: <20250210213549.1867704-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_133610_649171_4800BC38 
X-CRM114-Status: GOOD (  10.56  )
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

bWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQgaXMgZGVmaW5lZCB1bmRlciBDT05GSUdfUklTQ1ZfU0NB
TEFSX01JU0FMSUdORUQKYnV0IHdhcyB1c2VkIHVuZGVyIENPTkZJR19SSVNDVl9QUk9CRV9VTkFM
SUdORURfQUNDRVNTLiBGaXggdGhhdCBieQp1c2luZyB0aGUgY29ycmVjdCBjb25maWcgb3B0aW9u
LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgot
LS0KIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
X21pc2FsaWduZWQuYwppbmRleCBlYjkxNTdlM2FmNzMuLjU3ZGVkN2U3NGRkOCAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwpAQCAtMzYyLDcgKzM2Miw3IEBAIHN0YXRpYyBpbnQg
aGFuZGxlX3NjYWxhcl9taXNhbGlnbmVkX2xvYWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAKIAlw
ZXJmX3N3X2V2ZW50KFBFUkZfQ09VTlRfU1dfQUxJR05NRU5UX0ZBVUxUUywgMSwgcmVncywgYWRk
cik7CiAKLSNpZmRlZiBDT05GSUdfUklTQ1ZfUFJPQkVfVU5BTElHTkVEX0FDQ0VTUworI2lmZGVm
IENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRAogCSp0aGlzX2NwdV9wdHIoJm1pc2FsaWdu
ZWRfYWNjZXNzX3NwZWVkKSA9IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJfRU1VTEFU
RUQ7CiAjZW5kaWYKIAotLSAKMi40Ny4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
