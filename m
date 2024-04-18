Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7877CC04FF8
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 12:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ApSonKAdmsKTO9mbK6/SL3NFT1od6dakSsUE/EgpSA=; b=h82L9aoMYQiiqj
	H0sTF+E2YQZQRF/rTFGi3g+UpWYGrQHxagcwgvKWHviro/vUYi/OxI5VPTyozDwVVKID+T7IIanY4
	uBMKNSHD87XSCBY1+jskyonDJuOrIS/XhMZxNQFe3NVXEekckKYw4GU/x9Nm3bQUGJDgqwxx5Z1ir
	AawcUKsx6fOztwcgikTMLu8bniSSI3W34j/lWOcz3kg0zjgjTYEfNptWmRdmXbvR/cPTLHOqaY91l
	iR0eDzjBfhKPxp5dYSxYKCKUrsBgnFzUJZZgV2MZQ9AFZby7abec7CyEE7DQlHD3oD4u3RcYfAEPr
	v/ghHoj5F2LBkNyHrK2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR8c-00000002DTO-0QC4;
	Thu, 18 Apr 2024 12:45:14 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR7a-00000002CZo-3vQ8
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 12:44:13 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-347c6d6fc02so116325f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 05:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713444248; x=1714049048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FohdVePPG5jzF3AfSRVe1tr20y+8LhH20P3MwlhF1eo=;
        b=FhN64NhQERRODOWG2fwEhqXJetf9KBT6bsBRzs+LVdJXlXClziGjuGs4iDf1iUp3tq
         xgjJUObfOYh1q2Nz3atKb3inix0q4Vb8nIVyY6UGAvXMdk59lvn5b1itAu3MdXOxOfYH
         U3t5fbpaGxrS0MtKkOkcoliKwqymyoRpxJmxeyZk8UPLI+wOZRAHTccGFQ+RxiPHxoFL
         yXHP5lYCVtmtUKZFcoVRe7K+9PaMK6DLs1TJMeeh494d31TPUtQr/YabGMJ0mippYv9L
         sDHK1DRZvlEON7CjSnuPWCrCi9MHXBolsWA86oRBsIM5Vb3LCwkz5ir3W3/bYyvVrEzn
         7ZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444248; x=1714049048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FohdVePPG5jzF3AfSRVe1tr20y+8LhH20P3MwlhF1eo=;
        b=m/tPvLRH8R5KjvERYMEckX8jpL5d1jdiUSawV6QyNW9h1UtxmfAi/3Nr3MQESVtm80
         CU6Bub3yFtsj9DdiyXd7jrR5v/klWQCbY0mALL/94Mj1VP+bTRzwFpKerVm9CUU8cJ7W
         Qa7eMOjCGJV1Zl3QY0AIcCsUBmfNMKXeq83eDoQKdUSvMAxo17oyBO5ptX8oQHXMf4oS
         l0WDcilQc1oCxhl29FTz1mf3tEOB8pK6FwUdnFr3m3/4T23CFB7N1RkjaeYiz4d9YFLE
         7lseYyMHB1+jzsfKDSN6xXWi/bTVuHw+KXrRb1jTerlNEKPd+sjczNTRQz25wBR1lngE
         C/BA==
X-Forwarded-Encrypted: i=1; AJvYcCWYpHckAOteOEd8HoC1w4dvWRYmW4Xz5XnoOtP3Zz/UMV8WCUoxP6rHfKYKMPNS4mv7YbZODQmOzdLVJ2wR8l8eVrYYcQ9T8hG6qZUJHV1z
X-Gm-Message-State: AOJu0YxyFnz5uF91gcD6kcCf3PIVXE/FUoP4wda8pPb3J/jL5JmdcTpW
	n3qaqf3T9CjRpUGkfZW0UIE5CVAwrSns7IlGg4JXxiVPwuBBSE6PkfpGA3mTBZ4=
X-Google-Smtp-Source: AGHT+IF2De8slGmiEH7R+Sd8JWMFq3iRx3g2xhyGy7kAAvUUYk8LgiIFDjRM+gQKByYDrF2dau+9Wg==
X-Received: by 2002:adf:f984:0:b0:343:f2e0:449c with SMTP id f4-20020adff984000000b00343f2e0449cmr1668881wrr.0.1713444248202;
        Thu, 18 Apr 2024 05:44:08 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b00418d5b16fa2sm3373412wmb.30.2024.04.18.05.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:44:07 -0700 (PDT)
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
Subject: [PATCH v2 11/12] RISC-V: KVM: Allow Zcmop extension for Guest/VM
Date: Thu, 18 Apr 2024 14:42:34 +0200
Message-ID: <20240418124300.1387978-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418124300.1387978-1-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_054411_395196_8871BD98 
X-CRM114-Status: UNSURE (   9.35  )
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
Y29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCB8IDEgKwogYXJjaC9y
aXNjdi9rdm0vdmNwdV9vbmVyZWcuYyAgICAgIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3Zt
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKaW5kZXggNTdkYjNmZWE2Nzlm
Li4wMzY2Mzg5YTBiYWUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9r
dm0uaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKQEAgLTE3Miw2ICsx
NzIsNyBAQCBlbnVtIEtWTV9SSVNDVl9JU0FfRVhUX0lEIHsKIAlLVk1fUklTQ1ZfSVNBX0VYVF9a
Q0IsCiAJS1ZNX1JJU0NWX0lTQV9FWFRfWkNELAogCUtWTV9SSVNDVl9JU0FfRVhUX1pDRiwKKwlL
Vk1fUklTQ1ZfSVNBX0VYVF9aQ01PUCwKIAlLVk1fUklTQ1ZfSVNBX0VYVF9NQVgsCiB9OwogCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jIGIvYXJjaC9yaXNjdi9rdm0v
dmNwdV9vbmVyZWcuYwppbmRleCBhMjc0N2E2ZGJkYjYuLjc3YTBkMzM3ZmFlYiAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYworKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1
X29uZXJlZy5jCkBAIC01Miw2ICs1Miw3IEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBsb25nIGt2
bV9pc2FfZXh0X2FycltdID0gewogCUtWTV9JU0FfRVhUX0FSUihaQ0IpLAogCUtWTV9JU0FfRVhU
X0FSUihaQ0QpLAogCUtWTV9JU0FfRVhUX0FSUihaQ0YpLAorCUtWTV9JU0FfRVhUX0FSUihaQ01P
UCksCiAJS1ZNX0lTQV9FWFRfQVJSKFpGQSksCiAJS1ZNX0lTQV9FWFRfQVJSKFpGSCksCiAJS1ZN
X0lTQV9FWFRfQVJSKFpGSE1JTiksCkBAIC0xMzYsNiArMTM3LDcgQEAgc3RhdGljIGJvb2wga3Zt
X3Jpc2N2X3ZjcHVfaXNhX2Rpc2FibGVfYWxsb3dlZCh1bnNpZ25lZCBsb25nIGV4dCkKIAljYXNl
IEtWTV9SSVNDVl9JU0FfRVhUX1pDQjoKIAljYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pDRDoKIAlj
YXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pDRjoKKwljYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pDTU9Q
OgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkZBOgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRf
WkZIOgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkZITUlOOgotLSAKMi40My4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
