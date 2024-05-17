Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A47C25B79
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 14:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XA0p4549+6tK8TdwpDimZo4VgU7fttwadWVpjZ4BXrI=; b=kICALJgbRG04uq
	Qrc6RvXUbh6ZaT6D06ObfuUoFG2sUJng23JkmEn489mz3gwRJ9ilSX9n1BZ7elZZNLo4GKbHvgS6F
	junxDFkWYjPGvalO/UVKtN7JZgzCYIqwdr4DJyMdr+RCN+5lsF5VPoo2qfLtfLnsLPuBW1tZmCzcN
	xq39R/aYsA123x8bdrEUNRy3tpBEiGFsqAk3nms/oHz5mxRuMKBAKoc0BWQYgmFMVu33cg4uirBAw
	XUVsV6p/IQuuYDw72WyA2uzPATIqdawJoVAAIjrdWjA33AzK1Mf9rZCgtlrjT1tBtp5+ktSVcYUaZ
	x7LX8LtZX/+ghGLmDueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yyD-000000088jX-0PW5;
	Fri, 17 May 2024 14:54:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxj-000000088Bd-3kbj
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 14:53:39 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-420197fba0eso337765e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 07:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957609; x=1716562409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hr5In3BbQWy4/7yql16kLnv72/rLlL/nlq3+ywvvEUQ=;
        b=s/2NeY3QSsGPW2A0ojWHrMD1+yboUW1z1PDmXiwN30cNplBe1971bxTzWVAZ8qB0Jm
         OW/1KH3slThDe1LS2l/zAqLkypsCZcfAjTBLBEeWAbjpv3GL7PUfbMj4TpvC7kqLO4Ym
         dtnDj+BlxTg+uCbKzPRaj712X1OhmSr+a2LE34RjZFxYg9cgUPFcg/YFpcDkeMbNAv31
         fubZwo3qAIksNNtuSBRhAXIAGqRG0ODdV4V89ABPGGwxRZBKbkpmZj2l+zlHaFIqq3AZ
         YDm5c7czKvn1FeJAE6MKalSJx1dcTCzkTWM3ptvfmel2N+qjnlBIR4kXr1ywoB4J7+uq
         iooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957609; x=1716562409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hr5In3BbQWy4/7yql16kLnv72/rLlL/nlq3+ywvvEUQ=;
        b=uYG+BBCs/s5bVTWLK1job5+q8DQNEyAe/ihsVJlkM9BMIdXJSmweV0iIjdm9D8cxIj
         m0xoogKZNwXd1tV+M4ACh+9TeLW1FnooVLYR5ZBWgA67M7Y9a5QIuue8HIG1euqdDXDy
         NyFrfABTcviyXS3C4mWuNDqsJwS1EZF+ToAPrzJ4IvKYF2Fk0c4XszTKmlMVth8R0UTT
         CHLPx4GbCejfN6tQeg80IlrTG5DF/OX558y+GI6kjgU2IkjS6pG4TukW/G5E8ltGgHIU
         oCsKefOrltXeS/NwrMKrFa++a7hW3Yuclo1CJNHZAMrnD65QrZYzsxiPuMtkUs5U/FSq
         2vwg==
X-Forwarded-Encrypted: i=1; AJvYcCXaqxJ3qds4FKHTpcyx3JXRUnxwnFdBGNsZqShGnGS7O28hKJ2Jb1+OMZtQ2peQy5JeJJg3ZrPR74z542h3wFgYKAVtzpRwxyi2WwSpPqBs
X-Gm-Message-State: AOJu0YyoLhIClgKNSgibXoTQ8PGBFR+QB3poJqUeQafrRKey7JdHWrwn
	RewVmM7iRWGEMXi/yuoxC/w5KwtNmaCp9Btfitthy4rOlPguXOEJrDNLTx5FEjw=
