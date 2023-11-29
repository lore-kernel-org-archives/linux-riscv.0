Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B53C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IzY3NIr1/mCzkQzQLmg+jAOCgXQfvYNrlCh6Pqwx7W4=; b=BIje7rEcV4m1z7
	jRdl8P1N99Rz6k8WZdrnmarGQsexrrTPEcRMFsgIZ8w0uR953X0DGm9QoN4D7SH0DdD7+JEeXkPtW
	/qCMwgSR8tDH0K+T8Pk24OfMKpPC8PnOFVbOJ7FjKfnlIwdXuWUczFegjwY3zWWuYKp8cyuMOVycS
	I59K/LwHiEDYXCipilKnQnEqtKHlWtBwgV3lMsLhC2zGYSfG9PMoxClNtVAs2QLht8LsvcgUSs1Q9
	XpLJDSCH9d9I+BbjSd8MlzkBp/zN/Ty8iom83xK7hee/OYLz0w9w6Zy+JW50MCk7wVkm+cWkcVZuf
	djfPaDwPD4ZnQjkTSTHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8N2P-008o6D-2Z;
	Wed, 29 Nov 2023 16:03:45 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8N2M-008o52-0D
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 16:03:44 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3316d855828so1190989f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 08:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701273820; x=1701878620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7IGDwssStSDpyhXdV1nfus/AGOvw09dSHX5DmZ6h29s=;
        b=vHOgmrh9/VTNKXnINkUxYhZW4aNSpN1oz93fWT4NLIn7cVHGImdAnuKMFUBMC/fofz
         G9Uwtl2aUBg7j6OFQ2vv6BQF+0l/M/10Ne3KwfFcEF31cY2joI+RhF5mC2cfI4Z/GedH
         Vc3K/yPBSEabw4vqjuxWvqahmKs0p3GNUMZt04WvoFJePwl5VAG6CxmtwkTKFGTbM7vl
         0C+ePIEXNI9xik7QAoiP/Lv6CKxQTGZoKgPxA5GqGMCV6/8pRvGEAagi3dE6SuffDwsb
         is0CyCehtihFzqrDJpe76pQZn9gsBHCZvJbyqrPvzCtdYJMTXKou7UeyOLkFXDDIG56X
         iwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701273820; x=1701878620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IGDwssStSDpyhXdV1nfus/AGOvw09dSHX5DmZ6h29s=;
        b=b4ieLXlE8/1MoDHM5BN1oCW1krjwinEuuT8tWGtzjZlGzK0DJBqGMHmT6oY4ZsdkNe
         ny43NTbA/IvJHreRzKsBZ8L5rBAuKGRHENS7izsT/Tkd4VkCOyDVi9FwhWBs6kspUPBS
         J9uv19GvEaI41EC3xxQBnlvHA4ZwdOOW3SlBqhIxBjXu+qaP+On9Uf5i/4jxpEQ6qR4b
         V2peYCcbqkOK63pc8G0tyLWtyoNa9h2ONw9gJ1Oj+vcB0/UTxTuh7KVf71ZE4+nhJ6EL
         nsUUKy/CgNF5RKU/T8ylyJmBNYkb+gCl8GL6wB12YJqSGMl/RO8ZF+QwodjTK5pHUrZB
         eO0Q==
X-Gm-Message-State: AOJu0YxA9xUqNzoJEnlJaIpIEXiQ8hj/uwbaPx++94Ogrik+alDo0aIq
	Ow0DI3fcTZF2uCrP69cvCs2e/g==
X-Google-Smtp-Source: AGHT+IHiupA6lbwePPPMup095kGgR6Wzqg1hkQkrzFoWGaSz5k1vlW/5w08YDqh5N/Ye6RNFE45lOw==
X-Received: by 2002:a05:6000:4011:b0:332:e749:adaa with SMTP id cp17-20020a056000401100b00332e749adaamr12719911wrb.3.1701273819573;
        Wed, 29 Nov 2023 08:03:39 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:11a9:3d89:528b:b336])
        by smtp.gmail.com with ESMTPSA id q1-20020a5d6581000000b00331a55d3875sm18230283wru.38.2023.11.29.08.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 08:03:39 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Samuel Ortiz <sameo@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH] RISC-V: Implement archrandom when Zkr is available
