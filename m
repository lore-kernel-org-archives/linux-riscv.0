Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A5CC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 12:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4QAhn70e+I6tzR+Y4aFdbN4AG29WHk9cNTzyz268WI=; b=kgQeMvqGo61wl9
	rI1Wzy+6v5JytYvVvW4SsSSq4QUbmmN5yhOIBPsgOWzmnroKbY797fRLWICAA7NHJlq4FIwtXXWLy
	WMG9gjLmpFAHLlqNjq2njJFojRlsyeLi3rvyDIdzh6IEfuzYpjOKM+11mLj178FHZa7ajNcX56l0i
	9TFLpVFtz/V2Lyy8DNhqWWj0LxQWuwpVbOaWtTRbMuFCQ+JXPbny3LRoaqgYnOsqq5Coc1w54REpI
	QT24J0iwFlSlKB3O2D2w68IG9yJGN+qLxE60t6+5OmXXBXBAjXsyBhYFdEpcG5uncKC3DGvGrsAqG
	MYjmZasFmGsLIA/mqkRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Kkr-001O7W-2C;
	Tue, 07 Nov 2023 12:00:25 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkp-0019G5-0g
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 10:56:24 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c6f4bc7738so11205241fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 02:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354577; x=1699959377; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4s/6qoHBJWx8IDkipxLTMx5qIdSuDP9Fhxnx/OaR4U=;
        b=KqvmKMFIq7eG4EbDNva9VUtWcyzo2joqPue5v8+DwMOiArlv/PMB3c2DeNBRgpcKE4
         /KfGGYV8LVv7TykZibMgHARd05DAdv0jiZ7dS0b0W3+kALckFEeMtz4IcQdF9hzFmeH9
         8tf3TliBtTYgUrub5RE+XdIOj5B1O2fKZVVuyMSyo9ZaJv0II9V/zbU9VxWs8SWh+PVT
         PQ9ju7GEXCJISuBlOnn8Sp3u8UX1RLjb2bzFddc3p+wKirVDLyajwRn1HiBGCLe6mRO+
         J54QybRveaIZOwzaeLrHwwouFeEzQ5bufpl6fW4Sj7Ef7dWEXhbUwJPa+o0vnZJjGESJ
         eeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354577; x=1699959377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4s/6qoHBJWx8IDkipxLTMx5qIdSuDP9Fhxnx/OaR4U=;
        b=wzkp8B7RgvqFqzVGJiQGw4eOxaPua0nPn2ygGJZMW+ACniINXCbdatHGkt9GXAhmQi
         2UgxK6fY6EfIskx4EjoZjD2GQTPxW4gghML14sGVHt+HtlOngCgLcXfMSnZZGSFp68u7
         +2UKpkHl5eEGZWSEIjPuQXThDyQbs0Q4o64SvikuGyWdlOpKaN4SqPv3KLYzAh7cbss8
         ZR8gi3roFkqqyqjgH8ervy2FIsZ31yGWIbHH1l9XCRqhs5mpr9jueEGGB1gWVKQTJ2IH
         rJdzzbC00EWPIzHqwllcH/91Vmi28Es7YAfFHc00HtJ6ceWTUWGg6Mv0fiPHFVh7+wVD
         XhEw==
X-Gm-Message-State: AOJu0YyPN7QymXJ4FjfNi9pe7JdfW3/bfwUtRC3K6gvA1FdMbn8HLJZl
	o6usCFb3BsjWbGbSKa3ypLGMON7AWT63lEF1SGCpmQ==
X-Google-Smtp-Source: AGHT+IHavrKs5gCTfWWE/t+GviSN/fOuRjyg21bPxGHplb1KOZPOkEuhUgKCY8nRPYJZqATj3n1jgw==
X-Received: by 2002:a2e:9f10:0:b0:2c5:6ab:b817 with SMTP id u16-20020a2e9f10000000b002c506abb817mr22837219ljk.5.1699354576498;
        Tue, 07 Nov 2023 02:56:16 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:15 -0800 (PST)
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
Subject: [PATCH v3 13/20] riscv: hwprobe: export Zhintntl ISA extension
Date: Tue,  7 Nov 2023 11:55:49 +0100
Message-ID: <20231107105556.517187-14-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_025619_300555_AB2C4385 
X-CRM114-Status: GOOD (  11.67  )
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

RXhwb3J0IFppaGludG50bCBleHRlbnNpb25bMV0gdGhyb3VnaCBod3Byb2JlLgoKTGluazogaHR0
cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xM193c044WW1SZkg4WVd5c0Z5VFgtRGpUa0Nu
QmQ5aGovdmlldyBbMV0KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2
b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+Ci0t
LQogRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDMgKysrCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9z
eXNfcmlzY3YuYyAgICAgICAgIHwgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0Rv
Y3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAppbmRleCBjZTA0OTBlMzEzMGMuLjJm
MzdiMjZkMjdkYSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUu
cnN0CisrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdApAQCAtMTQzLDYg
KzE0Myw5IEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKICAgKiA6YzptYWNybzpg
UklTQ1ZfSFdQUk9CRV9FWFRfWkZITUlOYDogVGhlIFpmaG1pbiBleHRlbnNpb24gdmVyc2lvbiAx
LjAgaXMKICAgICAgICBzdXBwb3J0ZWQgYXMgZGVmaW5lZCBpbiB0aGUgUklTQy1WIElTQSBtYW51
YWwuCiAKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWklISU5UTlRMYDogVGhlIFpp
aGludG50bCBleHRlbnNpb24gdmVyc2lvbiAxLjAKKyAgICAgICBpcyBzdXBwb3J0ZWQgYXMgZGVm
aW5lZCBpbiB0aGUgUklTQy1WIElTQSBtYW51YWwuCisKICogOmM6bWFjcm86YFJJU0NWX0hXUFJP
QkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0bWFzayB0aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCiAg
IGluZm9ybWF0aW9uIGFib3V0IHRoZSBzZWxlY3RlZCBzZXQgb2YgcHJvY2Vzc29ycy4KIApkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKaW5kZXggMTI2ODAwODFjNjAyLi4zNmM4ZDA3
M2M5ODcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgK
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaApAQCAtNTEsNiArNTEs
NyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9a
VktUCQkoMSA8PCAyNSkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pGSAkJKDEgPDwgMjYp
CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aRkhNSU4JKDEgPDwgMjcpCisjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX0VYVF9aSUhJTlROVEwJKDEgPDwgMjgpCiAjZGVmaW5lIFJJU0NWX0hXUFJP
QkVfS0VZX0NQVVBFUkZfMAk1CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5L
Tk9XTgkoMCA8PCAwKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVE
CSgxIDw8IDApCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCmluZGV4IDQ4NmUwNTNhMDc5Ny4uYWYyYjAxYjBh
NWI2IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYworKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwpAQCAtMTcyLDYgKzE3Miw3IEBAIHN0YXRpYyB2b2lk
IGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCUNIRUNLX0lT
QV9FWFQoWktTRUQpOwogCQlDSEVDS19JU0FfRVhUKFpLU0gpOwogCQlDSEVDS19JU0FfRVhUKFpL
VCk7CisJCUNIRUNLX0lTQV9FWFQoWklISU5UTlRMKTsKIAogCQlpZiAoaGFzX3ZlY3RvcigpKSB7
CiAJCQlDSEVDS19JU0FfRVhUKFpWQkIpOwotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
