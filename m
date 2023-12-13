Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2AFC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 11:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HFUdyYLDT9BJQeSgTBSzxs0ifh8vvh2n5fOH4aw89Tk=; b=fKz9gV6W4X42NT
	YcP8AZgP6Yhncsg0nZz3FH+NyuwKs13y/erZbpFhExunagu82FdIB0w5y6Kt/sDEv7FjfKNEPE0Kd
	pSs5lktF13MxeIjMOLHycJIFZZW/xjmsXhK5kqEcl6rCK1SgvsQ4FBCLkPjpkOcTbDbC2WHpK2r7c
	+LuKV/0NKo7QPG4LjGTgrwm09+wXS3pPtK2HudHQq8ZzeMggMaxIKSRQ1slBRip3mexbi6GLfPjqf
	xsOO14b3OW3fDfz3vTH3lAhsh0W7yf/Nd1FGLMy4dhu+XZItdiYDrHg/wNIwIdDyl2h4dRzREQI9T
	I3V1t9tGLR9s3fwu44fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUY-00ETDJ-1d;
	Wed, 13 Dec 2023 11:33:30 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUR-00ET6J-0F
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 11:33:25 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c495ab68cso5702055e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 03:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702467202; x=1703072002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKPObWVuIFXSRwOfIm7U25jwf++f1sQGlTYA9JTEt2I=;
        b=t/+2ggXaZKSpwgQtXCuM19+rZZDXttGdPUwlRwarN4R5amsC5EceqmSgwwIb/kz9Sj
         LtAssTvPxQyfR3QGPnUBmAUcPA7Fv8PNXoqj9C387tizs2ydHSA4k9WK+mgkc38L8bdU
         60KlD/3b19I/6EM5XgjdRSFcbfftBE+7XdjVPQJB+964hNYHuricGv+0o1hT5WpKigk5
         6o5in9taEq98HEyPkSroL0nukDFFcJSiyAkskqoPqELmKbufwpqGZAr9lzjEPkKEetbz
         5ZeFpghs4JTJNsbQYBMSrFKk+pbJ5VXHTfxkZQjJEJzodEeJy3ErxSxmYkPOluvWzW2Q
         Px5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467202; x=1703072002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKPObWVuIFXSRwOfIm7U25jwf++f1sQGlTYA9JTEt2I=;
        b=nVwGw2WvmX6lm2ZRs5mCwWmxxE/vKCZnShUOOroyExmnXTgE66IjMeGI29c/T7GKdT
         bAlzZ2Jq1YO3tstpLHMCY+nbbH9n0q8luHP66P5us2Z5jHdJV2pVjMfEm0s6lsifP14v
         WM7reUtCEZQcLIBFBJMn1NwaPckoD4Y9wK/c9+PA5jhHyREMHm6cPFITIlOfiwsWYMGP
         3s/BGm6xfNib1X5JYKq9Ie85fqFzEUk/MCCyXlJFMwDt+6iyIEUX8yVy4Hl8fUAn5JBB
         fF4F/GkocZeFeLD1fMG5Nub5FPT4XU207/BdHGZ+nvT2fXIry7oDW6bLRZcYbc0cQhuY
         QeeQ==
X-Gm-Message-State: AOJu0YxW8fnDakIO0YzckUZIxV3tIdJai5ytnq78B16/kI4SULIqtDYa
	+UqtY8V/LpdNvTn68ZxPIbxMGw==
X-Google-Smtp-Source: AGHT+IFOAi6+jGGEZI3vEUxmpFwncaq2mLgc0WthEtql1NhoQKa77IbEBEbBVUbFXF2l0uTI44prGg==
X-Received: by 2002:a05:600c:3b23:b0:40c:2631:7c3d with SMTP id m35-20020a05600c3b2300b0040c26317c3dmr9593791wms.2.1702467201829;
        Wed, 13 Dec 2023 03:33:21 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:c564:f167:d072:5672])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm22433137wms.30.2023.12.13.03.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:33:21 -0800 (PST)
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
	Robbin Ehn <rehn@rivosinc.com>
