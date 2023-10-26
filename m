Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6536C25B67
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Tfyj7dGDGfvdXdyvmipR/V/Hgy0FI7xt/WXQLVJOhM=; b=GBHl7WlOjq9bdi
	Fgnxzd4/Y0UGEOEKdwOP6p+gtuy2YxC9qPjepb9yGVwBCWt6flzCAQXOTaLmixBr0luPtYO+eewQs
	g/jk9jOm63ret+d5IQD1Y0LB7HLZksqhwGbCng+t1cBu99j7GZ453qkRptDQr3C2bl5ld9WNct/c/
	Ql6eH09d77nCTUFWKbGyuQ08OIyCFuvSlBSJqfaUZtnOWvKZH4vLiNkTqTmaHBXxcTEtNuDXZuFJr
	1dKYb5lq3yqfgggfyYvMnvPQCpsUM5VS+AGlO5XqCae8iT/zgNuugUMX1JKeNlZchB9rNAGIPtT80
	gmCEo8hMn/z4yOM1isjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1OV-00EgTj-2K;
	Thu, 26 Oct 2023 14:31:31 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1OT-00EgRs-17
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 14:31:31 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50819c4ad6fso316700e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 07:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698330688; x=1698935488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1dcX0dIRRrObAnF5frYkpK4OuCll9+8enWqXlC/Z8E=;
        b=1cPdyat9CPAhqNShKboqkMXKImKCGkSEuIKH/TW72JsKEwZsbuVrGoXzit8JkvkJOZ
         ll4g5O4g7+d8XZSh8KdOx6OEvnRxBuLAl8Ht5AeSUrJ0oH2eoJ7rf1FSkMKn7BEF1yAO
         urQcJbbf3r3WL1vYSx1+5AB84nR9L8Kq9IH4xY2M86/aq5mKNmK4Z/nGzOM3/pzXmrt0
         rBFwg4Ym77iyLTlRDoH27UbbQGuYCFE1O3LEuWr9u/+kE6Z12zDiMBQKCPaBvL6PU317
         NAPoi3HTql15rxciYqo/0EVEncZarZ1Hkcmq0fkg9FzI6nPncqfMhXyzVpfrITpwFdnW
         nmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698330688; x=1698935488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1dcX0dIRRrObAnF5frYkpK4OuCll9+8enWqXlC/Z8E=;
        b=IPBBTO6z1dorVUFMQaR+MyjY4NK7/EsrZySmpJscN2Y4i+Nl6Fz3OorcDhmNMeegsV
         xSDpRzrnKt8BBD+AHXVfYbYzsFK/wj98PvzOrSyHv0TdtxGoGSa3sM5euFgEwyeSisCR
         FVOenbP/Ungn6eREI/J9hGxYCnyO+ylnOxLrFgUiQ2GXKaGl2DslH3JXWJdB8ly775JJ
         SlEy5WE8OPkiYOgTRUjuUqGjLBXsS89Ttg/EpvJxQCQEtbc5xx8dFY/naw+45779aN/p
         nb6sOQbkS9p47QF4NytrV3bd6jC7s6FS0iLPZ3jP6kXWtfmEklQXvGxfhUzsnOIkFE04
         KI/w==
X-Gm-Message-State: AOJu0YwUgsHpPPE43hEpjMHzfc2c+NvfMy/i97eH3ezMhR+d6J7G/KDM
	m+DQG0M7gdpXsFU/yz23QL1Q1v1nGf0Ya6nruDKIeg==
X-Google-Smtp-Source: AGHT+IFmVffviYe4SnJWF87coMF05M74cu5j7URH/064z6PBGryKofvqvntRSm7MdXJtr+wPs+ZT7Q==
X-Received: by 2002:a05:6512:3c8f:b0:507:94be:adcf with SMTP id h15-20020a0565123c8f00b0050794beadcfmr13384462lfv.2.1698330687613;
        Thu, 26 Oct 2023 07:31:27 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:b380:32be:257:5381])
        by smtp.gmail.com with ESMTPSA id r9-20020a056000014900b003232f167df5sm14316589wrx.108.2023.10.26.07.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 07:31:27 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH 1/3] riscv: add SBI SSE extension definitions
