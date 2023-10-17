Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5A8CDB482
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6Rpt2O4wcYxKhgVGgOOjNQONTztsdHA5kgA76SrL0c=; b=N8dUJlIcTEoVox
	QbPMB22TukmE/hZYRECUzjOneJh44w4t6mC/dLkSnRQ52TMRmDTTm7azDynXaFKKp8dp4TyQ9p+Bz
	uRti0GFv5tkObUMwrE3iWgDEGEKNJStyaaxhj63jmFklj/5v+ATALivwsE2299sz15lu/QedO8iZx
	Qvb/GhGu+J825DBQRPQQ0VbPCZ/88v3DJD9mBUQ6YQte0lJ5s5vP+OYL4YsYc0Aw8KgZFLmAJWJAU
	hJahsQw/kftlj5nxKU33o5aTtDMaOmWHKDXnFERhRJ0yK9mDePnETyla8ATQk+QCUWp1jNbZzl34d
	zzTsqwm+5yZDplTwctaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjv3-00CN29-3B;
	Tue, 17 Oct 2023 13:15:33 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjv0-00CN0N-2O
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:15:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4053e6e8ca7so18305845e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548528; x=1698153328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsST45qXCpXW6hXAZjZQAx82ZOViPLGcbU4pTeMM644=;
        b=r07QeCgqQa48USdDlwPiEzWxiywwlnLlT2/o4BfZvHyQ5f2ifeCZ65XAeV2gI2zApL
         FeGtfVBP9IhXErJ32Zo0uWVuwnUD++SZBSt+KOZJdONBE9nq7LtFCV0kgf+Xk/U1emox
         5w3jqyg15LFWvIbW20mJ4z2cDtb3wbfnH0kXXtjNjrA7WAaFr3YLgqXHK4pwuLRT7V8Q
         uqz7wXzcnomr0FRSoWhOPNx0KgkuLbza9Vw2+zv0yYDNHexDa9ANZG5EfbLT1ZsPnRGw
         Id3do67Z05pDk0HoAaMbBM0CIYcPX+oguCcOZqpz2z9ab5+3F9M2rv0qevYMlErAWOqr
         PwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548528; x=1698153328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsST45qXCpXW6hXAZjZQAx82ZOViPLGcbU4pTeMM644=;
        b=sHeaEHxegqKtvzbf05qWY0BqirqCBQDM6shr6BMMOQtsryw/C7/8KRLb56T6yirkjD
         ReHeIRWNvPMNvzjViakNGZOyEfKil6dNX/REJnKiKzMO7+M9J66jtRFBnXwCzV18rDzO
         FOVqgTE7z6FrZc5PVKI0Bxanzck5QBkyB1lBZ3H7c5qAcH8yi00zI88VpinvmJrqe7Z5
         8MtWqJrngUXy/kK1wwtBckopHWCPHXA5mav2uI+keNOWbuQ5WRYkVfgEF82YzAdgpm5L
         Qr72ZIQ23IXP1TSDszEtfGmxNrZ5fndBu8sz1vTkuPxnjLgJD2jA8K7GE38nkCpd9rpe
         WwTQ==
X-Gm-Message-State: AOJu0YwrEVD2JfUxKt4LmZ2UB5EFNtRmcPHAStZTgGDW1ANKpLqbCxac
	CQZ68SIAgt4TDYzUXIPGWiAzEWrhCLW/mWilMVWjgw==
X-Google-Smtp-Source: AGHT+IFnvMoT3qyr2NCLvQJOx6T+CGM+XTBB3O4jbC4CPq2HYp9VCIzFJSZf5tnuM4q6zh/FfvWWOA==
X-Received: by 2002:a05:600c:4f88:b0:405:3cc1:e115 with SMTP id n8-20020a05600c4f8800b004053cc1e115mr1603989wmq.3.1697548527550;
        Tue, 17 Oct 2023 06:15:27 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:26 -0700 (PDT)
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
Subject: [PATCH v2 01/19] riscv: hwprobe: factorize hwprobe ISA extension reporting
Date: Tue, 17 Oct 2023 15:14:38 +0200
Message-ID: <20231017131456.2053396-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061530_777005_AB1F7456 
X-CRM114-Status: GOOD (  12.53  )
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

