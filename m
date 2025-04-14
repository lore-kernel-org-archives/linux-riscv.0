Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA1AC369B5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 12:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0noHhc/OCQaiMHpLTNTmFM/Pe5SyiPS8DmenrFeMjrQ=; b=xCrMXIb63AjphI
	G/MLHePHIG6aBB/eh4yiRNv+HWnf8RXqCr7qwvG7ZQOtPyIbyFpB6epd80/w5B64Bo1vBgSi/OKzO
	U6tDjEBLErIoDEkJZ1M8lcMf232My3emOg9DEkn4xeTa2mIq2/DX1GONZSjWbA9WJAM7WCEpxl0k5
	M+gUMRoJot4dcEcClWKRK/JN615iFlmMrNkgDm8WLjaSo87/QCHi1EP0p82RiWdchD/LDu7zCB3hi
	SiTwU00i+SnCX7W48+DqGGldxMxKEzOc0nIxOjZKbDsEGiKYDPDnoSaXjioQzcr56JcHRNiLwT+hw
	L1XFr/VVmhj3GD7ZSG8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J4e-00000001yGa-399M;
	Mon, 14 Apr 2025 12:38:04 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J2Z-00000001xde-28ft
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 12:35:57 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso46295665e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 05:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744634153; x=1745238953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WQmio3wqLQnFz3mNwa+nQ7W5ScqINI2CxtaTzG1u6QU=;
        b=c8XrhzqXF7iMzPGpUDYq0ZotJrugif7fNv3k9G91dG+deuHJ7a027M8z5zF90uoB4F
         UK1XK0C25cX6tkKp7jmg3ykfOBf1DhgTKMRYx3fdoa5ueXNsDicRzr2nZ/UGlZm2CwPB
         s2TgdX8VfQYWnNmIqlNAcqgl8rkLmQkNaCO/FLU8lE5RfqFeSEHkxu5uJTDUxIsJpwsF
         VS1z9VImk7iTp4s8cVKXzvxLJTfvQftRYEnw3A0raWFm1EtTmHuWAyUKyU+8D94Fx40P
         9wOsPAxRvO0fDzSeDFicG/tzyprTgQi2sjL73a2mcEgh20dZ0gDDKhYrk+Q4+/xvE1k7
         5IIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634153; x=1745238953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQmio3wqLQnFz3mNwa+nQ7W5ScqINI2CxtaTzG1u6QU=;
        b=ezG9K2gK6pqSFrHfJLYCATq7XMSNWqikeK1whD63RGCNEDAcS8DJm/kuO1CGduIjbH
         ONZamZxLdMhmXZDdlaBGD7+7zyrgv8VINJcc47hvpEbW4Glo4hxoYFG/1lYsY+uVF7vb
         6FoXe1hah4e523kXc1OXG2bSXlKKK/vOecSvWyH8VRBqifm7Ai6Wdj4VAT1i5Te8zHEs
         04S4OWBORlFiDR9xRuFoDKT+PwwERBYmDU2ZVQ4aKHBIdwWHdUfVXq5VkrvOwfj6Y9St
         nRHTnIjzjfA+aiAdTIJVkJ25MwaREKJw/2K4ojdiVwl7NJhgedRvZGTzru3yHPAW/WRG
         a8WA==
X-Forwarded-Encrypted: i=1; AJvYcCUYcMNway+ybgVzdR+GopvjVFZr5WTV2AQ5b2RyhXSJwPpnXLLqsMIssEYxeFmD7EdDgcXbcBEUfhPCkg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5PU2CTsQJCiQQXIAH9xFs7zq7zehWah7ZHXiXB67DW/QbL3O4
	oxs6S7VV4+kWevtuM4fYBZO80OyzoqmHDbBvLdx3N9gNI4+ivOTCUNZBkZRHRxM=
X-Gm-Gg: ASbGnctjKlSWUvaJPidFku7efaytIj6BrenQgwO+TV9iP6il3qPr7g8LFMmp3KSDDhB
	MFzixSSJUZog81aYYzepsHup7koc2aQtg8wX/wH815+IJm3f1QE9ki0SqXkjtzx8hRNdXiSiKqE
	LYzheKPQadtVZXhEOWx4czU6JJMxIUw9N6pHxzCxderaUSCdfb7E6AYaa1O1CE6ZHhXFm1zVWH5
	GXqa4ib8SZT5NgScCX759FxMY8dfyao3Br9jkIzM9TMyYG33LgXDbhGk40KOyJC2BHiKwve2ajg
	6gmfcERZd7agNzkNFNjjSvWsFGm/a2Qu/d64qQf1sw==
X-Google-Smtp-Source: AGHT+IFJJtwFHDUCk/X/IbkfQRGm+JIG/6RFDceYpwEU9uYCKZDnLPKJFVJZ9lYtIGA9fiFwvtiSuQ==
X-Received: by 2002:a05:600c:348a:b0:43d:aed:f7d0 with SMTP id 5b1f17b1804b1-43f3a9be478mr93613435e9.28.1744634153055;
        Mon, 14 Apr 2025 05:35:53 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9780a0sm11003166f8f.50.2025.04.14.05.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:35:52 -0700 (PDT)
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
Subject: [PATCH 0/5] riscv: misaligned: fix interruptible context and add tests
Date: Mon, 14 Apr 2025 14:34:40 +0200
Message-ID: <20250414123543.1615478-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_053555_815142_0514BB72 
X-CRM114-Status: GOOD (  11.98  )
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

