Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E923DCD6E63
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 12:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PiZNzM92/tCy7ODPXIezunt5d9tvxQCG1esrY2JHYbs=; b=qZMVmmHBMFlPS8
	hOIdym2BUm/lCBzOrSaxlaejxcXFlj8eTxNU71nIBjyk2jv+HZ406hL+0C5h/s1bRl+F/Kdy31yTP
	A8eFozXJTiLIDDRG8P9WUkvRGdB0iaTVElFiignifEV3cEFh0qIHRTPX94RhEacG81nxH/EWZ6FKa
	hEAvGPSVe3KZw9BJK4HC4e3OrowqgZ4d3mFvVo8VsLGuyHObroMbKnbQTLZEBhGV+RyR/NsYe2r1M
	+uUVVTdLkzcJ1y51DaIh5j5B3Z0O4yRtwPkdQDAAfDAYW8hWc3sRPz2+n0aCuPdC0dS13aROnzQ7F
	NOejcoKnATW8/8MdPtNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqYMG-00FqpV-0Y;
	Wed, 11 Oct 2023 12:30:36 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFN-00FjGU-1k
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 11:19:29 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-406aaccb41dso18558275e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 04:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023160; x=1697627960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBNgr4CfRjqqsWxQ2+6f8weSNRNIv9nwhwGw5L11t7E=;
        b=RYaZNfxdDlIySV5aiufHoAA1WuSSoLncxrK8f1vwtjHxPElqxu2ZDF50Ea9fi7NGu2
         Ph0Kv8al0GcTlc4gEu6kg2PtIS66uWx7721jQ34WfsTKJbeL6/R6ZmzDc0/njOTRgJc3
         KfQ5wTLHbIBSzbnpXhR9osMMlvlWsZ9zznmd5RI4cPuqi55W5E8zw18V4+U9BC61kn8e
         pi1TpOOpzYOy+DUOMFHtFSv1rzYQ4PwDjH/QxWdJSdh6kMy0K6YGnGute1cdsI+0yldK
         ZOJaB2XOA5yLvebJNwYb8HQvYJccBf8uHoArRVzYIk/BJapLWFCjyxivRz9G1EjwsDRI
         87ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023160; x=1697627960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBNgr4CfRjqqsWxQ2+6f8weSNRNIv9nwhwGw5L11t7E=;
        b=DdqUsoHJii41u9d8KI+Hk1msfy1e38DCvxPUxIUMkI/lyZYIyWIzD98Y/Fa+F5ksT9
         QLkALJQylAVZ7l5hkmjvKthUkolJtge7995uGDCgtK4xesRLNj9rb4MpYyQzS0cqBI22
         Y0+Jl+UeG48bggRs/cKRv0uCuo+ByRCOv7/EOC7mgG15ysmdFGJVlnf/TlJ3urWyzowK
         XMgieuIjuInZ9IFN15+wWskfG9jEVxuePEfgQKMSgpK3Aea5RN4BNElbVosq0C4JvEVH
         KI+Ahor9/gaKPl2SAYMiz+qe4+ZoqdVL0IxBTWgkFFjnY0xT967IMv//wVo4xgT0gunF
         NdzA==
X-Gm-Message-State: AOJu0YzwYtwN/w5w7DgcY4b7eXjlCPIwuwylp/omvX5v+q4d/uQMUcVy
	aDq+asW4NJ7q36dwFmctLPQHp966owTi9uBxl4fZYg==
X-Google-Smtp-Source: AGHT+IGz2OBUFL5jTgh2YCxEN7qoM5h2KX6lIy42xfQJumWv/niH0yRdWTx+Aa/sRSbVnW7ryNwO9Q==
X-Received: by 2002:a05:600c:214f:b0:406:513d:738f with SMTP id v15-20020a05600c214f00b00406513d738fmr18787533wml.2.1697023159566;
        Wed, 11 Oct 2023 04:19:19 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:19 -0700 (PDT)
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
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v1 06/13] riscv: hwprobe: export Zfh/Zfhmin ISA extensions
Date: Wed, 11 Oct 2023 13:14:31 +0200
Message-ID: <20231011111438.909552-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011111438.909552-1-cleger@rivosinc.com>
References: <20231011111438.909552-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_041925_598883_8F02401F 
X-CRM114-Status: GOOD (  10.74  )
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