RmFjdG9yaXplIElTQSBleHRlbnNpb24gcmVwb3J0aW5nIGJ5IHVzaW5nIGEgbWFjcm8gcmF0aGVy
IHRoYW4KY29weS9wYXN0aW5nIGV4dGVuc2lvbiBuYW1lcy4gVGhpcyB3aWxsIGFsbG93IGFkZGlu
ZyBuZXcgZXh0ZW5zaW9ucyBtb3JlCmVhc2lseS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzD
qWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlz
Y3YuYyB8IDMyICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTggaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwpp
bmRleCA0NzMxNTliNWYzMDMuLmUyMDc4NzRlNjg2ZSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvc3lzX3Jpc2N2LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKQEAg
LTE0NSwyMCArMTQ1LDI0IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJp
c2N2X2h3cHJvYmUgKnBhaXIsCiAJZm9yX2VhY2hfY3B1KGNwdSwgY3B1cykgewogCQlzdHJ1Y3Qg
cmlzY3ZfaXNhaW5mbyAqaXNhaW5mbyA9ICZoYXJ0X2lzYVtjcHVdOwogCi0JCWlmIChyaXNjdl9p
c2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FpbmZvLT5pc2EsIFpCQSkpCi0JCQlwYWlyLT52YWx1
ZSB8PSBSSVNDVl9IV1BST0JFX0VYVF9aQkE7Ci0JCWVsc2UKLQkJCW1pc3NpbmcgfD0gUklTQ1Zf
SFdQUk9CRV9FWFRfWkJBOwotCi0JCWlmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShp
c2FpbmZvLT5pc2EsIFpCQikpCi0JCQlwYWlyLT52YWx1ZSB8PSBSSVNDVl9IV1BST0JFX0VYVF9a
QkI7Ci0JCWVsc2UKLQkJCW1pc3NpbmcgfD0gUklTQ1ZfSFdQUk9CRV9FWFRfWkJCOwotCi0JCWlm
IChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FpbmZvLT5pc2EsIFpCUykpCi0JCQlw
YWlyLT52YWx1ZSB8PSBSSVNDVl9IV1BST0JFX0VYVF9aQlM7Ci0JCWVsc2UKLQkJCW1pc3Npbmcg
fD0gUklTQ1ZfSFdQUk9CRV9FWFRfWkJTOworI2RlZmluZSBDSEVDS19JU0FfRVhUKF9fZXh0KQkJ
CQkJCQlcCisJCWRvIHsJCQkJCQkJCVwKKwkJCWlmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWls
YWJsZShpc2FpbmZvLT5pc2EsIF9fZXh0KSkJXAorCQkJCXBhaXItPnZhbHVlIHw9IFJJU0NWX0hX
UFJPQkVfRVhUXyMjX19leHQ7CVwKKwkJCWVsc2UJCQkJCQkJXAorCQkJCW1pc3NpbmcgfD0gUklT
Q1ZfSFdQUk9CRV9FWFRfIyNfX2V4dDsJCVwKKwkJfSB3aGlsZSAoZmFsc2UpCisKKwkJLyoKKwkJ
ICogT25seSB1c2UgQ0hFQ0tfSVNBX0VYVCgpIGZvciBleHRlbnNpb25zIHdoaWNoIGNhbiBiZSBl
eHBvc2VkCisJCSAqIHRvIHVzZXJzcGFjZSwgcmVnYXJkbGVzcyBvZiB0aGUga2VybmVsJ3MgY29u
ZmlndXJhdGlvbiwgYXMgbm8KKwkJICogb3RoZXIgY2hlY2tzLCBiZXNpZGVzIHByZXNlbmNlIGlu
IHRoZSBoYXJ0X2lzYSBiaXRtYXAsIGFyZQorCQkgKiBtYWRlLgorCQkgKi8KKwkJQ0hFQ0tfSVNB
X0VYVChaQkEpOworCQlDSEVDS19JU0FfRVhUKFpCQik7CisJCUNIRUNLX0lTQV9FWFQoWkJTKTsK
KyN1bmRlZiBDSEVDS19JU0FfRVhUCiAJfQogCiAJLyogTm93IHR1cm4gb2ZmIHJlcG9ydGluZyBm
ZWF0dXJlcyBpZiBhbnkgQ1BVIGlzIG1pc3NpbmcgaXQuICovCi0tIAoyLjQyLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
