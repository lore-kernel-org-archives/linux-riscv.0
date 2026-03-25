Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B37A109C036
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 16:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QdCzMc7j50UN2AgmBlvOdfhDIvVkCRxF1m9C5fMFd3E=; b=LOVR0+TcGkDGcO
	cvl8+n5fFpwmTcx9686MPat5CcGcMJ5k0GCV1ZQQ5lbSf5VBqPXIRPuPenTmWSzBBOzgoBW7Qes9r
	68T6fMxtTlRan1NVmo21hFJvCiN/35+0JteW/nD1e+jLyAvHKlzZiAWr+DveW/gckQcKJFh/WZO/P
	WYRdQeK5p8PfW3gogw32t6OjPHnW+lll8Oknjagd5ZIoNlhZpgyDXdM418QUmGgujf+mUGRuoSAmV
	o8vPAEVwrlSQZ1FAzhpeTVfrtu9KaVgRVpEV5r3ED59IpFFnzR12yXzTowLI2ymgl5HUh9VCXtUXY
	w2ZCPBrcTmiHytOOpIKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R1a-00000003sNa-44Wp;
	Wed, 25 Mar 2026 16:24:06 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R1Y-00000003sMO-2cLy
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 16:24:05 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-82418b0178cso20311b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Mar 2026 09:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774455843; x=1775060643; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9qbvYscf4zAVK6F+BRBQCeZsFQW9PNBr6bbrHWczJms=;
        b=bthUHdiDtIvHNX/M5+2XY33ErPaxPAbxSJ96sGLob6L7EK5cgGqaCHYph6JzmplkHA
         4qEtMsawmlduB6z7kb6anZqDXc/LflfbKuGTChWHjMJgSOoov0NFRUqeIM1mFA5O1uln
         UDsXdS+50KPEZEQW5HYN7ARVJQ1B8ynIv9xY49j0DNi1taRFbeml4E5gya2ayETT8DGn
         UouyD9l8qb9CMMuj/RgtP462blSVLGa0r7IhVzhnE3Le3sNjbfcNPFmsw1oiRzec9/Ck
         EeNC4staTt/zD8xWHRxuaX6RYnX4SPoPvTkjNCkWveFOB5mI/aUTpsoegTxpaqRp03fp
         xNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774455843; x=1775060643;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qbvYscf4zAVK6F+BRBQCeZsFQW9PNBr6bbrHWczJms=;
        b=E4mARn8LCkAva7ab/yudIxInRm6ePW/P9WCzz/3a2kvd0Z/CbIkW41AyuAGNZW6Ath
         LlsUI0drIfy0XRt48Yy7RhMC6VEqt7AsLVSl4YacJwlJq/+AHHtk9YrZgONBhWtOr8GU
         1QL8CvS5ICHS/l+H9DX2P0t6gCRFEJZA5cfMF6HAKeuPHyMEl4dqwK/MrPfQ2/Iiad1n
         wstvuIDnjAzpJ87EDHVL5TpbaNeP0a36BCwRH9mWtuDt4ekyDgexf9DZdBkgNi4ys288
         syLiRbsiHygZyEsBOsWMYSN9g4EDJdcIPu0vb4szddwt58z/OPpqJEKn8bapx3MKnuKm
         p9yA==
X-Forwarded-Encrypted: i=1; AJvYcCWAvRSGk2rDTx/wyWWWo8JMkb15z6VWSvsfPjKkmNTFe856bbLA0gB176WQZv8/fHF+a9RNJG6/EDt8ng==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKqdc7XS9p58qAxVgVhWm8DMpaOUmUva36MT+2c8KVtiJW31rJ
	AOFl4PWy1pvIRDZFKL0QQTCy40jfvbM7/nETJiwgXtIpeZ2YTFsgZGGe
X-Gm-Gg: ATEYQzxvtJDmD525jsgXwjhL6L/fw80uE143kl/YFuzBVbLXkA1EjuDJ0kPjdFDxMw1
	1ROCvUVos3rg9QN1savA0afIQFJY1SXxymKXgde77eTnKERxjEbxceE0YshwwD4GRFe865XnXmy
	QbqfaRyqmaweXK4xvkWW/yY00nzDcewmuSTOsMxKgiHWnMctagHBMljPJXvYEm/VfFTchUN8csN
	MLWe1K68zff9MPvrVjEBAl9mzcrj9Jsm7Nbxj6UDxqUBUbO35Wcrpe+Ad0gNMOlBWPVuGsqBsbK
	gZIJwGMjpO4HB+2lFpoHAmuI0cxeFvm8DNwsrMVKX+Q6gJRW2kF6H04ls36h2Nb+2ko2keQOXYk
	bxiHt6/TYvUTL9ojAdQREEHSvwc2Z3exdkeM51xKotaAUXw0Bngg4tyF+X8n0MqIG3ommXwuVB+
	SH0/tiGftSxJSWiJtM/FBygU0nNud4Wh4mRp7o
X-Received: by 2002:a05:6a00:414b:b0:822:6830:5900 with SMTP id d2e1a72fcca58-82c6de927e1mr3843698b3a.6.1774455843050;
        Wed, 25 Mar 2026 09:24:03 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3fe576sm154141b3a.54.2026.03.25.09.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 09:24:02 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 26 Mar 2026 00:23:58 +0800
Subject: [PATCH] phy: spacemit: Remove incorrect clk_disable() in
 spacemit_usb2phy_init()
MIME-Version: 1.0
Message-Id: <20260326-k1-usb3-v1-1-0c2b6adf5185@gmail.com>
X-B4-Tracking: v=1; b=H4sIAB0MxGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMz3WxD3dLiJGPdNLNEU6M0E0NjM0MzJaDqgqLUtMwKsEnRsbW1AEl
 nPspZAAAA
X-Change-ID: 20260326-k1-usb3-f6a52f413616
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Yixun Lan <dlan@kernel.org>, 
 Ze Huang <huang.ze@linux.dev>
Cc: linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774455840; l=994;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=HX2kS2CXlof3uu3i5x67Qry8KYMPozu4hVnaRzMVy1A=;
 b=sSdhxxaVsPk/RdstKNgVGGb1XcCzLpe10MvOCK2PNP2EgqoJLouU9wzirIXc7obo9ACJIFgct
 lGVdOCDrwH0Dluk863nVDQj75lYZPTyRtb/Zqo0J6KxN9VFH7fpY6Kq
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_092404_655922_6FED0165 
X-CRM114-Status: UNSURE (   8.48  )
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

When clk_enable() fails, the clock was never enabled. Calling
clk_disable() in this error path is incorrect.

Remove the spurious clk_disable() call from the error handling
in spacemit_usb2phy_init().

Fixes: fe4bc1a08638 ("phy: spacemit: support K1 USB2.0 PHY controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/phy/spacemit/phy-k1-usb2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
index 9215d0b223b2..e8c1e26428a9 100644
--- a/drivers/phy/spacemit/phy-k1-usb2.c
+++ b/drivers/phy/spacemit/phy-k1-usb2.c
@@ -97,7 +97,6 @@ static int spacemit_usb2phy_init(struct phy *phy)
 	ret = clk_enable(sphy->clk);
 	if (ret) {
 		dev_err(&phy->dev, "failed to enable clock\n");
-		clk_disable(sphy->clk);
 		return ret;
 	}
 

---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260326-k1-usb3-f6a52f413616

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
