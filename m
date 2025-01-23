Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588E8C02181
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 03:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vGvut+xWz3V0Ur7DmWvcAdy6viJba2FWr14Do9Tk3jY=; b=4Lo7FAz6OvIqkY
	wvNeB09KR6SdauV3C3K1ohQhUKic/0EVD53DcKCGlo0S/XROGt2yCxIr4PcYjlr5SJuE1XBMh99ON
	xihlYXGQdSFyxXtIsFFf0dSo2dUxLhKkRBDlytox3T3APfM4Zpc6Hg3pcDYaohOF8IZIKs6rJCTwA
	a2mjUjHGeXJXsNy6bNGA5vl1oGbVCbyynblUb98+MiFOJgdcrsLbPlllVRF66OB3if4D9yt7+lPHB
	uStmOLiA8/BySGAW7iz5BZPWJUQMQR2HEnOj5K7TWWfJ5hPAyKHzYwdEbKFbvRruncGfLHxrAtC5I
	EUvSZVOU3QTwArC1kqgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tanj2-0000000BccO-04yj;
	Thu, 23 Jan 2025 03:17:48 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taniz-0000000Bcbh-45Mq
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 03:17:47 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-216426b0865so5853975ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jan 2025 19:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737602265; x=1738207065; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yb1dQ0E63aBFcwViVcuk+RodzWEGNhIOogsy9MiuvXQ=;
        b=yxO67Ku8LYBOepzzjwzxGs+UudxkBvsqxoKW/QaaybZCovU6XH74+WXJDAfBM+U9BL
         PUYzluL7XSAeGNEvnw8bIx3oRsJOF5dMiyUUqIT/ZSQvcQSVuyEbnY/I33VZJWBfWe3D
         1opxmNeqzlPg48REEJgkU2lwa54cAjBSbAQ6pGjZ462LtKJpoIxxBHlbhN8Hi9hAxmqw
         B2f9Evpt09SdAChykePDDlMh8Hu1L7ohHEJZ6NRf0Asdq8GFOnojBq+ks6xRVnEya63P
         BhzmR22L+uwytywKgPzoAib2D3SA9mlaGIAiDCT0B1MEl/SdH9+XQSWF5zleovL76lux
         C0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737602265; x=1738207065;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yb1dQ0E63aBFcwViVcuk+RodzWEGNhIOogsy9MiuvXQ=;
        b=UuXMILK2ABch4e6Kgz7qItTuGRwLwqT2PZ6xQKwtvYUeSPS7T4Lem+tmDKDsBycFEt
         IaxunU+2ezbtJBzHZhULExQ98SNLkRMfUwSlySdH5BtCYMcuQ+x0PpdepBY0TvG4Lppm
         305dloLVDt4bgEljhAf1DpzWDzFvX4h4g5CqRXCskHEGzF1xusHjc22+lpqWm+FHnIEy
         uzQHeul+XGQseF2KC4R7Q/fgbrw1EBZe5lQWZIkIC1XBpFJwd11i1iDmOj71lcZJYQOH
         KQEG5P8EvnPH+0Mns9jf6CKmgJVgSQ2CkAA/SCSUlcn1/bmoGxmcuH6UtA6dC9e1TTiR
         pu9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRRbGfAlolttVvRnBiuDwvPrqDHp9ehOshwatQqvNYPEN55gBv3BMHe2Jg6Jy8U91O/5dVV9Mv7agiSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzldCSp7d/MKic0PaROy5lxnI+UjgGF+m8sA14ZC1Im7ss2hUqt
	HOqgX9J/jkWY+IV+LDayS0Hnadba0MP8Vf2mcQkfL4O2t9utMVRK2Vnkgw6VbcE=
X-Gm-Gg: ASbGncvjZkd7yvqUq9ZJOd7Y1upOiuF07v+H7cD35p0NSkGymV8yWEoOulBpPCq3bOs
	jIQZwWLAYbvhoJ19TfdgEGVyAEZUvpSR/zMtSGorRFNXBegJaU5sSmhhavJJxMR3EcSOctTAXbs
	Dx9nqcwC6oS/yuHOfcFh2iwGqqeW6ht3P87k3A0KM3spfboex/yd1gJS+KluY8K/7VbrGPpZmJZ
	i+k3Xu4i3d8MbLneWGr4ixEoY0pgHMiAcfP0V+si3dpzVYwX9JHkmfj9EVV1fSKHy3QQVvsif0U
	p711S7hqhU/SB1lejysK
X-Google-Smtp-Source: AGHT+IFU8PrWDhmlR2RUaT4va/OltWFBDSc2Qwfem7VSPUU1EII1LshhjGhI4Z+xmhDWHCjoruyIEw==
X-Received: by 2002:a17:903:2286:b0:21b:b3c9:3908 with SMTP id d9443c01a7336-21c35577cb7mr388491215ad.34.1737602264864;
        Wed, 22 Jan 2025 19:17:44 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d4027fcsm102659955ad.214.2025.01.22.19.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 19:17:43 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 22 Jan 2025 19:17:26 -0800
Subject: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
MIME-Version: 1.0
Message-Id: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAMW0kWcC/x3MQQqAIBBA0avIrBPGiYq6SkRYTjUbC60IwrsnL
 d/i/xciB+EInXoh8C1Rdp9hCgXzZv3KWlw2EFKFhkjHM8gxXt4zO3Z6tlNDbWkQqxpydARe5Pm
 H/ZDSBx/D79dgAAAA
X-Change-ID: 20250122-strip_unneeded-cab729310056
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=LoZ24LDHCMkiRgQF7grVTqyM789vNtixibi4AfHB3ig=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/rELRd6OlwDL75cs6XcO+HgyYYdr2Pmn9B71Lp0teTXZ
 d45n33fd5SyMIhxMciKKbLwXGtgbr2jX3ZUtGwCzBxWJpAhDFycAjCRwIWMDPdz5m4O8Wv5VDVl
 Z0nHitsH2X4wZx6c8YpB3++ar4rqtA8Mf3g5l024NiGA6dLd5e7Mi0/o/7f82RsYOb3jgvFBxvg
 0YR4A
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_191746_296764_9B7BB0BE 
X-CRM114-Status: UNSURE (   9.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On riscv, kernel modules end up with a significant number of local
symbols. This becomes apparent when compiling modules with debug symbols
enabled. Using amdgpu.ko as an example of a large module, on riscv the
size is 754MB (no stripping), 53MB (--strip-debug), and 21MB
(--strip-unneeded). ON x86, amdgpu.ko is 482MB (no stripping), 21MB
(--strip-debug), and 20MB (--strip-unneeded).

Use --strip-unneeded instead of --strip-debug to strip modules so
decrease the size of the resulting modules. This is particularly
relevant for riscv, but also marginally aids other architectures.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 scripts/Makefile.modinst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index f97c9926ed31b2b14601ff7773a2ea48b225628b..c22f35f6b9db3cac3923b9e787b219f752570642 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -80,7 +80,7 @@ quiet_cmd_install = INSTALL $@
 ifdef INSTALL_MOD_STRIP
 
 ifeq ($(INSTALL_MOD_STRIP),1)
-strip-option := --strip-debug
+strip-option := --strip-unneeded
 else
 strip-option := $(INSTALL_MOD_STRIP)
 endif

---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250122-strip_unneeded-cab729310056
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
