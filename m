Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A8DC52D7C
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 01:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c0C8D2OLrDSzDckLW4PIeWcJeOj9lg58DtutcVE4a/g=; b=bd7XKSCSUjO9ZX
	rBZn/v8bz1s/xdtfn4NAc+0Klji1yqsS/fE4657qD/ZCd5tP5p3+K9EzIDIuthD5WKQO1ttRWuCZf
	twHIqDFdY5g+3ZYoG0Cycbj3yfHr1GJ6IqMj/atLSQt2EI6JXe9zbei+b6C6fDR6IppRn6T9H6yku
	/B7tzxQgLlptnYHS+AS5pRHamQ8asrD53PFSKzraKJ12gaD/hSs5HvfrVWIFmX0Ss1ENoTkW975WI
	uMD6RSI4MrfLfSPtW3RCHthFcrw64f//60VOT58ilp8gnb5+w1wtPOcPylIXT1iTS59WjT1GGFaGn
	CFGiUzU6kBRFwAtrCJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJXR-0000000GcJT-2A5b;
	Mon, 12 Aug 2024 01:07:57 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJQm-0000000GaKI-2u2B
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 01:01:07 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2cb53da06a9so2516438a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 11 Aug 2024 18:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723424463; x=1724029263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9eWLrHir182byqrnausz4PNiecB0MULYeCzMr04SHA0=;
        b=YmWxHy7kEJv928n+Af1ihDrX7ikGUSR9YfcO8c3G2vbpTGUrnW6GIaWOHyRkbDbwjx
         ocdiOxSStB+ghVy3wr/tzPvRRx0HwX6l0EicVlDy3miBhTSGEksT2D7IEH+aSxMHX6kW
         iTJAet3KnlwckQ1Hv6Jz491DsewNPSi+WK3Wh7Sj2SyWYwZmU3SVet9N4WKHR72Z+kL2
         p51pRKsl8UTQ2HtXtyIJjUckmnitXBsciPHT76G/gANbp9wQtYSziz2ZUMpXIJNrmgBf
         xPhLOrJmI5pYSQEFmjV3oo2apOGYLV9XvBzG7DT4smbgqDRnPETeFKanq+PpedllujYB
         yINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723424463; x=1724029263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9eWLrHir182byqrnausz4PNiecB0MULYeCzMr04SHA0=;
        b=ArzlBWpUI0izJETS83UB8eh8nd1PXfT7MmV+kyyMGSfWFm9m3VBvQ55IvU5ki4l3HQ
         2cfxLBAsOfaAHdKPz3ijl1bv3QEjBAoALYyzQ6hPeX2fXyAJB99gLkJcyhsqpW4PrxgN
         gqgkpaVFkRF669WK4bQbw9BgkcnZ9OY9IMjM8S4WT19geQd895coBgy1iOVKsVw979G8
         3uB3Hpl4McfJ/MZQBn2v5kjKjNGTbyqw8kKDLM60ppJ3pYlCjefm2W+mS99TZT4Uxg0Y
         AtoovuDsr0YzmSNaV8pZrGp8NjabvgKuWiW1bCrp+QQBa3oErjbiix23LicwqAA8HUA4
         N8Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXY2NpMEfg2K/WziOVSTbrJD8ffVFp3ZuU72mpqA+C55t/7zJG6dceei3wpYSXK1FgZ+ksEtcMvWo/przoNmPrjFbJifOv5nQMQ123ujZxz
X-Gm-Message-State: AOJu0YzFpFaSohevceXSzWVSjVPdjse3QAH9p9YkMlOjSIGxYB7rmSMm
	hJOVy+eBrTn7pxaeVtxf42o8eCeZSUrDEdBVZURU9WCnVuarq2uKOHoYhOssAKQ=
X-Google-Smtp-Source: AGHT+IEmnnZO8yRXJ6ENu6bAM1Iq53DDo8oXCMY/2aarMSTJFhyCJE6z0a/eBIRQSdiXXTmWXrm9Iw==
X-Received: by 2002:a17:90b:1887:b0:2cf:dd3c:9b0d with SMTP id 98e67ed59e1d1-2d1c4b674cdmr19256482a91.2.1723424463037;
        Sun, 11 Aug 2024 18:01:03 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c3dbe8cbdcsm3074062a12.61.2024.08.11.18.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 18:01:02 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v8 13/17] irqchip/riscv-intc: Add ACPI support for AIA
