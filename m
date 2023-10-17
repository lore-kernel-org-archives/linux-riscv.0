Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28D6CDB483
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+nAd5P3KkyDyOQ1/xdSZGNwqrB4rVT6xHkMRSYr8os=; b=vkxUfRml7wULJ4
	WqTpU/gsJZr7zGfPi2Yl+Xin90RZoB9ycbiaE1MfoWzOc5S9S1JyL9thDz/SiksS5UIeMN+D1CHSG
	JO0tjrPUFqBPAyUpJMcu8zDnGDP82IVir0eqiRPTr1x7doexnW4vV6o0nAmR3jN3nBLHFOXG69Pvu
	WQxJBT7vtMCyVQFO8EZyNdNIRY9ZON1fHttpvvpF6rb75grlTtLlOVhkUSWqjmST/44gmg9YyOgN2
	55vRVRo7Zrmym+OcpcUVQTWqOkrkqguroO5tr7dSrYLewejg70FCezOxFXwFWWiq8/BXJRgD8746F
	nFECL0JFE17wLIRhy0+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvG-00CNEi-0R;
	Tue, 17 Oct 2023 13:15:46 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjv7-00CN3P-0Y
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:15:38 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c51774da07so6837811fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548535; x=1698153335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3obtZPNOKP8LH+KjJEwDeimcpj3eT+9Cd34xi+FsYNw=;
        b=2xEuLB20wpMosdpQY8U4UJU+ZwAVdN/P3vG5h7GycRBnwYPJPlgbYLOcLFmKJpd5kU
         B/CFurxXxInGyvYSQmEMPJltKA+DqdV6vIztlOG5Ex75bPwMFFoDLS3D1YFI8aFL8JoW
         yVvr9Q4rAPbGGbDBo/h+xIScODayoerik2TzZHWhmdzttmHoiEL2j3msMqhbO4u9VmNJ
         HTbJ6gWCZyY+vviLO8v7zS6YEZeh0rp01dY6lnoRS72gF124A39ntEVbbkzvPEeFaG0h
         vkUMbUTHi9tgpdSOYog9EysvuBVDWzdi7B7l5gTmfSaCe6bwRuhTBJ6INhANaZ1p0L3h
         IB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548535; x=1698153335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3obtZPNOKP8LH+KjJEwDeimcpj3eT+9Cd34xi+FsYNw=;
        b=jcSk3OBXb5W9IFIPH8r5GjMCy3khLXZnnlaAv/ysaNzH81+uwH0ysLpayDZPIoA6JG
         eA1cw2dDDiMasgvWDRowtoCUwFMXMRuT2w3XQ7ugHuQq7vCCrzUSIdvA40YE8Fl5mC/i
         1ECWQ1Otk+LDFv6uadsAJoronj2PWbZuW7afUJ9E40KDrlfk2e3EcBEasQ9kxt8iB5jZ
         adDMQal/g8MUWGFAxgPF2tpgjTJ4iNQIpHA0L0guf50B5OL/t0IG1DM32hMvlQZ0Squr
         08IM/s+lOsudnmvBAvLEGEYAQVz+Ek0gn89PJmpKyO9dSC9/mdx4k/Gl7QDbBM2aUuPZ
         cO9g==
X-Gm-Message-State: AOJu0Ywm4rS7J7E4glZz/wjNPmLMZVP7wIF3r5LshP0G1tdnNM7jDkaf
	U0XIT75AAH1h0T8o6otTopjhtparSjkjLHRcUysFqQ==
X-Google-Smtp-Source: AGHT+IF341BXCev0oxtaNbakkAnO4ZAxajhUcsSm+LPtv73PBIJRAamKmYX/PlGez1RMG9nLGmAzPA==
X-Received: by 2002:a05:651c:c8c:b0:2bf:b0d3:20f9 with SMTP id bz12-20020a05651c0c8c00b002bfb0d320f9mr1924875ljb.5.1697548535010;
        Tue, 17 Oct 2023 06:15:35 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:34 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v2 09/19] riscv: hwprobe: export Zfh/Zfhmin ISA extensions
Date: Tue, 17 Oct 2023 15:14:46 +0200
Message-ID: <20231017131456.2053396-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061537_242175_87322462 
X-CRM114-Status: GOOD (  11.61  )
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

