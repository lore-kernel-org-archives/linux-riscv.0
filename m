Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE12CD6E5D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 12:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+g3YpLLY905xJWo6sKqg+3UhjhduwDGMs/x0Lwrf74k=; b=30RLMpxL0nAXye
	iMH9ZPr/8I/k/3eH6NzO+rMHLpHkQy1ptTFYW4GskgIN1LBC5SxhbZARnFG5o7+QZx44GTg701dtR
	lB7ivIcZFfwkex3y4XzDKjKmMsv/43NFRG/DcLBZ00aWzJKVfT3I4tEGSfXkeBCAPjskZY4fzZ481
	mrlPsaw5DU30W/eSnEL7PY4olItBe30XI3ua/zZAO5J5r5M/O7A5I5CBEwzw3B2WPJSSSScIyhNQh
	upiv+L4QJ4gLxKXxShqWqz28tmF6gVI/WNltO7DjwRq920t8YXs5FaNTntM5RGAjkKY39d70/DHdi
	17/0sFpuBV6HbWyW/fuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqYMG-00FqpZ-2E;
	Wed, 11 Oct 2023 12:30:36 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFM-00FjFu-2K
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 11:19:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-406aaccb41dso18558175e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 04:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023159; x=1697627959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g725wX2RCgDIINxrzRtFutbEjhHX5ADwHJWwZC8SBbE=;
        b=vtqeRNRq9WFOJp2PGqnK0MRAn2Ir0lE3/nNNHrBIat26BV/UjvzKZErY7u8niqVhGh
         EtlRgsMiLrwQowQ7x2AUsOY8Pslgd3SRAWk9MWdpmeVvIILp0AYT1w50TAT7z+855UBB
         egVnktEnVWbHPfZm0KJgpQKwVFVvZUmtoQ79cI5iav7fusF6qwwFcNu1VGAO36ooF3Oy
         PxPApOCxR8kxb18DAElhXfEj7xcrvwpQwpJule8lnUp6wwV2UegFD9/RNFEp7ZiDbfnk
         HjGkjjLyHo+vxX6QX4OiXBWR9CZ4LHd1NnCjjIh82J6oypoVUtI+Nf13Wo7sPqH+l+DH
         GsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023159; x=1697627959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g725wX2RCgDIINxrzRtFutbEjhHX5ADwHJWwZC8SBbE=;
        b=mBThWrpP//hIgyRU4oxz2agDQ4K9ffm41ydNmay2wqYHrvh1nH8UcSFwKkcxCSZ++j
         tDP51YdSwLkgpMQljdiPeaZ4waVTpW5vvecIWs+fomapqy2kw2Mnjc/LT737ks39EbZ+
         dqJjGSLhWqtObrUL8MlXgV1r4UUX//t5fw83PMbY6g9hmDIDaChZFFZyDVSYwszfh1AG
         Dix8zqhFBikUpLBVZYVq4OTq/+Mp0SQIdlUm5gzRG4V47lVPi2MgJD/8ndiNojawlqa9
         pOOjXia90O19+AnkXNVa4bwwQDmGUbFZlj1LG+k6JnjkxXmpIgSOE8TnOh3dNmKivOMC
         d8GQ==
X-Gm-Message-State: AOJu0YwsAn5haTBQby1MTTuVjSSn37MYnO8MWu1eimnDDSngrpS/fz7I
	+ueNn+KD2H9xn6eJVoLpFOOFHsBvfyLHFygTMmpDKw==
X-Google-Smtp-Source: AGHT+IFgom/TIlAu8EKuMky9Jmmxxz32ca6jsPP6UxfW3Jt+YWoUsDLXeIU0gmICwFa4DCfiE/iZ0g==
X-Received: by 2002:a05:600c:450f:b0:405:358c:ba75 with SMTP id t15-20020a05600c450f00b00405358cba75mr18845618wmo.0.1697023158386;
        Wed, 11 Oct 2023 04:19:18 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:18 -0700 (PDT)
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
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v1 05/13] riscv: add ISA extension probing for Zfh/Zfhmin
Date: Wed, 11 Oct 2023 13:14:30 +0200
Message-ID: <20231011111438.909552-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011111438.909552-1-cleger@rivosinc.com>
References: <20231011111438.909552-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_041924_798679_F3FFB7CB 
X-CRM114-Status: UNSURE (   8.55  )
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

QWRkIHByb2JpbmcgZm9yIFp2ZmgvWmZobWluIElTQSBleHRlbnNpb25zWzFdLgoKWzFdIGh0dHBz
Oi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMXozdFFRTG01QUxzQUQ3N1BNMGwwQ0huYXB4V0Nl
VnpQL3ZpZXcKClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5j
LmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAyICsrCiBhcmNoL3Jp
c2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCA0ZTQ2OTgxYWM2YzguLjM1ZjAwNDAx
YWZjOCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCisrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtNzQsNiArNzQsOCBAQAogI2RlZmluZSBS
SVNDVl9JU0FfRVhUX1pWS1NICQk1NgogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS1NHCQk1Nwog
I2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS1QJCTU4CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkZI
CQk1OQorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pGSE1JTgkJNjAKIAogI2RlZmluZSBSSVNDVl9J
U0FfRVhUX01BWAkJNjQKIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVy
ZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCmluZGV4IDg1OWQ2NDdmM2NlZC4u
OWVlNzgxNDY0MWE0IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMK
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCkBAIC0xNzEsNiArMTcxLDggQEAg
Y29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7CiAJX19S
SVNDVl9JU0FfRVhUX0RBVEEoemlmZW5jZWksIFJJU0NWX0lTQV9FWFRfWklGRU5DRUkpLAogCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHppaGludHBhdXNlLCBSSVNDVl9JU0FfRVhUX1pJSElOVFBBVVNF
KSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWhwbSwgUklTQ1ZfSVNBX0VYVF9aSUhQTSksCisJ
X19SSVNDVl9JU0FfRVhUX0RBVEEoemZoLCBSSVNDVl9JU0FfRVhUX1pGSCksCisJX19SSVNDVl9J
U0FfRVhUX0RBVEEoemZobWluLCBSSVNDVl9JU0FfRVhUX1pGSE1JTiksCiAJX19SSVNDVl9JU0Ff
RVhUX0RBVEEoemJhLCBSSVNDVl9JU0FfRVhUX1pCQSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEo
emJiLCBSSVNDVl9JU0FfRVhUX1pCQiksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemJzLCBSSVND
Vl9JU0FfRVhUX1pCUyksCi0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
