Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CAFC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 11:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M70YpOAQXQL5Fbjfr3Iz78D00mAUp04b3MiNxJd9POQ=; b=AppzI/py4hspvx
	mKojYwRuXdAI0CCq0r6A11LQ1AeIQ2X2gn00ZBI+6qFlaG27riwKZzfedHNeXo4w6M8kigE5mS9WU
	LbD8TF0UP/xgHOkMWYu0jWMblXHDHKuWGOOBO6emj6FiqblLjAM9DtMcywl6uPrJQHEk4bZ4btaMR
	d+4IBmh9lJ2O/uZbantZ+vHnt1tp0hsuBquUq+vCapcNK0fvkCmUKwLwtu8k3xhDrLurrSLn2xTHm
	1lq/5C+0W2NYKFCrcK+zqE1RKzcgvn75VqBUw57x+dFVuwRN831O1/fbODLIb5h3LjEFK3FUPFRda
	lrYX1xXLUnMZhgpUfsyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtc6-000000010Nc-3eCK;
	Wed, 19 Jun 2024 11:36:30 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbW-00000000zoH-1Mmg
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:35:56 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ec17f19386so3906101fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 04:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718796951; x=1719401751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DCplyIcxOlnYOD05MVWPnelaWgV0jkCglAEoSEzjaM=;
        b=MIITlaRkK3U97eP6bTjIorJb+KM1/BSW9f0Qb83MI1BoayrC8BJbjxwWyYU5ogU7cC
         TACsufFu1ErIfKpNCSHL/XcIlz7kg00syLZHagjRZ08Qs0gYqMQn4ganjBi/yjG/ZSTg
         Piqi1cWVPo7QwuzQeCErz6ijvgdSY54XYBiHbyvPowJr+KPhqBML7ctzhNV85N+SM0SE
         zzJAoXIhybYux8atEhsbXu/w+govnBX8GdwQ2KRBrLh+AGe2hxyOm0cPKnj04N4Sam/S
         KPLd4Ek3AyS3qsmNHIC+vqCcFIcwBcRtdJsVOtryYz8zr/cuJ4v9AXaKRgOg2z8HwUR7
         snCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796951; x=1719401751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DCplyIcxOlnYOD05MVWPnelaWgV0jkCglAEoSEzjaM=;
        b=snOTddCL9ZeDjiThOTRDMeTJw4xPTaSaA7okpvNg7yUFkXR210NwIdjedXVbh5Mz2P
         SuYeDYrBv8H5V1me/zlQ3CNfvgK9myW9FevU2sSbIzAdvMujQIbY+i9d0L936EVU/5HS
         /Oal2eaAwgq1tRQ4Ym2hHwpxBEAvHmjIzo/XocMKbCfgmfZ4AzCFsos85fd0WLja5Qgo
         pY3++FUWDgHZnbVUynZ6Sqq7QMhSem2o3dTh7eY94pyJOAUd83720r+8fE3w9O2tVVCC
         1SO6pczpoVRyX5dPmhA+KTCnSTKJqz5noWKveNeDmSLcwwtF3HZlGkNd+5nAn5KMcvCp
         UWzA==
X-Forwarded-Encrypted: i=1; AJvYcCXQD+E2ZaUVeeLsB3qdcK+xYEGFlWuqMycQFqPsZ1oTVu8dkc26vcjS+PEdPtCS0HX8qPYM6FywcTSuEVZkHpXDNeFDllUwPI9NrOXVLqKe
X-Gm-Message-State: AOJu0YzJs4n62ne68qM6Z9Ab4fWM//aOsQjbgrgF04GxZOIQVlbwdh7K
	+ud+ydX3xANKmfhgGdtuIs+Lp8rH/p5YuyN/I+7qrchdSZsGTmW4tHn1NU/9LCs=