VGhpcyBzZXJpZXMgZml4ZXMgbWlzYWxpZ25lZCBhY2Nlc3MgaGFuZGxpbmcgd2hlbiBpbiBub24g
aW50ZXJydXB0aWJsZQpjb250ZXh0IGJ5IHJlZW5hYmxpbmcgaW50ZXJydXB0cyB3aGVuIHBvc3Np
YmxlLiBBIHByZXZpb3VzIGNvbW1pdApjaGFuZ2VkIHJhd19jb3B5X2Zyb21fdXNlcigpIHdpdGgg
Y29weV9mcm9tX3VzZXIoKSB3aGljaCBlbmFibGVzIHBhZ2UKZmF1bHRpbmcgYW5kIHRodXMgY2Fu
IHNsZWVwLiBXaGlsZSBjb3JyZWN0LCBhIHdhcm5pbmcgaXMgbm93IHRyaWdnZXJlZApkdWUgdG8g
YmVpbmcgY2FsbGVkIGluIGFuIGludmFsaWQgY29udGV4dCAoc2xlZXBpbmcgaW4Kbm9uLWludGVy
cnVwdGlibGUpLiBUaGlzIHNlcmllcyBmaXhlcyB0aGF0IHByb2JsZW0gYnkgZmFjdG9yaXppbmcK
bWlzYWxpZ25lZCBsb2FkL3N0b3JlIGVudHJ5IGluIGEgc2luZ2xlIGZ1bmN0aW9uIHRoYW4gcmVl
bmFibGVzCmludGVycnVwdCBpZiB0aGUgaW50ZXJydXB0ZWQgY29udGV4dCBoYWQgaW50ZXJydXB0
cyBlbmFibGVkLgpJbiBvcmRlciBmb3IgbWlzYWxpZ25lZCBoYW5kbGluZyBwcm9ibGVtcyB0byBi
ZSBjYXVnaHQgc29vbmVyLCBhZGQgYQprc2VsZnRlc3QgZm9yIGFsbCB0aGUgY3VycmVudGx5IHN1
cHBvcnRlZCBpbnN0cnVjdGlvbnMgLgoKTm90ZTogdGhlc2UgY29tbWl0cyB3ZXJlIGFjdHVhbGx5
IHBhcnQgb2YgYW5vdGhlciBsYXJnZXIgc2VyaWVzIGZvcgptaXNhbGlnbmVkIHJlcXVlc3QgZGVs
ZWdhdGlvbiBidXQgd2FzIHNwbGl0IHNpbmNlIGl0IGlzbid0IGRpcmVjdGx5CnJlcXVpcmVkLgoK
CkNsw6ltZW50IEzDqWdlciAoNSk6CiAgcmlzY3Y6IG1pc2FsaWduZWQ6IGZhY3Rvcml6ZSB0cmFw
IGhhbmRsaW5nCiAgcmlzY3Y6IG1pc2FsaWduZWQ6IGVuYWJsZSBJUlFzIHdoaWxlIGhhbmRsaW5n
IG1pc2FsaWduZWQgYWNjZXNzZXMKICByaXNjdjogbWlzYWxpZ25lZDogdXNlIGdldF91c2VyKCkg
aW5zdGVhZCBvZiBfX2dldF91c2VyKCkKICBEb2N1bWVudGF0aW9uL3N5c2N0bDogYWRkIHJpc2N2
IHRvIHVuYWxpZ25lZC10cmFwIHN1cHBvcnRlZCBhcmNocwogIHNlbGZ0ZXN0czogcmlzY3Y6IGFk
ZCBtaXNhbGlnbmVkIGFjY2VzcyB0ZXN0aW5nCgogRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9z
eXNjdGwva2VybmVsLnJzdCAgIHwgICA0ICstCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jICAg
ICAgICAgICAgICAgICAgICAgfCAgNTcgKystLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlz
YWxpZ25lZC5jICAgICAgICAgIHwgICAyICstCiAuLi4vc2VsZnRlc3RzL3Jpc2N2L21pc2FsaWdu
ZWQvLmdpdGlnbm9yZSAgICAgfCAgIDEgKwogLi4uL3NlbGZ0ZXN0cy9yaXNjdi9taXNhbGlnbmVk
L01ha2VmaWxlICAgICAgIHwgIDEyICsKIC4uLi9zZWxmdGVzdHMvcmlzY3YvbWlzYWxpZ25lZC9j
b21tb24uUyAgICAgICB8ICAzMyArKysKIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9taXNh
bGlnbmVkL2ZwdS5TICB8IDE4MCArKysrKysrKysrKysrCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9yaXNjdi9taXNhbGlnbmVkL2dwLlMgfCAxMDMgKysrKysrKwogLi4uL3NlbGZ0ZXN0cy9yaXNj
di9taXNhbGlnbmVkL21pc2FsaWduZWQuYyAgIHwgMjU0ICsrKysrKysrKysrKysrKysrKwogOSBm
aWxlcyBjaGFuZ2VkLCA2MTQgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pCiBjcmVhdGUg
bW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvbWlzYWxpZ25lZC8uZ2l0
aWdub3JlCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3Yv
bWlzYWxpZ25lZC9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL3Jpc2N2L21pc2FsaWduZWQvY29tbW9uLlMKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9taXNhbGlnbmVkL2ZwdS5TCiBjcmVhdGUgbW9kZSAx
MDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvbWlzYWxpZ25lZC9ncC5TCiBjcmVh
dGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvbWlzYWxpZ25lZC9t
aXNhbGlnbmVkLmMKCi0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
