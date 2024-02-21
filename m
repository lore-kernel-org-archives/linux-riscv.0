Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEADC48BF6
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 08:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1NzqwcuWL1nCNflozOIywkYooE2LUmBXguN7zkjl+EI=; b=LWJleeuoPIa6tS
	VgyLeBd25H61CBadFRGgj4Iyi4YHXPH0heaUcYsI2lzpueVg2/GMn5GBChiTdSL6u16+7ECwKM1kF
	QCvWJpTBQpxvLQhZ0D6ycxozyDh6/FUjaedXaKDIBnUN2wq6RednOJ6zCki8IujUQ4jzsCpPO3+1L
	47vDMcp1hp+pZhcGLI6lemym1Zin8fpPGpX0opoLCoG/pmvOeWsgLexPwruQbh/scHGdggi1eqJ+s
	wcj3qQhQDoQqsq8zR3AKyPnWQsHLiwLsi7daaNUbVj3o+vwUMMPBCfJE76Hx2jokog45njUiuHmYo
	kza/2AfTaRTMTzDkGopA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rci0e-000000004dC-1lVc;
	Wed, 21 Feb 2024 08:31:20 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rci0b-000000004bo-2ZGj
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 08:31:19 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-33d72e6eebdso327030f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 00:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708504272; x=1709109072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3DfmgtPB5KtCEWqqxteO1F8ctpQ9OvQULDo2fgyZ5GM=;
        b=Z5PHrAULwbnEqAFIFI+MGWUEQC4PA9ucPZ3MXKsgEx3ooehbO/JYuEmgDdzahPXQkZ
         uhjGXaYY3dLWEcpr1NVumkThdnJlzsWytFk0V3AYVG3AsQOWnhl3hIq7n2qFXbchR6xs
         t1Eoz6Y6edAy/TYJMpGzJalOg9gcPk3AUeHmwR0aUfz8F4l+slJLutZwv/IVo2jZZjeg
         1rR+f97DiV0jaC8RDdia57/cM7mo8EUhaeUCso1pQH/tb1123yWIzWwTIe3a4my99hZN
         fnBQZCHfSw6B2CWDwCv/v3ixodFmTLbcD6qW4/UuVOhA3Kb5zT2HBwveRmKO04+3LOSg
         vk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708504272; x=1709109072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DfmgtPB5KtCEWqqxteO1F8ctpQ9OvQULDo2fgyZ5GM=;
        b=eHF7q4gIjfWUJQrqNoJZE7VTuPdj6t+kEqih+27fS5ZndumyJbvnAD9dUumlijzUOQ
         uFHcycPCV1ywhthjsqVIptH6friiusclvF9aXKHpXy4YCKQoNDf2gZ9GweDhSay5VFJI
         hiUl97dlAtkMjNS7WmBdy21scIboisKcyGT5A+ffW/48N+0tQE5yrn23FAkIFDOZcaqL
         Siz7RtWBe85PGs04I+Tzo/riUrVYxEl4qRZIRmgMMOfjU/+OI16n1Bq5+keWZruBv5Ud
         8qUkFNMe3nPutgYXzGVIc6z8dcbg7t13XHo3M39Eqlj33isgxs7tCl30624OledBf2NY
         BFJw==
X-Forwarded-Encrypted: i=1; AJvYcCW/e1prQH9ie6utiqWDd30fJLm0xJvSiAghaj9riQVk0LSeAVHv9RXn8gHVsm/MGBm8nhZXbS8qI/trpkVTxHMV2WrMbq4pGyxLchFabv9E
X-Gm-Message-State: AOJu0YyK88h33zeFjnWAybpOiwvWGruCkCGuV54r4Dke+8KLz4W6bd7w
	cqfW6+Gn2DOB+gjlPa6gjDhTeV1uMRPNdmfrmKYN1xfaN6WnG1Es6x7/1YclLJ4=
X-Google-Smtp-Source: AGHT+IFpQ25mW9HjQjzpg+0Xj68AfJWrOkwGecdVCbJfBfuwd15xExxElqbvXDzVs+szTRDW8c+wFw==
X-Received: by 2002:a05:600c:1ca8:b0:412:52a2:bd4e with SMTP id k40-20020a05600c1ca800b0041252a2bd4emr9522943wms.3.1708504272039;
        Wed, 21 Feb 2024 00:31:12 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e1be:e214:b8ab:dbb2])
        by smtp.gmail.com with ESMTPSA id q4-20020adfab04000000b0033cf637eea2sm16210705wrc.29.2024.02.21.00.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 00:31:11 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Robbin Ehn <rehn@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2] riscv: hwprobe: export Zihintpause ISA extension
