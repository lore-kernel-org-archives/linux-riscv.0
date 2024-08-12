Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD22C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 01:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYurf6cClLI2y+xI+8lRN4RQgJTTxcUmX/sBbe5y/u8=; b=yqX6AoyCAm3/bN
	I672bMCjmN9PQZJrOUP/eDaqcRnK7KvcsjPxGK+a4f95hJJYh7oioZlhTtgcPNZmeOnTJ/HipbWSA
	TB3KqTBx2u85i78+YQnPZEQYlHZr3ZsO1ntKbtnx8z/l9bvZ6iakhyZ8SvmQqx6r0OxG/TuZDP+ov
	7xJ1+49ZbpKOscfnLyQbI75bku5u5KxolzwUipPHOSke9+iDJqHvViae6q7Tp1ZLljz+mQVR5/VHR
	OmNJtHyUYS9WYcqntlv+ymsqTGbN8TRpCEYJ4DxImjavPp49tk7QBq8zSieWLXkKFSUsm56ertd5h
	W+n25B1j6VqCjS8jp4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJUv-0000000Gbqp-3lMS;
	Mon, 12 Aug 2024 01:05:21 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJQG-0000000Ga7H-2Exq
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 01:00:37 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3db51133978so2811220b6e.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 Aug 2024 18:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723424431; x=1724029231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZXNFNaxM8vBPLxvkIIPrWaUY6tMJ6nPhDNbuDGhUyQ=;
        b=XCtVA446Fxre2uFuCk+TmDYP5BZANcp0e9vAUNE+JIzCphmOf1T3ojeTKyB6LzB64a
         pvDp7p2G9yCABGcE+fp6exsw2WiLR/K4lx/NAvBaKokE6vLOA3R7kabA5efyUeTeqdmL
         8zPEbi9Eu9zdjtWsJqT3gg41YqxnZX87qnUXyQsSX5506eeYuwJQXYZesWgBfxigvJhY
         og5ualS/JhKRIINXlwl73iNO9FrmkqMoq/+D7IUNEJ0P+oQSjGGE4Z7ttYD5h48/Dtat
         2MpTdrcPhHncdctJ2ozOzc1KwaFihNDb5Eu7ZI7I1Rb0Oaf4u7bKzya2/H77GcL98WZo
         TjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723424431; x=1724029231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZXNFNaxM8vBPLxvkIIPrWaUY6tMJ6nPhDNbuDGhUyQ=;
        b=dJQuKgWmgxLJDO43KZZOlA714rO/kbd+6lxpOYWkNMbn+aDphKAxXLJWG6bWLJ56Q+
         BHPLJSh3mzFVbCNYVTM6xrYFxwWKhlueNKa1HVOA9om3EhyM+zqj58eV1+7OfiK5JBXv
         yaRhHDmgB+19G+BvlUNnXj9NVTVDUYno0lonJg2wm0h6Gh5ujHqDuRQ5DSrXvEcrsqxg
         N6FmD99aZj49OIe0277KdlQAn8tK2TSkPBWHBfe34iwEeBELSLHeWuGdE4ZENs1hyj1A
         Lw5KlrT5kpd1xjfdoIxHaqxtNeMDz9jy/5CnP9G/ZfroU8VymGO8EynyFCK/yJX/6Q02
         /BTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQSXeOREXHIVT8VBjlmimJbCo1gy5GGFm1/soYxgu48kHdYPHVmQtjMrMyw+fh7yNCsAoM/bzffc4W5ywK6oDJSxxhXBhyUbSlaj+khhLr
X-Gm-Message-State: AOJu0YyHDAbYGPt2/ozJiodNS0PhH8GIOHyFVSm08guAJErvqTVNUBpD
	Mb03w+hNkBysaPz/v6K6zNHXISZMcBVnLW4htCcK3ntm+SwJyphaD8CfoDeuhuE=
X-Google-Smtp-Source: AGHT+IE9UN/eFl1Fb5sxAtzGTPfmVg74o1vo9nXqbGis0UuD39tez7iI9A3QbSPr+XUfKWTJWNIKOQ==
X-Received: by 2002:a05:6808:2f10:b0:3d9:40c2:eb54 with SMTP id 5614622812f47-3dc416688bdmr13217183b6e.5.1723424431425;
        Sun, 11 Aug 2024 18:00:31 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c3dbe8cbdcsm3074062a12.61.2024.08.11.18.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 18:00:30 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v8 08/17] ACPI: pci_link: Clear the dependencies after probe
Date: Mon, 12 Aug 2024 06:29:20 +0530
Message-ID: <20240812005929.113499-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812005929.113499-1-sunilvl@ventanamicro.com>
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_180032_613811_3A21C125 
X-CRM114-Status: GOOD (  12.05  )
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

