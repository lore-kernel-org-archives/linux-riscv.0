Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4719FC2BA15
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 11:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uo4cxu3j50Mt6fsLNwhj87BKnNAdXNAp3fOf/MNaiSM=; b=yHVyz3iYtV1Az4
	bKtRRIWeyR7WskRL7T3GgjT5lZ9fipT1V8Z63v+iA91+9I9xr8kXKQYk2twzrCfgBIDed2G3OxwgB
	BYpeX7sItasNWTksEAXGutVOGgIs1q5yyFbbWjpLP+lxoYgdL59U9yLqmBXtzGEPml88mIL0q/QqQ
	JHDQWIKjojp+CnujxWLbje48vlt6PzoqreaFNVRQO2JbDb3ffyM8gyAVAg7iByredirQo9Ouzqcj5
	vzBa6D9YXT1PtYWi3DQPRbCaQqThf7wgPInjNjPe8wSAoF8NZ++5Xp3qjTJKu3hboyk0RplqQv/DN
	Wf7koqhUg9iJMS6Uk5Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbz-000000010G3-21rc;
	Wed, 19 Jun 2024 11:36:23 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbR-00000000zlv-3yCE
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:35:55 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ebc724e1fdso7522881fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 04:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718796948; x=1719401748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNRHzoAv2tzJ98f4aZ+tvGJ/9WIogU2JNMbeWGeAmys=;
        b=KW7zwe8qVg3Z9zGz7/B1H8xfnpNNMC2PKWmPtgqf55dmOW2d21/4Hu3h+UqtbyLjPO
         IghLfgd0+N1SgQwX33mPhiT8phxvWcaTEohRL8JqB3F8lQOoeuTHTovivW+TRcg8yBaF
         mh3ejNEe8UcG5lrDGIYT6nms8WXGDzN0RvCQ/TGbmYmWtCXrXN5TzeLOR019up9nRADW
         slUL0MxmzuXt7gbn/zjDuENiTn8M9RbFoEvZ0L7GLY2ck7O/4xb2/kT2DTYDoYekvetM
         LEbbG/o8HCsRzcxJNBU2LPgPSHuyM3X6VwkaTsza8osUyNNaIEKECioYyTQgXtpfOzzZ
         Qj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796948; x=1719401748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNRHzoAv2tzJ98f4aZ+tvGJ/9WIogU2JNMbeWGeAmys=;
        b=IrHWPeQQtMM1WG/P/rYbq/2VDF7HfZ8weNGTjA8y7pKlVvxANYfXzt7YCnlZM+/7S+
         cBG/3I7qQ168Jujbb1NyqcMA1AE/arxNt8nK4MUtYd2yG8Ahvo4olXCD7CHawkpCbbxw
         GbPI5S5yIwEzfcQ2Gm4Gd4kX4pHRug3FWwIaRy5FYA+MVVHiDyJ6O3lpiBzbLt62KqZc
         N62kznRO5U3CrnnpqTdCxf4rTHFhMy/lXePFGkM+3nq2M7y+0iPuOVnMECJGdabDxH7B
         PjN23uesO1QCm/EA9/d/IEUHYmfMZAh/wSBIwD0ZcY9nwFpRKt6vQ2cxejkcRbgQ32Ac
         DnsA==
X-Forwarded-Encrypted: i=1; AJvYcCVuPucbfa/RISCPBpZfnTHxnMiK1jdWAGNm3xN4kVb3zXgu7gm9tQ6lEJElLavNfa7mkVxG3PE0Ct5KPuQTLpk3Kpuy/GzlGhK1fxmhjBdl
X-Gm-Message-State: AOJu0YykOKmg/mD4+YIpDd9uvzmvQAsneFJQW/rK/QF6S8736dKQsBLI
	DpIv38b93DzgauS8DOpZfpXUIiZjkWK4ACSPSU3tpMeSL3JWNQGaDYJZAtN/gBE=