Date: Wed, 29 Nov 2023 17:03:25 +0100
Message-ID: <20231129160325.1119803-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_080342_408449_B4893B71 
X-CRM114-Status: GOOD (  18.17  )
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

RnJvbTogU2FtdWVsIE9ydGl6IDxzYW1lb0ByaXZvc2luYy5jb20+CgpGcm9tOiBTYW11ZWwgT3J0
aXogPHNhbWVvQHJpdm9zaW5jLmNvbT4KClRoZSBaa3IgZXh0ZW5zaW9uIGlzIHJhdGlmaWVkIGFu
ZCBwcm92aWRlcyAxNiBiaXRzIG9mIGVudHJvcHkgc2VlZCB3aGVuCnJlYWRpbmcgdGhlIFNFRUQg
Q1NSLgoKV2UgY2FuIGltcGxlbWVudCBhcmNoX2dldF9yYW5kb21fc2VlZF9sb25ncygpIGJ5IGRv
aW5nIG11bHRpcGxlIGNzcnJ3IHRvCnRoYXQgQ1NSIGFuZCBmaWxsaW5nIGFuIHVuc2lnbmVkIGxv
bmcgd2l0aCB2YWxpZCBlbnRyb3B5IGJpdHMuCgpBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25v
ci5kb29sZXlAbWljcm9jaGlwLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FtdWVsIE9ydGl6IDxzYW1l
b0ByaXZvc2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KCi0tLQoKVGhpcyBzZXJpZXMgZGVwZW5kcyBvbiAicmlzY3Y6IHJlcG9ydCBt
b3JlIElTQSBleHRlbnNpb25zIHRocm91Z2gKaHdwcm9iZSIgc2VyaWVzIFsxXS4KCkxpbms6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzExMTQxNDEyNTYuMTI2NzQ5LTEtY2xlZ2Vy
QHJpdm9zaW5jLmNvbS8gWzFdCi0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hcmNocmFuZG9t
LmggfCA2OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9jc3IuaCAgICAgICAgfCAgOSArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FyY2hyYW5k
b20uaAoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXJjaHJhbmRvbS5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hcmNocmFuZG9tLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMDAwLi43OTU4MzdjY2I1ODMKLS0tIC9kZXYvbnVsbAorKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2FyY2hyYW5kb20uaApAQCAtMCwwICsxLDY5IEBACisvKiBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLworLyoKKyAqIEtlcm5lbCBpbnRlcmZhY2Ug
Zm9yIHRoZSBSSVNDViBhcmNoX3JhbmRvbV8qIGZ1bmN0aW9ucworICoKKyAqIENvcHlyaWdodCAo
YykgMjAyMyBieSBSaXZvcyBJbmMuCisgKgorICovCisKKyNpZm5kZWYgQVNNX1JJU0NWX0FSQ0hS
QU5ET01fSAorI2RlZmluZSBBU01fUklTQ1ZfQVJDSFJBTkRPTV9ICisKKyNpbmNsdWRlIDxhc20v
Y3NyLmg+CisKKyNkZWZpbmUgU0VFRF9SRVRSWV9MT09QUyAxMDAKKworc3RhdGljIGlubGluZSBi
b29sIF9fbXVzdF9jaGVjayBjc3Jfc2VlZF9sb25nKHVuc2lnbmVkIGxvbmcgKnYpCit7CisJdW5z
aWduZWQgaW50IHJldHJ5ID0gU0VFRF9SRVRSWV9MT09QUywgdmFsaWRfc2VlZHMgPSAwOworCWNv
bnN0IGludCBuZWVkZWRfc2VlZHMgPSBzaXplb2YobG9uZykgLyBzaXplb2YodTE2KTsKKwl1MTYg
KmVudHJvcHkgPSAodTE2ICopdjsKKworCWRvIHsKKwkJLyoKKwkJICogVGhlIFNFRUQgQ1NSIG11
c3QgYmUgYWNjZXNzZWQgd2l0aCBhIHJlYWQtd3JpdGUgaW5zdHJ1Y3Rpb24uCisJCSAqLworCQl1
bnNpZ25lZCBsb25nIGNzcl9zZWVkID0gY3NyX3N3YXAoQ1NSX1NFRUQsIDApOworCisJCXN3aXRj
aCAoY3NyX3NlZWQgJiBTRUVEX09QU1RfTUFTSykgeworCQljYXNlIFNFRURfT1BTVF9FUzE2Ogor
CQkJZW50cm9weVt2YWxpZF9zZWVkcysrXSA9IGNzcl9zZWVkICYgU0VFRF9FTlRST1BZX01BU0s7
CisJCQlpZiAodmFsaWRfc2VlZHMgPT0gbmVlZGVkX3NlZWRzKQorCQkJCXJldHVybiB0cnVlOwor
CQkJYnJlYWs7CisKKwkJY2FzZSBTRUVEX09QU1RfREVBRDoKKwkJCXByX2Vycl9vbmNlKCJhcmNo
cmFuZG9tOiBVbnJlY292ZXJhYmxlIGVycm9yXG4iKTsKKwkJCXJldHVybiBmYWxzZTsKKworCQlj
YXNlIFNFRURfT1BTVF9CSVNUOgorCQljYXNlIFNFRURfT1BTVF9XQUlUOgorCQlkZWZhdWx0Ogor
CQkJY29udGludWU7CisJCX0KKwl9IHdoaWxlICgtLXJldHJ5KTsKKworCXJldHVybiBmYWxzZTsK
K30KKworc3RhdGljIGlubGluZSBzaXplX3QgX19tdXN0X2NoZWNrIGFyY2hfZ2V0X3JhbmRvbV9s
b25ncyh1bnNpZ25lZCBsb25nICp2LCBzaXplX3QgbWF4X2xvbmdzKQoreworCXJldHVybiAwOwor
fQorCitzdGF0aWMgaW5saW5lIHNpemVfdCBfX211c3RfY2hlY2sgYXJjaF9nZXRfcmFuZG9tX3Nl
ZWRfbG9uZ3ModW5zaWduZWQgbG9uZyAqdiwgc2l6ZV90IG1heF9sb25ncykKK3sKKwlpZiAoIW1h
eF9sb25ncykKKwkJcmV0dXJuIDA7CisKKwkvKgorCSAqIElmIFprciBpcyBzdXBwb3J0ZWQgYW5k
IGNzcl9zZWVkX2xvbmcgc3VjY2VlZHMsIHdlIHJldHVybiBvbmUgbG9uZworCSAqIHdvcnRoIG9m
IGVudHJvcHkuCisJICovCisJaWYgKHJpc2N2X2hhc19leHRlbnNpb25fbGlrZWx5KFJJU0NWX0lT
QV9FWFRfWktSKSAmJiBjc3Jfc2VlZF9sb25nKHYpKQorCQlyZXR1cm4gMTsKKworCXJldHVybiAw
OworfQorCisjZW5kaWYgLyogQVNNX1JJU0NWX0FSQ0hSQU5ET01fSCAqLwpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3Ny
LmgKaW5kZXggMzA2YTE5YTU1MDljLi41MTAwMTQwNTFmNWQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vY3NyLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaApA
QCAtNDExLDYgKzQxMSwxNSBAQAogI2RlZmluZSBDU1JfVlRZUEUJCTB4YzIxCiAjZGVmaW5lIENT
Ul9WTEVOQgkJMHhjMjIKIAorLyogU2NhbGFyIENyeXB0byBFeHRlbnNpb24gLSBFbnRyb3B5ICov
CisjZGVmaW5lIENTUl9TRUVECQkweDAxNQorI2RlZmluZSBTRUVEX09QU1RfTUFTSwkJX0FDKDB4
QzAwMDAwMDAsIFVMKQorI2RlZmluZSBTRUVEX09QU1RfQklTVAkJX0FDKDB4MDAwMDAwMDAsIFVM
KQorI2RlZmluZSBTRUVEX09QU1RfV0FJVAkJX0FDKDB4NDAwMDAwMDAsIFVMKQorI2RlZmluZSBT
RUVEX09QU1RfRVMxNgkJX0FDKDB4ODAwMDAwMDAsIFVMKQorI2RlZmluZSBTRUVEX09QU1RfREVB
RAkJX0FDKDB4QzAwMDAwMDAsIFVMKQorI2RlZmluZSBTRUVEX0VOVFJPUFlfTUFTSwlfQUMoMHhG
RkZGLCBVTCkKKwogI2lmZGVmIENPTkZJR19SSVNDVl9NX01PREUKICMgZGVmaW5lIENTUl9TVEFU
VVMJQ1NSX01TVEFUVVMKICMgZGVmaW5lIENTUl9JRQkJQ1NSX01JRQotLSAKMi40Mi4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
