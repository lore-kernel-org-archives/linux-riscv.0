Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD41C52D7C
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 01:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDSdXT+/25tukKINeWiVwbEFy6E/k8M9nvWNTGOKbLk=; b=meVTCQlJGwvWOe
	mZWuCVGiiZyp7ac57qPSgjix1iYqJxws6gGz/Sq46bH5rAXTN5GXayASQ7eBN8nbVI5mmw/bK3ANI
	vXU8ZWF5h/Zx0G7EJRf1bN/D5q46879CM4qF3YuhGrZk/fK9JTiLZ/szrC0KIu1d1itewZXCmrLvH
	wT6OvbumDAipzKCfrwkTyEEkOjiU3lMznDW1lxAqVTQ1TSevV1nolzzmGDrCu/EZJ1i7XqCa3tnlh
	Ta5Wew6DJhH+HTO+RJS5b1FQN+j3T/YKXbRi+xoR49EOTte21PfTJUE2WsLHBTCM89diQvXm61fi+
	fHTQcuixW5iI8hP20PGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJTn-0000000GbZi-1hVU;
	Mon, 12 Aug 2024 01:04:11 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJQ4-0000000Ga1K-06Kv
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 01:00:21 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3db12a2f530so2893741b6e.1
        for <linux-riscv@lists.infradead.org>; Sun, 11 Aug 2024 18:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723424419; x=1724029219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVnO8D9tH0sab/WeUvbej3ReIYXoTsQSEaRkiw5yKWo=;
        b=PDGh1BxxbdIhHoHT8s4NUda0rTY8E+SdvytRhN4M1FBwhU/n03jhrjA7JvQ6JwZbb5
         FaBhNqGdvYnpvDSA2CemxWuOfRwAv5kP9XDyHe/thasgje4hkPl+zSwvxANhCPrGGi43
         pgIAXWg3zNt4nZ3TKzP/lTcCSqChAfsvqtT8OVvrYjqzK+4t6UsHSRqmhs7JxeitIOl0
         /Qm5d9oJI7GxyPgpyRgJAvguCdYuaPSKI+MnfsJQfcssbpKh6Iem8jJ2eZBZA0gB0s3T
         icwO+3nER61Wmy8rh7KQD2OOTXWl0LNhcAJIT9MZv0TDwDe2TIFmbjQEWp1V+jegCddh
         lTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723424419; x=1724029219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVnO8D9tH0sab/WeUvbej3ReIYXoTsQSEaRkiw5yKWo=;
        b=i5r2NG53W7g4C/2EHa82dHPQHyowermHt/84fXxFFfQBCGtWJQPV6V+mpbMgrj0sRl
         tE8CZgdgF1UQVodgwSqW0MiR8Ussb+Z2IYHbxF5NPXKqEYdGgptmmymHO/wo5YhHiQEt
         d/biae5xZoSfsUiStxX7GIRp9Lip+zjKGc4pg1t5abjYDmh5ZrMb6gMkdIW6cpd/HXks
         Ab6sGige/ylXPseQMNMWiQHkfSbJClL4nRfDt3Oqm//LqJB+p6RgHavzoQTEQ0zrhqdi
         3KxrRLxfPyPslFotzqbxkhNMYPAov4eH1vvYzHzWHiG9n6L2ZGPrb7upFiAgATdfcjPI
         eGDA==
X-Forwarded-Encrypted: i=1; AJvYcCWFAVwcSwWXtVEb/5JtE1ErdGmvlp8mUT2evlh1kpVBekn1vXOTL77/IyYK4NdXcHreSxXBR0u+p0Ya3Yr8tW6KRRQRtDNUTobCXq0PWA+a
X-Gm-Message-State: AOJu0YxHMgkllox0Euow2Gma30BEaRRGFwrwvQtyTMjVBEQNy0TKARsa
	f1hy14Mu3TewycuMkSOqO4yWwF/+HDEdSwWBMCXSW2gQuHNwM8VqFhBQDaIXeiE=
X-Google-Smtp-Source: AGHT+IGgnQrX14dxOj3yn291622Lxvm1iCgbP6yN6u9XpX8bxmUnRZf2Nt8a7HJ6YawHB1+ioO6EHA==
X-Received: by 2002:a05:6808:1513:b0:3dc:299d:c4fb with SMTP id 5614622812f47-3dc416ec02cmr12205900b6e.40.1723424418770;
        Sun, 11 Aug 2024 18:00:18 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c3dbe8cbdcsm3074062a12.61.2024.08.11.18.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 18:00:18 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v8 06/17] ACPI: scan: Define weak function to populate dependencies
Date: Mon, 12 Aug 2024 06:29:18 +0530
Message-ID: <20240812005929.113499-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812005929.113499-1-sunilvl@ventanamicro.com>
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_180020_088929_DEFC4AFD 
X-CRM114-Status: GOOD (  13.05  )
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

