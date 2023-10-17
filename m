Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3700BCDB483
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ya//KX1tet4s3y3v3McpJ5DYaX+NHo7D4n3MgohGDro=; b=l7CWGI98mApyhs
	ZT81QOlqwPxb2ZHvyYtLEGuqZegfF1LVfADWKqThM9PhvP3q1iF/AR4vZTUMzsqadYJRnKFKwr57J
	IKrsps3v34Z/gkNkUDERBF2cknwaK6nj2z1j5gqMKfVMK4jQorZqAGkk/c/aRO4exrrdboh9aD4vr
	JH8jONW1SY8HvaT4DI0Iom05SxlZ8BrPXwJP96g5nHp1vpgmttXtNel1cPg2yDXU3dxywtOEP9WGL
	9hR/Dn8oR/2HTVtwz3YtlGYXiJWUfwa7VP5HbR40157QAoKUg+WDD4DikaDQQn+6T6/vqo73e6JCN
	86HH7OYBd8OCJzFDpfZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvM-00CNMX-0M;
	Tue, 17 Oct 2023 13:15:52 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvB-00CN7O-1z
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:15:44 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c506d1798eso10178021fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548539; x=1698153339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1rHWB6wPm7iXDYEGbhbD+aT0XqxKs0nvsJfpQIGqGo=;
        b=A7HFONyUSIVhA8vzgXElfNJBh0PLLblx/Xf/Sw6+xtNiNz5FfLbxV4MznKKaAZIIPT
         N3oUAsHsE4fxjRh/OP7Ph6U73zhE8F8ideveTT3YOHJh9pA6jhuQAqPUSuGPTKI77hc1
         qM0KW0yJ909RMQv2t9n8iAAkCj+XJwXyyxHZT3S8Ul/09YFlXC0C0o7Dd1u/3MwAW3Ie
         pqRDZI1z8gS4qCy/Trojez5bQ/SRkodlT7zd94oHBOj164kqE0ycfkG43gCAnuAFSVsz
         nmGzP1W06P6KC1omhVO4B2UFuMxxZxIH2QV4qiBf8mDEV8zgHszZygEHEAhAlouDbxAo
         wSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548539; x=1698153339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1rHWB6wPm7iXDYEGbhbD+aT0XqxKs0nvsJfpQIGqGo=;
        b=ruFNHqepF2C0dTIkK63kmalkW3NB0EtDeSo5thJoWELMQgqU8Ltxt7DPA2xnf6pe1b
         +zLDi9OSJA/jc8WePzg0RyocSeBEDoti5hR97K2M+dYgb+RIOL8Z/3yowXN5uVEf/Atb
         S8xjo7y7LfNT3c+UgLds5o31dXE8n62c8E2SDKbOU4lx92xRXyMOwZmwl86gWSE+UZof
         m86kjoZfpQ25Ea7mzvDxNxVuTweItT0fVN39W/ZxiJUIsN++s1kAmr2zhRU7SNBy7fKA
         H7pCKzW2VAvwITUwu8Vq+3TOy3q6gfF+w+Zn/JJENeTYFp9XMpdfqsEOGTvW2fOuu7GN
         5Hzw==
X-Gm-Message-State: AOJu0Yyv5CiauVBuhVox87q1LieD6gE/n+Um/k7Fhsh4KCbSVeW+DgKc
	DsTOj2rYe3ZaC/8CmZXLIPMU4ZkEmzSnOa1dTrXGog==
X-Google-Smtp-Source: AGHT+IE8o+inTRSVUnhN0nXkjkUhZnyVP1Kvn8PbG9YD2TzCATvewF2se7oUMFMIdsxNUL5t0bXQaA==
X-Received: by 2002:a2e:9b4b:0:b0:2b9:e10b:a511 with SMTP id o11-20020a2e9b4b000000b002b9e10ba511mr1660431ljj.0.1697548538766;
        Tue, 17 Oct 2023 06:15:38 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:37 -0700 (PDT)
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
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v2 12/19] riscv: hwprobe: export Zhintntl ISA extension
Date: Tue, 17 Oct 2023 15:14:49 +0200
Message-ID: <20231017131456.2053396-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061541_654593_44D303D2 
X-CRM114-Status: GOOD (  11.60  )
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
b3NpbmMuY29tPgotLS0KIERvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QgICAgICAgfCAz
ICsrKwogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCB8IDEgKwogYXJjaC9y
aXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgICAgICAgICB8IDEgKwogMyBmaWxlcyBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUu
cnN0IGIvRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdAppbmRleCAzNWFlZGZmZjUwNDku
LjljOTA5ZTBkNTMxNiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJz
dAorKysgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0xNDMsNiArMTQzLDkg
QEAgVGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgogICAqIDpjOm1hY3JvOmBSSVNDVl9I
V1BST0JFX0VYVF9aRkhNSU5gOiBUaGUgWmZobWluIGV4dGVuc2lvbiB2ZXJzaW9uIDEuMCBpcwog
ICAgICAgIHN1cHBvcnRlZCBhcyBkZWZpbmVkIGluIHRoZSBSSVNDLVYgSVNBIG1hbnVhbC4KIAor
ICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aSUhJTlROVExgOiBUaGUgWmloaW50bnRs
IGV4dGVuc2lvbiB2ZXJzaW9uIDEuMAorICAgICAgIGlzIHN1cHBvcnRlZCBhcyBkZWZpbmVkIGlu
IHRoZSBSSVNDLVYgSVNBIG1hbnVhbC4KKwogKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlf
Q1BVUEVSRl8wYDogQSBiaXRtYXNrIHRoYXQgY29udGFpbnMgcGVyZm9ybWFuY2UKICAgaW5mb3Jt
YXRpb24gYWJvdXQgdGhlIHNlbGVjdGVkIHNldCBvZiBwcm9jZXNzb3JzLgogCmRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2h3cHJvYmUuaAppbmRleCAzOTA4MDVjNDk2NzQuLmRjNGVhYTk3OGFkMSAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAorKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCkBAIC01MSw2ICs1MSw3IEBAIHN0
cnVjdCByaXNjdl9od3Byb2JlIHsKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWS1QJCSgx
IDw8IDI1KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkZICQkoMSA8PCAyNikKICNkZWZp
bmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pGSE1JTgkoMSA8PCAyNykKKyNkZWZpbmUJCVJJU0NWX0hX
UFJPQkVfRVhUX1pJSElOVE5UTAkoMSA8PCAyOCkKICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlf
Q1BVUEVSRl8wCTUKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9VTktOT1dOCSgw
IDw8IDApCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURUQJKDEgPDwg
MCkKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvc3lzX3Jpc2N2LmMKaW5kZXggNGNjYThiOTgyYTdhLi44NGRhYWY2ZWQ0YTEgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCisrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3N5c19yaXNjdi5jCkBAIC0xNzIsNiArMTcyLDcgQEAgc3RhdGljIHZvaWQgaHdwcm9i
ZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKIAkJQ0hFQ0tfSVNBX0VYVCha
S1NFRCk7CiAJCUNIRUNLX0lTQV9FWFQoWktTSCk7CiAJCUNIRUNLX0lTQV9FWFQoWktUKTsKKwkJ
Q0hFQ0tfSVNBX0VYVChaSUhJTlROVEwpOwogCiAJCWlmIChoYXNfdmVjdG9yKCkpIHsKIAkJCUNI
RUNLX0lTQV9FWFQoWlZCQik7Ci0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
