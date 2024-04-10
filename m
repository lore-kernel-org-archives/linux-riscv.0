Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74468CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 09:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+KvBiN2W9Pc7CtMXi2at8pl/fLALSIuWzYXu10ZBHo=; b=W201JwvAgRAZi/
	npP8AiokSXK7Fqto21a9k2T7nt+AnH4WiH4H8hDoGXz7ilEbMlcpPd2ljd3W90xBVatZE4SgNfUmd
	BLv/VHe9HLTf9e3GPzRa2g0FTyDilwdxMzLBQPkbaO1mCJnXZwsE1oNYMgz5nB840fQC/sg9WSsh+
	NNEFsvrZ1VvbVQt9jVwv13KBEGdj4xGNr/sXK46XGQtdrJJjNvsahEl8nGF7Ijs6R71aHJ2xf4D69
	ZXqvB7vxoBe2tvjc1y6/sLFl+I6oPjlBQWjUJR8RJjxBS5Dl+7fh6TkcQtbMLFt4s/nbBxb8KL651
	PJZ0TWTmvvOCXSmZJJvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTzo-000000063bx-0oSq;
	Wed, 10 Apr 2024 09:11:56 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTzH-000000063BU-2q1R
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 09:11:29 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-34560201517so889195f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 02:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712740282; x=1713345082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdcDTJcebnZeQ1JIaCOE86KIfZmbyqQMd2Sc3N5X9Dw=;
        b=gLt7DN2dL4JAuibIz/r7Ak0bAS/0zE7vaVbgWX2pK0a9E7Gci/L6lTPXgmmn5QhF+b
         UKWctExP5aiybzTfeK6tV/6pSRTDZnKFi0uPlm1zG9DWLu7iI7viLJIpOS92Fn7rRncD
         fqx/ER1DK4r34QEDts8zmEzBkUp697hdNh0VEuQI9XflYgfH1bEcGSeQ9Bwb4Y6cHuwe
         orAO4hekyPAn2imAumXlHaRT8BalJA8MjxoGpKFDcnk6HlHau7oydbSzxKLSYx7qt8fO
         cxzITbLVK7PCncRTD3Hacvc9Ku49RCSPI3UkmHHJf6pS9gvavFpGbCOUJfthaSrtY4/t
         r+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712740282; x=1713345082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdcDTJcebnZeQ1JIaCOE86KIfZmbyqQMd2Sc3N5X9Dw=;
        b=RQhuW6KUQYcpbWU+ayHsYV0S+8bRDV1mXLuv/ld/2pRlS4jaAbty+jBMEg/CPRvHjB
         SATopqAKvQOgAPoBEfmFhfNmGIZe42AnFcOym8YM7b6z9G2R0Hbvz/LLkCHAbio01NBV
         hxOF+NIiBQLyxPQkYaJNB0Fn9qO9IcjQ9wRrqwNon0EZmjQGOtRpwagr+tE7VxtIWHMB
         7amfH4vcgfPnG+SxSrtrMY7x5ZHxr17NK4TJsUmiyC/64MKV85wDBiWWwxzGdUVG6xK3
         6/S2cqnQq4dQ9AfNEpQKmlmTnLaFCFz4+Q+HAelePwnXn0fjNeNLlHOtMT61bT+46+y7
         bCAw==
X-Forwarded-Encrypted: i=1; AJvYcCVdLBvBzcjg4XKCIStHT1KYRlXDxPDn9p1v5NwUeqzgSw1VtJiiortSj+kun6fdtzIcIi56zOq6gpi/WOQj32chdvLbu8KTg4R3/jpEMiNB
X-Gm-Message-State: AOJu0Yw0IGcXpAwW7cApURflGdvZn8T9h3VrlvLY2SljlxqdjVtuh7Ga
	jfFuQ3WMDi7XnfAxIL6h9VuVHa75mm7T3wzw5BN/+RFPDPCtT6RRZshn3BLDDqc=
