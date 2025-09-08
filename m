Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DAFCA1016
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 23:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25z56ydhMC1RzdT/pvUPOnOMnUwPjk8X1SB8hbpRse0=; b=x26Im1csd5RUHn
	8ynmw7y+91oxYN8oGMJiEjLUQ/7pwusGKLI/OzF6HR65gUwjzCQYFZsQzwVSes3CxP9PLrQd1+K+/
	jGfJPa861Ef/1m8tjefB3LiOZ2N8NtpXNFlJpiDS106BVW/lJdQOxDERQXiRfZDtIZIeX+CxlqlKF
	2pc5nPUT+oXYJVdLq/Fylt6D7rng0BE7GIn6OCsA+1Swt1QqPVPaXHSJjvcROGvJ6D3RaeR8Pv/Nm
	DI629b2D/HlO6JZquIUx5qddahx9nbkf/c4sZYOuvmauUYat5oqB49Z/GrJtoXwk38rsAUU76Wmbn
	Zg9EmPP8JN2kN6wHr9Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlfc-000000034ma-3XM4;
	Mon, 08 Sep 2025 23:53:13 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgSO-00000001U6F-1UsU
	for linux-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 18:19:13 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-772627dd50aso6218736b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Sep 2025 11:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757355551; x=1757960351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OljeesxWIp9jDHv6jz9r0EeqTIgS1JKVuBa2eUtHLpE=;
        b=HYUA2YrAaSISmkFEgUocu+kzn/LEq1pIJziu0bI0v9ImoUuxdP+jzOW2MdGuXjbH+X
         GEfF3qn4l8cXfrP/9A86nk5S/61CXUw4BOGG7eGBnxcsvctWvi9nQzHCjSgt/micrA13
         gqqkwtuOp/wis7RFUuW/QpbjZw08ElicyI36lVc8KbYZX7um6km+k817+8bdllNXDGzR
         x16s5KLgpsuORW9YlwguOnf5GsvlXmkQrkruy1hglqUSxsO6srGyyFk3hcY+gV+zqGo/
         FJxfaJ4Dm/3WDxim5i3klnGrhSZH1je2xSMykd4H61bZqSwIzs0PsZK2PfRX/nKAVJcv
         LNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757355551; x=1757960351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OljeesxWIp9jDHv6jz9r0EeqTIgS1JKVuBa2eUtHLpE=;
        b=LbXAhA247mdUzTW73VstM2KKi7Fx+lIFW0G6elV3redIKbYBNwwbPT+dqh7b0SXYvA
         47r6aI8VveRvY59rEyeO+o2M6rZ6PTZUoA8sD7T+SNWpV+ezeFhtjks8yDnWhxLDbign
         foaWFsxHaQe1h8FeGiz/cdEAHIcKRI+mKq68LhwuqbFVnFQnh5xTC3JbtZ3QHB766t+X
         icUx4Rv2uNWtdFUMJI9mY9II/eb359dNWTVHl0aD+T+I4kNyuE5x7KI4szoT1/mq5N+d
         pso6m+QUKY0SbkTTlS8vNsAXzJ8q4N78vcQCNRPnAQZPvGT9I7DK0bnPAj5OtQ9EE8mP
         waNA==
X-Forwarded-Encrypted: i=1; AJvYcCW5yf4lOeHpNUUs1SJiNJ4H17JNm3HllkV2dgkQHsW+X+epXUq4HXIIaMmLIWRdTXjlUaD09wX4TjetlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgpM28oSUGDVnGIAkgMVRvvZCStELzjubAjcTrrvLzC4ZDfw8Z
	ys7+Tyc3VNA6JXNH6YxyMo/r0F1Q5P+4lXlOLJIHOWyvXQ+w7jg/OO/Sh0BV4sk4jfA=
