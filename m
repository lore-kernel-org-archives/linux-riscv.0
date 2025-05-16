Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BEEC54754
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 15:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wU+P9B1rOk0xW8K+CX+5IHFWZf2SrkcyQPNA06oxXCs=; b=l4yMwleG+BIe+w
	AY0xiWrVMdsrSXazqNRGKNR5ZpWyh696UABudeShgC9MywbwD7ZfW0KDGTtYi8o1CLFzREyu0ts6Q
	am+wAZNU92qnBzOjj+O3gRdAYCMQz9Sb2j6//EyNpgXsrvqeWF9RN2OaiXVt3JqkSbj25BnQEwYrP
	+9kaYfSZnu4iNF0o+ZFFq98Ag3omRv2ZXfpLCKIZGCIxZsmQbwpRtwJ349K9khZQchtC3sdRTAzN+
	W+dXOi9xS2SUQRv8Y0qDkRtKv58shXaoIUXgWAFvjYVqyKp0kpLetPEDZUQq0Nb6d1CT0BAcqm6yO
	al9XUiHYu/L1RBuLx+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxQA-00000003v9o-3kos;
	Fri, 16 May 2025 15:56:26 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwv3-00000003qBT-2yBL
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 15:24:19 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so2038586b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 May 2025 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747409057; x=1748013857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKbGApiEtkT8/WDx/Modbo6eDPhoN4O6DcMv04ORqek=;
        b=LnrIlf2npslBvgrACH9IXuv1I9OIvZcDy+QNVhjNm2gQVtpoReN6pMgFkFs6zUgyqI
         TBI7OtjqlDcCtlu7LwKZ9S4YodPYC9kLF5NgXO3sbOmwmI71IXkKRYrDeL88dAHU4HYM
         J27rR0m3sONimdegcNBR5POwF9oQfkSsSPSITeZh/y7mKIlP1Nj7OGaDewaIF89Z6DbZ
         9V1MdkIF2eVNEXa90AIhTTdDtoO53qGMVIv0kAcIcIQ7e2gGWmMtzrx3Im1lbx8a5BdK
         fijM5HO1hpXl2sprjhKsR0m2wBR9ml2uQBuas+atO+J/cOFBOB/7lgYC/eMQfNuj11ad
         5dQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747409057; x=1748013857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKbGApiEtkT8/WDx/Modbo6eDPhoN4O6DcMv04ORqek=;
        b=oDYmgFgOvFai7wL8dwZwUbNdqHvSDMh2R1eP4ICAHegFx0k7YEx/Niq1vIQsFAzB6X
         +4OJxISqMMzp7uimuslSjw2j/i7dg/nvRhqjB3JrKutDJcViIevn/NYFnyoDiVHfvClB
         Jm8PUBYWb+bp1egQBpaSvF6xrukEyz8E5NLJdnsguKxTWizflN8uy/1ZQ9Swu1OqyLnu
         ZJDRqR76pvkdkeKEJj7IRfoP6QDf+Wmw3jmPaIJj0joHXx0nGS86R3aYHWkWrvrQcvtU
         izgJzHeGNy6KhpLzP+Rlja2XpnSGHkIe627UEEUvPYGAFXnZAMErRpBOuYDTjwogWaOi
         XamQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkosfLlErbvG1j+Z+vGVuqRtKWs7K3EG2CHSLMLTS6EMkVU8yNGnQEXTDDnxbX3UalzU5nHU/4Is9nSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDbZ7N8GdzU9Ec91Q5IQXw1aOSEX2w7O2DluPq0VdtFIidRx2I
	IwmX1VXueExA6OFUXc7em+GMRliUVLp3C8puGjTFIMmbm4IBJlmSuYt55eFraYdDX5A=