Date: Wed, 21 Feb 2024 09:31:06 +0100
Message-ID: <20240221083108.1235311-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_003117_678441_3F08A902 
X-CRM114-Status: GOOD (  10.29  )
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

RXhwb3J0IHRoZSBaaWhpbnRwYXVzZSBJU0EgZXh0ZW5zaW9uIHRocm91Z2ggaHdwcm9iZSB3aGlj
aCBhbGxvd3MgdXNpbmcKInBhdXNlIiBpbnN0cnVjdGlvbnMuIFNvbWUgdXNlcnNwYWNlIGFwcGxp
Y2F0aW9ucyAoT3BlbkpESyBmb3IKaW5zdGFuY2UpIHVzZXMgdGhpcyB0byBoYW5kbGUgc29tZSBs
b2NraW5nIGJhY2stb2ZmLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJA
cml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5j
b20+Ci0tLQp2MjoKIC0gRml4IHR5cG8gImNvbW1pdCBjb21taXQiCiAtIEFkZCBBdGlzaCBSZXZp
ZXdlZC1ieToKIC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI0
MDIxOTE1NDkwNS41MjgzMDEtMS1jbGVnZXJAcml2b3NpbmMuY29tLwotLS0KIERvY3VtZW50YXRp
b24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCA0ICsrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9od3Byb2JlLmggfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMg
ICAgICAgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9h
cmNoL3Jpc2N2L2h3cHJvYmUucnN0CmluZGV4IGIyYmNjOWVlZDlhYS4uMjA0Y2Q0NDMzYWY1IDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKKysrIGIvRG9j
dW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0xODgsNiArMTg4LDEwIEBAIFRo
ZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKICAgICAgICBtYW51YWwgc3RhcnRpbmcgZnJv
bSBjb21taXQgOTVjZjFmOSAoIkFkZCBjaGFuZ2VzIHJlcXVlc3RlZCBieSBWZWQKICAgICAgICBk
dXJpbmcgc2lnbm9mZiIpCiAKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWklISU5U
UEFVU0VgOiBUaGUgWmloaW50cGF1c2UgZXh0ZW5zaW9uIGlzCisgICAgICAgc3VwcG9ydGVkIGFz
IGRlZmluZWQgaW4gdGhlIFJJU0MtViBJU0EgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0Cisg
ICAgICAgZDhhYjVjNzhjMjA3ICgiWmloaW50cGF1c2UgaXMgcmF0aWZpZWQiKS4KKwogKiA6Yzpt
YWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wYDogQSBiaXRtYXNrIHRoYXQgY29udGFp
bnMgcGVyZm9ybWFuY2UKICAgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHNlbGVjdGVkIHNldCBvZiBw
cm9jZXNzb3JzLgogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdw
cm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAppbmRleCA5ZjJh
OGUzZmYyMDQuLjMxYzU3MGNiZDFjNSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2h3cHJvYmUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9i
ZS5oCkBAIC01OSw2ICs1OSw3IEBAIHN0cnVjdCByaXNjdl9od3Byb2JlIHsKICNkZWZpbmUJCVJJ
U0NWX0hXUFJPQkVfRVhUX1pUU08JCSgxVUxMIDw8IDMzKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9C
RV9FWFRfWkFDQVMJCSgxVUxMIDw8IDM0KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWklD
T05ECSgxVUxMIDw8IDM1KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWklISU5UUEFVU0UJ
KDFVTEwgPDwgMzYpCiAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMAk1CiAjZGVm
aW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTgkoMCA8PCAwKQogI2RlZmluZQkJ
UklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVECSgxIDw8IDApCmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3
cHJvYmUuYwppbmRleCBhN2M1NmI0MWVmZDIuLjEwMDhkMjU4ODBlMSAxMDA2NDQKLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNf
aHdwcm9iZS5jCkBAIC0xMTEsNiArMTExLDcgQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0
MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKIAkJRVhUX0tFWShaVFNPKTsKIAkJRVhUX0tF
WShaQUNBUyk7CiAJCUVYVF9LRVkoWklDT05EKTsKKwkJRVhUX0tFWShaSUhJTlRQQVVTRSk7CiAK
IAkJaWYgKGhhc192ZWN0b3IoKSkgewogCQkJRVhUX0tFWShaVkJCKTsKLS0gCjIuNDMuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
