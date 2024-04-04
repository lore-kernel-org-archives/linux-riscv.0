Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB40CD129B
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 11:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzqTzFpSB8aeoKJ3fe9wh0ooypgeWxO+4nIK0buCJX8=; b=rbBwrwhJ5n2uAG
	yOqTR7+5j5L7xQ2h9947na7GUe4cCQApPAHrl2PfB31dI7lRFTUnxd96B40mxMWhVQOsR5umNopFm
	NyE2kq44iQFe9Ipi/4xsNvZCWlI18ewNFPBrBFN6PnnBPTkZgm2zrgLV/eTDIh62jEAlagKjTfNhM
	KvOuZkqQo8IKGgqamWVxwcbH5qKZuv1wNWXdFWiC7zpqHDzcge3jjLqBbpR3BWwQL/T68cQjlDCMP
	7E4Xx60RXT4dRP+MRylvx9mhwVIDBOC35VU8dTIAWfqShSh5a4jEYpQRyAl+3CsM5j0sQduuoZIuZ
	1UQoQ6zJVnoYY2cCO5iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLbA-00000002RBV-1GUk;
	Thu, 04 Apr 2024 11:49:40 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKQP-00000002BtH-0oiY
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 10:34:31 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2d6f9ce80a9so1486201fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 03:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712226866; x=1712831666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjF6QSE2cP2K1a6PPhsxX1XHwBciK6+3OaYc7SlX0j8=;
        b=IwDvDhQQdDHER+ChwDeAQp45qtk7VVcAKmajZTlldngkVv2Qm5QN27Umx3kRa7kjMs
         FCeNRct+u+o3YdebgzzyHZlwmnEB8t673Wx5zgAl4XrIBFxKDp0RHAyusj+HAzz0hiAg
         olj1+xK3zAoDDHxtdwPrHXVxYXK032JFA+U3o4bL3rrowX97yscWO/fZIp/ODPo8WGhp
         94Un13i/7gkjuyi+7vPk1RG6sE86LYzbKpnU9RTGZhkjGe3ozs+giaEbPfbw6xfcMrVC
         VOyQRQBm1/vh/n/7r8ASwMUizVt9XqvHMPSO+tQD/6nQKzTdJxZLcYHxSJcvP9ay8NBF
         OqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712226866; x=1712831666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjF6QSE2cP2K1a6PPhsxX1XHwBciK6+3OaYc7SlX0j8=;
        b=Xks+klquzxfgYXx6E+R0bzBwKBjY/MgIXmvcvsMjQBGsxt7324X1l/Ejn+Tt0DAGfn
         qyu6vAE5vN0+YuL3OQ7aPj300mlxYVkFSlGm3LMz0X6ZOJOWNVCjZx0yIVtY9tLTJLFz
         kRlLydpYKByyVxWA8YfKU7rGkGmYsf80/WBm5jsUwwuEJyzfusxG8nr5+jUdocK0wI6S
         uZh++CZsJ7xXTSXtf/W89rRYGC/3EBUeizIcHQkufJk6iNnhnNtRegCqcb0AmxsNXUWY
         wong7a4kO1ARGt+ufb9Ha2gjEhc8n+63gOnTep/rdDFbXb2ojs13ebW1w9KzDukR4AXY
         oMcg==
X-Forwarded-Encrypted: i=1; AJvYcCWozqDHRQcEyp2tazdCsPYQrUVUus+P19P+Svlf3/+qmNzrsh8kwuU0ZJit51YXzpvMKV4YalNP25RRjY5waWKk3U65MePr49mSTGwPgxde
X-Gm-Message-State: AOJu0YwCaiOBVH7o0H7IVSkCGSGUBriWxlMvFb/bNOJILakDbVJCUGID
	+0X0vEfY8IcuqNhAeQgHt3XaRslx860HOplwHSaMARXBMlmC6vWdkVjiJ+Jtc7c=