X-Gm-Gg: ASbGnctNaB/b5pBk1capcM6J6SesmobicLp2dd8ck/j7eE7VowsCkeJk+z5JKDqhfmS
	2MmQKdceDTo2h0w/7lfi6u2QBRFHU7c1ZVmy1D6KyzvumumtONfajjkhsL52yJT8wPfPGvGtPRH
	Nt1CYVseI+BD1MO0dOqswY8fF/Q0SsNFFx0xbTguQrb64jLuywLAW8gcB4yvZP4m4ei45KIRU/q
	mdYwMFcmEKGS/kAS13XAX9f51/AIOwoPw+1JqQhRpIBrh6qW5/hyuZR9S6lk4mFf2Kmjm1PCiyw
	3IhpGEzx7ucie5GXrB9Y3CIysvbG625GkLbITMADRA31zRpFUjKP5883djD0XM7uNOb7ufN7tGV
	3oRd71aSv0hC065X6r1BkBOIU
X-Google-Smtp-Source: AGHT+IHobZOnXIMkvuSbjqGZcdW0FzEx8+rn30MylSnC+vt7QbpZ58d6DFDptlwzGDiTrysTelEV2w==
X-Received: by 2002:a17:902:e811:b0:244:5bbe:acdd with SMTP id d9443c01a7336-25179f34dc0mr105646145ad.27.1757355551317;
        Mon, 08 Sep 2025 11:19:11 -0700 (PDT)
