Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B0DCDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2x2Ex1wghKIgebGee6wRot9O4J2HLPg1ZIArd8pvrVY=; b=ge+EBFsBxEdbh+
	mYpsdMmum2Sf93bbAtbQfQnHtNuswzxAYQBPjUp005DVMfqcfFRac6GdSWJWrALOEMm8VNTcY8OOn
	4othBcDL9vlqtCuIA6jA8ddMdc4TidPeIn+HfOqCzMUwR3ZTmQuN2fqXE9ac72T8uLKUZDE+rNp1j
	CEc5rne4w1lL/MFLNfBm/9OtnxW6wK1+kC+qdhjmNmjDF/6Hivlk+2bq11kzAMLF2BHT5nEg5Ibb0
	wlPz7h89pgX916HaoX9u5XsSe/HYp3qrd/Gwd0ZLE5vJdgVMtDmJFtcoe2QzITA8ZNvT61+HWSv2g
	uq/KT1KDLGVDHCtmPZtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvT-00CNWO-1d;
	Tue, 17 Oct 2023 13:15:59 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvC-00CN9A-2o
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:15:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4053e6e8ca7so18306355e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548541; x=1698153341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HAW94BWBN5i9ceq6FqY8wdNnvu4aG0cSFSkPmGNLOw=;
        b=u8QHh+i0xwlb5sJEgbQzIbWr7AUp4jZhLhTCsyt0MTIyibQK0dx70sSK9heoB0lghD
         54zXtkzjMu0Qf7LbjZ3BCBUCMDHd4cmjh3RABO9GUfjVPC1aDXA8OoUoiaudRveM9EZ0
         LgphFEfsgTwbhJal8pgKNhWwhT0NLUm2m2oozQ6hJKkSHCH/ykCWM3iKuF9GWTh7D7d6
         +XjBejGkW9GsZL0UlDWW+ylLnsyQi9KtRVeY+RbsgP5FIeEmE0IX8b3cKbFlnMpjCu9U
         gDv6Szx19HlQS633cAuNVK8uqI5Ddl0Hud2NjJ/lapFY53dmKPMdWNndHiJ0WXiw+x2m
         JMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548541; x=1698153341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HAW94BWBN5i9ceq6FqY8wdNnvu4aG0cSFSkPmGNLOw=;
        b=wWPJ3cRDX5STnOs+gAqaZqgF9HyZuC9cDNb2vP17ZI+oFDjDpqlsjp4BEhcpvajnUY
         9qE672bindrXtb1Rgi2jqr8Q2q4WJ7i/vJWxHs3gw8YV/BuE3biT6oZoXtN8tqOy++pI
         HggU1B+Pog4g+Sujiqzsq8ZwqDGuKD+EaAN74T2Vz2XJKr9brD7aWfcyu/enlNJ6hVYC
         yceXsQ0vq0/5aGFy40PLpobdjxmuihffRlIexI0o5ZxLkMHEnJo/ke7qrmWXLuBo0EYu
         ClD8craN1PV5Wk2FLIAK/8ElzGo3i/wJcfXS8IWWNOIV1oVMfKn7jeyJiMx7BPRLRxLB
         0gBg==
X-Gm-Message-State: AOJu0YxgOYMGFv5jRdpPp9uIZ3hh5ZBg+Es+Ub0/xZ+R5GNALpxx12UX
	fXITXj3xmvtBI3mKON7uzDjOmRc8a/TIQ0S9fS/LaA==
X-Google-Smtp-Source: AGHT+IGbBB2bpP6DKx5jv6ntXm18AdT9vWp/ruxSD4Q9u2qImyTRJFK6ZXveoHMW47E7zhir096qKw==
X-Received: by 2002:a05:600c:2145:b0:406:513d:738f with SMTP id v5-20020a05600c214500b00406513d738fmr1640603wml.2.1697548540446;
        Tue, 17 Oct 2023 06:15:40 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:40 -0700 (PDT)
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
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v2 14/19] riscv: add ISA extension parsing for Zvfh[min]
Date: Tue, 17 Oct 2023 15:14:51 +0200
Message-ID: <20231017131456.2053396-15-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061542_955622_6B461C83 
X-CRM114-Status: UNSURE (   8.99  )
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

QWRkIHBhcnNpbmcgZm9yIFp2ZmhbbWluXSBJU0EgZXh0ZW5zaW9uWzFdIHdoaWNoIHdlcmUgcmF0
aWZpZWQgaW4KanVuZSAyMDIzIGFyb3VuZCBjb21taXQgZTJjY2QwNTQ4ZDZjICgiUmVtb3ZlIGRy
YWZ0IHdhcm5pbmdzIGZyb20KWnZmaFttaW5dIikgaW4gcmlzY3Ytdi1zcGVjWzJdLgoKTGluazog
aHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xX1l0NjBIR0FmMXIxaHg3Sm5zSXB0dzBz
cWtCZDlCUTgvdmlldyBbMV0KTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LXYt
c3BlYy9jb21taXRzL2UyY2NkMDU0OGQ2YyBbMl0KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOp
Z2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdj
YXAuaCB8IDIgKysKIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDIgKysKIDIgZmls
ZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCmluZGV4IGE5
YWVhNjJiNmM2Zi4uZDlmYjc4MmYxOThkIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2h3Y2FwLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCkBAIC04Miw2
ICs4Miw4IEBACiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkZICQk2NAogI2RlZmluZSBSSVNDVl9J
U0FfRVhUX1pGSE1JTgkJNjUKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUhJTlROVEwJCTY2Cisj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZGSAkJNjcKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkZI
TUlOCQk2OAogCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfTUFYCQkxMjgKIApkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jCmluZGV4IDBhNzRiMmNkY2FjZi4uYzcwODg1ZjUwMTRiIDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jCkBAIC0yNjYsNiArMjY2LDggQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0
YSByaXNjdl9pc2FfZXh0W10gPSB7CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemtzaCwgUklTQ1Zf
SVNBX0VYVF9aS1NIKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmJiLCBSSVNDVl9JU0FfRVhU
X1pWQkIpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2YmMsIFJJU0NWX0lTQV9FWFRfWlZCQyks
CisJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZmaCwgUklTQ1ZfSVNBX0VYVF9aVkZIKSwKKwlfX1JJ
U0NWX0lTQV9FWFRfREFUQSh6dmZobWluLCBSSVNDVl9JU0FfRVhUX1pWRkhNSU4pLAogCV9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHp2a2IsIFJJU0NWX0lTQV9FWFRfWlZLQiksCiAJX19SSVNDVl9JU0Ff
RVhUX0RBVEEoenZrZywgUklTQ1ZfSVNBX0VYVF9aVktHKSwKIAlfX1JJU0NWX0lTQV9FWFRfQlVO
RExFKHp2a24sIHJpc2N2X3p2a25fYnVuZGxlZF9leHRzKSwKLS0gCjIuNDIuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
