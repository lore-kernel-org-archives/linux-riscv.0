Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E459BCCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 16:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GXjB0ZaFOpRot7FPKRJf8QZHuAA/orIft5T3DxDG1UE=; b=Wj+KO31QZGHPle
	F2pABRDLKc/JIRSL+9mKFZkaRVQ/oQjNpiY1l5llvgt6/6pe9XeZ8yhQO2BNwZ0I092WOxRwa/PYL
	iqhJWrcfrTB6GQ0dwohxT8zfMCPoRk7PDrFbKrqJFWCTG6xpD7Xa3Oyhz7uu4MpzqxRT9hs+tq9w6
	M6wh2XHAfitmB7MSbDk9esRlogkNfUq5Wxphh6xRXeJxjPTuHFlZzNK7JhB6QKf5+5ml+QfiI/7Sx
	XK0+ZtFpdNZp7m+MIQdCGJWjeZU11MwIwk+nfaUUw7QJ8oTPLr4I7peYCsYF7fKcUZwYlmU9v7KvE
	capW67Zai8MhwINhG+Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfyu-0000000E0yY-0zPU;
	Wed, 05 Nov 2025 16:03:32 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfys-0000000E0y2-1Rsv
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 16:03:31 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso20124b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Nov 2025 08:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762358609; x=1762963409; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQYfiOpDWl0sTNTx1hCAEQfYbuDMN8nzIM3Ra+ul0vg=;
        b=LtHMSJYvoccA7OFljBaIS/LEYvggQnJhAxA9kZ/ruDAtu4zX/vNskMmJ2Jd4OQvL5r
         pTq257Y6VzsqGiDG9OJckLQbbXV5msmTFSdUaUOa83gz2ECyWRYqv6YJQ61o9bN51ktd
         GxES58MWXS10LW1bhz/AqsWJzzVWnv7INBKnEPUQFbI9Hq4iNQ+F9XTd6BXYQdIJ/nRK
         baL11WpY2sD78onnl3zjHqlz24aabyICudFLedoHf8M9+Uiqq94rBLqfj5GXOi/xVdiB
         ZijkI5hB32cfpfRq89jKVU8qDuEVhfxH6y13Bu9u27VY7QjfM6cbRVVLnsuQV1iSE/as
         8WYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358609; x=1762963409;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQYfiOpDWl0sTNTx1hCAEQfYbuDMN8nzIM3Ra+ul0vg=;
        b=dtoyPxHTPjigur7bNSLBNxbmdjlE6n5FVh/NJXYtnnws7hdyz5qMnu2raufWR/6YvD
         KYvYKCRqclCBzvVZppOvUABg2Yh7JUN0HpjfmHjy8aT393LoVhlCRmisT9784swgtRCX
         23pVe40KSbs6cu+i5KBaJA18XrArVreYWB/s1Typw5X2jdeLxt5JkQEQA8nWKHO1uKxc
         jg7miXvsgrGc3a/JyvezKo+Vn77ftxGiHrLL/MNZj3/Cof2FQ294RIRQSFjyULSb0a/Y
         NmPS/iF0PY44YPWICIF7pAd9642wCfmRDROjEq1prXE7sO9b9vvFlGG6JKZNK5CwdkPQ
         UIXg==
X-Forwarded-Encrypted: i=1; AJvYcCWsY+K8PZFpvBQnbJcQsZ+Csw62h1t5tM7Qw5YVJwiDVqcXFY4IPwMttEmX8eK3C7Rh0q6sSXtfKzJMTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YybyORU7XAytYQGMDtokC63iBgeBXug5hS4O8tbtq7uBT/J9Z4n
	MZHc3uNxpIcT1FVlIQF4XZ2yAx755LeR+NO4EMc8kY793VxA7N2MlW4f
X-Gm-Gg: ASbGnctBeMDrdbOKCHI+CxFTfglPkLy8LfiF0oNbVaVkL7DtWBwlALuVyItBmJI7PCv
	3BDajvSZljngRqCKNyxbO84i5ZmqLIW/d+JPH3CEeylu7e7xluyQtfZvpzemUct69fWrkeChycA
	ZAPSD15QAc4FZ2wMYmdUvV19m3bSYnMFU32udWIBNLdwBFN9YlqEk6U58DCRQcaHptmzCEWPOxd
	p9Zu/C2KMHAWihhjsd03tkcpJmWBTIhdlgw3TIxD79c9nME1Zab30TSGXHPJqL558qiDH1X/Q6G
	tUFQzB4oEuTO76xuOaYChFoxO206iJI37hv9PyJfrDcqCoP+3VXTsLpHNlxkeEcXesM37wEM1rX
	eu8FeSuN+npJ3FsIN7Feb5mlzwW6b5AVWtWq24FlgB7Cwtx/RhIb5sY5TqNHbPVzvBZqAVCxv3o
	UVFejcDSNf+hk=
