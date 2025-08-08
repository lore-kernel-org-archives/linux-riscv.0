Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B464CC87FD2
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 15:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJQssXWraQujOVzzLf5wOtebzolT6JsnXqVj8NOwtes=; b=ILHlBcCE/wDcpQ
	CE3HcRSXhWErJD0KkGi0lna1AkpmUHhLeZ4N4J7i5xOvW2fcqCJG1b3hW+szlQOK3Mb+YveI9LtBV
	YIvgCO3QgBwvUe8EbWfgbmyLHQNnKsGpKgpV7xIAmmzChKZNInTg1Iwt3PeCJu6waz37u8x7XhYmw
	zp22B2BD0W0G656+6JbL6LDt/EYhWY/9xA1wA6O/NSz7hXCD/NCGoAFD9rROfYnTnAeQuApJL79y0
	4oWdzkNe9WHdLgww6djIZfKjZful++gYorAwB+6GYzFnOZiulKJBP4Ix3fDOz5Ztoce61E6Polsmj
	GaDiryHhyVLzBhzhGk1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPGo-00000003D9I-3MTc;
	Fri, 08 Aug 2025 15:44:38 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPBm-00000003CT8-2DVA
	for linux-riscv@lists.infradead.org;
	Fri, 08 Aug 2025 15:39:27 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-31f53b3b284so3217485a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Aug 2025 08:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1754667566; x=1755272366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRwyOgWeUUf4xzQUl6yQwVpNHXqT8Es+y3tNlmZTS9I=;
        b=K0pS30noXcdpadB+LVDLk6wLTyaU+G4eq1zah4k/+3uGDBbpxwEmzag/mliiBvqPv9
         dPwuxbA8otlT1GZf1bKRYZ5zl+0/py09SlAL/zBsa1sYPse1wbakSZE/gvHUWgCk2GbP
         8+jBjuB4D1/ozYNQuembdGeh3Zo4Y2B+ccYh1youR0V+e1Ks+CXpj9WAQOdDTkBii2IX
         FNA52GUsGQCZceAktQoXI5u+QAvXNimgHkwq0Xf+wGYmoyEyy1MJ108itvGHxsWZ0V0S
         hFAEcHq2yFxW6e4Bx45kk7oihD4/p/466TVBLGlQzRNtgYVVTECU6qVDsaBBQLxVtn5q
         UwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754667566; x=1755272366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRwyOgWeUUf4xzQUl6yQwVpNHXqT8Es+y3tNlmZTS9I=;
        b=PqQszCRHdL4uYZpHV13hi/1FSA6zR64c/mc4pdTh+QgDsiEEvjgr8aX9UCWgZ+Sn+b
         W7xYo2elbMl7f6LI0HqWdx0hQRgWFN0d70qNzne2E/+P9G9HgVCTBnIke0J5IEmCBSMo
         vWG3BmAS/8FnXhdD/5lP3SnUw/bnEzKzs24ISNiw1dhyvffcH9Zf1OeTH1VxI7FDG1ur
         pdTs6Xdu3hu8qms82hBjGrOJlTbFOBTPgIE4oySiNJD9z3nJ9xnneLUn1vRYsLzDP6Ke
         AFzE2+CVbpx7/Js6PXLk73G/yQH1Dklq72DEDh+HGUKWmzGSncrq37QWmpx/II+SXwzX
         deVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK8o+aYddn0ILQERNeR7a78Cw24IQSXZ33ycJE3ShxQIFWuq3mecALjPyiDlZDumqiBdeU1IuySCvcDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YweHrMc+F2ea2lqkb0ih15wbQ8oEUgklCyVEsL4hvB+by45V/HF
	P1Dt/i6XhYzSiLS89D/NDytirAxyhx0isiLVy5/6XEye9a9SKNQNyxJqm7ZneqnSjBg=
X-Gm-Gg: ASbGncs1rygrEJgt+PMwp9UUbaBbLJRN1ztbWPJV2PqtTmn59UpgH2K/nDiTJaE98Da
	xx279SW7g/Wy/C8xte+dbcglvvZbGEKff5YiZB+LKkuEBgCu5/cUyoHW+1gdPJLBV2mGoBZtd6B
	KXIABQbAmIl1JJ5WT5DKDemWFzPjzO0p1lUhmc2l7Wu6WOt6IkewSyaJBaRv1GYORBlO7vcafJR
	tytYJU0PCv9+vomTHbgO5U3rdtEAH/z+VOKlyGIdN+tuMSGdGyEDu3YOvl9s7lKWq0fvi4Q0KEM
	nHmKyDleRnXNOJB15nsypXUk8eklfH0yaUB9OdMwrG3VXZol+iy8CUqaL2kVlO7LRa31qa2Q3Io
	Kcok=
