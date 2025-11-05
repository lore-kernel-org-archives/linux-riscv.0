Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29609CCFA04
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 08:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4ztGMVwCkblxSF/Ow6+rFqzDZBmjj5XjhsJAHd+WeA=; b=Ndiup6sy3ZqT9E
	NKdDGt5sA8vn/JioWXyi4BBSIhn+S4DROqpjl7Z1KXA82mlJxRaPsejrmmWju6xemUgTHvT7/B0M9
	vbN1vhtT3J4dR1qD9B+SaWw5IGuusfohOHnBuzS1cfWH8bZG+t1wZo8bneEOBcZOvVyxJqdsi8rA6
	1r/NCix8/RCQZT4nhKCOzOsqYOVnFsAcBZieQaa+tZFYpzTGVP4P7DkeX2/jKaNUyNcgMIvfcsdWF
	DliQkb1MbvNNL0oYvkDGImg03njmVUj7rnFtvI/0ySf1W1JSozWQrzQYpvRBPVDdyeOnUgNi/Mnwo
	rEaiKLlxhSynGViRQk8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYsz-0000000DHJE-1EJr;
	Wed, 05 Nov 2025 08:28:57 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYsw-0000000DHHx-1iPX
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 08:28:56 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2957850c63bso6887395ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Nov 2025 00:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1762331334; x=1762936134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxVWTJdT+SCjk5O8ZmtBkLAMOboy+sCiTeWzaOD3L7c=;
        b=C4pWTgoS+fc/tiFH/FsrmrJhyjQWtDf0sv0sMFixqYIv5fsFQIapUgpQz3Zb8xtWNn
         Cr7Xd2vk3y/VwDlZqtHQaHZ5/PCjgo5W5ZroQlGi9BT8WV9+5OhzJ7IhA4bXx3e+Ai3x
         6eTOoXQn34anNC542qDYS0uQURA9b8apv7Bb4U+U2k8vB8iBX7FABc2FUHR0iev29ahF
         4HmwJTXwT6FnazctN5VOcZTpfbc+FyDC8ckuTn5TrZRbWLGgAs5BKVwif8nl4bSGE0r6
         z30FwpRihDwwNKFlcwSdoYWT/WvHPO9rErVJNtlEiWS4Hv0iRGcTvotDq4Gl1heuViNs
         aryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762331334; x=1762936134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxVWTJdT+SCjk5O8ZmtBkLAMOboy+sCiTeWzaOD3L7c=;
        b=KbhxpLiQm46uJpbt306i+dgpFzwU4/XKeQOEBbg27eoP/SVcqLUGkDz9VhUnp1mApp
         rLaq6OsJ2kV5IgzFFbd8Y7oyvctD7Lz7PAudNGnTewzl0HWNFfGooLYhpQpM+xuxD+GS
         gj30/rTh2GsVauDgrBghs0eeZs0uMJv0C0xtx/ca/lh51TZ4j4cTbOVbjbU/bBKahQU9
         H5t37Uu45oPQK2BYlp4NU8vwto3+w6xEETw7DJsSjs9AN49vHEJ+q7gIxH/TXlEWO2XC
         WzWSGgA3XxltRpBS8e/cVcCciQ5D21k+55vUlFReLRSNysf3vcJQ+peaPUZCePhQNk63
         iZXA==
X-Forwarded-Encrypted: i=1; AJvYcCVdkd2zcgrsgxPI24Mtd9WOt61NT0QsJKoa35crRJFiRNE2+FmicoTCOVd5ppltd1ByWsqqBpJniCRsLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaPoCBFA0RhaNqy+BsPcE8llTcYGcizHt57ZqnzslMQOtGCV9P
	ZPd+JmTGzh/jEr5ail+mp4xiv9XNsc24LXo3iMzhh3v5b7jWcReSCE1hKndrSQbW3WM=
X-Gm-Gg: ASbGnctKqGHRFRDyjoQMRgRWzvzftiHi0o+cCx4G3WOeC/641bQgYJGFShQ5B9Lw+yC
	ZlwBGpyJco87W9DXNXEswNKTFUkmSbekIZs81nPWNaahmtANd6KttkzG4CoLqSJRbtjmAxsJQ/1
	KfGXA32USbAs66RQkMKTtwNn+hsOPg0v++wYO+9cJGZCRzF+ZvgT+ymwbuPUANczzRPTOnIPTuz
	/gKdcDnPTqfgNf9A0rU6VIy+o7gBm+JLCpj0qAmauDBaxbIMZdj0a2sbAVhUbzBFGaQOTDMJIul
	9c/CmiXl/Tnjb9IfUwB93d9IQHrD1b7yQ7piimZTyAlWI8gLDHMcWBqx7C43Rl9rGgNqa0QQkdv
	pyadfOQ+LVNIRVvqNMqk9xtFl6mrN5hdLDSF8mC05aHUqdbhD7lj481pa
