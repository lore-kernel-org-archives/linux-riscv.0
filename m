Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB644CD1297
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 09:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ht8J48sFZwUwjp6RKdfF0/O6LTbBO+RU1M1DTddgh7M=; b=Dkfw8OpzLMkrP9
	zo+I6WDyOgyhfgEMgYonSiDXyaI3LgUYVQR11VIbdSAYQIpWT5rNWk0RNoyrk3TX2V+FqSe3oGnPZ
	MqRAMlkKNDJbETSjfZH8IOLW9ual1Rew2SRVq7smRTA83/sK87ACpxncog+dbPALKqr4HHqZApDAs
	1qd3IurgqOaD2O9jDUDTYtA2UA0JOMdod2b4a3kqQU85sKw4jtAs6qQsDbNJ8fvRcAWuACAGJWM6X
	FWCK9v4psCEGzGouf9dP/B6wfpNaJinXxrKVZZ+Q05i6xEoUpsAJNU3BfR8isdUm5bsvQGVS23rRl
	G89YWMvJq0Fq1600EnIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTze-000000063TR-2JSN;
	Wed, 10 Apr 2024 09:11:46 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTzF-0000000639k-2yfT
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 09:11:24 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-34560201517so889185f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 02:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712740280; x=1713345080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJJluMz+u6UTg8XM641LtNTBq3D7zPplm+46K1BBT3g=;
        b=sIexNP3c7YWZ9W7BCHWekJkBm0Vho5mv5KEY+IB9OLbh0fym0wt0OrPyC5jWtNxqPb
         pkT4/LpzIM85cGBuSNmg34Y4yEnOXTqep7YtGzAxGa+7BvvJd+EpWKqgOWJPMOA2/dng
         bCMZCviWW6YuHP5eq8QDyMI1NX9PGy6UL/mmMTmuGfRag0uaoi3LbVeLBy4chYwZ7XmE
         2QitjBitFFSjmuskCRPNeCT/r2vxJguS/rMeETiCYVe2ebZFDhQCee2ll0A+UiSSc891
         8YztOacXFTAoAnoU+99I1k6yGhhNfNx2JWxed6bYZGv4Ifbfp9o1N5fRFPgttebLn1AR
         v0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712740280; x=1713345080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJJluMz+u6UTg8XM641LtNTBq3D7zPplm+46K1BBT3g=;
        b=LAgZi6YAt65RnNqSyfUKVCdE/seQ5XAT/7X4GTlguqX222YGRrcV3Bm+Z2JPVOBArH
         mYTGyOW+wSCmrzMynGM6N4zVTq2sumztdUryl0pVgGjNa2MGtpnIFHcb/w7nmyLzuXCX
         LDrRsC5XF2r0j1jYFxDG3ggowUcdWDeZdR8kYkH9Np0GNFLQqBDUbuvwlVfCLlf7o8WV
         tlBR40NFQVFRkBETfNzGosV+bPH+WEWoxLG4srdezxrTb+wBIL3lnVnCThJeRXX1Am0l
         GRPKOZH/cC3Vkr8uyxJjr9wOZaD1iN3nrZsNNOfbluXXc5rddh7J3YcLZN1yAeWnOsk6
         qDlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVptOpV9dCYHFnfix8p5X2SPyNhsakOzDI+Pcp3eAzJ9u0Q0FEmkaidmtE1mMxBnc1wi3/7YhKZOAk/zu8BSeyzoCpWZpJESFCPfczKD79G
X-Gm-Message-State: AOJu0YxZuD8QBiz4tBkRADB9yTNdC/t2ZldjOwE0Ozz0oRYLgh+vRt76
	bVHvwMRoE3fXO8XBoWt3bGxl0Sg7YATc9uuOUM035QO7hfSqlLA7qpS0/bmoaI8=
X-Google-Smtp-Source: AGHT+IEFPf1rw4WsvUPP4gQ49sbgG/8PoNAGTh7VbYh9f/s9CL9k/Q3vxX6P6qvCn28cWYP3BC7Kuw==
X-Received: by 2002:a5d:5982:0:b0:343:b9e4:ac2a with SMTP id n2-20020a5d5982000000b00343b9e4ac2amr1633081wri.4.1712740280271;
        Wed, 10 Apr 2024 02:11:20 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:d4a6:5856:3e6c:3dff])
        by smtp.gmail.com with ESMTPSA id d6-20020a056000114600b003456c693fa4sm9079086wrx.93.2024.04.10.02.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 02:11:19 -0700 (PDT)
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
Subject: [PATCH 07/10] riscv: add ISA extension parsing for Zcmop
Date: Wed, 10 Apr 2024 11:11:00 +0200
Message-ID: <20240410091106.749233-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410091106.749233-1-cleger@rivosinc.com>
References: <20240410091106.749233-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_021121_906142_57D79431 
X-CRM114-Status: UNSURE (   9.72  )
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

QWRkIHBhcnNpbmcgZm9yIFpjbW9wIElTQSBleHRlbnNpb24gd2hpY2ggd2FzIHJhdGlmaWVkIGlu
IGNvbW1pdApiODU0YTcwOWMwMCAoIlpjbW9wIGlzIHJhdGlmaWVkLzEuMCIpIG9mIHRoZSByaXNj
di1pc2EtbWFudWFsLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2
b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDEgKwogYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCBiNzU1MWJhZDM0MWIuLmNmZjc2
NjBkZTI2OCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCisrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtODYsNiArODYsNyBAQAogI2RlZmlu
ZSBSSVNDVl9JU0FfRVhUX1pDQgkJNzcKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0QJCTc4CiAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkNGCQk3OQorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pDTU9Q
CQk4MAogCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZHCTEyNwogCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMKaW5kZXggMDlkZWUwNzEyNzRkLi5mMTQ1MGNkNzIzMWUgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMKQEAgLTI2NSw2ICsyNjUsNyBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4
dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y2IsIFJJ
U0NWX0lTQV9FWFRfWkNCKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y2QsIFJJU0NWX0lTQV9F
WFRfWkNEKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y2YsIFJJU0NWX0lTQV9FWFRfWkNGKSwK
KwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y21vcCwgUklTQ1ZfSVNBX0VYVF9aQ01PUCksCiAJX19S
SVNDVl9JU0FfRVhUX0RBVEEoemJhLCBSSVNDVl9JU0FfRVhUX1pCQSksCiAJX19SSVNDVl9JU0Ff
RVhUX0RBVEEoemJiLCBSSVNDVl9JU0FfRVhUX1pCQiksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEo
emJjLCBSSVNDVl9JU0FfRVhUX1pCQyksCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