X-Google-Smtp-Source: AGHT+IEglhe+wLVr2vUr1MIQVumBoAo5/7EbT9pjlwDp5yKvOdUU36tJ3TRsu6Nvsx4qLFShB9NrtQ==
X-Received: by 2002:a2e:8511:0:b0:2ec:daf:85d2 with SMTP id 38308e7fff4ca-2ec3cff89ebmr12681911fa.5.1718796948055;
        Wed, 19 Jun 2024 04:35:48 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e67b:7ea9:5658:701a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm266192075e9.28.2024.06.19.04.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:35:46 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v7 09/16] riscv: hwprobe: export Zca, Zcf, Zcd and Zcb ISA extensions
Date: Wed, 19 Jun 2024 13:35:19 +0200
Message-ID: <20240619113529.676940-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_043550_223886_CC535980 
X-CRM114-Status: GOOD (  11.54  )
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

RXhwb3J0IFpjYSwgWmNmLCBaY2QgYW5kIFpjYiBJU0EgZXh0ZW5zaW9uIHRocm91Z2ggaHdwcm9i
ZS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4K
UmV2aWV3ZWQtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Ci0tLQog
RG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDIwICsrKysrKysrKysrKysr
KysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgIDQgKysrKwog
YXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICB8ICA0ICsrKysKIDMgZmlsZXMg
Y2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJj
aC9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJz
dAppbmRleCAyYjdmMWQwNWIyZTMuLjRkOWI0ZWQzNGM5NiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
dGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CisrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNj
di9od3Byb2JlLnJzdApAQCAtMjExLDYgKzIxMSwyNiBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJl
IGRlZmluZWQ6CiAgICAgICAgc3VwcG9ydGVkIGFzIGRlZmluZWQgaW4gdGhlIFJJU0MtViBJU0Eg
bWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0CiAgICAgICAgNTgyMjA2MTRhNWYgKCJaaW1vcCBp
cyByYXRpZmllZC8xLjAiKS4KIAorICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aQ0Fg
OiBUaGUgWmNhIGV4dGVuc2lvbiBwYXJ0IG9mIFpjKiBzdGFuZGFyZAorICAgICAgIGV4dGVuc2lv
bnMgZm9yIGNvZGUgc2l6ZSByZWR1Y3Rpb24sIGFzIHJhdGlmaWVkIGluIGNvbW1pdCA4YmUzNDE5
YzFjMAorICAgICAgICgiWmNmIGRvZXNuJ3QgZXhpc3Qgb24gUlY2NCBhcyBpdCBjb250YWlucyBu
byBpbnN0cnVjdGlvbnMiKSBvZgorICAgICAgIHJpc2N2LWNvZGUtc2l6ZS1yZWR1Y3Rpb24uCisK
KyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWkNCYDogVGhlIFpjYiBleHRlbnNpb24g
cGFydCBvZiBaYyogc3RhbmRhcmQKKyAgICAgICBleHRlbnNpb25zIGZvciBjb2RlIHNpemUgcmVk
dWN0aW9uLCBhcyByYXRpZmllZCBpbiBjb21taXQgOGJlMzQxOWMxYzAKKyAgICAgICAoIlpjZiBk
b2Vzbid0IGV4aXN0IG9uIFJWNjQgYXMgaXQgY29udGFpbnMgbm8gaW5zdHJ1Y3Rpb25zIikgb2YK
KyAgICAgICByaXNjdi1jb2RlLXNpemUtcmVkdWN0aW9uLgorCisgICogOmM6bWFjcm86YFJJU0NW
X0hXUFJPQkVfRVhUX1pDRGA6IFRoZSBaY2QgZXh0ZW5zaW9uIHBhcnQgb2YgWmMqIHN0YW5kYXJk
CisgICAgICAgZXh0ZW5zaW9ucyBmb3IgY29kZSBzaXplIHJlZHVjdGlvbiwgYXMgcmF0aWZpZWQg
aW4gY29tbWl0IDhiZTM0MTljMWMwCisgICAgICAgKCJaY2YgZG9lc24ndCBleGlzdCBvbiBSVjY0
IGFzIGl0IGNvbnRhaW5zIG5vIGluc3RydWN0aW9ucyIpIG9mCisgICAgICAgcmlzY3YtY29kZS1z
aXplLXJlZHVjdGlvbi4KKworICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aQ0ZgOiBU
aGUgWmNmIGV4dGVuc2lvbiBwYXJ0IG9mIFpjKiBzdGFuZGFyZAorICAgICAgIGV4dGVuc2lvbnMg
Zm9yIGNvZGUgc2l6ZSByZWR1Y3Rpb24sIGFzIHJhdGlmaWVkIGluIGNvbW1pdCA4YmUzNDE5YzFj
MAorICAgICAgICgiWmNmIGRvZXNuJ3QgZXhpc3Qgb24gUlY2NCBhcyBpdCBjb250YWlucyBubyBp
bnN0cnVjdGlvbnMiKSBvZgorICAgICAgIHJpc2N2LWNvZGUtc2l6ZS1yZWR1Y3Rpb24uCisKICog
OmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0bWFzayB0aGF0IGNv
bnRhaW5zIHBlcmZvcm1hbmNlCiAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBzZWxlY3RlZCBzZXQg
b2YgcHJvY2Vzc29ycy4KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKaW5kZXgg
NTM4YzQwNDkzOGU2Li5jMzhmM2YyYjgzODIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS91YXBpL2FzbS9od3Byb2JlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3
cHJvYmUuaApAQCAtNjYsNiArNjYsMTAgQEAgc3RydWN0IHJpc2N2X2h3cHJvYmUgewogI2RlZmlu
ZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlZFNjRGCSgxVUxMIDw8IDQwKQogI2RlZmluZQkJUklTQ1Zf
SFdQUk9CRV9FWFRfWlZFNjRECSgxVUxMIDw8IDQxKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9F
WFRfWklNT1AJCSgxVUxMIDw8IDQyKQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkNBCQko
MVVMTCA8PCA0MykKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pDQgkJKDFVTEwgPDwgNDQp
CisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQ0QJCSgxVUxMIDw8IDQ1KQorI2RlZmluZQkJ
UklTQ1ZfSFdQUk9CRV9FWFRfWkNGCQkoMVVMTCA8PCA0NikKICNkZWZpbmUgUklTQ1ZfSFdQUk9C
RV9LRVlfQ1BVUEVSRl8wCTUKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9VTktO
T1dOCSgwIDw8IDApCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURUQJ
KDEgPDwgMCkKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCmluZGV4IDA0YTJlZDRlZTQxNS4uODllMDNj
ZGYzOGI3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCisrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKQEAgLTExMyw2ICsxMTMsOCBAQCBzdGF0
aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAogCQlF
WFRfS0VZKFpJQ09ORCk7CiAJCUVYVF9LRVkoWklISU5UUEFVU0UpOwogCQlFWFRfS0VZKFpJTU9Q
KTsKKwkJRVhUX0tFWShaQ0EpOworCQlFWFRfS0VZKFpDQik7CiAKIAkJLyoKIAkJICogQWxsIHRo
ZSBmb2xsb3dpbmcgZXh0ZW5zaW9ucyBtdXN0IGRlcGVuZCBvbiB0aGUga2VybmVsCkBAIC0xNDIs
NiArMTQ0LDggQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdw
cm9iZSAqcGFpciwKIAkJCUVYVF9LRVkoWkZIKTsKIAkJCUVYVF9LRVkoWkZITUlOKTsKIAkJCUVY
VF9LRVkoWkZBKTsKKwkJCUVYVF9LRVkoWkNEKTsKKwkJCUVYVF9LRVkoWkNGKTsKIAkJfQogI3Vu
ZGVmIEVYVF9LRVkKIAl9Ci0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
