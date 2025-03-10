Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744A6C28B2E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZVqgZJwznVSgeFYpOU1bgbgm5ZgNuUwn/MWaz+2jko=; b=nPCihMOGAFVIJd
	4nI4PDfhKJkBsQAU4zVTtXdQB8eVwXwWWZzLNb7j1YoLBcMV9frsLpVlt7bpUaNtg+QY7cL3vc8Gg
	kT/F2lPM7kghj89f0pMnEwPmwz7cVVs/dUeTxR3sB0y2qDsLftMYt9YYbhLMjixL5zmKPGk4fRdeE
	0+3UGFHi07ibc2Vyo8eAUf10g374MREyDz5CSsMJb9xB2FiyWMlkIDfgaia9MIx2gLrp7HXDa5Arh
	uqtboNKqWUt+I3oL4jZ1u6kUSqXRqW16rRTgnseBQLkaTu84NB/K72gMn9cXJlyxLnrViAzZe8SQw
	4phqrbf0lMUnI+oEiAbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfLp-00000003Frd-1TzH;
	Mon, 10 Mar 2025 15:47:33 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treoJ-000000037Mz-3PWB
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:12:56 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-223fb0f619dso82333255ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619575; x=1742224375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqoT5ixPEtXdLEI6ocjejwPv6xnA8RHlbYFtktGXOjg=;
        b=TGz5YLIaym6dyao/XvIh1rUWKxtgjWA2N+UbwHLIyym8Fr3XEx5UGECpOtQJ21TCxC
         xLvCewQ4Aa22eTISKrHq0A6UGBZZyywnJVR9TB4jWxpZbAn72aiTujOLoaczQ28QJQ7o
         7ehQgpGZ7Wx2hYHCdxQ7/uINUgmaVl73mVr2St7cwSG6P0BbEMTEHYqDrRm6CV0GpuyM
         HkT1KicrXJsIs6EcB7sJYNuhNm4gNU478KWUFGm3AxPXQQ8pm9LDO1vllHK3IYr8mueQ
         pywyEYTm5bbgtdQ9jQfLglNQ+2RB+13qzpoMeXdWnRzwxFWDsLI/8KeIYMHoLWmhi5iV
         PTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619575; x=1742224375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqoT5ixPEtXdLEI6ocjejwPv6xnA8RHlbYFtktGXOjg=;
        b=XFXPqAoTYKByMESKUPhYGQmtQ5su8GXRkeujqBrBsiWivn5GhJ6Ci4kRUCvVZcIwf9
         96vGqR1TNCUkHA5yHaPhFFUD3CJX/R+sZ5rydVEmTjrZxQmKnHg/PL+ltYb+IupeC+8P
         CYniWfJQ0Oue+n7dCZ7oY4oaqXnG0HXQnWe4SQ8MfyKSfo5PkWeMG2agIEKSVMXDOSZr
         E+KpruVT5jZAuq5hg9O8MbktvSaieMfChCbxBuHSSgWIHSJL6uaCVn6U7/AezvIp1mXY
         +GAFGG5W1+FNbp/uF4hOWFMUAMzFDpnR8YsdwtxMmpwdoJ95xi8iu/uZs6wjfb+QdSUe
         E/Nw==
X-Forwarded-Encrypted: i=1; AJvYcCX84QjyH/eB2pc1sfsTl8UT/jNPXA42M0BE7NyI6ihz9ESB9tn/qb+QkAzf3mPkPQgZqMm2oib8bya/IA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn7WTWsm2ajnuvSGm4m8OGdRYK20Kz+Ef9fYNa6KNlyx6EiBIu
	qPDF0sKP8bbRk2DduaNKM9Bmu76lLcqbFrvnYcQlXORWtJ01HL1j2YO2nb18xSw=
