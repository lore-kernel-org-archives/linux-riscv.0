Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DD9C41535
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VP7b6K3gKTsgSMnQsXXEfeixwCBtV9uHftnwQ7DY6m4=; b=SS6nMQEd3rHOtZ
	M6lGuoOUtAeu3ZviHLBs4gq6VvsZTmZVkploebOv/nPOGM/DBRWZi5R8/aK3y3TmUvXtld5vj45jE
	44HGa3iB5uKaeKadbI84bIYCQ++eTPZKUKOTRQ8Gc1DuddlL7GUDMhLbQLbe9Zlwwsk5DJuD6EuoC
	AXA1est9FwvIJNJyo+KOrp4WAJlJyZhroQqDRBCQWxKPLp+bFOFhjEEtAq+CrE7A+487uGPvShY1G
	kDGJ/mmpM2JRHt8kMTPVVCW5YR/m6pJGsqvT3O5aycVZKSmxQ+4H8qIoXDMQkkWaMqIWBhFTC9r/H
	zk9w2C2AF6P69Omkb6+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jks-0019Lo-1J;
	Tue, 07 Nov 2023 10:56:22 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkl-0019BB-1b
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 10:56:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-408423fc784so3094525e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 02:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354572; x=1699959372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpUSLH3BYgf/ktV7Sl3gBxkxzBrg1sZ+k5tb8/h2R/w=;
        b=c4Lx6MPd6Q2rMnVIwOs88j1FVf+9Qpz8OjfXR+XrF+fOSJzrUWH3E1EweAOBB6Z2LI
         Fa7gz+6Ljg+F9B8lFFPBtB+xZHbww9MtjWVaiZqjtYQ3+JcA8hgxU279G51eUeD8XoyF
         IZXv1pXlMe9gI461Dd6gytOSyF+SRF/fXdDEv1nEaGNGBjalGkK6REpOyTbZMp1slod7
         pnF6CRdSotyHkY7MVVL3iL/UYz2GnWZm0NQ9QC2mW2Hsc5FqjZa/aOptBQ7xDZ8l5b1+
         bJ3QURdmxB++EXUAEPzUKwwrlzldkhvdoVOBi/bpiUZ4TcpAwZQeap9gxHCUcEZ4Nmpw
         t0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354572; x=1699959372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mpUSLH3BYgf/ktV7Sl3gBxkxzBrg1sZ+k5tb8/h2R/w=;
        b=LvY6oF+sGQI/5nFpB91lNbEoKjrpEkuMyLgF6MSsNo2bBuinjRnCtxd9U5a6RMe/TX
         WbhdB9rmSFZX6UGz8W8xRpF8BVlu15MhcqhiTGHkaAmcy64Mh9jeT5EjVuzG9v6UE6Rg
         etH0WNvlTsfaw0qb+9RNDUwtNPTkkxPReC0bo1+UDPXaWzdVVX6YCkYji1kEcZIrhfZH
         /Bls+QGXvvgF/2MNfR8YnqY2q6xqxm6j37Yh/uQhWHkEurtROs3Vx3VSRQoSf4zR7RVR
         UlRuIHWUXlrVOd57rhlAJIUnW4cVombx9aP3hzNds2v5WTyWDz8uuBzSfSmoEZ5Api8d
         8Qlg==
X-Gm-Message-State: AOJu0YwjthrsBzdPGrN/9mYBt0Z5K+Jovy5l0fxv9Lw6ShFtmF8gsN0Q
	28OyyShL0JYG6+Nk7bttt8GuFWJqF00iYdsjnwQCyg==
X-Google-Smtp-Source: AGHT+IGHgM8P/GBImCVbhEYbBPs1ObGpHO7TgPjk8/ukbJajiGwUzvQhgmr/xEO8DsJ21Emp1pseuw==
X-Received: by 2002:a05:600c:1c17:b0:405:4280:341d with SMTP id j23-20020a05600c1c1700b004054280341dmr24929672wms.4.1699354572285;
        Tue, 07 Nov 2023 02:56:12 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:12 -0800 (PST)
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
Subject: [PATCH v3 10/20] riscv: hwprobe: export Zfh[min] ISA extensions
Date: Tue,  7 Nov 2023 11:55:46 +0100
Message-ID: <20231107105556.517187-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_025615_531879_001C32C1 
X-CRM114-Status: GOOD (  11.67  )
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

