Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667D8C369B9
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 12:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=540YEaLIxSSB1/LXJDV8bcLbwj03guhRcC8B3oNslbM=; b=vIIBDPheJYrhyT
	3Zy09OaglD+e9VzD1WWS/W0RR65en6foE02lxFBSlMLAyyzoz/QzI4oOTdh+BCbcU96R6aCDnYKQ4
	i5cmn6w7MiJuY5o8B7Odr/L67FhJtsv+60woNz5iEdC1oqUEXTFgy/VJr9IKVWsFPjDC/xMEkwT/R
	YrIope46P7TwNoyuw83zDIjUqVnAxkH23ocsuP6UFzrsap1B7UeCGZXX9wnuE6KWL+XNHcem47wyZ
	GA7T/d+HCYJGDdLdaYZlvXC+QkX1Ac9CwFzAkeFT1hTrPWjhLwOekQvJjl5ZiHnAVdEiqr/ieIRgz
	CUe7A4f8e/ZjPsvNjtsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J4g-00000001yIP-3WM1;
	Mon, 14 Apr 2025 12:38:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J2c-00000001xeW-13p8
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 12:35:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so26798835e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 05:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744634157; x=1745238957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlJaR0rGQ7lkkTNY4tt/hV6uETrC0h2zoS/Msh9pgDk=;
        b=pzh22wPkgbvU4ng6T1V2KTtFC0e+aMbpc8/QMrm+q22japPJuEG2DNiyE/W5b+9EH4
         uDGQZnqq71X6ejVBJs3GAMOrgdv1xKhxqOeSjpY04vo/2G6JKBAi7dverE7lnmV2qZe0
         z12s5bhyVv3txuLu319WgagGIWoyQ7d2tNeY0I5a5mG//qeAryZfz6mSLvxvTVeFf3+h
         qegpHMN1YEv41yEqv0aKClt9WnA+h9oRTpzF+tgSv3llyVcCggx5eerGEuDrwFrqvq06
         KuFsUO0lEFB0rAArAY8HxliZP1wHezeqNG/AlAUJLrI/17dBmcNjibgoaNJ/bOZSZbbL
         vPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634157; x=1745238957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlJaR0rGQ7lkkTNY4tt/hV6uETrC0h2zoS/Msh9pgDk=;
        b=VPnYhJ257NpnnC5ep38CUfQatEQSXNKIwIf+uf0lUFQofz+1ZtdBgIp5es8e/9LMns
         NV3zSrTYN+nmZQ5pmNIT5GRFEsOgq/OP+ToNuLJS0LSZs+nUpotazsr/kE27uHWD5/NZ
         Avq3vT19dFDHbyKSwinn7DEF0SmP4sppkeUsCOgmZjDNmSRvP0caY/YRajS/NJfR2YQq
         YkKmgb1PEfrJcZos8BTJnMb08kqBAcZvOywhhnmgmveihjar8Hw7dL0pt37Z5iX0DEPf
         YZpOaZMQw47nhOH1Q1ScF7mDaDepFiTUfJd2jeHpCtxSInmnW2DxUV7VUUieLszUqtrx
         KhIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwPB1so5PYKXjV+2D/UjmNXgxNc+J0MRDPBUHYqFR7xacgCF43nJGJ7H1nFT3qu90NKIuFIdUO2uoCDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzilJLdXZGhqGUk6L7IH/5jFEEaBS+FrBHon4eBRmpVXZCML17b
	hFCK9zjThbQPaGfOSmrwXR76tXe9BT/H4eo5Wz8VSjaB7qi5Z+CCxUwlnu9kfkY=
X-Gm-Gg: ASbGncv03fSQCqknoIyXgPxnN191WbdX3dHjIpnD7vU5N5DVlC5OwHoUCjdJdgDP54V
	xkvE7MFxN2MUlQ4PM7/HnpQhpRj49//HOhKHDQdAPItaM74XaS5W046XCQMcURbHJ/MnDwo6G5A
	wH3UZrmEw6MhuarFKu3OEDR/oGV71gMCsdLSXrAnfTQeKzlrfBDYbQGvqAt7G1pdVmX1Bhs/BdD
	cV9H4j/sjAxZ1cQ/n/ygmbFLld9e1xKNyKeE1h3o+ndcaBm8VPYjdCrLeeduYoqywGJ76ymu4Cf
	PYXpWMF084iSsfbbXyPYeea5cvZ4JMl91BZHeDyP7Q==
X-Google-Smtp-Source: AGHT+IHgz33xrXrH2J/Kburuf5TLKxLzowtKebRllfEO38l1vRVBBETy1O1EuzOqnIGPlOtR1iyBng==
X-Received: by 2002:a05:600c:450a:b0:43b:ca8c:fca3 with SMTP id 5b1f17b1804b1-43f396e001dmr101919085e9.11.1744634156654;
        Mon, 14 Apr 2025 05:35:56 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9780a0sm11003166f8f.50.2025.04.14.05.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:35:55 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 3/5] riscv: misaligned: use get_user() instead of __get_user()
Date: Mon, 14 Apr 2025 14:34:43 +0200
Message-ID: <20250414123543.1615478-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414123543.1615478-1-cleger@rivosinc.com>
References: <20250414123543.1615478-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_053558_288884_0341E672 
X-CRM114-Status: GOOD (  11.43  )
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

Tm93IHRoYXQgd2UgY2FuIHNhZmVseSBoYW5kbGUgdXNlciBtZW1vcnkgYWNjZXNzZXMgd2hpbGUg
aW4gdGhlCm1pc2FsaWduZWQgYWNjZXNzIGhhbmRsZXJzLCB1c2UgZ2V0X3VzZXIoKSBpbnN0ZWFk
IG9mIF9fZ2V0X3VzZXIoKSB0bwpoYXZlIHVzZXIgbWVtb3J5IGFjY2VzcyBjaGVja3MuCgpTaWdu
ZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxp
Z25lZC5jCmluZGV4IDQzNTRjODdjMDM3Ni4uOTdjNjc0ZDdkMzRmIDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHNfbWlzYWxpZ25lZC5jCkBAIC0yNjgsNyArMjY4LDcgQEAgc3RhdGljIHVuc2lnbmVkIGxv
bmcgZ2V0X2YzMl9ycyh1bnNpZ25lZCBsb25nIGluc24sIHU4IGZwX3JlZ19vZmZzZXQsCiAJaW50
IF9fcmV0OwkJCQkJXAogCQkJCQkJCVwKIAlpZiAodXNlcl9tb2RlKHJlZ3MpKSB7CQkJCVwKLQkJ
X19yZXQgPSBfX2dldF91c2VyKGluc24sICh0eXBlIF9fdXNlciAqKSBpbnNuX2FkZHIpOyBcCisJ
CV9fcmV0ID0gZ2V0X3VzZXIoaW5zbiwgKHR5cGUgX191c2VyICopIGluc25fYWRkcik7IFwKIAl9
IGVsc2UgewkJCQkJXAogCQlpbnNuID0gKih0eXBlICopaW5zbl9hZGRyOwkJXAogCQlfX3JldCA9
IDA7CQkJCVwKLS0gCjIuNDkuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