X-Gm-Gg: ASbGncumeAHKNtePjAn1XUJbigouN/4gb+/cZUnUEmgZWu8ue2WANpiUo3RvCtJlj5/
	Fet/KAgn5etlHspgFWmeUbmFmyBGvS0JNVaehTle7Oms2I/yw24QObHnCUKgB43OMpjg6V6bu5T
	LgtRQmOD7hgt6+sRDxy1G1IkrEB+9fuRlD6tRCHPTa7Rzu2woEwrT6JBlWWPt6ZqJ3j1RmDsmQ4
	B7jQFs8uUrW/a1flbW3xF4wAy+whEWZut2U5OOjYCOTfRw1/grgW/1tuMdBvOB1sdEoR/DQQLXR
	scEMkcsPe5vUkhkTnwKzN9dk5sUtS1fwhHeOC0hj4IMdug==
X-Google-Smtp-Source: AGHT+IFvzTd5QCV2TCtNaJ/EaL6UD5ar2zJmoTEAdGnVQhe1E8h+p63CvIu3O7VcRgR7VvKsoM8L/A==
X-Received: by 2002:a17:902:d483:b0:223:4537:65b1 with SMTP id d9443c01a7336-22593185c80mr2418925ad.36.1741619575178;
        Mon, 10 Mar 2025 08:12:55 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:12:54 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v3 01/17] riscv: add Firmware Feature (FWFT) SBI extensions definitions
Date: Mon, 10 Mar 2025 16:12:08 +0100
Message-ID: <20250310151229.2365992-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081255_857437_79F119A1 
X-CRM114-Status: UNSURE (   9.65  )
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

