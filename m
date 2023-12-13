Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2747BC4167D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 11:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jbd3ApkJUcLoS+dL4PjzxHF3AxKjRu2C0E1KsLOP31U=; b=rlNFBvA5bVraVx
	g6+wu41/9l7uMBpAmwvEWRWBTdWXOd6HrrBA96fzwAghajJMfYh+8J/Fcy0cMnd5jIuW/p0kSN1q6
	0K5DBTGX3oysO9hPR3+9c4mmKl99zPEU0//r1bm1wvxbbrVt0c+v/YiSr3skSFmdyPFc7842IYpZm
	78h1cNwcfg8SG27cRLCYyiNLKl1J7so7M6DIF/AYtjekyafFN6hHU/mmdMUHjT32DMGy5HU/UvVYT
	DxBVniimOWFCnAyRS1paLfm8Kwt+pXv08ybnB1QKrfGTfD9VfTp1AVm2bzteLYdVWsqCEuObpqoZO
	J2cw4EK1k8J7ACTPyXdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUW-00ETBO-1N;
	Wed, 13 Dec 2023 11:33:28 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUQ-00ET5w-1j
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 11:33:24 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40c192f488cso11231135e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 03:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702467201; x=1703072001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OT3PabJ+SN8OyyxUlhRHLBK2j0fBOpZosf39djft3/Y=;
        b=N8Vo23KCZDSntkDv7eaN0bEDEl70axMCiFWXLM/XJpjo5sGw27FJop6c0DOVVG4gu9
         VJb3YOcjx1ahDdx4Bo/7sUQlHMaLexMvMWe7DvauHS8jYcmBlyXzoHXNu0dGs0s6EshK
         ucuwqfaz9ulBJfVjcdo5w4sABw8F2hWxIo7nlr3azQ9sscZ/oCU/MvqxtAy5C4+N0QyZ
         N/pt4zFry2nPSE1Mt0jRPM4k8f+pkoYMsw5FrTrtXrCC8dGoQI9oS9MXGC1SlraUIppq
         shBfJ1n+gZEZ9/U12i3qwW1F2LcA4z+C356uM7WgQRfm9SYbyFqL+cS4YaK/Y7JQ7w9z
         t2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467201; x=1703072001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OT3PabJ+SN8OyyxUlhRHLBK2j0fBOpZosf39djft3/Y=;
        b=a7ER7MIwxxzZpeYEVJDlm+Q/LbNDAiBfnbfQA9Qmg3g4DnXMLslUqwTbDjB5xXlBVw
         AeMB0BfJ6sQoUFndLjr8hC35vEnYdZnI+gNKcFXwXH+U5VSY2SxaMdvJW8Aiu4vgs0GJ
         CbhmOVP/UbcVG32nnChDlyeGosT9E4F4WBe9RjMvfnUKIRlDHFuOniRvmmSEDWdkB+ao
         DeD1n2xE9qZXrTsfsu5G0/3qXlijz9fkfrM8I/i3wpSvQC0x0euCHhzs0pv0YdSxC5HS
         75MNM7GTFLPvfPTJ7ZGIsgsMT7oKgLNV0ThdH0BKxIijpoZob7MnBfFxwV+Ja+p6NKvS
         3JnA==
X-Gm-Message-State: AOJu0Yw1TRH4yQU4OlTiI1TNKeFuZTlpTlJqnkE136GVcfpHwVnrh43C
	uTjFSbC6vK3SzxHOYlkXmNpaJA==
X-Google-Smtp-Source: AGHT+IH9GmoMwESHe8vAwJ7aLTEGq8Q2sisRnckD+tr/gJXlhQQcanfZ3+mQWdFY8OH3kjBBZTEQBA==
X-Received: by 2002:a05:600c:35d6:b0:40c:b81:c640 with SMTP id r22-20020a05600c35d600b0040c0b81c640mr9664241wmq.0.1702467200958;
        Wed, 13 Dec 2023 03:33:20 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:c564:f167:d072:5672])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm22433137wms.30.2023.12.13.03.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:33:20 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>
