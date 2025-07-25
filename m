Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E479BC87FD1
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 16:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yM9v9AcRKnI4qVE6xThZ0Z4jqsH9AFl06OEfXK3y3U4=; b=PVZSLcL2g94hmU
	VTkJszDgzT+9C4qKGrLEGcbUouu1TXftnPvBjuRqZY0/oBbtFmxH51Uq/RxV9WOcPkJVZxd4F/zmt
	ck4yM57tH0rWjs/JEX1j4993jdWjGFPcX2jF7ww1TyER1XeizEtPR80Er9l1324OUhoZ2cKVtPI9O
	oANW+ATQuaboOfzBdxR+Nbx8YqI+I20I1uM/FCmwjbHFe3LDkzrokeFTQ/WBknpv+gjD0+LyftjPk
	NOjEXQbi30BX59AQsxeBKlkE0kzDe2P0xK8yeKUHmsA4FLjw4ByTWJ53SvVlhoNxFWQBkAuIUpnFb
	qSnJBPdbWG/HcRMCkmxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLkz-0000000AGwl-3nCt;
	Fri, 25 Jul 2025 16:58:53 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLjC-0000000AGcc-3VVO
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 16:57:03 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so182062f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 09:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753462621; x=1754067421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5wCo50uCFgJpMI7LbHbH8s69mNDIY7eBkEPfxQyUMI=;
        b=fGJpaLcO1jNo7uXgxQfNou+Kxn3ooVcjMJUVLoL0eAUUvPdNiliT+kCw0Kd8c7W+5t
         wifNhss1n+J2PNadxFUBY9bkTCljamKUYn3onpadNLNexqwQTH1YSBrTau4DuwSpskHn
         udtkuX/1SKQ7lO4uhqJKvZcZ9bxmW/Wfoz69qlviwMS9F4wsQDi8ZR/Ag9dXEeGXWWer
         jcmJJS0uHPbVtHgc/dkh8s6OCiP+XHhbo50qNEHGedNv/KVzuaVdMS5b6ix3/X4DEeOi
         7E7hUo7SUpYV0pjszP3pspFGQTbsMZLEWvtg2K91GNfKIjhOAbx1GwByNaA9gAzKH96c
         CZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753462621; x=1754067421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5wCo50uCFgJpMI7LbHbH8s69mNDIY7eBkEPfxQyUMI=;
        b=Mp8al5NQ13/RNyWVynwxqgJPiPCqjQp/1z+KpTNu0jWmazCG6Hua0hr80uqQELjKdN
         glkpWXZ/9h/S3Bi40IzFmDURX8V9fUdwG0sIOfWUbukn5yBmxFTCQpDNyF+eRtAGeKMs
         zb4nUB8LQ4LjxZr/2bgitEhZDXh7wp9tNRbf9xPSEn48AcZbwx7fVczRUqOoxz4A8mNS
         yCzWKbRvuAo738NQJpMPWq4Gn+8QC+nhrqJOrbN8iR7hWih5tk9vhS+RkYHyBtLJPrRh
         8c3/BJoFwf72QkGUewcewvBIlZsYvx5JuUMooyhiBdSHlbwuvqNS185SInPUTyFQKTYt
         a3fA==
X-Gm-Message-State: AOJu0Yy8XytVZFZCBKc2ag2s7g28M5ONoyggVLmVwqgUTrAFEsk4MCPz
	3jOY5UP15N+O2Vf9xMVLfyanWnpuivVnS+4QTKXHerNGvtzUDtNLn3NRjvlxnEXO10dKcubv7Hq
	4QT6W
X-Gm-Gg: ASbGncsNaWBNN9CNyRNh6817+MVm0qefpieLW2TVabdfT0FVr3YpeVpZIMMAaKXJYuQ
	AWBgR9dyzD9uJsu1FkH4EcokMe1z7QAMuZeRThjf8NtJt/3RrohoG0QjCN2Bx6cFT7q0OHkhY61
	scPK4nYX2lrINERFSbPRLqWx4hHW3I+e191t6JfhJrrgoEjKz+w6+PwDKBXfofgHM1aS//Av/4K
	gADEatqPzfOlUAA+l0l0u55SiDHZxH/jiO2368Z4rcJzJcGKDQ6dr4nMUrHnTJg+50cHVptAydS
	Jb+XZ/jdZDGtIyqJ9sInXWGE5qubMBYfE5xJNM5nEL0w5PyEq4CgWbwUdx7Kx+VOkUqIigeFvoD
	+x/KRAvVheWrFiNFknzdu7DeLj68khA==
X-Google-Smtp-Source: AGHT+IFE0VwAz2zEeGx2Qzxk8E6WuBhcU7HaGl2wpgJlNEjaoTX1yD9xeYguw1eB6wx5XJ8Oij5/AQ==
X-Received: by 2002:a5d:5f92:0:b0:3a5:3369:391c with SMTP id ffacd0b85a97d-3b7766d2d43mr701824f8f.1.1753462620875;
        Fri, 25 Jul 2025 09:57:00 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8c15:2281:5347:b367])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b778eb9eaasm401817f8f.24.2025.07.25.09.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 09:57:00 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>,
	stable@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 1/4] riscv: use lw when reading int cpu in new_vmalloc_check
Date: Fri, 25 Jul 2025 18:54:09 +0200
Message-ID: <20250725165410.2896641-4-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250725165410.2896641-3-rkrcmar@ventanamicro.com>
References: <20250725165410.2896641-3-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_095702_876286_D27FDFF7 
X-CRM114-Status: GOOD (  10.72  )
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

UkVHX0wgaXMgd3JvbmcsIGJlY2F1c2UgdGhyZWFkX2luZm8uY3B1IGlzIDMyLWJpdCwgbm90IHhs
ZW4tYml0IHdpZGUuClRoZSBzdHJ1Y3QgY3VycmVudGx5IGhhcyBhIGhvbGUgYWZ0ZXIgY3B1LCBz
byBsaXR0bGUgZW5kaWFuIGFjY2Vzc2VzCnNlZW1lZCBmaW5lLgoKRml4ZXM6IDUwMzYzOGUwYmFi
ZiAoInJpc2N2OiBTdG9wIGVtaXR0aW5nIHByZXZlbnRpdmUgc2ZlbmNlLnZtYSBmb3IgbmV3IHZt
YWxsb2MgbWFwcGluZ3MiKQpDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ClJldmlld2VkLWJ5
OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+ClNpZ25lZC1vZmYtYnk6
IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgotLS0KdjI6IHNwbGl0
IGZvciBzdGFibGUgW0FsZXhdCi0tLQogYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5T
CmluZGV4IDc1NjU2YWZhMmQ2Yi4uNGZkZjE4N2E2MmJmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC9lbnRyeS5TCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKQEAgLTQ2LDcg
KzQ2LDcgQEAKIAkgKiBhMCA9ICZuZXdfdm1hbGxvY1tCSVRfV09SRChjcHUpXQogCSAqIGExID0g
QklUX01BU0soY3B1KQogCSAqLwotCVJFR19MIAlhMiwgVEFTS19USV9DUFUodHApCisJbHcJYTIs
IFRBU0tfVElfQ1BVKHRwKQogCS8qCiAJICogQ29tcHV0ZSB0aGUgbmV3X3ZtYWxsb2MgZWxlbWVu
dCBwb3NpdGlvbjoKIAkgKiAoY3B1IC8gNjQpICogOCA9IChjcHUgPj4gNikgPDwgMwotLSAKMi41
MC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
