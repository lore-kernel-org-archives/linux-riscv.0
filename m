Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E129DC4167D
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rypsQKPYeOxodILI/ksLJil92Y5F4CKVtaja6tEbU3s=; b=aPRA6Wa0A2rwUn
	/QRxiAPMXeJPIMIbaI66EXx9InKAAMU3NPy4ugpWTlbwhIoqiA31P+KYsMHjuaUH796gwkAFPz1vo
	Jmi0GCYmaBpFof/z4zUlxuVfnutQxxhsiT+71yAr9+Z04YVm3/aQdZd3k3wMJSTgKJe9m/KQ+nFUy
	PvTtcD0AV7yxBfDerm94QDlJ7sb/3G/BlqJ0JbIJbgzKxKsBQy+6n/sIXTqA1z+hnwDcAv9xHs5qV
	J+Mdt2yEK5GpdLqu1eHoJQhCXZVpu0xYr2o1eN4vuRkNV61zilcXiDrimuh4+UfPDHuu30wbHkMzo
	gC58c+L46ATishy3qohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jl7-0019gq-1c;
	Tue, 07 Nov 2023 10:56:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jl1-0019Wu-0A
	for linux-riscv@bombadil.infradead.org;
	Tue, 07 Nov 2023 10:56:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=V5SlhQ+MFK/oE1hG84P6kssLtuGPrTemJS5B/ituwJs=; b=ZoS3TJtN8VmEnpoqmKgXHC9yzz
	6s3o5RByOmhmNz5z3RU2vNQtpayAckwL2CPKu/TFTMtN4gBtAwa+9iAw532yWStbVgwPSwzO9zCH5
	2ZISrrnaklHTVs19GbPwP/8Qqp34j/xTbc9lemrtmc79XPu/aq7q41uQ3z1k0CJCV2LJFREEVPcEB
	QW/yb8K3Ek4Am/zpMMIPs/rJOk/7X8STGj1KqOf50I848rpZFQ8XPc1o61aNTZa9r2QHP0quBgFO4
	gfiEqtawE2ZXODi7I8rk3lnBNL4rF30CIxqkT19quCGSznEb3cv7sNvjP4v7te+QrzOWt6OxFsRiL
	eb5mv4Nw==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkv-00Bx2i-2K
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 10:56:29 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32f9baca5bcso817470f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 02:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354581; x=1699959381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5SlhQ+MFK/oE1hG84P6kssLtuGPrTemJS5B/ituwJs=;
        b=QZOzx/sqNFkCabeazkax5P55fY2+Iv95Rdzl7UyyilvDVj7l8yCsAKN4LPrGjYedCX
         e9ZbxqllT+C4CRwPmOk1zKNRZXqnNaolwMG0hPl2QJaiTWnu0XOwJAbdGrTDS88zqLyq
         z+IdZWO3QouDMQ34toJf+wSzZacSGl6Cye6B82B+bOZH4SW6lRtbQ8NtOaaZAYNjFTI+
         7Jd5DHERcNu587RewXP93Xst58lWk4tcsXq/Qsy95W7eVKJyl8niRMD1eFGFPnurm6j3
         CIYLP4bWjU2hmHP9aCX9Ln4+er7y+o4A7FwOxY4oR5rw21dTTlkd4kSlEq2Ok0Iubrnn
         bPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354581; x=1699959381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5SlhQ+MFK/oE1hG84P6kssLtuGPrTemJS5B/ituwJs=;
        b=BeCX5s7uzpm9QIXTZp7nsevHebQm8K08B5eNiUA6Jg8+BARBWJWFsyWJR8YmLYNVsj
         vQSrzCkMzrF7qXAVHs5UQ9cDlctyEanTOhmWwDgcH9HXk5dTQgbWHkg04hYvUCyBzNtR
         g7do8TpmldQKRW/cDsd/CXRBuP+WJIf86F15YGC2WaYJR/xaL8K5KVXnV5u1ohTHbtsH
         3FY+9XAYi8jxhVd2FKjPsdJshvNshCkmuWrtnpgIdMxneXLLjL48uP6GYVt+/qbojDeN
         Cma70YT3drVHXVaiOz7kvJMcmTS/mJVqqwp//IQd5+9JipQ79olE4+9gw/zQx/2ek8u5
         2L/Q==
X-Gm-Message-State: AOJu0YxyAQrn1qcUIKNflyZRlVhLUuwp43up/hW9gRz6vbbMIi2vNIV7
	lyB4qXC/2/iFa+oeHBmJP1TImSWBI1Fs0Qjmtt7mRg==
