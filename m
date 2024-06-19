Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D22C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 11:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N5Y8RPYR35F7gLzegEJJBkifO7fCBRPrWbHGu6Va2WI=; b=0NIgQV6pNHiiwg
	5M46Ipmz16Vr340SUU+ASNxGnVWaC/HmI4f9zIeD5t0Dml5VV5i9Hc6T+ybyYhEs1xNWDbRCa6veT
	9iQFPo4z3Wychp0AmwcveFZUtUE9j7AZ4+YSYrkkO+exekCbnff1FJVPZbAUdxXcmXd8qsfUu+jh6
	OPojpX1m0e6DplX1m26fjBJROISEvkllkmZoUOFGh4NG/1z7GQBVyDcJe5Ui8qc/kfFu+S2TgMVYN
	7DfvcUQlrma0KIxbI05qLyxsbj1FyX4+z3S5/OzxahzTntiu53zQopI1PxLYgYIgYZZ/W18miz6ZG
	Y9+dBZyejuM8ftRt9jxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtcW-000000010lA-1BhX;
	Wed, 19 Jun 2024 11:36:56 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbb-00000000ztv-05og
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:36:03 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-35f25530406so367520f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 04:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718796957; x=1719401757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNTR87ViStRTLjbLTFramo32AnhtfCIqG+mY5nzsVhg=;
        b=0ZiGEn7cDhIQpqPaRg6TqvLDWY/Vb3Ii7WtLZe3zpIa3WRufQllOCP45RnNPvKo0VP
         sAKUWG5KKJbvllj3r+uari5wuept5OCbeao6Yn9xdgEbySOkeyfB/Ah9suMv7JtM802u
         TibL1LCsHZm7ddC5/j1Ide+ujxO9CouLquYc13MWogdIyLXQKimUuaTRv90BivRqTTzj
         hSfwNwTO0X13/QqcKZueaIbF6XI1lecfUUYqu/zwCqMH+MjHQrIFLWhizZHu9dIfK4gg
         MpoAxeVdztJWnijqApytUfMLXyKvhuhM1VStnwYdVP9+BcpqeahiABnL5/OmrQ6EdiPR
         0aJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796957; x=1719401757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNTR87ViStRTLjbLTFramo32AnhtfCIqG+mY5nzsVhg=;
        b=UdjnftnrbFeuCSj3Gi/85cYxnwVHMM/6fPQJm06/4Ag7nSl2QYQixykSli+RQykJEc
         uuHh9itnNRoOmWrXPZw8nOTiGfexKelePkOtMEtlrKDzNXhmUd9JzzSN/tEV7c1MOsai
         SzVdK8wh7Fx+YnQvd3nzuVtmMIhD1lP2cmMzk5eI4vw33pKd1e9hg2a1WVNGQM8OPNeJ
         mKreBsW+IoPW76aAJ1jWTYlZfyWFf41Jwhft2rqWl68qXUeWTyMv1rGNbKRpiLea1xOQ
         u7VW1i758NxG3J2/fgqXi57MOvVU3h8N8KdAMJrGqbskEhp+8MEHZOuAzV96+mWzm3aA
         wj1A==
X-Forwarded-Encrypted: i=1; AJvYcCUfHYfbrjxvL1CC9Oe03bliVvK+jpOy92+puq71L/cvS3yCh/jweXm1YHI2zwnaCPwiF4cjaahOqlURcOciP0vrTsfSasuS+rg7Kjzhl/+m
X-Gm-Message-State: AOJu0YwZ3XDoJjeaB+NMiI7oHCTsmKNMVjps4l1+0EpqQ42Dvt4AN1gX
	dH0aWKKOCI+I3phJpPjJSPC4QML+Y+BXzvFyiRZANInPc/PtwXNr18fgYpGGGDw=
X-Google-Smtp-Source: AGHT+IGn/LpwHNx73QtNZmX0LVZG43iWR+YwELGXaE1GpTfJ5aoWVLtbw2nzaPBzkFgiYXBhTTJV0Q==
X-Received: by 2002:a05:600c:511d:b0:423:445:4aad with SMTP id 5b1f17b1804b1-42475016e88mr16022565e9.0.1718796957512;
        Wed, 19 Jun 2024 04:35:57 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e67b:7ea9:5658:701a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm266192075e9.28.2024.06.19.04.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:35:56 -0700 (PDT)
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
Subject: [PATCH v7 14/16] riscv: hwprobe: export Zcmop ISA extension
Date: Wed, 19 Jun 2024 13:35:24 +0200
Message-ID: <20240619113529.676940-15-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_043559_492622_C8EDCCEC 
X-CRM114-Status: GOOD (  12.47  )
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
cmNoL3Jpc2N2L2h3cHJvYmUucnN0CmluZGV4IDRkOWI0ZWQzNGM5Ni4uMjVkNzgzYmUyODc4IDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKKysrIGIvRG9j
dW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0yMzEsNiArMjMxLDEwIEBAIFRo
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
aW5kZXggYzM4ZjNmMmI4MzgyLi45MjBmYzZhNTg2YzkgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2h3cHJvYmUuaApAQCAtNzAsNiArNzAsNyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAj
ZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQ0IJCSgxVUxMIDw8IDQ0KQogI2RlZmluZQkJUklT
Q1ZfSFdQUk9CRV9FWFRfWkNECQkoMVVMTCA8PCA0NSkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVf
RVhUX1pDRgkJKDFVTEwgPDwgNDYpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQ01PUAkJ
KDFVTEwgPDwgNDcpCiAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMAk1CiAjZGVm
aW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTgkoMCA8PCAwKQogI2RlZmluZQkJ
UklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVECSgxIDw8IDApCmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3
cHJvYmUuYwppbmRleCA4OWUwM2NkZjM4YjcuLjNkMWFhMTNhMGJiMiAxMDA2NDQKLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNf
aHdwcm9iZS5jCkBAIC0xMTUsNiArMTE1LDcgQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0
MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKIAkJRVhUX0tFWShaSU1PUCk7CiAJCUVYVF9L
RVkoWkNBKTsKIAkJRVhUX0tFWShaQ0IpOworCQlFWFRfS0VZKFpDTU9QKTsKIAogCQkvKgogCQkg
KiBBbGwgdGhlIGZvbGxvd2luZyBleHRlbnNpb25zIG11c3QgZGVwZW5kIG9uIHRoZSBrZXJuZWwK
LS0gCjIuNDUuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
