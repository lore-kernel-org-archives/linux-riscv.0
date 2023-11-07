Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D4CC4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTbz2NTSUtp9ZggXYy65L1VIgthNTF9HfrTubO/LD+c=; b=sK5z+6OHdPKDR4
	pKcQMugZAUV2SZL2qkg9XkV8gLsECqbISwXHNJILJLQfh/mTFRsXVaXu32vyrdOAN0AmWykHQcQCX
	c4pgJWLhbQjrbg143X+NNzFsE26P14tfirtdnlEFMyvN8pyPdw5yATuaL3mbOYn0Ma9ipoCw9fqWC
	4f8BhzfXPb6CiKHhBZCNYkKovq6un2F/7Znlz2ZNW6Rve2hO5b+dyZcAd0ak7cfEQDVPop2Dos8jx
	bA5R2QLYgYQxWxuOMCrEVR7R+TmsDC1sCxt9s94ZsVKLvvF1dYEQUojrRcxIuUsGDZFSSa+XH+azv
	QDK5+Q0hSAVzL3NC+o3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jl9-0019lr-39;
	Tue, 07 Nov 2023 10:56:40 +0000
Received: from mail-ej1-f46.google.com ([209.85.218.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jky-0019S3-06
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 10:56:31 +0000
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9c96a82e93bso174654466b.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 02:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354584; x=1699959384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQVPAaYHkpM0GEJ73m22K8qqx/erlq7lj5m1X7f1ukE=;
        b=bugMcJGVKkAeJfPg2ddtL2oq/l/yKgZSltFM59xpuwbghIKGWEhnLFRLNWZr5G6+ux
         2qCnCnw63sTE1hzeQrrvbghBf30pkDLkP2cpFktl+pJ3SvcgNmvSq+rJKca4mnWMCYiR
         iTD+PJncTD3yITNxNgBjAdApjFtrJVB2tqi+kbKB6zUap9z620tOFIEpISFeD33gjimC
         5A53cvpdykUYayfCpVVu8E92EVegNvWBvLKKm7y47z4R7T0WFTWjv5Se+SK4P0NNL6iL
         rm6jyCv4WniVzi6k7lo5WzT6YpwdQFroE/CkX+bX3TONjTfb0Of7MX6PcKV01AtlNAip
         bbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354584; x=1699959384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQVPAaYHkpM0GEJ73m22K8qqx/erlq7lj5m1X7f1ukE=;
        b=EE3dzX5tAuqrfg7Ak3Ubve1uDEuOeaOHvFiCaW9mKKJzxtJBIZDISWxtNb2YjBIHTO
         Y/Qy+tP6LqoCiNCdMr0IW0OVp8wS24EOup5pQJU0GFcjdKtE6ze/ui57EJ3h+dpS0hRY
         zMjv8MFzZBQBU3/Z9ktMG0KSe+TExfQIBjjmiUfrUVfQo7Jo5BxMhhfyShvjnJk6YEwl
         XUGbwGpa/E6C3WfrygS8h3pLkOq0SHDqQH0ni+vIdscgVg0/0ZGQr1NE85/T24YELPF0
         C7SkY24nTSk/kTuLzCs20b8Pwo/5YDMOffBpeZx07J/o5NHXuzGymuP+zANc6ipYFvu6
         wN6Q==
X-Gm-Message-State: AOJu0YxO7d7q0TmpqaI6+0sMF8bxNo2PS/fhL19u8b60KSDb5N82ZfEH
	AAILHNMW3gP/CGt6ILHmdUzO7eP5sQ5OJ3jPQT78Xg==
X-Google-Smtp-Source: AGHT+IGj0yQcu+DGOcyOjDKINIocvRDdaol8XKw87jQoMj8DVyz/EpNBoI48Bn4wmnkpdAazd54/WA==
X-Received: by 2002:a17:907:86aa:b0:9bf:b83c:5efd with SMTP id qa42-20020a17090786aa00b009bfb83c5efdmr24912005ejc.3.1699354584016;
        Tue, 07 Nov 2023 02:56:24 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:23 -0800 (PST)
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
Subject: [PATCH v3 19/20] riscv: hwprobe: export Zfa ISA extension
Date: Tue,  7 Nov 2023 11:55:55 +0100
Message-ID: <20231107105556.517187-20-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_025628_084200_3C358581 
X-CRM114-Status: GOOD (  11.52  )
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

RXhwb3J0IFpmYSBJU0EgZXh0ZW5zaW9uWzFdIHRocm91Z2ggaHdwcm9iZS4KCkxpbms6IGh0dHBz
Oi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMVZUNlFJZ2dwYjU5LThRUlYyNjZkRUU0VDhGWlR4
R3E0L3ZpZXcgWzFdClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9z
aW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgotLS0K
IERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCA0ICsrKysKIGFyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL3N5
c19yaXNjdi5jICAgICAgICAgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9j
dW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CmluZGV4IDJhMmZlNGIwMjZlNy4uYTUz
ZmJjMDc2ZDdlIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5y
c3QKKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0xNTQsNiAr
MTU0LDEwIEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKICAgICAgICBkZWZpbmVk
IGluIHRoZSBSSVNDLVYgVmVjdG9yIG1hbnVhbCBzdGFydGluZyBmcm9tIGNvbW1pdCBlMmNjZDA1
NDhkNmMKICAgICAgICAoIlJlbW92ZSBkcmFmdCB3YXJuaW5ncyBmcm9tIFp2ZmhbbWluXSIpLgog
CisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pGQWA6IFRoZSBaZmEgZXh0ZW5zaW9u
IGlzIHN1cHBvcnRlZCBhcworICAgICAgIGRlZmluZWQgaW4gdGhlIFJJU0MtViBJU0EgbWFudWFs
IHN0YXJ0aW5nIGZyb20gY29tbWl0IDA1NmI2ZmY0NjdjNworICAgICAgICgiWmZhIGlzIHJhdGlm
aWVkIikuCisKICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0
bWFzayB0aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCiAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBz
ZWxlY3RlZCBzZXQgb2YgcHJvY2Vzc29ycy4KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3By
b2JlLmgKaW5kZXggNTEyNDMyN2I3MGZmLi43MWY2Y2RhNTJjNGMgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2h3cHJvYmUuaApAQCAtNTQsNiArNTQsNyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9i
ZSB7CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aSUhJTlROVEwJKDEgPDwgMjgpCiAjZGVm
aW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aVkZICQkoMSA8PCAyOSkKICNkZWZpbmUJCVJJU0NWX0hX
UFJPQkVfRVhUX1pWRkhNSU4JKDEgPDwgMzApCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9a
RkEJCSgxIDw8IDMxKQogI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzAJNQogI2Rl
ZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV04JKDAgPDwgMCkKICNkZWZpbmUJ
CVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVMQVRFRAkoMSA8PCAwKQpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlz
Y3YuYwppbmRleCAzY2Q1ZDQyYWUwMWYuLmRlZGZlM2M2YTM3YiAxMDA2NDQKLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2
LmMKQEAgLTE5Miw2ICsxOTIsNyBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVj
dCByaXNjdl9od3Byb2JlICpwYWlyLAogCQlpZiAoaGFzX2ZwdSgpKSB7CiAJCQlDSEVDS19JU0Ff
RVhUKFpGSCk7CiAJCQlDSEVDS19JU0FfRVhUKFpGSE1JTik7CisJCQlDSEVDS19JU0FfRVhUKFpG
QSk7CiAJCX0KICN1bmRlZiBDSEVDS19JU0FfRVhUCiAJfQotLSAKMi40Mi4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
