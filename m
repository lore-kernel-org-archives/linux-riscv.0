Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E3DC27C79
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 15:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BREfKWqb1iJFstFLyky+22XIpY9GmirsHhrYc8I3s1Q=; b=KODIGTc+6TvXfd
	eC8d/LCvt5bJ9wog8uJ60KEvSz6HdKEyynnU78WnXT/zQYgzZKynMVsCEPiAJPQrlBKwW5m3zAdfL
	Lqf6Un4zTqk5L55eCbtUzGk3sh7a0gZwOW5O7d8iHs7Kijsyre99Q/tx0yXhKDNpwHMuq2FdzNWgR
	VCFOhcXX6dJmK/Xyc9PPZ/TJ2ue71USlamJxKhh8slCLcFAXJ289/0CIF+rApdGzBC2kSkb3qy3m9
	EOC2scAzb30+0uXBSnktrcHO5c7OA7G4hxweJJbFcH377C1thT34r1m0TXNxTBvy/3AXrVgKU/T4z
	5bT0jy/Kwpi7vvWP4/tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxR3-00000001qap-2Y6w;
	Wed, 19 Jun 2024 15:41:21 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxQx-00000001qUc-1clc
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 15:41:17 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-364068c0ec5so76625f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 08:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718811673; x=1719416473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxBaoVReHjYi8LCIKzJk71raI5rhLtFKE/0A3hAurqc=;
        b=XujtEj0Vqty134XKkkMujJTmdwC3WwmBuw0rzi31szqLHCJtWbSCL4nYThfpFUpHag
         1l9NzWJ8I5UxaB5zoHzH069GjSdQCjpNKJApQhE2zkzFPnNztFaEVZDaZTKyf30kUd5a
         GORTEnKxUT+TpLnKKXH1jfEcB+SorSTIUrA8NSULb5w2GPaNS5KudlegppzFXgj3fxDW
         7tzkeFfUpYd2yjrZAdTDQUiLHkuMkaha//2uOb/dzGlhS5LCUnthDMtXlo9vh3T2KN9f
         SKE/yay9XcPENcv5EPA5D76x7Rit0c4dcRJ/wE74LgngHcvt9xUsvHQNVQwhC7dOPwPE
         qaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718811673; x=1719416473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxBaoVReHjYi8LCIKzJk71raI5rhLtFKE/0A3hAurqc=;
        b=RqA9yF0H1wBnbibC403SivvWJ8MVxG0yfcm7DSXpvtPSH99vu4JntfHlqgJnVzmYOJ
         rxp0hWSSl2GKE6+csnrPcAawyzG8Ktwy8CsgjqC8tXHwLKK/Y8XzoUe3trdlRPFuOVkD
         l/meacZuqm9+EsREzLo357tKwBCxhZPB9yrXr4ei23ytZJKSUqgg2KwO0RWqD91i/5vz
         h63VhkDr4b5GBiJ7KYGeP1hbR8Cp5zSsNiWevMGOPF5FUctn/QYaFEkBi6v4xKxnC0JW
         tt7HWZ445Q8Kx+ItHyIcrU0V3USn7ZkLjIaVcV1I0nkL3ug4e/9tQExndaDvwrGxI5MR
         1hVg==
X-Forwarded-Encrypted: i=1; AJvYcCWIyi0wKUT9XznE8jSNyToPiRfShIxvn+ItcLlzK7dyZ2QsbK3UrH9reJ9qT8CS0fr60cmqpeOSSlhfyggc86A93/PZ9m1Ir3Ea5VRe0oV0
X-Gm-Message-State: AOJu0YxrnmrsWY9wWOfxu8e8a5U9k80TwmxzirvYaxC/WwL1Ii7p8wgn
	LEQDoDaeikDQnDmJyhUCmyViuUHborzFj9sziMgbAidZ5MpqX3Tf7VRP0Zxb0mI=
X-Google-Smtp-Source: AGHT+IFz7mNhNVrkeHHVYr8mBns/F7ItFsjrGXd+9ip+r+Vpj1iuLdfUz+P+4a8dyx9jXLcARTyeFg==
X-Received: by 2002:adf:cf02:0:b0:364:7a63:93c7 with SMTP id ffacd0b85a97d-3647a639555mr16771f8f.1.1718811672887;
        Wed, 19 Jun 2024 08:41:12 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:819d:b9d2:9c2:3b7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c785sm17392292f8f.34.2024.06.19.08.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:41:11 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/5] riscv: add parsing for Zaamo and Zalrsc extensions