X-Google-Smtp-Source: AGHT+IFl03ofxCd9GRyKvjy/WzBtKYyK50aV8FZIus6pcW5Xx8qBswD4fqlYnwmmuxyZ9pdqNk8BJA==
X-Received: by 2002:a05:651c:1255:b0:2ec:31d9:16e1 with SMTP id 38308e7fff4ca-2ec3cff8f63mr10405361fa.5.1718796949125;
        Wed, 19 Jun 2024 04:35:49 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e67b:7ea9:5658:701a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm266192075e9.28.2024.06.19.04.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:35:48 -0700 (PDT)
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
Subject: [PATCH v7 10/16] RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb extensions for Guest/VM
Date: Wed, 19 Jun 2024 13:35:20 +0200
Message-ID: <20240619113529.676940-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_043554_704578_348EE078 
X-CRM114-Status: UNSURE (   9.71  )
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
Vk0gdXNlciBzcGFjZQp0byBkZXRlY3QgYW5kIGVuYWJsZSBaY2EsIFpjZiwgWmNkIGFuZCBaY2Ig
ZXh0ZW5zaW9ucyBmb3IgR3Vlc3QvVk0uCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIg
PGNsZWdlckByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPgpBY2tlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KLS0t
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggfCA0ICsrKysKIGFyY2gvcmlzY3Yv
a3ZtL3ZjcHVfb25lcmVnLmMgICAgICB8IDggKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9r
dm0uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAppbmRleCBkYjQ4MmVmMGFl
MWUuLjcxYjE3YTY3OTllNiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2t2bS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaApAQCAtMTY5LDYg
KzE2OSwxMCBAQCBlbnVtIEtWTV9SSVNDVl9JU0FfRVhUX0lEIHsKIAlLVk1fUklTQ1ZfSVNBX0VY
VF9aQUNBUywKIAlLVk1fUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRiwKIAlLVk1fUklTQ1ZfSVNBX0VY
VF9aSU1PUCwKKwlLVk1fUklTQ1ZfSVNBX0VYVF9aQ0EsCisJS1ZNX1JJU0NWX0lTQV9FWFRfWkNC
LAorCUtWTV9SSVNDVl9JU0FfRVhUX1pDRCwKKwlLVk1fUklTQ1ZfSVNBX0VYVF9aQ0YsCiAJS1ZN
X1JJU0NWX0lTQV9FWFRfTUFYLAogfTsKIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNw
dV9vbmVyZWcuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKaW5kZXggMDlmMGFhOTJh
NGRhLi5mNjhiMTViMTVmMGUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVn
LmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwpAQCAtNDksNiArNDksMTAgQEAg
c3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lzYV9leHRfYXJyW10gPSB7CiAJS1ZNX0lT
QV9FWFRfQVJSKFpCS0MpLAogCUtWTV9JU0FfRVhUX0FSUihaQktYKSwKIAlLVk1fSVNBX0VYVF9B
UlIoWkJTKSwKKwlLVk1fSVNBX0VYVF9BUlIoWkNBKSwKKwlLVk1fSVNBX0VYVF9BUlIoWkNCKSwK
KwlLVk1fSVNBX0VYVF9BUlIoWkNEKSwKKwlLVk1fSVNBX0VYVF9BUlIoWkNGKSwKIAlLVk1fSVNB
X0VYVF9BUlIoWkZBKSwKIAlLVk1fSVNBX0VYVF9BUlIoWkZIKSwKIAlLVk1fSVNBX0VYVF9BUlIo
WkZITUlOKSwKQEAgLTEzNCw2ICsxMzgsMTAgQEAgc3RhdGljIGJvb2wga3ZtX3Jpc2N2X3ZjcHVf
aXNhX2Rpc2FibGVfYWxsb3dlZCh1bnNpZ25lZCBsb25nIGV4dCkKIAljYXNlIEtWTV9SSVNDVl9J
U0FfRVhUX1pCS0M6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aQktYOgogCWNhc2UgS1ZNX1JJ
U0NWX0lTQV9FWFRfWkJTOgorCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNBOgorCWNhc2UgS1ZN
X1JJU0NWX0lTQV9FWFRfWkNCOgorCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNEOgorCWNhc2Ug
S1ZNX1JJU0NWX0lTQV9FWFRfWkNGOgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkZBOgogCWNh
c2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkZIOgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkZITUlO
OgotLSAKMi40NS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
