Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BF3C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 11:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZLD1U/DDHTMATOqjWyxq7edF9FC98MhBAfzj7aevvM=; b=CTjO4K3kBimgq6
	iXdJ2yhhPM6AupBgjIAaRl2FeU3uu2serjNxh+sGd7RSnZxC7m5sY6cyUteY/FjrflXv6Cq6s6+aY
	nZp64W2rK+FusJWhzsAFXbsaFgcdHEi3FMpVZV/C6zG9Y4VsBwBsgdVnmB0+sacg7qtYnaC+ZqNol
	QN3FshX2R9trfxJp9t054jxytO9/uqUAKPaIAjHAzMj2gjErl/iVoBouFbSL8GqlZJxfKQxRC3UUd
	BLbyAXsWQvACWPr5HHdX5RjSNSgN6pU7C0RZCru1QPdR36fJTk6WCebstOxZI3mXc9Q3q1hwYznys
	6tHrhHY1OjjbjtUPQyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbY-00000000zsI-2tm5;
	Wed, 19 Jun 2024 11:35:56 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbL-00000000ze8-3ldX
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:35:47 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2eae70fb324so7080951fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 04:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718796940; x=1719401740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gKBxLDJwfEAb763w28hTKCR1YKQpEepRMlpfnF6GRk=;
        b=Gu5mGGgJk3Xa/yrfW6hj7RpUoWE7u7YkGTEbmChoPTA7ueJ4UxFvHhnMFvFXBS7Kil
         FebdTgElQA5KmLf+7vHn2epQfUnGoTY7w9cWnzllyM3ihF0CVla1hk/QnUfpjb3Z1NgE
         lwyBAY55Zxru7d/oDMu7Djg+rcwxzzp2dMetmZhiLcXIoo/Yw/A/AJ7MRb3dUvcAA7nj
         Il5NZOuOUKjLlGbp6IYvqoDIcCQCXUxVy69dWorwfDSuFUehnhazPvGcV7f/k17dpS8V
         W5zqxrippHowIAlKBiltjsk6BFGTdjF8PR97MY8QocIFvZnwQPeaPIP1oWccZ35WYOij
         izvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796940; x=1719401740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gKBxLDJwfEAb763w28hTKCR1YKQpEepRMlpfnF6GRk=;
        b=k1VIZaFEiJBazgR50cZe1zff/A4WXxdCylK9U7omfBHpedfF4EFMLUqu6CHzzv0iQa
         Y/DlEyiR1OblgFTjxSqK+FJCfXiEO/olTpssispsPujYwaoyHYLRwX7arv+fX+PMmOVG
         pPmGQaWtZVOurHh+iZfbTreC9432tnCL/Lm9ZJMv1qk4CVzW2XfLiEikp9lcXhruU8G+
         GjT01hPaSkCL8hrLnlK0Phx9lczyBIX1wLhEI4qzmKW1xHkWo1/0ggZ6GdhA7RRyXewv
         /GDPPobBHWxBF68M+QKa5VJDkrEZfMi8dUe8GBQan6i4DtMSB21iOD0LO4we3kTVucZ1
         1daw==
X-Forwarded-Encrypted: i=1; AJvYcCVaf4ZWABXNtXIor1G5JdNtyPkiNjbnw8G9LguhzZI7dyXlxddf5szzpGySpyxdRKsQKBPndnpJXWEtrpWeeV0w+rEEJ5rVuOpVZdv4+l7D
X-Gm-Message-State: AOJu0YyWgS3H6BH+sFh8B38IIemFist+eapTNzb1lfopo5Hwb1x4LM82
	QzJdZNnRN4Q/udLFSlFHC8wBCG/BSQ9N0R3X1Wxdo8jCTdvXIBUwgxvKCujocjQ=
