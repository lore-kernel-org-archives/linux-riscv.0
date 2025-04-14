Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C6EC369B2
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 12:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hW1F+N2qZwAZ+4IMLxXx/HtuzrEqpHxe9aup+YdgxnA=; b=K3FdR9lZpj8/3D
	mgcpNxtnnKhJbJLEC1B8d7bIclS1MsSZmeaTFu/qlCjtGHz5zH9VjSxNFocXwHS6WjnoCPED2qrsm
	Mxye9Zj8y6uyheh5t2awdrhT7t5b6lTLn4ClSaTrdcR/Uq2Xmwg/FEMaG8Q3bYCWn+YSyxrbQjvTQ
	D2ngOer7GaaRf5OAUTvqYEUOQ4n9v3UgBnui8jRVkvbIJKhRcXGlLeQVkpwmHjamFDRv5YJ8UKcKm
	khqws/wQYkV7aVlxs5uMT1XonI/GxDPxw34VcO1OL7Cww4I6hykqZFgZW7byw39Qv8L6E5osGb6nw
	Jp0MQjjSo+gnerA/XPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J4g-00000001yHf-064E;
	Mon, 14 Apr 2025 12:38:06 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J2b-00000001xeA-0sxn
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 12:35:58 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cfe574976so29536105e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 05:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744634156; x=1745238956; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zt8QGDo/J4nI2rhGhXp0zTShJlIWRjHlpTKLd9eSTsQ=;
        b=tuGBuytnviWu4CkwVDDK6Or0YKKYwhbdcRRKr/Uc0JtF+R+KvVMzK/IVjgwIHZzTaP
         7IL5RMkHn1XKHHo6tN65PfCgxCy65dRPtQJniii/o38PWCO5jhlauYjHEvOcs2+mm3RY
         +5s9gxD/Q2sAyCr+NCFGz/mlpTSrHnKkWu6+7WON6qTNuz8gIUcG1EyICLPd91EXsSZZ
         vgNOIif9eGA0+84qoMVMwAkqlpw4F/1+eFwSeJEXB7c6toEYKZviBrQ2hkdqCrO3sSsv
         ZWv1t6ZspHIsHJYqvCYiQ8YyE9283mVWnOoUK11IzFEariWO2JCq1IIDaDRNKc5WnTPv
         9LRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634156; x=1745238956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zt8QGDo/J4nI2rhGhXp0zTShJlIWRjHlpTKLd9eSTsQ=;
        b=hmr6xQVLClIUrsFJW6nq2fYlW9uGAM2ru9Ur52Fc1R6dp79cyaxSnJo4enLUWN6q1v
         mxrN0K52IOhYONmF9OkCFBcTUyJ1aTefGU9B/bxAMstDhOG42D1uiEpboar00goofWzX
         Ei2mD0WrMAZpEgYsonwXvXNTy6LzutDwihVii+WWTaGDjbcgS/Wb6k/qar0wQF6aiP2y
         rAsmGZEDJwp54X5CdmNNYZi6C9hcDLEgbVcsPhlMDVVRD2anrhL3VbsM7FeORk/ilzn7
         I30NvdIHpiKN8ndndfZLoou0i9I97AgMG4iL3jLe4GODhiDZ+EQdqB5FTCZikSLlssJZ
         /KdA==
X-Forwarded-Encrypted: i=1; AJvYcCVHcPvKVHKN6xZSeF2UqE4aLc6VPcVDbDRitxQhXQ3KmKBZBho68vX1ryg0BLQPJnp+LgG520D2XyhAOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzChH2UeAnAwTBb0hF6AfQaBsF8JhyW2ALluQA65kPz3mJxlKzT
	tjVauRBNIu/+W5PSbO1PVNasyc+rVoQz/Ztq0FtvsozjU6VUF5grT1noc35hJcY=
X-Gm-Gg: ASbGnculOFEKVyCJwFqnc/MubIwMCHDPBiBXq6tV2DbiRDRNC5A3SJcQHdWQTDuhf1A
	gSBGJdYT2WO8oVl7kXxs/CvIJHTepTud998RmJn+PchQtNAhylZxDzN/c4MK6aUmUWUwFp/y5Zp
	SUB1noyswfTk/e/T2t2dWY7ByJXTBYXdbyhyXGSP83rKoSbsXycUABNcZF+di/XdOM1yLZFfAzB
	ezBYLVmX+50j11zejXeKvJ8bVzDA37iNsWQF8EFREYUh9arLbXTGNtQQ1gOLxdc911zfNyURhze
	wtOnDfb5GLYNM4LcBXXCRNTMFtD0MGjdw1IHYUYz/Q==
