Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F60C54754
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 08:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/mMTjrD4MxSwZoBpddAqxH0WQy8oAlH4oYaDYijlHs=; b=SxAQP0zRDD0wU4
	+NwJzs2Iyob7x3Uj3bqOUT6TYkoZPnZC9SIQuSseJKFrXSyg5TXNqgLg8mA/gwBdq8YCmFuM36gXS
	IIZXhcLeRqf8Tn5X0QdlMqQE0lTdHj9f8I7Re3vX45GDMS5Aw6Qz4cAhs1zgsK837PB2dif91RxTZ
	H4S9y5XPnTvDlHC9lT+MESbSDUee/OPtHH//PWJXDxRZoTx6OyhzZUf4YQKrFPKE8x1OAGp7GfftG
	FQKViT5PJ5gWkc50HyfAx7o5Onrfot5NJ1j8SOUzFv0lYpFfCsPIVk7Zawci1kilhFlzTq2A6ZjrC
	iqezhqVZgdCIyMNd5ZfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTyE-0000000HXl0-18v0;
	Thu, 15 May 2025 08:29:38 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTsd-0000000HVim-3yra
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:23:53 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so6982165e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 01:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297430; x=1747902230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKzeirrOKR4aa1/jaJ0+BQzqdgTSTiQsfjIovf/XYis=;
        b=V+3BImXCxk3DQMR70EuSpcxolcNFLr2n7DUlkMEPUk8RqZjcSYxl0kK7I3Ffkb434n
         3yYzRXc0LbhpAIdm7cgPSipbZ1rNXuDMgxnexsT6RD6lhKAznC/iK+sBDoNX0fQYpQV1
         +BFDFSMiFYZ5xuGk7NNZ8GjIZ7oV5E+UwEaCZ/CPljjYEp2VpUV4J9PDe4wmQgDFbO3w
         cstv1o/22l9Kc3j+ljL2VIP9L2m2r1Zx4Zs9kgO26uvzbsliDt7CPT14+xvABLWukO8+
         L9d291adt+/dawO3kOyysTMnf6ZWWNhdDC+r9a4E5RhfiQplBVSFJeo+vIREIdvIE8BA
         2KiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297431; x=1747902231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKzeirrOKR4aa1/jaJ0+BQzqdgTSTiQsfjIovf/XYis=;
        b=PrACIEX++0gd8XLzeAk8P9yu46jjCFiUZkl8KSoIM8JZUvH1ZyAz5tDgP/gXAKfAHk
         FT5qh5K1KX8hbRsg7G838FF4iRYlS/DnW9q+62zKgAGWJYa7fqv6+aRYZ9zaY4C9IrDe
         QUODbZ3pGLlktk4HnRPWl1902AIi+SGGLznKza6i54RfbmZ64yaGfczvAkwz+6FJJGug
         +zFHk3yWZT3yqb+fzWJkRXPaEtSI/q1vs6tYAUPY39vKy+ubs4XvcILljkAbW9Qmjfy5
         Wujt7GNsjfr5Aq8IuRisPTX7LQsBoL6ZF8FRUwjZ0H8mikRHEsKcfinC3Ik5JX0gAefk
         Fcvg==
X-Forwarded-Encrypted: i=1; AJvYcCVG/sEwKZE1oD4wgOwRiGV8s738R6JvFGdZBkOJ8Q6sJkhK+lUdSv/UlgbXFhW/8e0qyaAXpYUlzaL8+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfcx2PMonVPPXN51FG8s+T+vZh86XJ7sTgVW+mw7KIgohZKuEh
	Upv5zPo19+u/LR1GB8VSg71dXwgLEoTZc07dTDEH4Hvs/qU8HWn/G4hYm14aZ38=
X-Gm-Gg: ASbGncvaaVjV/KcWAf/XCYyi7dWJZ3MEqbaeiCuGOdpoCxZnAJuqM7ULa1qCRbGOHQ0
	ORM+GT3pot7b8vpSpLpV0ku9kIzdbkc/n7k8O8GoecC0FXs9f2x+CUNU6C6xiPZU6uovGOreAIt
	c1rjHA0uNsnRdqh7eRZXaA+7KT4dQMqoF4CHrRuUgUOm11AjMuKy1A6wMCk1SJYoIjlnlrA604m
	v2TIqmPALg11qxFmp/AdtBdAiRviibcmtdHUxZsc8XtS8zQXzoW5jYw4/vURznd+WCBPWWY2fux
	xzYR8MACC+IKHvs0o6O1UZby8IIdMHjTO6S5o76ZGvQ/TG1MmOI=
