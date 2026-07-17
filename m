Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C67C4451B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 14:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PYnHN4KkWXGRCDzul5P3uMpOjLT3uZi3aw0LnUoA02A=; b=jRZamGzL9JbJbq
	JEXhse0/4O0lkaSU1BGtWMclPUcKBSut9zvyEKHyyx35XHF1GcuXG9BhKDIstyq5iA8CPdeqHniyd
	C2NIw+YHBSAfb3BEaQafKB5myL6kdqzCMUmIIGLYYCRxueQLJzq4CRMT820HTQILcequ4/+asy0+c
	Wai0QR+DfKEp4aOg90MW1ki+wqFDckvFL+E5mxVcidC3Wm8aUP4Q+e8BGKW+CKA0KTjFc6cDT26nL
	EWdStj2zkHxQWcoNXAkOAm8rDC/TfTurKs5QJ1MntYGSDV7CacjzANiSkXAdMB3nV/p0G0Ouyb1pY
	JdQD+Zwb7kWoFRlOzm1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpq-00000002W9z-2XLW;
	Fri, 17 Jul 2026 14:46:42 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpl-00000002W5g-2qSN
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 14:46:38 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so1831739b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jul 2026 07:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784299597; x=1784904397; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5o3dZh9zqq9+zZ7JPhqXE+Eca2HPClPUfYtgFmQz6W4=;
        b=XF6XAcQt1qYbqafYhC0drmKgmjclmGgpiYSCXXmDiTEfpr2TjS76sFgdz57utNZMNG
         EE3HBrAS+Ol7hSLA5N62GTgczil0gKhu8iZpXU2Djdm2S6NJ+K2MN5vr3NU3IIiBelwP
         IabZ8COkgnVksNl/HMLf4unjd/3ke447KP52/fMUdUtLKf876HO6rOE9kyOxI9InNrjA
         lOuaKaR//Gl5ej1SrzEENo1v7LV0urXJUri96osNc1ZkNO71UJ3xEeaqni2ATRXo4hsg
         3y85Tkorkk4mHkJIwJsO9NZhVWVNJHMOzXDAoAEOrD8gvraYji439pZyXfsAqBo0P2vK
         E1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299597; x=1784904397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5o3dZh9zqq9+zZ7JPhqXE+Eca2HPClPUfYtgFmQz6W4=;
        b=e1E7SX4RtMmrbCT/prBUqiiNAr+6wTddCN53pPZGqyHs+k4kO/MFpc0DDymCkSQLdr
         FlMsZGrKEf3WSz8jqC06OS7WPaolBCyJ9u4Wq+3icwunu57evVjwQ4QDfjVBxywDoz98
         qCpBSdqEURfpAoiESpcH2zJ8hzZEgKzW6D8sJf23fACSvMIVkOniar76/daPi0Etqpb2
         j1A6xaQjrCWC/7+wWlc8vpyGYKqN9CKfHLi9LEOiArWvMWEIbX4XMBS58Jv3hdqp5CTw
         v95+5nqckujamjgViYFqyjzZezM2+zV0o+a3QMV7Af7WKLeX+ZMM4pAHDdyFcz41w5Fp
         YmMw==
X-Forwarded-Encrypted: i=1; AHgh+RqPFtiVVCw5TTumTGWfWgT9TeKrTOoRMQ5pMP9G70cveOcLC67kYX0nGwVwewpVEnXtO432zI6Pc9XomA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuOlir9BPak7+tHnGZI/FmBjYztcEUsDjZXiLyjIdJBBBxhKSM
	ay1HzdtuVhDA5FSWkf4SPed/7Hu2wWDubjvbYxSGbBPnrNW89kRe84lKwQHfsn8U2VhAKSlO
