Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A25ACA6004
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 02:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5vVwgkC/j/UYPu0drV49xh5bzFqMitQTWojYVMCNWwc=; b=gXoUD+JYAjS6V2
	3U8kMzvO26vZHE1i8Qs0Y3GaURQqgdNvBxHmvi+RgwAycLHjENWrEulhH3kwwu1DBXkhewjrmBMhk
	MCcGKwmsRLSzuprbCvxhEkPuOWyPxiwV4QkDQ6PWwDX7mu3WOWWbwtBzEkALXvoc9i2HKakmuvCJj
	/BE6IKhFJ3726WztBl1blN4hr2cyun03/46IZ9Vsz0j7JKbr/y5XxOVIIiezbfQgzNrpW5FjB+zem
	7yCjfrVkC27Cg7ntdelomZLcF3VrAO8BfC7MOsnm0HRSxKTdgcbM1bdzAPgX9k+Q/jPJ+Cwz6gIXA
	/oO6x/LVtVUeXQ8VqDLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeKp-00000003QFV-0Obt;
	Thu, 08 Oct 2026 02:58:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeKn-00000003QEg-2Clp
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 02:58:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B6902602BA;
	Thu,  8 Oct 2026 02:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD87B1F00893;
	Thu,  8 Oct 2026 02:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791428296;
	bh=PyN3EcISv+5EZ8wNP0QHAEF2GFgb5uDn9zjA9bRxqkM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=W+fwH4CrC1V8tYGc7ggluunt+0GzQYEFWGyPwOnnS2cmUDLvcZckEFLkBRgYVfegj
	 K/c+FZdiIHyIIEVmHwTI+RdF33W6HWEjRBN/RRgxkUZ4+tjrREyjWZTSBzIbjxrFRf
	 M1uWOtPtGpIyBvpI5AAwa7S9H8s+wNDWNg5BtzgIxGHlO7klTyHTbyWPwDZw8iE2AZ
	 pC3dl3DQTecXHCuiUz3MbeIgK+LsMIOcolJm55IB0od056kbcmIxVpYVpsuDZanM43
	 C+7cxRms8gRbbuyw2TYXqzWbwu7mUB3SFT2jRHd4JvFl+W3t3mnM/ke7jSgiQu5wbM
	 ZGVCQ6GHHMRiw==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 08 Oct 2026 02:57:55 +0000
Subject: [PATCH 1/2] clk: spacemit: rename to generic ccu aux register
 function
MIME-Version: 1.0
Message-Id: <20261008-04-k3-clk-pm-aux-v1-1-8372d7307694@kernel.org>
References: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org>
In-Reply-To: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2085; i=dlan@kernel.org;
 h=from:subject:message-id; bh=XPLMkYyFjbfl4WMMQWRlozz/d0XZ9OyspH0P7A/Spbs=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqxwa7pCimB89wBMDeNEVdV/hspyLL3eswrNWad
 R4mPIrUtrSJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCascGuxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2dqw//YJfRv0lGSBSjIQD7XCJoCkaP7f9iJOMNS+JwrYN0RY5mUwWikpxzE
 g7fo4RJ9cZpjZuOnF3orohRir53VA5VrY3vhK9bQ7fZspnOON0Ubof9tDhW3keBFP+dbSns7LXD
 b1RjahMWUMlkRi/R2kQle/vw/7r0a9173U8YYBbOneZJxQDqemUXL8r6bCdrInSXGusrUJnEomX
 6N7m/wW+OjQ7EmJ5RhADPz3rOyAG5p4bNZFIM4lxzu0g5ApKFG80Q1wpbfW2sOCoK0zueWkNeQ7
 tAvtyiq7AnUxMd0xu2b1Q3vzrPyf7xw6sOZcBvH1nLn4NPDfwSIGUWmnFWGzklYLarYKmeVHKKl
 PnQGosumahJFhejZfRqtLshN99KP3jUeXO6+KbrDSxTZ9w+VoY2IdNkzHC/9PcXYWo5umlSqZZq
 JEBJ9PwgwgUF8CIy5aQridXJr4DejjueUDyW9XhG1bItGMssE4go3S9qmpGoasFoyBHq02ACMvk
 /QL+LAA5bIcQsUJqiTBQ/CZR26dN7IABnAywyPpnWQWvqSv2AOBGKikwe5djaHfiZJDENhYifxU
 DJP/J3tAiARi784dCY4hS1vQ9TtDGYndt98a+pQaGizTfeGwIAY8T0/AwZJNLgAwy9eciYWz7kv
 5+vGWCNKUQ99YNE9I+E1dxF5aWf5cs=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-clk@vger.kernel.org, Iker Pedrosa <ikerpedrosam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The APMU (Application Subsystem Power Management Unit) register region
block not only provides clock and reset support, but also the pm domain
management capabilities, so function of aux registration is being renamed
to a more generic one, in order to prepare for future addition of pm
domain driver.

No functional change is introduced therefore.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/clk/spacemit/ccu_common.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
index 8696bb9cba2d..56f3d081857e 100644
--- a/drivers/clk/spacemit/ccu_common.c
+++ b/drivers/clk/spacemit/ccu_common.c
@@ -79,16 +79,16 @@ static void spacemit_adev_unregister(void *data)
 	auxiliary_device_uninit(adev);
 }
 
-static int spacemit_ccu_reset_register(struct device *dev,
+static int spacemit_ccu_aux_register(struct device *dev,
 				       struct regmap *regmap,
-				       const char *reset_name)
+				       const char *name)
 {
 	struct spacemit_ccu_adev *cadev;
 	struct auxiliary_device *adev;
 	int ret;
 
-	/* Nothing to do if the CCU does not implement a reset controller */
-	if (!reset_name)
+	/* Nothing to do if the CCU does not implement a reset/pm controller */
+	if (!name)
 		return 0;
 
 	cadev = kzalloc_obj(*cadev);
@@ -98,7 +98,7 @@ static int spacemit_ccu_reset_register(struct device *dev,
 	cadev->regmap = regmap;
 
 	adev = &cadev->adev;
-	adev->name = reset_name;
+	adev->name = name;
 	adev->dev.parent = dev;
 	adev->dev.release = spacemit_cadev_release;
 	adev->dev.of_node = dev->of_node;
@@ -165,7 +165,7 @@ int spacemit_ccu_probe(struct platform_device *pdev, const char *compat)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
-	ret = spacemit_ccu_reset_register(dev, base_regmap, data->reset_name);
+	ret = spacemit_ccu_aux_register(dev, base_regmap, data->reset_name);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register resets\n");
 

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