X-Google-Smtp-Source: AGHT+IGzY8okLdys0tOKhwvB5BGgGvxVyHB5y3oW1MGsgoMkAqQECk7mk6Y/4ZzNlCEdPu9BMIDa/w==
X-Received: by 2002:a05:6000:40dd:b0:391:13ef:1b1b with SMTP id ffacd0b85a97d-39eaaea8457mr8319959f8f.30.1744634155589;
        Mon, 14 Apr 2025 05:35:55 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9780a0sm11003166f8f.50.2025.04.14.05.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:35:54 -0700 (PDT)
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
Subject: [PATCH 2/5] riscv: misaligned: enable IRQs while handling misaligned accesses
Date: Mon, 14 Apr 2025 14:34:42 +0200
Message-ID: <20250414123543.1615478-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414123543.1615478-1-cleger@rivosinc.com>
References: <20250414123543.1615478-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_053557_249160_95F2B4ED 
X-CRM114-Status: GOOD (  10.18  )
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

V2UgY2FuIHNhZmVseSByZWVuYWJsZSBJUlFzIGlmIHRoZXkgd2VyZSBlbmFibGVkIGluIHRoZSBw
cmV2aW91cwpjb250ZXh0LiBUaGlzIGFsbG93cyB0byBhY2Nlc3MgdXNlciBtZW1vcnkgdGhhdCBj
b3VsZCBwb3RlbnRpYWxseQp0cmlnZ2VyIGEgcGFnZSBmYXVsdC4KCkZpeGVzOiBiNjg2ZWNkZWFj
ZjYgKCJyaXNjdjogbWlzYWxpZ25lZDogUmVzdHJpY3QgdXNlciBhY2Nlc3MgdG8ga2VybmVsIG1l
bW9yeSIpClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNv
bT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIHwgOCArKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCmluZGV4IDU1ZDlmMzQ1MDM5OC4uM2Vl
Y2MyYWRkYzQxIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCisrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKQEAgLTIwNiw2ICsyMDYsMTEgQEAgZW51bSBtaXNhbGln
bmVkX2FjY2Vzc190eXBlIHsKIHN0YXRpYyB2b2lkIGRvX3RyYXBfbWlzYWxpZ25lZChzdHJ1Y3Qg
cHRfcmVncyAqcmVncywgZW51bSBtaXNhbGlnbmVkX2FjY2Vzc190eXBlIHR5cGUpCiB7CiAJaXJx
ZW50cnlfc3RhdGVfdCBzdGF0ZSA9IGlycWVudHJ5X2VudGVyKHJlZ3MpOworCWJvb2wgZW5hYmxl
X2lycXMgPSAhcmVnc19pcnFzX2Rpc2FibGVkKHJlZ3MpOworCisJLyogRW5hYmxlIGludGVycnVw
dHMgaWYgdGhleSB3ZXJlIGVuYWJsZWQgaW4gdGhlIGludGVycnVwdGVkIGNvbnRleHQuICovCisJ
aWYgKGVuYWJsZV9pcnFzKQorCQlsb2NhbF9pcnFfZW5hYmxlKCk7CiAKIAlpZiAodHlwZSA9PSAg
TUlTQUxJR05FRF9MT0FEKSB7CiAJCWlmIChoYW5kbGVfbWlzYWxpZ25lZF9sb2FkKHJlZ3MpKQpA
QCAtMjE3LDYgKzIyMiw5IEBAIHN0YXRpYyB2b2lkIGRvX3RyYXBfbWlzYWxpZ25lZChzdHJ1Y3Qg
cHRfcmVncyAqcmVncywgZW51bSBtaXNhbGlnbmVkX2FjY2Vzc190eXBlCiAJCQkJICAgICAgIk9v
cHMgLSBzdG9yZSAob3IgQU1PKSBhZGRyZXNzIG1pc2FsaWduZWQiKTsKIAl9CiAKKwlpZiAoZW5h
YmxlX2lycXMpCisJCWxvY2FsX2lycV9kaXNhYmxlKCk7CisKIAlpcnFlbnRyeV9leGl0KHJlZ3Ms
IHN0YXRlKTsKIH0KIAotLSAKMi40OS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