Date: Wed, 19 Jun 2024 17:39:09 +0200
Message-ID: <20240619153913.867263-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619153913.867263-1-cleger@rivosinc.com>
References: <20240619153913.867263-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_084115_480411_22C0AA0F 
X-CRM114-Status: GOOD (  12.29  )
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

VGhlc2UgMiBuZXcgZXh0ZW5zaW9ucyBhcmUgYWN0dWFsbHkgYSBzdWJzZXQgb2YgdGhlIEEgZXh0
ZW5zaW9uIHdoaWNoCnByb3ZpZGVzIGF0b21pYyBtZW1vcnkgb3BlcmF0aW9ucyBhbmQgbG9hZC1y
ZXNlcnZlZC9zdG9yZS1jb25kaXRpb25hbAppbnN0cnVjdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBD
bMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9od2NhcC5oIHwgMiArKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwg
OSArKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCA0ODgwMzI0YTFiMjkuLjY5YmUyNDRiY2U0
YiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCisrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtOTIsNiArOTIsOCBAQAogI2RlZmluZSBSSVND
Vl9JU0FfRVhUX1pDRAkJODMKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0YJCTg0CiAjZGVmaW5l
IFJJU0NWX0lTQV9FWFRfWkNNT1AJCTg1CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkFBTU8JCTg2
CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkFMUlNDCQk4NwogCiAjZGVmaW5lIFJJU0NWX0lTQV9F
WFRfWExJTlVYRU5WQ0ZHCTEyNwogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVm
ZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKaW5kZXggZWM0YmZmN2E4
MjdjLi5kNzFlNWJkNThhY2MgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1
cmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKQEAgLTE1Niw2ICsxNTYs
MTEgQEAgc3RhdGljIGludCByaXNjdl9leHRfemNmX3ZhbGlkYXRlKGNvbnN0IHN0cnVjdCByaXNj
dl9pc2FfZXh0X2RhdGEgKmRhdGEsCiAJcmV0dXJuIC1FUFJPQkVfREVGRVI7CiB9CiAKK3N0YXRp
YyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfYV9leHRzW10gPSB7CisJUklTQ1ZfSVNBX0VYVF9a
QUFNTywKKwlSSVNDVl9JU0FfRVhUX1pBTFJTQywKK307CisKIHN0YXRpYyBjb25zdCB1bnNpZ25l
ZCBpbnQgcmlzY3ZfemtfYnVuZGxlZF9leHRzW10gPSB7CiAJUklTQ1ZfSVNBX0VYVF9aQktCLAog
CVJJU0NWX0lTQV9FWFRfWkJLQywKQEAgLTMyNyw3ICszMzIsNyBAQCBzdGF0aWMgY29uc3QgdW5z
aWduZWQgaW50IHJpc2N2X2NfZXh0c1tdID0gewogY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRf
ZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoaSwgUklTQ1Zf
SVNBX0VYVF9pKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShtLCBSSVNDVl9JU0FfRVhUX20pLAot
CV9fUklTQ1ZfSVNBX0VYVF9EQVRBKGEsIFJJU0NWX0lTQV9FWFRfYSksCisJX19SSVNDVl9JU0Ff
RVhUX1NVUEVSU0VUKGEsIFJJU0NWX0lTQV9FWFRfYSwgcmlzY3ZfYV9leHRzKSwKIAlfX1JJU0NW
X0lTQV9FWFRfREFUQShmLCBSSVNDVl9JU0FfRVhUX2YpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRB
KGQsIFJJU0NWX0lTQV9FWFRfZCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEocSwgUklTQ1ZfSVNB
X0VYVF9xKSwKQEAgLTM0Niw3ICszNTEsOSBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9k
YXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWhpbnRwYXVz
ZSwgUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemlo
cG0sIFJJU0NWX0lTQV9FWFRfWklIUE0pLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppbW9wLCBS
SVNDVl9JU0FfRVhUX1pJTU9QKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YWFtbywgUklTQ1Zf
SVNBX0VYVF9aQUFNTyksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemFjYXMsIFJJU0NWX0lTQV9F
WFRfWkFDQVMpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHphbHJzYywgUklTQ1ZfSVNBX0VYVF9a
QUxSU0MpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpmYSwgUklTQ1ZfSVNBX0VYVF9aRkEpLAog
CV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpmaCwgUklTQ1ZfSVNBX0VYVF9aRkgpLAogCV9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHpmaG1pbiwgUklTQ1ZfSVNBX0VYVF9aRkhNSU4pLAotLSAKMi40NS4yCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