X-Google-Smtp-Source: AGHT+IGoN1GXGikcvAvUXnBnSY8dbKotW+FyvTG4CG4Bx86TVuBznGgWug72QAB0JjPEWtQzHPyqhw==
X-Received: by 2002:a17:903:2346:b0:269:aba9:ffd7 with SMTP id d9443c01a7336-295f9483fb3mr69028445ad.25.1762331333570;
        Wed, 05 Nov 2025 00:28:53 -0800 (PST)
Received: from cleger.eu.int ([2001:41d0:420:f300::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a741e3sm51870875ad.98.2025.11.05.00.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 00:28:53 -0800 (PST)
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
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v8 1/5] riscv: add SBI SSE extension definitions
Date: Wed,  5 Nov 2025 08:26:33 +0000
Message-ID: <20251105082639.342973-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105082639.342973-1-cleger@rivosinc.com>
References: <20251105082639.342973-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_002854_446711_69646369 
X-CRM114-Status: UNSURE (   8.70  )
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
Y3YvaW5jbHVkZS9hc20vc2JpLmggfCA2MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgK
aW5kZXggY2NjNzdhODliMWUyLi4wZjQ3ZTZmMDNiN2UgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc2JpLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaApAQCAt
MzcsNiArMzcsNyBAQCBlbnVtIHNiaV9leHRfaWQgewogCVNCSV9FWFRfTkFDTCA9IDB4NEU0MTQz
NEMsCiAJU0JJX0VYVF9GV0ZUID0gMHg0NjU3NDY1NCwKIAlTQklfRVhUX01QWFkgPSAweDRENTA1
ODU5LAorCVNCSV9FWFRfU1NFID0gMHg1MzUzNDUsCiAKIAkvKiBFeHBlcmltZW50YWxzIGV4dGVu
c2lvbnMgbXVzdCBsaWUgd2l0aGluIHRoaXMgcmFuZ2UgKi8KIAlTQklfRVhUX0VYUEVSSU1FTlRB
TF9TVEFSVCA9IDB4MDgwMDAwMDAsCkBAIC01MDUsNiArNTA2LDY2IEBAIGVudW0gc2JpX21weHlf
cnBtaV9hdHRyaWJ1dGVfaWQgewogI2RlZmluZSBTQklfTVBYWV9DSEFOX0NBUF9TRU5EX1dJVEhP
VVRfUkVTUAlCSVQoNCkKICNkZWZpbmUgU0JJX01QWFlfQ0hBTl9DQVBfR0VUX05PVElGSUNBVElP
TlMJQklUKDUpCiAKK2VudW0gc2JpX2V4dF9zc2VfZmlkIHsKKwlTQklfU1NFX0VWRU5UX0FUVFJf
UkVBRCA9IDAsCisJU0JJX1NTRV9FVkVOVF9BVFRSX1dSSVRFLAorCVNCSV9TU0VfRVZFTlRfUkVH
SVNURVIsCisJU0JJX1NTRV9FVkVOVF9VTlJFR0lTVEVSLAorCVNCSV9TU0VfRVZFTlRfRU5BQkxF
LAorCVNCSV9TU0VfRVZFTlRfRElTQUJMRSwKKwlTQklfU1NFX0VWRU5UX0NPTVBMRVRFLAorCVNC
SV9TU0VfRVZFTlRfSU5KRUNULAorCVNCSV9TU0VfSEFSVF9VTk1BU0ssCisJU0JJX1NTRV9IQVJU
X01BU0ssCit9OworCitlbnVtIHNiaV9zc2Vfc3RhdGUgeworCVNCSV9TU0VfU1RBVEVfVU5VU0VE
ICAgICA9IDAsCisJU0JJX1NTRV9TVEFURV9SRUdJU1RFUkVEID0gMSwKKwlTQklfU1NFX1NUQVRF
X0VOQUJMRUQgICAgPSAyLAorCVNCSV9TU0VfU1RBVEVfUlVOTklORyAgICA9IDMsCit9OworCisv
KiBTQkkgU1NFIEV2ZW50IEF0dHJpYnV0ZXMuICovCitlbnVtIHNiaV9zc2VfYXR0cl9pZCB7CisJ
U0JJX1NTRV9BVFRSX1NUQVRVUwkJPSAweDAwMDAwMDAwLAorCVNCSV9TU0VfQVRUUl9QUklPCQk9
IDB4MDAwMDAwMDEsCisJU0JJX1NTRV9BVFRSX0NPTkZJRwkJPSAweDAwMDAwMDAyLAorCVNCSV9T
U0VfQVRUUl9QUkVGRVJSRURfSEFSVAk9IDB4MDAwMDAwMDMsCisJU0JJX1NTRV9BVFRSX0VOVFJZ
X1BDCQk9IDB4MDAwMDAwMDQsCisJU0JJX1NTRV9BVFRSX0VOVFJZX0FSRwkJPSAweDAwMDAwMDA1
LAorCVNCSV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9TRVBDCT0gMHgwMDAwMDAwNiwKKwlTQklfU1NF
X0FUVFJfSU5URVJSVVBURURfRkxBR1MJPSAweDAwMDAwMDA3LAorCVNCSV9TU0VfQVRUUl9JTlRF
UlJVUFRFRF9BNgk9IDB4MDAwMDAwMDgsCisJU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX0E3CT0g
MHgwMDAwMDAwOSwKKworCVNCSV9TU0VfQVRUUl9NQVgJCT0gMHgwMDAwMDAwQQorfTsKKworI2Rl
ZmluZSBTQklfU1NFX0FUVFJfU1RBVFVTX1NUQVRFX09GRlNFVAkwCisjZGVmaW5lIFNCSV9TU0Vf
QVRUUl9TVEFUVVNfU1RBVEVfTUFTSwkJMHgzCisjZGVmaW5lIFNCSV9TU0VfQVRUUl9TVEFUVVNf
UEVORElOR19PRkZTRVQJMgorI2RlZmluZSBTQklfU1NFX0FUVFJfU1RBVFVTX0lOSkVDVF9PRkZT
RVQJMworCisjZGVmaW5lIFNCSV9TU0VfQVRUUl9DT05GSUdfT05FU0hPVAlCSVQoMCkKKworI2Rl
ZmluZSBTQklfU1NFX0FUVFJfSU5URVJSVVBURURfRkxBR1NfU1NUQVRVU19TUFAJQklUKDApCisj
ZGVmaW5lIFNCSV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9GTEFHU19TU1RBVFVTX1NQSUUJQklUKDEp
CisjZGVmaW5lIFNCSV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9GTEFHU19IU1RBVFVTX1NQVglCSVQo
MikKKyNkZWZpbmUgU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX0ZMQUdTX0hTVEFUVVNfU1BWUAlC
SVQoMykKKworI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX0hJR0hfUFJJT19SQVMJMHgwMDAw
MDAwMAorI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX0RPVUJMRV9UUkFQCQkweDAwMDAwMDAx
CisjZGVmaW5lIFNCSV9TU0VfRVZFTlRfR0xPQkFMX0hJR0hfUFJJT19SQVMJMHgwMDAwODAwMAor
I2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1BNVV9PVkVSRkxPVwkweDAwMDEwMDAwCisjZGVm
aW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfTE9XX1BSSU9fUkFTCTB4MDAxMDAwMDAKKyNkZWZpbmUg
U0JJX1NTRV9FVkVOVF9HTE9CQUxfTE9XX1BSSU9fUkFTCTB4MDAxMDgwMDAKKyNkZWZpbmUgU0JJ
X1NTRV9FVkVOVF9MT0NBTF9TT0ZUV0FSRV9JTkpFQ1RFRAkweGZmZmYwMDAwCisjZGVmaW5lIFNC
SV9TU0VfRVZFTlRfR0xPQkFMX1NPRlRXQVJFX0lOSkVDVEVECTB4ZmZmZjgwMDAKKworI2RlZmlu
ZSBTQklfU1NFX0VWRU5UX1BMQVRGT1JNCQlCSVQoMTQpCisjZGVmaW5lIFNCSV9TU0VfRVZFTlRf
R0xPQkFMCQlCSVQoMTUpCisKIC8qIFNCSSBzcGVjIHZlcnNpb24gZmllbGRzICovCiAjZGVmaW5l
IFNCSV9TUEVDX1ZFUlNJT05fREVGQVVMVAkweDEKICNkZWZpbmUgU0JJX1NQRUNfVkVSU0lPTl9N
QUpPUl9TSElGVAkyNAotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
