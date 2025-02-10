Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08877C021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 22:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FnTB84Cs9NlMXw96htNbIHhJy9cx5+7FdrJDwpWaKgg=; b=xjCvMyuKWFwhCx
	j9ejE45KWhKcBUGEbfg5BgsUU4z7ERg/rVb0hPKbsLD2Mnc2PycRDl4QWZoh5J7XHWVamS/TkAPfI
	aD8VFh5C5BdAeZqJ46W9Vcib4DHcipy9gu8ibi4Q+FLnHD7TqQXbr7iVTnRdflVgtm2eVMIZ5bxBn
	jxuyzMR44+GEuYgzxiKCIu2IjC/rBfVsfAnHYd7qjAtHdiU3tNIAEbERelKkzj9MSuFeVZ2h7IRG2
	+FCiV3jhHeYHjmBD942g73U0FHkEizRkNCJTCiAfccY/4TQgOkX/CNARZxqYIW83ulxpW4JcoS1t1
	Ie5FJXQNvcGQbLRLtBdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcgw-00000001kdz-0TZ6;
	Mon, 10 Feb 2025 22:55:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbS9-00000001VWl-2iCV
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 21:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Omq0jMe02v0O4r8y1/1Uapc6yttVgCIGxdH7exDcAxo=; b=aRpmsMnKd0FmpM6kBEMGvL/k85
	37yTaLZ9ld7RUz9n15FR7oCoJqUbNV1v14jgWoH9Hg0ReM22q07MOrZFR2mrzFMDlakWj1DlaB9Ic
	KtpKTfjZ6OJWsGpPSvTg8eCgDrbM5CLCQpMzA0DeNwchZmHb10hI5Cxk9YvHcPuEpxHzQ2cSMmyr6
	8mRe35q4MpsC+7iaMeY8q35jjKxZxjF//ByPkfZjpOmbX+knMr2hVTIDmyN9g3FKA2zVaMoQiTwwG
	Wj4c6WDjRBytWntJYbsT3fvL4ve5Ius1sBuoRmtUlk7F5cyrWUKiNWPnUcW9TycrjYPjgN4dFGErT
	nl55jzhw==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbS0-00000000I9T-111n
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 21:36:27 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43937cf2131so14413215e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 13:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223371; x=1739828171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Omq0jMe02v0O4r8y1/1Uapc6yttVgCIGxdH7exDcAxo=;
        b=dg58qYlT3aNYwONXAxBBhYfBEj31nVCWyNVEFUKKxZSIPPR4NE5+2C521eW7yrnf63
         9L37+0MuuxjtGkfh7vIWFCnXK0L/w+Ulj5nnW+SSnAxT8Qy/rtV2cGZ8xfHs3aXJvo8e
         mWR5zScQw0TiKNRUCTrXYjTgYk0eST1/sEzmHnR4T8z3kEfEyPROixYjV5B//4e12uKb
         R6lXPAlmV2DDzKJKxHxTzBkqo1WCWnsUfMScN9EpVlkTADQKovTDOaZVCPg8CiNu6st9
         ZvyrcPZmFMBMEXRzo/FrjFTdCZ1UxvzwvGz9fK/63oTwf1xNvj5LO/30/InyLj9YTZRC
         0JEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223371; x=1739828171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Omq0jMe02v0O4r8y1/1Uapc6yttVgCIGxdH7exDcAxo=;
        b=Luj091svsxbrKgkvl3II8J8cK4VgCj7M2+a7Qn2iPazoSD3s+YP+Gr0DyTFSgDwE5n
         2GfI52/tmyaRHKdpCMM111zM1SZQeQ9YBK4FcCeg1TzlT4AmTdRGzF80nNVYMT9RFVqT
         FpftuEUFhIQ5GoXQrYegKFjhXADZC2o7aqdJM3qVWuo0gdrxAdmf+RGKhwos/GGIBAwz
         z2H5vZVKsbXLgUTMpT+iSvcTyrinz1AmhDUXOV3+mopIrxZ+FHrRiJSCIH/nRC1XwFwQ
         fPH5hpti7jec+mx6EWAdYt7wfCq0aWDckPz8H8CiUdBZpTWPRPYULWyqY9nzt2DJOQ9T
         nTXA==
