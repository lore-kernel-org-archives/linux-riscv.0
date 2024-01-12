Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEE2C4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 11:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmC1ZNikw4A/tCE8GRi9I2dQoY5NumCTEAUgtlreekA=; b=OWPZ3ElMxy6SFm
	rxJeC2jO1Er1p+xDvhDbv3QaPI70bJlo4ov3K19seCOjJKVJcrDrXygSSaDsrk5hNDs8qBfIQwRvv
	eljz/6SnptnrkVI29fu/7SeTMQVoR6VZOtNo67joGPJC/aZ8Z9rb6pDULWh6uvdfF+MTye/uAGDa1
	/aVInKGHonV2hDKmTe8yrKMtJ3AEFX2ghi734W6f0TAlcJ3xkkmC0a+YMJabq1cjQBtIysB2Hrh+3
	9jIE4eCOGt9QO5IIxO8KLt9ljDN+n/M3bhgTTzDQPurXGHqzVoHqbkoQ4qOS7H1Ry4cQYgN/7Ncsc
	4mGoiqVrVinB7QCbDuQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOFXm-002ZO7-2r;
	Fri, 12 Jan 2024 11:17:46 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOFXj-002ZMI-1C
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 11:17:44 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-28d00f8ddbaso1481258a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 03:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705058262; x=1705663062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPz3Ba2qsBHXEcQ86Ca39sCiPs3HQbwo2qACoN41JeA=;
        b=T+DD9ud/GALQrxBqZI68vyYPvwLaF45SqEYzqtsD7RQvoV+adQ09QaY/1oBfUGv9q3
         2+AeSo7+iFblol3GGZ+spKlWMr7J0qGPJWxw3horZwx0YB2BoRisOikWe46UzI+1PhpI
         5da28zLYv21Rm9XbeM+X50I4mZId4DHEXSQONPC6xEXsNu1KqhvYjg+lL1VLf7EQ9bFD
         ALHe+bRTRffijOq9z814+dFClMyOYsiSWGyDe9bZaB6nQZ2fcYbLsJS6hr7yWTju5Hxg
         ZHBwnvCDbTgR+bRTSmGRHpDwhmYdYBYTEyDo2TwON7pHX5dRc9H18aV3WRzzNmuM/6uj
         kYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705058262; x=1705663062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BPz3Ba2qsBHXEcQ86Ca39sCiPs3HQbwo2qACoN41JeA=;
        b=t0bGVbSi1DWXVW9pK/UUWCYpn1qyJENHy8TrjlGKuZ6LiAr54mRG9W3xB+ado6fnHH
         MK/8BIaj48bZJ/ZrpxJgVVaA4wnZL86g94mc5TrBIpEwD3MGxUjLBzVO5Pbxb6QK/Etn
         gqWGtBZwrKe5E5MRCStxQlZEfTIjoJxED7ZkbmIcDTgVp7zvI22Vjh1MZV0seOOhMUWB
         hli4xvYVeqFEtspoTeJVR4UjZ9h/9+ZMWcmO+5bf8JDMgEk+bdzJQKll+p/JyqxHQ9T9
         B+VwJFMzhAH3hqpdRFJsNyea6tf1nb/Ix6zbHSwWtkWxgtmSCXuaCI7lCSjdRrxFjBCs
         hn2w==
X-Gm-Message-State: AOJu0Yxy1D8QVMakjU9upUaDINZ11B0zMbOUl7LZbMcEVtabUalQWKey
	S0Ri6B6KFK8RsWIXO12si1o6yh+olxIFKA==
