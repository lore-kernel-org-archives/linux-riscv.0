Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B3AC072A2
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 14:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ubvjrs59XAQI0RUh2IQwfymqOqzZNL0AkiHnhxcNgUc=; b=fA99MIxRPxZwZl
	KZhRUZ39M6Mr+N8Y5LilHkUVk7mVNm23Pbb6vKw2i9i7p+K+f2YQSvqaeOIb12PhhcaC0AHJ2BgMw
	w/EmDK1yrmYzYVm5QYetqj1tV+XkhKPKqR4q8Nd3SjRehmYlsFgdp6jtJKMmoYAzTf2Ef/yM/xOJT
	JeH93E8P9U1CKJsgZi1UVDHjsVpzlWGPLCwtzSrPWdXecIGPJDYO7XwJp4KeknhM5OUW4mt0ZXx7B
	mjls8Qkz1wfu1Zd9ts++v57FYc94AAM/qS6DMHeFXLK0C3zcv5s/NrkJ3w5sBYcxGmOuUfn1CL3xk
	xKFksIAnP8n8jnAFZlRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAb-00G8oQ-11;
	Tue, 14 Nov 2023 14:13:37 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAY-00G8mr-2K
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:13:36 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-77bbe4702a1so4531685a.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971212; x=1700576012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMkgyvuzGYJaW56Gm45FtsJL6qswpkealapQbWKCBRw=;
        b=1qmksupYkJQZnL25MUOZh8BdtQgwRWRiCgCpUiJtZoaRr9NiBmCkxIp3HtxPIOnWzH
         vthJgMem+6piiCgCJ63NBNSHMosJaiOx4y22YWZZ0T77EZOprMqKnLHiipPPSbVp8xf5
         Aj59eYX6sk5iHd1zYDxq8DYmxWKieyYQ0R8K00CLldHxhbsDifXMxL0blnCwBFSjlu8L
         fD/dW1vLPa1EA6gudbFSHv/w9JFHT33kt/xhF7/y/rnTUUdLAnA4TTSUyrJQ0OZJRfUr
         jbHltnM5ImL2t0rP4TWZY5YmOc3wnCqRgWlQbzsHh787x7U9DuXMd75dCFOLCkX8jiw9
         kVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971212; x=1700576012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMkgyvuzGYJaW56Gm45FtsJL6qswpkealapQbWKCBRw=;
        b=wiQXTICsU6Fy25afWCmLMIss9/RczLXqReCfIT0Hni9cYsiEcW4gAWYKb7tSAQwyEY
         KFCwGGYXMGW86hTDSMg5pOeSC+CBSD/1MYQJ+rloMPydCDa0YNrGz6CJyLAGsyJIfq4/
         bOl8FgkZJdLC9YEuYXBBa13/fESCmC4Fgp32nv6z9TNKLLt6amDtS2V65p383kNbu2FA
         K2jTyQc5gZs1Lb5rz+SB3toXpTFLxmACRhfKqFtGaSvNpDPvmIa7zQ02vEPHJLR81Hvt
         jPMrfWnkD2l/wHKK40QCoRw0gGNTDpccwAwUs8d+lCkg5sbqOGy/Mkjotr4cX5z8uyh/
         xq2g==
X-Gm-Message-State: AOJu0Yz4yq1FQe2lIT9asyeADPmAmi2S8AzA6wl0vAzqw057sdbhp/XT
	+ZLrL2YwJmHu4URN8yPA5pADAseC9kexXHDlBfRZ6w==
X-Google-Smtp-Source: AGHT+IHnMHw8F3ryLSB+7vrra0BH+tHsLT5qn9YR2ZuZzRjWRR16+wgDWF4cMlcUDZPdu8ADN5zYkA==
X-Received: by 2002:a05:620a:1aa2:b0:77b:c622:e7fc with SMTP id bl34-20020a05620a1aa200b0077bc622e7fcmr2526334qkb.2.1699971212064;
        Tue, 14 Nov 2023 06:13:32 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:31 -0800 (PST)
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
	Samuel Ortiz <sameo@rivosinc.com>,
	Jerry Shih <jerry.shih@sifive.com>
Subject: [PATCH v4 01/20] riscv: add ISA extension parsing for Zbc
Date: Tue, 14 Nov 2023 09:12:37 -0500
Message-ID: <20231114141256.126749-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061334_965159_01EC73D4 
X-CRM114-Status: UNSURE (   9.99  )
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

WmJjIHdhcyBkb2N1bWVudGVkIGluIHRoZSBkdC1iaW5kaW5ncyBidXQgYWN0dWFsbHkgbm90IHN1
cHBvcnRlZCBpbiBJU0EKc3RyaW5nIHBhcnNpbmcuIEFkZCBpdC4KClNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2h3Y2FwLmggfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDEg
KwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgK
aW5kZXggMDZkMzA1MjZlZjNiLi5hZmE5YWJjMWEwYjAgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaHdjYXAuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgK
QEAgLTU3LDYgKzU3LDcgQEAKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUhQTQkJNDIKICNkZWZp
bmUgUklTQ1ZfSVNBX0VYVF9TTVNUQVRFRU4JCTQzCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklD
T05ECQk0NAorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pCQwkJNDUKIAogI2RlZmluZSBSSVNDVl9J
U0FfRVhUX01BWAkJNjQKIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVy
ZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCmluZGV4IGIzNzg1ZmZjMTU3MC4u
ZWFlMTRkYWE1YTc1IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMK
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCkBAIC0xNzYsNiArMTc2LDcgQEAg
Y29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7CiAJX19S
SVNDVl9JU0FfRVhUX0RBVEEoemlocG0sIFJJU0NWX0lTQV9FWFRfWklIUE0pLAogCV9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHpiYSwgUklTQ1ZfSVNBX0VYVF9aQkEpLAogCV9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHpiYiwgUklTQ1ZfSVNBX0VYVF9aQkIpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpiYywg
UklTQ1ZfSVNBX0VYVF9aQkMpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpicywgUklTQ1ZfSVNB
X0VYVF9aQlMpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNtYWlhLCBSSVNDVl9JU0FfRVhUX1NN
QUlBKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzbXN0YXRlZW4sIFJJU0NWX0lTQV9FWFRfU01T
VEFURUVOKSwKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
