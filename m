Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4311EC52D7F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 01:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxJsyPjPmaZ1bRqTiTHiuxQdsQ8ICxZqoHHRwd27+Dg=; b=JOtHFoihuPMH1M
	ST2OPXv19V5kv8rF6WP/+qQ5ZVCToBbpqhWNdSxx0C9gBU8kwcSTk+1WSsRs0Eu15qIxsFfabmxCj
	OonSKp/QQT7YMYRGse5okrThVWFjcUQVPTgvSiaZuAW6pfHFy3wMhaR2tbiX5OKo7skEBDATZvmPT
	P0+cR+IjqZce9T8l9i0cVuhr5dRd8v9IFKnSUH17ATiE2PGoYSX2bLa1twOXMVs89qZ4vKG9jU7mb
	Y/NzbC2EoDjsGaoijqcRgOi55NnXh92NHaUQvfW0loPS/GwNHpw4Q+wu7tRzZ3ajYn7222MyxoGwZ
	MaGzp2Cqu6jgiMFmPU7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJSd-0000000Gb9x-2VvR;
	Mon, 12 Aug 2024 01:02:59 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJPx-0000000Ga03-3wJU
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 01:00:15 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7c3e0a3c444so627309a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 11 Aug 2024 18:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723424413; x=1724029213; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJwTiJ9RwivJpxYHWXKjwIEWKuv7B7ooXczAECPccKA=;
        b=l60YLea2Q46D9Dssm/q73F86xG8Vyr83Dt2ficP7+ST5wAiv+E5Z38MELsC1vF4iRJ
         2Ih3S1ogmP/VQNcuQwt0yW0OLGeR5CD6gxmxJNSKEqqZfT3ECBYsQDyTrukfFmrFLM57
         uDcMg3sjfTEj2E7myoRvZ6wkYrHyg2dr2fsvmrlSRC3dbjZIo8yAN0M0khedaKvFHiTh
         uBWk5RWRuM4Fxe6RW1+RoTSCihsNKi+cay/2lx4yNC+AhOIrYE4Mswz9+GCyWnC0bw9G
         tYWYiSJeb5RTNbl373FVh5JudU/yp3cOndDxYZFGXdnUqtyaG4kldSe1V88LM7SH2MO0
         Q7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723424413; x=1724029213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJwTiJ9RwivJpxYHWXKjwIEWKuv7B7ooXczAECPccKA=;
        b=CKxD3lwDRzLXalNBR+LM9Yp8Sfn02Tu3gJctuOhpj41ZCICewIpbm/rWmO20lZOWyv
         Fio3NXxMKosEHHJoqatWd0++yQHkeEEYlBsmQUzmh1+11HXvlYBk8F1wBWxM5bya8AeA
         l/QyGN+PVp/OCvYJa7qpjupBH17mO37eyVhX9CA1nKUBM6y5k1deG/ZIRAZS5kC/B9Td
         LjfJdYsF/XdS9oolmMlNS0cbD/OMTGWxxtngmc9/tFsrR2cY0dGmRsIVQPvBeMt+t/ET
         v8VcbC8C/LnCoVuCTL5bqA7QAmurHDlGhR2756bPrM5tMgkPU4xlf5uAbg0aMcUzLYYS
         q2XQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+6KEdqJid6C/B1cpCFvApAEhflzLFTq8xDRLcNSpBiA3gIuU3c7GLZQtb/OeD7WLzHnY516cXx+5r7USsv0bRv0+E33Irjfr2bSb2vKSk
X-Gm-Message-State: AOJu0YyM4iTZ3x+PWbWYmRFiBj5SbFIQ2zO1wFc6W/aaUoBd7338o2a8
	4DBN1oL5b8CLq2SnO8vDw+ALjKn/8b+YZeB0SGqP0eGf0lsZCNvo7YmAV7WRmQM=
X-Google-Smtp-Source: AGHT+IEe5Qz6cd7b/1zBihHx5AlfGtYBeT8sDhSQ+DFn35gv+sWFK8VgaNh+IQbBrU4whiezDiQL7g==
X-Received: by 2002:a17:902:e5c2:b0:1fd:8f7b:1e88 with SMTP id d9443c01a7336-2009681bff6mr206131935ad.12.1723424412492;
        Sun, 11 Aug 2024 18:00:12 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c3dbe8cbdcsm3074062a12.61.2024.08.11.18.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 18:00:12 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v8 05/17] ACPI: scan: Add RISC-V interrupt controllers to honor list
Date: Mon, 12 Aug 2024 06:29:17 +0530
Message-ID: <20240812005929.113499-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812005929.113499-1-sunilvl@ventanamicro.com>
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_180014_040317_07656E68 
X-CRM114-Status: GOOD (  10.16  )
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

UklTQy1WIFBMSUMgYW5kIEFQTElDIHdpbGwgaGF2ZSBkZXBlbmRlbmN5IGZyb20gZGV2aWNlcyB1
c2luZyBHU0kuIFNvLCBhZGQKdGhlc2UgZGV2aWNlcyB0byB0aGUgaG9ub3IgbGlzdC4KClNpZ25l
ZC1vZmYtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgpUZXN0ZWQtYnk6
IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCiBkcml2ZXJzL2FjcGkvc2Nh
bi5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvYWNwaS9zY2FuLmMgYi9kcml2ZXJzL2FjcGkvc2Nhbi5jCmluZGV4IDM3NGNhZTRh
ZWY3OC4uMzliM2NjYWU5Zjc5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2FjcGkvc2Nhbi5jCisrKyBi
L2RyaXZlcnMvYWNwaS9zY2FuLmMKQEAgLTg2MSw2ICs4NjEsOCBAQCBzdGF0aWMgY29uc3QgY2hh
ciAqIGNvbnN0IGFjcGlfaG9ub3JfZGVwX2lkc1tdID0gewogCSJJTlRDMTA5NSIsIC8qIElWU0Mg
KEFETCkgZHJpdmVyIG11c3QgYmUgbG9hZGVkIHRvIGFsbG93IGkyYyBhY2Nlc3MgdG8gY2FtZXJh
IHNlbnNvcnMgKi8KIAkiSU5UQzEwMEEiLCAvKiBJVlNDIChSUEwpIGRyaXZlciBtdXN0IGJlIGxv
YWRlZCB0byBhbGxvdyBpMmMgYWNjZXNzIHRvIGNhbWVyYSBzZW5zb3JzICovCiAJIklOVEMxMENG
IiwgLyogSVZTQyAoTVRMKSBkcml2ZXIgbXVzdCBiZSBsb2FkZWQgdG8gYWxsb3cgaTJjIGFjY2Vz
cyB0byBjYW1lcmEgc2Vuc29ycyAqLworCSJSU0NWMDAwMSIsIC8qIFJJU0MtViBQTElDICovCisJ
IlJTQ1YwMDAyIiwgLyogUklTQy1WIEFQTElDICovCiAJTlVMTAogfTsKIAotLSAKMi40My4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
