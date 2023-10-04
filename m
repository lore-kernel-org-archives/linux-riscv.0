Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59489E7C4D5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nf3TuzPuCiSvuD39YBII6SHdrWGuwoRhUFVnG28B3mw=; b=lfjdKiiQXNsaoG
	M9vdQxSEOWsxfWejc8/KPvvoieQZgvEMsWKUYGxm1Hq+KOmj+WIWWs7YFxRKEbTV0x3qh2Iksk9GI
	+psItOFVON8JPX9rHEqTqw2gJXXfbdsIiHTyv1bGbdg1lLrnZjWtSWQxZ1kmRc+Ro5b+vDb7TUL3E
	JmzDeMe+oYYob6blWgHltFuykOkaBUyovvTh/oMtWEPVhIC/oUCdvhHfVu2NxGCy0BS4Ti/8CfRI+
	Vfrhwwu6if1Uwd4u7KWKPkcRSLw56T6QfMh0ul9fhF9yrxM2S6ozuULQGWwcWwAugy6hUo+h96beF
	K3B+8AaOF2MLN7QOv4Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3a8-000JfM-23;
	Wed, 04 Oct 2023 15:14:36 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3a3-000JaR-14
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:14:32 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-406553f6976so5071555e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 08:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696432470; x=1697037270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XZchuQuCBpXHMvu1aRqXWCThK6+yA7m0aHqniG2w4Y=;
        b=1ImJtxOWvkSRnN1Ngl7piZaJrrRWzsOeEfocEalCt+pi4Wnw9Fb3hdE3NuFAS4V7iN
         LSAAjyvxiXTsSVpwSaeSSLWkM7ARtE6om0q53iuFQnqbV6JRwEUg5XOnslVCQRjGbiBW
         QihgXOvAzp/cz08ubE42YS1jPYDT2d1Cd8w3tznfVoqUJc0S7GkMhfxwRI9D6Kmu5652
         L7z19ToZRHUnu+xuGJzFZ3kJl8C9w0EAhtwj93EXogB5OiEjMnveQ1r4TQQV+dTAx0bT
         fen3Uv87S03AWvwtXGWUGxX8D3Nv8khFfWUqPf1bSIPrrgTgiA5mE8OFgDsAG2DYi+Gx
         CiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696432470; x=1697037270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XZchuQuCBpXHMvu1aRqXWCThK6+yA7m0aHqniG2w4Y=;
        b=VIaT1Q4wJy/C5hJ2tOmfooqsUBxGtP3WY3vtIiEyLF0Law/NQNUPFPRyCPmqFOv5Am
         meoHKciDn3FZlHHzOPk0wyHZSicf6i2CNuyBcPSobiX5sde+Gk2OGtcGvxr6mqN8kzM5
         anORmL0KL3QtU5syINUQ0JbeJBZbSvmploBWR3oyqcjltXnlRVXvoG7XODpA6QLpEQXp
         lUUz9uYsmbu/4snYwEY2xn1yoxi0W3AU95k8nzoyT+11GEsEe+KqyhapKNLsg9godWVh
         2mV9FkGw1Pkkh6A0Ty7ZsUAAZQp8B0Bu4PKSB0lFoEUy/MTXZ8RF0UKrXnm/rW1zQui8
         6GIA==
X-Gm-Message-State: AOJu0Yyuu9H5PpkNKL8oLrUmSwmzC74wOGtTlnc0bBH411zulEyX8d2Q
	XyH41tX0sToDclV6Jja/Cb3Kig==
X-Google-Smtp-Source: AGHT+IG4Q2hW86Ee6BeC9N9w7JEqQmTEfb41i7/dbiv3giwSTJXRvEPVJJOvmzWfwKCGM00ziPcFVA==
X-Received: by 2002:a05:600c:1d03:b0:404:7606:a871 with SMTP id l3-20020a05600c1d0300b004047606a871mr2610672wms.2.1696432469747;
        Wed, 04 Oct 2023 08:14:29 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9474:8d75:5115:42cb])
        by smtp.gmail.com with ESMTPSA id i2-20020a05600c290200b00402f7b50517sm1768764wmd.40.2023.10.04.08.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:14:29 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Topel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ron Minnich <rminnich@gmail.com>,
	Daniel Maslowski <cyrevolt@googlemail.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v2 6/8] riscv: annotate check_unaligned_access_boot_cpu() with __init
Date: Wed,  4 Oct 2023 17:14:03 +0200
Message-ID: <20231004151405.521596-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004151405.521596-1-cleger@rivosinc.com>
References: <20231004151405.521596-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_081431_368772_2D95F4C5 
X-CRM114-Status: UNSURE (   9.80  )
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

VGhpcyBmdW5jdGlvbiBpcyBzb2xlbHkgY2FsbGVkIGFzIGFuIGluaXRjYWxsLCB0aHVzIGFubm90
YXRlIGl0IHdpdGgKX19pbml0LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVn
ZXJAcml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVs
L2NwdWZlYXR1cmUuYwppbmRleCAxY2ZiYmE2NWQxMWEuLjM1NmU1Njc3ZWViMSAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L2NwdWZlYXR1cmUuYwpAQCAtNjQ1LDcgKzY0NSw3IEBAIHZvaWQgY2hlY2tfdW5hbGlnbmVkX2Fj
Y2VzcyhpbnQgY3B1KQogCV9fZnJlZV9wYWdlcyhwYWdlLCBnZXRfb3JkZXIoTUlTQUxJR05FRF9C
VUZGRVJfU0laRSkpOwogfQogCi1zdGF0aWMgaW50IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYm9v
dF9jcHUodm9pZCkKK3N0YXRpYyBpbnQgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYm9v
dF9jcHUodm9pZCkKIHsKIAljaGVja191bmFsaWduZWRfYWNjZXNzKDApOwogCXJldHVybiAwOwot
LSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
