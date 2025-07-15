Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDD1C83F2D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 19:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJQssXWraQujOVzzLf5wOtebzolT6JsnXqVj8NOwtes=; b=A/g0VXMJjvDqig
	QUT1zpKiX58jssyi85gFoahP5IWetpOX6dDpXEhGCYAN1IojVTmewE5P2FmeVsl3F+4ABhlrUTxxi
	FBW7l58R62T9qS0wzFmXeePaFPfNQDYEj2o/epAKDdVrlh6FKimdG4Ozo+Q98uPiNW7a/KgiVYmXG
	Ky7R4kyL1x1d6B0MINVVgfO7msFaH9JHe29z+dSF4SrhQAV9NB6bzH2MW2BkP0AV9pSZFSAZfcECN
	jSCh8BrWxMmmfMuTWdYd4BPRuqcRWumiyd770H3xbC7mlRTHVrwpDfQE+4/21EULdKakmbP4Jxb9A
	ujwMSn7ub/Mc8Plnc8EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl7Q-00000005ykh-0H2A;
	Tue, 15 Jul 2025 19:15:12 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubi7m-00000005geg-1QKi
	for linux-riscv@lists.infradead.org;
	Tue, 15 Jul 2025 16:03:23 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-74b27c1481bso3606312b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 15 Jul 2025 09:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752595399; x=1753200199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRwyOgWeUUf4xzQUl6yQwVpNHXqT8Es+y3tNlmZTS9I=;
        b=NpEIpsmd9My1Ci3ZRQDPitFftcjVgc3jubm7kd7kddyCbQPXeHAPdEbb9MaB4NZBxw
         Gtt2bIlQ0JA1L0nXR1Fg7r5DFFIA1R6ZT61+p0giSu21wJMcHWzvkymD3SCvc8B9O/Y9
         yJCwlofVntXfz+rF2nHjgaIQ9tUAk59YHl1o1kJ+DEJExbFItzOTOGK4bRqRewz5ddN4
         MaJGYP8fwazSrMjxMj1nzhgVL1+DPj+Pga2ZDkwHUNgfp8JfXOBJMGqXK2mijGaaoZPh
         2ftrTuzneIsbB7idOBdcwsqBamdpMzHi3ts0cNTxz2WB7atXEyAFPsJjrBsKVu0YLKFv
         ojkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752595399; x=1753200199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRwyOgWeUUf4xzQUl6yQwVpNHXqT8Es+y3tNlmZTS9I=;
        b=jzD+Ch+KMz7KHifryQTCBUayvGuO+EkvufawpwZO5lBGrfmiHtVkIUvalABgQYPI+a
         tpfEfKsqPy+9wYIugZ9khaqRpjBF9CY5otaWqJ7s2gFgF08O1GMCmbAg7blGj9wKdXXL
         CPY5Suu7SHrq9PxAD3oucsYEKYw3OLg9zqihsUBY3W4UM3vY7SCbKCiKtOjkLISKQunO
         VZj//InECLF2OOD/JjtfTNYzbILrxOnoPKrbD5Rio+I8vmLDdMC6E71Dg/Xs5XCvb/FK
         Ar+1FE2CQfHrw2z3+54IXXvhrSbbDS1ZQQdMaR4yoTMMRnXqUWiwtKvViC0EdgYvFaIs
         gcgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6WmNKsL2bfbAlyuUg8dWgVg4aDLPOoSS8CtRheyI2fNwaSg2N0ugCzqUp6yelINlrQq92+63fILnMHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXXnVAcfxFC4udMTCBfgHncvi/gH4HtnyzY9zu+JhNroUx+oBm
	KjndIrs9Mot+LojmZXcsVSJ6w8T19szeQHA0ZQUA2HDt78vrch9+C1I2Rs/Fgreb6P8=
X-Gm-Gg: ASbGncustlp0l82TS+0/0h8nsMzFc9KLlx1d9Xb0MtfNW6u6+1rkL2KP1VortIkjOQ0
	o5Ig+uaOmqdGCwdlOsShnKEvbplUMhLd50/QNe0hJmH9Jr5/JnbcUqzVGNqZyFfh9y3DgLXhtKr
	YxlPgGOFD7d227/kByvdIRMTsirabqXRyHfKRdjpHWYALRnEVcM1wNTDDLNNy+nqJ30pN7z3fpo
	l1qOlKF3m2RPnDi9hDOv8Tx70t51PaUi+uLZzfTxzTY7fKymsYGh9F+5udqtGu+yb8nh0HdefT+
	5/qqLUhDW+ZRtpdLFkSeWOShr9qbXuUV1uTB/uFJe2QVOl9ENp+skiJtxYXMhRiuzZiWPst+MHC
	4ypU=
X-Google-Smtp-Source: AGHT+IGvzjaplpjHHcySeWxi/fySPbOh8CHoZuQqs8pJ8fFzORsjPFHbBuFq87mnlR1ZNPoONlGm1A==
X-Received: by 2002:a05:6a00:218a:b0:742:a82b:abeb with SMTP id d2e1a72fcca58-74f1beec959mr22574622b3a.2.1752595399392;
        Tue, 15 Jul 2025 09:03:19 -0700 (PDT)
Received: from cleger.eu.int ([2001:41d0:420:f300::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f856fdsm12546532b3a.144.2025.07.15.09.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 09:03:18 -0700 (PDT)
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
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH v5 1/5] riscv: add SBI SSE extension definitions
Date: Tue, 15 Jul 2025 16:02:29 +0000
Message-ID: <20250715160234.454848-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715160234.454848-1-cleger@rivosinc.com>
References: <20250715160234.454848-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_090322_543285_DA61B525 
X-CRM114-Status: UNSURE (   9.22  )
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