Received: from cleger.eu.int ([2001:41d0:420:f300::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccd763948sm117012755ad.118.2025.09.08.11.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 11:19:10 -0700 (PDT)
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
Subject: [PATCH v7 1/5] riscv: add SBI SSE extension definitions
Date: Mon,  8 Sep 2025 18:17:03 +0000
Message-ID: <20250908181717.1997461-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908181717.1997461-1-cleger@rivosinc.com>
References: <20250908181717.1997461-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_111912_390904_77E8653A 
X-CRM114-Status: UNSURE (   9.19  )
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
aW5kZXggMzQxZTc0MjM4YWEwLi44NzRjYzFkNzYwM2EgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
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
TlRfRElTQUJMRSwKKwlTQklfU1NFX0VWRU5UX0NPTVBMRVRFLAorCVNCSV9TU0VfRVZFTlRfSU5K
RUNULAorCVNCSV9TU0VfSEFSVF9VTk1BU0ssCisJU0JJX1NTRV9IQVJUX01BU0ssCit9OworCitl
bnVtIHNiaV9zc2Vfc3RhdGUgeworCVNCSV9TU0VfU1RBVEVfVU5VU0VEICAgICA9IDAsCisJU0JJ
X1NTRV9TVEFURV9SRUdJU1RFUkVEID0gMSwKKwlTQklfU1NFX1NUQVRFX0VOQUJMRUQgICAgPSAy
LAorCVNCSV9TU0VfU1RBVEVfUlVOTklORyAgICA9IDMsCit9OworCisvKiBTQkkgU1NFIEV2ZW50
IEF0dHJpYnV0ZXMuICovCitlbnVtIHNiaV9zc2VfYXR0cl9pZCB7CisJU0JJX1NTRV9BVFRSX1NU
QVRVUwkJPSAweDAwMDAwMDAwLAorCVNCSV9TU0VfQVRUUl9QUklPCQk9IDB4MDAwMDAwMDEsCisJ
U0JJX1NTRV9BVFRSX0NPTkZJRwkJPSAweDAwMDAwMDAyLAorCVNCSV9TU0VfQVRUUl9QUkVGRVJS
RURfSEFSVAk9IDB4MDAwMDAwMDMsCisJU0JJX1NTRV9BVFRSX0VOVFJZX1BDCQk9IDB4MDAwMDAw
MDQsCisJU0JJX1NTRV9BVFRSX0VOVFJZX0FSRwkJPSAweDAwMDAwMDA1LAorCVNCSV9TU0VfQVRU
Ul9JTlRFUlJVUFRFRF9TRVBDCT0gMHgwMDAwMDAwNiwKKwlTQklfU1NFX0FUVFJfSU5URVJSVVBU
RURfRkxBR1MJPSAweDAwMDAwMDA3LAorCVNCSV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9BNgk9IDB4
MDAwMDAwMDgsCisJU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX0E3CT0gMHgwMDAwMDAwOSwKKwor
CVNCSV9TU0VfQVRUUl9NQVgJCT0gMHgwMDAwMDAwQQorfTsKKworI2RlZmluZSBTQklfU1NFX0FU
VFJfU1RBVFVTX1NUQVRFX09GRlNFVAkwCisjZGVmaW5lIFNCSV9TU0VfQVRUUl9TVEFUVVNfU1RB
VEVfTUFTSwkJMHgzCisjZGVmaW5lIFNCSV9TU0VfQVRUUl9TVEFUVVNfUEVORElOR19PRkZTRVQJ
MgorI2RlZmluZSBTQklfU1NFX0FUVFJfU1RBVFVTX0lOSkVDVF9PRkZTRVQJMworCisjZGVmaW5l
IFNCSV9TU0VfQVRUUl9DT05GSUdfT05FU0hPVAlCSVQoMCkKKworI2RlZmluZSBTQklfU1NFX0FU
VFJfSU5URVJSVVBURURfRkxBR1NfU1NUQVRVU19TUFAJQklUKDApCisjZGVmaW5lIFNCSV9TU0Vf
QVRUUl9JTlRFUlJVUFRFRF9GTEFHU19TU1RBVFVTX1NQSUUJQklUKDEpCisjZGVmaW5lIFNCSV9T
U0VfQVRUUl9JTlRFUlJVUFRFRF9GTEFHU19IU1RBVFVTX1NQVglCSVQoMikKKyNkZWZpbmUgU0JJ
X1NTRV9BVFRSX0lOVEVSUlVQVEVEX0ZMQUdTX0hTVEFUVVNfU1BWUAlCSVQoMykKKworI2RlZmlu
ZSBTQklfU1NFX0VWRU5UX0xPQ0FMX0hJR0hfUFJJT19SQVMJMHgwMDAwMDAwMAorI2RlZmluZSBT
QklfU1NFX0VWRU5UX0xPQ0FMX0RPVUJMRV9UUkFQCQkweDAwMDAwMDAxCisjZGVmaW5lIFNCSV9T
U0VfRVZFTlRfR0xPQkFMX0hJR0hfUFJJT19SQVMJMHgwMDAwODAwMAorI2RlZmluZSBTQklfU1NF
X0VWRU5UX0xPQ0FMX1BNVV9PVkVSRkxPVwkweDAwMDEwMDAwCisjZGVmaW5lIFNCSV9TU0VfRVZF
TlRfTE9DQUxfTE9XX1BSSU9fUkFTCTB4MDAxMDAwMDAKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9H
TE9CQUxfTE9XX1BSSU9fUkFTCTB4MDAxMDgwMDAKKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NB
TF9TT0ZUV0FSRV9JTkpFQ1RFRAkweGZmZmYwMDAwCisjZGVmaW5lIFNCSV9TU0VfRVZFTlRfR0xP
QkFMX1NPRlRXQVJFX0lOSkVDVEVECTB4ZmZmZjgwMDAKKworI2RlZmluZSBTQklfU1NFX0VWRU5U
X1BMQVRGT1JNCQlCSVQoMTQpCisjZGVmaW5lIFNCSV9TU0VfRVZFTlRfR0xPQkFMCQlCSVQoMTUp
CisKIC8qIFNCSSBzcGVjIHZlcnNpb24gZmllbGRzICovCiAjZGVmaW5lIFNCSV9TUEVDX1ZFUlNJ
T05fREVGQVVMVAkweDEKICNkZWZpbmUgU0JJX1NQRUNfVkVSU0lPTl9NQUpPUl9TSElGVAkyNAot
LSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
