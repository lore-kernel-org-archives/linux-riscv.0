Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73379C3DA7A
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 11:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2BpczHF92VmXZO7mOAgFB1CrKZulKm/ghrFlYZ4Dd4Y=; b=bkqmQTUhk85HUv
	htow8GNR0kRo2v/k/6av3SOPsmnPDlRVRH5C54mt9m2goY1Sp7zcFN5jnJURugljB8YSgBtPe9T5r
	FJIr/WWcLvgZNvn4adwN9LMeXtRtDxTDj0eq42zr17jgcsIsGMBLNJwRpZa2IHDApdyKO8Oqd8/MW
	0k3ClEHhrv4FYRKjkh11oCK9/V0SywO30ZAYfQCaaFGnQB7YkhhEMVlHYOX4NbjrhRl73XJbumwWG
	Fkw33O8clPTDXcUTf+JM2F44l5EPdpVn1rHGQKfuxnlfnHVlNawx4m0iWqwRN2MAS1plZYxNDnXxr
	lrxvncMi8FgxasyqGv1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUX-00ETBq-0F;
	Wed, 13 Dec 2023 11:33:29 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUQ-00ET37-1d
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 11:33:24 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40c1e8458b9so11300285e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 03:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702467198; x=1703071998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3Huv5MEBJaGZczqd/5TE8MmVw2Iifvm3SE9MHyvArM=;
        b=ARNgD2H3kgd3ToP8iInjkwZsmoIpA2G0EYEvODkuMcj9NOU78xRoQ36m5Zwlo6HrgU
         oa/eReVm1rp49P7LiJ0MkGueaWKplTmraxKQDhvzlFI5cfXrAhTRMCe8JfRmc1ByvNgc
         f9+lK3WcJlWrTr+Cm6qZeRKWV2RvsE447U63gt4GLZKPbA0K7135b+/iZyW2juOrEq0a
         Pu1qRod+JqZtt8WTPBXPlmAmH+1bMfXZcMkr3C1SwVb9RWLrBhr2cav/7oq+RoHItxZJ
         a8EwixeCpwTrXKnsM9omlCVSAa//yannuX/tjvzGE0ASbdGPI5hOY0EtDjtfAgtPh0yB
         OEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467198; x=1703071998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3Huv5MEBJaGZczqd/5TE8MmVw2Iifvm3SE9MHyvArM=;
        b=eaPpf7N+6B6UaoAtNCM26WsQiUydU1Mo/0uzdNEWE5q+ZXAg4491kdhl+OemV9SyE9
         H6yv5F2lsV/su8XY+3vvIhko52qgszqyeOPyZKH5gnVRPTFDw/B1nwgHc4tu/P1b3qGb
         FBDNcfXjSGv7FpA2DhgxtTdzsAxKMi70yzIs92ZYSxk+bf17jb76K+2FGMoHYLPJ8CgO
         LkKiUek4V3vwVZhnXJc8UnXUvhlD1CXnpoG4dQRjQY07q1K+3S99IcjJjCCAj8jUDj06
         rbJ4IBTP6IzOM8gC+GHlY15ZJzViQui/+KWjj+UAbLPxGZOMVF/qOekU4Een1royIjYY
         c7Og==
X-Gm-Message-State: AOJu0Yyvva35bhq4PhBEDo8/DwEKaYXIaXFzGHDSBZGalZad48b6ty2u
	kQfGXATcCXuJdrUBGdNPu4Lp9g==
X-Google-Smtp-Source: AGHT+IEuw1QBTiAznUoQrReEOynJMkbQ+ARylSUzX7QvBk7zRYceQKbxX1KCoyBCOFTm72L9SeyM/g==
X-Received: by 2002:a7b:c411:0:b0:40b:4f49:4a33 with SMTP id k17-20020a7bc411000000b0040b4f494a33mr9613789wmi.4.1702467197998;
        Wed, 13 Dec 2023 03:33:17 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:c564:f167:d072:5672])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm22433137wms.30.2023.12.13.03.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:33:17 -0800 (PST)
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
Subject: [PATCH 5/9] riscv: hwprobe: export Zam ISA extension
Date: Wed, 13 Dec 2023 12:33:01 +0100
Message-ID: <20231213113308.133176-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213113308.133176-1-cleger@rivosinc.com>
References: <20231213113308.133176-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_033322_593416_4BF1640B 
X-CRM114-Status: GOOD (  10.62  )
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

RXhwb3J0IFphbSBJU0EgZXh0ZW5zaW9uIHRocm91Z2ggaHdwcm9iZS4KClNpZ25lZC1vZmYtYnk6
IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9u
L2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgIHwgMyArKysKIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBp
L2FzbS9od3Byb2JlLmggfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jICAgICAg
ICAgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9hcmNo
L3Jpc2N2L2h3cHJvYmUucnN0CmluZGV4IDEwYmQ3YjE3MDExOC4uOWIxOWNhMzQzM2RlIDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKKysrIGIvRG9jdW1l
bnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0xNjUsNiArMTY1LDkgQEAgVGhlIGZv
bGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgogICAgICAgIGRlZmluZWQgaW4gdGhlIFJJU0MtViBJ
U0EgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0IDU2MThmYjVhMjE2YgogICAgICAgICgiWnRz
byBpcyBub3cgcmF0aWZpZWQuIikKIAorICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9a
QU1gOiBUaGUgWmFtIGV4dGVuc2lvbiB2MC4xIGlzIHN1cHBvcnRlZCBhcworICAgICAgIGRlZmlu
ZWQgaW4gdGhlIFJJU0MtViBJU0EgbWFudWFsLgorCiAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JF
X0tFWV9DUFVQRVJGXzBgOiBBIGJpdG1hc2sgdGhhdCBjb250YWlucyBwZXJmb3JtYW5jZQogICBp
bmZvcm1hdGlvbiBhYm91dCB0aGUgc2VsZWN0ZWQgc2V0IG9mIHByb2Nlc3NvcnMuCiAKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCmluZGV4IDAxYWMzZGMxOTZlNS4uMjM1MGM0NTc0
MWE2IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCisr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKQEAgLTU3LDYgKzU3LDcg
QEAgc3RydWN0IHJpc2N2X2h3cHJvYmUgewogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlZG
SE1JTgkoMSA8PCAzMSkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pGQQkJKDFVTEwgPDwg
MzIpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aVFNPCQkoMVVMTCA8PCAzMykKKyNkZWZp
bmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pBTQkJKDFVTEwgPDwgMzQpCiAjZGVmaW5lIFJJU0NWX0hX
UFJPQkVfS0VZX0NQVVBFUkZfMAk1CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURf
VU5LTk9XTgkoMCA8PCAwKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxB
VEVECSgxIDw8IDApCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCmluZGV4IDY1NjRmYTllN2E3Zi4uYTg0NzNk
N2Y5ZDFlIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYworKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwpAQCAtMTc1LDYgKzE3NSw3IEBAIHN0YXRpYyB2
b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCUVYVF9L
RVkoWktUKTsKIAkJRVhUX0tFWShaSUhJTlROVEwpOwogCQlFWFRfS0VZKFpUU08pOworCQlFWFRf
S0VZKFpBTSk7CiAKIAkJaWYgKGhhc192ZWN0b3IoKSkgewogCQkJRVhUX0tFWShaVkJCKTsKLS0g
CjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