U29tZSBhcmNoaXRlY3R1cmVzIGxpa2UgUklTQy1WIG5lZWQgdG8gYWRkIGRlcGVuZGVuY2llcyB3
aXRob3V0IGV4cGxpY2l0Cl9ERVAuIERlZmluZSBhIHdlYWsgZnVuY3Rpb24gd2hpY2ggY2FuIGJl
IGltcGxlbWVudGVkIGJ5IHRoZSBhcmNoaXRlY3R1cmUuCgpTaWduZWQtb2ZmLWJ5OiBTdW5pbCBW
IEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4KVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxi
am9ybkByaXZvc2luYy5jb20+Ci0tLQogZHJpdmVycy9hY3BpL3NjYW4uYyAgICAgfCAxMSArKysr
KysrKysrKwogaW5jbHVkZS9hY3BpL2FjcGlfYnVzLmggfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvc2Nhbi5jIGIvZHJp
dmVycy9hY3BpL3NjYW4uYwppbmRleCAzOWIzY2NhZTlmNzkuLjI4YTIyMWY5NTZkNyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9hY3BpL3NjYW4uYworKysgYi9kcml2ZXJzL2FjcGkvc2Nhbi5jCkBAIC0y
MDc3LDExICsyMDc3LDIyIEBAIHN0YXRpYyB2b2lkIGFjcGlfc2Nhbl9pbml0X2hvdHBsdWcoc3Ry
dWN0IGFjcGlfZGV2aWNlICphZGV2KQogCX0KIH0KIAordTMyIF9fd2VhayBhcmNoX2FjcGlfYWRk
X2F1dG9fZGVwKGFjcGlfaGFuZGxlIGhhbmRsZSkgeyByZXR1cm4gMDsgfQorCiBzdGF0aWMgdTMy
IGFjcGlfc2Nhbl9jaGVja19kZXAoYWNwaV9oYW5kbGUgaGFuZGxlKQogewogCXN0cnVjdCBhY3Bp
X2hhbmRsZV9saXN0IGRlcF9kZXZpY2VzOwogCXUzMiBjb3VudCA9IDA7CiAKKwkvKgorCSAqIFNv
bWUgYXJjaGl0ZWN0dXJlcyBsaWtlIFJJU0MtViBuZWVkIHRvIGFkZCBkZXBlbmRlbmNpZXMgZm9y
CisJICogYWxsIGRldmljZXMgd2hpY2ggdXNlIEdTSSB0byB0aGUgaW50ZXJydXB0IGNvbnRyb2xs
ZXIgc28gdGhhdAorCSAqIGludGVycnVwdCBjb250cm9sbGVyIGlzIHByb2JlZCBiZWZvcmUgYW55
IG9mIHRob3NlIGRldmljZXMuCisJICogSW5zdGVhZCBvZiBtYW5kYXRpbmcgX0RFUCBvbiBhbGwg
dGhlIGRldmljZXMsIGRldGVjdCB0aGUKKwkgKiBkZXBlbmRlbmN5IGFuZCBhZGQgYXV0b21hdGlj
YWxseS4KKwkgKi8KKwljb3VudCArPSBhcmNoX2FjcGlfYWRkX2F1dG9fZGVwKGhhbmRsZSk7CisK
IAkvKgogCSAqIENoZWNrIGZvciBfSElEIGhlcmUgdG8gYXZvaWQgZGVmZXJyaW5nIHRoZSBlbnVt
ZXJhdGlvbiBvZjoKIAkgKiAxLiBQQ0kgZGV2aWNlcy4KZGlmZiAtLWdpdCBhL2luY2x1ZGUvYWNw
aS9hY3BpX2J1cy5oIGIvaW5jbHVkZS9hY3BpL2FjcGlfYnVzLmgKaW5kZXggZDZhNGRkNThlMzZm
Li5hZjcyYTVkOWRlOTkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvYWNwaS9hY3BpX2J1cy5oCisrKyBi
L2luY2x1ZGUvYWNwaS9hY3BpX2J1cy5oCkBAIC05OTQsNiArOTk0LDcgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIGFjcGlfcHV0X2FjcGlfZGV2KHN0cnVjdCBhY3BpX2RldmljZSAqYWRldikKIGludCBh
Y3BpX3dhaXRfZm9yX2FjcGlfaXBtaSh2b2lkKTsKIAogaW50IGFjcGlfc2Nhbl9hZGRfZGVwKGFj
cGlfaGFuZGxlIGhhbmRsZSwgc3RydWN0IGFjcGlfaGFuZGxlX2xpc3QgKmRlcF9kZXZpY2VzKTsK
K3UzMiBhcmNoX2FjcGlfYWRkX2F1dG9fZGVwKGFjcGlfaGFuZGxlIGhhbmRsZSk7CiAjZWxzZQkv
KiBDT05GSUdfQUNQSSAqLwogCiBzdGF0aWMgaW5saW5lIGludCByZWdpc3Rlcl9hY3BpX2J1c190
eXBlKHZvaWQgKmJ1cykgeyByZXR1cm4gMDsgfQotLSAKMi40My4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
