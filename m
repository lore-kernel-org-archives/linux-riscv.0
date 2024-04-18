Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D6CC04FFF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 14:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a14bx2KM5zOOjpNjaJOuSOBJhiWBH60SMOeCH4F9pSc=; b=vMqp6++EkPPEK+
	8cCgPTREVJh5yLbBs4b82dkwo1KomKV59bpAkJ5foZ8OU5W4uzwzNKAMUO3ZtfoNBj0uAX73/SrwO
	pd4h0XRsPrW3Ml1OmQbKesr6dyaEOi8p9Um9HZqoKCDDmVMd5VPohIvP9+l/IXnIJH6RmaiDURLnw
	ceGeft64lqI+Rs6SVxB1ZdT1fjZRzTYPJNUGkfZgC0ASg3KgTg5A7vSIeh9c6Hu35TGQ0OjDXmSfd
	TZXdrNVN/ajCc8zhoZG26WJhnjxv1BSNFUUZ3WDss8317GV9AUJPMO6k4iTbKp1iqkcJMZKEM5jq7
	OGy4UEvyXd8OnWlqpVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSjf-00000002cdD-0aqz;
	Thu, 18 Apr 2024 14:27:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSjR-00000002cYz-3yyb
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 Apr 2024 14:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JY0qCZAt1G9FqrirGdQPEL//dx+I/VeYeDHijBAzwaE=; b=Qro7cHd3fC+Dkn+BgdtiHMkZNx
	0nhRdA2wE/tJPQN4fqr5fO2GXqSYW1cjNtVIZ6G40/4uCKJAhEdlGVNnpWTJi4j6L+5KACHi2REmT
	Fa1k7cGqF6wcXm6yRrigIwz97MMgm/L+UL5rvJKlVZzLswJsFfi9u1UdFJ76nlC4QTfsfFM2FL78d
	CcAFzPtELlvEjxoZ8Kif51bsfGiaLyvmoAJszCmBSi12w9SpZiHDqMY7/QoyDKzzd+eLxJts8uy/m
	Epzwb6CUFMcFxusjujaY3sF5FpUCs6y7GRb5pMLnlOzey+cwTLN/Q+Jh2rKazRtrDZOA+OuZ0VMKC
	f8C7cinQ==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSjN-0000000C2Pk-2ovD
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 14:27:19 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-349a35aba9dso167616f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 07:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713450436; x=1714055236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JY0qCZAt1G9FqrirGdQPEL//dx+I/VeYeDHijBAzwaE=;
        b=ARG4KZEShLKzSSE9s4vbuISuP7kCYtUb85M/J5mhftVZXIDH9uLn9Da+EqCMZ4yxKI
         beroNeh8VJaWrKpaYesms4/NVZtodywiZUj4Sx+bMvoBJ6WtSlDc3HODNyyzqdS4lPnG
         dTBfPNruy9jOr9A5k6tzus/dkZNuMG3MDkpISTcSY9E9w6o1j+rHNYdRhTVBlfxbOf5J
         xy4HZBBSQxLO5yrw69tCMCk6EmSbPBU8dlroh141wwrhjLO1hh0o35wUCaJkKsFh3Wlq
         shK/nYTYPJjldrG5hVyUiuUxAz7ScOt2CamY10PJMGro63Q+gS3Qykt5bh21KEHAMheY
         FpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713450436; x=1714055236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JY0qCZAt1G9FqrirGdQPEL//dx+I/VeYeDHijBAzwaE=;
        b=ddrLVNpQBMS45OHgukLFjCXoedKlPG3H7+WfEVePqdZ3Z/lEX7I9o3c9SZjgvSOICT
         TouwIORCPSn8d3izLamoLOBsmL56LkWU1YJZHki0MC+coJCtpxmQj32TqHiK4BlJ+7jU
         UjCxkzMKrnV/5sGwCdtBJ+lL6IouzFqjhojICMMhBERrkA87XbTeNJh5vL944qBwLI+x
         zUviy4ud4VZB+yImsK72NsJUKwYwyAUxqlJfgWF3dxLYcGyKj9P5lQhtx5pvZ8xVhaI6
         zDa8oUBFLTVhcatfBn1hLCe9I38PPLhgn260X4DOIqTRsMvlJS1Yrwa8cuxJQHOtMr2D
         B2FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu1ji11xQ3LlAuPFBLXddHsuRpHMsVZ1Dx7MHWafp0IVnRBshykPQeqCq/Yj42JuK1m44BOTzNqzpxVxsyXIf15fnYi3EnmS6cEBOyx5Ws
