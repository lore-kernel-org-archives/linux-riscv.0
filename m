Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED66C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bpv0xQ33BXt++08AXX/aBg6gsJ/I9d7xsB2AQvOkT9g=; b=4ErTpCNXhuHT8V
	G/batjZYq+L+Z/vhqJK8IXT+SAhoihbZeKeLSQGzf8x9rkHUsuVi7rvCYCncnX8eUANz3Ex5YWMxp
	g0W4SQU92zEzXFABxvQiAEugxS0XFzb0aJ/2p8EWC5u27eAV2qb9Jno6An7f1RC1q/95u6FsjMDiA
	zw6McMq1LpvSwcXU/Z8suoR59fRNcAd0p9MHX8osvWinLeH0wI3T25ixOuGtq3IdRF+fJafLwzoB0
	mrAFfrMPDufPgh2Z6RLmqqKHjvLIM5Wc2wLEUyeMjhkdrvW7xwLUPHZqd9RwnAt2xdi/x2O52JbRk
	kJxAvh97hQ4O4LJsoc3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkc-00197W-2Y;
	Tue, 07 Nov 2023 10:56:06 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JkZ-00195q-3A
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 10:56:05 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32f8246103cso1245160f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 02:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354561; x=1699959361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWXszjrW0mqtPT5ge0XuiGQJ6aaCxrPofMKEXjPvYnQ=;
        b=xJSABzs6oJEQAH7Jzpr0F2T9a8FphyxO8kRU8392181+LlRCSXC/0nPVrchmtbQtpO
         lkhPGnQQKIZdlGyliRA6476yzWGIx+0w6oNJWCtX68zBY46j75OV3SdX4wtD9VSQPhoJ
         wApOLhyOfgur6njsRfC5NE+01wD9x8quOlThRZa6kT7b2uk+JV/RzmEd7btc3t9+2ZET
         qIHgIgl2GPrfrLA4/k0oo1ZCrim9yfOIawz1+XRpH/BlijMR6Ct7FLkqeOWNaQEhqqyT
         /TsWe/9ZCV0EOA48hk93l6enqrEOTMTKCTd9PTtBoLZ1X+19Rzjz90L24DXakWF+xIjh
         kQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354561; x=1699959361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWXszjrW0mqtPT5ge0XuiGQJ6aaCxrPofMKEXjPvYnQ=;
        b=ep7XQtbu0m0AtYORNwhqiCzqKAeF5YRdj+ZSq8c7pnwsbNRroWP8IWiiVEPKNz78NL
         RkeBUcgXcWNSu1/Z+B7rWMmQpVdYTgT0arc8Y/FynzRZIm81LT8hB0SqGLNldhFjRGNa
         k2Y83W8sgL2UvgKXWXsXpS7ITUKs5AgYilrooLACtDuZ++6LObloMF/W28tcoz6fkbno
         FMGypX4HVr7YF41Jln3svAqhn0cKOGxADcc59sTR7q9PbDaxag+F8p7rvqAs5sMdUlED
         WATFgBeTEqJoHF18b2yoKTSy0/Py4VQtUwpjYJu9f0o9GBZV6PLIkGKkbW5hoCAtZa0Q
         ebzw==
X-Gm-Message-State: AOJu0YyVre/zVLZ/7RRlMoxOFpOrtliXoZYZEOqHb9gkVZSqPRW9TFsP
	WuHP6Unx5j0lHQy5YSXmucsIxwpG1+2x5rz8BirXJg==
X-Google-Smtp-Source: AGHT+IGuavTtsmwxI8/q0+XaTOH3JqZmAYfCgV3LA6iUJWNnV+0tLfzziM9Sx1y+OIsrf624uUG+Gg==
X-Received: by 2002:a05:600c:418a:b0:3fe:d637:7b25 with SMTP id p10-20020a05600c418a00b003fed6377b25mr25010147wmh.0.1699354561462;
        Tue, 07 Nov 2023 02:56:01 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:00 -0800 (PST)
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
Subject: [PATCH v3 01/20] riscv: hwprobe: factorize hwprobe ISA extension reporting
Date: Tue,  7 Nov 2023 11:55:37 +0100
Message-ID: <20231107105556.517187-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_025604_024667_F933E384 
X-CRM114-Status: GOOD (  12.61  )
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

