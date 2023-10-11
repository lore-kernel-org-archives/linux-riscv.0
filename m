Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41640CD6E65
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 12:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P0HSkoyj9eBlQgC1npg8Z+bOI0RIzcrexC87T+jTQGk=; b=n24kY4t10kuOw9
	0xZnlq9cIGPpZwPe+VXVZSQ1p1a9asZZaUw90vWdgLmGLeevKH9Ioa2rQ/m04pQVfhTBMowENjNCc
	1m61WCCeZaxMydmjB8+VvRlvrpNPVI5/AeKEu3w7eVe60MhX6LBRlKWiGEKRqJcChqqfGd7y+K1h6
	MseskPC9UwRldVM76SQ188TbSmkKuxuvdWZb+kU/ONIXrxf7s99REbti9YLAI8RWv956+3J4uzdxO
	birtPghi5NdjN922K5Wkt6l43Z2BMlWqJs3X0dsj0FKOROIJ9vUVK8pl029BB8AeQhxf/kV1IurSN
	dTD+SWsyLzKpAvwNeICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqYME-00FqpJ-1w;
	Wed, 11 Oct 2023 12:30:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFH-00FjEl-2f
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 11:19:24 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4064e3c7c07so9986155e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 04:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023156; x=1697627956; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IIANjo80zFqhbyLhR/zqKY0ZEpCfYarjbj4J5oFHCU=;
        b=KSypH12Xn5oUEAz1NCfpjnGzbqjQ6rCzoogN0qaFFfPRPoE6zZIeNdJJ3dx7P+VJI2
         9jxZiyicusNoGHRFj56ES/Q2Xe9EV50YqaovRm+OqRNV2P7dqunS5xgfzMutAkSeou2P
         55X1hxKA7MnvFzoW62X7csPM8aI107MwPWzmSP13n1FhS68MKh4dgKmLOLYatOQnt3eY
         BVH9YhWDMVKlVNJ7FojxXiPU/wb4FXyo1ekleSwG/vDpks5lk3wFHftKRVDHKUP3+9xG
         dU3C3zlxVVgRLE7UHT7/1/aDyr9Bzw5sEjR4f9v9a/JmlVg3kEi4rfyah5n6vYXLPWtZ
         OxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023156; x=1697627956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IIANjo80zFqhbyLhR/zqKY0ZEpCfYarjbj4J5oFHCU=;
        b=JUdGtsSRRbzngLF2cYZ8ofs5QXutyffKBQqjC5blDPxZUaI/d9SJCVn4XiXjdxEo6k
         9JEuFYLaw8Gq0uO8RJe026CU/wV5kkVCMRsAvCGDDgM0ijjHZ83tk2Z3LdqOfhSYorZo
         +2jshp9P70CzI43LDKnTfSORMk+RabHLFcGw1VuSfIrCsUBWt7287g+ARxYob2wFWhtu
         cjnFsDoYqoCt13OO+kgURr2UvoNH5x7Yz1mTj+UVruVC18SXN0x8apR2zBJl4XrIndyk
         EQmmeAXXo2U60l0g7j9mrjU+kPj7EJUiacF1lnUiRgET01f7otEOrwGMW1NbrBpFr1lk
         EM5Q==
X-Gm-Message-State: AOJu0YwzZ9Oq7URy4tAJum59GWUrP1LrXG3NPiL7f8oWp5ZyHVi9dLPR
	rReUPNOREpOwkH3RqUAzbQvxuf8FY6MCNu3MgC7WkA==
X-Google-Smtp-Source: AGHT+IG/DnLus+yEPlI6bYFmkh9ll2Q+J+N/2Mo1GvXrndFzK7mO/7rr0oVK3NtPpfUMi8b7II3bfA==
X-Received: by 2002:a7b:cc99:0:b0:401:7d3b:cc84 with SMTP id p25-20020a7bcc99000000b004017d3bcc84mr18354424wma.0.1697023155672;
        Wed, 11 Oct 2023 04:19:15 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:15 -0700 (PDT)
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
Subject: [PATCH v1 02/13] riscv: add ISA extension probing for Zv* extensions
Date: Wed, 11 Oct 2023 13:14:27 +0200
Message-ID: <20231011111438.909552-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011111438.909552-1-cleger@rivosinc.com>
References: <20231011111438.909552-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_041919_865241_A5D298A9 
X-CRM114-Status: UNSURE (   8.81  )
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

