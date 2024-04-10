Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFF4CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 09:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hyTpju/nnUS/DmiEf83/G7pnb9Fb55NyKWDhsatQPg=; b=RnHKUFGKcWzMAn
	o7ElkxiaisQw+hApnw9wpPhCH/sF4LyYq5qgNKIvefL0e8lRQDjmF4ELEFCDWGeT1xwtHt1lg3/Ob
	r/6D5wDPP4vvqUa9FvUKisw7dmOeFY77Im1SqJ0MZ27R2ksIE9LMTs9EGyBGgx9TFtaVcSTuYUVnE
	ootGI/mNfcZzpdE1evTdQbm63Z2u68mK7YXoyWh7niZoAc38TSKY58Pj+20Ou9kEfs9ThF5uhgdFe
	9keekLsQxisws0MT4vZYclqeO9EgSTGR/kxjkwIu1PXBEdwO/UBQMqIPZ7luxOFCaVqJkk71lZUU9
	Ls+lKl1DoCtdJvCoKJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTzu-000000063gI-256g;
	Wed, 10 Apr 2024 09:12:02 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTzI-000000063A8-12Zt
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 09:11:32 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-346407b8c9aso516618f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712740281; x=1713345081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdCfPjm06PN8DLWdVlWU7iGB8QhHqS8f5T3HQCXkkpY=;
        b=Qi4W5GFvtThCxTLCDEhF/HOyZMzNzKKvXozs8o4lz24TqdhbsoA8Nmv0qNU8ZFDuZ2
         OMMTaOV4xPHBzcKI8GWNQsJTFlnAWqtVuI9LcZSRn6mHBNMEByIH0PQbTHomkfw2O2As
         UDfcjCx+QA90aBjgDNxOAamH5S19WHC6HxH4uLnnDQHF9T744SnoJuwkxo/HF5vKzD97
         RQgytgB5Qp8oofnm4nx7yPS0pH2t+Qznzr+tWV8jWVg3DZXbRob4x58AUl1IXtq5q2ZQ
         Ks2NTZlgkM5afXQP1lLXw+6gSMTArWHlql2kLH9RckAvLmvAWpRSWid+co5TAlalHbe/
         +fAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712740281; x=1713345081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdCfPjm06PN8DLWdVlWU7iGB8QhHqS8f5T3HQCXkkpY=;
        b=qljdfc69ZDxipzp3pbLNr8CU69qsW+ZqIK38E3hUfwlSukfDF+Czy9Bz+Rttg6R5Ve
         s0Qyw1dF4XgVgDTq8XRuupwFVQeDR9BfiJMP8ueNgNT0wVIk6ZYrLgXRNzelQqdwBD5m
         QgwW9DiP1hUYCgycZeJv+dzr9zobbGh4uVk/A2CsFetkvudQk47ZJ9GBemiqTTJf5nPA
         iy+Ij/AMrokiiXUi3xH6vd4OG93Lks0TAb4EOC5/HrbHy4EuHf0jhuKGFwqYRD6hszgc
         fPBRYZV1yq8baf9vj27cj89F9m1UXSVOE8BgOrbHa5QYVpyE41SZN/N8JhAYJJO7QqC0
         mn5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCOECBrg1jxofNGRMiWiRckSmlhMDPgb1jUtQLD9GT0xszwsEXlt/YRSNUCMLttfnf+/wwrpwtCO14RP76tZo5DGqg7VGygzLxyVLsCeGD
X-Gm-Message-State: AOJu0YyPuC2aK4MJ04h5wbkgiyyXLxdX7/5tSQAiNV0KV9u086Zv0jFi
	5NhLKTRl4BrVeM78TEcCXDYaOUhRxTLxxX3UqhnGOn2O4z2AXnDkFGt4WCA+rPM=
