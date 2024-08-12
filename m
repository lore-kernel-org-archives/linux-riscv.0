Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A509C52D7C
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 01:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NyT6cN8D5liKpPSjxuT+WNfJdW5iQPmfWVPhMOf6F2U=; b=07CQPKfevBkSpr
	bfzCyWO41QoGvpFTrBisNqQD6Z6FQufMPZ4EFLKbiVyOUI3RsbluxeUdiYkYljTXk2XWB8qb5DE6u
	fG2bMiAoZYoFjs02jcGJWFKImtuBwMNpLtOtwHnLB5NviDlGIFd4eJ9pomkqwmNGCMz8lJmK/qMn+
	QD63dWVaTGez4YLsDnF4bCMLjNX8Jdy6m4z7ia6iAaiEsXHaPjqFQ5nJUBzxbqbeuQtRnB7x51o5/
	BHLN6WTlua7387E1HPuUMgkD/PjzREZSE4mu+Y/JJe3OKr7PCE21QXVw6dQqydGmvVOLpc7y8NAHg
	5AOuBaa4SiQGbgB8HH3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJVm-0000000Gc2f-37lB;
	Mon, 12 Aug 2024 01:06:14 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJQT-0000000GaDB-3Icl
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 01:00:47 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5d5bb03fe42so1988340eaf.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 Aug 2024 18:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723424444; x=1724029244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbG/jHg21LcLoDzwk6IzVsucBn3jZiDtmvIm1r3v9tk=;
        b=jrEfLovZJ6qM50knRFvZMu9GISbyg/53AZNIrTy07Lf03A1kvDs0/3qMYbQcjW6HzF
         Gax+uhqdMzdP/6+4LB32hwB13vILKmoWmQcRbcI7RWig5Y1WM2coPOLODt1CCuA8KF8H
         wBO0qRuOLCicDJvQnlilvjRqu7eBtxnw9H2+f2cDezTz37vl1ioPwo7US9K/gPFzHiSw
         G1afJd98zNWsb2cjOH39JIRIPuYm2uhtOmS7MIuB/zEUefTxYe+fpe563E5zNzDt6nHw
         wc/V4xilaz//jvVIzyxDpVlBqtXJH6amltuxdz5DbFaRzzmOYlD7+EW4EUr5gInQcrbb
         dqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723424444; x=1724029244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbG/jHg21LcLoDzwk6IzVsucBn3jZiDtmvIm1r3v9tk=;
        b=vcagfr7PLyyhmo1lgsgAsYKhCsCyK/gFN3jtV9n4MhXfjUEyNrqkygjvHwQaJMJu67
         bBFsW1iLeAEBsudCOCeWF/JgT9GW5jgKSmjxGWm1bK4EYVvZxN8s6NZGDymlBkT3LlO8
         5Qe3i5op/DTY72aY0Z7O37CeF7QsR0U06KEvsb6vbGVE+OqcO4FVz+cVKRxPxiGL+9PL
         0dXaWaJ0ssOa6jrMuXdOZpB/aHuzkMS/rmQTjm16w2rV3WWiFq9iYp/NPMQXF78ZahUJ
         /uxnDqgpLcC7iag5vYO0+2hnhlFSFemWuBV1PzA5Mc5d3t3Lgtmsj9GqKWLkW4C36Zkl
         u0sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDtoia3N4FCiIF3XkItE+aAX42j/3uGGvTMdZrhoFXqxZGOhVNi6DCJczqbi+qldXGjDLfKBvfq4TuVt1dum0UgzKU7xvrYmB6Fo2EGv8S
X-Gm-Message-State: AOJu0YwZl+rjVgT+1/MtNn3HxqVB7sKRbGOX6SOXJJql1QCRmNxsvsit
	t3BeIBJ54weChXVnOz8ayfv6svboRq3IoUs25gcM5qIzQiT0W4UlsJFUFeI86GA=
