Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B2AC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 11:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9emaZ3zmZc5O1T8wB+JQlIFhFkHrc3CoQkikq4Sbi7I=; b=yF+v1ND1LTiGfg
	VJMjjKNt/zbUDnIfhk/VlGZ4FzN/tZIHb2pxBTaPFn6qnozWpx8ONbNCPxwP1BqsHKHlRiNZ9tviZ
	kUfWxWX2feMIOPgKf6nY7jtZuX9K3QOAGyAkYmKhH2qc9QPK1jJpz+gqZ7SaM6w2dvOoTJT0av6kt
	RdjMV1mYkhRDP3Eu34W2GuOfPw1iZafYC6djiyNFFj1a+hMmm0+mgXUO+fIVc0rPGl2ptxruhofRu
	tpVwcvarYozbwx5/PKa9XY3RgnZXOpotlq0FUPjd5NKzWLV96sGS02lxPRCKbys6aVvbzNCpdPWB8
	phTtu7O+ZEbEp9YNXEOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtce-000000010sb-0VDA;
	Wed, 19 Jun 2024 11:37:04 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbc-00000000zus-0Otn
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:36:06 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3632e0f80e5so49022f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 04:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718796958; x=1719401758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8Rh9bxOXlaEjkse1t0jBu0yyoIMzROFmPw8GuSuwXc=;
        b=wPaDGQAe3vGp2vp3H9xFcxkTg5sllDhO4VApsdnkgARcSDTuqHzB85ZwjybvCRy0wG
         lwNR42EIicNoobgv42gpv2T5FIhr9twiH2Y0Ypy4xat9EJBrJMVRvzdWaz3ptDWXp/DM
         BIJS/jOlHKiOY3pUjd5fuh5z05hyiCU7/n14XxoOCr5oOhPExUc5A6HBH6oIafVhGOot
         VRZ+VI59YMA1AdirqbduV1wRFQah83647Snv/U2f0IgUlf93IuxXPbHZRzqlurSGKBda
         pwpFHgQmH7U53kva5qDA8TDayxpZzMqjYgbXO4KPJds9A0QvmEKsZHELdCCkSgKWDEN8
         xtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796958; x=1719401758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8Rh9bxOXlaEjkse1t0jBu0yyoIMzROFmPw8GuSuwXc=;
        b=KuLbr5MWaB3LWVM5inZB3xmzWWMjlMWg6hDyDr5Wi7mG8bd76VvITH6QpWUoauiW45
         /TBQzMrCXGRXNafSP8tmFwQf9lIwzc7TtFhHKbmG/Rm4bsPzNj3euwpfrdxKdoPlb+wl
         EZGzzJOQ5rcaza4gBrugEqvGjQhCdlNI1HrbSE6SDAAUpcFTMSyQltVR4yIh/T+qLpuj
         o6ngFJYZvJmxM7D+zmmiKP4izCjuwMGbw9+l1cXLvyQDJ6knOoujMndjexE5jrbh27V0
         7zJiTToHVDIGJp2xMB8lMHqr1anx5XXj3x9+59WRuxx5t/MFUiPZUQMP3lwU2lhBQqZP
         TmEA==
X-Forwarded-Encrypted: i=1; AJvYcCUT4FP7fz6FNoYZSMoOzFLBRHoNUrn8hfC8bgHwFrOw8EJq5M7Om6SHTleikYvdwGt1iOiWYEcnqw66XIftDpBx5wkRv8ee6CXv7VWqtiXE
X-Gm-Message-State: AOJu0YzhYaEhcw4FP5DYJ+GPOyn6LH/BHSBK0oacOUjv+tqNbdHMgmwl
	Ll72XM3H8mUNloQadLVBXEvHE9O1xm/17vWVM3aPkTDon5nnVWWgPlHColmcXVY=
X-Google-Smtp-Source: AGHT+IEdIFzdiJIRJF1/XDFYO2GbdEU/OO890HU6J5fGWsC49e+py363/GxyHm/Q6iewSJjUJ7bm3A==
X-Received: by 2002:a05:600c:4fc9:b0:421:bb51:d630 with SMTP id 5b1f17b1804b1-424752981b8mr15707025e9.2.1718796958528;
        Wed, 19 Jun 2024 04:35:58 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e67b:7ea9:5658:701a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm266192075e9.28.2024.06.19.04.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:35:58 -0700 (PDT)
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
Subject: [PATCH v7 15/16] RISC-V: KVM: Allow Zcmop extension for Guest/VM
Date: Wed, 19 Jun 2024 13:35:25 +0200
Message-ID: <20240619113529.676940-16-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_043600_456271_C6E57F61 
X-CRM114-Status: UNSURE (   9.66  )
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

RXh0ZW5kIHRoZSBLVk0gSVNBIGV4dGVuc2lvbiBPTkVfUkVHIGludGVyZmFjZSB0byBhbGxvdyBL
Vk0gdXNlciBzcGFjZQp0byBkZXRlY3QgYW5kIGVuYWJsZSBaY21vcCBleHRlbnNpb24gZm9yIEd1
ZXN0L1ZNLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMu
Y29tPgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KQWNrZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Ci0tLQogYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2t2bS5oIHwgMSArCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAg
ICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9rdm0uaAppbmRleCA3MWIxN2E2Nzk5ZTYuLmE2MjE1NjM0ZGY3YyAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCisrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9rdm0uaApAQCAtMTczLDYgKzE3Myw3IEBAIGVudW0gS1ZNX1JJU0NWX0lT
QV9FWFRfSUQgewogCUtWTV9SSVNDVl9JU0FfRVhUX1pDQiwKIAlLVk1fUklTQ1ZfSVNBX0VYVF9a
Q0QsCiAJS1ZNX1JJU0NWX0lTQV9FWFRfWkNGLAorCUtWTV9SSVNDVl9JU0FfRVhUX1pDTU9QLAog
CUtWTV9SSVNDVl9JU0FfRVhUX01BWCwKIH07CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfb25lcmVnLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCmluZGV4IGY2OGIx
NWIxNWYwZS4uZmE1ZWU1NDRiYzY5IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29u
ZXJlZy5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKQEAgLTUzLDYgKzUzLDcg
QEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lzYV9leHRfYXJyW10gPSB7CiAJS1ZN
X0lTQV9FWFRfQVJSKFpDQiksCiAJS1ZNX0lTQV9FWFRfQVJSKFpDRCksCiAJS1ZNX0lTQV9FWFRf
QVJSKFpDRiksCisJS1ZNX0lTQV9FWFRfQVJSKFpDTU9QKSwKIAlLVk1fSVNBX0VYVF9BUlIoWkZB
KSwKIAlLVk1fSVNBX0VYVF9BUlIoWkZIKSwKIAlLVk1fSVNBX0VYVF9BUlIoWkZITUlOKSwKQEAg
LTE0Miw2ICsxNDMsNyBAQCBzdGF0aWMgYm9vbCBrdm1fcmlzY3ZfdmNwdV9pc2FfZGlzYWJsZV9h
bGxvd2VkKHVuc2lnbmVkIGxvbmcgZXh0KQogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNCOgog
CWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNEOgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNG
OgorCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNNT1A6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VY
VF9aRkE6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aRkg6CiAJY2FzZSBLVk1fUklTQ1ZfSVNB
X0VYVF9aRkhNSU46Ci0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