X-Gm-Gg: AfdE7cm8+EzCDA4NhRg7zNo1rB++VCbyXRfxzpHTQvLsZbHDewy3YVClJTJ1v4/ROtI
	cOkn8OQkPSW63WjTWGswllo3L6sYrQA2UGf7gkWgsaY9gXr0ZW8xiN4feTxoSSaWhZqkIQxtDTV
	MPyFEqracCLfmuHk0fwzUjAF3QpkUFGvRXD37mwo1XhMtCA1gfspB6ixyUHljUKDVg/WVFni0Xm
	VgXH4pdSUhMxMspmKHaKXBxpJsN8KsOyzIcQBbH5bf6IuPDN/3osity8qUJebIWWb9XKtRVaRZD
	GDZ4jPoctCBz+Z6XRtvNmuDHD71yNp06I+Yj1hnqB8AdtTT6cHC2z1ajmsfyjAwzfkyAnsHnay5
	MXBU48+kH0faR+kJUCZUN7g4dcMWZuFtDqDgQOA3QvSsrfNvPH0K0QIR2CF1DH26ay4jCmyZryh
	qA/X41hghb2oaB
X-Received: by 2002:a05:6a00:230a:b0:848:2ef5:50dc with SMTP id d2e1a72fcca58-84c28c8a48amr2886697b3a.36.1784299596675;
        Fri, 17 Jul 2026 07:46:36 -0700 (PDT)
Received: from [127.0.1.1] ([192.220.14.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6d519sm1166408b3a.40.2026.07.17.07.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:36 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Fri, 17 Jul 2026 07:45:26 -0700
Subject: [PATCH 2/4] spi: dt-bindings: spacemit: add K3 SPI compatible
MIME-Version: 1.0
Message-Id: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-2-969a1b0f783f@gmail.com>
References: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
In-Reply-To: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Alex Elder <elder@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, Zhengyu He <hezhy472013@gmail.com>, 
 wefu@redhat.com, Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=922; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=ixkgzvll58EwnzL/lGdtgvLL6jYBX9D84ZvdIlb6Ou4=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqWkAxtUuTQbQ04els6xg0viY3Kav7HvVOquYiR
 Q4CNG1TcMqJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCalpAMQAKCRDN9pw2gLgN
 2P83EAC+k0C4tFtTKpZdl/bbU4UHfehDpILZLb3mqYViEshXC6KFuG2Ie/4fxrbpY9AK1cpBJgx
 82iMabr/2xwl978GQDFxGQ+wtVvW1AViOr1zZ2JjHvgFEiTlpW3BaRXBHbwsjHWjwlUKa0zc0Ph
 fb5uUzVIfC2vcTi23OWeK9YlXMDA2xFc8OSgIBmFqku/pE24D66o/lPV9OJPbezYWG2zes7Llid
 mS3vtQDDBK+6p/jd+KOoNgtBTOv6VcfwEsh3Aa5JOkCIB+mEkz1W6Y9ZhHLd0E6kU1tjsMmGTxa
 G5nj60HIh6MV63lB6G+F8NFaudyrm52XUXLT/UE/R7w6SZqj6h179FPzeKadiqfP3avoTdjEveY
 DBc8FoUB5/fj574DC9RCZ41p96/y+Jb5EbNF4KfmFXDfxKdGSmlrISuKxO+Cgh/1TvU4U/pEY6E
 CqawX6XhGntvZokXmFsyeeS0lWvbEY2Ag6yDHGxKDojiJEUfOr+FhKxrhH+GJZ8crYdrdlibYOt
 ++WNPhsVQv7Bv7yHMcP9auStsqabwwQqHst3s7pqNSEmzW/r/HZQGxbl0nYVSkGhWBKy0uNhOvI
 SR4LQK3C01mWXERHYdeXJPCO8hjZQOqbjW3y2TyBFpBf2CcU7Ql6HSDBnopyp17qJbPaIFHL5r4
 g9lnxYOY/9d9k5g==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_074637_727234_99983184 
X-CRM114-Status: UNSURE (   8.62  )
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

The K3 SPI controller is compatible with K1, so allow K3 device trees to
use "spacemit,k1-spi" as fallback.

Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
index e82c7f8d0b98..5d86cc87e4fb 100644
--- a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
@@ -24,7 +24,11 @@ allOf:
 
 properties:
   compatible:
-    const: spacemit,k1-spi
+    oneOf:
+      - const: spacemit,k1-spi
+      - items:
+          - const: spacemit,k3-spi
+          - const: spacemit,k1-spi
 
   reg:
     maxItems: 1

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