X-Google-Smtp-Source: AGHT+IGtpWS7DBc6qnLRa7J1XKsHLrlfePxKw3cHvC5D7SmpvnVph24/oUKeRjRFTeAU1sM99c7TNA==
X-Received: by 2002:a05:6870:1585:b0:260:e7f9:f4e9 with SMTP id 586e51a60fabf-26c62f21db8mr8563110fac.35.1723424444123;
        Sun, 11 Aug 2024 18:00:44 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c3dbe8cbdcsm3074062a12.61.2024.08.11.18.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 18:00:43 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v8 10/17] ACPI: RISC-V: Implement function to reorder irqchip probe entries
Date: Mon, 12 Aug 2024 06:29:22 +0530
Message-ID: <20240812005929.113499-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812005929.113499-1-sunilvl@ventanamicro.com>
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_180045_849104_AEFB48C4 
X-CRM114-Status: GOOD (  16.17  )
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

T24gUklTQy1WIHBsYXRmb3JtcywgdGhlIFJJTlRDIHN0cnVjdHVyZXMgc2hvdWxkIGJlIHByb2Jl
ZCBiZWZvcmUgYW55Cm90aGVyIGludGVycnVwdCBjb250cm9sbGVyIHN0cnVjdHVyZXMgYW5kIElN
U0lDIGJlZm9yZSBBUExJQy4gVGhpcyBvcmRlcgppcyBlc3RhYmxpc2hlZCBieSB1c2luZyBNQURU
IHN1YiB0YWJsZSB0eXBlcyB3aGljaCBhcmUgb3JkZXJlZCBpbiB0aGUKaW5jcmVtZW50YWwgb3Jk
ZXIgZnJvbSB0aGUgUklOVEMuIFNvLCBhZGQgdGhlIGFyY2hpdGVjdHVyZSBmdW5jdGlvbiBmb3IK
UklTQy1WIHRvIHJlb3JkZXIgdGhlIGludGVycnVwdCBjb250cm9sbGVyIHByb2JpbmcgYXMgcGVy
IHRoZSBoaWVyYXJjaHkKbGlrZSBiZWxvdy4KCiAgQUNQSV9NQURUX1RZUEVfUklOVEMgPSAyNCwK
ICBBQ1BJX01BRFRfVFlQRV9JTVNJQyA9IDI1LAogIEFDUElfTUFEVF9UWVBFX0FQTElDID0gMjYs
CiAgQUNQSV9NQURUX1RZUEVfUExJQyA9IDI3CgpUaGlzIG1lYW5zIHByb2Nlc3NpbmcgYWxsIFJJ
TlRDIHN0cnVjdHVyZXMgKGluIHRoZSBvcmRlciBvZiBhcHBlYXJhbmNlCmluIE1BRFQpLCBmb2xs
b3dlZCBieSBJTVNJQyBzdHJ1Y3V0cmUgYW5kIHRoZW4gYWxsIEFQTElDL1BMSUMKc3RydWN0dXJl
cy4KClNpZ25lZC1vZmYtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgpU
ZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCiBkcml2ZXJz
L2FjcGkvcmlzY3YvTWFrZWZpbGUgfCAgMiArLQogZHJpdmVycy9hY3BpL3Jpc2N2L2lycS5jICAg
IHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQs
IDM0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2FjcGkvcmlzY3YvaXJxLmMKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvcmlzY3YvTWFr
ZWZpbGUgYi9kcml2ZXJzL2FjcGkvcmlzY3YvTWFrZWZpbGUKaW5kZXggODc3ZGUwMGQxYjUwLi5h
OTZmZGYxZTJjYjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYWNwaS9yaXNjdi9NYWtlZmlsZQorKysg
Yi9kcml2ZXJzL2FjcGkvcmlzY3YvTWFrZWZpbGUKQEAgLTEsNCArMSw0IEBACiAjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKLW9iai15CQkJCQkrPSByaGN0Lm8gaW5pdC5v
CitvYmoteQkJCQkJKz0gcmhjdC5vIGluaXQubyBpcnEubwogb2JqLSQoQ09ORklHX0FDUElfUFJP
Q0VTU09SX0lETEUpCSs9IGNwdWlkbGUubwogb2JqLSQoQ09ORklHX0FDUElfQ1BQQ19MSUIpCQkr
PSBjcHBjLm8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9yaXNjdi9pcnEuYyBiL2RyaXZlcnMv
YWNwaS9yaXNjdi9pcnEuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAu
LjgzNWViNmVjY2Q1MwotLS0gL2Rldi9udWxsCisrKyBiL2RyaXZlcnMvYWNwaS9yaXNjdi9pcnEu
YwpAQCAtMCwwICsxLDMzIEBACisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5CisvKgorICogQ29weXJpZ2h0IChDKSAyMDIzLTIwMjQsIFZlbnRhbmEgTWljcm8gU3lzdGVt
cyBJbmMKKyAqCUF1dGhvcjogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+Cisg
Ki8KKworI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4KKyNpbmNsdWRlIDxsaW51eC9zb3J0Lmg+CisK
K3N0YXRpYyBpbnQgaXJxY2hpcF9jbXBfZnVuYyhjb25zdCB2b2lkICppbjAsIGNvbnN0IHZvaWQg
KmluMSkKK3sKKwlzdHJ1Y3QgYWNwaV9wcm9iZV9lbnRyeSAqZWxlbTAgPSAoc3RydWN0IGFjcGlf
cHJvYmVfZW50cnkgKilpbjA7CisJc3RydWN0IGFjcGlfcHJvYmVfZW50cnkgKmVsZW0xID0gKHN0
cnVjdCBhY3BpX3Byb2JlX2VudHJ5ICopaW4xOworCisJcmV0dXJuIChlbGVtMC0+dHlwZSA+IGVs
ZW0xLT50eXBlKSAtIChlbGVtMC0+dHlwZSA8IGVsZW0xLT50eXBlKTsKK30KKworLyoKKyAqIE9u
IFJJU0MtViwgUklOVEMgc3RydWN0dXJlcyBpbiBNQURUIHNob3VsZCBiZSBwcm9iZWQgYmVmb3Jl
IGFueSBvdGhlcgorICogaW50ZXJydXB0IGNvbnRyb2xsZXIgc3RydWN0dXJlcyBhbmQgSU1TSUMg
YmVmb3JlIEFQTElDLiBUaGUgaW50ZXJydXB0CisgKiBjb250cm9sbGVyIHN1YnR5cGVzIGluIE1B
RFQgb2YgQUNQSSBzcGVjIGZvciBSSVNDLVYgYXJlIGRlZmluZWQgaW4KKyAqIHRoZSBpbmNyZW1l
bnRhbCBvcmRlciBsaWtlIFJJTlRDKDI0KS0+SU1TSUMoMjUpLT5BUExJQygyNiktPlBMSUMoMjcp
LgorICogSGVuY2UsIHNpbXBseSBzb3J0aW5nIHRoZSBzdWJ0eXBlcyBpbiBpbmNyZW1lbnRhbCBv
cmRlciB3aWxsCisgKiBlc3RhYmxpc2ggdGhlIHJlcXVpcmVkIG9yZGVyLgorICovCit2b2lkIGFy
Y2hfc29ydF9pcnFjaGlwX3Byb2JlKHN0cnVjdCBhY3BpX3Byb2JlX2VudHJ5ICphcF9oZWFkLCBp
bnQgbnIpCit7CisJc3RydWN0IGFjcGlfcHJvYmVfZW50cnkgKmFwZSA9IGFwX2hlYWQ7CisKKwlp
ZiAobnIgPT0gMSB8fCAhQUNQSV9DT01QQVJFX05BTUVTRUcoQUNQSV9TSUdfTUFEVCwgYXBlLT5p
ZCkpCisJCXJldHVybjsKKwlzb3J0KGFwZSwgbnIsIHNpemVvZigqYXBlKSwgaXJxY2hpcF9jbXBf
ZnVuYywgTlVMTCk7Cit9Ci0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