X-Google-Smtp-Source: AGHT+IFQS7qfkMNRtAKpq/tiaOzmGYA+PKb/n54XAFPfjBLLUBdHDw7kelXyOwVBWWtsxlUnnASLNQ==
X-Received: by 2002:a05:600c:ac3:b0:404:72f9:d59a with SMTP id c3-20020a05600c0ac300b0040472f9d59amr26109516wmr.0.1699354580425;
        Tue, 07 Nov 2023 02:56:20 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:20 -0800 (PST)
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
Subject: [PATCH v3 16/20] riscv: hwprobe: export Zvfh[min] ISA extensions
Date: Tue,  7 Nov 2023 11:55:52 +0100
Message-ID: <20231107105556.517187-17-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_105625_881809_6BF79651 
X-CRM114-Status: GOOD (  10.60  )
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

RXhwb3J0IFp2ZmhbbWluXSBJU0EgZXh0ZW5zaW9uWzFdIHRocm91Z2ggaHdwcm9iZS4KCkxpbms6
IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMV9ZdDYwSEdBZjFyMWh4N0puc0lwdHcw
c3FrQmQ5QlE4L3ZpZXcgWzFdClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29t
PgotLS0KIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCA4ICsrKysrKysr
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMiArKwogYXJjaC9yaXNj
di9rZXJuZWwvc3lzX3Jpc2N2LmMgICAgICAgICB8IDIgKysKIDMgZmlsZXMgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3By
b2JlLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAppbmRleCAyZjM3
YjI2ZDI3ZGEuLjJhMmZlNGIwMjZlNyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jp
c2N2L2h3cHJvYmUucnN0CisrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJz
dApAQCAtMTQ2LDYgKzE0NiwxNCBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRlZmluZWQ6CiAg
ICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pJSElOVE5UTGA6IFRoZSBaaWhpbnRudGwg
ZXh0ZW5zaW9uIHZlcnNpb24gMS4wCiAgICAgICAgaXMgc3VwcG9ydGVkIGFzIGRlZmluZWQgaW4g
dGhlIFJJU0MtViBJU0EgbWFudWFsLgogCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhU
X1pWRkhgOiBUaGUgWnZmaCBleHRlbnNpb24gaXMgc3VwcG9ydGVkIGFzCisgICAgICAgZGVmaW5l
ZCBpbiB0aGUgUklTQy1WIFZlY3RvciBtYW51YWwgc3RhcnRpbmcgZnJvbSBjb21taXQgZTJjY2Qw
NTQ4ZDZjCisgICAgICAgKCJSZW1vdmUgZHJhZnQgd2FybmluZ3MgZnJvbSBadmZoW21pbl0iKS4K
KworICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aVkZITUlOYDogVGhlIFp2ZmhtaW4g
ZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCBhcworICAgICAgIGRlZmluZWQgaW4gdGhlIFJJU0MtViBW
ZWN0b3IgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0IGUyY2NkMDU0OGQ2YworICAgICAgICgi
UmVtb3ZlIGRyYWZ0IHdhcm5pbmdzIGZyb20gWnZmaFttaW5dIikuCisKICogOmM6bWFjcm86YFJJ
U0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0bWFzayB0aGF0IGNvbnRhaW5zIHBlcmZv
cm1hbmNlCiAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBzZWxlY3RlZCBzZXQgb2YgcHJvY2Vzc29y
cy4KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKaW5kZXggMzZjOGQwNzNjOTg3
Li41MTI0MzI3YjcwZmYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9o
d3Byb2JlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaApAQCAt
NTIsNiArNTIsOCBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAjZGVmaW5lCQlSSVNDVl9IV1BS
T0JFX0VYVF9aRkgJCSgxIDw8IDI2KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkZITUlO
CSgxIDw8IDI3KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWklISU5UTlRMCSgxIDw8IDI4
KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlZGSAkJKDEgPDwgMjkpCisjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX0VYVF9aVkZITUlOCSgxIDw8IDMwKQogI2RlZmluZSBSSVNDVl9IV1BST0JF
X0tFWV9DUFVQRVJGXzAJNQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05P
V04JKDAgPDwgMCkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVMQVRFRAko
MSA8PCAwKQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwppbmRleCBhZjJiMDFiMGE1YjYuLjNjZDVkNDJhZTAx
ZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKQEAgLTE4NSw2ICsxODUsOCBAQCBzdGF0aWMgdm9pZCBo
d3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAogCQkJQ0hFQ0tfSVNB
X0VYVChaVktTRUQpOwogCQkJQ0hFQ0tfSVNBX0VYVChaVktTSCk7CiAJCQlDSEVDS19JU0FfRVhU
KFpWS1QpOworCQkJQ0hFQ0tfSVNBX0VYVChaVkZIKTsKKwkJCUNIRUNLX0lTQV9FWFQoWlZGSE1J
Tik7CiAJCX0KIAogCQlpZiAoaGFzX2ZwdSgpKSB7Ci0tIAoyLjQyLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