VGhlIEZpcm13YXJlIEZlYXR1cmVzIGV4dGVuc2lvbiAoRldGVCkgd2FzIGFkZGVkIGFzIHBhcnQg
b2YgdGhlIFNCSSAzLjAKc3BlY2lmaWNhdGlvbi4gQWRkIFNCSSBkZWZpbml0aW9ucyB0byB1c2Ug
dGhpcyBleHRlbnNpb24uCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbT4KVGVzdGVkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lm
aXZlLmNvbT4KUmV2aWV3ZWQtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgot
LS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggfCAzMyArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc2JpLmgKaW5kZXggM2QyNTA4MjQxNzhiLi5iYjA3N2QwYzkxMmYgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9z
YmkuaApAQCAtMzUsNiArMzUsNyBAQCBlbnVtIHNiaV9leHRfaWQgewogCVNCSV9FWFRfREJDTiA9
IDB4NDQ0MjQzNEUsCiAJU0JJX0VYVF9TVEEgPSAweDUzNTQ0MSwKIAlTQklfRVhUX05BQ0wgPSAw
eDRFNDE0MzRDLAorCVNCSV9FWFRfRldGVCA9IDB4NDY1NzQ2NTQsCiAKIAkvKiBFeHBlcmltZW50
YWxzIGV4dGVuc2lvbnMgbXVzdCBsaWUgd2l0aGluIHRoaXMgcmFuZ2UgKi8KIAlTQklfRVhUX0VY
UEVSSU1FTlRBTF9TVEFSVCA9IDB4MDgwMDAwMDAsCkBAIC00MDIsNiArNDAzLDMzIEBAIGVudW0g
c2JpX2V4dF9uYWNsX2ZlYXR1cmUgewogI2RlZmluZSBTQklfTkFDTF9TSE1FTV9TUkVUX1goX19p
KQkJKChfX3Jpc2N2X3hsZW4gLyA4KSAqIChfX2kpKQogI2RlZmluZSBTQklfTkFDTF9TSE1FTV9T
UkVUX1hfTEFTVAkJMzEKIAorLyogU0JJIGZ1bmN0aW9uIElEcyBmb3IgRlcgZmVhdHVyZSBleHRl
bnNpb24gKi8KKyNkZWZpbmUgU0JJX0VYVF9GV0ZUX1NFVAkJMHgwCisjZGVmaW5lIFNCSV9FWFRf
RldGVF9HRVQJCTB4MQorCitlbnVtIHNiaV9md2Z0X2ZlYXR1cmVfdCB7CisJU0JJX0ZXRlRfTUlT
QUxJR05FRF9FWENfREVMRUcJCT0gMHgwLAorCVNCSV9GV0ZUX0xBTkRJTkdfUEFECQkJPSAweDEs
CisJU0JJX0ZXRlRfU0hBRE9XX1NUQUNLCQkJPSAweDIsCisJU0JJX0ZXRlRfRE9VQkxFX1RSQVAJ
CQk9IDB4MywKKwlTQklfRldGVF9QVEVfQURfSFdfVVBEQVRJTkcJCT0gMHg0LAorCVNCSV9GV0ZU
X1BPSU5URVJfTUFTS0lOR19QTUxFTgkJPSAweDUsCisJU0JJX0ZXRlRfTE9DQUxfUkVTRVJWRURf
U1RBUlQJCT0gMHg2LAorCVNCSV9GV0ZUX0xPQ0FMX1JFU0VSVkVEX0VORAkJPSAweDNmZmZmZmZm
LAorCVNCSV9GV0ZUX0xPQ0FMX1BMQVRGT1JNX1NUQVJUCQk9IDB4NDAwMDAwMDAsCisJU0JJX0ZX
RlRfTE9DQUxfUExBVEZPUk1fRU5ECQk9IDB4N2ZmZmZmZmYsCisKKwlTQklfRldGVF9HTE9CQUxf
UkVTRVJWRURfU1RBUlQJCT0gMHg4MDAwMDAwMCwKKwlTQklfRldGVF9HTE9CQUxfUkVTRVJWRURf
RU5ECQk9IDB4YmZmZmZmZmYsCisJU0JJX0ZXRlRfR0xPQkFMX1BMQVRGT1JNX1NUQVJUCQk9IDB4
YzAwMDAwMDAsCisJU0JJX0ZXRlRfR0xPQkFMX1BMQVRGT1JNX0VORAkJPSAweGZmZmZmZmZmLAor
fTsKKworI2RlZmluZSBTQklfRldGVF9QTEFURk9STV9GRUFUVVJFX0JJVAkJQklUKDMwKQorI2Rl
ZmluZSBTQklfRldGVF9HTE9CQUxfRkVBVFVSRV9CSVQJCUJJVCgzMSkKKworI2RlZmluZSBTQklf
RldGVF9TRVRfRkxBR19MT0NLCQkJQklUKDApCisKIC8qIFNCSSBzcGVjIHZlcnNpb24gZmllbGRz
ICovCiAjZGVmaW5lIFNCSV9TUEVDX1ZFUlNJT05fREVGQVVMVAkweDEKICNkZWZpbmUgU0JJX1NQ
RUNfVkVSU0lPTl9NQUpPUl9TSElGVAkyNApAQCAtNDE5LDYgKzQ0NywxMSBAQCBlbnVtIHNiaV9l
eHRfbmFjbF9mZWF0dXJlIHsKICNkZWZpbmUgU0JJX0VSUl9BTFJFQURZX1NUQVJURUQgLTcKICNk
ZWZpbmUgU0JJX0VSUl9BTFJFQURZX1NUT1BQRUQgLTgKICNkZWZpbmUgU0JJX0VSUl9OT19TSE1F
TQktOQorI2RlZmluZSBTQklfRVJSX0lOVkFMSURfU1RBVEUJLTEwCisjZGVmaW5lIFNCSV9FUlJf
QkFEX1JBTkdFCS0xMQorI2RlZmluZSBTQklfRVJSX1RJTUVPVVQJCS0xMgorI2RlZmluZSBTQklf
RVJSX0lPCQktMTMKKyNkZWZpbmUgU0JJX0VSUl9ERU5JRURfTE9DS0VECS0xNAogCiBleHRlcm4g
dW5zaWduZWQgbG9uZyBzYmlfc3BlY192ZXJzaW9uOwogc3RydWN0IHNiaXJldCB7Ci0tIAoyLjQ3
LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