RXhwb3J0IFpmaC9aZmhtaW4gSVNBIGV4dGVuc2lvbnNbMV0gdGhyb3VnaCBod3Byb2JlIG9ubHkg
aWYgRlBVIHN1cHBvcnQKaXMgYXZhaWxhYmxlLgoKWzFdIGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNv
bS9maWxlL2QvMXozdFFRTG01QUxzQUQ3N1BNMGwwQ0huYXB4V0NlVnpQL3ZpZXcKClNpZ25lZC1v
ZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBEb2N1bWVu
dGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0ICAgICAgIHwgNiArKysrKysKIGFyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9od3Byb2JlLmggfCAyICsrCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlz
Y3YuYyAgICAgICAgIHwgNSArKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50
YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QKaW5kZXggZWRmZWQzMzY2OWVhLi4wNmY0OWEwOTVmMTkg
MTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QKKysrIGIvRG9jdW1l
bnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdApAQCAtMTI1LDYgKzEyNSwxMiBAQCBUaGUgZm9sbG93
aW5nIGtleXMgYXJlIGRlZmluZWQ6CiAgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pW
S1RgOiBUaGUgWnZrdCBleHRlbnNpb24gaXMgc3VwcG9ydGVkIGFzCiAgICAgICAgZGVmaW5lZCBp
biB2ZXJzaW9uIDEuMCBvZiB0aGUgUklTQy1WIENyeXB0b2dyYXBoeSBFeHRlbnNpb25zIFZvbHVt
ZSBJSS4KIAorICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aRkhgOiBUaGUgWmZoIGV4
dGVuc2lvbiB2ZXJzaW9uIDEuMCBpcyBzdXBwb3J0ZWQKKyAgICAgICBhcyBkZWZpbmVkIGluIHRo
ZSBSSVNDLVYgSVNBIG1hbnVhbC4KKworICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9a
RkhNSU5gOiBUaGUgWmZobWluIGV4dGVuc2lvbiB2ZXJzaW9uIDEuMCBpcworICAgICAgIHN1cHBv
cnRlZCBhcyBkZWZpbmVkIGluIHRoZSBSSVNDLVYgSVNBIG1hbnVhbC4KKwogKiA6YzptYWNybzpg
UklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wYDogQSBiaXRtYXNrIHRoYXQgY29udGFpbnMgcGVy
Zm9ybWFuY2UKICAgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHNlbGVjdGVkIHNldCBvZiBwcm9jZXNz
b3JzLgogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAppbmRleCBkODY4ZWI0MzFj
ZDYuLmM5MDE2YWJmMDk5ZSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2h3cHJvYmUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCkBA
IC00NSw2ICs0NSw4IEBAIHN0cnVjdCByaXNjdl9od3Byb2JlIHsKICNkZWZpbmUJCVJJU0NWX0hX
UFJPQkVfRVhUX1pWS1NICQkoMSA8PCAxOSkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pW
S1NHCQkoMSA8PCAyMCkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWS1QJCSgxIDw8IDIx
KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkZICQkoMSA8PCAyMikKKyNkZWZpbmUJCVJJ
U0NWX0hXUFJPQkVfRVhUX1pGSE1JTgkoMSA8PCAyMykKICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9L
RVlfQ1BVUEVSRl8wCTUKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9VTktOT1dO
CSgwIDw8IDApCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURUQJKDEg
PDwgMCkKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKaW5kZXggNGY1ZTUxYzE5MmQ1Li5kYTkxNjk4MTkzNGIg
MTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCisrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3N5c19yaXNjdi5jCkBAIC0xNzUsNiArMTc1LDExIEBAIHN0YXRpYyB2b2lkIGh3
cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCQlDSEVDS19JU0Ff
RVhUKFpWS1NHKTsKIAkJCUNIRUNLX0lTQV9FWFQoWlZLVCk7CiAJCX0KKworCQlpZiAoaGFzX2Zw
dSgpKSB7CisJCQlDSEVDS19JU0FfRVhUKFpGSCk7CisJCQlDSEVDS19JU0FfRVhUKFpGSE1JTik7
CisJCX0KICN1bmRlZiBDSEVDS19JU0FfRVhUCiAJfQogCi0tIAoyLjQyLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
