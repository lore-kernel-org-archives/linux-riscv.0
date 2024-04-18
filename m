Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7CBC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 12:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mpp8vDXHvWCNWcnO8chuwNr0iqFKl6zBeS5SpExdTM4=; b=wDgV0/Ai2g1wlL
	ydyJvajUL08ynuZ0wM5OSplf09C4aHYCSPNjUtzRo3e1AYZ2SD6sorGyB2s1g8Aov+ZWYu/NJ6Uk1
	g4gL7tCb4uHsqUEDRD9CgLnQTcv6CIevaQGs9f1Xgg3010rXuHZ9pDgBaF8TUUPpjzFgYzAHUiXyu
	9cp8nTAEbAAvW7Shps8//tPSmOmTbU8lW7Om1vXf3rQkO/T2/q2ChNnHdgTpqqFl9q7HPdZQVkd2f
	409tClvWVHq9lD0vqecQWcF9RwkuuXl9VQF5ryaHlOKVBu+PB0rj9M9EvBwQSsIk4k0o7Amvf9WsC
	K250r05htA2IeIF/aBkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR7g-00000002ChG-3J14;
	Thu, 18 Apr 2024 12:44:16 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR7U-00000002CSg-2PUU
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 12:44:07 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-349a31b2babso94919f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 05:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713444240; x=1714049040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t82SHWSKnQwBrCB557sYOimgSCzDvuCob+i4t0Pqx/Q=;
        b=hiwvMnD9wVVFPdsdVjLO8J32Otc2VNJVmrREegGNcfgFoozQEynFEz83d8DqpMrVHE
         wcXbfYuOOS4ZbbTVuWxGqZy4oPj+DS9Y1PLcmhRTttP0jvO7sSxmOemtgQaoF9Txa0zP
         0iR0Ij/lyoN+aHiq5BVO8PQe2xBlnh7G+FlBRmU3M0VziwEioKYWntonMl7sAfJi1A9D
         cpDJD8rQkR3c3OqGmNPB0WTPY6ecqBWADPkYdGBwHuftEXONB6ncO6Yr2Z8p2o/GbXkA
         zNKrR5oUPK8PJFyHU5jxC4g+25RsJWs++Lit3YvoX7sSn/v1LmNfZY0Y/kZyH5aPSZcL
         S1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444240; x=1714049040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t82SHWSKnQwBrCB557sYOimgSCzDvuCob+i4t0Pqx/Q=;
        b=aXTOmK7kz76AwYkGhIPS2ibvV/PTtGJuWlSTMDxWPEX7dArGv2a1nCn9Xz7Z34pStH
         n37GKgUrsCefGBDjVCUTG/YEQstV7X9gWMWYLNdEikAKV6pFLPcCStFfrG6YHj5eTGL4
         Yy8rKw+cxGt6vgJmV6d+J/KGlbEgz3M91fEuIS3Hut2geZef8cM8KN4KO5pk3rc8QBA5
         +nZSlt181oVTJ7zXE8fM1xKoBzjf6rMoSKQi15oor34ELGVqQAGrSnhFwCfGgUr38x4u
         Ye/fPczI9BnQERHTZxfDTzwwhCxCyJ7raPZLmJ2wEBpBhrquBA97USnjmZFOd4afZBpA
         5M5g==
X-Forwarded-Encrypted: i=1; AJvYcCUal8zfuX9PJ7EIblVoAhY06uEzWHNZWDLM2RmjUTZHDlU6G0qKKYaVb60NJIL1K+7ZWoQ55giHdUIXellU/8xY49Hlj/R7mwefZxmP334E
X-Gm-Message-State: AOJu0YzxN1qplH/XvDFSXaenqJtqLaIZT7Zo53pg93+/hxCILO3Qlvsj
	SGcpS1eQWOHSIy4L4YUYydqMNXNGKttJZSJoms34qQOJIUPeZl1m4edtkO4/S0k=