X-Google-Smtp-Source: AGHT+IHFAZadiSe4TflYND6qRyaBCUiWEXnVUWl1b2pNoUSKbbMUpWrFBDbKvnZCinPKChpNIsrosw==
X-Received: by 2002:a05:600c:1d0a:b0:41b:e58c:e007 with SMTP id 5b1f17b1804b1-41fead7a643mr161943585e9.4.1715957609019;
        Fri, 17 May 2024 07:53:29 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:28 -0700 (PDT)
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
Subject: [PATCH v5 10/16] RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb extensions for Guest/VM
Date: Fri, 17 May 2024 16:52:50 +0200
Message-ID: <20240517145302.971019-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_075336_143336_FC1DE91E 
X-CRM114-Status: UNSURE (   9.13  )
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
dm0uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAppbmRleCAzNWExMmFhMTk1
M2UuLjU3ZGIzZmVhNjc5ZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2t2bS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaApAQCAtMTY4LDYg
KzE2OCwxMCBAQCBlbnVtIEtWTV9SSVNDVl9JU0FfRVhUX0lEIHsKIAlLVk1fUklTQ1ZfSVNBX0VY
VF9aVFNPLAogCUtWTV9SSVNDVl9JU0FfRVhUX1pBQ0FTLAogCUtWTV9SSVNDVl9JU0FfRVhUX1pJ
TU9QLAorCUtWTV9SSVNDVl9JU0FfRVhUX1pDQSwKKwlLVk1fUklTQ1ZfSVNBX0VYVF9aQ0IsCisJ
S1ZNX1JJU0NWX0lTQV9FWFRfWkNELAorCUtWTV9SSVNDVl9JU0FfRVhUX1pDRiwKIAlLVk1fUklT
Q1ZfSVNBX0VYVF9NQVgsCiB9OwogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29u
ZXJlZy5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwppbmRleCBjNmVlNzYzNDIyZjIu
LjdkNDdmYzkxMGJkOSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwor
KysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCkBAIC00OCw2ICs0OCwxMCBAQCBzdGF0
aWMgY29uc3QgdW5zaWduZWQgbG9uZyBrdm1faXNhX2V4dF9hcnJbXSA9IHsKIAlLVk1fSVNBX0VY
VF9BUlIoWkJLQyksCiAJS1ZNX0lTQV9FWFRfQVJSKFpCS1gpLAogCUtWTV9JU0FfRVhUX0FSUiha
QlMpLAorCUtWTV9JU0FfRVhUX0FSUihaQ0EpLAorCUtWTV9JU0FfRVhUX0FSUihaQ0IpLAorCUtW
TV9JU0FfRVhUX0FSUihaQ0QpLAorCUtWTV9JU0FfRVhUX0FSUihaQ0YpLAogCUtWTV9JU0FfRVhU
X0FSUihaRkEpLAogCUtWTV9JU0FfRVhUX0FSUihaRkgpLAogCUtWTV9JU0FfRVhUX0FSUihaRkhN
SU4pLApAQCAtMTI4LDYgKzEzMiwxMCBAQCBzdGF0aWMgYm9vbCBrdm1fcmlzY3ZfdmNwdV9pc2Ff
ZGlzYWJsZV9hbGxvd2VkKHVuc2lnbmVkIGxvbmcgZXh0KQogCWNhc2UgS1ZNX1JJU0NWX0lTQV9F
WFRfWkJLQzoKIAljYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pCS1g6CiAJY2FzZSBLVk1fUklTQ1Zf
SVNBX0VYVF9aQlM6CisJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0E6CisJY2FzZSBLVk1fUklT
Q1ZfSVNBX0VYVF9aQ0I6CisJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0Q6CisJY2FzZSBLVk1f
UklTQ1ZfSVNBX0VYVF9aQ0Y6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aRkE6CiAJY2FzZSBL
Vk1fUklTQ1ZfSVNBX0VYVF9aRkg6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aRkhNSU46Ci0t
IAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
