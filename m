Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF335C021A5
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 00:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9A14zWLNAgDejW0tr67hMiP71qHL81IK0E1IhPkZvA=; b=PEBrSikd7aItL0
	etRnSjZ+GmVTKs5VcaBUs459nKMWdboxRdn00Vm9QzQicRGcDe8cXbbKcQubcBkqmVgSwp4/AsBqh
	ixm30futfIomModUH1p9CWr4SUkEAS3B26Ho6hjg6uvVS6ZaFu31OIyYvr9hvGOXz6ySs40ckjgIN
	BxP/AJLHy2YzPtv3Uu/95Typf7VOHKQa3968CIZlSQnFW2BElER3AKJe3FLmgdYBkah3Pv7bIFQ/1
	TR1VEkOLxzPh5CHnq9asfp/ZtvkRhDDR6VhLXEslP+3x80JmaiDrK54ueN+TEi/uVKeDhF5EItWvx
	GgCyef3sCFRzIpiucGkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNG6-00000009Ii1-2XQK;
	Thu, 13 Feb 2025 00:39:14 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNG4-00000009IgG-1Qri
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 00:39:13 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-471bc8eaf3fso2325351cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Feb 2025 16:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739407151; x=1740011951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VKAEXIbPsMighQ8qKly+RRtipWoEJVN3H+Ie+l08Lw=;
        b=Wyb0E/1Y5NEhKerHfByRVwTyyeOUZxOIGY0EmGckWaxV1bLj/mk8oo+jFdQ3cLon4v
         AIOmq7x2gzVyitUFZM79Q8xv8B7IYW3/JVZ4rnWQ4OrdkqdhopW2nOSESKURjzBpr0Z/
         U2rOLOnGjZq5H6CLvE+cbRskK+klh7JbEKKoVRiv3o7njK4FNGZhaUEFnY/WKCHLQYNf
         /6EYahgzvQ5d2zUJK6+D3rAO9P+8vPudwAvRTf0hdQFX41W1Vg3+xxfBqcU5guTgPctL
         XZsom3qupEGG1DgxyKcNAt7J6J3Oy4BVRIiHWh5IXLt6gvM6DSmCTMHOLQElE1PXOGuv
         kmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739407151; x=1740011951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VKAEXIbPsMighQ8qKly+RRtipWoEJVN3H+Ie+l08Lw=;
        b=MSs6NQdgN6kf8ogwZtqKbVDmAA52IG3+u8U870SZlJSswGL4MGvfMtDs0eAuu6JCq9
         KOkNDTqPecPvx8NDyMvxnO1NyAmh1OWrIja1dMeGU+/ph7yv8kdX1Txtygpl4CKvZceY
         DjwDozPn2y1N4p1zgASYEMzLMofV8nuIBO8oyG0ZMQiudJaLpjCVybG+8+iu0vdA/LIT
         yoL4ME/Is4GpiejLHZzb1ppDJcTXkQ0D82DgbexR/3TnP491GNzT5wkJhHUOThClCThs
         92I2Xhs/UrGzjpihwg1xVWsTwYmSf4eoWIOVl2ji6Z+VSaifnUNyCBzsPP+yTD1wLXfl
         QTWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhgahX6NtYIc7heLla6roicWLCyxhKti2ZOYoa8enrZ3tk7BuB4MzxaCoT+YFTUrZ83uZhIi6tvTTc3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzF8AwyS+iBowF0w+XfLBc+vp159fQc8K4TJXqTzQLz1qPrpGLH
	SUQJ34rE0bq49IP1b/G3YYftYef9p8POm6lUfFefwf40NekN8a/8
X-Gm-Gg: ASbGncu2r+CbAoWvNv3kWJVzoMSSbTMXaUvn2Kfu9zy82+YKghzfoIVjaTdKRy1KMYw
	FgsxXN4xxwpLT+JR1n6koATMpQApwNu+mmPMlp6a6nNoFad63CmGJvzuPH4t1mUs5Ov0jFB1Ktp
	ZvoZXT25kG0CFmhNIwpHfGONiuXZX9wZnad/NjVhnZU3Ci9dFE6OSE8oNG58crSq8GV4a3iwxNs
	uWNu+reltQ8E+9Uec/vHZ5Xjy9os16FYxc3hb46HXWhr+ihFfPA/5xNX691ISd5pGg=
X-Google-Smtp-Source: AGHT+IHBc4LTnAwtHYivgaNgVKDo5w4ZaLaXgX6Xpv7NQpTgZYGhBYw2IsMuK7NVT7OfDxlvlEfZdw==
X-Received: by 2002:ac8:7dd0:0:b0:471:9174:53ba with SMTP id d75a77b69052e-471afde1e0fmr56132161cf.9.1739407151127;
        Wed, 12 Feb 2025 16:39:11 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-471c2b04b18sm1163941cf.72.2025.02.12.16.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 16:39:10 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 3/3] riscv: hwprobe: export bfloat16 ISA extension
Date: Thu, 13 Feb 2025 08:38:47 +0800
Message-ID: <20250213003849.147358-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213003849.147358-1-inochiama@gmail.com>
References: <20250213003849.147358-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_163912_376838_378500DA 
X-CRM114-Status: GOOD (  10.66  )
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

