Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AA6C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 14:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QOxOfcSTc0lY87sh7pnoFKlRWDTgeZXbQVj6NBhT4xY=; b=XCMA57WnfHzrBK
	moRnpjWGoSlRnMlkg6hUeUPXmydTdB1+TYGAvTLNh1tpgqQLcrfmTBcL3LF/sMWnWb96rmVSBD1bO
	klU7sprf0/miCbqfqaiHYE/Kit5sSY7mZfGrt4bY/PGSSqS5F6FuqZBUf/XTob8RRBvkaMI2fET9g
	DJThyRzZx7fPq30vcD34QhSv/rJRIykdCZZRjRrJ72bviPz0WgbnMvJFkd8gN9ZXh5g9hhPw8tfaK
	4gF991MpM0aQV9eKQcYzBKphejuv0MGPzBhMIp2x1qiq/FpOcK5Yw8PGCt6+iJe4QmkN/G3N+U1Ze
	vHTwschug2NDIaCcx0lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uB3-00G9Kb-35;
	Tue, 14 Nov 2023 14:14:05 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAs-00G925-2g
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:13:57 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3b41132c33aso801407b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971229; x=1700576029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mh7tTRDZwkplFE7US+z6W8VzyVO8RyK0Ie0Y8NEIF5E=;
        b=iYMsq9WazTudCWrrtNQgHTyOV4b43DReR6KPx0xMX8FbWxXJbnrGL6UAKai5pfUQZJ
         v6pYcHxjuLSvrQILiIdiJQkAveOTy9SZXRH+8BKcpFSmJMHjlUEbnNopZAVfyRj6kJRr
         zM1EyIE/sbMfipkn9/a/2DtBk9h1TpFGfgmKizjDmPYzm4E9O5ncOrDKzwqMt7t+C3mw
         577G/bY/0R6M4OZqs3RPxNB6orl9Q3YwmfaRgB/giiA9QFbaIgpZnqMmcxAK/2hyxqN9
         n7IqiA6Ro8J/RjTOnyrs21nifNaIhzr6IgwYUcKgQEsbvHGefa+Xj5BJZ1t3yzm25Pj2
         sTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971229; x=1700576029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mh7tTRDZwkplFE7US+z6W8VzyVO8RyK0Ie0Y8NEIF5E=;
        b=FLf6DJOu0IZ7PhzPC8nb8lJJJA/s8sOodQCOBcV6ucTCcov2/jVQykK8Q/5ws+e/kY
         yLHXy2uqzOx1v/r7OQUuzkwYPeuApUhN2Ha+syDluYG6YKj9yyCUvUZjiYmB/hhuTntZ
         ySVDGEBAIkoNbpCzz3ZlEXgKobs3dGdWNJtcTnLokJ8ZBd8003FGAZmIWVuFEjdmgYeT
         tG6+MXFrMOtz5+n3YQay2O/h1lH+rWZAtio+WAJfMuf6Ow045Uwi4O8I3NYuHQ00AuKF
         JThc0ps3rRNEvhrcCRC2W5w99m4dCZOgdq5FAJ5ixxz6PpnAkHbcjTh8QNjvE+TFZL+j
         vsLA==
X-Gm-Message-State: AOJu0YzCCIxCGRPxW/q9J+V9uOJAqtjjtKTOSfwN5ZNxCa2I0pEGcZW7
	GKGbWdxx2l8AkBFXAmYIXWjucpgiCCPxvvxNMRq6BQ==
X-Google-Smtp-Source: AGHT+IGkxt/nZ/twmuaXiKz9xS1+QSbiEolPjI0eAyguNp2BxYnPRpCdPEUVfljS4ZnrA7PBhdlykg==
X-Received: by 2002:a05:6808:1a2a:b0:3b5:65c2:fef4 with SMTP id bk42-20020a0568081a2a00b003b565c2fef4mr2571171oib.5.1699971229027;
        Tue, 14 Nov 2023 06:13:49 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:48 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Jerry Shih <jerry.shih@sifive.com>
Subject: [PATCH v4 13/20] riscv: hwprobe: export Zhintntl ISA extension
Date: Tue, 14 Nov 2023 09:12:49 -0500
Message-ID: <20231114141256.126749-14-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061354_883653_A7B3CF6D 
X-CRM114-Status: GOOD (  11.44  )
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

RXhwb3J0IFppaGludG50bCBleHRlbnNpb25bMV0gdGhyb3VnaCBod3Byb2JlLgoKTGluazogaHR0
cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xM193c044WW1SZkg4WVd5c0Z5VFgtRGpUa0Nu
QmQ5aGovdmlldyBbMV0KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2
b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+Ci0t
LQogRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDMgKysrCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9z
eXNfcmlzY3YuYyAgICAgICAgIHwgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0Rv
Y3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAppbmRleCAzOTdkNTMxOTVmNDkuLmFh
OGViZWVkZGZlNiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUu
cnN0CisrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdApAQCAtMTQ2LDYg
KzE0Niw5IEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKICAgKiA6YzptYWNybzpg
UklTQ1ZfSFdQUk9CRV9FWFRfWkZITUlOYDogVGhlIFpmaG1pbiBleHRlbnNpb24gdmVyc2lvbiAx
LjAgaXMKICAgICAgICBzdXBwb3J0ZWQgYXMgZGVmaW5lZCBpbiB0aGUgUklTQy1WIElTQSBtYW51
YWwuCiAKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWklISU5UTlRMYDogVGhlIFpp
aGludG50bCBleHRlbnNpb24gdmVyc2lvbiAxLjAKKyAgICAgICBpcyBzdXBwb3J0ZWQgYXMgZGVm
aW5lZCBpbiB0aGUgUklTQy1WIElTQSBtYW51YWwuCisKICogOmM6bWFjcm86YFJJU0NWX0hXUFJP
QkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0bWFzayB0aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCiAg
IGluZm9ybWF0aW9uIGFib3V0IHRoZSBzZWxlY3RlZCBzZXQgb2YgcHJvY2Vzc29ycy4KIApkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKaW5kZXggMmQ5NjA3NzdlYTQzLi5kNzJjNjll
YTA3NDAgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgK
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaApAQCAtNTIsNiArNTIs
NyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9a
VktUCQkoMSA8PCAyNikKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pGSAkJKDEgPDwgMjcp
CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aRkhNSU4JKDEgPDwgMjgpCisjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX0VYVF9aSUhJTlROVEwJKDEgPDwgMjkpCiAjZGVmaW5lIFJJU0NWX0hXUFJP
QkVfS0VZX0NQVVBFUkZfMAk1CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5L
Tk9XTgkoMCA8PCAwKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVE
CSgxIDw8IDApCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCmluZGV4IGQ3NzZjNmMzOWZjZC4uYTQ2ZTRmNjgy
MWRkIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYworKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwpAQCAtMTczLDYgKzE3Myw3IEBAIHN0YXRpYyB2b2lk
IGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCUVYVF9LRVko
WktTRUQpOwogCQlFWFRfS0VZKFpLU0gpOwogCQlFWFRfS0VZKFpLVCk7CisJCUVYVF9LRVkoWklI
SU5UTlRMKTsKIAogCQlpZiAoaGFzX3ZlY3RvcigpKSB7CiAJCQlFWFRfS0VZKFpWQkIpOwotLSAK
Mi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
