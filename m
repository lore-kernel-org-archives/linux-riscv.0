Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269A5C41535
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 14:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ynnqS0cy1R0P8HuEsaNLA6qZapYauU1pk/73pSUxgb0=; b=RBQeH1YeGEpfii
	R+P/K+00AHaSn3JZpkV/YYKBR7wMUmo26kgPJRaJjfXNbX3o8+wAo2cPoYZxAU9mzdL+gRGFLpCB7
	LE/LUuNkyFtoO6NJX3jobS3bz/G9UWVWBIk/mBVquci5nsGFX60PQQzT/jRg06goIQoj1Ujo7YXOn
	UK5lVS46gfaDLEdIOWasdJPjKoe0MCmBRubpIgL6hKycgLMQY9xjW9TcEnpSq0Eai6A3iCRhuuINH
	BOV2jGR/RYFZGm57FWUBbZv3MidzyKl4vRLpGg8TokeruzfxjUaG2IMq7lfVtNiRTEshkaJ0z97sm
	r7wL32XN9losppI0zPFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAh-00G8tR-1k;
	Tue, 14 Nov 2023 14:13:43 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAc-00G8oJ-21
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:13:40 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-778a25cad6dso14498985a.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971215; x=1700576015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkOxZJ0AR04vpaXdb9zeN8RXHX4RQvWz8fPabjRmmO0=;
        b=NShb4IFZpDCj9Zj3OLfQ9pUVnGs+iyTOhEYIGs/sOPTidnfcNxF4/DX/coRSrOg6YW
         uNla6m2EVX3/TKdwL4Se3e0zMShDOZhr69Jaci4j4f75w9r9VLACBYexLKrajtt9aEOE
         MilqJn9anR8pNfS3j99kGARFktK1ZVxdE670vSpH7xBEh9YFB6rOkR7PpUBDccLzloVa
         sBAmRUT9eSzRf/BmNuMHV1ITXV4HK98mjRxopc5+FEFZfshX80YsNdDf6IdVzEoRk2Yv
         la3p1msqFiUaOWYQY1mxoHGFmgzx2uzWZy081B2ncLNamIn3rc0a5gdRYUNZKa8E+okK
         zYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971215; x=1700576015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkOxZJ0AR04vpaXdb9zeN8RXHX4RQvWz8fPabjRmmO0=;
        b=BSGhmVPt/0AeoqmcEh7qp83T28Qf2sHFH9vb9BARHPmLWEiivvO+Exgjgpd/E0PoKx
         U0FFu6r/qnDsmXPEzJCObQCZofgsP5GamXdjOg9He1rQzFOVSez13flNYqAYcwseMSDD
         v3utmkdER53vA3tM3x0NKPKMiE8s2nw7RXLtDAnQ8i0BOaFBuonaJk/ND4RZwqYp4OfE
         jIWup9MxIlJfpy4jR9WIZNYhtMG+GzfQ9FsjhbKkOo9NHcl+VrcqS78xO0vxsXVi9toM
         RL+HISDw2QH6nUJ7b1i9Hi3xBTRoppyL/zAyPpCQQjsKoK6xKz325EUA69WH/G4VgYSX
         46eg==
X-Gm-Message-State: AOJu0YznOlTUwVZERoLTQam1U2bNAxdZVg/QdNfAlnbLWippQrpqD3iy
	pZOm60m8NXTcjLvtZkXZxC1iSOGNzDg0FvmKJ/q8Kw==
X-Google-Smtp-Source: AGHT+IF1vTtQmZmjoesEJZrqkYgP/y3LHSOgrezoy4k2OY+Q9+3+C9SJphKPSqsypKeip90h5fH/aw==
X-Received: by 2002:a05:620a:1a83:b0:76f:1846:2f6b with SMTP id bl3-20020a05620a1a8300b0076f18462f6bmr2662819qkb.1.1699971215392;
        Tue, 14 Nov 2023 06:13:35 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:34 -0800 (PST)
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
	Samuel Ortiz <sameo@rivosinc.com>,
	Jerry Shih <jerry.shih@sifive.com>
