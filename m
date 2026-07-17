Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C090CC4451B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 14:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8at7GvbHIHDxJ0XJLRMZmCj6pSLtn8Wqjv9R5LXGxZw=; b=grk1AflavjSkoh
	U8meIJGXcJI4vv5oofdawjBuPDsjVNHfZWbhGtN1TM02Yb7BWYYS270LTD7uIuj3D8kHNWZEarJbJ
	8z7RSmMkEZQb0UDcQe9uAqBOgJyAHGQpR2Wi8ZMlA1gbXVkM2CUjD5oTWAKaU9qS4F8yi+h5DIavf
	qtcNHGO1x8ugqTJf318CJjIheBfvA8wNsH7q2EzZ8m/x0xPPyhQFij2sCeNDoiIQE1mof3SyxPJ2y
	rvxeaVn+Z+o7XUuGfkzTjY8Z4eIsgA3l3JcmUt3Aya/RyKEpfONdOVOo1OFuTHCRqcytyENtag55k
	fzktT5MqawAq9A6ahOIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpa-00000002Vxp-3Hhc;
	Fri, 17 Jul 2026 14:46:26 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjpX-00000002Vvi-2HZd
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 14:46:25 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8485b358552so8708874b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jul 2026 07:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784299582; x=1784904382; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m6JMxGAMeORwl1SYUzJ4Avq6RnSUEQpdwdVOG9zM+x0=;
        b=P/KYY3ILn9PgS3Rm+1sWkQvA7xehf51M9V1ujUodP47L8E/h6WU+MlC0vEebbu1sxg
         CofZNw5xa/t/0bi2r5yXACpqDfE0qndTL3+VwetSjvgU7RCfYQk9UFAeo5gqAPV1fqLg
         oPkX/1HETYf2R2NuqI5Di3tHa1KMm14723RoUJxICuItPPshUpLMJ3L9Auqw3fSPrJTK
         E0aCe11qlN+uG7VQxs692nUjpg2+swMyz5nejldI7HULYOYoxdjTfdVZJZfd7nKxn7lx
         otw4s1CNs4j8RiqmELwaZPw5iaBG8bsg8p+4lvPrjutWwGIrnqlXkPadLhGuFE7U9u8P
         1j7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299582; x=1784904382;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m6JMxGAMeORwl1SYUzJ4Avq6RnSUEQpdwdVOG9zM+x0=;
        b=sKCaxOjbOSNVkcMPDtrBy6x6BaoW0Kc5hs5Mwfo7mCa8vm/EneA5zH5pKed7d/sx+B
         IrfXvvckZqQFo2HkGtQSu4GXbSN8t77viBoNO/7sRQGn3ai1gkxyTMxM401gKXk8qslV
         Jc9nV114TVqtHHwBK5rXXd/o7tyBxOsPKiFbimrFelbr6rsWGGE6F1e+H//tttkaa4Fs
         IwB41ycXzOzwxg5hYK9yZWUVFrOS4pdsARi+e/pjo18hZRzGypds9twmkUTSg8sdFX39
         tm1mcqRkWkynyrf6IT+0xBuEfD+y0zkYO9STneTv/DkXiZjy0JfqLIesadF1adnw6+mV
         WItQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVQfowPUcobXj6fOz+Tw9TpHdePNZhjjOjebSWh2KFXi0N46xQoyRnY5X5XHCYzXQrFpv5MOSZCzw4jA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa9FioW/LyAi4I1K/28Le5rmdwXE2ts1icc39lle5a+zDpldfa
	M+Jh0umOzZSaNTbn60M+2mUgtizNxgvIzQeN8/7A1uWbpt+WYOGoz6iG
X-Gm-Gg: AfdE7cmvPSADzsqLFpypllQ96bMuPpD7ePwmV2l/W1RZ6nRYQlz7dC4GPQJ5We6kDJ/
	j/3u37DGFPDLvy83kUXrKW6nCYzsgZFuClmz9fIaefYSpzsQJzNKhbWmcTa9O/N5+O4NPAYzoOs
	60opAaT5WbhAGar1+CxJl19kRAY9MXahYDbvbHKTFxizcNuLKB3h7yuIOXZxvBXqa3HAAjnDUcp
	dZ1/HCskEhFzoEazg1c8NepO3HxDXAYhCuKMSu3bOayU5r1V4yrrJZ28GCPUnsfErCvTa88YM4G
	EGngqmKxPrKB+ihQRnFiSLBb2T4XXSprJDzALQouew5CSmA7tdGc92YQjYvHRNMc6WalBiH+sd4
	uN0gS18lT/x5TCVGmW7j3zkOd5KmCCcTTRNaVyOfQXxEIgjGJ70ohsFJYUe8UTpjr7KnnmH6WUA
	sqcQ==