X-Google-Smtp-Source: AGHT+IETJd3wpoMeNtTRaVUSO311GACzKRot3UF4l9zMBdSlUcbEIBpRk/TUHcnQPBv8xEZGevomKg==
X-Received: by 2002:a5d:5982:0:b0:343:b9e4:ac2a with SMTP id n2-20020a5d5982000000b00343b9e4ac2amr1633158wri.4.1712740282238;
        Wed, 10 Apr 2024 02:11:22 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:d4a6:5856:3e6c:3dff])
        by smtp.gmail.com with ESMTPSA id d6-20020a056000114600b003456c693fa4sm9079086wrx.93.2024.04.10.02.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 02:11:21 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 09/10] RISC-V: KVM: Allow Zcmop extension for Guest/VM
Date: Wed, 10 Apr 2024 11:11:02 +0200
Message-ID: <20240410091106.749233-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410091106.749233-1-cleger@rivosinc.com>
References: <20240410091106.749233-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_021123_838950_1FDBA731 
X-CRM114-Status: UNSURE (   9.33  )
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

RXh0ZW5kIHRoZSBLVk0gSVNBIGV4dGVuc2lvbiBPTkVfUkVHIGludGVyZmFjZSB0byBhbGxvdyBL
Vk0gdXNlciBzcGFjZQp0byBkZXRlY3QgYW5kIGVuYWJsZSBaY21vcCBleHRlbnNpb24gZm9yIEd1
ZXN0L1ZNLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMu
Y29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCB8IDEgKwogYXJjaC9y
aXNjdi9rdm0vdmNwdV9vbmVyZWcuYyAgICAgIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3Zt
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKaW5kZXggNTdkYjNmZWE2Nzlm
Li4wMzY2Mzg5YTBiYWUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9r
dm0uaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKQEAgLTE3Miw2ICsx
NzIsNyBAQCBlbnVtIEtWTV9SSVNDVl9JU0FfRVhUX0lEIHsKIAlLVk1fUklTQ1ZfSVNBX0VYVF9a
Q0IsCiAJS1ZNX1JJU0NWX0lTQV9FWFRfWkNELAogCUtWTV9SSVNDVl9JU0FfRVhUX1pDRiwKKwlL
Vk1fUklTQ1ZfSVNBX0VYVF9aQ01PUCwKIAlLVk1fUklTQ1ZfSVNBX0VYVF9NQVgsCiB9OwogCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jIGIvYXJjaC9yaXNjdi9rdm0v
dmNwdV9vbmVyZWcuYwppbmRleCA3ZDQ3ZmM5MTBiZDkuLmFmNGZlZmExODlhZiAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYworKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1
X29uZXJlZy5jCkBAIC01Miw2ICs1Miw3IEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBsb25nIGt2
bV9pc2FfZXh0X2FycltdID0gewogCUtWTV9JU0FfRVhUX0FSUihaQ0IpLAogCUtWTV9JU0FfRVhU
X0FSUihaQ0QpLAogCUtWTV9JU0FfRVhUX0FSUihaQ0YpLAorCUtWTV9JU0FfRVhUX0FSUihaQ01P
UCksCiAJS1ZNX0lTQV9FWFRfQVJSKFpGQSksCiAJS1ZNX0lTQV9FWFRfQVJSKFpGSCksCiAJS1ZN
X0lTQV9FWFRfQVJSKFpGSE1JTiksCkBAIC0xMzYsNiArMTM3LDcgQEAgc3RhdGljIGJvb2wga3Zt
X3Jpc2N2X3ZjcHVfaXNhX2Rpc2FibGVfYWxsb3dlZCh1bnNpZ25lZCBsb25nIGV4dCkKIAljYXNl
IEtWTV9SSVNDVl9JU0FfRVhUX1pDQjoKIAljYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pDRDoKIAlj
YXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pDRjoKKwljYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pDTU9Q
OgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkZBOgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRf
WkZIOgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkZITUlOOgotLSAKMi40My4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
