Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90933FF885D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 10:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4OWDFjyyhjDvxH2QDQ/ek3r8bchkXEVgBqkUpjumsw0=; b=JzqUQaJzjejb66
	lJlsvrK+MZ+93cUMFRBY7kYMlYh94Mte/ctXI4ZmKBWJP+DeBd1mhmqUEGyteZNmN6dg2x9j1dCZz
	bQ8Hrd+jM4NvPS33n1KNsg8qQX6HLDLvRtC75DkvlLFqaFC5hxoCTVU+4qSU9ao1nl5RDf8e8jpcC
	zZT9Il51I/JpMIq30mKL4V5I6PE0j3jUFySaXrcGaY2r+161+UuxtGPzTnu0/bkOvsJNkwO5o71na
	tPippV7PbCJ9CSoOXx8wF2+PzVYjxpwzJ5JvmsqqkGtYkxPSYrF3FMPsR51gQcwXHcVLVIiXhnJ4j
	qEprYuKJGs2vWhBtjKog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfyS-00000001CzU-2W2i;
	Tue, 28 Apr 2026 10:47:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfyR-00000001CzM-3Rew
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 10:47:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E642060141;
	Tue, 28 Apr 2026 10:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E14C2BCB5;
	Tue, 28 Apr 2026 10:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777373246;
	bh=hmQkgfT0rpHX0CJzE2hZUP7HWCGF2gixhN4JwZLv+JA=;
	h=From:Subject:Date:To:Cc:From;
	b=pTUXuWMrnk8VsUalenBFv70B0MEXJ4/R5rM2VjC4M/M85xBPQcfXCRadYII+zSf5/
	 kz7VuwVZI5KeV5qBpReRKf8Rm6KjCcTnl3mdvyh7LNyK5MBWGOJ7Uo1Pu19LXC1ypb
	 bRk35Xutgk/B0dk62/C5Q5TwfdU8N4lh8ZZaP6o9ThCllGdYkhuMWghl10cJaQrkZE
	 h0sn3Zb1feyTOo4uQPT/mKFr7I3dy49xkg1n5diH47jaoMQGUBphbSr1k/qsCsoE0z
	 rWi0iaLvzzi8b/+TWu7NwG0xgfFZ+9bewT6QNidFI2E40lkpxDwLF7ALf/h6sealpX
	 5e5poB5xHn3fw==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH v2 0/2] pwm: spacemit: Add Support for K3 SoC
Date: Tue, 28 Apr 2026 10:46:49 +0000
Message-Id: <20260428-03-k3-pwm-drv-v2-0-a532bbe45556@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABmQ8GkC/13MQQ6CMBCF4auQWTumpVCFlfcwLKoMMEEpmZqqI
 dzdSuLG5f+S9y0QSJgC1NkCQpED+ylFvsvgOripJ+Q2NeQqt6pQGpXB0eD8vGMrEQtyVeXIlGV
 rIX1moY5fm3duUg8cHl7eGx/1d/1J1Z8UE43aqINTtrs4czyNJBPd9l56aNZ1/QCG0OxfqwAAA
 A==
X-Change-ID: 20260401-03-k3-pwm-drv-4ea99ae355d6
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=981; i=dlan@kernel.org;
 h=from:subject:message-id; bh=hmQkgfT0rpHX0CJzE2hZUP7HWCGF2gixhN4JwZLv+JA=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBp8JAwdWxf31B4X/UYDlsnNNL/sigdLdKjBqX4K
 1SnRRj9eaOJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCafCQMBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3GTg/9GubtELYf0rDa3bh0lEVik0BCce7hVSMXtGLQSH7NNgY0Vs/aVS8TE
 8euy3CzBPvYB3BheBE1d3rh9xUJhBXBfgGyi3reM6J4f2z4yXjXix/TOcdHJnlv3Pxl5mILEl1X
 7O2dzpUrRStl1nx/OMJDIH1NgwkEJcFOelSfVd4g9LlKmlKytREZFZ2rdSeYhWEywwPcMn2IEYf
 Fh4bKanfT7FHyG16aFk7lP+kPH/wihe1vJDrZhdXBAQeaI5YzfVfAayF0HI5yN7cokTsIxtYtWP
 S3RkTP/cZi7Y2rwSL1AdTK42Lg4XMG4mg3VKKTz5xfp4GXzFGISHc6Zrycydwva3OgUjbfwUjP9
 vG673vNWkiGn/Kcac5kaxKlTebWaQ9DjeSCe6Ce7RPrrLxG8OV/B2dlIfMaGfLk0JpOsJaKRJHc
 NyNZuoFUFJaUa1QNQBNowu0Mr/fZIua1gi3NFY4HDtT22tj0UaBVKME9jRjCKoSaZoCRvbv1G+p
 PkSYJrlBMOKBSMXc0AiDvXJ4R2LrjU7OhKxXFNFY9cmMdMaDJ/Y85xkYy3ce3gsfUqreW4xbVTm
 h4iaMC0SQ8a2yLZaO1GD1HQ5583AJG+p/5Xem7pMrQfBPhYvmuhLiWhi8ndImG7OL/xOXSUMqrn
 3Wm6Tat+y3tnCarFNoQUG1M1ePjlVQ=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The PWM controller in SpacemiT K3 SoC reuse the same IP as previous K1
generation, while the difference is that one additional bus clock is
added. Introduce a new compatible string and also adjust driver code to
support it.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Changes in v2:
- Merge dt-binding of clock-names property
- Use local variable for bus clock
- Rebase to v7.1-rc1
- Link to v1: https://lore.kernel.org/r/20260409-03-k3-pwm-drv-v1-0-1307a06fba38@kernel.org

---
Yixun Lan (2):
      dt-bindings: pwm: marvell,pxa-pwm: Add SpacemiT K3 PWM support
      pwm: pxa: Add optional bus clock

 .../devicetree/bindings/pwm/marvell,pxa-pwm.yaml   | 41 ++++++++++++++++++++--
 drivers/pwm/pwm-pxa.c                              |  8 ++++-
 2 files changed, 45 insertions(+), 4 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260401-03-k3-pwm-drv-4ea99ae355d6

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