X-Gm-Gg: ASbGncuMQi4wXUMDIuG0XVeajI7leue8ekhHfFKA4rgv+zk6FY0aaBgTWCIjpbEFZTZ
	Mqzrcr4blT2+z3UXxcpDPTpqIN1kiUcqxqc3a+Z0X2vYrR0EOdBSBICK9Zif+KuG4Uq2P/RXX8g
	MDVzA8AqE7E6Rz0FkWOdgOh2HXc/oaU7Vp0EIVoaA9MF1y4lxd74nfVTc8CBRXBM3N4ETcVl0ia
	ci6176cREipGULZh6wOohqFrNtHnJG9bApTA/XSBygG36j+6qfJvRvw9yE2RW200Ir1dRXXHLn7
	u8HFBKy4aNPvJFmYKhGgL0b+VGWXr8pkSTipJ9KLZ2/Jno6GYIBCUOLfX5/MmXI=
X-Google-Smtp-Source: AGHT+IEPys89YDQJYKU3/9Q96sLuGwipd4FD9peTZgU8hGsM8WzNmpqONcesktg1K7D9UT/m6i5B0Q==
X-Received: by 2002:a05:6a20:12ca:b0:1f3:418c:6281 with SMTP id adf61e73a8af0-21621875ab8mr5817835637.4.1747409056778;
        Fri, 16 May 2025 08:24:16 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96def68sm1666997b3a.30.2025.05.16.08.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 08:24:16 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Atish Patra <atishp@atishpatra.org>
Subject: [PATCH v4 1/4] riscv: add SBI SSE extension definitions
Date: Fri, 16 May 2025 17:23:39 +0200
Message-ID: <20250516152355.560448-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516152355.560448-1-cleger@rivosinc.com>
References: <20250516152355.560448-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_082417_755236_CB3F84EC 
X-CRM114-Status: UNSURE (   9.89  )
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

