Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A41BC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 10:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=adF2cXmXuOG4QAsVqOGZTv8lNdS0j0jbHKkxyZQzGvo=; b=gsba2edeor7oWz
	owO+fuK0ERHFhNMq8SE7rrOpAaifF5mV0zUULJ1nr61W8kBPF220790b5U8Ss/BiAN/ZGUmui3u3/
	AwzSs9th/mq5gB+FaN9uwGl/L3TUmfF7M9RU+eLMSRnGI39CDZ+XbZZ6xzgD3xpZyjuYjwxmDQ+bQ
	D5KX0frChet5Y/qV4Y9e9NQwKM0At801YbTAFToZevGwWl7JJHwMrE3lITuXD+YkOB/1+vLALgU7W
	aGq65qb1knjnFkNh0cnvaq0U8n9zTZFFf8J5p7zAs4FOOEhn87uBDc+xR6FpoD/32lK5yfSKpEGv+
	guaJ5kvW/W996iADZB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAPk-00000008B2G-1xoa;
	Mon, 18 Mar 2024 10:40:20 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAPf-00000008Azg-4AZv
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 10:40:18 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3c1e992f060so2463892b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 03:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710758414; x=1711363214; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCQe6vm/oJxMTsi/9kKYpE7XwZ+h04uGmZi4xHD22QU=;
        b=nrtnaNSJ68Gg/BOCS7DdLtz5QUYahjIEWdhzyErQhF/GJLdxy9yTTHf7psRQTVQwty
         5cHmSc4Q6nRT51F5gxurIA9KZmn5xRy4TExiYjqs6cz3nAiudBCFwtXPzCx+U6hVdWK0
         vTXCwo9yYbJC/W0X/NwHlAUxmdmxC+FpN6WMjpNaFGqh32gTqkTNtvBwYcPPwYRt3PxO
         VjkVU041nA2HK9XRBEg2lKI1ss/ejJ6uTVe4/+6fQWnrgF52ns7n0da/Rg43gCNfnYL1
         R8Cu17YI1wUGCGDMI/JFA34/3mY7Pl2nHr/HaPTJwReLrRyVCDl8+FLWJi1r0TJ2lYT8
         fBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710758414; x=1711363214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCQe6vm/oJxMTsi/9kKYpE7XwZ+h04uGmZi4xHD22QU=;
        b=NZgK0u+qZ+B4V6JcYL+2Eaw6ghug8V5JYBQzG3Z3eYjUJctJkt3oCqm1axrwzvYmuw
         vs/h1ON+36MuqESeEJc2VAgxTpac6GxbWeI4PA7bMYvFpb4pQ0UG54RdxyAnaqoTLYuf
         HCMLr9BmiQHLbGYSseAfilXmZ9/onqA0rBTnjfR8ZGjagC74I7XODKHM1bqCuXqqc8eq
         TtHrWSTn+YgHRygwPndPttux7rZvS3iNrEF3oCTXm4esPZO+jOh2oOWLRINJRzGgFD7+
         k76BZQwRnEs3ZhxgLIundeSLr3LxVTtNXiBXv27qqRRLWsmwzB0lOwAYC2MFnovDcP74
         PA3w==
X-Gm-Message-State: AOJu0Yyeb++n6LVenUXudvOwhs9HRwf6Rhwmug3WvT7aJefqBxzD1NHd
	z7lROULgGSzHCCHrlES6l902gZgeHgBxqE2uLMer+6HDdy1uEIS0zXeD9MM9tCI=
X-Google-Smtp-Source: AGHT+IGdrnrLbW+USxO7ZpyEu3j4S8IlYwCytamjxZATZlbSTeWt8QSbTr/yKlh7P89dlOk6bQ1eFA==
X-Received: by 2002:a05:6808:19a1:b0:3c2:355c:e68 with SMTP id bj33-20020a05680819a100b003c2355c0e68mr13595173oib.5.1710758414484;
        Mon, 18 Mar 2024 03:40:14 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id c11-20020a056a00008b00b006e647716b6esm7838969pfj.149.2024.03.18.03.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:40:14 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 18 Mar 2024 18:39:57 +0800
Subject: [PATCH v3 4/7] riscv: cpufeature: add zve32[xf] and zve64[xfd] isa
 detection
