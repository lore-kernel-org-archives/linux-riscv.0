Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2F7C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 15:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ViCYFX3GIMJS68wet1iHcKWnbdQ0v4ah4uCpitUZ4js=; b=xUXhwKFQfN7x5r
	GTjxKFmY43y1YCCQ6O2qpPRJGRQ6LI525Y1L/bW+wJUVXQhZhhkDlC/EIsWp7M1Qeif/n7IbotN5M
	PJMRP56f/oykhwX42WNg6i5jBOT3epuHzrtF+ZoVf2IqalGarwIaCXo3QkL/j0fY7rwAVyFu8Avk2
	Zq/WnW334ZVjZjrFlHE6DAJtjhzGq4ql0UKIR5IS5EPqpMvMrT99txu60EszrZ0bJ1fk4MKgnmq8s
	aeaT+C4V8TusKVzPF13TvqLqIRJVipyY4B7f67aPsbMDzJMqaqU7O/k4sv6E0W8eXnW7R9wvhR5xg
	zCRjyWK209vF8G4r8mPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyxB-000KL8-0p;
	Wed, 20 Dec 2023 15:57:49 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyx8-000KJP-0U
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 15:57:47 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50e3803643cso880005e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 07:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703087863; x=1703692663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szFuFOaVPRcoa/3KGK9k9VHnKNMXDyjWXMloTHpkWuA=;
        b=h3lGsOtpexre2/3wOk6+1GgVKM0OHAeIksVmusjjuhwlBDh7vDQHFVbF8jW0oEKJ/V
         ZRWDiAPexAKaS8qQqvP6FSuYuiVMaHZowjIiah/3lKvZ5BwXkzbWpA9LEMMaMf1Ea/CB
         H7yRCZz/VZDIFpCzWm1VsCsqwVn+YwjXnN4ATuIX+mPR+uuDR9YuTc0qY49RxayT/MsJ
         F0lPr4WfWvXG/WxYKVMajV5MjB2jkn7WZXN8GyoDURLK8y6FewG04r7cSUTyrbpx7/H+
         BrCqKGonp9VPJdbv37IC9YBM2o5gawGZK+UgAadeiXwwZvnFTdrBXXx/aan3aUXMvpIv
         jHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703087863; x=1703692663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szFuFOaVPRcoa/3KGK9k9VHnKNMXDyjWXMloTHpkWuA=;
        b=rQIHo+aSrSKriDRhrI67eVc0Zrhhst8jLq96qHaJ1TlRqwtYlGkQpfT6Jn2eYZ+sms
         +SE1Eco40NHdXutilFOGkeCVkXbyp8C9XRYJ/xlxro229aCA8Gll2TEr3gOyjWc2LX/c
         dcyR+us22e/hnteLXyOprIiOMS46Xwdxapm7Qzt0rQWiCFB77UWv8Y8e87Cxy1cq+JFR
         wGzgwWpaqI5unhR4Mt/epqL3bC1E6fCZ2Bb83yN6co6PmUJ+BqbZZAp7GiT7Bp1+s/au
         RbXzH5x1VSTp8fzunkPzxyvYH3EYDPTYLsR+ThuOXUQZKcXh/Q86FH0n0RLy1+LSZ8kt
         r7zw==
X-Gm-Message-State: AOJu0YxMrSEuy1y9VIPoOwSZjBnWVfVm7OUG50Df53SruHmDlsTMFVNI
	ssoU/ffJ2sXcSJ2rA1mSbI31jQ==
X-Google-Smtp-Source: AGHT+IEMopGLd13u7V/5vIZqrC6QZYkg9U757Xi60NRR7tKxLQz11Pc5U0+SfTyL2OoD9i8imBIJRw==
X-Received: by 2002:a05:6512:1592:b0:50e:4ec1:7d2e with SMTP id bp18-20020a056512159200b0050e4ec17d2emr2327025lfb.2.1703087863205;
        Wed, 20 Dec 2023 07:57:43 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:3eae:b70:f27f:7aa1])
        by smtp.gmail.com with ESMTPSA id h18-20020adffd52000000b003366af9d611sm7279693wrs.22.2023.12.20.07.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:57:42 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/6] dt-bindings: riscv: add Zacas ISA extension description
Date: Wed, 20 Dec 2023 16:57:19 +0100
Message-ID: <20231220155723.684081-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220155723.684081-1-cleger@rivosinc.com>
References: <20231220155723.684081-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_075746_186824_DA092E39 
X-CRM114-Status: UNSURE (   8.76  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgWmFjYXMgSVNBIGV4dGVuc2lvbiB3aGljaCB3YXMgcmF0
aWZpZWQgcmVjZW50bHkuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+CkFja2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2No
aXAuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRl
bnNpb25zLnlhbWwgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRl
bnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0
ZW5zaW9ucy55YW1sCmluZGV4IDM1NzRhMGI3MGJlNC4uMjdiZWVkYjk4MTk4IDEwMDY0NAotLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1s
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25z
LnlhbWwKQEAgLTE3MSw2ICsxNzEsMTIgQEAgcHJvcGVydGllczoKICAgICAgICAgICAgIG1lbW9y
eSB0eXBlcyBhcyByYXRpZmllZCBpbiB0aGUgMjAxOTEyMTMgdmVyc2lvbiBvZiB0aGUgcHJpdmls
ZWdlZAogICAgICAgICAgICAgSVNBIHNwZWNpZmljYXRpb24uCiAKKyAgICAgICAgLSBjb25zdDog
emFjYXMKKyAgICAgICAgICBkZXNjcmlwdGlvbjogfAorICAgICAgICAgICAgVGhlIFphY2FzIGV4
dGVuc2lvbiBmb3IgQXRvbWljIENvbXBhcmUtYW5kLVN3YXAgKENBUykgaW5zdHJ1Y3Rpb25zCisg
ICAgICAgICAgICBpcyBzdXBwb3J0ZWQgYXMgcmF0aWZpZWQgYXQgY29tbWl0IDUwNTllMGNhNjQx
YyAoInVwZGF0ZSB0bworICAgICAgICAgICAgcmF0aWZpZWQiKSBvZiB0aGUgcmlzY3YtemFjYXMu
CisKICAgICAgICAgLSBjb25zdDogemJhCiAgICAgICAgICAgZGVzY3JpcHRpb246IHwKICAgICAg
ICAgICAgIFRoZSBzdGFuZGFyZCBaYmEgYml0LW1hbmlwdWxhdGlvbiBleHRlbnNpb24gZm9yIGFk
ZHJlc3MgZ2VuZXJhdGlvbgotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