RmFjdG9yaXplIElTQSBleHRlbnNpb24gcmVwb3J0aW5nIGJ5IHVzaW5nIGEgbWFjcm8gcmF0aGVy
IHRoYW4KY29weS9wYXN0aW5nIGV4dGVuc2lvbiBuYW1lcy4gVGhpcyB3aWxsIGFsbG93IGFkZGlu
ZyBuZXcgZXh0ZW5zaW9ucyBtb3JlCmVhc2lseS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzD
qWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEV2YW4gR3JlZW4gPGV2YW5A
cml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jIHwgMzIgKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9z
eXNfcmlzY3YuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCmluZGV4IGI2NTFlYzY5
OGE5MS4uNDlhYTRlODI3OTdjIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlz
Y3YuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwpAQCAtMTQ1LDIwICsxNDUs
MjQgQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAq
cGFpciwKIAlmb3JfZWFjaF9jcHUoY3B1LCBjcHVzKSB7CiAJCXN0cnVjdCByaXNjdl9pc2FpbmZv
ICppc2FpbmZvID0gJmhhcnRfaXNhW2NwdV07CiAKLQkJaWYgKHJpc2N2X2lzYV9leHRlbnNpb25f
YXZhaWxhYmxlKGlzYWluZm8tPmlzYSwgWkJBKSkKLQkJCXBhaXItPnZhbHVlIHw9IFJJU0NWX0hX
UFJPQkVfRVhUX1pCQTsKLQkJZWxzZQotCQkJbWlzc2luZyB8PSBSSVNDVl9IV1BST0JFX0VYVF9a
QkE7Ci0KLQkJaWYgKHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYWluZm8tPmlzYSwg
WkJCKSkKLQkJCXBhaXItPnZhbHVlIHw9IFJJU0NWX0hXUFJPQkVfRVhUX1pCQjsKLQkJZWxzZQot
CQkJbWlzc2luZyB8PSBSSVNDVl9IV1BST0JFX0VYVF9aQkI7Ci0KLQkJaWYgKHJpc2N2X2lzYV9l
eHRlbnNpb25fYXZhaWxhYmxlKGlzYWluZm8tPmlzYSwgWkJTKSkKLQkJCXBhaXItPnZhbHVlIHw9
IFJJU0NWX0hXUFJPQkVfRVhUX1pCUzsKLQkJZWxzZQotCQkJbWlzc2luZyB8PSBSSVNDVl9IV1BS
T0JFX0VYVF9aQlM7CisjZGVmaW5lIENIRUNLX0lTQV9FWFQoX19leHQpCQkJCQkJCVwKKwkJZG8g
ewkJCQkJCQkJXAorCQkJaWYgKHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYWluZm8t
PmlzYSwgX19leHQpKQlcCisJCQkJcGFpci0+dmFsdWUgfD0gUklTQ1ZfSFdQUk9CRV9FWFRfIyNf
X2V4dDsJXAorCQkJZWxzZQkJCQkJCQlcCisJCQkJbWlzc2luZyB8PSBSSVNDVl9IV1BST0JFX0VY
VF8jI19fZXh0OwkJXAorCQl9IHdoaWxlIChmYWxzZSkKKworCQkvKgorCQkgKiBPbmx5IHVzZSBD
SEVDS19JU0FfRVhUKCkgZm9yIGV4dGVuc2lvbnMgd2hpY2ggYXJlIHVzYWJsZSBieQorCQkgKiB1
c2Vyc3BhY2Ugd2l0aCByZXNwZWN0IHRvIHRoZSBrZXJuZWwgY3VycmVudCBjb25maWd1cmF0aW9u
LgorCQkgKiBGb3IgaW5zdGFuY2UsIElTQSBleHRlbnNpb25zIHRoYXQgdXNlIGZsb2F0IG9wZXJh
dGlvbnMKKwkJICogc2hvdWxkIG5vdCBiZSBleHBvc2VkIHdoZW4gQ09ORklHX0ZQVSBpcyBub3Qg
ZW5hYmxlZC4KKwkJICovCisJCUNIRUNLX0lTQV9FWFQoWkJBKTsKKwkJQ0hFQ0tfSVNBX0VYVCha
QkIpOworCQlDSEVDS19JU0FfRVhUKFpCUyk7CisjdW5kZWYgQ0hFQ0tfSVNBX0VYVAogCX0KIAog
CS8qIE5vdyB0dXJuIG9mZiByZXBvcnRpbmcgZmVhdHVyZXMgaWYgYW55IENQVSBpcyBtaXNzaW5n
IGl0LiAqLwotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