X-Forwarded-Encrypted: i=1; AJvYcCWRvmYSD1d/k7UGZMnkMEWA37wlxDCxRXFz+LqQCCq8U14WKfW6Dj7tYJ/M/HOtZRWwRhzrkewDVstATw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxwWlKWa+iW0mGMW7ltJlPM2vB78zUCGjf2vlOITtkmfZm/DsH
	NZkUch77ECPJ45qYPy0RsP7muFQwKmBA0Akc6pzAS+ZQlMV5MeCgHIoGjyn0T7g=
X-Gm-Gg: ASbGnct2XfhYWEiKkUC188YUlgw/BWHzLAh2fg+EhIiLPaTxSPwlF0236aZu0JsaC9k
	MgBc4BqVUuIUql0WeFqBFq5P78AiBvQmpJCfvHPaWgy8DTi6pHx3eP4uW60z/czP/tWtuc6Py9g
	Ki/JPzdE0+8pMUbZEYNZ7wTZhibh499xpj5TAx0brJ69Cp3IoHfsS+VD15rvPcxbeyH/f3Mk9gL
	RKbCApx0SvdRkKo9PMz0O3T565suBqZEbUt10HBVO4j2ORIUjjppz2/2XC6+noXmBHL75OTkhOO
	aAgD242diIw5y/xk
X-Google-Smtp-Source: AGHT+IEW4IwiVYF//YV32GNZdcYc01vxx73uhLVhCiMW8eGAxNPBu731uRffpK0oYRexJJNizE9I8g==
X-Received: by 2002:a05:600c:510c:b0:434:a4b3:5ebe with SMTP id 5b1f17b1804b1-4394c847ad4mr11919565e9.24.1739223371617;
        Mon, 10 Feb 2025 13:36:11 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:11 -0800 (PST)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 06/15] riscv: misaligned: add a function to check misalign trap delegability
Date: Mon, 10 Feb 2025 22:35:39 +0100
Message-ID: <20250210213549.1867704-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_213622_574755_8667AB08 
X-CRM114-Status: GOOD (  11.94  )
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

