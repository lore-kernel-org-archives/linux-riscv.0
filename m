Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797FEC4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+B2eSRMxsHHhwZ27jQjNPiQpdodqdxoowe3LcqC11pU=; b=GpWIWvVI+vaMoa
	QVFJVMx/emSyHRcCpnaoXNAUfimFp1VTDxyhTLeGc7yqqAV0IlD/SzWRk6FQ617lzU3wVY43Sq7AG
	wSs2momYg/dAg+sYiEf7S6Pm2NEBZxfTJKmD+0+ziW5vBqR30fBr5HXdx3jo2zMbiMYT/HBnFPf3T
	PDHIRA+PjJFGQBMtV1HcJvTOCsgS5pas1636LHEDcEd1CmXr0FXzTCC8xDcgXjRv1qqAdGSuZSE7L
	iAZa+i2+YSJ0MSWqrBdqF6NhKTbzhR+aJVIw4Bv7BFxCwZwy/nwbreBiux0TP5rn3Q3l3RvrokJ46
	ftBgwBVQQUqRlmLGOPYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkp-0019IY-1T;
	Tue, 07 Nov 2023 10:56:19 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkk-0019AP-0G
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 10:56:15 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-32f9baca5bcso817419f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 02:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354572; x=1699959372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bP/Xz2BZ0CN3QwJs26MNtdiNNK8TyKjqE/jUpDPgkTo=;
        b=2VKYJQRt9+PWHreFfEKSLEeov9jQye2sXW43eb+fehR7zm547cBE+Bxs6Ni4jWycC0
         fi4Ejoxl0hN5HkVfLbQAOGUNBfo/TgXQhCR7F0M0b9cpm6A2gmoydZPBJpVV+y77BNeu
         4aiCaugdydkng2IACKnVUlLOnDKns8VkLfm4gE0OyGggORNEjlfPHC1u2FyjlVuWDt9a
         l0q2ogR+f+FNvX4NOnjr766nwDAZKem2uFAzC5HT6WdhJBJmLwxzmkGwjHNRviO+w3lP
         5K4i7AJasvTk7oVQtZ8RLdcCnzAQwAxQGhoM23mCrfnNMOsZLEN+CxeOQnXpBBdNmZ6M
         saAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354572; x=1699959372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bP/Xz2BZ0CN3QwJs26MNtdiNNK8TyKjqE/jUpDPgkTo=;
        b=XfX84PQGsatdW4sPizmjCrNIR6MEamlJ/YnnsEOS8I/CmpAKnp45I09TXRQar/L6dd
         GoDtDUgcSyYoPgx3Mxm7B7KDyOSQH/Aw/Dbz2a5ZXN2ufMlDgtM1R7VLIBbxBAbWEGz3
         WAhf8BLa/JNHna0Op8Ek+LKhMWegk3sPirvjzkFoj5kqe8RGpWirGXLSvoDiZ2M/aSxR
         DovXQYTQxcaGx8/N8h7QUKvijcx2OtA6mMBwWhNWKYi06yTXEX1jOF55nshxB5nV1wpv
         S9gPWHxh+L7bO66g4Ev8Vw3n1gIhpOAuhzw2QUdej3JtCXY03mUY4Jge3g3NgL9Ji9dG
         TKTg==
X-Gm-Message-State: AOJu0Ywe48mlE24tHE6IWZuyHiTdsoecqhnN4zGOjqMXZSgzDxOKxQw4
	2LqhUr5VaTVNRRLnQiT3v1laxBmdwdbxQsRe1UTN3A==
X-Google-Smtp-Source: AGHT+IE6VYSHRuwoE2N98xFWFeww3WuAv2d6RelnI44p7pd6PDNb8XsMUCdLyux86n2WxtMje6eQ5g==
X-Received: by 2002:a05:600c:3b91:b0:407:52f0:b01a with SMTP id n17-20020a05600c3b9100b0040752f0b01amr26054544wms.2.1699354571542;
        Tue, 07 Nov 2023 02:56:11 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:11 -0800 (PST)
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
Subject: [PATCH v3 09/20] riscv: add ISA extension parsing for Zfh/Zfh[min]
Date: Tue,  7 Nov 2023 11:55:45 +0100
Message-ID: <20231107105556.517187-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_025614_124638_5BBA1C3A 
X-CRM114-Status: UNSURE (   9.20  )
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

QWRkIHBhcnNpbmcgZm9yIFpmaFttaW5dIElTQSBleHRlbnNpb25zWzFdLgoKTGluazogaHR0cHM6
Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xejN0UVFMbTVBTHNBRDc3UE0wbDBDSG5hcHhXQ2VW
elAvdmlldyBbMV0KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPgpSZXZpZXdlZC1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+Ci0tLQog
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIHwgMiArKwogYXJjaC9yaXNjdi9rZXJuZWwv
Y3B1ZmVhdHVyZS5jIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3Y2FwLmgKaW5kZXggNTU2ZDFkYTAyODc3Li4xMGViZDM2ZjY3ZTAgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAorKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3Y2FwLmgKQEAgLTgxLDYgKzgxLDggQEAKICNkZWZpbmUgUklTQ1ZfSVNBX0VY
VF9aVktTRUQJCTYzCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZLU0gJCTY0CiAjZGVmaW5lIFJJ
U0NWX0lTQV9FWFRfWlZLVAkJNjUKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aRkgJCTY2CisjZGVm
aW5lIFJJU0NWX0lTQV9FWFRfWkZITUlOCQk2NwogCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfTUFY
CQkxMjgKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9JTlZBTElECQlVMzJfTUFYCmRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVm
ZWF0dXJlLmMKaW5kZXggNTY1NzBiODM4OTEwLi43YzA0YzAzZTQzNWYgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVm
ZWF0dXJlLmMKQEAgLTI2MCw2ICsyNjAsOCBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9k
YXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWZlbmNlaSwg
UklTQ1ZfSVNBX0VYVF9aSUZFTkNFSSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemloaW50cGF1
c2UsIFJJU0NWX0lTQV9FWFRfWklISU5UUEFVU0UpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpp
aHBtLCBSSVNDVl9JU0FfRVhUX1pJSFBNKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6ZmgsIFJJ
U0NWX0lTQV9FWFRfWkZIKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6ZmhtaW4sIFJJU0NWX0lT
QV9FWFRfWkZITUlOKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YmEsIFJJU0NWX0lTQV9FWFRf
WkJBKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YmIsIFJJU0NWX0lTQV9FWFRfWkJCKSwKIAlf
X1JJU0NWX0lTQV9FWFRfREFUQSh6YmMsIFJJU0NWX0lTQV9FWFRfWkJDKSwKLS0gCjIuNDIuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