X-Google-Smtp-Source: AGHT+IHo18Wz0xfwowIAkjj7FGe8ulZGDuitOfmnOSRcK7rM7RV/Qat3DxuhXQ8uvVsICI2vUu48rQ==
X-Received: by 2002:a05:600c:8411:b0:442:faa3:fadb with SMTP id 5b1f17b1804b1-442faa3fbb1mr9904825e9.2.1747297430595;
        Thu, 15 May 2025 01:23:50 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:49 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v7 05/14] riscv: sbi: add SBI FWFT extension calls
Date: Thu, 15 May 2025 10:22:06 +0200
Message-ID: <20250515082217.433227-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012352_001185_D4B69707 
X-CRM114-Status: GOOD (  13.34  )
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

QWRkIEZXRlQgZXh0ZW5zaW9uIGNhbGxzLiBUaGlzIHdpbGwgYmUgcmF0aWZpZWQgaW4gU0JJIFYz
LjAgaGVuY2UsIGl0IGlzCnByb3ZpZGVkIGFzIGEgc2VwYXJhdGUgY29tbWl0IHRoYXQgY2FuIGJl
IGxlZnQgb3V0IGlmIG5lZWRlZC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xl
Z2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRh
bmFtaWNyby5jb20+ClJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNv
bT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyB8IDIwICsrKysrKysrKysrKysrKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMK
aW5kZXggODE4ZWZhZmRjOGU5Li41MzgzNmE5MjM1ZTMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3NiaS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCkBAIC0yOTksNiArMjk5
LDggQEAgc3RhdGljIGludCBfX3NiaV9yZmVuY2VfdjAyKGludCBmaWQsIGNvbnN0IHN0cnVjdCBj
cHVtYXNrICpjcHVfbWFzaywKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGJvb2wgc2JpX2Z3ZnRf
c3VwcG9ydGVkOworCiBzdHJ1Y3QgZndmdF9zZXRfcmVxIHsKIAl1MzIgZmVhdHVyZTsKIAl1bnNp
Z25lZCBsb25nIHZhbHVlOwpAQCAtMzI2LDcgKzMyOCwxNSBAQCBzdGF0aWMgdm9pZCBjcHVfc2Jp
X2Z3ZnRfc2V0KHZvaWQgKmFyZykKICAqLwogaW50IHNiaV9md2Z0X3NldCh1MzIgZmVhdHVyZSwg
dW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9uZyBmbGFncykKIHsKLQlyZXR1cm4gLUVP
UE5PVFNVUFA7CisJc3RydWN0IHNiaXJldCByZXQ7CisKKwlpZiAoIXNiaV9md2Z0X3N1cHBvcnRl
ZCkKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCisJcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfRldG
VCwgU0JJX0VYVF9GV0ZUX1NFVCwKKwkJCWZlYXR1cmUsIHZhbHVlLCBmbGFncywgMCwgMCwgMCk7
CisKKwlyZXR1cm4gc2JpX2Vycl9tYXBfbGludXhfZXJybm8ocmV0LmVycm9yKTsKIH0KIAogLyoq
CkBAIC0zNDgsNiArMzU4LDkgQEAgaW50IHNiaV9md2Z0X3NldF9jcHVtYXNrKGNvbnN0IGNwdW1h
c2tfdCAqbWFzaywgdTMyIGZlYXR1cmUsCiAJCS5lcnJvciA9IEFUT01JQ19JTklUKDApLAogCX07
CiAKKwlpZiAoIXNiaV9md2Z0X3N1cHBvcnRlZCkKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCiAJ
aWYgKGZlYXR1cmUgJiBTQklfRldGVF9HTE9CQUxfRkVBVFVSRV9CSVQpCiAJCXJldHVybiAtRUlO
VkFMOwogCkBAIC02NzksNiArNjkyLDExIEBAIHZvaWQgX19pbml0IHNiaV9pbml0KHZvaWQpCiAJ
CQlwcl9pbmZvKCJTQkkgREJDTiBleHRlbnNpb24gZGV0ZWN0ZWRcbiIpOwogCQkJc2JpX2RlYnVn
X2NvbnNvbGVfYXZhaWxhYmxlID0gdHJ1ZTsKIAkJfQorCQlpZiAoc2JpX3NwZWNfdmVyc2lvbiA+
PSBzYmlfbWtfdmVyc2lvbigzLCAwKSAmJgorCQkgICAgc2JpX3Byb2JlX2V4dGVuc2lvbihTQklf
RVhUX0ZXRlQpKSB7CisJCQlwcl9pbmZvKCJTQkkgRldGVCBleHRlbnNpb24gZGV0ZWN0ZWRcbiIp
OworCQkJc2JpX2Z3ZnRfc3VwcG9ydGVkID0gdHJ1ZTsKKwkJfQogCX0gZWxzZSB7CiAJCV9fc2Jp
X3NldF90aW1lciA9IF9fc2JpX3NldF90aW1lcl92MDE7CiAJCV9fc2JpX3NlbmRfaXBpCT0gX19z
Ymlfc2VuZF9pcGlfdjAxOwotLSAKMi40OS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