MIME-Version: 1.0
Message-Id: <20240318-zve-detection-v3-4-e12d42107fa8@sifive.com>
References: <20240318-zve-detection-v3-0-e12d42107fa8@sifive.com>
In-Reply-To: <20240318-zve-detection-v3-0-e12d42107fa8@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andy Chiu <andy.chiu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, 
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_034016_098624_A260334D 
X-CRM114-Status: GOOD (  14.16  )
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

TXVsdGlwbGUgVmVjdG9yIHN1YmV4dGVuc2lvbnMgYXJlIGFkZGVkLiBBbHNvLCB0aGUgcGF0Y2gg
dGFrZXMgY2FyZSBvZgp0aGUgZGVwZW5kZW5jaWVzIG9mIFZlY3RvciBzdWJleHRlbnNpb25zIGJ5
IG1hY3JvIGV4cGFuc2lvbnMuIFNvLCBpZgpzb21lICJlbWJlZGRlZCIgcGxhdGZvcm0gb25seSBy
ZXBvcnRzICJ6dmU2NGYiIG9uIHRoZSBJU0Egc3RyaW5nLCB0aGUKcGFyc2VyIGlzIGFibGUgdG8g
ZXhwYW5kIGl0IHRvIHp2ZTMyeCB6dmUzMmYgenZlNjR4IGFuZCB6dmU2NGYuCgpTaWduZWQtb2Zm
LWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgotLS0KQ2hhbmdlbG9nIHYzOgog
LSByZW51bWJlciBSSVNDVl9JU0FfRVhUX1pWRSogdG8gcmViYXNlIG9uIHRvcCBvZiA2LjkKIC0g
YWxwaGFiZXRpY2FsbHkgc29ydCBhZGRlZCBleHRlbnNpb25zIChDbMOpbWVudCkKQ2hhbmdlbG9n
IHYyOgogLSByZW1vdmUgdGhlIGV4dGVuc2lvbiBpdHNlbGYgZnJvbSBpdHMgaXNhX2V4dHNbXSBs
aXN0IChDbMOpbWVudCkKIC0gdXNlIHJpc2N2X3p2ZTY0ZF9leHRzIGZvciB2J3MgZXh0ZW5zaW9u
IGxpc3QgKFNhbXVlbCkKLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAgNSAr
KysrKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMzYgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2Fw
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKaW5kZXggYmFlN2VhYzc2YzE4Li4w
YTA1YzRlNmRjZWMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAor
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKQEAgLTgxLDYgKzgxLDExIEBACiAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlRTTwkJNzIKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQUNB
UwkJNzMKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9YQU5ERVNQTVUJCTc0CisjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfWlZFMzJYCQk3NQorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRTMyRgkJNzYKKyNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkU2NFgJCTc3CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZF
NjRGCQk3OAorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRTY0RAkJNzkKIAogI2RlZmluZSBSSVND
Vl9JU0FfRVhUX01BWAkJMTI4CiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfSU5WQUxJRAkJVTMyX01B
WApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jCmluZGV4IGNiZGQ2MzE2NWU4NS4uNmUyOTRhMzVhNGIwIDEw
MDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jCkBAIC0xODcsNiArMTg3LDM1IEBAIHN0YXRpYyBjb25zdCB1
bnNpZ25lZCBpbnQgcmlzY3ZfenZiYl9leHRzW10gPSB7CiAJUklTQ1ZfSVNBX0VYVF9aVktCCiB9
OwogCisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZFMzJGX0lNUExZX0xJU1QJXAorCVJJU0NWX0lT
QV9FWFRfWlZFMzJYLAorCisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZFNjRGX0lNUExZX0xJU1QJ
XAorCVJJU0NWX0lTQV9FWFRfWlZFNjRYLAkJXAorCVJJU0NWX0lTQV9FWFRfWlZFMzJGLAkJXAor
CVJJU0NWX0lTQV9FWFRfWlZFMzJGX0lNUExZX0xJU1QKKworI2RlZmluZSBSSVNDVl9JU0FfRVhU
X1pWRTY0RF9JTVBMWV9MSVNUCVwKKwlSSVNDVl9JU0FfRVhUX1pWRTY0RiwJCVwKKwlSSVNDVl9J
U0FfRVhUX1pWRTY0Rl9JTVBMWV9MSVNUCisKK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlz
Y3ZfenZlMzJmX2V4dHNbXSA9IHsKKwlSSVNDVl9JU0FfRVhUX1pWRTMyRl9JTVBMWV9MSVNUCit9
OworCitzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3p2ZTY0Zl9leHRzW10gPSB7CisJ
UklTQ1ZfSVNBX0VYVF9aVkU2NEZfSU1QTFlfTElTVAorfTsKKworc3RhdGljIGNvbnN0IHVuc2ln
bmVkIGludCByaXNjdl96dmU2NGRfZXh0c1tdID0geworCVJJU0NWX0lTQV9FWFRfWlZFNjREX0lN
UExZX0xJU1QKK307CisKK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfenZlNjR4X2V4
dHNbXSA9IHsKKwlSSVNDVl9JU0FfRVhUX1pWRTMyWCwKKwlSSVNDVl9JU0FfRVhUX1pWRTY0WAor
fTsKKwogLyoKICAqIFRoZSBjYW5vbmljYWwgb3JkZXIgb2YgSVNBIGV4dGVuc2lvbiBuYW1lcyBp
biB0aGUgSVNBIHN0cmluZyBpcyBkZWZpbmVkIGluCiAgKiBjaGFwdGVyIDI3IG9mIHRoZSB1bnBy
aXZpbGVnZWQgc3BlY2lmaWNhdGlvbi4KQEAgLTIzNCw3ICsyNjMsNyBAQCBjb25zdCBzdHJ1Y3Qg
cmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRf
REFUQShkLCBSSVNDVl9JU0FfRVhUX2QpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHEsIFJJU0NW
X0lTQV9FWFRfcSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoYywgUklTQ1ZfSVNBX0VYVF9jKSwK
LQlfX1JJU0NWX0lTQV9FWFRfREFUQSh2LCBSSVNDVl9JU0FfRVhUX3YpLAorCV9fUklTQ1ZfSVNB
X0VYVF9TVVBFUlNFVCh2LCBSSVNDVl9JU0FfRVhUX3YsIHJpc2N2X3p2ZTY0ZF9leHRzKSwKIAlf
X1JJU0NWX0lTQV9FWFRfREFUQShoLCBSSVNDVl9JU0FfRVhUX2gpLAogCV9fUklTQ1ZfSVNBX0VY
VF9EQVRBKHppY2JvbSwgUklTQ1ZfSVNBX0VYVF9aSUNCT00pLAogCV9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHppY2JveiwgUklTQ1ZfSVNBX0VYVF9aSUNCT1opLApAQCAtMjY5LDYgKzI5OCwxMSBAQCBj
b25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJ
U0NWX0lTQV9FWFRfREFUQSh6dHNvLCBSSVNDVl9JU0FfRVhUX1pUU08pLAogCV9fUklTQ1ZfSVNB
X0VYVF9TVVBFUlNFVCh6dmJiLCBSSVNDVl9JU0FfRVhUX1pWQkIsIHJpc2N2X3p2YmJfZXh0cyks
CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZiYywgUklTQ1ZfSVNBX0VYVF9aVkJDKSwKKwlfX1JJ
U0NWX0lTQV9FWFRfU1VQRVJTRVQoenZlMzJmLCBSSVNDVl9JU0FfRVhUX1pWRTMyRiwgcmlzY3Zf
enZlMzJmX2V4dHMpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2ZTMyeCwgUklTQ1ZfSVNBX0VY
VF9aVkUzMlgpLAorCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh6dmU2NGQsIFJJU0NWX0lTQV9F
WFRfWlZFNjRELCByaXNjdl96dmU2NGRfZXh0cyksCisJX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VU
KHp2ZTY0ZiwgUklTQ1ZfSVNBX0VYVF9aVkU2NEYsIHJpc2N2X3p2ZTY0Zl9leHRzKSwKKwlfX1JJ
U0NWX0lTQV9FWFRfU1VQRVJTRVQoenZlNjR4LCBSSVNDVl9JU0FfRVhUX1pWRTY0WCwgcmlzY3Zf
enZlNjR4X2V4dHMpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2ZmgsIFJJU0NWX0lTQV9FWFRf
WlZGSCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZmaG1pbiwgUklTQ1ZfSVNBX0VYVF9aVkZI
TUlOKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmtiLCBSSVNDVl9JU0FfRVhUX1pWS0IpLAoK
LS0gCjIuNDQuMC5yYzIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
