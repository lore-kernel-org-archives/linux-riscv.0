Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D60AC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 12:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EyIvw40nd1hGZkjWZm4afLXdPDfVuNSOlqN2P8W9KyY=; b=TJahTXhFp7iGQ1
	Z5W4uKsVa+4NpQd9n7EMgg96TZEmenlT5EmpqdDBbL1DkGATPCnmtzs1dlweZiVkS98DobV2rBgDd
	kvTnWXgvsEtove47ZVPLSQjOUnT/U+xsICt3h+khb5XwwmA4YT0yxc9jwAOY08Pn9x8Q3uUS1Znjk
	akLlX9HNozCiiioAoEhImK6GNYObSGH5JVwC9/J4qZ2BaYw12RLEIBAyqdUX1ZQInbi4DA/mvRQ6I
	i98Xir48FYHBRFu7/Q+myw+6PW4opHTfUXR81oSNnmnlYHp3sXb2Dxlf6W2InHmtZ8tpYiCcpdoUW
	Yj1dmrR2/l1SpdTC2j7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJuia-00000001DtR-32hb;
	Wed, 19 Jun 2024 12:47:16 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbG-00000000zcF-2r7q
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:35:40 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-35f0d49a9ebso404578f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 04:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718796937; x=1719401737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMzPOWjwpPL8KAzNp1ENlyw3QUAcLnR8cmiyMor/458=;
        b=eNadHAdrMeUYj+U3bmCnkQ0O4MZQxCnzpYzVse/2Syu1iP6nDm/yxQPSB5cQ2aEVzb
         LOUrEslpLa0YRYlIPOfdvEd5PQXl6cgpFkDrXSJFyK0PsWzI+nQ+fhKv+rNcViPzJc2y
         uDmA55sV+11a2vYPr205Z5Jog13tJlukUefb1Kf9Lx1j0BIGUOQvWw82TunMcYLMEc0p
         DQRb53xi/UgvkPXoWUMmQTf4XTJOW5eLU2mJlzHFaSRgeiqXKbrd1fA8LLQchyC2+62X
         qqfMaEpkjGWuot2tzhNV5XTtrS1meVUFticTbbOkcna0xG9X1yn8xNmCgnDjbwFTjcAe
         4L/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796937; x=1719401737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMzPOWjwpPL8KAzNp1ENlyw3QUAcLnR8cmiyMor/458=;
        b=chjjveHgmBsjyFoFftM3nK69U9WClBGrPBc1q/nsvYSstSUd5cMhkzGt5ckwm2APjx
         sNRezZdoVbZ9fJrz7L1QMghucd8Ejaj1VH6iVp1ATGhMysqX7PgQNGYRFzwUFIJvv0oN
         NaB257lKl4h4wOYK9NTnQvMScW7q8oNjcDtfP9Hgc3qlaLb/mw0EH7z/z7ZBWt5TFlS1
         xvdK84iSqClV1axo4IaussrqVvZeN4o55MWotzulfVZgN2k8lScrjywbc/AaDUSW2f70
         +xOJFFZd/BspZtTI8oJFDXl+vqqo8mz4tHRs32fMQvoJmEg/7aB7GKfFdY38LGoUIP21
         bBTA==
X-Forwarded-Encrypted: i=1; AJvYcCW5FeSC+1uZwf+i0eZJwkW6Cp5xiQmM4GlfCpxIsjy9igpXGzYe0TaYCT9jHeyULr8hwwa7LPOETSQHsV+vTFSsnco92iJgkZyY5f7DSkHH
X-Gm-Message-State: AOJu0YxTeppmFgwd14xnLWClD/xEVKJpv+ZVUYowrzRWh/41GsUqPRdH
	CCd83DHlHdLnjgB271B9q34DSd7pDSsqXzNRgwz6sOj31GWGwO5DWnpJKyTwYa0=
X-Google-Smtp-Source: AGHT+IGvamppuiP+XAy2cUkYTFJObTDgcrliUCH+z77J/E9pGnNdQq0NV24Wvh5pkbEYQQdLEc68iA==
X-Received: by 2002:a05:600c:3b9c:b0:421:de31:76 with SMTP id 5b1f17b1804b1-4247529f031mr15669885e9.3.1718796937115;
        Wed, 19 Jun 2024 04:35:37 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e67b:7ea9:5658:701a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm266192075e9.28.2024.06.19.04.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:35:36 -0700 (PDT)
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
	linux-kselftest@vger.kernel.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v7 02/16] riscv: add ISA extension parsing for Zimop
Date: Wed, 19 Jun 2024 13:35:12 +0200
Message-ID: <20240619113529.676940-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_043538_745305_8AAE5A38 
X-CRM114-Status: UNSURE (   9.37  )
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

QWRkIHBhcnNpbmcgZm9yIFppbW9wIElTQSBleHRlbnNpb24gd2hpY2ggd2FzIHJhdGlmaWVkIGlu
IGNvbW1pdAo1ODIyMDYxNGE1ZiBvZiB0aGUgcmlzY3YtaXNhLW1hbnVhbC4KClNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IENo
YXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9od2NhcC5oIHwgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAx
ICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
CmluZGV4IGY2NGQ0ZTk4ZTY3Yy4uMTg4NTkyNzc4NDNhIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2h3Y2FwLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
CkBAIC04Niw2ICs4Niw3IEBACiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZFNjRYCQk3NwogI2Rl
ZmluZSBSSVNDVl9JU0FfRVhUX1pWRTY0RgkJNzgKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkU2
NEQJCTc5CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklNT1AJCTgwCiAKICNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9YTElOVVhFTlZDRkcJMTI3CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCAxZDZl
NGZkYTAwZjguLmU1NTE2YmExNDQ0MCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
ZmVhdHVyZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtMjkwLDYg
KzI5MCw3IEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtd
ID0gewogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppaGludG50bCwgUklTQ1ZfSVNBX0VYVF9aSUhJ
TlROVEwpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppaGludHBhdXNlLCBSSVNDVl9JU0FfRVhU
X1pJSElOVFBBVVNFKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWhwbSwgUklTQ1ZfSVNBX0VY
VF9aSUhQTSksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEoemltb3AsIFJJU0NWX0lTQV9FWFRfWklN
T1ApLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHphY2FzLCBSSVNDVl9JU0FfRVhUX1pBQ0FTKSwK
IAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6ZmEsIFJJU0NWX0lTQV9FWFRfWkZBKSwKIAlfX1JJU0NW
X0lTQV9FWFRfREFUQSh6ZmgsIFJJU0NWX0lTQV9FWFRfWkZIKSwKLS0gCjIuNDUuMgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