X-Gm-Message-State: AOJu0Yz7nr/CI8zWGMomgBztNkyvDlTY+CKojqi7ZDpvPWfdId+535TH
	F9ZpPm0HErXfcTAkZYGUcDXe1c0Av9fqSfJYYWjM00zypynIAiRbLq0NHTaljMU=
X-Google-Smtp-Source: AGHT+IG9QM4RObWosVaHJ2Bu9iGsOImG7zvYuk0PErpgTMOYFhKXz5bCpwhT6ZoBg0yBf1Ld4kG3yA==
X-Received: by 2002:a05:600c:3554:b0:416:7b2c:df05 with SMTP id i20-20020a05600c355400b004167b2cdf05mr2101037wmq.1.1713450436400;
        Thu, 18 Apr 2024 07:27:16 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm2873645wmo.42.2024.04.18.07.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:27:15 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Ved Shanbhogue <ved@rivosinc.com>
Subject: [RFC PATCH 6/7] riscv: kvm: add SBI FWFT support for SBI_FWFT_DOUBLE_TRAP_ENABLE
Date: Thu, 18 Apr 2024 16:26:45 +0200
Message-ID: <20240418142701.1493091-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418142701.1493091-1-cleger@rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_152718_108785_4570171D 
X-CRM114-Status: GOOD (  15.46  )
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