Subject: [PATCH 9/9] riscv: hwprobe: export Zicond extension
Date: Wed, 13 Dec 2023 12:33:05 +0100
Message-ID: <20231213113308.133176-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213113308.133176-1-cleger@rivosinc.com>
References: <20231213113308.133176-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_033323_129096_8E842BC5 
X-CRM114-Status: GOOD (  10.53  )
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

RXhwb3J0IHRoZSB6aWNvbmQgZXh0ZW5zaW9uIHRvIHVzZXJzcGFjZSB1c2luZyBod3Byb2JlLgoK
U2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0K
IERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCA1ICsrKysrCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9z
eXNfcmlzY3YuYyAgICAgICAgIHwgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0Rv
Y3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAppbmRleCA1MTBlNDk4Nzg4MzQuLmE0
MmMzYjVkNmJjMyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUu
cnN0CisrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdApAQCAtMTcyLDYg
KzE3MiwxMSBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRlZmluZWQ6CiAgICAgICAgZGVmaW5l
ZCBpbiB0aGUgQXRvbWljIENvbXBhcmUtYW5kLVN3YXAgKENBUykgaW5zdHJ1Y3Rpb25zIG1hbnVh
bCBzdGFydGluZwogICAgICAgIGZyb20gY29tbWl0IDUwNTllMGNhNjQxYyAoInVwZGF0ZSB0byBy
YXRpZmllZCIpLgogCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pJQ09ORGA6IFRo
ZSBaaWNvbmQgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCBhcworICAgICAgIGRlZmluZWQgaW4gdGhl
IFJJU0MtViBJbnRlZ2VyIENvbmRpdGlvbmFsIChaaWNvbmQpIG9wZXJhdGlvbnMgZXh0ZW5zaW9u
CisgICAgICAgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0IDk1Y2YxZjkgKCJBZGQgY2hhbmdl
cyByZXF1ZXN0ZWQgYnkgVmVkCisgICAgICAgZHVyaW5nIHNpZ25vZmYiKQorCiAqIDpjOm1hY3Jv
OmBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzBgOiBBIGJpdG1hc2sgdGhhdCBjb250YWlucyBw
ZXJmb3JtYW5jZQogICBpbmZvcm1hdGlvbiBhYm91dCB0aGUgc2VsZWN0ZWQgc2V0IG9mIHByb2Nl
c3NvcnMuCiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2Jl
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCmluZGV4IDdlYzQzMzEx
MjJlNy4uNDI4N2FhMzkxY2Y1IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgK
QEAgLTU5LDYgKzU5LDcgQEAgc3RydWN0IHJpc2N2X2h3cHJvYmUgewogI2RlZmluZQkJUklTQ1Zf
SFdQUk9CRV9FWFRfWlRTTwkJKDFVTEwgPDwgMzMpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VY
VF9aQU0JCSgxVUxMIDw8IDM0KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkFDQVMJCSgx
VUxMIDw8IDM1KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWklDT05ECSgxVUxMIDw8IDM2
KQogI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzAJNQogI2RlZmluZQkJUklTQ1Zf
SFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV04JKDAgPDwgMCkKICNkZWZpbmUJCVJJU0NWX0hXUFJP
QkVfTUlTQUxJR05FRF9FTVVMQVRFRAkoMSA8PCAwKQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvc3lzX3Jpc2N2LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwppbmRleCBh
YmIwZWVhM2VlMDguLmQ5NGYxMTUzNGVmYSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
c3lzX3Jpc2N2LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKQEAgLTE3Nyw2
ICsxNzcsNyBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3By
b2JlICpwYWlyLAogCQlFWFRfS0VZKFpUU08pOwogCQlFWFRfS0VZKFpBTSk7CiAJCUVYVF9LRVko
WkFDQVMpOworCQlFWFRfS0VZKFpJQ09ORCk7CiAKIAkJaWYgKGhhc192ZWN0b3IoKSkgewogCQkJ
RVhUX0tFWShaVkJCKTsKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