X-Google-Smtp-Source: AGHT+IErS9LwS4/40J0dhVyrk/U2WpAaf5Tm6m07tMubctlbr1giuR0xo76AOxJlKf5jHdgFbxuJkw==
X-Received: by 2002:a05:600c:5101:b0:416:a773:7d18 with SMTP id o1-20020a05600c510100b00416a7737d18mr1843734wms.0.1713444239836;
        Thu, 18 Apr 2024 05:43:59 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b00418d5b16fa2sm3373412wmb.30.2024.04.18.05.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:43:59 -0700 (PDT)
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
Subject: [PATCH v2 05/12] riscv: hwprobe: export Zca, Zcf, Zcd and Zcb ISA extensions
Date: Thu, 18 Apr 2024 14:42:28 +0200
Message-ID: <20240418124300.1387978-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418124300.1387978-1-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_054404_730917_50E89E00 
X-CRM114-Status: GOOD (  10.57  )
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
LS0tCiBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgIHwgMjAgKysrKysrKysr
KysrKysrKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggfCAgNCAr
KysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgIHwgIDQgKysrKwogMyBm
aWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJv
YmUucnN0CmluZGV4IDljYTViMDkzYjZkNS4uYmY5NmI0ZThiYTNiIDEwMDY0NAotLS0gYS9Eb2N1
bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNo
L3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0xOTIsNiArMTkyLDI2IEBAIFRoZSBmb2xsb3dpbmcga2V5
cyBhcmUgZGVmaW5lZDoKICAgICAgICBzdXBwb3J0ZWQgYXMgZGVmaW5lZCBpbiB0aGUgUklTQy1W
IElTQSBtYW51YWwgc3RhcnRpbmcgZnJvbSBjb21taXQKICAgICAgICA1ODIyMDYxNGE1ZiAoIlpp
bW9wIGlzIHJhdGlmaWVkLzEuMCIpLgogCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhU
X1pDQWA6IFRoZSBaY2EgZXh0ZW5zaW9uIHBhcnQgb2YgWmMqIHN0YW5kYXJkCisgICAgICAgZXh0
ZW5zaW9ucyBmb3IgY29kZSBzaXplIHJlZHVjdGlvbiwgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDhi
ZTM0MTljMWMwCisgICAgICAgKCJaY2YgZG9lc24ndCBleGlzdCBvbiBSVjY0IGFzIGl0IGNvbnRh
aW5zIG5vIGluc3RydWN0aW9ucyIpIG9mCisgICAgICAgcmlzY3YtY29kZS1zaXplLXJlZHVjdGlv
bi4KKworICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aQ0JgOiBUaGUgWmNiIGV4dGVu
c2lvbiBwYXJ0IG9mIFpjKiBzdGFuZGFyZAorICAgICAgIGV4dGVuc2lvbnMgZm9yIGNvZGUgc2l6
ZSByZWR1Y3Rpb24sIGFzIHJhdGlmaWVkIGluIGNvbW1pdCA4YmUzNDE5YzFjMAorICAgICAgICgi
WmNmIGRvZXNuJ3QgZXhpc3Qgb24gUlY2NCBhcyBpdCBjb250YWlucyBubyBpbnN0cnVjdGlvbnMi
KSBvZgorICAgICAgIHJpc2N2LWNvZGUtc2l6ZS1yZWR1Y3Rpb24uCisKKyAgKiA6YzptYWNybzpg
UklTQ1ZfSFdQUk9CRV9FWFRfWkNEYDogVGhlIFpjZCBleHRlbnNpb24gcGFydCBvZiBaYyogc3Rh
bmRhcmQKKyAgICAgICBleHRlbnNpb25zIGZvciBjb2RlIHNpemUgcmVkdWN0aW9uLCBhcyByYXRp
ZmllZCBpbiBjb21taXQgOGJlMzQxOWMxYzAKKyAgICAgICAoIlpjZiBkb2Vzbid0IGV4aXN0IG9u
IFJWNjQgYXMgaXQgY29udGFpbnMgbm8gaW5zdHJ1Y3Rpb25zIikgb2YKKyAgICAgICByaXNjdi1j
b2RlLXNpemUtcmVkdWN0aW9uLgorCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pD
RmA6IFRoZSBaY2YgZXh0ZW5zaW9uIHBhcnQgb2YgWmMqIHN0YW5kYXJkCisgICAgICAgZXh0ZW5z
aW9ucyBmb3IgY29kZSBzaXplIHJlZHVjdGlvbiwgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDhiZTM0
MTljMWMwCisgICAgICAgKCJaY2YgZG9lc24ndCBleGlzdCBvbiBSVjY0IGFzIGl0IGNvbnRhaW5z
IG5vIGluc3RydWN0aW9ucyIpIG9mCisgICAgICAgcmlzY3YtY29kZS1zaXplLXJlZHVjdGlvbi4K
KwogKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wYDogQSBiaXRtYXNrIHRo
YXQgY29udGFpbnMgcGVyZm9ybWFuY2UKICAgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHNlbGVjdGVk
IHNldCBvZiBwcm9jZXNzb3JzLgogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaApp
bmRleCBhYzY4NzRhYjc0M2EuLmRkNGFkNzdmYWY0OSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oCkBAIC02MCw2ICs2MCwxMCBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAj
ZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQUNBUwkJKDFVTEwgPDwgMzQpCiAjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX0VYVF9aSUNPTkQJKDFVTEwgPDwgMzUpCiAjZGVmaW5lCQlSSVNDVl9IV1BS
T0JFX0VYVF9aSU1PUAkJKDFVTEwgPDwgMzYpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9a
Q0EJCSgxVUxMIDw8IDM3KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkNCCQkoMVVMTCA8
PCAzOCkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pDRAkJKDFVTEwgPDwgMzkpCisjZGVm
aW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQ0YJCSgxVUxMIDw8IDQwKQogI2RlZmluZSBSSVNDVl9I
V1BST0JFX0tFWV9DUFVQRVJGXzAJNQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVE
X1VOS05PV04JKDAgPDwgMCkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVM
QVRFRAkoMSA8PCAwKQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKaW5kZXggYzk5YTRjZjIzMWM1Li4y
ZmZhMGZlNTEwMWUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMK
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwpAQCAtMTEyLDYgKzExMiw4IEBA
IHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIs
CiAJCUVYVF9LRVkoWkFDQVMpOwogCQlFWFRfS0VZKFpJQ09ORCk7CiAJCUVYVF9LRVkoWklNT1Ap
OworCQlFWFRfS0VZKFpDQSk7CisJCUVYVF9LRVkoWkNCKTsKIAogCQlpZiAoaGFzX3ZlY3Rvcigp
KSB7CiAJCQlFWFRfS0VZKFpWQkIpOwpAQCAtMTMyLDYgKzEzNCw4IEBAIHN0YXRpYyB2b2lkIGh3
cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCQlFWFRfS0VZKFpG
SCk7CiAJCQlFWFRfS0VZKFpGSE1JTik7CiAJCQlFWFRfS0VZKFpGQSk7CisJCQlFWFRfS0VZKFpD
RCk7CisJCQlFWFRfS0VZKFpDRik7CiAJCX0KICN1bmRlZiBFWFRfS0VZCiAJfQotLSAKMi40My4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
