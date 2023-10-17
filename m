Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E679CDB483
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uYAuYD1LIoUxE93WzMT0YWxdAStvrAVTTJwONPmv538=; b=LpsxWKcI2IQEvr
	NEENY48duR6aySkp9uRNvNhUlayH89X+MpSENyA6NmYTXCA2WVP6z4xfiujVJzGqxZ5VJ8jD0otyb
	4TEC/EhpKP18OdLp9665lAZ4ZLl0j/uQPdx0+HPch/VClbJ5Pk5CqCV0NFtfCJIQ2jGdf0VVJoOQk
	wBHbhPVLS+JJq6So5jXYpSliwa6Y+iBdVmSuCk+tv8qTol/5iEGiVyb50T8MJfk8TwluFMsD/TEJB
	RwwqV8ecLuKaGy3XqWamOJFUbiHwKaoqL1HICdgh4jdoPJ+CExKOIzkVGADYs4nazVkB3acInLdxn
	kxtbe5mRliJ2h52XYK/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvY-00CNe9-2E;
	Tue, 17 Oct 2023 13:16:04 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvG-00CNCr-1f
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:15:50 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40837396b1eso511595e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548544; x=1698153344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AFw9z9dpP/ckJjbN9Tmyf7889lk/XiWzjzseb60llw=;
        b=YBwd0KohAKEGYkP43n+98ACQaI9r9rAeoKsLxnW+x41QebVHS6V9psdbclKtBnPvTM
         bYCUMF1VLEUjzd5vMZhFXA7Kcj2Ov+CPDe0czmG91T3S+v7d6R5ah7kgjolLEtP49+Jt
         RPrRq3mlOvy4NyqaMU8itlrknjWY8nRjBl4O4NQ22Qef8lVcXPATbDVuAWLfzm1PTxEQ
         rS0xmhvS+wH2dc5HDBnQKximFLLWf1Yi5es1n9sT2qZpzEeOtNDuJWkb4RFokEySiI8Y
         IYbF3W0itl+hSNRAkfoeflN6JAetcK8KgZh8FYpFihXBfwPJY+0Vn/NmZWH0SqmvlEDq
         V8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548544; x=1698153344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AFw9z9dpP/ckJjbN9Tmyf7889lk/XiWzjzseb60llw=;
        b=nHDc2ErAwwIpZseCSVoWNbUzKnaNZ2IqTE1m+eo2EdbQQwYp5lEU1oTVs8zQ9gVZru
         1EcFQskVvWSLgVetq2ikxsx6DU86en4WOuDiOjjUBeytQx2+9PPzfHdRsEWsiyvwInAy
         wQjiwUCHwFRVbSz1qeiR8x8n8qtczG7fKSZq+VSE3UMTbL9yIVyZczTGW0ibiAD/R0K9
         Wdvr17sSn5v7oIxYHyJKWuHijz/puniXSiMMR2BuUzvQETDO01bK2JlnjJNPPzH3O6ht
         tTu6NjmB6BE32SrH8GSURJ6Ny5sRU7DKzuxBiBemjjCur9nXQvvysqRx+N7y6MYvOJ50
         D0dA==
X-Gm-Message-State: AOJu0YyK3ndfV5NJbk7BEOK9axsyj400BGhewIpLxv6XYi478vheJn3h
	xqtWigCZb411fh45qamvV+H8UKDHC39bHhoTyxyUTw==
X-Google-Smtp-Source: AGHT+IGD6k8FykqQQcX67hgxOWRNET24ch03mfUZpvzescEdSJ0tjByWo4qNt8mvukTxxj/gJ+XeOw==
X-Received: by 2002:a05:600c:150c:b0:405:38d1:621 with SMTP id b12-20020a05600c150c00b0040538d10621mr1641979wmg.3.1697548543538;
        Tue, 17 Oct 2023 06:15:43 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:42 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v2 17/19] riscv: add ISA extension parsing for Zfa
Date: Tue, 17 Oct 2023 15:14:54 +0200
Message-ID: <20231017131456.2053396-18-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061546_559272_E928B43D 
X-CRM114-Status: UNSURE (   9.62  )
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

QWRkIHBhcnNpbmcgZm9yIFpmYSBJU0EgZXh0ZW5zaW9uIFsxXSB3aGljaCB3ZXJlIHJhdGlmaWVk
IGluIGNvbW1pdAowNTZiNmZmNDY3YzcgKCJaZmEgaXMgcmF0aWZpZWQiKSBvZiByaXNjdi1pc2Et
bWFudWFsWzJdLgoKTGluazogaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xVlQ2UUln
Z3BiNTktOFFSVjI2NmRFRTRUOEZaVHhHcTQvdmlldyBbMV0KTGluazogaHR0cHM6Ly9naXRodWIu
Y29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwvY29tbWl0cy8wNTZiNmZmNDY3YzcgWzJdClNpZ25l
ZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZl
YXR1cmUuYyB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2h3Y2FwLmgKaW5kZXggZDlmYjc4MmYxOThkLi44ZjMyNGM2NDZhNzMgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2h3Y2FwLmgKQEAgLTg0LDYgKzg0LDcgQEAKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUhJ
TlROVEwJCTY2CiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZGSAkJNjcKICNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9aVkZITUlOCQk2OAorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pGQQkJNjkKIAogI2Rl
ZmluZSBSSVNDVl9JU0FfRVhUX01BWAkJMTI4CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2Vy
bmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCBj
NzA4ODVmNTAxNGIuLjI5NmNjMDAyNTczNCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
Y3B1ZmVhdHVyZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtMjQ1
LDYgKzI0NSw3IEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4
dFtdID0gewogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppaGludG50bCwgUklTQ1ZfSVNBX0VYVF9a
SUhJTlROVEwpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppaGludHBhdXNlLCBSSVNDVl9JU0Ff
RVhUX1pJSElOVFBBVVNFKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWhwbSwgUklTQ1ZfSVNB
X0VYVF9aSUhQTSksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEoemZhLCBSSVNDVl9JU0FfRVhUX1pG
QSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemZoLCBSSVNDVl9JU0FfRVhUX1pGSCksCiAJX19S
SVNDVl9JU0FfRVhUX0RBVEEoemZobWluLCBSSVNDVl9JU0FfRVhUX1pGSE1JTiksCiAJX19SSVND
Vl9JU0FfRVhUX0RBVEEoemJhLCBSSVNDVl9JU0FfRVhUX1pCQSksCi0tIAoyLjQyLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