Subject: [PATCH v4 04/20] riscv: hwprobe: add support for scalar crypto ISA extensions
Date: Tue, 14 Nov 2023 09:12:40 -0500
Message-ID: <20231114141256.126749-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061338_669761_6002F465 
X-CRM114-Status: GOOD (  10.06  )
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

RXhwb3J0IHRoZSBmb2xsb3dpbmcgc2NhbGFyIGNyeXB0byBleHRlbnNpb25zIHRocm91Z2ggaHdw
cm9iZToKCi0gWmJrYgotIFpia2MKLSBaYmt4Ci0gWmtuZAotIFprbmUKLSBaa25oCi0gWmtzZWQK
LSBaa3NoCi0gWmt0CgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZv
c2luYy5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDI3
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2h3cHJvYmUuaCB8ICA5ICsrKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMg
ICAgICAgICB8IDEwICsrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0Rv
Y3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAppbmRleCAzZjcxZGE5MzVhNjUuLjNh
MThhMzFlMzJjMyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUu
cnN0CisrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdApAQCAtODMsNiAr
ODMsMzMgQEAgVGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgogICAqIDpjOm1hY3JvOmBS
SVNDVl9IV1BST0JFX0VYVF9aQkNgIFRoZSBaYmMgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwgYXMg
ZGVmaW5lZAogICAgICAgIGluIHZlcnNpb24gMS4wIG9mIHRoZSBCaXQtTWFuaXB1bGF0aW9uIElT
QSBleHRlbnNpb25zLgogCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pCS0JgIFRo
ZSBaYmtiIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQsIGFzCisgICAgICAgZGVmaW5lZCBpbiB2ZXJz
aW9uIDEuMCBvZiB0aGUgU2NhbGFyIENyeXB0byBJU0EgZXh0ZW5zaW9ucy4KKworICAqIDpjOm1h
Y3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aQktDYCBUaGUgWmJrYyBleHRlbnNpb24gaXMgc3VwcG9y
dGVkLCBhcworICAgICAgIGRlZmluZWQgaW4gdmVyc2lvbiAxLjAgb2YgdGhlIFNjYWxhciBDcnlw
dG8gSVNBIGV4dGVuc2lvbnMuCisKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWkJL
WGAgVGhlIFpia3ggZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwgYXMKKyAgICAgICBkZWZpbmVkIGlu
IHZlcnNpb24gMS4wIG9mIHRoZSBTY2FsYXIgQ3J5cHRvIElTQSBleHRlbnNpb25zLgorCisgICog
OmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pLTkRgIFRoZSBaa25kIGV4dGVuc2lvbiBpcyBz
dXBwb3J0ZWQsIGFzCisgICAgICAgZGVmaW5lZCBpbiB2ZXJzaW9uIDEuMCBvZiB0aGUgU2NhbGFy
IENyeXB0byBJU0EgZXh0ZW5zaW9ucy4KKworICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VY
VF9aS05FYCBUaGUgWmtuZSBleHRlbnNpb24gaXMgc3VwcG9ydGVkLCBhcworICAgICAgIGRlZmlu
ZWQgaW4gdmVyc2lvbiAxLjAgb2YgdGhlIFNjYWxhciBDcnlwdG8gSVNBIGV4dGVuc2lvbnMuCisK
KyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWktOSGAgVGhlIFprbmggZXh0ZW5zaW9u
IGlzIHN1cHBvcnRlZCwgYXMKKyAgICAgICBkZWZpbmVkIGluIHZlcnNpb24gMS4wIG9mIHRoZSBT
Y2FsYXIgQ3J5cHRvIElTQSBleHRlbnNpb25zLgorCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJP
QkVfRVhUX1pLU0VEYCBUaGUgWmtzZWQgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwgYXMKKyAgICAg
ICBkZWZpbmVkIGluIHZlcnNpb24gMS4wIG9mIHRoZSBTY2FsYXIgQ3J5cHRvIElTQSBleHRlbnNp
b25zLgorCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pLU0hgIFRoZSBaa3NoIGV4
dGVuc2lvbiBpcyBzdXBwb3J0ZWQsIGFzCisgICAgICAgZGVmaW5lZCBpbiB2ZXJzaW9uIDEuMCBv
ZiB0aGUgU2NhbGFyIENyeXB0byBJU0EgZXh0ZW5zaW9ucy4KKworICAqIDpjOm1hY3JvOmBSSVND
Vl9IV1BST0JFX0VYVF9aS1RgIFRoZSBaa3QgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwgYXMgZGVm
aW5lZAorICAgICAgIGluIHZlcnNpb24gMS4wIG9mIHRoZSBTY2FsYXIgQ3J5cHRvIElTQSBleHRl
bnNpb25zLgorCiAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzBgOiBBIGJp
dG1hc2sgdGhhdCBjb250YWlucyBwZXJmb3JtYW5jZQogICBpbmZvcm1hdGlvbiBhYm91dCB0aGUg
c2VsZWN0ZWQgc2V0IG9mIHByb2Nlc3NvcnMuCiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdw
cm9iZS5oCmluZGV4IGFjYTVhYmM3ZWJlZS4uNjI0YWJkNWNkZTI5IDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS91YXBpL2FzbS9od3Byb2JlLmgKQEAgLTMxLDYgKzMxLDE1IEBAIHN0cnVjdCByaXNjdl9od3By
b2JlIHsKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pCUwkJKDEgPDwgNSkKICNkZWZpbmUJ
CVJJU0NWX0hXUFJPQkVfRVhUX1pJQ0JPWgkoMSA8PCA2KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9C
RV9FWFRfWkJDCQkoMSA8PCA3KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkJLQgkJKDEg
PDwgOCkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pCS0MJCSgxIDw8IDkpCisjZGVmaW5l
CQlSSVNDVl9IV1BST0JFX0VYVF9aQktYCQkoMSA8PCAxMCkKKyNkZWZpbmUJCVJJU0NWX0hXUFJP
QkVfRVhUX1pLTkQJCSgxIDw8IDExKQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWktORQkJ
KDEgPDwgMTIpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aS05ICQkoMSA8PCAxMykKKyNk
ZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pLU0VECQkoMSA8PCAxNCkKKyNkZWZpbmUJCVJJU0NW
X0hXUFJPQkVfRVhUX1pLU0gJCSgxIDw8IDE1KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRf
WktUCQkoMSA8PCAxNikKICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wCTUKICNk
ZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9VTktOT1dOCSgwIDw8IDApCiAjZGVmaW5l
CQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURUQJKDEgPDwgMCkKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jp
c2N2LmMKaW5kZXggN2E0MDE0NWU5NjI4Li40M2FhNjZlNzE0MTggMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNj
di5jCkBAIC0xNjMsNiArMTYzLDE2IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3Ry
dWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCUVYVF9LRVkoWkJTKTsKIAkJRVhUX0tFWShaSUNC
T1opOwogCQlFWFRfS0VZKFpCQyk7CisKKwkJRVhUX0tFWShaQktCKTsKKwkJRVhUX0tFWShaQktD
KTsKKwkJRVhUX0tFWShaQktYKTsKKwkJRVhUX0tFWShaS05EKTsKKwkJRVhUX0tFWShaS05FKTsK
KwkJRVhUX0tFWShaS05IKTsKKwkJRVhUX0tFWShaS1NFRCk7CisJCUVYVF9LRVkoWktTSCk7CisJ
CUVYVF9LRVkoWktUKTsKICN1bmRlZiBFWFRfS0VZCiAJfQogCi0tIAoyLjQyLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