Date: Thu, 26 Oct 2023 16:31:20 +0200
Message-ID: <20231026143122.279437-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026143122.279437-1-cleger@rivosinc.com>
References: <20231026143122.279437-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_073129_571387_F01E627D 
X-CRM114-Status: GOOD (  10.55  )
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
Y3YvaW5jbHVkZS9hc20vc2JpLmggfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3NiaS5jICAgICAgfCAgNCArKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDQyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAppbmRleCA1YjRhMWJmNWY0
MzkuLjJlOTljYWZlN2ZlZCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmku
aAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCkBAIC0zMCw2ICszMCw3IEBAIGVu
dW0gc2JpX2V4dF9pZCB7CiAJU0JJX0VYVF9IU00gPSAweDQ4NTM0RCwKIAlTQklfRVhUX1NSU1Qg
PSAweDUzNTI1MzU0LAogCVNCSV9FWFRfUE1VID0gMHg1MDRENTUsCisJU0JJX0VYVF9TU0UgPSAw
eDUzNTM0NSwKIAogCS8qIEV4cGVyaW1lbnRhbHMgZXh0ZW5zaW9ucyBtdXN0IGxpZSB3aXRoaW4g
dGhpcyByYW5nZSAqLwogCVNCSV9FWFRfRVhQRVJJTUVOVEFMX1NUQVJUID0gMHgwODAwMDAwMCwK
QEAgLTIzNiw2ICsyMzcsNDAgQEAgZW51bSBzYmlfcG11X2N0cl90eXBlIHsKIC8qIEZsYWdzIGRl
ZmluZWQgZm9yIGNvdW50ZXIgc3RvcCBmdW5jdGlvbiAqLwogI2RlZmluZSBTQklfUE1VX1NUT1Bf
RkxBR19SRVNFVCAoMSA8PCAwKQogCitlbnVtIHNiaV9leHRfc3NlX2ZpZCB7CisJU0JJX1NTRV9F
VkVOVF9BVFRSX0dFVCA9IDAsCisJU0JJX1NTRV9FVkVOVF9BVFRSX1NFVCwKKwlTQklfU1NFX0VW
RU5UX1JFR0lTVEVSLAorCVNCSV9TU0VfRVZFTlRfVU5SRUdJU1RFUiwKKwlTQklfU1NFX0VWRU5U
X0VOQUJMRSwKKwlTQklfU1NFX0VWRU5UX0RJU0FCTEUsCisJU0JJX1NTRV9FVkVOVF9DT01QTEVU
RSwKKwlTQklfU1NFX0VWRU5UX1NJR05BTCwKK307CisKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9M
T0NBTF9SQVMJCTB4MDAwMDAwMDAKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9HTE9CQUxfUkFTCTB4
MDAwMDgwMDAKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NBTF9BU1lOQ19QRgkweDAwMDEwMDAw
CisjZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfUE1VCQkweDAwMDEwMDAxCisjZGVmaW5lIFNC
SV9TU0VfRVZFTlRfTE9DQUxfREVCVUcJMHhmZmZmM2ZmZgorI2RlZmluZSBTQklfU1NFX0VWRU5U
X0dMT0JBTF9ERUJVRwkweGZmZmZiZmZmCisKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9HTE9CQUwJ
CSgxIDw8IDE1KQorI2RlZmluZSBTQklfU1NFX0VWRU5UX1BMQVRGT1JNCQkoMSA8PCAxNCkKKwor
ZW51bSBzYmlfc3NlX2V2ZW50X2F0dHIgeworCVNCSV9TU0VfRVZFTlRfQVRUUl9TVEFURSA9IDAs
CisJU0JJX1NTRV9FVkVOVF9BVFRSX1BSSU9SSVRZLAorCVNCSV9TU0VfRVZFTlRfQVRUUl9JTkpF
Q1RJT04sCisJU0JJX1NTRV9FVkVOVF9BVFRSX0hBUlRfSUQsCisJU0JJX1NTRV9FVkVOVF9BVFRS
X1JBV19QRU5ESU5HX1NUQVRVUywKK307CisKK2VudW0gc2JpX3NzZV9ldmVudF9oYW5kbGVyX3N0
cyB7CisJU0JJX1NTRV9IQU5ETEVSX1NVQ0NFU1MJPSAwLAorCVNCSV9TU0VfSEFORExFUl9GQUlM
RUQsCit9OworCiAjZGVmaW5lIFNCSV9TUEVDX1ZFUlNJT05fREVGQVVMVAkweDEKICNkZWZpbmUg
U0JJX1NQRUNfVkVSU0lPTl9NQUpPUl9TSElGVAkyNAogI2RlZmluZSBTQklfU1BFQ19WRVJTSU9O
X01BSk9SX01BU0sJMHg3ZgpAQCAtMjUxLDYgKzI4Niw5IEBAIGVudW0gc2JpX3BtdV9jdHJfdHlw
ZSB7CiAjZGVmaW5lIFNCSV9FUlJfQUxSRUFEWV9BVkFJTEFCTEUgLTYKICNkZWZpbmUgU0JJX0VS
Ul9BTFJFQURZX1NUQVJURUQgLTcKICNkZWZpbmUgU0JJX0VSUl9BTFJFQURZX1NUT1BQRUQgLTgK
KyNkZWZpbmUgU0JJX0VSUl9JTlZBTElEX1NUQVRFCS0xMAorI2RlZmluZSBTQklfRVJSX0JBRF9S
QU5HRQktMTEKKyNkZWZpbmUgU0JJX0VSUl9CVVNZCQktMTIKIAogZXh0ZXJuIHVuc2lnbmVkIGxv
bmcgc2JpX3NwZWNfdmVyc2lvbjsKIHN0cnVjdCBzYmlyZXQgewpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwppbmRleCBjNjcyYzhi
YTlhMmEuLjEzYjYzYjM4M2Q0ZSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMK
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKQEAgLTU2LDkgKzU2LDEzIEBAIGludCBzYmlf
ZXJyX21hcF9saW51eF9lcnJubyhpbnQgZXJyKQogCWNhc2UgU0JJX0VSUl9ERU5JRUQ6CiAJCXJl
dHVybiAtRVBFUk07CiAJY2FzZSBTQklfRVJSX0lOVkFMSURfUEFSQU06CisJY2FzZSBTQklfRVJS
X0JBRF9SQU5HRToKKwljYXNlIFNCSV9FUlJfSU5WQUxJRF9TVEFURToKIAkJcmV0dXJuIC1FSU5W
QUw7CiAJY2FzZSBTQklfRVJSX0lOVkFMSURfQUREUkVTUzoKIAkJcmV0dXJuIC1FRkFVTFQ7CisJ
Y2FzZSBTQklfRVJSX0JVU1k6CisJCXJldHVybiAtRUJVU1k7CiAJY2FzZSBTQklfRVJSX05PVF9T
VVBQT1JURUQ6CiAJY2FzZSBTQklfRVJSX0ZBSUxVUkU6CiAJZGVmYXVsdDoKLS0gCjIuNDIuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