X-Google-Smtp-Source: AGHT+IHJwjnUIGI8gDNaxibj4sXg44XjKfIRuSM7Iw8kysNt9Y+apm7udBv6IooCou81dlnb75b3uA==
X-Received: by 2002:a05:6a00:a03:b0:7ab:2fd6:5d42 with SMTP id d2e1a72fcca58-7ae1ed9f9femr4377537b3a.16.1762358608506;
        Wed, 05 Nov 2025 08:03:28 -0800 (PST)
Received: from [192.168.72.66] ([240e:441:9718:7c7:b13e:ed12:9e56:bf18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd6823f78sm6638331b3a.63.2025.11.05.08.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:03:28 -0800 (PST)
From: Goko Mell <goku.sonxin626@gmail.com>
Date: Thu, 06 Nov 2025 00:03:16 +0800
Subject: [PATCH] ASoC: spacemit: fix incorrect error check for sspa clock
MIME-Version: 1.0
Message-Id: <20251106-spacemit-i2s-fix-v1-1-ee2cedcdda23@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEN1C2kC/x2MywqAIBAAf0X23IJaBvUr0cF0qz30wI0Iwn9PO
 s7AzAtCiUmgVy8kuln42AuYSkFY/b4QciwMVltnjHYopw+08YVsBWd+kNo6ts75qWsClOxMVPS
 /HMacPytboKhiAAAA
X-Change-ID: 20251105-spacemit-i2s-fix-e63d655ab94c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@gentoo.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Goko Mell <goku.sonxin626@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762358601; l=1364;
 i=goku.sonxin626@gmail.com; s=20250522; h=from:subject:message-id;
 bh=l0Nk7GVBJ1qI7KNylnbSMpoEa3nN+cyLJ8/L2EcFb0c=;
 b=XpqASyQW0RdHbCLkEf2XfIsntbTBZK8hH71TYZgySwP0P0jIrF2a24Krhc5ELR/kzKnFBR+nV
 WhQD04oBe62Dg+xi0OVCFhFRVVymT8BGqaaQW3Tdd9/O3KDLSgKAMh1
X-Developer-Key: i=goku.sonxin626@gmail.com; a=ed25519;
 pk=YAEtp1QQ+5hMv+clz+l2GN5MRRfR5AvnzZi99Qxamqc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_080330_393689_EBC148AE 
X-CRM114-Status: GOOD (  11.30  )
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

Fix a wrong IS_ERR() check in spacemit_i2s_probe() where `clk` was used
instead of `i2s->sspa_clk`.

Signed-off-by: Goko Mell <goku.sonxin626@gmail.com>
---
This patch fixes a wrong IS_ERR() check in spacemit_i2s_probe() where
`clk` was used instead of the correct `i2s->sspa_clk`.
---
 sound/soc/spacemit/k1_i2s.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 8af05e1604f518b63cbbbaa66b73cfee8262d87f..1cb99f1abc7cde3370ca643c8b955132d8a1013a 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -414,8 +414,9 @@ static int spacemit_i2s_probe(struct platform_device *pdev)
 		return dev_err_probe(i2s->dev, PTR_ERR(clk), "failed to enable sspa_bus clock\n");
 
 	i2s->sspa_clk = devm_clk_get_enabled(i2s->dev, "sspa");
-	if (IS_ERR(clk))
-		return dev_err_probe(i2s->dev, PTR_ERR(clk), "failed to enable sspa clock\n");
+	if (IS_ERR(i2s->sspa_clk))
+		return dev_err_probe(i2s->dev, PTR_ERR(i2s->sspa_clk),
+				     "failed to enable sspa clock\n");
 
 	i2s->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(i2s->base))

---
base-commit: 84d39fb9d529f27d2f3d295430d1be0abdae7a6d
change-id: 20251105-spacemit-i2s-fix-e63d655ab94c

Best regards,
-- 
Goko Mell <goku.sonxin626@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
