Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7D8E7C4D4
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+04qVmmI07cK3Fna6WMPuulFnzZU7F5MvjN1RerLdg=; b=vkDbnOqshklSXI
	9rzuRhTGK1UZEtAmsBwFsWzXxLSrN1ElNgx3G6xpSX8/VmTzXERYzRFEXbhCwnUx55ITsyZwxSNDX
	A2+YWLSfr1XI/Pu79QLvkpVFYcpnQ7W373GsA+gGX91ivRCB+3ylOSdtq6tmAxnT8tsSKR5uE8IDb
	u2MmD1gJgm7+hndsCxFxui+4xrnsTmtZKxVf3ipjlhSXnOf4ZDZQgxANh2Q55bPiyMUNCS6YI1WdM
	pZ8iCESMrTwn8Qi2lkNUktx1dRtPumQ99mv9pDBl+TCs8fNuwxiTqGVASxIFrqV0fn2PmilmKM9X+
	GGYIGNHvULqmdQhVnJMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3aA-000Jgr-0K;
	Wed, 04 Oct 2023 15:14:38 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3a4-000JcN-2u
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:14:34 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4064e3c7c07so3944725e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 08:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696432471; x=1697037271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgvk3biMyb3dWXWlkLQojD9wXEb7N0NOjcs65taIzUI=;
        b=mIYNHuyg4HaaFYxDuAMNhfkyGj5s+G3hPMnWJneSk7hn+YjBRZymR/t3oe4reTzGpR
         kMjbZ5dNjGEy4dYslZnkt3CuBykmcyiDAbsFRoGqK/puIfZCZjOv5p9SJC14jcvt2Zgd
         ZzQhMorkziFWoiheMFF/AUB5Y6qhz7oVqvff4+dzup5Q/LZ68FStB+i9nTzaKaaIRq1F
         6AsMh6eFBJSqpk3zcHu+EJDSyzPFSCOmQ1NYTkAxcSqAZbgpKB5t7Jd8fg8JV9pNOvJq
         UM1/SPRUjy6b1WNqewQJSo5lWr/fYPw1sECwvHckTZF6L4nogytAV3fVSUyiJCDjCDLj
         eBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696432471; x=1697037271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgvk3biMyb3dWXWlkLQojD9wXEb7N0NOjcs65taIzUI=;
        b=AJycp1YuDBwbpqJf/YltV5mmPQ84ccgLOqXkeqQRPbPhKvLHwUZYCjwprtDXG7GeAT
         bSjLzPyGj5mk842qgVeF6GTA4eFtKmQ5Oe6dkgritbJBaYIzGQ32ATC9yD5dqCT6Y1r/
         Us6Bia+chrzOTexFEz+QXrQ9YmU+Gh8ZOpE903ZPUFDnCGgeG6LK+uomsPLYrOsX2BT8
         478hp5G8IZOkiLYfm/ZwNHeF5XQZKPRQrexyWMk3ag8g3OTWp52OIJ5SNVEi3CszxIBC
         K2202mbHmeJW9KaVo6nD0AIJd+DsgWqQh+UZvPRNJJj8z7+IGE+/rMmTIgrNI6aUPnad
         6NEA==
X-Gm-Message-State: AOJu0YyC1bQKLUdRxNltMKp09jPWtqHG5tQxfz/7+angWnKLkr7xnRsd
	8l5QYrppE9E1MMDMu6cknExBNA==
X-Google-Smtp-Source: AGHT+IFWFyxvkpKoO/6/23fHvmhwPdqiEfb/7rp6Yc0TRcJio42GVyA9Nn9VHADu7IcrpwduTsF9nw==
X-Received: by 2002:a05:600c:5192:b0:405:1ba2:4fcf with SMTP id fa18-20020a05600c519200b004051ba24fcfmr2488360wmb.4.1696432471665;
        Wed, 04 Oct 2023 08:14:31 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9474:8d75:5115:42cb])
        by smtp.gmail.com with ESMTPSA id i2-20020a05600c290200b00402f7b50517sm1768764wmd.40.2023.10.04.08.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:14:31 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Topel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ron Minnich <rminnich@gmail.com>,
	Daniel Maslowski <cyrevolt@googlemail.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v2 8/8] riscv: add support for PR_SET_UNALIGN and PR_GET_UNALIGN
Date: Wed,  4 Oct 2023 17:14:05 +0200
Message-ID: <20231004151405.521596-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004151405.521596-1-cleger@rivosinc.com>
References: <20231004151405.521596-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_081432_945149_EA391D2F 
X-CRM114-Status: GOOD (  14.98  )
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

