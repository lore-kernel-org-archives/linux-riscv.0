Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66194C61DB2
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 11:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PcAZFPBy84BdqLNlOEUAWqf999yKNL++bBF5CYwNonI=; b=tmL/sCmsXAcgFn
	X/P+hNeMfy8MRTW6NpBO9dYm7k1o6qOpP14PO1zlD01mE+sYJfdq6DEn+eeRI+ubpB+aEOdR/09N8
	hqW5KoEEC4qmMoMPQS1uvyfj975JVisZWVITdMyqGjyGNNggi7MjlRd7W80dT3FKjPvoj3pIMXrSV
	bwV1ro9/WsX4vdlCZRsq1R3bcprbZBawqJyuQt8XJ2ginicGNPlAFv2R02uz875SiUnWzLhYjGC4z
	li5a74nDNcyBPXpLvMehp1voGQSJMUiS3nHnZtGBg1wlen68wBaIoQtWjpwkxrLq6pJkYfsebUl8G
	f3GRkF9jgc9IEyUMyjzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2dD-0000000GC9k-2kjO;
	Fri, 13 Jun 2025 11:31:35 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ243-0000000G7mO-381N
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 10:55:16 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a4f379662cso1750366f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jun 2025 03:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749812113; x=1750416913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9ln5HGGKIXvxuo/p2ea1FkQb90YA+7FEEhjYigED1Q=;
        b=EXSZ5WkyOqCaGITzhHoVd5xfU6Xe+UyHCOjgPYwXH2eFjNO6550pfNwaAl5vYVs+SD
         K1MFBpHQmMd/E7fSNJkZk5PLfyZxBt/rzqwl6ylsVaSsH+m9KthZ9BmLRlrc/mRRM75e
         SHD6EXjf58JytWeKWtIiBPS3trTqU4UHbprOPDnn0kyewTWBlSH5Y2ar4Ld+PRHTGiIY
         9MayvxAsz6TaKkcIfChaW94/mWCk9wWX6D788bLbnCOBNT+/NUPiEaWMork5HlAX3FUq
         KsCQU++sQ/XoYtYRUuJdbfVHbTAcvNrR7Jlwx1DAxRj3vqxWLLqhctFzVkFYD8AB5+HV
         aVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749812113; x=1750416913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u9ln5HGGKIXvxuo/p2ea1FkQb90YA+7FEEhjYigED1Q=;
        b=AAAuERtBUWSp3N+Vsq++L3G1SMLaNFK2DEg+/gwesvWwDvifw7pkBpRGhiMpy1Eoob
         qveUcaxEG7DC+UgzwKbRCcapntxsNuUNE8mGP4/UX0FYsq0z0ppGGy29sBC4jzssqVNF
         HYIpP6yQI4JRfzzJTM/Qafo3z7sSEUEPKNOoOiaS7ChtxT6cwsguQycTdx6dCGiAsH4L
         vvddpOzCKg1HbaOTQNtk6zPJwteCQIt42DB5xTWDVks5w8TpD1/Kj8l0SgSmeY2sn8mQ
         M7aUfNiffScezYLf80JXDaKhfZyZtnK9LtQbRFV3Pdobc2wE+YHFdxKzZExXukwKtLBy
         1Mbg==
X-Gm-Message-State: AOJu0YwsijOCpQ9rUKvulUvablzkS79LKJZYtTeONbGGUsopIR55Xncl
	SqzOMcHeBQN2K1KuE1gjr4FIR7SR4sG+1A6idTDU18PRwj2aV8KxjqBx
X-Gm-Gg: ASbGnctmYhCZyNLGi+5ixinQ7B/RdzJc4PDaUUBWqrmfktwR1mW3umzVPYrxus9GNbG
	XyilEtSpJVQAWVqHsrSoFXHyWngrTVFPl2h+/5l0PQ66r9Obzt18eKp/mSoDu/swHlZ70yONxoU
	pecTGRUCyPjg0rUDEPblykEGo7T3CrKNgZbr/sQIKUSNHSUeaJreAsh4zvuGDb3Q0xT+jE6ukRj
	mJBlr1XI8hh8ORMaiEISU0SsdM3mm61yn48r2i6pKkBDrhZsI3941ZaHmMq0DH2aWUaf3rFKUj2
	qTVXC/KViYWTyuZQ4Hd+K7YGfBy8T0naDIuejYHwEG4Y67FYPjIkRb2TI48kZICsFt6uc8Vlyzd
	frIv4HN3EldhCIiY6zQ9AKtPQ