QWRkIHN1cHBvcnQgaW4gS1ZNIFNCSSBGV0ZUIGV4dGVuc2lvbiB0byBhbGxvdyBWUy1tb2RlIHRv
IHJlcXVlc3QgZG91YmxlCnRyYXAgZW5hYmxpbmcuIERvdWJsZSB0cmFwcyBjYW4gdGhlbiBiZSBn
ZW5lcmF0ZWQgYnkgVlMtbW9kZSwgYWxsb3dpbmcKTS1tb2RlIHRvIHJlZGlyZWN0IHRoZW0gdG8g
Uy1tb2RlLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMu
Y29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmggICAgICAgICAgICAgICB8ICAx
ICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpX2Z3ZnQuaCB8ICAyICstCiBh
cmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgICAgICAgICAgICAgfCA0MSArKysrKysrKysr
KysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jc3IuaAppbmRleCA5MDVjZGY4OTRhNTcuLmVlMWI3MzY1NWJlYyAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAorKysgYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2Nzci5oCkBAIC0xOTYsNiArMTk2LDcgQEAKIC8qIHhFTlZDRkcgZmxhZ3Mg
Ki8KICNkZWZpbmUgRU5WQ0ZHX1NUQ0UJCQkoX0FDKDEsIFVMTCkgPDwgNjMpCiAjZGVmaW5lIEVO
VkNGR19QQk1URQkJCShfQUMoMSwgVUxMKSA8PCA2MikKKyNkZWZpbmUgRU5WQ0ZHX0RURQkJCShf
QUMoMSwgVUxMKSA8PCA1OSkKICNkZWZpbmUgRU5WQ0ZHX0NCWkUJCQkoX0FDKDEsIFVMKSA8PCA3
KQogI2RlZmluZSBFTlZDRkdfQ0JDRkUJCQkoX0FDKDEsIFVMKSA8PCA2KQogI2RlZmluZSBFTlZD
RkdfQ0JJRV9TSElGVAkJNApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
dmNwdV9zYmlfZndmdC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmlfZndm
dC5oCmluZGV4IDdkYzFiODBjN2U2Yy4uYTllMjBkNjU1MTI2IDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaV9md2Z0LmgKKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1fdmNwdV9zYmlfZndmdC5oCkBAIC0xMSw3ICsxMSw3IEBACiAKICNpbmNsdWRl
IDxhc20vc2JpLmg+CiAKLSNkZWZpbmUgS1ZNX1NCSV9GV0ZUX0ZFQVRVUkVfQ09VTlQJMQorI2Rl
ZmluZSBLVk1fU0JJX0ZXRlRfRkVBVFVSRV9DT1VOVAkyCiAKIHN0cnVjdCBrdm1fc2JpX2Z3ZnRf
Y29uZmlnOwogc3RydWN0IGt2bV92Y3B1OwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmlfZndmdC5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCmluZGV4IGI5Yjdm
OGZhNmQyMi4uOWU4ZTM5N2ViMDJmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3Ni
aV9md2Z0LmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCkBAIC05LDEwICs5
LDE5IEBACiAjaW5jbHVkZSA8bGludXgvZXJybm8uaD4KICNpbmNsdWRlIDxsaW51eC9lcnIuaD4K
ICNpbmNsdWRlIDxsaW51eC9rdm1faG9zdC5oPgorI2luY2x1ZGUgPGxpbnV4L3Jpc2N2X2RibHRy
cC5oPgogI2luY2x1ZGUgPGFzbS9zYmkuaD4KICNpbmNsdWRlIDxhc20va3ZtX3ZjcHVfc2JpLmg+
CiAjaW5jbHVkZSA8YXNtL2t2bV92Y3B1X3NiaV9md2Z0Lmg+CiAKKyNpZmRlZiBDT05GSUdfMzJC
SVQKKyMgZGVmaW5lIENTUl9IRU5WQ0ZHX0RCTFRSUAlDU1JfSEVOVkNGR0gKKyMgZGVmaW5lIERC
TFRSUF9EVEUJKEVOVkNGR19EVEUgPj4gMzIpCisjZWxzZQorIyBkZWZpbmUgQ1NSX0hFTlZDRkdf
REJMVFJQCUNTUl9IRU5WQ0ZHCisjIGRlZmluZSBEQkxUUlBfRFRFCUVOVkNGR19EVEUKKyNlbmRp
ZgorCiAjZGVmaW5lIE1JU19ERUxFRyAoMVVMIDw8IEVYQ19MT0FEX01JU0FMSUdORUQgfCAxVUwg
PDwgRVhDX1NUT1JFX01JU0FMSUdORUQpCiAKIHN0YXRpYyBpbnQga3ZtX3NiaV9md2Z0X3NldF9t
aXNhbGlnbmVkX2RlbGVnYXRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LApAQCAtMzYsNiArNDUs
MzMgQEAgc3RhdGljIGludCBrdm1fc2JpX2Z3ZnRfZ2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbihz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJcmV0dXJuIFNCSV9TVUNDRVNTOwogfQogCitzdGF0aWMg
aW50IGt2bV9zYmlfZndmdF9zZXRfZG91YmxlX3RyYXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAor
CQkJCQlzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqY29uZiwKKwkJCQkJdW5zaWduZWQgbG9u
ZyB2YWx1ZSkKK3sKKwlpZiAoIXJpc2N2X2RvdWJsZV90cmFwX2VuYWJsZWQoKSkKKwkJcmV0dXJu
IFNCSV9FUlJfTk9UX1NVUFBPUlRFRDsKKworCWlmICh2YWx1ZSkKKwkJY3NyX3NldChDU1JfSEVO
VkNGR19EQkxUUlAsIERCTFRSUF9EVEUpOworCWVsc2UKKwkJY3NyX2NsZWFyKENTUl9IRU5WQ0ZH
X0RCTFRSUCwgREJMVFJQX0RURSk7CisKKwlyZXR1cm4gU0JJX1NVQ0NFU1M7Cit9CisKK3N0YXRp
YyBpbnQga3ZtX3NiaV9md2Z0X2dldF9kb3VibGVfdHJhcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
CisJCQkJCXN0cnVjdCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mLAorCQkJCQl1bnNpZ25lZCBs
b25nICp2YWx1ZSkKK3sKKwlpZiAoIXJpc2N2X2RvdWJsZV90cmFwX2VuYWJsZWQoKSkKKwkJcmV0
dXJuIFNCSV9FUlJfTk9UX1NVUFBPUlRFRDsKKworCSp2YWx1ZSA9IChjc3JfcmVhZChDU1JfSEVO
VkNGR19EQkxUUlApICYgREJMVFJQX0RURSkgIT0gMDsKKworCXJldHVybiBTQklfU1VDQ0VTUzsK
K30KKwogc3RhdGljIHN0cnVjdCBrdm1fc2JpX2Z3ZnRfY29uZmlnICoKIGt2bV9zYmlfZndmdF9n
ZXRfY29uZmlnKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZW51bSBzYmlfZndmdF9mZWF0dXJlX3Qg
ZmVhdHVyZSkKIHsKQEAgLTExMSw2ICsxNDcsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBrdm1f
c2JpX2Z3ZnRfZmVhdHVyZSBmZWF0dXJlc1tdID0gewogCQkuaWQgPSBTQklfRldGVF9NSVNBTElH
TkVEX0RFTEVHLAogCQkuc2V0ID0ga3ZtX3NiaV9md2Z0X3NldF9taXNhbGlnbmVkX2RlbGVnYXRp
b24sCiAJCS5nZXQgPSBrdm1fc2JpX2Z3ZnRfZ2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbiwKKwl9
LAorCXsKKwkJLmlkID0gU0JJX0ZXRlRfRE9VQkxFX1RSQVBfRU5BQkxFLAorCQkuc2V0ID0ga3Zt
X3NiaV9md2Z0X3NldF9kb3VibGVfdHJhcCwKKwkJLmdldCA9IGt2bV9zYmlfZndmdF9nZXRfZG91
YmxlX3RyYXAsCiAJfQogfTsKIAotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