QWRkIG5lZWRlZCBkZWZpbml0aW9ucyBmb3IgU0JJIFN1cGVydmlzb3IgU29mdHdhcmUgRXZlbnRz
IGV4dGVuc2lvbiBbMV0uClRoaXMgZXh0ZW5zaW9uIGVuYWJsZXMgdGhlIFNCSSB0byBpbmplY3Qg
ZXZlbnRzIGludG8gc3VwZXJ2aXNvciBzb2Z0d2FyZQptdWNoIGxpa2UgQVJNIFNERUkuCgpbMV0g
aHR0cHM6Ly9saXN0cy5yaXNjdi5vcmcvZy90ZWNoLXBycy9tZXNzYWdlLzUxNQoKU2lnbmVkLW9m
Zi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vc2JpLmggfCA2NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgK
aW5kZXggM2QyNTA4MjQxNzhiLi40ZDdmODFjNjIwZWYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc2JpLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaApAQCAt
MzUsNiArMzUsNyBAQCBlbnVtIHNiaV9leHRfaWQgewogCVNCSV9FWFRfREJDTiA9IDB4NDQ0MjQz
NEUsCiAJU0JJX0VYVF9TVEEgPSAweDUzNTQ0MSwKIAlTQklfRVhUX05BQ0wgPSAweDRFNDE0MzRD
LAorCVNCSV9FWFRfU1NFID0gMHg1MzUzNDUsCiAKIAkvKiBFeHBlcmltZW50YWxzIGV4dGVuc2lv
bnMgbXVzdCBsaWUgd2l0aGluIHRoaXMgcmFuZ2UgKi8KIAlTQklfRVhUX0VYUEVSSU1FTlRBTF9T
VEFSVCA9IDB4MDgwMDAwMDAsCkBAIC00MDIsNiArNDAzLDY2IEBAIGVudW0gc2JpX2V4dF9uYWNs
X2ZlYXR1cmUgewogI2RlZmluZSBTQklfTkFDTF9TSE1FTV9TUkVUX1goX19pKQkJKChfX3Jpc2N2
X3hsZW4gLyA4KSAqIChfX2kpKQogI2RlZmluZSBTQklfTkFDTF9TSE1FTV9TUkVUX1hfTEFTVAkJ
MzEKIAorZW51bSBzYmlfZXh0X3NzZV9maWQgeworCVNCSV9TU0VfRVZFTlRfQVRUUl9SRUFEID0g
MCwKKwlTQklfU1NFX0VWRU5UX0FUVFJfV1JJVEUsCisJU0JJX1NTRV9FVkVOVF9SRUdJU1RFUiwK
KwlTQklfU1NFX0VWRU5UX1VOUkVHSVNURVIsCisJU0JJX1NTRV9FVkVOVF9FTkFCTEUsCisJU0JJ
X1NTRV9FVkVOVF9ESVNBQkxFLAorCVNCSV9TU0VfRVZFTlRfQ09NUExFVEUsCisJU0JJX1NTRV9F
VkVOVF9TSUdOQUwsCisJU0JJX1NTRV9FVkVOVF9IQVJUX1VOTUFTSywKKwlTQklfU1NFX0VWRU5U
X0hBUlRfTUFTSywKK307CisKK2VudW0gc2JpX3NzZV9zdGF0ZSB7CisJU0JJX1NTRV9TVEFURV9V
TlVTRUQgICAgID0gMCwKKwlTQklfU1NFX1NUQVRFX1JFR0lTVEVSRUQgPSAxLAorCVNCSV9TU0Vf
U1RBVEVfRU5BQkxFRCAgICA9IDIsCisJU0JJX1NTRV9TVEFURV9SVU5OSU5HICAgID0gMywKK307
CisKKy8qIFNCSSBTU0UgRXZlbnQgQXR0cmlidXRlcy4gKi8KK2VudW0gc2JpX3NzZV9hdHRyX2lk
IHsKKwlTQklfU1NFX0FUVFJfU1RBVFVTCQk9IDB4MDAwMDAwMDAsCisJU0JJX1NTRV9BVFRSX1BS
SU8JCT0gMHgwMDAwMDAwMSwKKwlTQklfU1NFX0FUVFJfQ09ORklHCQk9IDB4MDAwMDAwMDIsCisJ
U0JJX1NTRV9BVFRSX1BSRUZFUlJFRF9IQVJUCT0gMHgwMDAwMDAwMywKKwlTQklfU1NFX0FUVFJf
RU5UUllfUEMJCT0gMHgwMDAwMDAwNCwKKwlTQklfU1NFX0FUVFJfRU5UUllfQVJHCQk9IDB4MDAw
MDAwMDUsCisJU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX1NFUEMJPSAweDAwMDAwMDA2LAorCVNC
SV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9GTEFHUwk9IDB4MDAwMDAwMDcsCisJU0JJX1NTRV9BVFRS
X0lOVEVSUlVQVEVEX0E2CT0gMHgwMDAwMDAwOCwKKwlTQklfU1NFX0FUVFJfSU5URVJSVVBURURf
QTcJPSAweDAwMDAwMDA5LAorCisJU0JJX1NTRV9BVFRSX01BWAkJPSAweDAwMDAwMDBBCit9Owor
CisjZGVmaW5lIFNCSV9TU0VfQVRUUl9TVEFUVVNfU1RBVEVfT0ZGU0VUCTAKKyNkZWZpbmUgU0JJ
X1NTRV9BVFRSX1NUQVRVU19TVEFURV9NQVNLCQkweDMKKyNkZWZpbmUgU0JJX1NTRV9BVFRSX1NU
QVRVU19QRU5ESU5HX09GRlNFVAkyCisjZGVmaW5lIFNCSV9TU0VfQVRUUl9TVEFUVVNfSU5KRUNU
X09GRlNFVAkzCisKKyNkZWZpbmUgU0JJX1NTRV9BVFRSX0NPTkZJR19PTkVTSE9UCSgxIDw8IDAp
CisKKyNkZWZpbmUgU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX0ZMQUdTX1NTVEFUVVNfU1BQCSgx
IDw8IDApCisjZGVmaW5lIFNCSV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9GTEFHU19TU1RBVFVTX1NQ
SUUJKDEgPDwgMSkKKyNkZWZpbmUgU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX0ZMQUdTX0hTVEFU
VVNfU1BWCSgxIDw8IDIpCisjZGVmaW5lIFNCSV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9GTEFHU19I
U1RBVFVTX1NQVlAJKDEgPDwgMykKKworI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX0hJR0hf
UFJJT19SQVMJMHgwMDAwMDAwMAorI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX0RPVUJMRV9U
UkFQCQkweDAwMDAwMDAxCisjZGVmaW5lIFNCSV9TU0VfRVZFTlRfR0xPQkFMX0hJR0hfUFJJT19S
QVMJMHgwMDAwODAwMAorI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1BNVV9PVkVSRkxPVwkw
eDAwMDEwMDAwCisjZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfTE9XX1BSSU9fUkFTCTB4MDAx
MDAwMDAKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9HTE9CQUxfTE9XX1BSSU9fUkFTCTB4MDAxMDgw
MDAKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9TT0ZUV0FSRV9JTkpFQ1RFRAkweGZmZmYw
MDAwCisjZGVmaW5lIFNCSV9TU0VfRVZFTlRfR0xPQkFMX1NPRlRXQVJFX0lOSkVDVEVECTB4ZmZm
ZjgwMDAKKworI2RlZmluZSBTQklfU1NFX0VWRU5UX1BMQVRGT1JNCQkoMSA8PCAxNCkKKyNkZWZp
bmUgU0JJX1NTRV9FVkVOVF9HTE9CQUwJCSgxIDw8IDE1KQorCiAvKiBTQkkgc3BlYyB2ZXJzaW9u
IGZpZWxkcyAqLwogI2RlZmluZSBTQklfU1BFQ19WRVJTSU9OX0RFRkFVTFQJMHgxCiAjZGVmaW5l
IFNCSV9TUEVDX1ZFUlNJT05fTUFKT1JfU0hJRlQJMjQKQEAgLTQxOSw2ICs0ODAsOCBAQCBlbnVt
IHNiaV9leHRfbmFjbF9mZWF0dXJlIHsKICNkZWZpbmUgU0JJX0VSUl9BTFJFQURZX1NUQVJURUQg
LTcKICNkZWZpbmUgU0JJX0VSUl9BTFJFQURZX1NUT1BQRUQgLTgKICNkZWZpbmUgU0JJX0VSUl9O
T19TSE1FTQktOQorI2RlZmluZSBTQklfRVJSX0lOVkFMSURfU1RBVEUJLTEwCisjZGVmaW5lIFNC
SV9FUlJfQkFEX1JBTkdFCS0xMQogCiBleHRlcm4gdW5zaWduZWQgbG9uZyBzYmlfc3BlY192ZXJz
aW9uOwogc3RydWN0IHNiaXJldCB7CkBAIC01MDUsNiArNTY4LDggQEAgc3RhdGljIGlubGluZSBp
bnQgc2JpX2Vycl9tYXBfbGludXhfZXJybm8oaW50IGVycikKIAljYXNlIFNCSV9FUlJfREVOSUVE
OgogCQlyZXR1cm4gLUVQRVJNOwogCWNhc2UgU0JJX0VSUl9JTlZBTElEX1BBUkFNOgorCWNhc2Ug
U0JJX0VSUl9CQURfUkFOR0U6CisJY2FzZSBTQklfRVJSX0lOVkFMSURfU1RBVEU6CiAJCXJldHVy
biAtRUlOVkFMOwogCWNhc2UgU0JJX0VSUl9JTlZBTElEX0FERFJFU1M6CiAJCXJldHVybiAtRUZB
VUxUOwotLSAKMi40OS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