UklTQy1WIHBsYXRmb3JtcyBuZWVkIHRvIHVzZSBkZXBlbmRlbmNpZXMgYmV0d2VlbiBQQ0kgaG9z
dCBicmlkZ2UsIExpbmsKZGV2aWNlcyBhbmQgdGhlIGludGVycnVwdCBjb250cm9sbGVycyB0byBl
bnN1cmUgcHJvYmUgb3JkZXIuIFRoZQpkZXBlbmRlbmN5IGlzIGxpa2UgYmVsb3cuCgpJbnRlcnJ1
cHQgY29udHJvbGxlciA8LS0gTGluayBEZXZpY2UgPC0tIFBDSSBIb3N0IGJyaWRnZS4KCklmIHRo
ZXJlIGlzIG5vIGRlcGVuZGVuY3kgYmV0d2VlbiBMaW5rIGRldmljZSBhbmQgUENJIEhvc3QgQnJp
ZGdlLAp0aGVuIFBDSSBkZXZpY2VzIG1heSBiZSBwcm9iZWQgcHJpb3IgdG8gTGluayBkZXZpY2Vz
LiAgSWYgYSBQQ0kKZGV2aWNlIGlzIHByb2JlZCBiZWZvcmUgaXRzIExpbmsgZGV2aWNlLCB3ZSB3
b24ndCBiZSBhYmxlIHRvIGZpbmQKaXRzIElOVHggbWFwcGluZy4KClNvLCBhZGQgdGhlIGxpbmsg
ZGV2aWNlJ3MgSElEIHRvIGRlcGVuZGVuY3kgaG9ub3IgbGlzdCBhbmQgY2xlYXIgdGhlCmRlcGVu
ZGVuY3kgYWZ0ZXIgcHJvYmUgaXMgZG9uZSBzbyB0aGF0IHRoZSBkZXBlbmRlbnQgZGV2aWNlcyBh
cmUKdW5ibG9ja2VkIHRvIHByb2JlLgoKU2lnbmVkLW9mZi1ieTogU3VuaWwgViBMIDxzdW5pbHZs
QHZlbnRhbmFtaWNyby5jb20+ClRlc3RlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3Np
bmMuY29tPgotLS0KIGRyaXZlcnMvYWNwaS9wY2lfbGluay5jIHwgMiArKwogZHJpdmVycy9hY3Bp
L3NjYW4uYyAgICAgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9hY3BpL3BjaV9saW5rLmMgYi9kcml2ZXJzL2FjcGkvcGNpX2xpbmsu
YwppbmRleCBhYTEwMzhiOGFlYzQuLmI3MjdkYjk2OGYzMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9h
Y3BpL3BjaV9saW5rLmMKKysrIGIvZHJpdmVycy9hY3BpL3BjaV9saW5rLmMKQEAgLTc0OCw2ICs3
NDgsOCBAQCBzdGF0aWMgaW50IGFjcGlfcGNpX2xpbmtfYWRkKHN0cnVjdCBhY3BpX2RldmljZSAq
ZGV2aWNlLAogCWlmIChyZXN1bHQpCiAJCWtmcmVlKGxpbmspOwogCisJYWNwaV9kZXZfY2xlYXJf
ZGVwZW5kZW5jaWVzKGRldmljZSk7CisKIAlyZXR1cm4gcmVzdWx0IDwgMCA/IHJlc3VsdCA6IDE7
CiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9zY2FuLmMgYi9kcml2ZXJzL2FjcGkvc2Nh
bi5jCmluZGV4IDI4YTIyMWY5NTZkNy4uNzUzNTM5YTFmMjZiIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2FjcGkvc2Nhbi5jCisrKyBiL2RyaXZlcnMvYWNwaS9zY2FuLmMKQEAgLTg2Myw2ICs4NjMsNyBA
QCBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IGFjcGlfaG9ub3JfZGVwX2lkc1tdID0gewogCSJJ
TlRDMTBDRiIsIC8qIElWU0MgKE1UTCkgZHJpdmVyIG11c3QgYmUgbG9hZGVkIHRvIGFsbG93IGky
YyBhY2Nlc3MgdG8gY2FtZXJhIHNlbnNvcnMgKi8KIAkiUlNDVjAwMDEiLCAvKiBSSVNDLVYgUExJ
QyAqLwogCSJSU0NWMDAwMiIsIC8qIFJJU0MtViBBUExJQyAqLworCSJQTlAwQzBGIiwgIC8qIFBD
SSBMaW5rIERldmljZSAqLwogCU5VTEwKIH07CiAKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