X-Google-Smtp-Source: AGHT+IEWSbg+KZSq17hNUj/VE/5pG5Suf0xxcBkBdQ1cvXjR8IOan6tfF5P9mBZyvKmi3xNjY8V9WA==
X-Received: by 2002:a2e:a98c:0:b0:2ec:4176:dcaf with SMTP id 38308e7fff4ca-2ec4176dea4mr6715961fa.3.1718796940175;
        Wed, 19 Jun 2024 04:35:40 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e67b:7ea9:5658:701a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm266192075e9.28.2024.06.19.04.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:35:39 -0700 (PDT)
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
Subject: [PATCH v7 04/16] RISC-V: KVM: Allow Zimop extension for Guest/VM
Date: Wed, 19 Jun 2024 13:35:14 +0200
Message-ID: <20240619113529.676940-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_043544_112347_60276C8E 
X-CRM114-Status: UNSURE (   9.56  )
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

RXh0ZW5kIHRoZSBLVk0gSVNBIGV4dGVuc2lvbiBPTkVfUkVHIGludGVyZmFjZSB0byBhbGxvdyBL
Vk0gdXNlciBzcGFjZQp0byBkZXRlY3QgYW5kIGVuYWJsZSBaaW1vcCBleHRlbnNpb24gZm9yIEd1
ZXN0L1ZNLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMu
Y29tPgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KQWNrZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Ci0tLQogYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2t2bS5oIHwgMSArCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAg
ICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9rdm0uaAppbmRleCBlODc4ZTdjYzM5NzguLmRiNDgyZWYwYWUxZSAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCisrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9rdm0uaApAQCAtMTY4LDYgKzE2OCw3IEBAIGVudW0gS1ZNX1JJU0NWX0lT
QV9FWFRfSUQgewogCUtWTV9SSVNDVl9JU0FfRVhUX1pUU08sCiAJS1ZNX1JJU0NWX0lTQV9FWFRf
WkFDQVMsCiAJS1ZNX1JJU0NWX0lTQV9FWFRfU1NDT0ZQTUYsCisJS1ZNX1JJU0NWX0lTQV9FWFRf
WklNT1AsCiAJS1ZNX1JJU0NWX0lTQV9FWFRfTUFYLAogfTsKIApkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rdm0vdmNwdV9vbmVyZWcuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKaW5k
ZXggYzY3NjI3NWVhMGEwLi4wOWYwYWE5MmE0ZGEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfb25lcmVnLmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwpAQCAtNjEs
NiArNjEsNyBAQCBzdGF0aWMgY29uc3QgdW5zaWduZWQgbG9uZyBrdm1faXNhX2V4dF9hcnJbXSA9
IHsKIAlLVk1fSVNBX0VYVF9BUlIoWklISU5UTlRMKSwKIAlLVk1fSVNBX0VYVF9BUlIoWklISU5U
UEFVU0UpLAogCUtWTV9JU0FfRVhUX0FSUihaSUhQTSksCisJS1ZNX0lTQV9FWFRfQVJSKFpJTU9Q
KSwKIAlLVk1fSVNBX0VYVF9BUlIoWktORCksCiAJS1ZNX0lTQV9FWFRfQVJSKFpLTkUpLAogCUtW
TV9JU0FfRVhUX0FSUihaS05IKSwKQEAgLTE0Myw2ICsxNDQsNyBAQCBzdGF0aWMgYm9vbCBrdm1f
cmlzY3ZfdmNwdV9pc2FfZGlzYWJsZV9hbGxvd2VkKHVuc2lnbmVkIGxvbmcgZXh0KQogCWNhc2Ug
S1ZNX1JJU0NWX0lTQV9FWFRfWklISU5UTlRMOgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWklI
SU5UUEFVU0U6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aSUhQTToKKwljYXNlIEtWTV9SSVND
Vl9JU0FfRVhUX1pJTU9QOgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWktORDoKIAljYXNlIEtW
TV9SSVNDVl9JU0FfRVhUX1pLTkU6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aS05IOgotLSAK
Mi40NS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