X-Google-Smtp-Source: AGHT+IFfslJ2aEALYhnP/9BaW3mXjNd6nsmmUKqVe9C01aF5V4kiO/RmoLsZeW15nbsHhQac+oQ4vg==
X-Received: by 2002:a05:6000:258a:b0:3a3:5f36:33ee with SMTP id ffacd0b85a97d-3a568755d12mr2100819f8f.32.1749812113385;
        Fri, 13 Jun 2025 03:55:13 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54b7asm2053143f8f.16.2025.06.13.03.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 03:55:13 -0700 (PDT)
Date: Fri, 13 Jun 2025 11:54:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Atish
 Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH 2/2] RISC-V: make use of variadic sbi_ecall
Message-ID: <20250613115459.6293f929@pumpkin>
In-Reply-To: <20250612145754.2126147-4-rkrcmar@ventanamicro.com>
References: <20250612145754.2126147-2-rkrcmar@ventanamicro.com>
	<20250612145754.2126147-4-rkrcmar@ventanamicro.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_035515_788305_0C0731EB 
X-CRM114-Status: GOOD (  10.94  )
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

T24gVGh1LCAxMiBKdW4gMjAyNSAxNjo1Nzo1NSArMDIwMApSYWRpbSBLcsSNbcOhxZkgPHJrcmNt
YXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cgo+IFRoZSBuZXcgc2JpX2VjYWxsIGRvZXNuJ3Qg
aGF2ZSB0byBsaXN0IGFsbCA4IGFyZ3VtZW50cyBhbnltb3JlLCBzbyBvbmx5Cj4gcGFzcyB0aGUg
YWN0dWFsIG51bWJlcnMgb2YgYXJndW1lbnRzIGZvciBlYWNoIFNCSSBmdW5jdGlvbi4KPiAKPiBU
cmFpbGluZyAwIGlzIHNvbWV0aW1lcyBpbnRlbnRpb25hbC4KLi4uCj4gQEAgLTYzMCwxMCArNjMw
LDEwIEBAIHN0YXRpYyBpbnQgcG11X3NiaV9zbmFwc2hvdF9zZXR1cChzdHJ1Y3QgcmlzY3ZfcG11
ICpwbXUsIGludCBjcHUpCj4gIAlpZiAoSVNfRU5BQkxFRChDT05GSUdfMzJCSVQpKQo+ICAJCXJl
dCA9IHNiaV9lY2FsbChTQklfRVhUX1BNVSwgU0JJX0VYVF9QTVVfU05BUFNIT1RfU0VUX1NITUVN
LAo+ICAJCQkJY3B1X2h3X2V2dC0+c25hcHNob3RfYWRkcl9waHlzLAo+IC0JCQkJKHU2NCkoY3B1
X2h3X2V2dC0+c25hcHNob3RfYWRkcl9waHlzKSA+PiAzMiwgMCwgMCwgMCwgMCk7Cj4gKwkJCQko
dTY0KShjcHVfaHdfZXZ0LT5zbmFwc2hvdF9hZGRyX3BoeXMpID4+IDMyKTsKClRoYXQgZG9lc24n
dCBsb29rIHJpZ2h0IChhbmQgb3RoZXIgc2ltaWxhciBvbmVzKS4KVGhlIHZhbHVlcyBhcmUgc3Rp
bGwgNjRiaXQgLSBzbyBnZXQgcGFzc2VkIGFzIHR3byAzMmJpdCB2YWx1ZXMgKGluIHNvbWUgd2F5
KQpzbyB0aGF0IHZhcmFyZ3MgY29kZSB3aWxsIGdldCB0aGUgd3JvbmcgdmFsdWVzLgoKSSBndWVz
cyB0aGUgcHJldmlvdXMgY2hhbmdlIHdhc24ndCB0ZXN0ZWQgb24gMzJiaXQ/CgoJRGF2aWQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