Date: Mon, 12 Aug 2024 06:29:25 +0530
Message-ID: <20240812005929.113499-14-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812005929.113499-1-sunilvl@ventanamicro.com>
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_180104_805628_B2581A81 
X-CRM114-Status: GOOD (  15.56  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Drew Fustini <dfustini@tenstorrent.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="cp1252"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhlIFJJTlRDIHN1YnR5cGUgc3RydWN0dXJlIGluIE1BRFQgYWxzbyBoYXMgaW5mb3JtYXRpb24g
YWJvdXQgb3RoZXIKaW50ZXJydXB0IGNvbnRyb2xsZXJzLiBTYXZlIHRoaXMgaW5mb3JtYXRpb24g
YW5kIHByb3ZpZGUgaW50ZXJmYWNlcyB0bwpyZXRyaWV2ZSB0aGVtIHdoZW4gcmVxdWlyZWQgYnkg
Y29ycmVzcG9uZGluZyBkcml2ZXJzLgoKU2lnbmVkLW9mZi1ieTogU3VuaWwgViBMIDxzdW5pbHZs
QHZlbnRhbmFtaWNyby5jb20+ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPgpUZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0t
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycS5oICAgICB8IDMzICsrKysrKysrKysrKwogZHJp
dmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMgfCA5MCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMjMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaXJxLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2lycS5oCmluZGV4IDQ0YTBiMTI4YzYwMi4uN2U5YTg0YTAwNWVkIDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2lycS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaXJx
LmgKQEAgLTEyLDYgKzEyLDggQEAKIAogI2luY2x1ZGUgPGFzbS1nZW5lcmljL2lycS5oPgogCisj
ZGVmaW5lIElOVkFMSURfQ09OVEVYVCBVSU5UX01BWAorCiB2b2lkIHJpc2N2X3NldF9pbnRjX2h3
bm9kZV9mbihzdHJ1Y3QgZndub2RlX2hhbmRsZSAqKCpmbikodm9pZCkpOwogCiBzdHJ1Y3QgZndu
b2RlX2hhbmRsZSAqcmlzY3ZfZ2V0X2ludGNfaHdub2RlKHZvaWQpOwpAQCAtMjgsNiArMzAsMTEg
QEAgZW51bSByaXNjdl9pcnFjaGlwX3R5cGUgewogaW50IHJpc2N2X2FjcGlfZ2V0X2dzaV9pbmZv
KHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsIHUzMiAqZ3NpX2Jhc2UsCiAJCQkgICAgdTMy
ICppZCwgdTMyICpucl9pcnFzLCB1MzIgKm5yX2lkY3MpOwogc3RydWN0IGZ3bm9kZV9oYW5kbGUg
KnJpc2N2X2FjcGlfZ2V0X2dzaV9kb21haW5faWQodTMyIGdzaSk7Cit1bnNpZ25lZCBsb25nIGFj
cGlfcmludGNfaW5kZXhfdG9faGFydGlkKHUzMiBpbmRleCk7Cit1bnNpZ25lZCBsb25nIGFjcGlf
cmludGNfZXh0X3BhcmVudF90b19oYXJ0aWQodW5zaWduZWQgaW50IHBsaWNfaWQsIHVuc2lnbmVk
IGludCBjdHh0X2lkeCk7Cit1bnNpZ25lZCBpbnQgYWNwaV9yaW50Y19nZXRfcGxpY19ucl9jb250
ZXh0cyh1bnNpZ25lZCBpbnQgcGxpY19pZCk7Cit1bnNpZ25lZCBpbnQgYWNwaV9yaW50Y19nZXRf
cGxpY19jb250ZXh0KHVuc2lnbmVkIGludCBwbGljX2lkLCB1bnNpZ25lZCBpbnQgY3R4dF9pZHgp
OworaW50IF9faW5pdCBhY3BpX3JpbnRjX2dldF9pbXNpY19tbWlvX2luZm8odTMyIGluZGV4LCBz
dHJ1Y3QgcmVzb3VyY2UgKnJlcyk7CiAKICNlbHNlCiBzdGF0aWMgaW5saW5lIGludCByaXNjdl9h
Y3BpX2dldF9nc2lfaW5mbyhzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLCB1MzIgKmdzaV9i
YXNlLApAQCAtMzYsNiArNDMsMzIgQEAgc3RhdGljIGlubGluZSBpbnQgcmlzY3ZfYWNwaV9nZXRf
Z3NpX2luZm8oc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSwgdTMyICpnc2kKIAlyZXR1cm4g
MDsKIH0KIAorc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGFjcGlfcmludGNfaW5kZXhfdG9f
aGFydGlkKHUzMiBpbmRleCkKK3sKKwlyZXR1cm4gSU5WQUxJRF9IQVJUSUQ7Cit9CisKK3N0YXRp
YyBpbmxpbmUgdW5zaWduZWQgbG9uZyBhY3BpX3JpbnRjX2V4dF9wYXJlbnRfdG9faGFydGlkKHVu
c2lnbmVkIGludCBwbGljX2lkLAorCQkJCQkJCSAgICB1bnNpZ25lZCBpbnQgY3R4dF9pZHgpCit7
CisJcmV0dXJuIElOVkFMSURfSEFSVElEOworfQorCitzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGlu
dCBhY3BpX3JpbnRjX2dldF9wbGljX25yX2NvbnRleHRzKHVuc2lnbmVkIGludCBwbGljX2lkKQor
eworCXJldHVybiBJTlZBTElEX0NPTlRFWFQ7Cit9CisKK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQg
aW50IGFjcGlfcmludGNfZ2V0X3BsaWNfY29udGV4dCh1bnNpZ25lZCBpbnQgcGxpY19pZCwgdW5z
aWduZWQgaW50IGN0eHRfaWR4KQoreworCXJldHVybiBJTlZBTElEX0NPTlRFWFQ7Cit9CisKK3N0
YXRpYyBpbmxpbmUgaW50IF9faW5pdCBhY3BpX3JpbnRjX2dldF9pbXNpY19tbWlvX2luZm8odTMy
IGluZGV4LCBzdHJ1Y3QgcmVzb3VyY2UgKnJlcykKK3sKKwlyZXR1cm4gMDsKK30KKwogI2VuZGlm
IC8qIENPTkZJR19BQ1BJICovCiAKICNlbmRpZiAvKiBfQVNNX1JJU0NWX0lSUV9IICovCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYyBiL2RyaXZlcnMvaXJxY2hp
cC9pcnEtcmlzY3YtaW50Yy5jCmluZGV4IDQ3ZjMyMDA0NzZkYS4uOGM1NDExMzg2MjIwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYworKysgYi9kcml2ZXJzL2ly
cWNoaXAvaXJxLXJpc2N2LWludGMuYwpAQCAtMjUwLDYgKzI1MCw4NSBAQCBJUlFDSElQX0RFQ0xB
UkUoYW5kZXMsICJhbmRlc3RlY2gsY3B1LWludGMiLCByaXNjdl9pbnRjX2luaXQpOwogCiAjaWZk
ZWYgQ09ORklHX0FDUEkKIAorc3RydWN0IHJpbnRjX2RhdGEgeworCXVuaW9uIHsKKwkJdTMyCQll
eHRfaW50Y19pZDsKKwkJc3RydWN0IHsKKwkJCXUzMgljb250ZXh0X2lkCTogMTYsCisJCQkJcmVz
ZXJ2ZWQJOiAgOCwKKwkJCQlhcGxpY19wbGljX2lkCTogIDg7CisJCX07CisJfTsKKwl1bnNpZ25l
ZCBsb25nCQloYXJ0X2lkOworCXU2NAkJCWltc2ljX2FkZHI7CisJdTMyCQkJaW1zaWNfc2l6ZTsK
K307CisKK3N0YXRpYyB1MzIgbnJfcmludGM7CitzdGF0aWMgc3RydWN0IHJpbnRjX2RhdGEgKnJp
bnRjX2FjcGlfZGF0YVtOUl9DUFVTXTsKKworI2RlZmluZSBmb3JfZWFjaF9tYXRjaGluZ19wbGlj
KF9wbGljX2lkKQkJCQlcCisJdW5zaWduZWQgaW50IF9wbGljOwkJCQkJCVwKKwkJCQkJCQkJCVwK
Kwlmb3IgKF9wbGljID0gMDsgX3BsaWMgPCBucl9yaW50YzsgX3BsaWMrKykJCQlcCisJCWlmIChy
aW50Y19hY3BpX2RhdGFbX3BsaWNdLT5hcGxpY19wbGljX2lkICE9IF9wbGljX2lkKQlcCisJCQlj
b250aW51ZTsJCQkJCVwKKwkJZWxzZQorCit1bnNpZ25lZCBpbnQgYWNwaV9yaW50Y19nZXRfcGxp
Y19ucl9jb250ZXh0cyh1bnNpZ25lZCBpbnQgcGxpY19pZCkKK3sKKwl1bnNpZ25lZCBpbnQgbmN0
eCA9IDA7CisKKwlmb3JfZWFjaF9tYXRjaGluZ19wbGljKHBsaWNfaWQpCisJCW5jdHgrKzsKKwor
CXJldHVybiBuY3R4OworfQorCitzdGF0aWMgc3RydWN0IHJpbnRjX2RhdGEgKmdldF9wbGljX2Nv
bnRleHQodW5zaWduZWQgaW50IHBsaWNfaWQsIHVuc2lnbmVkIGludCBjdHh0X2lkeCkKK3sKKwl1
bnNpZ25lZCBpbnQgY3R4dCA9IDA7CisKKwlmb3JfZWFjaF9tYXRjaGluZ19wbGljKHBsaWNfaWQp
IHsKKwkJaWYgKGN0eHQgPT0gY3R4dF9pZHgpCisJCQlyZXR1cm4gcmludGNfYWNwaV9kYXRhW19w
bGljXTsKKworCQljdHh0Kys7CisJfQorCisJcmV0dXJuIE5VTEw7Cit9CisKK3Vuc2lnbmVkIGxv
bmcgYWNwaV9yaW50Y19leHRfcGFyZW50X3RvX2hhcnRpZCh1bnNpZ25lZCBpbnQgcGxpY19pZCwg
dW5zaWduZWQgaW50IGN0eHRfaWR4KQoreworCXN0cnVjdCByaW50Y19kYXRhICpkYXRhID0gZ2V0
X3BsaWNfY29udGV4dChwbGljX2lkLCBjdHh0X2lkeCk7CisKKwlyZXR1cm4gZGF0YSA/IGRhdGEt
PmhhcnRfaWQgOiBJTlZBTElEX0hBUlRJRDsKK30KKwordW5zaWduZWQgaW50IGFjcGlfcmludGNf
Z2V0X3BsaWNfY29udGV4dCh1bnNpZ25lZCBpbnQgcGxpY19pZCwgdW5zaWduZWQgaW50IGN0eHRf
aWR4KQoreworCXN0cnVjdCByaW50Y19kYXRhICpkYXRhID0gZ2V0X3BsaWNfY29udGV4dChwbGlj
X2lkLCBjdHh0X2lkeCk7CisKKwlyZXR1cm4gZGF0YSA/IGRhdGEtPmNvbnRleHRfaWQgOiBJTlZB
TElEX0NPTlRFWFQ7Cit9CisKK3Vuc2lnbmVkIGxvbmcgYWNwaV9yaW50Y19pbmRleF90b19oYXJ0
aWQodTMyIGluZGV4KQoreworCXJldHVybiBpbmRleCA+PSBucl9yaW50YyA/IElOVkFMSURfSEFS
VElEIDogcmludGNfYWNwaV9kYXRhW2luZGV4XS0+aGFydF9pZDsKK30KKworaW50IGFjcGlfcmlu
dGNfZ2V0X2ltc2ljX21taW9faW5mbyh1MzIgaW5kZXgsIHN0cnVjdCByZXNvdXJjZSAqcmVzKQor
eworCWlmIChpbmRleCA+PSBucl9yaW50YykKKwkJcmV0dXJuIC0xOworCisJcmVzLT5zdGFydCA9
IHJpbnRjX2FjcGlfZGF0YVtpbmRleF0tPmltc2ljX2FkZHI7CisJcmVzLT5lbmQgPSByZXMtPnN0
YXJ0ICsgcmludGNfYWNwaV9kYXRhW2luZGV4XS0+aW1zaWNfc2l6ZSAtIDE7CisJcmVzLT5mbGFn
cyA9IElPUkVTT1VSQ0VfTUVNOworCXJldHVybiAwOworfQorCiBzdGF0aWMgaW50IF9faW5pdCBy
aXNjdl9pbnRjX2FjcGlfaW5pdCh1bmlvbiBhY3BpX3N1YnRhYmxlX2hlYWRlcnMgKmhlYWRlciwK
IAkJCQkgICAgICAgY29uc3QgdW5zaWduZWQgbG9uZyBlbmQpCiB7CkBAIC0yNTgsNiArMzM3LDE1
IEBAIHN0YXRpYyBpbnQgX19pbml0IHJpc2N2X2ludGNfYWNwaV9pbml0KHVuaW9uIGFjcGlfc3Vi
dGFibGVfaGVhZGVycyAqaGVhZGVyLAogCWludCByYzsKIAogCXJpbnRjID0gKHN0cnVjdCBhY3Bp
X21hZHRfcmludGMgKiloZWFkZXI7CisJcmludGNfYWNwaV9kYXRhW25yX3JpbnRjXSA9IGt6YWxs
b2Moc2l6ZW9mKCpyaW50Y19hY3BpX2RhdGFbMF0pLCBHRlBfS0VSTkVMKTsKKwlpZiAoIXJpbnRj
X2FjcGlfZGF0YVtucl9yaW50Y10pCisJCXJldHVybiAtRU5PTUVNOworCisJcmludGNfYWNwaV9k
YXRhW25yX3JpbnRjXS0+ZXh0X2ludGNfaWQgPSByaW50Yy0+ZXh0X2ludGNfaWQ7CisJcmludGNf
YWNwaV9kYXRhW25yX3JpbnRjXS0+aGFydF9pZCA9IHJpbnRjLT5oYXJ0X2lkOworCXJpbnRjX2Fj
cGlfZGF0YVtucl9yaW50Y10tPmltc2ljX2FkZHIgPSByaW50Yy0+aW1zaWNfYWRkcjsKKwlyaW50
Y19hY3BpX2RhdGFbbnJfcmludGNdLT5pbXNpY19zaXplID0gcmludGMtPmltc2ljX3NpemU7CisJ
bnJfcmludGMrKzsKIAogCS8qCiAJICogVGhlIEFDUEkgTUFEVCB3aWxsIGhhdmUgb25lIElOVEMg
Zm9yIGVhY2ggQ1BVIChvciBIQVJUKQpAQCAtMjc3LDYgKzM2NSw4IEBAIHN0YXRpYyBpbnQgX19p
bml0IHJpc2N2X2ludGNfYWNwaV9pbml0KHVuaW9uIGFjcGlfc3VidGFibGVfaGVhZGVycyAqaGVh
ZGVyLAogCXJjID0gcmlzY3ZfaW50Y19pbml0X2NvbW1vbihmbiwgJnJpc2N2X2ludGNfY2hpcCk7
CiAJaWYgKHJjKQogCQlpcnFfZG9tYWluX2ZyZWVfZndub2RlKGZuKTsKKwllbHNlCisJCWFjcGlf
c2V0X2lycV9tb2RlbChBQ1BJX0lSUV9NT0RFTF9SSU5UQywgcmlzY3ZfYWNwaV9nZXRfZ3NpX2Rv
bWFpbl9pZCk7CiAKIAlyZXR1cm4gcmM7CiB9Ci0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