Tm93IHRoYXQgdHJhcCBzdXBwb3J0IGlzIHJlYWR5IHRvIGhhbmRsZSBtaXNhbGlnbm1lbnQgZXJy
b3JzIGluIFMtbW9kZSwKYWxsb3cgdGhlIHVzZXIgdG8gY29udHJvbCB0aGUgYmVoYXZpb3Igb2Yg
bWlzYWxpZ25lZCBhY2Nlc3NlcyB1c2luZwpwcmN0bChQUl9TRVRfVU5BTElHTikuIEFkZCBhbiBh
bGlnbl9jdGwgZmxhZyBpbiB0aHJlYWRfc3RydWN0IHdoaWNoCndpbGwgYmUgdXNlZCB0byBkZXRl
cm1pbmUgaWYgd2Ugc2hvdWxkIFNJR0JVUyB0aGUgcHJvY2VzcyBvciBub3Qgb24Kc3VjaCBmYXVs
dC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4K
LS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oICAgfCAgOSArKysrKysrKysK
IGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAgICAgICAgICB8IDE4ICsrKysrKysrKysrKysr
KysrKwogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgIDYgKysrKysrCiAz
IGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNz
b3IuaAppbmRleCAzZTIzZTE3ODZkMDUuLmFkYmU1MjBkMDdjNSAxMDA2NDQKLS0tIGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3Byb2Nlc3Nvci5oCkBAIC04LDYgKzgsNyBAQAogCiAjaW5jbHVkZSA8bGludXgvY29uc3QuaD4K
ICNpbmNsdWRlIDxsaW51eC9jYWNoZS5oPgorI2luY2x1ZGUgPGxpbnV4L3ByY3RsLmg+CiAKICNp
bmNsdWRlIDx2ZHNvL3Byb2Nlc3Nvci5oPgogCkBAIC04Miw2ICs4Myw3IEBAIHN0cnVjdCB0aHJl
YWRfc3RydWN0IHsKIAl1bnNpZ25lZCBsb25nIGJhZF9jYXVzZTsKIAl1bnNpZ25lZCBsb25nIHZz
dGF0ZV9jdHJsOwogCXN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlIHZzdGF0ZTsKKwl1bnNpZ25l
ZCBsb25nIGFsaWduX2N0bDsKIH07CiAKIC8qIFdoaXRlbGlzdCB0aGUgZnN0YXRlIGZyb20gdGhl
IHRhc2tfc3RydWN0IGZvciBoYXJkZW5lZCB1c2VyY29weSAqLwpAQCAtOTQsNiArOTYsNyBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgYXJjaF90aHJlYWRfc3RydWN0X3doaXRlbGlzdCh1bnNpZ25lZCBs
b25nICpvZmZzZXQsCiAKICNkZWZpbmUgSU5JVF9USFJFQUQgewkJCQkJXAogCS5zcCA9IHNpemVv
Zihpbml0X3N0YWNrKSArIChsb25nKSZpbml0X3N0YWNrLAlcCisJLmFsaWduX2N0bCA9IFBSX1VO
QUxJR05fTk9QUklOVCwJCVwKIH0KIAogI2RlZmluZSB0YXNrX3B0X3JlZ3ModHNrKQkJCQkJCVwK
QEAgLTEzNCw2ICsxMzcsMTIgQEAgZXh0ZXJuIGxvbmcgcmlzY3Zfdl92c3RhdGVfY3RybF9zZXRf
Y3VycmVudCh1bnNpZ25lZCBsb25nIGFyZyk7CiBleHRlcm4gbG9uZyByaXNjdl92X3ZzdGF0ZV9j
dHJsX2dldF9jdXJyZW50KHZvaWQpOwogI2VuZGlmIC8qIENPTkZJR19SSVNDVl9JU0FfViAqLwog
CitleHRlcm4gaW50IGdldF91bmFsaWduX2N0bChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaywgdW5z
aWduZWQgbG9uZyBhZGRyKTsKK2V4dGVybiBpbnQgc2V0X3VuYWxpZ25fY3RsKHN0cnVjdCB0YXNr
X3N0cnVjdCAqdHNrLCB1bnNpZ25lZCBpbnQgdmFsKTsKKworI2RlZmluZSBHRVRfVU5BTElHTl9D
VEwodHNrLCBhZGRyKQlnZXRfdW5hbGlnbl9jdGwoKHRzayksIChhZGRyKSkKKyNkZWZpbmUgU0VU
X1VOQUxJR05fQ1RMKHRzaywgdmFsKQlzZXRfdW5hbGlnbl9jdGwoKHRzayksICh2YWwpKQorCiAj
ZW5kaWYgLyogX19BU1NFTUJMWV9fICovCiAKICNlbmRpZiAvKiBfQVNNX1JJU0NWX1BST0NFU1NP
Ul9IICovCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9wcm9jZXNzLmMKaW5kZXggZTMyZDczN2UwMzlmLi40ZjIxZDk3MGExMjkgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYworKysgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9wcm9jZXNzLmMKQEAgLTI1LDYgKzI1LDcgQEAKICNpbmNsdWRlIDxhc20vdGhyZWFkX2lu
Zm8uaD4KICNpbmNsdWRlIDxhc20vY3B1aWRsZS5oPgogI2luY2x1ZGUgPGFzbS92ZWN0b3IuaD4K
KyNpbmNsdWRlIDxhc20vY3B1ZmVhdHVyZS5oPgogCiByZWdpc3RlciB1bnNpZ25lZCBsb25nIGdw
X2luX2dsb2JhbCBfX2FzbV9fKCJncCIpOwogCkBAIC00MSw2ICs0MiwyMyBAQCB2b2lkIGFyY2hf
Y3B1X2lkbGUodm9pZCkKIAljcHVfZG9faWRsZSgpOwogfQogCitpbnQgc2V0X3VuYWxpZ25fY3Rs
KHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrLCB1bnNpZ25lZCBpbnQgdmFsKQoreworCWlmICghdW5h
bGlnbmVkX2N0bF9hdmFpbGFibGUoKSkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwl0c2stPnRocmVh
ZC5hbGlnbl9jdGwgPSB2YWw7CisJcmV0dXJuIDA7Cit9CisKK2ludCBnZXRfdW5hbGlnbl9jdGwo
c3RydWN0IHRhc2tfc3RydWN0ICp0c2ssIHVuc2lnbmVkIGxvbmcgYWRyKQoreworCWlmICghdW5h
bGlnbmVkX2N0bF9hdmFpbGFibGUoKSkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlyZXR1cm4gcHV0
X3VzZXIodHNrLT50aHJlYWQuYWxpZ25fY3RsLCAodW5zaWduZWQgbG9uZyBfX3VzZXIgKilhZHIp
OworfQorCiB2b2lkIF9fc2hvd19yZWdzKHN0cnVjdCBwdF9yZWdzICpyZWdzKQogewogCXNob3df
cmVnc19wcmludF9pbmZvKEtFUk5fREVGQVVMVCk7CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGln
bmVkLmMKaW5kZXggZDk5Yjk1MDg0YjZjLi5iYmEzMDFiNTE5NGQgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90
cmFwc19taXNhbGlnbmVkLmMKQEAgLTQxOCw2ICs0MTgsOSBAQCBpbnQgaGFuZGxlX21pc2FsaWdu
ZWRfbG9hZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKIAlpZiAoIXVuYWxpZ25lZF9lbmFibGVkKQog
CQlyZXR1cm4gLTE7CiAKKwlpZiAodXNlcl9tb2RlKHJlZ3MpICYmIChjdXJyZW50LT50aHJlYWQu
YWxpZ25fY3RsICYgUFJfVU5BTElHTl9TSUdCVVMpKQorCQlyZXR1cm4gLTE7CisKIAlpZiAoZ2V0
X2luc24ocmVncywgZXBjLCAmaW5zbikpCiAJCXJldHVybiAtMTsKIApAQCAtNTE3LDYgKzUyMCw5
IEBAIGludCBoYW5kbGVfbWlzYWxpZ25lZF9zdG9yZShzdHJ1Y3QgcHRfcmVncyAqcmVncykKIAlp
ZiAoIXVuYWxpZ25lZF9lbmFibGVkKQogCQlyZXR1cm4gLTE7CiAKKwlpZiAodXNlcl9tb2RlKHJl
Z3MpICYmIChjdXJyZW50LT50aHJlYWQuYWxpZ25fY3RsICYgUFJfVU5BTElHTl9TSUdCVVMpKQor
CQlyZXR1cm4gLTE7CisKIAlpZiAoZ2V0X2luc24ocmVncywgZXBjLCAmaW5zbikpCiAJCXJldHVy
biAtMTsKIAotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