X-Google-Smtp-Source: AGHT+IFQJ5p7pLG6t5Azs3+BcKGV7vPPdom5bcR5KV8gVA1LUcuSXTuOIz79sOe0bN9WIkFT5A1jwg==
X-Received: by 2002:a5d:47a4:0:b0:343:39d8:bf3a with SMTP id 4-20020a5d47a4000000b0034339d8bf3amr1645951wrb.4.1712740281298;
        Wed, 10 Apr 2024 02:11:21 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:d4a6:5856:3e6c:3dff])
        by smtp.gmail.com with ESMTPSA id d6-20020a056000114600b003456c693fa4sm9079086wrx.93.2024.04.10.02.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 02:11:20 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 08/10] riscv: hwprobe: export Zcmop ISA extension
Date: Wed, 10 Apr 2024 11:11:01 +0200
Message-ID: <20240410091106.749233-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410091106.749233-1-cleger@rivosinc.com>
References: <20240410091106.749233-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_021124_588717_9A5CD93D 
X-CRM114-Status: GOOD (  11.30  )
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

RXhwb3J0IFpjbW9wIElTQSBleHRlbnNpb24gdGhyb3VnaCBod3Byb2JlLgoKU2lnbmVkLW9mZi1i
eTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIERvY3VtZW50YXRp
b24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCA0ICsrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9od3Byb2JlLmggfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMg
ICAgICAgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9h
cmNoL3Jpc2N2L2h3cHJvYmUucnN0CmluZGV4IGJmOTZiNGU4YmEzYi4uZTMxODc2NTlhMDc3IDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKKysrIGIvRG9j
dW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0yMTIsNiArMjEyLDEwIEBAIFRo
ZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKICAgICAgICAoIlpjZiBkb2Vzbid0IGV4aXN0
IG9uIFJWNjQgYXMgaXQgY29udGFpbnMgbm8gaW5zdHJ1Y3Rpb25zIikgb2YKICAgICAgICByaXNj
di1jb2RlLXNpemUtcmVkdWN0aW9uLgogCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhU
X1pDTU9QYDogVGhlIFpjbW9wIE1heS1CZS1PcGVyYXRpb25zIGV4dGVuc2lvbiBpcworICAgICAg
IHN1cHBvcnRlZCBhcyBkZWZpbmVkIGluIHRoZSBSSVNDLVYgSVNBIG1hbnVhbCBzdGFydGluZyBm
cm9tIGNvbW1pdAorICAgICAgIGM3MzJhNGYzOWE0ICgiWmNtb3AgaXMgcmF0aWZpZWQvMS4wIiku
CisKICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0bWFzayB0
aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCiAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBzZWxlY3Rl
ZCBzZXQgb2YgcHJvY2Vzc29ycy4KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgK
aW5kZXggZGQ0YWQ3N2ZhZjQ5Li5kOTdhYzU0MzY0NDcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2h3cHJvYmUuaApAQCAtNjQsNiArNjQsNyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAj
ZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQ0IJCSgxVUxMIDw8IDM4KQogI2RlZmluZQkJUklT
Q1ZfSFdQUk9CRV9FWFRfWkNECQkoMVVMTCA8PCAzOSkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVf
RVhUX1pDRgkJKDFVTEwgPDwgNDApCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQ01PUAkJ
KDFVTEwgPDwgNDEpCiAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMAk1CiAjZGVm
aW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTgkoMCA8PCAwKQogI2RlZmluZQkJ
UklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVECSgxIDw8IDApCmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3
cHJvYmUuYwppbmRleCAyZmZhMGZlNTEwMWUuLjk0NTcyMzFiZDFjMCAxMDA2NDQKLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNf
aHdwcm9iZS5jCkBAIC0xMTQsNiArMTE0LDcgQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0
MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKIAkJRVhUX0tFWShaSU1PUCk7CiAJCUVYVF9L
RVkoWkNBKTsKIAkJRVhUX0tFWShaQ0IpOworCQlFWFRfS0VZKFpDTU9QKTsKIAogCQlpZiAoaGFz
X3ZlY3RvcigpKSB7CiAJCQlFWFRfS0VZKFpWQkIpOwotLSAKMi40My4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
