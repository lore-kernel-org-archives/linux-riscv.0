Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B25C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 11:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+2TB3KaVMBNvhWFxwTPVfRtpAIVaxtX8pfXgw7jnaeg=; b=XVLKJXGlUdpY8m
	KoRJj+56X+GLsNZaxihBMD4K6aw6ayG8P3TcemiLpPSTeDLunZ+q3YIs/K83slB/hIM2ZmTF/RdwA
	/2+nLKa93G/mxHUtMB176nI//k10oV9DJ9I1+UkfYsZbLk9zBG/DE+7/xYzgPhT7ya8tO2JuzSm8p
	EVHqnlYjBhIM+UFiPQcvumz22GTru8kCQby8m+zs4C1IY6zgCBoI8EU3k55w5M2wRJs9EMiMvRwTR
	xY0SZN0zJK+keb34o69trwk+rNjsR2UgeJA0CTdAlSPw0GpYBbWtdvj2HdD0QW89PKKbpcu4CPe3O
	3L8zUuB0XdySUQa2WtFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUN-00ET3i-0Z;
	Wed, 13 Dec 2023 11:33:19 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUJ-00ET1V-0E
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 11:33:17 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2cc2adbcf87so5356471fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 03:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702467193; x=1703071993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdmTrlQiysEJ9gRiozTT9JeMo8PxECkQ3IPcbyVimLw=;
        b=Sg9eR0Ry6tdryrq6wlsJrkJ4KxsC1a65Fo7xLWlwKLbWl3NHTAB2tkVdt9XZv712Ql
         FcpHSHevkFIewkzb9xP15YTwtxSgoEKy9PSH8L7g06ir/3o7Mb1eqtlIOa5wmvPPJ6I0
         itAihoMsSIvVe/HeNUYcceQ2no2v3nPEOrUO6bnYxv4Dl+X7qQxnGqEjC0QxTVR9KXUA
         aZi3HidGLj6g7BnL6EJXYIAkNpblJTAH0UvmOz71P+51drw81BqKMhHaMRj+HqOIPpum
         q9maPt0t0AW1C03cmPoYdyYKQcbtLgxpWNzN9I/LrAGrq3ECP4duuzDubda24HvEcRFt
         CDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467193; x=1703071993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EdmTrlQiysEJ9gRiozTT9JeMo8PxECkQ3IPcbyVimLw=;
        b=jgAP1zp78ZI73aWPMRj58LLt/XqPey7eJ5B1Y1bBa/twb9hGslq6cuml2WBnu1ewZl
         nkuguhirNmKsGT2r3S1kZfUKlfVf5sGWJOPvqWblubkeh/A6UL9Qu9fH4/f1gXjHr8ck
         8ttlwiyIWaa2yb17eEMwnUsbOZIC7nSsvvmhbFJLNVK+dhY+HsW9AGCCLlM+x/e+GAQt
         O9XGqXMzlZJ0WRNVscHzRs0US5fNvCcD/Lse5zGPqpexsZw7jBYKm2pYcN2Aj2SW29up
         EWHwHgye2EQC8qgbjq02NbNYyUjihz3ISRM2lLKEbP7PJq9zHzZ+W/hk/BZxiz28UEVZ
         r4RQ==
X-Gm-Message-State: AOJu0Yyj8FtzaXxC7L5Tx3FeNVPDbv+TGkt3XAro7PgmUFgsBdB+Ozyx
	vrW3lEEouiidPScxDi8ASFZVAg==
X-Google-Smtp-Source: AGHT+IGRFuH629++Bb3wGMQ+qnci9mOmjy+tVmt+kXTT5YpcBLnKt70/RrbZJJli1/GOWOFaotbQYw==
X-Received: by 2002:a2e:a54f:0:b0:2ca:350:9339 with SMTP id e15-20020a2ea54f000000b002ca03509339mr8364738ljn.3.1702467193265;
        Wed, 13 Dec 2023 03:33:13 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:c564:f167:d072:5672])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm22433137wms.30.2023.12.13.03.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:33:12 -0800 (PST)
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
Subject: [PATCH 1/9] riscv: add ISA extension parsing for Ztso
Date: Wed, 13 Dec 2023 12:32:57 +0100
Message-ID: <20231213113308.133176-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213113308.133176-1-cleger@rivosinc.com>
References: <20231213113308.133176-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_033315_329048_1C0EBE7A 
X-CRM114-Status: UNSURE (   9.58  )
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

QWRkIHN1cHBvcnQgdG8gcGFyc2UgdGhlIFp0c28gc3RyaW5nIGluIHRoZSByaXNjdixpc2Egc3Ry
aW5nLiBUaGUKYmluZGluZ3MgYWxyZWFkeSBzdXBwb3J0cyBpdCBidXQgbm90IHRoZSBJU0EgcGFy
c2luZyBjb2RlLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDEgKwogYXJjaC9y
aXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCAyNDM4ZDQ2ODVkYTYuLjNiMzFlZmUy
ZjcxNiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCisrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtODQsNiArODQsNyBAQAogI2RlZmluZSBS
SVNDVl9JU0FfRVhUX1pWRkgJCTY5CiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZGSE1JTgkJNzAK
ICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aRkEJCTcxCisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlRT
TwkJNzIKIAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX01BWAkJMTI4CiAjZGVmaW5lIFJJU0NWX0lT
QV9FWFRfSU5WQUxJRAkJVTMyX01BWApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCmluZGV4IGRjMGFiM2U5
N2NkMi4uM2ViNDhhMGVlY2IzIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCkBAIC0yNzksNiArMjc5
LDcgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7
CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemt0LCBSSVNDVl9JU0FfRVhUX1pLVCksCiAJX19SSVND
Vl9JU0FfRVhUX0RBVEEoemtzZWQsIFJJU0NWX0lTQV9FWFRfWktTRUQpLAogCV9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHprc2gsIFJJU0NWX0lTQV9FWFRfWktTSCksCisJX19SSVNDVl9JU0FfRVhUX0RB
VEEoenRzbywgUklTQ1ZfSVNBX0VYVF9aVFNPKSwKIAlfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQo
enZiYiwgUklTQ1ZfSVNBX0VYVF9aVkJCLCByaXNjdl96dmJiX2V4dHMpLAogCV9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHp2YmMsIFJJU0NWX0lTQV9FWFRfWlZCQyksCiAJX19SSVNDVl9JU0FfRVhUX0RB
VEEoenZmaCwgUklTQ1ZfSVNBX0VYVF9aVkZIKSwKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
