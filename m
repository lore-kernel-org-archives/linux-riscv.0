Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59B9C87FCA
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 16:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drf5y3o5R0cNXJCfTEljK1ZJRLPLThVIJ1j/Xrk2YM8=; b=l4YuvFfh24AhxW
	m2c1JoZceVOW98lgDpDK19OtZ771JQFQoDZfmq++KnlHVKfm3uQKuv/LyIFM+5f3jYuu5dzHXkBcw
	PuTf9Eoyev4Mo9JTxqstY2/b7JjXGf8QXjXt8l+A+svLEBNWl921uz6q8SSMkF6jkqasLUwKCHRXV
	3SEDIP8q5jbHIz87KJviDX+Bvh+RWa8bJkV7yz8VvTMEV2osv0Jm6aP1eLBwj1EWs3rjZGgm517qa
	bQmkNpWRdaZXjNmJByBF/n3Proj38YGUFYoIouWVrHDRspgxcex4MmjcNUZG5Cd7sN9W8AsqnxD3x
	nbG+VxFKQVoKIAHSQPpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLl2-0000000AGzE-0FJO;
	Fri, 25 Jul 2025 16:58:56 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLjG-0000000AGdn-2Z7B
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 16:57:07 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so182075f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 09:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753462625; x=1754067425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9VbmyL9+QKF1DzbApD0b7/eOk9XKkaVSIcHPDqQ4hw=;
        b=oQIulQX6vb++rmUFLNFemvK0ejbzX4DeGq5vek4r1/r5z7ViSRjxXBD+Tpv6HAuJ07
         5Gbp11cIUUczNBZY0TXTr7fFsqH/Y/JGe6IhntUgc4KTgYVhKcE618nhC75iHF5r0VpX
         9iwJDabPjPQ2lh8LWKeq/TAVXxhtCyLExICbhDsN2p53gZpUqJzfXogW+8NqhQatb1We
         UZ+cfShvt2N3vZDlUKWw0545UsY0DS3DwrjOMhWJ3NRs5Mx447uWHM/ZMx+AGWYBSLUH
         AugkwG/cfB+iaJ/b7pa8uFaePLR1WGC4AbZY6EIfSbhTWeESsudyUVbwATB+iqbMQGRN
         UlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753462625; x=1754067425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9VbmyL9+QKF1DzbApD0b7/eOk9XKkaVSIcHPDqQ4hw=;
        b=bFcFKHqrhz7wB5J9CtWk5pj3SqTY4i5AJmnSbQ3CfjYFTinQBmzVH8WJ8T7DgtNWjP
         v4rSZshL+mP3RzrYkrqs7DbJEH013Hmu+CgvsMCnUhE5QPq9fEWPIVklMA1IzfgSKJlu
         1t46vHE18Mfh07dNv1sPydN8IVL6uMvB++RtuviKujOJJgwYHFSYa6/OBni+Tof8xGLB
         pxEcg2M40GNB80FjN900p9xjDVlaIWk4FXLY/5be/2ItWwq3ZgfGUbRlR4Qwu/Q3jrFt
         RRdZxDU6LuDzDWsa7fKli3d2e4UwocFyPi7I32XRxXSOECxGfSFKlV2jbBq1r1mRCUye
         3bHg==
X-Gm-Message-State: AOJu0Yyta4gcQrOA560hD/9ciOfKHjUXJ8uCE9UymRKYU/gTYORFA5A2
	qfGcdB5orseYvNi/+d3bkjBBds/nFURF0TXTRIlrk7G3HBr/FLZ9rL48Xtds6HzsnR32mFidetS
	LqvwR
X-Gm-Gg: ASbGnctE8Lnz6r0N8Tn7nbtfj3zHhSJ7x8pUQr5wObs/Wpj3DG0Ac0nngzW19sR0NMn
	kv3Lk4Ht3rGmznVanpVpts8m6KWm7m8Qak08sP7vPWsaUdr8uAyAB6LpR6hSPItzIE/BT85dS0F
	jmFu12vuIjiyUsJHfoOj1qixMmBpm/ljRIork+3X7deZ+q6ACTakZqC1niNOrsyDFatirmzlkfr
	2yhPkY6Lc8v4iXwt4lx2yOb8ey2J7xxtTkEs2SzhdNITtad/egRLWnlOsQC9+hhUNW1QTJOHAep
	EtYPMZx6S3lz6WRdGtIpJ9t1crWQZz40ig2MylN51yFgTqm4CgPcx3BH9i/elLgLJOxCrZhKGsm
	HDMuMhkrPrmT67RAEVekQvUfebLbW8Q==