X-Google-Smtp-Source: AGHT+IFVJJimodUIGj6PoQdC5SEaQIRT46Bqli7WQ7LcyrkwR9voMH6TUpcHgpr8DRtDtz2TFWl/UQ==
X-Received: by 2002:a17:90b:4c42:b0:28e:fa5:7afd with SMTP id np2-20020a17090b4c4200b0028e0fa57afdmr681589pjb.4.1705058261938;
        Fri, 12 Jan 2024 03:17:41 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:a276:8a4e:2aa1:5f09])
        by smtp.gmail.com with ESMTPSA id sd12-20020a17090b514c00b0028cef021d45sm3794179pjb.17.2024.01.12.03.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 03:17:41 -0800 (PST)
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
Subject: [RFC PATCH v2 1/3] riscv: add SBI SSE extension definitions
Date: Fri, 12 Jan 2024 12:17:13 +0100
Message-ID: <20240112111720.2975069-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112111720.2975069-1-cleger@rivosinc.com>
References: <20240112111720.2975069-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_031743_408285_0B494333 
X-CRM114-Status: UNSURE (   9.76  )
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
Y3YvaW5jbHVkZS9hc20vc2JpLmggfCA0NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3NiaS5jICAgICAgfCAgNCArKysKIDIgZmlsZXMgY2hh
bmdlZCwgNTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCmluZGV4IDA4OTJmNDQyMWJj
NC4uMTFjYWQzZWM0YTE4IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5o
CisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKQEAgLTMxLDYgKzMxLDcgQEAgZW51
bSBzYmlfZXh0X2lkIHsKIAlTQklfRVhUX1NSU1QgPSAweDUzNTI1MzU0LAogCVNCSV9FWFRfUE1V
ID0gMHg1MDRENTUsCiAJU0JJX0VYVF9EQkNOID0gMHg0NDQyNDM0RSwKKwlTQklfRVhUX1NTRSA9
IDB4NTM1MzQ1LAogCiAJLyogRXhwZXJpbWVudGFscyBleHRlbnNpb25zIG11c3QgbGllIHdpdGhp
biB0aGlzIHJhbmdlICovCiAJU0JJX0VYVF9FWFBFUklNRU5UQUxfU1RBUlQgPSAweDA4MDAwMDAw
LApAQCAtMjQzLDYgKzI0NCw0OSBAQCBlbnVtIHNiaV9leHRfZGJjbl9maWQgewogCVNCSV9FWFRf
REJDTl9DT05TT0xFX1dSSVRFX0JZVEUgPSAyLAogfTsKIAorZW51bSBzYmlfZXh0X3NzZV9maWQg
eworCVNCSV9TU0VfRVZFTlRfQVRUUl9SRUFEID0gMCwKKwlTQklfU1NFX0VWRU5UX0FUVFJfV1JJ
VEUsCisJU0JJX1NTRV9FVkVOVF9SRUdJU1RFUiwKKwlTQklfU1NFX0VWRU5UX1VOUkVHSVNURVIs
CisJU0JJX1NTRV9FVkVOVF9FTkFCTEUsCisJU0JJX1NTRV9FVkVOVF9ESVNBQkxFLAorCVNCSV9T
U0VfRVZFTlRfQ09NUExFVEUsCisJU0JJX1NTRV9FVkVOVF9TSUdOQUwsCit9OworCitlbnVtIHNi
aV9zc2VfZXZlbnRfYXR0ciB7CisJU0JJX1NTRV9BVFRSX1NUQVRVUyA9IDAsCisJU0JJX1NTRV9B
VFRSX1BSSU8sCisJU0JJX1NTRV9BVFRSX0NPTkZJRywKKwlTQklfU1NFX0FUVFJfUFJFRkVSUkVE
X0hBUlQsCisJU0JJX1NTRV9BVFRSX0VOVFJZX1BDLAorCVNCSV9TU0VfQVRUUl9FTlRSWV9BMCwK
KwlTQklfU1NFX0FUVFJfRU5UUllfQTYsCisJU0JJX1NTRV9BVFRSX0VOVFJZX0E3LAorCVNCSV9T
U0VfQVRUUl9JTlRFUlJVUFRFRF9NT0RFLAorCVNCSV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9QQywK
KwlTQklfU1NFX0FUVFJfSU5URVJSVVBURURfQTAsCisJU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVE
X0E2LAorCVNCSV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9BNywKK307CisKKyNkZWZpbmUgU0JJX1NT
RV9BVFRSX1NUQVRVU19TVEFURV9PRkZTRVQJMAorI2RlZmluZSBTQklfU1NFX0FUVFJfU1RBVFVT
X1NUQVRFX01BU0sJCTB4MworI2RlZmluZSBTQklfU1NFX0FUVFJfU1RBVFVTX1BFTkRJTkdfT0ZG
U0VUCTIKKyNkZWZpbmUgU0JJX1NTRV9BVFRSX1NUQVRVU19JTkpFQ1RfT0ZGU0VUCTMKKworI2Rl
ZmluZSBTQklfU1NFX0FUVFJfQ09ORklHX09ORVNIT1QJKDEgPDwgMCkKKworI2RlZmluZSBTQklf
U1NFX0VWRU5UX0xPQ0FMX1JBUwkJMHgwMDAwMDAwMAorI2RlZmluZSBTQklfU1NFX0VWRU5UX0dM
T0JBTF9SQVMJMHgwMDAwODAwMAorI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1BNVQkJMHgw
MDAxMDAwMAorI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1NPRlRXQVJFCTB4ZmZmZjAwMDAK
KyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9HTE9CQUxfU09GVFdBUkUJMHhmZmZmODAwMAorCisjZGVm
aW5lIFNCSV9TU0VfRVZFTlRfR0xPQkFMCQkoMSA8PCAxNSkKKyNkZWZpbmUgU0JJX1NTRV9FVkVO
VF9QTEFURk9STQkJKDEgPDwgMTQpCisKICNkZWZpbmUgU0JJX1NQRUNfVkVSU0lPTl9ERUZBVUxU
CTB4MQogI2RlZmluZSBTQklfU1BFQ19WRVJTSU9OX01BSk9SX1NISUZUCTI0CiAjZGVmaW5lIFNC
SV9TUEVDX1ZFUlNJT05fTUFKT1JfTUFTSwkweDdmCkBAIC0yNTgsNiArMzAyLDkgQEAgZW51bSBz
YmlfZXh0X2RiY25fZmlkIHsKICNkZWZpbmUgU0JJX0VSUl9BTFJFQURZX0FWQUlMQUJMRSAtNgog
I2RlZmluZSBTQklfRVJSX0FMUkVBRFlfU1RBUlRFRCAtNwogI2RlZmluZSBTQklfRVJSX0FMUkVB
RFlfU1RPUFBFRCAtOAorI2RlZmluZSBTQklfRVJSX0lOVkFMSURfU1RBVEUJLTEwCisjZGVmaW5l
IFNCSV9FUlJfQkFEX1JBTkdFCS0xMQorI2RlZmluZSBTQklfRVJSX0JVU1kJCS0xMgogCiBleHRl
cm4gdW5zaWduZWQgbG9uZyBzYmlfc3BlY192ZXJzaW9uOwogc3RydWN0IHNiaXJldCB7CmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5j
CmluZGV4IDVhNjJlZDFkYTQ1My4uY2ZkOGQ1MWZhMmE5IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC9zYmkuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwpAQCAtNTcsOSArNTcs
MTMgQEAgaW50IHNiaV9lcnJfbWFwX2xpbnV4X2Vycm5vKGludCBlcnIpCiAJY2FzZSBTQklfRVJS
X0RFTklFRDoKIAkJcmV0dXJuIC1FUEVSTTsKIAljYXNlIFNCSV9FUlJfSU5WQUxJRF9QQVJBTToK
KwljYXNlIFNCSV9FUlJfQkFEX1JBTkdFOgorCWNhc2UgU0JJX0VSUl9JTlZBTElEX1NUQVRFOgog
CQlyZXR1cm4gLUVJTlZBTDsKIAljYXNlIFNCSV9FUlJfSU5WQUxJRF9BRERSRVNTOgogCQlyZXR1
cm4gLUVGQVVMVDsKKwljYXNlIFNCSV9FUlJfQlVTWToKKwkJcmV0dXJuIC1FQlVTWTsKIAljYXNl
IFNCSV9FUlJfTk9UX1NVUFBPUlRFRDoKIAljYXNlIFNCSV9FUlJfRkFJTFVSRToKIAlkZWZhdWx0
OgotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
