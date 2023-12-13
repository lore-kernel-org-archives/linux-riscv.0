Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07093C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 11:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zDul2L1/Xwe5Z7JpNGTox8/yOyvUiSGV7/0HztQnAdw=; b=B5VDFZdYKg105m
	djhUOEF6Yh6qv4KOl5n+K9p/Wl+rjvm00BHQ5z5U4Kg1W57FPVk7caTKuseceTn/BSKlhJt2VOqq2
	iMFRKSgnx5q8Ib2qpzr9PcxrBmtEZtH/5pF3uN221kSjz3Jgvil1rL+SSfU22kbkI7ApOqWtZgn4C
	IvEqIeGB0m4lb4R1XbTWXRgcbNcb9vWV939nrY36FrUMv+5bx+uqsGB0M1bAfawc7hoGaTI23rpLX
	R2QdEjt00WmGNxdlMxaAWw0BYWTl7yXdnXMDX4znpF9ShUVKVf2iQejl5kj92l4LPgc0xGeOp8E68
	PJexRuTxQKKm2r9hKozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUV-00ETAM-0G;
	Wed, 13 Dec 2023 11:33:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUQ-00ET2j-11
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 11:33:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40c192f488cso11230925e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 03:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702467197; x=1703071997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJ7qFvLPI16XitLVU7jac70czdbEyCJmCnGlh/kcFn4=;
        b=qZzu1r1gQx92nSzWDWTlaXFyd0FNHjgUWGZXm3gptEwVKJTY/B9m9V0lDmthOSiFnM
         3IPC/kYsNhFRaCUIS2gmWb94Hnc4w7kDYvwbF5ZIhH1hk4AGs4AyLBqRU9WyDVzQ8hQT
         MVueyOZleQlLkAyBZN3MyIFiW666U7UucfBfVGRVaFnSbx6myuRv+ts8DO9rTuPUzpOG
         CQ2XAAcdIqi+uq1JTL02RUOpKtasUT+8f51SZaWaIN65IMib2hey1YzznX5/eLoGz0wm
         1tS2bQHYmLISTxHZPl5ayYhfA18/oXNaXsgMSkl97Gm8Yon8AezsH5HAL4hWpS0mboHO
         7CrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467197; x=1703071997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJ7qFvLPI16XitLVU7jac70czdbEyCJmCnGlh/kcFn4=;
        b=TRAYtv6E4ZiFnnh6I3/dOVFfz5wI+sBdTe7FhsDNRqwSqaYgVU/ODf/HQsyIE/XWLy
         ZAjVf2J+hXAkIc/qIQtCrqkpO1fjJl4EWgHEWtCijVm1+NufDn7pWH+iPQZrnNHrakUp
         zBsjpOVZZIaAZCHOJcPhLThaGsJgNKnCk7D15TONBl3QPKuIhdeoKGEUIastQ5Ivo4x9
         iHxkxMjhs3pYb3luPBs+2yczSCOHna0G/zLx9YFwgsTKSavBIu2CytVukPujXR6Z+P21
         FQuE1rQ7yCJJNl8TBfPS1f+OfsEmAWe2xGu9e5Zxl+R8MlZL/xwkqx3DiwmuUskvXKyz
         4vfw==
X-Gm-Message-State: AOJu0YxHLuqQmRfQrpSzcQJmccGUoB9/FDWomflX5RfRAdBZwGXryB6Q
	TdasNL2oGcYKuZPOo61XhvZYVg==
X-Google-Smtp-Source: AGHT+IFSZAznHPSK5PUles9w0ak3hYXLoPc4Qu5KPjMvXQBkR/ftanO0CSh3prHsJkQveJSFnBCRzQ==
X-Received: by 2002:a05:600c:1d9b:b0:40c:2960:9603 with SMTP id p27-20020a05600c1d9b00b0040c29609603mr9614366wms.3.1702467197077;
        Wed, 13 Dec 2023 03:33:17 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:c564:f167:d072:5672])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm22433137wms.30.2023.12.13.03.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:33:16 -0800 (PST)
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
Subject: [PATCH 4/9] riscv: add ISA extension parsing for Zam
Date: Wed, 13 Dec 2023 12:33:00 +0100
Message-ID: <20231213113308.133176-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213113308.133176-1-cleger@rivosinc.com>
References: <20231213113308.133176-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_033322_358354_9BCEB675 
X-CRM114-Status: UNSURE (   9.57  )
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

QWRkIHBhcnNpbmcgZm9yIFphbSBJU0EgZXh0ZW5zaW9uIHdoaWNoIGlzIHBhcnQgb2YgdGhlIHJp
c2N2LWlzYSBtYW51YWwKYnV0IHdhcyBub3QgYWRkZWQgdG8gSVNBIHBhcnNpbmcgdXAgdG8gbm93
LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgot
LS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDEgKwogYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1ZmVhdHVyZS5jIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCAzYjMxZWZlMmY3MTYuLjAxNmZhYTA4YzhiYSAxMDA2
NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCisrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaHdjYXAuaApAQCAtODUsNiArODUsNyBAQAogI2RlZmluZSBSSVNDVl9JU0Ff
RVhUX1pWRkhNSU4JCTcwCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkZBCQk3MQogI2RlZmluZSBS
SVNDVl9JU0FfRVhUX1pUU08JCTcyCisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkFNCQk3MwogCiAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfTUFYCQkxMjgKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9JTlZB
TElECQlVMzJfTUFYCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKaW5kZXggM2ViNDhhMGVlY2IzLi5lOTk5
MzIwMzk4YjcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKQEAgLTI1OSw2ICsyNTksNyBAQCBjb25z
dCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NW
X0lTQV9FWFRfREFUQSh6aWhpbnRudGwsIFJJU0NWX0lTQV9FWFRfWklISU5UTlRMKSwKIAlfX1JJ
U0NWX0lTQV9FWFRfREFUQSh6aWhpbnRwYXVzZSwgUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSks
CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemlocG0sIFJJU0NWX0lTQV9FWFRfWklIUE0pLAorCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHphbSwgUklTQ1ZfSVNBX0VYVF9aQU0pLAogCV9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHpmYSwgUklTQ1ZfSVNBX0VYVF9aRkEpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRB
KHpmaCwgUklTQ1ZfSVNBX0VYVF9aRkgpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpmaG1pbiwg
UklTQ1ZfSVNBX0VYVF9aRkhNSU4pLAotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