RXhwb3J0IFpmYm1pbiwgWnZmYmZtaW4sIFp2ZmJmd21hIElTQSBleHRlbnNpb24gdGhyb3VnaCBo
d3Byb2JlLgoKU2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQGdtYWlsLmNv
bT4KUmV2aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0t
CiBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgIHwgMTIgKysrKysrKysrKysr
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgIDMgKysrCiBhcmNoL3Jp
c2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgIHwgIDMgKysrCiAzIGZpbGVzIGNoYW5nZWQs
IDE4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3Yv
aHdwcm9iZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKaW5kZXgg
ZjI3M2VhMTVhOGU4Li5mZWVmZTVlYTI0ZWEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vYXJj
aC9yaXNjdi9od3Byb2JlLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9i
ZS5yc3QKQEAgLTI0Miw2ICsyNDIsMTggQEAgVGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVk
OgogICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9TVVBNYDogVGhlIFN1cG0gZXh0ZW5z
aW9uIGlzIHN1cHBvcnRlZCBhcwogICAgICAgIGRlZmluZWQgaW4gdmVyc2lvbiAxLjAgb2YgdGhl
IFJJU0MtViBQb2ludGVyIE1hc2tpbmcgZXh0ZW5zaW9ucy4KIAorICAqIDpjOm1hY3JvOmBSSVND
Vl9IV1BST0JFX0VYVF9aRkJGTUlOYDogVGhlIFpmYmZtaW4gZXh0ZW5zaW9uIGlzIHN1cHBvcnRl
ZCBhcworICAgICAgIGRlZmluZWQgaW4gdGhlIFJJU0MtViBJU0EgbWFudWFsIHN0YXJ0aW5nIGZy
b20gY29tbWl0IDRkYzIzZDYyMjlkZQorICAgICAgICgiQWRkZWQgQ2hhcHRlciB0aXRsZSB0byBC
RjE2IikuCisKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlZGQkZNSU5gOiBUaGUg
WnZmYmZtaW4gZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCBhcworICAgICAgIGRlZmluZWQgaW4gdGhl
IFJJU0MtViBJU0EgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0IDRkYzIzZDYyMjlkZQorICAg
ICAgICgiQWRkZWQgQ2hhcHRlciB0aXRsZSB0byBCRjE2IikuCisKKyAgKiA6YzptYWNybzpgUklT
Q1ZfSFdQUk9CRV9FWFRfWlZGQkZXTUFgOiBUaGUgWnZmYmZ3bWEgZXh0ZW5zaW9uIGlzIHN1cHBv
cnRlZCBhcworICAgICAgIGRlZmluZWQgaW4gdGhlIFJJU0MtViBJU0EgbWFudWFsIHN0YXJ0aW5n
IGZyb20gY29tbWl0IDRkYzIzZDYyMjlkZQorICAgICAgICgiQWRkZWQgQ2hhcHRlciB0aXRsZSB0
byBCRjE2IikuCisKICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IERl
cHJlY2F0ZWQuICBSZXR1cm5zIHNpbWlsYXIgdmFsdWVzIHRvCiAgICAgIDpjOm1hY3JvOmBSSVND
Vl9IV1BST0JFX0tFWV9NSVNBTElHTkVEX1NDQUxBUl9QRVJGYCwgYnV0IHRoZSBrZXkgd2FzCiAg
ICAgIG1pc3Rha2VubHkgY2xhc3NpZmllZCBhcyBhIGJpdG1hc2sgcmF0aGVyIHRoYW4gYSB2YWx1
ZS4KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCmluZGV4IGMzYzFjYzk1MWNiOS4u
ZTRlMjg2YzYzNjI5IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdw
cm9iZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKQEAgLTcz
LDYgKzczLDkgQEAgc3RydWN0IHJpc2N2X2h3cHJvYmUgewogI2RlZmluZQkJUklTQ1ZfSFdQUk9C
RV9FWFRfWkNNT1AJCSgxVUxMIDw8IDQ3KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkFX
UlMJCSgxVUxMIDw8IDQ4KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfU1VQTQkJKDFVTEwg
PDwgNDkpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aRkJGTUlOCSgxVUxMIDw8IDUwKQor
I2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlZGQkZNSU4JKDFVTEwgPDwgNTEpCisjZGVmaW5l
CQlSSVNDVl9IV1BST0JFX0VYVF9aVkZCRldNQQkoMVVMTCA8PCA1MikKICNkZWZpbmUgUklTQ1Zf
SFdQUk9CRV9LRVlfQ1BVUEVSRl8wCTUKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05F
RF9VTktOT1dOCSgwIDw8IDApCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1V
TEFURUQJKDEgPDwgMCkKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2Jl
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCmluZGV4IGJjZDNiODE2MzA2Yy4u
Zjc2MTYzOTU4ZTI3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5j
CisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKQEAgLTEzMiw2ICsxMzIsOCBA
QCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWly
LAogCQkJRVhUX0tFWShaVkU2NEQpOwogCQkJRVhUX0tFWShaVkU2NEYpOwogCQkJRVhUX0tFWSha
VkU2NFgpOworCQkJRVhUX0tFWShaVkZCRk1JTik7CisJCQlFWFRfS0VZKFpWRkJGV01BKTsKIAkJ
CUVYVF9LRVkoWlZGSCk7CiAJCQlFWFRfS0VZKFpWRkhNSU4pOwogCQkJRVhUX0tFWShaVktCKTsK
QEAgLTE0OCw2ICsxNTAsNyBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCBy
aXNjdl9od3Byb2JlICpwYWlyLAogCQkJRVhUX0tFWShaQ0QpOwogCQkJRVhUX0tFWShaQ0YpOwog
CQkJRVhUX0tFWShaRkEpOworCQkJRVhUX0tFWShaRkJGTUlOKTsKIAkJCUVYVF9LRVkoWkZIKTsK
IAkJCUVYVF9LRVkoWkZITUlOKTsKIAkJfQotLSAKMi40OC4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