QWRkIHByb2Jpbmcgb2Ygc29tZSBadiogSVNBIGV4dGVuc2lvbnMgdGhhdCBhcmUgbWVudGlvbmVk
IGluICJSSVNDLVYKQ3J5cHRvZ3JhcGh5IEV4dGVuc2lvbnMgVm9sdW1lIElJIiBbMV0uIFRoZXNl
IElTQSBleHRlbnNpb25zIGFyZSB0aGUKZm9sbG93aW5nOgoKLSBadmJiOiBWZWN0b3IgQmFzaWMg
Qml0LW1hbmlwdWxhdGlvbgotIFp2YmM6IFZlY3RvciBDYXJyeWxlc3MgTXVsdGlwbGljYXRpb24K
LSBadmtiOiBWZWN0b3IgQ3J5cHRvZ3JhcGh5IEJpdC1tYW5pcHVsYXRpb24KLSBadmtnOiBWZWN0
b3IgR0NNL0dNQUMuCi0gWnZrbmVkOiBOSVNUIFN1aXRlOiBWZWN0b3IgQUVTIEJsb2NrIENpcGhl
cgotIFp2a25oW2FiXTogTklTVCBTdWl0ZTogVmVjdG9yIFNIQS0yIFNlY3VyZSBIYXNoCi0gWnZr
c2VkOiBTaGFuZ01pIFN1aXRlOiBTTTQgQmxvY2sgQ2lwaGVyCi0gWnZrc2g6IFNoYW5nTWkgU3Vp
dGU6IFNNMyBTZWN1cmUgSGFzaAotIFp2a246IE5JU1QgQWxnb3JpdGhtIFN1aXRlCi0gWnZrbmM6
IE5JU1QgQWxnb3JpdGhtIFN1aXRlIHdpdGggY2FycnlsZXNzIG11bHRpcGx5Ci0gWnZrbmc6IE5J
U1QgQWxnb3JpdGhtIFN1aXRlIHdpdGggR0NNLgotIFp2a3M6IFNoYW5nTWkgQWxnb3JpdGhtIFN1
aXRlCi0gWnZrc2M6IFNoYW5nTWkgQWxnb3JpdGhtIFN1aXRlIHdpdGggY2FycnlsZXNzIG11bHRp
cGxpY2F0aW9uCi0gWnZrc2c6IFNoYW5nTWkgQWxnb3JpdGhtIFN1aXRlIHdpdGggR0NNLgotIFp2
a3Q6IFZlY3RvciBEYXRhLUluZGVwZW5kZW50IEV4ZWN1dGlvbiBMYXRlbmN5LgoKWzFdIGh0dHBz
Oi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMWdiOU9MSC1EaGJDZ1dwN1Z3cFBPVnJyWTZmM29T
SkxML3ZpZXcKClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5j
LmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAxNiArKysrKysrKysr
KysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAxNiArKysrKysrKysrKysr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2Fw
LmgKaW5kZXggYjdiNTgyNThmNmM3Li40ZTQ2OTgxYWM2YzggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vaHdjYXAuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2Fw
LmgKQEAgLTU4LDYgKzU4LDIyIEBACiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklDU1IJCTQwCiAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklGRU5DRUkJCTQxCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRf
WklIUE0JCTQyCisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZCQgkJNDMKKyNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9aVkJDCQk0NAorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS0IJCTQ1CisjZGVmaW5l
IFJJU0NWX0lTQV9FWFRfWlZLRwkJNDYKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVktOCQk0Nwor
I2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS05DCQk0OAorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pW
S05FRAkJNDkKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVktORwkJNTAKKyNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9aVktOSEEJCTUxCisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZLTkhCCQk1MgorI2Rl
ZmluZSBSSVNDVl9JU0FfRVhUX1pWS1MJCTUzCisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZLU0MJ
CTU0CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZLU0VECQk1NQorI2RlZmluZSBSSVNDVl9JU0Ff
RVhUX1pWS1NICQk1NgorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS1NHCQk1NworI2RlZmluZSBS
SVNDVl9JU0FfRVhUX1pWS1QJCTU4CiAKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9NQVgJCTY0CiAK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCAxY2ZiYmE2NWQxMWEuLjg1OWQ2NDdmM2NlZCAxMDA2
NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCisrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtMTc0LDYgKzE3NCwyMiBAQCBjb25zdCBzdHJ1Y3Qgcmlz
Y3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFU
QSh6YmEsIFJJU0NWX0lTQV9FWFRfWkJBKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YmIsIFJJ
U0NWX0lTQV9FWFRfWkJCKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YnMsIFJJU0NWX0lTQV9F
WFRfWkJTKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmJiLCBSSVNDVl9JU0FfRVhUX1pWQkIp
LAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2YmMsIFJJU0NWX0lTQV9FWFRfWlZCQyksCisJX19S
SVNDVl9JU0FfRVhUX0RBVEEoenZrYiwgUklTQ1ZfSVNBX0VYVF9aVktCKSwKKwlfX1JJU0NWX0lT
QV9FWFRfREFUQSh6dmtnLCBSSVNDVl9JU0FfRVhUX1pWS0cpLAorCV9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHp2a24sIFJJU0NWX0lTQV9FWFRfWlZLTiksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZr
bmMsIFJJU0NWX0lTQV9FWFRfWlZLTkMpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a25lZCwg
UklTQ1ZfSVNBX0VYVF9aVktORUQpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a25nLCBSSVND
Vl9JU0FfRVhUX1pWS05HKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmtuaGEsIFJJU0NWX0lT
QV9FWFRfWlZLTkhBKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmtuaGIsIFJJU0NWX0lTQV9F
WFRfWlZLTkhCKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmtzLCBSSVNDVl9JU0FfRVhUX1pW
S1MpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a3NjLCBSSVNDVl9JU0FfRVhUX1pWS1NDKSwK
KwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmtzZWQsIFJJU0NWX0lTQV9FWFRfWlZLU0VEKSwKKwlf
X1JJU0NWX0lTQV9FWFRfREFUQSh6dmtzaCwgUklTQ1ZfSVNBX0VYVF9aVktTSCksCisJX19SSVND
Vl9JU0FfRVhUX0RBVEEoenZrc2csIFJJU0NWX0lTQV9FWFRfWlZLU0cpLAorCV9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHp2a3QsIFJJU0NWX0lTQV9FWFRfWlZLVCksCiAJX19SSVNDVl9JU0FfRVhUX0RB
VEEoc21haWEsIFJJU0NWX0lTQV9FWFRfU01BSUEpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNz
YWlhLCBSSVNDVl9JU0FfRVhUX1NTQUlBKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc2NvZnBt
ZiwgUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRiksCi0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