Q2hlY2tpbmcgZm9yIHRoZSBkZWxlZ2FiaWxpdHkgb2YgdGhlIG1pc2FsaWduZWQgYWNjZXNzIHRy
YXAgaXMgbmVlZGVkCmZvciB0aGUgS1ZNIEZXRlQgZXh0ZW5zaW9uIGltcGxlbWVudGF0aW9uLiBB
ZGQgYSBmdW5jdGlvbiB0byBnZXQgdGhlCmRlbGVnYWJpbGl0eSBvZiB0aGUgbWlzYWxpZ25lZCB0
cmFwIGV4Y2VwdGlvbi4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCAgfCAg
NSArKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgMTcgKysrKysr
KysrKysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCmluZGV4IGFkN2QyNjc4OGU2YS4u
OGI5N2NiYTk5ZmMzIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1
cmUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaApAQCAtNjksMTIg
KzY5LDE3IEBAIGludCBjcHVfb25saW5lX3VuYWxpZ25lZF9hY2Nlc3NfaW5pdCh1bnNpZ25lZCBp
bnQgY3B1KTsKICNpZiBkZWZpbmVkKENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRCkKIHZv
aWQgdW5hbGlnbmVkX2VtdWxhdGlvbl9maW5pc2godm9pZCk7CiBib29sIHVuYWxpZ25lZF9jdGxf
YXZhaWxhYmxlKHZvaWQpOworYm9vbCBtaXNhbGlnbmVkX3RyYXBzX2Nhbl9kZWxlZ2F0ZSh2b2lk
KTsKIERFQ0xBUkVfUEVSX0NQVShsb25nLCBtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCk7CiAjZWxz
ZQogc3RhdGljIGlubGluZSBib29sIHVuYWxpZ25lZF9jdGxfYXZhaWxhYmxlKHZvaWQpCiB7CiAJ
cmV0dXJuIGZhbHNlOwogfQorc3RhdGljIGlubGluZSBib29sIG1pc2FsaWduZWRfdHJhcHNfY2Fu
X2RlbGVnYXRlKHZvaWQpCit7CisJcmV0dXJuIGZhbHNlOworfQogI2VuZGlmCiAKIGJvb2wgY2hl
Y2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCk7CmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKaW5kZXggN2Q2MTg1ZGVlYTMzLi4xZDUyM2NmOTZm
ZjAgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYworKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKQEAgLTcxNiw2ICs3MTYsOCBA
QCBzdGF0aWMgaW50IGNwdV9vbmxpbmVfY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCh1
bnNpZ25lZCBpbnQgY3B1KQogfQogI2VuZGlmCiAKK3N0YXRpYyBib29sIG1pc2FsaWduZWRfdHJh
cHNfZGVsZWdhdGVkOworCiAjaWZkZWYgQ09ORklHX1JJU0NWX1NCSQogCiBzdHJ1Y3QgbWlzYWxp
Z25lZF9kZWxlZ19yZXEgewpAQCAtNzMyLDggKzczNCw2IEBAIHN0YXRpYyBpbnQgc2JpX3JlcXVl
c3RfdW5hbGlnbmVkX2RlbGVnYXRpb24odm9pZCkKIAlyZXR1cm4gc2JpX2Vycl9tYXBfbGludXhf
ZXJybm8ocmV0LmVycm9yKTsKIH0KIAotc3RhdGljIGJvb2wgbWlzYWxpZ25lZF90cmFwc19kZWxl
Z2F0ZWQ7Ci0KIHN0YXRpYyBpbnQgY3B1X29ubGluZV9zYmlfdW5hbGlnbmVkX3NldHVwKHVuc2ln
bmVkIGludCBjcHUpCiB7CiAJaWYgKHNiaV9yZXF1ZXN0X3VuYWxpZ25lZF9kZWxlZ2F0aW9uKCkg
JiYgbWlzYWxpZ25lZF90cmFwc19kZWxlZ2F0ZWQpIHsKQEAgLTc4Miw2ICs3ODIsNyBAQCBzdGF0
aWMgaW50IGNwdV9vbmxpbmVfc2JpX3VuYWxpZ25lZF9zZXR1cCh1bnNpZ25lZCBpbnQgY3B1IF9f
YWx3YXlzX3VudXNlZCkKIHsKIAlyZXR1cm4gMDsKIH0KKwogI2VuZGlmCiAKIGludCBjcHVfb25s
aW5lX3VuYWxpZ25lZF9hY2Nlc3NfaW5pdCh1bnNpZ25lZCBpbnQgY3B1KQpAQCAtNzkyLDMgKzc5
MywxNSBAQCBpbnQgY3B1X29ubGluZV91bmFsaWduZWRfYWNjZXNzX2luaXQodW5zaWduZWQgaW50
IGNwdSkKIAogCXJldHVybiBjcHVfb25saW5lX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0
ZWQoY3B1KTsKIH0KKworYm9vbCBtaXNhbGlnbmVkX3RyYXBzX2Nhbl9kZWxlZ2F0ZSh2b2lkKQor
eworCS8qCisJICogRWl0aGVyIHdlIHN1Y2Nlc3NmdWxseSByZXF1ZXN0ZWQgbWlzYWxpZ25lZCB0
cmFwcyBkZWxlZ2F0aW9uIGZvciBhbGwKKwkgKiBDUFVTIG9yIHRoZSBTQkkgZG9lcyBub3QgaW1w
bGVtZW50ZWQgRldGVCBleHRlbnNpb24gYnV0IGRlbGVnYXRlZCB0aGUKKwkgKiBleGNlcHRpb24g
YnkgZGVmYXVsdC4KKwkgKi8KKwlyZXR1cm4gbWlzYWxpZ25lZF90cmFwc19kZWxlZ2F0ZWQgfHwK
KwkgICAgICAgYWxsX2NwdXNfdW5hbGlnbmVkX3NjYWxhcl9hY2Nlc3NfZW11bGF0ZWQoKTsKK30K
K0VYUE9SVF9TWU1CT0xfR1BMKG1pc2FsaWduZWRfdHJhcHNfY2FuX2RlbGVnYXRlKTsKXCBObyBu
ZXdsaW5lIGF0IGVuZCBvZiBmaWxlCi0tIAoyLjQ3LjIKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
