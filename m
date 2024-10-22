Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661F1D17159
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 02:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GAziCDfKeydxDQEp89RdD6Oy6g5NFDSPX6GGYp/2w3k=; b=JaQ0m6aJ+rY3/R
	OK9JOLnLWK0y9WNEmw1VBDOIUXNfsVx2ckaQ3dO5rXlz2l9S8Y63isfP9cCE82m99EETshFtoiog2
	UFVxr0zxLSJbeCk6CPzqbOXx+1g7xX+9YE0AwphdHValq7CUrQILD0Q3CX9Heceek/TesGDVp7mAw
	RwW7mqwn+e/Dk91R6ycUlk2z40sFHoezwdAbN29HNxr8LB85rkB3TgAks2BE6Z6uyCwVoSDm1Qesg
	+QMl2iPU61/j1Iz/IC37uO7nudQZTWtHxllH75In3lmTvD/g2NIwz1bZQHQLmzeJzgSSvtpe+TGMS
	JMegs8NiUwiQKpCCUZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t34JR-00000009Hzp-1xmQ;
	Tue, 22 Oct 2024 02:07:57 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t34BH-00000009Ftl-19dg
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 01:59:33 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7ea79711fd4so3504809a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 18:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729562370; x=1730167170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bo8mvyzhNAGog51IrcbhLjSHRzC25xwCT3do7aV0R5s=;
        b=b8lCl3PaGZ7t44U8j81jNmUsLQtPG0XmyVyKCrZrNezBcNyTFayM83Mvz3paw45XVo
         9ctQQxryoI43Vn9jv+w3CdCfKeNt/FcV+KHqWAKofKRjnCrvHGT9RhY/d/CSFYzDXIjV
         PNesvVUDEcWQn23URGWue6cARWtMNFZ+J6S8kC+SrRtMwzWyhEVQQw/xEFIUoDACsRji
         XRwLVVEjdboCPyckWQTdOa/WmNfysl2gyLPkN3b6U2ePIWutDVqRcII1HaUhwvCK+faF
         pbhHHUVzC8aCnghIwIiN/IwSRmUhRpOdfSCTkh//ESFtGaDLViq9yWTtocWDDBtwde06
         /wNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729562370; x=1730167170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bo8mvyzhNAGog51IrcbhLjSHRzC25xwCT3do7aV0R5s=;
        b=GEpsGgYBtSQ7Xmdmfw9xaZt8p8DceBvRLGlBwnrUl1n56j5X1Lzij76NIGFJ75z6J3
         2Uy9E8BZ53V1ODk7NMxi+V+10aq3EZpqlWBTp+g/nasjmClBMIscheGaI9RErB4OT6oT
         LqzDH+1pL5596T+rDwYWIaEp7tfEC7tJkkO9aMRTGoGFcPgB18qv8EFm5hqUkvbisaYO
         S2fHJqqRkgnFKaUyGcGtEN5vPprOWk7QVtqgJyhg/HTb/HHAC04rG4yg6HpVK1oelR5x
         Gq6CV1Dt1jkUG1VjefVPMdEVOtOEy2M3YA2DSqvlzSPAjyB84EJRxlIt9z5olROcj2j4
         NyOA==
X-Forwarded-Encrypted: i=1; AJvYcCUpKfPHOXaq4hlHZO4DqMZu1Qx8YPcOoss8TxzzYr2Gygt3b1EeWlbQA8QhWO8JxCI90UhtfaoVqQae+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvI8/L2kc9/7AHwe4NlCK+1TS8OIkAdPlANiLUIcxVAW2DQjTN
	0JxNfrsjTcxZ6125up/O4eakmbQ/ga7dbpZyDlHywFfEcXsgR7dRkDmw0AZtqJ0=
X-Google-Smtp-Source: AGHT+IGIGEeeGnC+KScU7RsGDXnOT3F+tOuXMVMoo+fGP2CQIBFtA2wtlRRoG48p3wyuBbKw6oUq4g==
X-Received: by 2002:a05:6a20:b40b:b0:1d9:b78:2dd3 with SMTP id adf61e73a8af0-1d92c5100b6mr19225561637.26.1729562370603;
        Mon, 21 Oct 2024 18:59:30 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132ffdcsm3600710b3a.46.2024.10.21.18.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 18:59:29 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 8/9] riscv: Add SBI Firmware Features extension definitions
Date: Mon, 21 Oct 2024 18:57:16 -0700
Message-ID: <20241022015913.3524425-9-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241022015913.3524425-1-samuel.holland@sifive.com>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_185931_543126_B45FA779 
X-CRM114-Status: GOOD (  10.20  )
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

RnJvbTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKQWRkIG5lY2Vzc2Fy
eSBTQkkgZGVmaW5pdGlvbnMgdG8gdXNlIHRoZSBGV0ZUIGV4dGVuc2lvbi4KCltTYW11ZWw6IEFk
ZCBTQklfRldGVF9QT0lOVEVSX01BU0tJTkdfUE1MRU5dCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVu
dCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xs
YW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgotLS0KCkNoYW5nZXMgaW4gdjI6CiAtIE5l
dyBwYXRjaCBmb3IgdjIKCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgMjggKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9zYmkuaAppbmRleCA5OGY2MzFiMDUxZGIuLjRhMzVjNmZmZTQ5ZiAxMDA2NDQK
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3NiaS5oCkBAIC0zNCw2ICszNCw3IEBAIGVudW0gc2JpX2V4dF9pZCB7CiAJU0JJX0VY
VF9QTVUgPSAweDUwNEQ1NSwKIAlTQklfRVhUX0RCQ04gPSAweDQ0NDI0MzRFLAogCVNCSV9FWFRf
U1RBID0gMHg1MzU0NDEsCisJU0JJX0VYVF9GV0ZUID0gMHg0NjU3NDY1NCwKIAogCS8qIEV4cGVy
aW1lbnRhbHMgZXh0ZW5zaW9ucyBtdXN0IGxpZSB3aXRoaW4gdGhpcyByYW5nZSAqLwogCVNCSV9F
WFRfRVhQRVJJTUVOVEFMX1NUQVJUID0gMHgwODAwMDAwMCwKQEAgLTI4MSw2ICsyODIsMzMgQEAg
c3RydWN0IHNiaV9zdGFfc3RydWN0IHsKIAogI2RlZmluZSBTQklfU0hNRU1fRElTQUJMRQkJLTEK
IAorLyogU0JJIGZ1bmN0aW9uIElEcyBmb3IgRlcgZmVhdHVyZSBleHRlbnNpb24gKi8KKyNkZWZp
bmUgU0JJX0VYVF9GV0ZUX1NFVAkJMHgwCisjZGVmaW5lIFNCSV9FWFRfRldGVF9HRVQJCTB4MQor
CitlbnVtIHNiaV9md2Z0X2ZlYXR1cmVfdCB7CisJU0JJX0ZXRlRfTUlTQUxJR05FRF9FWENfREVM
RUcJCT0gMHgwLAorCVNCSV9GV0ZUX0xBTkRJTkdfUEFECQkJPSAweDEsCisJU0JJX0ZXRlRfU0hB
RE9XX1NUQUNLCQkJPSAweDIsCisJU0JJX0ZXRlRfRE9VQkxFX1RSQVAJCQk9IDB4MywKKwlTQklf
RldGVF9QVEVfQURfSFdfVVBEQVRJTkcJCT0gMHg0LAorCVNCSV9GV0ZUX1BPSU5URVJfTUFTS0lO
R19QTUxFTgkJPSAweDUsCisJU0JJX0ZXRlRfTE9DQUxfUkVTRVJWRURfU1RBUlQJCT0gMHg2LAor
CVNCSV9GV0ZUX0xPQ0FMX1JFU0VSVkVEX0VORAkJPSAweDNmZmZmZmZmLAorCVNCSV9GV0ZUX0xP
Q0FMX1BMQVRGT1JNX1NUQVJUCQk9IDB4NDAwMDAwMDAsCisJU0JJX0ZXRlRfTE9DQUxfUExBVEZP
Uk1fRU5ECQk9IDB4N2ZmZmZmZmYsCisKKwlTQklfRldGVF9HTE9CQUxfUkVTRVJWRURfU1RBUlQJ
CT0gMHg4MDAwMDAwMCwKKwlTQklfRldGVF9HTE9CQUxfUkVTRVJWRURfRU5ECQk9IDB4YmZmZmZm
ZmYsCisJU0JJX0ZXRlRfR0xPQkFMX1BMQVRGT1JNX1NUQVJUCQk9IDB4YzAwMDAwMDAsCisJU0JJ
X0ZXRlRfR0xPQkFMX1BMQVRGT1JNX0VORAkJPSAweGZmZmZmZmZmLAorfTsKKworI2RlZmluZSBT
QklfRldGVF9HTE9CQUxfRkVBVFVSRV9CSVQJCSgxIDw8IDMxKQorI2RlZmluZSBTQklfRldGVF9Q
TEFURk9STV9GRUFUVVJFX0JJVAkJKDEgPDwgMzApCisKKyNkZWZpbmUgU0JJX0ZXRlRfU0VUX0ZM
QUdfTE9DSwkJCSgxIDw8IDApCisKIC8qIFNCSSBzcGVjIHZlcnNpb24gZmllbGRzICovCiAjZGVm
aW5lIFNCSV9TUEVDX1ZFUlNJT05fREVGQVVMVAkweDEKICNkZWZpbmUgU0JJX1NQRUNfVkVSU0lP
Tl9NQUpPUl9TSElGVAkyNAotLSAKMi40NS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