X-Google-Smtp-Source: AGHT+IGlaI4aSTYeXf+5DsSs23XOj+0Iy8aSNYAWISenw8IXMUNIbrPzkzLCarPsEjj/RpuSZ193fg==
X-Received: by 2002:a2e:b0f2:0:b0:2d6:fa0c:77b0 with SMTP id h18-20020a2eb0f2000000b002d6fa0c77b0mr1408426ljl.2.1712226866293;
        Thu, 04 Apr 2024 03:34:26 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:555b:1d2e:132d:dd32])
        by smtp.gmail.com with ESMTPSA id ju8-20020a05600c56c800b00416253a0dbdsm2171340wmb.36.2024.04.04.03.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 03:34:25 -0700 (PDT)
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
	linux-kselftest@vger.kernel.org
Subject: [PATCH 3/5] riscv: hwprobe: export Zimop ISA extension
Date: Thu,  4 Apr 2024 12:32:49 +0200
Message-ID: <20240404103254.1752834-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240404103254.1752834-1-cleger@rivosinc.com>
References: <20240404103254.1752834-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_033429_386165_5647F5AF 
X-CRM114-Status: GOOD (  10.51  )
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

RXhwb3J0IFppbW9wIElTQSBleHRlbnNpb24gdGhyb3VnaCBod3Byb2JlLgoKU2lnbmVkLW9mZi1i
eTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIERvY3VtZW50YXRp
b24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCA0ICsrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9od3Byb2JlLmggfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMg
ICAgICAgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9h
cmNoL3Jpc2N2L2h3cHJvYmUucnN0CmluZGV4IGIyYmNjOWVlZDlhYS4uOWNhNWIwOTNiNmQ1IDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKKysrIGIvRG9j
dW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0xODgsNiArMTg4LDEwIEBAIFRo
ZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKICAgICAgICBtYW51YWwgc3RhcnRpbmcgZnJv
bSBjb21taXQgOTVjZjFmOSAoIkFkZCBjaGFuZ2VzIHJlcXVlc3RlZCBieSBWZWQKICAgICAgICBk
dXJpbmcgc2lnbm9mZiIpCiAKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWklNT1Bg
OiBUaGUgWmltb3AgTWF5LUJlLU9wZXJhdGlvbnMgZXh0ZW5zaW9uIGlzCisgICAgICAgc3VwcG9y
dGVkIGFzIGRlZmluZWQgaW4gdGhlIFJJU0MtViBJU0EgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29t
bWl0CisgICAgICAgNTgyMjA2MTRhNWYgKCJaaW1vcCBpcyByYXRpZmllZC8xLjAiKS4KKwogKiA6
YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wYDogQSBiaXRtYXNrIHRoYXQgY29u
dGFpbnMgcGVyZm9ybWFuY2UKICAgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHNlbGVjdGVkIHNldCBv
ZiBwcm9jZXNzb3JzLgogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20v
aHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAppbmRleCA5
ZjJhOGUzZmYyMDQuLmFjNjg3NGFiNzQzYSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2h3cHJvYmUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdw
cm9iZS5oCkBAIC01OSw2ICs1OSw3IEBAIHN0cnVjdCByaXNjdl9od3Byb2JlIHsKICNkZWZpbmUJ
CVJJU0NWX0hXUFJPQkVfRVhUX1pUU08JCSgxVUxMIDw8IDMzKQogI2RlZmluZQkJUklTQ1ZfSFdQ
Uk9CRV9FWFRfWkFDQVMJCSgxVUxMIDw8IDM0KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRf
WklDT05ECSgxVUxMIDw8IDM1KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWklNT1AJCSgx
VUxMIDw8IDM2KQogI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzAJNQogI2RlZmlu
ZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV04JKDAgPDwgMCkKICNkZWZpbmUJCVJJ
U0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVMQVRFRAkoMSA8PCAwKQpkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3By
b2JlLmMKaW5kZXggOGNhZTQxYTUwMmRkLi5jOTlhNGNmMjMxYzUgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3
cHJvYmUuYwpAQCAtMTExLDYgKzExMSw3IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAo
c3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCUVYVF9LRVkoWlRTTyk7CiAJCUVYVF9LRVko
WkFDQVMpOwogCQlFWFRfS0VZKFpJQ09ORCk7CisJCUVYVF9LRVkoWklNT1ApOwogCiAJCWlmICho
YXNfdmVjdG9yKCkpIHsKIAkJCUVYVF9LRVkoWlZCQik7Ci0tIAoyLjQzLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
