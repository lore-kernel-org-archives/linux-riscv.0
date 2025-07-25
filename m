Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255D0C87FCF
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 16:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YR8xX7hrVbqpYZptudzTsi30maR+oo/hABDf45fewr4=; b=wYd1lv/dQKqbmF
	rjc/qkC0DkcbfDTLuVklXoDeMlvzkZSFXLPdI36v6FNR/wuczQ1xOKsNVZCqYpefDnjNB9KRw0akW
	vWazMl/YD3obpG2CDV8hs4Oy3W3XATM8G/wRK4cIpUKrako+G6rKwoh38oRNOqgdQjMdH+P5niArO
	dZtpSC7jEkHJ13+qvlDsxZII85RTAV5z7vekXV2aU1QnWStpgKwQqnOHp/Xjj0MlhpV7aqsMwsluP
	JssYHlZp6EPmf6W8js53LTgU7Lz/yByhrY78/Yfr0L30aNzHig4MG4oGKq0SqZ78k73fa1S8xwNn3
	ojrAPNblunWxRPUxAUEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLl0-0000000AGxM-2JeE;
	Fri, 25 Jul 2025 16:58:54 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLjE-0000000AGd0-1JDm
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 16:57:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-456053b5b8cso1051745e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 09:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753462622; x=1754067422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nu92pVnSGWyGOs+NZnSegiv1w6Yea+eMpYHDq7DsV5Y=;
        b=hBOPvv0Umui1C4iYT05DWABjw6XZot4NDLaGQRq1igKaJfAU1l+paXfHHrdXb3bKGN
         3puAQ64mpvuVNSleNqdcVPwdlYGGbCxQ18dVg++sTZy/JkixKBqLCAx5h39FWJpzl9Dz
         onwG9U3X+MnINJiVJVENqwioHAhJMG6k184d2h3JI+OJ6rqwCxLIZ7O9o4TNZA8ijfAy
         X9+jPsYF0WBQrkD+sWP+3bW5S2mX3HobJybBS2teqJkOq0bMWzDeCktLV0PioSSTcwjZ
         T6tyVnvR5iZGsAeqfhFcrlayyCMU4zTGJ1EnvKLESENbJdE8lkqJq2g6oUCUDXEQvnyK
         d4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753462622; x=1754067422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nu92pVnSGWyGOs+NZnSegiv1w6Yea+eMpYHDq7DsV5Y=;
        b=FtuwReRjEu64mI8ZpSNWLQ6Sy4L2F/yRLp5yioxWLNXEfjZl5LMXdPWwOTW4F3tCG1
         LX1J0egOmlYhi7D3qpyEyL0QnypE92McugTOxafjmSnqQ88F/MYDNxvzozW4ybgwjDd4
         XcYsJ0cAqD4BoaeBKooHXTjbkyj37oqARzVbXcO4GqpEl/wAkG0wmmsyrW1B46Xa2W5i
         5Aotr1XjlEpWP9U5QG3eUWkdVHSxAAsqNug3S6bK9YNSmZIrb0gwQtVxsyeiJvjH4o/Z
         3mS2Gyg8dosvthexvmHUyuQz2Y0Lq38q/JZZ0uELf7hxSX0fsFW1B6s2NxIljnL0hL6h
         8yfQ==
X-Gm-Message-State: AOJu0YycHMUaLWekUezmAd31pINyWjFbJShdSrl2DjGC3w8qdKO5xzrJ
	Dqb7xG62peg2bvvIs2c7GwrTQLuE3JsqzG+X794nEI9Isk72LtGP2DqoteCWL1/HC6HzhNCgXyq
	EcW9I
X-Gm-Gg: ASbGncuNPL0LgrYVe3LOfPefqRh1VcubxBqsBx3ANc68m0ZQAoQHEK3yjh+NYwIsT8+
	5y6DZM/+wf0JqfU5mrESnfVZA0acN3yuiZ85tOYFJsn2/y+cD4Tw39cxhIu3Kp+Pv1UWx/3Te1y
	LurfG3zfdFC2/SUl9XU0ut/g+VViT0nv0c2hS4GA2R2LpfJt2h3zM02Ug+An0l3nWXCGmJNbW/U
	gwSq0Umt4Wf+opFMMkbiGm4b/y0dVv4oCo6bhWxtaodYCZcy26351DH4jj7j80WMIZhSlg6U1k6
	qGoItTuittVqqvxlCs0/uXP4nJs3wWT1q0fVtKDGKOZSqtvUvcedMS1Z7WXtEnOtd53+5z/zLq1
	MCJI2bWuUlYGGh3FJfwvZXhsXjIpNdA==
X-Google-Smtp-Source: AGHT+IGLDnI7S2DxdD4vV12toUgj+4yMXj/sNb0KZhkdWDQvG5ZTMV5h/+RVkNNZKk1RId3rYnFmdQ==
X-Received: by 2002:a05:600c:3507:b0:456:4bb5:c956 with SMTP id 5b1f17b1804b1-458766c1d21mr10060865e9.7.1753462622148;
        Fri, 25 Jul 2025 09:57:02 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8c15:2281:5347:b367])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b778ec36bcsm380333f8f.37.2025.07.25.09.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 09:57:01 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>,
	stable@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 2/4] riscv: use lw when reading int cpu in asm_per_cpu
Date: Fri, 25 Jul 2025 18:54:10 +0200
Message-ID: <20250725165410.2896641-5-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250725165410.2896641-3-rkrcmar@ventanamicro.com>
References: <20250725165410.2896641-3-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_095704_348933_27C96270 
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

UkVHX0wgaXMgd3JvbmcsIGJlY2F1c2UgdGhyZWFkX2luZm8uY3B1IGlzIDMyLWJpdCwgbm90IHhs
ZW4tYml0IHdpZGUuClRoZSBzdHJ1Y3QgY3VycmVudGx5IGhhcyBhIGhvbGUgYWZ0ZXIgY3B1LCBz
byBsaXR0bGUgZW5kaWFuIGFjY2Vzc2VzCnNlZW1lZCBmaW5lLgoKRml4ZXM6IGJlOTdkMGRiNWY0
NCAoInJpc2N2OiBWTUFQX1NUQUNLIG92ZXJmbG93IGRldGVjdGlvbiB0aHJlYWQtc2FmZSIpCkNj
OiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8
YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxy
a3JjbWFyQHZlbnRhbmFtaWNyby5jb20+Ci0tLQp2Mjogc3BsaXQgZm9yIHN0YWJsZSBbQWxleF0K
LS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9hc20uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmgKaW5kZXggYThh
MmFmNmRmZTlkLi4yYTE2ZTg4ZTEzZGUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vYXNtLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20uaApAQCAtOTEsNyArOTEs
NyBAQAogI2VuZGlmCiAKIC5tYWNybyBhc21fcGVyX2NwdSBkc3Qgc3ltIHRtcAotCVJFR19MIFx0
bXAsIFRBU0tfVElfQ1BVX05VTSh0cCkKKwlsdyAgICBcdG1wLCBUQVNLX1RJX0NQVV9OVU0odHAp
CiAJc2xsaSAgXHRtcCwgXHRtcCwgUEVSX0NQVV9PRkZTRVRfU0hJRlQKIAlsYSAgICBcZHN0LCBf
X3Blcl9jcHVfb2Zmc2V0CiAJYWRkICAgXGRzdCwgXGRzdCwgXHRtcAotLSAKMi41MC4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