RXhwb3J0IFpmaFttaW5dIElTQSBleHRlbnNpb25zWzFdIHRocm91Z2ggaHdwcm9iZSBvbmx5IGlm
IEZQVSBzdXBwb3J0CmlzIGF2YWlsYWJsZS4KCkxpbms6IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNv
bS9maWxlL2QvMXozdFFRTG01QUxzQUQ3N1BNMGwwQ0huYXB4V0NlVnpQL3ZpZXcgWzFdClNpZ25l
ZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQt
Ynk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgotLS0KIERvY3VtZW50YXRpb24vYXJj
aC9yaXNjdi9od3Byb2JlLnJzdCAgfCA2ICsrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2h3cHJvYmUuaCB8IDIgKysKIGFyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jICAgICAg
ICAgfCA1ICsrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgYi9Eb2N1bWVudGF0aW9u
L2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKaW5kZXggMjE4M2ZhNmQyZmMxLi5jZTA0OTBlMzEzMGMg
MTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAorKysgYi9E
b2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKQEAgLTEzNyw2ICsxMzcsMTIgQEAg
VGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgogICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BS
T0JFX0VYVF9aVktUYDogVGhlIFp2a3QgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCBhcwogICAgICAg
IGRlZmluZWQgaW4gdmVyc2lvbiAxLjAgb2YgdGhlIFJJU0MtViBDcnlwdG9ncmFwaHkgRXh0ZW5z
aW9ucyBWb2x1bWUgSUkuCiAKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWkZIYDog
VGhlIFpmaCBleHRlbnNpb24gdmVyc2lvbiAxLjAgaXMgc3VwcG9ydGVkCisgICAgICAgYXMgZGVm
aW5lZCBpbiB0aGUgUklTQy1WIElTQSBtYW51YWwuCisKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQ
Uk9CRV9FWFRfWkZITUlOYDogVGhlIFpmaG1pbiBleHRlbnNpb24gdmVyc2lvbiAxLjAgaXMKKyAg
ICAgICBzdXBwb3J0ZWQgYXMgZGVmaW5lZCBpbiB0aGUgUklTQy1WIElTQSBtYW51YWwuCisKICog
OmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0bWFzayB0aGF0IGNv
bnRhaW5zIHBlcmZvcm1hbmNlCiAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBzZWxlY3RlZCBzZXQg
b2YgcHJvY2Vzc29ycy4KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKaW5kZXgg
MWI4NTM4NmYyNzZiLi4xMjY4MDA4MWM2MDIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS91YXBpL2FzbS9od3Byb2JlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3
cHJvYmUuaApAQCAtNDksNiArNDksOCBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAjZGVmaW5l
CQlSSVNDVl9IV1BST0JFX0VYVF9aVktTRUQJKDEgPDwgMjMpCiAjZGVmaW5lCQlSSVNDVl9IV1BS
T0JFX0VYVF9aVktTSAkJKDEgPDwgMjQpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aVktU
CQkoMSA8PCAyNSkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pGSAkJKDEgPDwgMjYpCisj
ZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aRkhNSU4JKDEgPDwgMjcpCiAjZGVmaW5lIFJJU0NW
X0hXUFJPQkVfS0VZX0NQVVBFUkZfMAk1CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdO
RURfVU5LTk9XTgkoMCA8PCAwKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VN
VUxBVEVECSgxIDw8IDApCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3Yu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCmluZGV4IDhlMWQyNjY1OWUxNC4uNDg2
ZTA1M2EwNzk3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYworKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwpAQCAtMTg1LDYgKzE4NSwxMSBAQCBzdGF0
aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAogCQkJ
Q0hFQ0tfSVNBX0VYVChaVktTSCk7CiAJCQlDSEVDS19JU0FfRVhUKFpWS1QpOwogCQl9CisKKwkJ
aWYgKGhhc19mcHUoKSkgeworCQkJQ0hFQ0tfSVNBX0VYVChaRkgpOworCQkJQ0hFQ0tfSVNBX0VY
VChaRkhNSU4pOworCQl9CiAjdW5kZWYgQ0hFQ0tfSVNBX0VYVAogCX0KIAotLSAKMi40Mi4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
