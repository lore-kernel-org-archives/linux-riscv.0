Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAFDC4167D
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pleRxe7ywnAmE+NgqrqnigSU6dj9NHBYCXrjB2wQdCk=; b=rar/8l9xTTyaTH
	UwBF8tvIuhgVi3zYlaIquMJXs5N5jbLuBHIsR6/OHGV5LtoZo7tip7OhMHBZiO2L58d6QgsJpnwOC
	N8STihET5DR7irjfDusrKlsY91moYOsg0kSSr+/Yz/rtTre+3plwXr30iq/xELSAoJlenOudwRa5N
	hx+I/+8BEvAgfkUmcYkJz0yqJ0tIOu8OSBJemUq9JcTLH0ptUdwlgRm8gv+we3iMo/my4VbxSULOd
	XE1c8EyU7mCR03m6nO39XGYkohmUAUePyp011PCS2bMY4LMHuxLXdO4E78mNKZehYksNuh+ajXXrY
	KWlRXxngOhAih0R4xs+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jl0-0019Vu-10;
	Tue, 07 Nov 2023 10:56:30 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkr-0019It-1c
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 10:56:24 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c504a51a18so11222401fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 02:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354578; x=1699959378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7aEHK12fdFG0G9p5Ar5H42P12VBS+xQqa4RJxPd+e8=;
        b=WGxGZJpCb9tyRUSk4W8fvbg57XecX6+0dz6sBMjC6F4YQm4ZJmP66mP0y7Oi2S9zp5
         C9ErXaEjFFsJaqpJjbRTAx85MefPyW33NT3Ox2XDpgodAghR1ZGIJrILywANPM4FkKcF
         fW0tKvyV8uXw2y+9ixIX3kr/NlwMqb2wAkwkc6UeSdASCWGNKbh+JzgSwzjgI0sOMrjc
         XTyP9NYaDBNR5K2XxW9Oz/VZUE5Svux5jKZ1nKqYnaTds5smtGodve43oPJxhce54r1j
         vHuS4oHE/ew6i0gKh8WJrrz8nHTKQsDfRBVVjay4HWGdvjPBcWFW6wJbKbgzmHmMAeAs
         r9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354578; x=1699959378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7aEHK12fdFG0G9p5Ar5H42P12VBS+xQqa4RJxPd+e8=;
        b=X2qHoNHju12ob8zM4DihvapMAVwHUq6MYrWETwV0RxeTVZXMdpmltMXf7sjbLvB3hz
         pHZQE4kyoUp1GiHKYepAzzJxkD/G4ZzLUmElcSbOxvYpB4mx6xiwnxBiUoMdcoy919oa
         ewEvIyhwvlkLv6JFybvqrdjEkPpN2oT1IiNiBH1YcfoUK7D/pMDDD/hSBT+/o1OxZce6
         U6xivLOizKqyyqH5zo/Omc9avt6+gWEv5sj2s+P7oDNVKYln9Fjibi+1g/l/btEaQNxk
         r/vHSGWRlmWYOcBv4xEKkNX/6xMkcK5bGzqPs2ar7ZLzMh2TMiIoMi5Rf02Bn75SEKVk
         kQuw==
X-Gm-Message-State: AOJu0Yz7+0TGq4z7UhPzsg/S1xqzRMuCinkbgFHJ3GgLNoQ4hjphb/P5
	SyxoUdocv7dcJja18IbZfCIpmeP7pWQTuHojOnLySA==
X-Google-Smtp-Source: AGHT+IG6riKUjiH4caHBP0UY8y2QJ6HnExEb8OSRHzEi1uOV2r19/bcFPMSaXYWd+67hvhTH5Nkmjw==
X-Received: by 2002:a05:651c:1317:b0:2c5:36e:31ef with SMTP id u23-20020a05651c131700b002c5036e31efmr23580871lja.5.1699354578058;
        Tue, 07 Nov 2023 02:56:18 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:17 -0800 (PST)
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
	Samuel Ortiz <sameo@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 14/20] dt-bindings: riscv: add Zihintntl ISA extension description
Date: Tue,  7 Nov 2023 11:55:50 +0100
Message-ID: <20231107105556.517187-15-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_025621_558939_B19A66C5 
X-CRM114-Status: UNSURE (   9.01  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciBaaWhpbnRudGwgSVNBIGV4dGVuc2lvblsxXSB3aGljaCBjYW4g
bm93IGJlIHJlcG9ydGVkCnRocm91Z2ggaHdwcm9iZSBmb3IgdXNlcnNwYWNlIHVzYWdlLgoKTGlu
azogaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xM193c044WW1SZkg4WVd5c0Z5VFgt
RGpUa0NuQmQ5aGovdmlldyBbMV0KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVn
ZXJAcml2b3NpbmMuY29tPgpBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2V4dGVuc2lvbnMueWFtbAppbmRleCA2MmI1ZmU0MGI0YTMuLmM4MDc3NGI1MThjOSAxMDA2NDQK
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMu
eWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5z
aW9ucy55YW1sCkBAIC0zMzYsNiArMzM2LDEyIEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgICBU
aGUgc3RhbmRhcmQgWmloaW50cGF1c2UgZXh0ZW5zaW9uIGZvciBwYXVzZSBoaW50cywgYXMgcmF0
aWZpZWQgaW4KICAgICAgICAgICAgIGNvbW1pdCBkOGFiNWM3ICgiWmloaW50cGF1c2UgaXMgcmF0
aWZpZWQiKSBvZiB0aGUgcmlzY3YtaXNhLW1hbnVhbC4KIAorICAgICAgICAtIGNvbnN0OiB6aWhp
bnRudGwKKyAgICAgICAgICBkZXNjcmlwdGlvbjoKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBa
aWhpbnRudGwgZXh0ZW5zaW9uIGZvciBub24tdGVtcG9yYWwgbG9jYWxpdHkgaGludHMsIGFzCisg
ICAgICAgICAgICByYXRpZmllZCBpbiBjb21taXQgMGRjOTFmNSAoIlppaGludG50bCBpcyByYXRp
ZmllZCIpIG9mIHRoZQorICAgICAgICAgICAgcmlzY3YtaXNhLW1hbnVhbC4KKwogICAgICAgICAt
IGNvbnN0OiB6aWhwbQogICAgICAgICAgIGRlc2NyaXB0aW9uOgogICAgICAgICAgICAgVGhlIHN0
YW5kYXJkIFppaHBtIGV4dGVuc2lvbiBmb3IgaGFyZHdhcmUgcGVyZm9ybWFuY2UgY291bnRlcnMs
IGFzCi0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