Subject: [PATCH 8/9] riscv: hwprobe: export Zacas ISA extension
Date: Wed, 13 Dec 2023 12:33:04 +0100
Message-ID: <20231213113308.133176-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213113308.133176-1-cleger@rivosinc.com>
References: <20231213113308.133176-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_033322_603903_78CC2E94 
X-CRM114-Status: GOOD (  10.34  )
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

RXhwb3J0IFphY2FzIElTQSBleHRlbnNpb24gdGhyb3VnaCBod3Byb2JlLgoKU2lnbmVkLW9mZi1i
eTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIERvY3VtZW50YXRp
b24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCA0ICsrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9od3Byb2JlLmggfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jICAg
ICAgICAgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9h
cmNoL3Jpc2N2L2h3cHJvYmUucnN0CmluZGV4IDliMTljYTM0MzNkZS4uNTEwZTQ5ODc4ODM0IDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKKysrIGIvRG9j
dW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0xNjgsNiArMTY4LDEwIEBAIFRo
ZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKICAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9C
RV9FWFRfWkFNYDogVGhlIFphbSBleHRlbnNpb24gdjAuMSBpcyBzdXBwb3J0ZWQgYXMKICAgICAg
ICBkZWZpbmVkIGluIHRoZSBSSVNDLVYgSVNBIG1hbnVhbC4KIAorICAqIDpjOm1hY3JvOmBSSVND
Vl9IV1BST0JFX0VYVF9aQUNBU2A6IFRoZSBaYWNhcyBleHRlbnNpb24gaXMgc3VwcG9ydGVkIGFz
CisgICAgICAgZGVmaW5lZCBpbiB0aGUgQXRvbWljIENvbXBhcmUtYW5kLVN3YXAgKENBUykgaW5z
dHJ1Y3Rpb25zIG1hbnVhbCBzdGFydGluZworICAgICAgIGZyb20gY29tbWl0IDUwNTllMGNhNjQx
YyAoInVwZGF0ZSB0byByYXRpZmllZCIpLgorCiAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tF
WV9DUFVQRVJGXzBgOiBBIGJpdG1hc2sgdGhhdCBjb250YWlucyBwZXJmb3JtYW5jZQogICBpbmZv
cm1hdGlvbiBhYm91dCB0aGUgc2VsZWN0ZWQgc2V0IG9mIHByb2Nlc3NvcnMuCiAKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCmluZGV4IDIzNTBjNDU3NDFhNi4uN2VjNDMzMTEyMmU3
IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCisrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKQEAgLTU4LDYgKzU4LDcgQEAg
c3RydWN0IHJpc2N2X2h3cHJvYmUgewogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkZBCQko
MVVMTCA8PCAzMikKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pUU08JCSgxVUxMIDw8IDMz
KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkFNCQkoMVVMTCA8PCAzNCkKKyNkZWZpbmUJ
CVJJU0NWX0hXUFJPQkVfRVhUX1pBQ0FTCQkoMVVMTCA8PCAzNSkKICNkZWZpbmUgUklTQ1ZfSFdQ
Uk9CRV9LRVlfQ1BVUEVSRl8wCTUKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9V
TktOT1dOCSgwIDw8IDApCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFU
RUQJKDEgPDwgMCkKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKaW5kZXggYTg0NzNkN2Y5ZDFlLi5hYmIwZWVh
M2VlMDggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCisrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCkBAIC0xNzYsNiArMTc2LDcgQEAgc3RhdGljIHZv
aWQgaHdwcm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKIAkJRVhUX0tF
WShaSUhJTlROVEwpOwogCQlFWFRfS0VZKFpUU08pOwogCQlFWFRfS0VZKFpBTSk7CisJCUVYVF9L
RVkoWkFDQVMpOwogCiAJCWlmIChoYXNfdmVjdG9yKCkpIHsKIAkJCUVYVF9LRVkoWlZCQik7Ci0t
IAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
