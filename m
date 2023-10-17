Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2410ACDB482
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FSejIIPcRj7qSE5eRkbE5vv0RCaosw9M7qFkr3ukz4=; b=47dKvcSUTEvvDo
	yPE5k+1CP787RhCPP0PslLKfQDrl3WQkZlrpTvwhNUjaHqyk4qxctRQH+Zj7jVeeJuRQ4atT8dBHg
	CEQbDFEp1+s3c0F5wfTD6SEdJxXfPlfnnGiMidsAgf89TH1f3PqkDWYt1RSZqarwUU6QoQuAP5Uho
	uAle9om7tbOmniSYGJ4q9LeMywGj1IJ3d9EtAFQdfqvNyjOayRA0BZI1D2WTnD/EjWBgQN+ds0+x+
	xFrJMFMR3lMNTvFny37MayeOEoFgrYg6w5hLHnODEwA9GVzj81Dx5Hi0t3+3M2y8w+evIKs/0OAxj
	LQn0EzHTjNTyhuSYYgxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvK-00CNJp-0a;
	Tue, 17 Oct 2023 13:15:50 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjv9-00CN5f-2u
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:15:42 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c504a51a18so12430561fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548538; x=1698153338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XveLx1BmE1GvU06WU0o1GpTCvis6fOoE2R2208YLJcc=;
        b=wDadfKfLZhUNR1JsY4WKUwcaU2XD+0WAj6MC0KUQzAs9IzDLtcs9VricTvm093dvdY
         gLd+8Myktlu30QjjGOn6+3xMbvv0UMvf6Ej68DLAYKP9XIQBsxmE2stBjKMmDVGiefh0
         1qwCamOnUQHvtdWKEnx5mWjb9PcfiZNcTN+rKs01Wf7GGfXjtC79OlpoxSY5U2Izn1jV
         LKbI1LA9lmgMdTxPTCRY+tbi+2touWSDUfBrXVOFQlyOwuNeAXBMyvoLQdk8s+Bz/rZx
         P4GzGK61E9e1qpLaVNHE3SkSRmQvS42HAM0MViRQkZ4spQA22WoI8OuFOa7JnoksBQWs
         U6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548538; x=1698153338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XveLx1BmE1GvU06WU0o1GpTCvis6fOoE2R2208YLJcc=;
        b=PCLqJDBLawXJmvJ56rP70Xue6wGfte53Tu+oJCKUBmMNT00anLn+d5GAEHD9e7Km1F
         TqaTovQYZ7sMawhQOxilKarCDuXhRiLqfMOCinFkHgIgzQpUEetczRdqzgUqB2ZIUGD6
         OToT3Cdx6DXRukUuDCQqRuoiecnKV0quvdS4omD8I+ygcOVoUAfyn2+CUAymZLKTiSwL
         XCqWP74biypzIY4jEvTCU6T2KYgr0pTiIwFCXyuMzZ/FbdFowLL966EDEtpbsh2RnbMu
         eVmNPYNSHotqNQohlDdl5r3cxfPhQ4u38mDD1DkAicTbXqR7oDk/2YQ95lIi3KA8a0jg
         6yrQ==
X-Gm-Message-State: AOJu0YypB9v+4QFDFI62OKU1x+joIVtbMhYSBJBhC5wY5iXJrMrLSHHZ
	lsJW7kaONpdHUMEFRatcLQMtyeTGu2t3bdDGVuuIxQ==
X-Google-Smtp-Source: AGHT+IF7LXN/FgZqOq/N2FVm/bEsUOoHif69CbGwt+OOKA9MLmQwAsroiCAxGTIPT5U1tiT7cTKbGw==
X-Received: by 2002:a2e:9b49:0:b0:2c0:1959:fe59 with SMTP id o9-20020a2e9b49000000b002c01959fe59mr1644747ljj.3.1697548537405;
        Tue, 17 Oct 2023 06:15:37 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:37 -0700 (PDT)
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
Subject: [PATCH v2 11/19] riscv: add ISA extension parsing for Zihintntl
Date: Tue, 17 Oct 2023 15:14:48 +0200
Message-ID: <20231017131456.2053396-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061539_957638_DEB8443E 
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

QWRkIHBhcnNpbmcgZm9yIFppaGludG50bCBJU0EgZXh0ZW5zaW9uWzFdIHRoYXQgd2FzIHJhdGlm
aWVkIGluIGNvbW1pdAowZGM5MWY1ICgiWmloaW50bnRsIGlzIHJhdGlmaWVkIikgb2YgcmlzY3Yt
aXNhLW1hbnVhbFsyXS4KCkxpbms6IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMTNf
d3NOOFltUmZIOFlXeXNGeVRYLURqVGtDbkJkOWhqL3ZpZXcgWzFdCkxpbms6IGh0dHBzOi8vZ2l0
aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsL2NvbW1pdC8wZGM5MWY1MDVlNmQgWzJdClNp
Z25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL2Nw
dWZlYXR1cmUuYyB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2h3Y2FwLmgKaW5kZXggYmVhZDA1Y2IwZGYyLi5hOWFlYTYyYjZjNmYgMTAwNjQ0Ci0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2h3Y2FwLmgKQEAgLTgxLDYgKzgxLDcgQEAKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9a
VktUCQk2MwogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pGSAkJNjQKICNkZWZpbmUgUklTQ1ZfSVNB
X0VYVF9aRkhNSU4JCTY1CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklISU5UTlRMCQk2NgogCiAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfTUFYCQkxMjgKIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCmluZGV4
IDY4OTE0YjVlMmRmOS4uMGE3NGIyY2RjYWNmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCkBAIC0y
NDIsNiArMjQyLDcgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2Ff
ZXh0W10gPSB7CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemljbnRyLCBSSVNDVl9JU0FfRVhUX1pJ
Q05UUiksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemljc3IsIFJJU0NWX0lTQV9FWFRfWklDU1Ip
LAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppZmVuY2VpLCBSSVNDVl9JU0FfRVhUX1pJRkVOQ0VJ
KSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWhpbnRudGwsIFJJU0NWX0lTQV9FWFRfWklISU5U
TlRMKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWhpbnRwYXVzZSwgUklTQ1ZfSVNBX0VYVF9a
SUhJTlRQQVVTRSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemlocG0sIFJJU0NWX0lTQV9FWFRf
WklIUE0pLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpmaCwgUklTQ1ZfSVNBX0VYVF9aRkgpLAot
LSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
