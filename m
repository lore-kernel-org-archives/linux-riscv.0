Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E648BC5AE49
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 13:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8zmUNYVZ6BPeB7Tp8ksQkkcL/6UJhw6n1ZJNFf7JWd4=; b=kVqqFF5Fug+aO8
	6v2WyYxxn+7Lf2Jjh3va2lcIhzhKgYw4p6sJkhk7uS+F1OjVj0ttma3aDTaVyJRrN2L7GbN9Gc1V6
	/V5r0Vws9SIdws52AhGePUaRzH+sqKspb1p8IpXf91ppL9yufiNYMdDJkk4v46ITzxizvC1vMI0hw
	H4S8w1t8UKEPIfa/XqazZda/voVJlEKt4jqfOdpTyIHiLcH8KJH4GVstxyDqP/78gj+UrgDbV8Uqm
	8JuoiacD+0NIesnvp/uwlV8/uBCYBl6w+iXTPAvgDrtK2etaMRN1c7d1jcO5WAopQMLUW5ynWH21Q
	UKa3iITUvgOZLaa0yUnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt3ND-0000000AJpY-3WuK;
	Sun, 09 Aug 2026 13:15:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt3N5-0000000AJe5-0ElH;
	Sun, 09 Aug 2026 13:15:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E16364500E;
	Sun,  9 Aug 2026 13:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF6E7C32786;
	Sun,  9 Aug 2026 13:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786281321;
	bh=vKDbRg4XZkgHrtO10qse7GVmheGJdzt6mePjP73cFlY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VDrlU8hvT5rqwUD0/4XgOm6cN3J5w+qoRGpMVvfzXblecbUsBiDnZPtXPdfESlxA7
	 Ec7UiL7oVxtPA6HDKrIG3qD/Y/k4V6nOAuCR/yJf3HQzt80IG1co177opkDm/gGfPR
	 UfXX/LRHpo+lWcbq/ZeG/lA+wk51j/1CXgmoOsh0NhdW3Bmpl7L5J5/G6rzBSuQB97
	 ZbY+50IO9w1e8r9YYW2rNNKmsE+MxMPy+gfE3rFQ2E34f8tq7XXVH8FiH4mGb7ZCgx
	 ujPi+kPpM6z5Tg7P7QRjnCtXXJR22q++xOQZtPd+SluQvVZVFYEDygzEYPrzg0EJyL
	 V31M5LEwk5N7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F26C5AD7B;
	Sun,  9 Aug 2026 13:15:21 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sun, 09 Aug 2026 21:14:22 +0800
Subject: [PATCH v2 13/17] MAINTAINERS: add SpacemiT K3 display driver entry
MIME-Version: 1.0
Message-Id: <20260809-k3-display-v2-13-327d7910bf71@gmail.com>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
In-Reply-To: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Guodong Xu <docular.xu@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786281298; l=990;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=uE//zxGHdM4vouTm7VJyhpSaodElUoNAgs+MFj3YrE4=;
 b=HsG8S4sGhDTpwnC8X70jlY2o1/CvltfjMRBHZVAdSD/xf4d4GzoxH6Zo2wJZBdGtzkt5d13WA
 ZVva0mj0VbpAvha5Aw5jH0tuaOCPDC5pqcXdOTyh98XsBnX9YRkQoEQ
X-Developer-Key: i=codykang.hk@gmail.com; a=ed25519;
 pk=Osn6/cs9Su/mHHw4P19cmVc3v2FMQfiWahjsN0vEkuk=
X-Endpoint-Received: by B4 Relay for codykang.hk@gmail.com/codykang with
 auth_id=895
X-Original-From: Cody Kang <codykang.hk@gmail.com>
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
Reply-To: codykang.hk@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Cody Kang <codykang.hk@gmail.com>

Cover the Saturn DPU, the Innosilicon DP/eDP controller, the DP PHY and
their bindings.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>

---
v2:
- no change
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dea93a419624..9f2910a17c387 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25436,6 +25436,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
 F:	drivers/i2c/busses/i2c-k1.c
 
+SPACEMIT K3 DISPLAY DRIVER
+M:	Cody Kang <codykang.hk@gmail.com>
+L:	dri-devel@lists.freedesktop.org
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/spacemit/
+F:	Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml
+F:	drivers/gpu/drm/spacemit/
+F:	drivers/phy/spacemit/phy-k3-inno-dp.c
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
