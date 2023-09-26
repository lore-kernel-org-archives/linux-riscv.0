Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263B1E7E649
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 15:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/WNv2S170nnUCN0NHD3JnZ87JPTYT7S2v8beBlQs+8=; b=LEeZEnIfzkbEY9
	d9V/4laU2meJ2ftp4lUFRh5dyiSoCvcyDA+f7DzkbnBqnWNxBDAVGtKC1y4zgA4WpI6bl2NNAlmYC
	QEeetwismxphrQ/I7NyrLUMNnjJncXFOYSHZqo4XwEBUX03hdMdHqxk9jidQ2hyd9WtqzNSNxc+xE
	OX8SaxCUzYDjv4iTYBIW7/YqAxkpOCFhaHi4+gaBTc2T/Z3nLcB8ad3BxZodZSgz+ktoKE2OKSZtK
	Ae7/MSTnbRSzyn8D0AHN+OleLP+HEGRqG/a1qarPwK3eB8li5xf+u+X/GTvWiiDC59aM8cQJFM4J8
	lVQ0eR2BKnxBIotWDC6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9be-00GbRR-24;
	Tue, 26 Sep 2023 15:04:10 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9bW-00GbLf-1N
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 15:04:04 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3200b181b67so1192135f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Sep 2023 08:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695740638; x=1696345438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFmLYHjhKHshwcnMAhKMVILwqWg7P2jKMKJHqTBO9sw=;
        b=Wo88hLgD9UB3IuF2+RCnhZiaeePO2iFdJNlodb4gmKP8Y7dCE/ONRUuicygf1cT4do
         4+ak62cGB24/SRIMu9S+HOcADV7XkZNiifjGAdKtjp+za/ybU/ZEr2HcC3aJ4jDiXKHu
         XWg6PHv+eJO3hn5BcK3aOZTaqXoST15ydsHVoJJ2YiHAScXwBgQImo+YZ2ugcSI9PisF
         eB3U1BMTK8Xo6aqf7R/kTUfcHO9+yiRRpg/Q2H6xxtw617N6fT3zlCtPILniZKZgGLOB
         svw9MRCmJEMGmDNgErObX0zbpwdz26pfc2CwnBfTNVIUivu3Mgb1Uwk9J+ml2mVJYzeU
         5fhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695740638; x=1696345438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFmLYHjhKHshwcnMAhKMVILwqWg7P2jKMKJHqTBO9sw=;
        b=jWqb611EGQCHY++YGqQTZub9xO3KNJryakC/N0LNQdnlttJQg8XlQcFSGSZi04dojn
         HjyWbuV/hr/ce3dRXOzKGlG/mCvxH9rzKJ2A+Sl3D3qw3/DKJRTVyr2RLPJaATO+dxtQ
         94Am3B02Z2/wGv8jJOZJub09QVYg550ATqczSKx2zDXXfaneB2tU9+F5GQXWCzNvV4hd
         Mj1iG0Xk76pYtJa9rr6pS19rHQ96xGdBoS0sQk0I3Pr5gwy+iH4EYbSxF21L/FAN2dbf
         SypwwJbGdL5/yTkwZVvCbXYBZVJHuZjGUe8Xw47k2E3h3tkUfdF1Gv5et5uujOvfxbEb
         SnKA==
X-Gm-Message-State: AOJu0Yz3JKeN+SrqQsUXKuuEyVvdDtupmJ+5/42YlsFwaL+GW1YBgnFf
	NOU8+AjFd4mol3cdIW03eRrhAA==
X-Google-Smtp-Source: AGHT+IF7/3y4X24APaMGQ6kFYsLNk/acfAFaY0nL+weTO0hHgxXwLwx3zMRxiAiTuT7k9FHJ9VrrZQ==
X-Received: by 2002:a5d:6a8a:0:b0:31a:ea18:c516 with SMTP id s10-20020a5d6a8a000000b0031aea18c516mr7713743wru.3.1695740638606;
        Tue, 26 Sep 2023 08:03:58 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:2b3d:6c70:9dbf:5ede])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d650b000000b00318147fd2d3sm14926060wru.41.2023.09.26.08.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 08:03:58 -0700 (PDT)
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
	Daniel Maslowski <cyrevolt@googlemail.com>