X-Received: by 2002:a05:6a00:1784:b0:848:65f3:23c0 with SMTP id d2e1a72fcca58-84c2923a63bmr2877553b3a.1.1784299582194;
        Fri, 17 Jul 2026 07:46:22 -0700 (PDT)
Received: from [127.0.1.1] ([192.220.14.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6d519sm1166408b3a.40.2026.07.17.07.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:21 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Subject: [PATCH 0/4] spi: spacemit: support K3 SPI controllers
Date: Fri, 17 Jul 2026 07:45:24 -0700
Message-Id: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2N0QrCMBAEf6XcswtJDIn4K+KDTS96im3JaRVK/
 91UwceB2Z2ZlIuw0r6ZqfAkKkNfwW4aSpdTf2ZIV5mcccFEG3DbIg33CtBRMEU4lOTQeozrnl/
 4qybGvAud9T4bqodVyPL+xg7HH+uzvXJ6rAValg9gBWi9jgAAAA==
X-Change-ID: 20260716-k3-com260-spi-v7-2-rc2-b4-preview-20260716-077f86d144f0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Alex Elder <elder@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-spi@vger.kernel.org, Zhengyu He <hezhy472013@gmail.com>, 
 wefu@redhat.com, liyeshan <yeshan.li@spacemit.com>, 
 Guodong Xu <docular.xu@gmail.com>, Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=OIPMXvKZwuWAWDHePcauH/eSNbDXWC6yVHtpY8sqHRI=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqWkAt6LQ1BMVvY5sduW/KRV9RVz2vmM1p+9bjq
 P+2is2xrAaJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCalpALQAKCRDN9pw2gLgN
 2LRYEACGXe+KRwOLl6dDegR3fIqUbV3Spz7oC1VhGZo+Ogpb4C56+sLl8CngaAHlpFyyv3gyqpQ
 q58zd8HxcznBK6W+syG9HQzhCaeQxpceyb/WYTeEb7+UoKPbZ0IyhJFSn4dlqdFdIpaZgmYwCdM
 xLQVaG36ffyc1/u/6n3b3REhKzWKKhB7P+Sh/8V1ZF2aDbDzGpr/E6DSKQN3Wo4RtSuTemi+PJ+
 PwC013IrNg4LLps7qPu5IqJ6RQ8y9MH1thoFIMHAUoWi1/b+Ixajk0xRYXJ9X1Mihz1MiJWKrd4
 wGPAKrayGl0CjOKI6wjqEw2VnHdHEOK/0w+PMGWzsLtBILZCFSL0ZBL2rpv0bJfYvACPmFT08PR
 QCao193VhuW0hQHbFbH6Km+tzmg921cKQH08Y9S5vQkz+Cj3LHS+pCH0M3D3d0ssf0tFxnMIuIF
 CMiAAE2XTH5vPZE0HQK36n7Ez1p+POPLhQZx2MhpX9WeSErDz3LRDH+vRe9lOgXZK+T9jv7k2/l
 4r6s0ahnqkJUaI7aw0zZG/+Dn6QhyduANPqsIvruZmZdaq17su/+3rgdiDX9sFcJ8ixJ3lucdn+
 MQvbvaV/5tIsgDiX3p5iGNlC+iE3oHHB7pKozFtVxrFAKIiYGuzVaSvAyqtedi4HIqBrBZXPGLj
 GtbxA0tYKjHBjig==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_074623_591719_485F437B 
X-CRM114-Status: UNSURE (   7.85  )
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

This series adds K3 PDMA request numbers, documents the K3 SPI
compatible, and enables SPI0 on the K3 CoM260-IFX.

This series is available here:
  https://github.com/imguoguo/linux/tree/k3-com260-spi-v1

This series is based on v7.2-rc2.

Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
Zhengyu He (3):
      spi: dt-bindings: spacemit: add K3 SPI compatible
      riscv: dts: spacemit: add SPI controllers for K3
      riscv: dts: spacemit: enable SPI0 on K3 CoM260-IFX

liyeshan (1):
      riscv: dts: spacemit: add K3 PDMA request numbers

 .../devicetree/bindings/spi/spacemit,k1-spi.yaml   |  6 +-
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts     | 13 +++-
 arch/riscv/boot/dts/spacemit/k3-pdma.h             | 83 ++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       | 21 ++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 49 ++++++++++++-
 5 files changed, 169 insertions(+), 3 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260716-k3-com260-spi-v7-2-rc2-b4-preview-20260716-077f86d144f0

Best regards,
--  
Zhengyu He <hezhy472013@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