RXhwb3J0IFpmaC9aZmhtaW4gSVNBIGV4dGVuc2lvbnNbMV0gdGhyb3VnaCBod3Byb2JlIG9ubHkg
aWYgRlBVIHN1cHBvcnQKaXMgYXZhaWxhYmxlLgoKTGluazogaHR0cHM6Ly9kcml2ZS5nb29nbGUu
Y29tL2ZpbGUvZC8xejN0UVFMbTVBTHNBRDc3UE0wbDBDSG5hcHhXQ2VWelAvdmlldyBbMV0KU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIERv
Y3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QgICAgICAgfCA2ICsrKysrKwogYXJjaC9yaXNj
di9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCB8IDIgKysKIGFyY2gvcmlzY3Yva2VybmVsL3N5
c19yaXNjdi5jICAgICAgICAgfCA1ICsrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9j
dW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdAppbmRleCA4NjgxZmI2MDE1MDAuLjM1YWVkZmZm
NTA0OSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdAorKysgYi9E
b2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0xMzcsNiArMTM3LDEyIEBAIFRoZSBm
b2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKICAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9F
WFRfWlZLVGA6IFRoZSBadmt0IGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQgYXMKICAgICAgICBkZWZp
bmVkIGluIHZlcnNpb24gMS4wIG9mIHRoZSBSSVNDLVYgQ3J5cHRvZ3JhcGh5IEV4dGVuc2lvbnMg
Vm9sdW1lIElJLgogCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pGSGA6IFRoZSBa
ZmggZXh0ZW5zaW9uIHZlcnNpb24gMS4wIGlzIHN1cHBvcnRlZAorICAgICAgIGFzIGRlZmluZWQg
aW4gdGhlIFJJU0MtViBJU0EgbWFudWFsLgorCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVf
RVhUX1pGSE1JTmA6IFRoZSBaZmhtaW4gZXh0ZW5zaW9uIHZlcnNpb24gMS4wIGlzCisgICAgICAg
c3VwcG9ydGVkIGFzIGRlZmluZWQgaW4gdGhlIFJJU0MtViBJU0EgbWFudWFsLgorCiAqIDpjOm1h
Y3JvOmBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzBgOiBBIGJpdG1hc2sgdGhhdCBjb250YWlu
cyBwZXJmb3JtYW5jZQogICBpbmZvcm1hdGlvbiBhYm91dCB0aGUgc2VsZWN0ZWQgc2V0IG9mIHBy
b2Nlc3NvcnMuCiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3By
b2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCmluZGV4IDI1Mjlj
ZWUzMjNkYi4uMzkwODA1YzQ5Njc0IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20vaHdwcm9iZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2Jl
LmgKQEAgLTQ5LDYgKzQ5LDggQEAgc3RydWN0IHJpc2N2X2h3cHJvYmUgewogI2RlZmluZQkJUklT
Q1ZfSFdQUk9CRV9FWFRfWlZLU0VECSgxIDw8IDIzKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9F
WFRfWlZLU0gJCSgxIDw8IDI0KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlZLVAkJKDEg
PDwgMjUpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aRkgJCSgxIDw8IDI2KQorI2RlZmlu
ZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkZITUlOCSgxIDw8IDI3KQogI2RlZmluZSBSSVNDVl9IV1BS
T0JFX0tFWV9DUFVQRVJGXzAJNQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VO
S05PV04JKDAgPDwgMCkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVMQVRF
RAkoMSA8PCAwKQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwppbmRleCAyNWQzNTgwMDgwOWYuLjRjY2E4Yjk4
MmE3YSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKQEAgLTE4NSw2ICsxODUsMTEgQEAgc3RhdGljIHZv
aWQgaHdwcm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKIAkJCUNIRUNL
X0lTQV9FWFQoWlZLU0gpOwogCQkJQ0hFQ0tfSVNBX0VYVChaVktUKTsKIAkJfQorCisJCWlmICho
YXNfZnB1KCkpIHsKKwkJCUNIRUNLX0lTQV9FWFQoWkZIKTsKKwkJCUNIRUNLX0lTQV9FWFQoWkZI
TUlOKTsKKwkJfQogI3VuZGVmIENIRUNLX0lTQV9FWFQKIAl9CiAKLS0gCjIuNDIuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