Subject: [PATCH 7/7] riscv: add support for PR_SET_UNALIGN and PR_GET_UNALIGN
Date: Tue, 26 Sep 2023 17:03:16 +0200
Message-Id: <20230926150316.1129648-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230926150316.1129648-1-cleger@rivosinc.com>
References: <20230926150316.1129648-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_080402_462743_EDC708DE 
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
LS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIHwgIDkgKysrKysrKysrCiBh
cmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgICAgICAgIHwgMTggKysrKysrKysrKysrKysrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9j
ZXNzb3IuaAppbmRleCAzZTIzZTE3ODZkMDUuLmFkYmU1MjBkMDdjNSAxMDA2NDQKLS0tIGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3Byb2Nlc3Nvci5oCkBAIC04LDYgKzgsNyBAQAogCiAjaW5jbHVkZSA8bGludXgvY29uc3Qu
aD4KICNpbmNsdWRlIDxsaW51eC9jYWNoZS5oPgorI2luY2x1ZGUgPGxpbnV4L3ByY3RsLmg+CiAK
ICNpbmNsdWRlIDx2ZHNvL3Byb2Nlc3Nvci5oPgogCkBAIC04Miw2ICs4Myw3IEBAIHN0cnVjdCB0
aHJlYWRfc3RydWN0IHsKIAl1bnNpZ25lZCBsb25nIGJhZF9jYXVzZTsKIAl1bnNpZ25lZCBsb25n
IHZzdGF0ZV9jdHJsOwogCXN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlIHZzdGF0ZTsKKwl1bnNp
Z25lZCBsb25nIGFsaWduX2N0bDsKIH07CiAKIC8qIFdoaXRlbGlzdCB0aGUgZnN0YXRlIGZyb20g
dGhlIHRhc2tfc3RydWN0IGZvciBoYXJkZW5lZCB1c2VyY29weSAqLwpAQCAtOTQsNiArOTYsNyBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgYXJjaF90aHJlYWRfc3RydWN0X3doaXRlbGlzdCh1bnNpZ25l
ZCBsb25nICpvZmZzZXQsCiAKICNkZWZpbmUgSU5JVF9USFJFQUQgewkJCQkJXAogCS5zcCA9IHNp
emVvZihpbml0X3N0YWNrKSArIChsb25nKSZpbml0X3N0YWNrLAlcCisJLmFsaWduX2N0bCA9IFBS
X1VOQUxJR05fTk9QUklOVCwJCVwKIH0KIAogI2RlZmluZSB0YXNrX3B0X3JlZ3ModHNrKQkJCQkJ
CVwKQEAgLTEzNCw2ICsxMzcsMTIgQEAgZXh0ZXJuIGxvbmcgcmlzY3Zfdl92c3RhdGVfY3RybF9z
ZXRfY3VycmVudCh1bnNpZ25lZCBsb25nIGFyZyk7CiBleHRlcm4gbG9uZyByaXNjdl92X3ZzdGF0
ZV9jdHJsX2dldF9jdXJyZW50KHZvaWQpOwogI2VuZGlmIC8qIENPTkZJR19SSVNDVl9JU0FfViAq
LwogCitleHRlcm4gaW50IGdldF91bmFsaWduX2N0bChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaywg
dW5zaWduZWQgbG9uZyBhZGRyKTsKK2V4dGVybiBpbnQgc2V0X3VuYWxpZ25fY3RsKHN0cnVjdCB0
YXNrX3N0cnVjdCAqdHNrLCB1bnNpZ25lZCBpbnQgdmFsKTsKKworI2RlZmluZSBHRVRfVU5BTElH
Tl9DVEwodHNrLCBhZGRyKQlnZXRfdW5hbGlnbl9jdGwoKHRzayksIChhZGRyKSkKKyNkZWZpbmUg
U0VUX1VOQUxJR05fQ1RMKHRzaywgdmFsKQlzZXRfdW5hbGlnbl9jdGwoKHRzayksICh2YWwpKQor
CiAjZW5kaWYgLyogX19BU1NFTUJMWV9fICovCiAKICNlbmRpZiAvKiBfQVNNX1JJU0NWX1BST0NF
U1NPUl9IICovCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKaW5kZXggZTMyZDczN2UwMzlmLi40ZjIxZDk3MGExMjkg
MTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYworKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9wcm9jZXNzLmMKQEAgLTI1LDYgKzI1LDcgQEAKICNpbmNsdWRlIDxhc20vdGhyZWFk
X2luZm8uaD4KICNpbmNsdWRlIDxhc20vY3B1aWRsZS5oPgogI2luY2x1ZGUgPGFzbS92ZWN0b3Iu
aD4KKyNpbmNsdWRlIDxhc20vY3B1ZmVhdHVyZS5oPgogCiByZWdpc3RlciB1bnNpZ25lZCBsb25n
IGdwX2luX2dsb2JhbCBfX2FzbV9fKCJncCIpOwogCkBAIC00MSw2ICs0MiwyMyBAQCB2b2lkIGFy
Y2hfY3B1X2lkbGUodm9pZCkKIAljcHVfZG9faWRsZSgpOwogfQogCitpbnQgc2V0X3VuYWxpZ25f
Y3RsKHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrLCB1bnNpZ25lZCBpbnQgdmFsKQoreworCWlmICgh
dW5hbGlnbmVkX2N0bF9hdmFpbGFibGUoKSkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwl0c2stPnRo
cmVhZC5hbGlnbl9jdGwgPSB2YWw7CisJcmV0dXJuIDA7Cit9CisKK2ludCBnZXRfdW5hbGlnbl9j
dGwoc3RydWN0IHRhc2tfc3RydWN0ICp0c2ssIHVuc2lnbmVkIGxvbmcgYWRyKQoreworCWlmICgh
dW5hbGlnbmVkX2N0bF9hdmFpbGFibGUoKSkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlyZXR1cm4g
cHV0X3VzZXIodHNrLT50aHJlYWQuYWxpZ25fY3RsLCAodW5zaWduZWQgbG9uZyBfX3VzZXIgKilh
ZHIpOworfQorCiB2b2lkIF9fc2hvd19yZWdzKHN0cnVjdCBwdF9yZWdzICpyZWdzKQogewogCXNo
b3dfcmVnc19wcmludF9pbmZvKEtFUk5fREVGQVVMVCk7Ci0tIAoyLjQwLjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
