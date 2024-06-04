Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59848C25B78
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 12:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HuCwWAG96qb/fgvSCjwG0o7YAgDAW2R5mjzRE7dnexU=; b=m4kH5kuImz2osD
	Gsb9mSy9Fam3+nKJAvhWZ6zDTP7mvTVD2Ed++tI2d1HymqzQII5tXVlno+o6xYPyEf31OzvuVuNTB
	D9Xq/wmJT6kBm5V1SX24VanfRCgI81lOo9ulx8MlYxTVDPZ6WriyKQ2cqHox2jCqienI59USMHBMP
	rtQixWLhPiUbjBnE96K/5cWndbZeK4FZW9PFuSXtEGfkDwciMLkuagvR/aiWtHttYJZstoxG8OBPP
	pO8bgG3qFxR7mJe8OF5MROkhGcWNmkYwClza3B0V8W8RSvcCt0mKrSgxyxpt02YY1CzA+CN+Wx3Qq
	I81l2N5pncNiglM1yyxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETaJ-00000002MXF-1Jys;
	Tue, 04 Jun 2024 12:48:16 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETaC-00000002MOt-3dmD
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 12:48:12 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-6c8b6e40ea6so337686a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 05:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505284; x=1718110084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gs55v193sdHVl0rBHs/P2Y++ez1UXnaq9pE10ZEsFSw=;
        b=2nDvWW00yp99ZBmS1PfA6/9wxpttVU/LDTExQ2XX66ZUU+J6jM9w8ac7fi6LcL3xg2
         7DQlRQSJyNxuYF9ZwFtKvkEE7+S9OYAfRZ+dlKP38CVBBla3y5cuAk68t80l1leqqKI6
         OBZ/9sOEt9VsXo9GhEVkXmEX8o4tgMg3eOuiSeSx7GvSx49PIC02+BrmKnj0riHCfmqo
         pKkGCTS7D85reP0uHuol7VUaTRu6DHPsCgNCyyetq74s+8OfG9rontUzKwFTU9AfSYCU
         jHYcirvTzC3ghwgdbnMto95SvEUKmlhL+FKq3bVBBniDKQ0kr0e6M+KDF2PGifzftYyK
         Vyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505284; x=1718110084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gs55v193sdHVl0rBHs/P2Y++ez1UXnaq9pE10ZEsFSw=;
        b=Ubj0t5ByMKM/EvSoIEk9Lmmr5tQ0946oOB7LmeF5bl9tM5seT5MyZHLdiC+gEmYd5H
         tZPyA8yjl1AVOnAANSDKSrVEtrCfJe+GQ9r9uVqjpH45kyQOT2/mRUIapI6+SAOvwBKJ
         Yf3lqTtS///SeXVOLHAyGA2F1ysHoWfVd+X2gX3BbVVyZ/5zRCpvkmyrSWZV673Wlk2I
         CnKP6GEhA0hOwNQkmKJkPNz/Q8Cp0PF9a1yjAhJEBuV/838wPuoJxY6FQEDgNjAIzS9J
         expRojPP9hXI1WaiwGcndpc/R2Zqn8t3x2aXrJ/mKaICWMlK6naf9J5qZ1i+odXaPK/X
         TGKw==
X-Forwarded-Encrypted: i=1; AJvYcCVNnDdJW9E8l5F1oMQyCEphkrn+VdqAhvBGJb/CKkVp6rXLSl2sVEKpS8ixYrC3LoRZXERfYlFVCMwY7oRsBF0SmaETqF7HyOT6pYxW3nD1
X-Gm-Message-State: AOJu0Yxhsqs3iEsvYlOQSNcCohBxHGegsfAhY1wauacMCdD2dqWgAxFf
	G49MoXQEbfIvcZsDsFlI5Q7H9KlVsY6AWrZJRs7gBoCm6Y6+E09doccqscix6UM=
X-Google-Smtp-Source: AGHT+IEsMZJmc0GRfwnGJXawzgQpJTLYGNhY37MgDtgsSTzGDBp6EPH/FvyBY3q5m6FyKXNVAkhfqw==
X-Received: by 2002:a05:6a21:99a6:b0:1af:a4a5:a26a with SMTP id adf61e73a8af0-1b26f0f25c3mr13691235637.1.1717505284134;
        Tue, 04 Jun 2024 05:48:04 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:48:03 -0700 (PDT)
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
Subject: [PATCH v6 10/16] RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb extensions for Guest/VM
Date: Tue,  4 Jun 2024 14:45:42 +0200
Message-ID: <20240604124550.3214710-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604124550.3214710-1-cleger@rivosinc.com>
References: <20240604124550.3214710-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054808_962164_B6908DAF 
X-CRM114-Status: UNSURE (   9.82  )
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
OgotLSAKMi40NS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