X-Google-Smtp-Source: AGHT+IEMmcOAJ8Lb2clpW964OZEOhXcOXMNAGas/lQJJNkqbVlKpOBWjApdb/lzcNbu6yqPgzK3kgg==
X-Received: by 2002:a05:6000:4284:b0:3a5:2dae:970f with SMTP id ffacd0b85a97d-3b776758780mr982964f8f.13.1753462624497;
        Fri, 25 Jul 2025 09:57:04 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8c15:2281:5347:b367])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b778f1e87dsm361748f8f.72.2025.07.25.09.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 09:57:03 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 4/4] riscv: pack rv64 thread_info better
Date: Fri, 25 Jul 2025 18:54:12 +0200
Message-ID: <20250725165410.2896641-7-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250725165410.2896641-3-rkrcmar@ventanamicro.com>
References: <20250725165410.2896641-3-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_095706_649621_E60F433F 
X-CRM114-Status: GOOD (  12.06  )
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

T24gcnY2NCwgcHJlZW1wdF9jb3VudCBhbmQgY3B1IHdlcmUgYm90aCAzMi1iaXQgZm9sbG93ZWQg
YnkgNjQtYml0LCBzbwpwbGFjaW5nIG9uZSBpbiB0aGUgaG9sZSBzYXZlcyA4IGJ5dGVzIGluIHRo
ZSBzdHJ1Y3QuCgpUZXN0ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5j
LmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNv
bT4KU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5j
b20+Ci0tLQp2MjogdGVzdGVkIGFuZCByZXZpZXdlZCBieSBBbGV4Ci0tLQogYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS90aHJlYWRfaW5mby5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS90aHJlYWRfaW5mby5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oCmlu
ZGV4IGY1OTE2YTcwODc5YS4uYzI2N2Q2YmQ4MzhlIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aHJl
YWRfaW5mby5oCkBAIC01Myw2ICs1Myw3IEBACiBzdHJ1Y3QgdGhyZWFkX2luZm8gewogCXVuc2ln
bmVkIGxvbmcJCWZsYWdzOwkJLyogbG93IGxldmVsIGZsYWdzICovCiAJaW50ICAgICAgICAgICAg
ICAgICAgICAgcHJlZW1wdF9jb3VudDsgIC8qIDA9PnByZWVtcHRpYmxlLCA8MD0+QlVHICovCisJ
aW50CQkJY3B1OwogCS8qCiAJICogVGhlc2Ugc3RhY2sgcG9pbnRlcnMgYXJlIG92ZXJ3cml0dGVu
IG9uIGV2ZXJ5IHN5c3RlbSBjYWxsIG9yCiAJICogZXhjZXB0aW9uLiAgU1AgaXMgYWxzbyBzYXZl
ZCB0byB0aGUgc3RhY2sgaXQgY2FuIGJlIHJlY292ZXJlZCB3aGVuCkBAIC02MCw3ICs2MSw2IEBA
IHN0cnVjdCB0aHJlYWRfaW5mbyB7CiAJICovCiAJbG9uZwkJCWtlcm5lbF9zcDsJLyogS2VybmVs
IHN0YWNrIHBvaW50ZXIgKi8KIAlsb25nCQkJdXNlcl9zcDsJLyogVXNlciBzdGFjayBwb2ludGVy
ICovCi0JaW50CQkJY3B1OwogCXVuc2lnbmVkIGxvbmcJCXN5c2NhbGxfd29yazsJLyogU1lTQ0FM
TF9XT1JLXyBmbGFncyAqLwogI2lmZGVmIENPTkZJR19TSEFET1dfQ0FMTF9TVEFDSwogCXZvaWQJ
CQkqc2NzX2Jhc2U7Ci0tIAoyLjUwLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
