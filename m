Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D48C9832A
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 02:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dma5rB2dx9vHCoJ66xYn1+m8oxCt+cEaAuyp4Dzd8kA=; b=eE1TE+zFs3j2gN
	be+c9uXD3aftKN1xwGOmoUSA9HzPc8vbaFJQnSLWBAmn+9T5jWpgDBbfmpfh824fuSuDyNHNkxUWC
	De7CwhHYhEyFM1cEsDK7/NYqSqFE3A5js4iT61xnu3ZCbpKLU8DbaAZD28uYHRfdYHeR0T8vQMAXv
	tsnfHvt3e+c4jOGK3LHvdvxYxsVFC1TQL6DKRcw08wuTNP2nVoAPhsYSXsDzqtQgmQvvNqMYcd9KD
	IM0GxY86OYn6ELjYFIAXhlhKVfp0at6BJMP303pjpTmZzZpfIJJYXMEy23p4Qy2hIA8VL3bPnUiYN
	QY/PN8qf6CMkuHh52/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAf4N-0000000FxXf-1Edn;
	Sun, 27 Sep 2026 02:56:51 +0000
Received: from mail-pj2-x09.google.com ([2607:f8b0:4864:39::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAf4E-0000000FxUX-2y4k
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 02:56:44 +0000
Received: by mail-pj2-x09.google.com with SMTP id d9443c01a7336-2dfb6149d59so3016455ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 26 Sep 2026 19:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790477802; x=1791082602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qyMsLj0hkCZGFDmY3GbC7EId9UWnZfSNH3ILjJaXTeM=;
        b=rdx7XSEMYn55E8kJZnU9tTzV8cF+jrPycAzD4KLWNfEHhr7Tf5UbbCHHg+mgSircyU
         exBO5zwHcoW6YTzXFvGkQXaGV/HPZkmtPu4ZKjfoTvupgva0ZnIGaZiNO0FOOGcbUtio
         uhzjc7i00anhh+xH9lPW5U2Qcnrt5zSeUsegTu+hxEmJN0LKwKEJD1cBpWod2FAY7fBh
         48IZsgHJ/l9Icj0vvRwDx288fToxANXNo9ezlKAkK+/vsv4hXTjfGPqWDGNhq6GlaKpE
         SPNQI5whNnZV11iLRyM9qpv7z5FAFJAffZ9oxUp5t3SABbfcf8QmB2Cf5KHWlAt2GSzs
         cXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477802; x=1791082602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyMsLj0hkCZGFDmY3GbC7EId9UWnZfSNH3ILjJaXTeM=;
        b=amyl2Mj7K4T5Yu2KSGCPU4VyYqhy0xnYMR1UcJlj7mllsWRhriWDDYrMCYuf9VN9w5
         8wyXNVwPE/N1bTJ04cOLPZY9+9TFJETCihIMHpwrvfVxUppsKh+47p4A83JAs8Yjl1Lg
         UpR2z2K9Hs01FhrynOLt2JZ/HymosBlewn9BCK700juSOizRbUbOMlFExIxDeuP1vcuE
         8jdUgCEWqvJyQ+slsJUAkGI662MxLTtbU72kxA3DpNx09fyqhxMrZtSHUf0PIprfI6UX
         yhdvpa84q/k8hHwoGUewO5tBx8hBEduL7+VIazfUMcmB+uqAkWstJRzE1YR3pIE8M6UV
         Fd/Q==
X-Forwarded-Encrypted: i=1; AKwUvByf6EC200EI/ibtwwVli4GJM6njT5DqnT5I/pz+P0ErsiNwFoe9QM5jvfD0wSBUwlP7DEyMw+LUk6rfpA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKusuV/cf2yZrIIu/ygJmWFrDgoXht05IeXpymHe7Ods6iVMtPJ
	tHDPTihAbj5WBVBCoZqRtrixy7QU/JEzKCvM5LF+4czYKpWUY+grDB+rledrCEdiONzZ
X-Gm-Gg: AYBFou3C7MjJkRa2I/pIU6Wm3wBkb5kC1ACpXimJlpwa4JWcZ3rR+1ts+QiUWBMjPLC
	lM/G//eQFGzKWaTWx3pqbuS383/+6fo9MZeUrcG3RLuqGtZUhI3HM3gPJN9XbhMVNmDm8kNxG5/
	V+78QFRXpOMjy9ISoywrfHzAMP8qEW3iMmBF6HNMYxqpIhQKS3VncstvGsgvwb4fAdSIlGlaw9U
	2dLGbm31NoL1IG9k7VzBeccqHcNhZGLuqk8+uKUqvck6UFNxHC+IsHLxEVFwT+HO6bGqsYTDFsz
	qTvRWkToLjeEX6BcoIWPZbw0ZARkbsv0it3g+eNweZBzZPXuRk1BfV6CkHauPGXkTLSxi4PQ9q0
	dw6mfLSpuQVy7zY33AsASRp8TlitaT1ETwekAe4S61rcINJXVyF9KNLv4SjDIeXSeEOG82eShCL
	QYURFGWf1DFO89kuugh/YgEIiCoMZ4SXdKI3sOwOYjgyIATX6n2Y86D+Wh2zla73Rtlg==
X-Received: by 2002:a17:902:e94f:b0:2df:a4a0:6443 with SMTP id d9443c01a7336-2dfa4a06479mr31921045ad.13.1790477801815;
        Sat, 26 Sep 2026 19:56:41 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm25512285ad.52.2026.09.26.19.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:56:40 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH 1/3] hwspinlock: sun6i: Get the clock and the reset without names
Date: Sun, 27 Sep 2026 09:56:24 +0700
Message-Id: <20260927025626.69614-2-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_195642_771516_79BAD112 
X-CRM114-Status: GOOD (  12.55  )
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

The driver looks up its clock and reset by the name "ahb", but the
binding doesn't define clock-names or reset-names, so a node that
follows the binding fails to probe:

  sun6i_hwspinlock 3005000.hwlock: unable to get AHB clock (-2)

There is only one of each, so get them without a name. That is what
was asked for when the names were added to an A64 node, and nodes that
do set "ahb" keep working. For the reset, call the explicit
devm_reset_control_get_exclusive(), which devm_reset_control_get()
only wraps.

Fixes: 3c881e05c814 ("hwspinlock: add sun6i hardware spinlock support")
Link: https://lore.kernel.org/f720eaf9-01d0-0e57-f6bf-9aade00aafb8@linaro.org
Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 drivers/hwspinlock/sun6i_hwspinlock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index c2d3145880..e7cc121310 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -104,14 +104,14 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->ahb_clk = devm_clk_get(&pdev->dev, "ahb");
+	priv->ahb_clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(priv->ahb_clk)) {
 		err = PTR_ERR(priv->ahb_clk);
 		dev_err(&pdev->dev, "unable to get AHB clock (%d)\n", err);
 		return err;
 	}
 
-	priv->reset = devm_reset_control_get(&pdev->dev, "ahb");
+	priv->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(priv->reset))
 		return dev_err_probe(&pdev->dev, PTR_ERR(priv->reset),
 				     "unable to get reset control\n");
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