X-Google-Smtp-Source: AGHT+IEMeucseF/gpbdWW57tdD6DURYLC5rMNYgTyXb7nxmDdDLc/tCzgk2uslWhC5YtHa2cc8w4rg==
X-Received: by 2002:a17:90a:dfc7:b0:313:aefa:b08 with SMTP id 98e67ed59e1d1-3218465337dmr4414853a91.16.1754667565153;
        Fri, 08 Aug 2025 08:39:25 -0700 (PDT)
Received: from cleger.eu.int ([2001:41d0:420:f300::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3218c3c2d58sm1135971a91.16.2025.08.08.08.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 08:39:24 -0700 (PDT)
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
Subject: [PATCH v6 1/5] riscv: add SBI SSE extension definitions
Date: Fri,  8 Aug 2025 15:38:52 +0000
Message-ID: <20250808153901.2477005-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250808153901.2477005-1-cleger@rivosinc.com>
References: <20250808153901.2477005-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_083926_577832_700CB3BA 
X-CRM114-Status: UNSURE (   9.05  )
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
aW5kZXggMzQxZTc0MjM4YWEwLi5lNDk5M2ZiNjY0ZDIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc2JpLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaApAQCAt
MzYsNiArMzYsNyBAQCBlbnVtIHNiaV9leHRfaWQgewogCVNCSV9FWFRfU1RBID0gMHg1MzU0NDEs
CiAJU0JJX0VYVF9OQUNMID0gMHg0RTQxNDM0QywKIAlTQklfRVhUX0ZXRlQgPSAweDQ2NTc0NjU0
LAorCVNCSV9FWFRfU1NFID0gMHg1MzUzNDUsCiAKIAkvKiBFeHBlcmltZW50YWxzIGV4dGVuc2lv
bnMgbXVzdCBsaWUgd2l0aGluIHRoaXMgcmFuZ2UgKi8KIAlTQklfRVhUX0VYUEVSSU1FTlRBTF9T
VEFSVCA9IDB4MDgwMDAwMDAsCkBAIC00MzAsNiArNDMxLDY2IEBAIGVudW0gc2JpX2Z3ZnRfZmVh
dHVyZV90IHsKIAogI2RlZmluZSBTQklfRldGVF9TRVRfRkxBR19MT0NLCQkJQklUKDApCiAKK2Vu
dW0gc2JpX2V4dF9zc2VfZmlkIHsKKwlTQklfU1NFX0VWRU5UX0FUVFJfUkVBRCA9IDAsCisJU0JJ
X1NTRV9FVkVOVF9BVFRSX1dSSVRFLAorCVNCSV9TU0VfRVZFTlRfUkVHSVNURVIsCisJU0JJX1NT
RV9FVkVOVF9VTlJFR0lTVEVSLAorCVNCSV9TU0VfRVZFTlRfRU5BQkxFLAorCVNCSV9TU0VfRVZF
TlRfRElTQUJMRSwKKwlTQklfU1NFX0VWRU5UX0NPTVBMRVRFLAorCVNCSV9TU0VfRVZFTlRfU0lH
TkFMLAorCVNCSV9TU0VfRVZFTlRfSEFSVF9VTk1BU0ssCisJU0JJX1NTRV9FVkVOVF9IQVJUX01B
U0ssCit9OworCitlbnVtIHNiaV9zc2Vfc3RhdGUgeworCVNCSV9TU0VfU1RBVEVfVU5VU0VEICAg
ICA9IDAsCisJU0JJX1NTRV9TVEFURV9SRUdJU1RFUkVEID0gMSwKKwlTQklfU1NFX1NUQVRFX0VO
QUJMRUQgICAgPSAyLAorCVNCSV9TU0VfU1RBVEVfUlVOTklORyAgICA9IDMsCit9OworCisvKiBT
QkkgU1NFIEV2ZW50IEF0dHJpYnV0ZXMuICovCitlbnVtIHNiaV9zc2VfYXR0cl9pZCB7CisJU0JJ
X1NTRV9BVFRSX1NUQVRVUwkJPSAweDAwMDAwMDAwLAorCVNCSV9TU0VfQVRUUl9QUklPCQk9IDB4
MDAwMDAwMDEsCisJU0JJX1NTRV9BVFRSX0NPTkZJRwkJPSAweDAwMDAwMDAyLAorCVNCSV9TU0Vf
QVRUUl9QUkVGRVJSRURfSEFSVAk9IDB4MDAwMDAwMDMsCisJU0JJX1NTRV9BVFRSX0VOVFJZX1BD
CQk9IDB4MDAwMDAwMDQsCisJU0JJX1NTRV9BVFRSX0VOVFJZX0FSRwkJPSAweDAwMDAwMDA1LAor
CVNCSV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9TRVBDCT0gMHgwMDAwMDAwNiwKKwlTQklfU1NFX0FU
VFJfSU5URVJSVVBURURfRkxBR1MJPSAweDAwMDAwMDA3LAorCVNCSV9TU0VfQVRUUl9JTlRFUlJV
UFRFRF9BNgk9IDB4MDAwMDAwMDgsCisJU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX0E3CT0gMHgw
MDAwMDAwOSwKKworCVNCSV9TU0VfQVRUUl9NQVgJCT0gMHgwMDAwMDAwQQorfTsKKworI2RlZmlu
ZSBTQklfU1NFX0FUVFJfU1RBVFVTX1NUQVRFX09GRlNFVAkwCisjZGVmaW5lIFNCSV9TU0VfQVRU
Ul9TVEFUVVNfU1RBVEVfTUFTSwkJMHgzCisjZGVmaW5lIFNCSV9TU0VfQVRUUl9TVEFUVVNfUEVO
RElOR19PRkZTRVQJMgorI2RlZmluZSBTQklfU1NFX0FUVFJfU1RBVFVTX0lOSkVDVF9PRkZTRVQJ
MworCisjZGVmaW5lIFNCSV9TU0VfQVRUUl9DT05GSUdfT05FU0hPVAlCSVQoMCkKKworI2RlZmlu
ZSBTQklfU1NFX0FUVFJfSU5URVJSVVBURURfRkxBR1NfU1NUQVRVU19TUFAJQklUKDApCisjZGVm
aW5lIFNCSV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9GTEFHU19TU1RBVFVTX1NQSUUJQklUKDEpCisj
ZGVmaW5lIFNCSV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9GTEFHU19IU1RBVFVTX1NQVglCSVQoMikK
KyNkZWZpbmUgU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX0ZMQUdTX0hTVEFUVVNfU1BWUAlCSVQo
MykKKworI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX0hJR0hfUFJJT19SQVMJMHgwMDAwMDAw
MAorI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX0RPVUJMRV9UUkFQCQkweDAwMDAwMDAxCisj
ZGVmaW5lIFNCSV9TU0VfRVZFTlRfR0xPQkFMX0hJR0hfUFJJT19SQVMJMHgwMDAwODAwMAorI2Rl
ZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1BNVV9PVkVSRkxPVwkweDAwMDEwMDAwCisjZGVmaW5l
IFNCSV9TU0VfRVZFTlRfTE9DQUxfTE9XX1BSSU9fUkFTCTB4MDAxMDAwMDAKKyNkZWZpbmUgU0JJ
X1NTRV9FVkVOVF9HTE9CQUxfTE9XX1BSSU9fUkFTCTB4MDAxMDgwMDAKKyNkZWZpbmUgU0JJX1NT
RV9FVkVOVF9MT0NBTF9TT0ZUV0FSRV9JTkpFQ1RFRAkweGZmZmYwMDAwCisjZGVmaW5lIFNCSV9T
U0VfRVZFTlRfR0xPQkFMX1NPRlRXQVJFX0lOSkVDVEVECTB4ZmZmZjgwMDAKKworI2RlZmluZSBT
QklfU1NFX0VWRU5UX1BMQVRGT1JNCQlCSVQoMTQpCisjZGVmaW5lIFNCSV9TU0VfRVZFTlRfR0xP
QkFMCQlCSVQoMTUpCisKIC8qIFNCSSBzcGVjIHZlcnNpb24gZmllbGRzICovCiAjZGVmaW5lIFNC
SV9TUEVDX1ZFUlNJT05fREVGQVVMVAkweDEKICNkZWZpbmUgU0JJX1NQRUNfVkVSU0lPTl9NQUpP
Ul9TSElGVAkyNAotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
