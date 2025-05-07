Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A831C3ABBF
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TUhVcDN14suuSXTaodne1oCcWGyN+UKhpTtkQM5IgEw=; b=3kVXh90YlqfQ2/
	26QiC6RPfQomBLwdTBTd1jJD+2mSd0Jq2W7OfrWxCJMjS7+6FG42TodJe3d8cMVmAAJGUUm2ex12o
	hBpUNYX6Vvfj1Iaq6SfF7ZM1Q5cPJEtEHfRLQCmMRvwiOWmzUbSvG+/NHU7KCflkNEEy/c8SPhz54
	Ns1KOV157y8HUC/cDsvPfRE/Bi0YkoLyeCyIsizhtmOJs835hUsmj0Ys/VEIe4MnsXMR1dPNzLeR8
	G/KSJu53wjhvDOubvQMoGJBzBGKBk7OlqY+Zj5hj7k6MDLftS8gyJ4e3kGL8QLDl0OJldMFTKof1/
	0WjjX08vuaidtVZMBphA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCf7L-0000000FcTk-49JP;
	Wed, 07 May 2025 13:47:23 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCen6-0000000FZF8-2Z58
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 13:26:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746624377; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S1k8a2Acv6BXrjoxOTVMKMHBXn+k71huHmWZkYha2kI8zC90aC+rnJX2c6Xhc2t08Ce19Kf4LmuHzpFsKI8wML5khJJh3Jekg0i1xjva+lVOQZccMD/nYAR4zpzJUzfL11Aikn7QmRts5k3+jEUVkxE5WoOvzOEktasam3eYhro=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746624377; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2FqE0aBRpg5Xv7N9/CQAH4qFbVDGFCNbZ0/TBEJd4YQ=; 
	b=RKk8hD/MV9r/D9GwcOpG3VhmJHBnECSG0QuXUpAwmOq8DPR6Xf0+DqZ6WZoJO9fJkf5c5D7Vr9CrxUq64xX5azTBTYlY9/88BEShmZeMnH0LW+23hJEngIMlDM/+bRkkWbAk2hLIoglcdwQ00fdQ8SNShC+8wxunMsCr+QryWwU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746624377;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=2FqE0aBRpg5Xv7N9/CQAH4qFbVDGFCNbZ0/TBEJd4YQ=;
	b=ou+DeZytE/vwJN6wq68vpIBCToFSVMuZX5EpTs+7IpY2YKgTrudxp0RcdJjZCw4I
	Ru2Lc7on1lipzkCJLDIx0X8HIGWpR5Lh1wf5BwPrLTT0BtXxG7E7wAIdGnmIgwOlZ/4
	yKApiCxRs/NgBEmZ/8jInWj6I0yR5LtgtxBg5r2k=
Received: by mx.zohomail.com with SMTPS id 1746624375197517.6340677539908;
	Wed, 7 May 2025 06:26:15 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v3 0/2] reset: canaan: add Kendryte K230 reset support
Date: Wed, 07 May 2025 21:25:32 +0800
Message-Id: <20250507-k230-reset-v3-0-c85240782ea5@pigmoral.tech>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAExfG2gC/1WOQQ6DIBQFr2JYF/NBtNKV92hcKHyVaMWAJW2Md
 y+adOFyXjKTtxGPzqAnj2QjDoPxxs4RsltC1NDMPVKjIxMOPAcBgo48A+rQ40ozLsu7KjpAnZM
 oLA478zljzzryYPxq3fdsB3asR0aA5JdMYBSoBqUVY7KU2Fb2vU7WjqmyL3KEAv/L8QOHi8yj3
 LFWNMAKFFlZLaZ/WddM6YpqIPW+7z9oT2HL5QAAAA==
X-Change-ID: 20250404-k230-reset-32987c6f0ed5
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
 Chen Wang <unicorn_wang@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746624358; l=2115;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=OphoVpCuqFGZlnD/uLkmltrZIdA0mlHD7z5s3T7G71M=;
 b=xAvDQhHX2IBFtskj/M2/vl8PQmBqS8nBzIsDpb4ebzccXFl735ggOhobIAT6e9TzCYcIITT16
 Hj1F3TxUqXvBw8lkyHxyxr4v7//yIWuLPsTQudffN694dSZZUk8Zf3E
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_062629_042783_93AD2D1E 
X-CRM114-Status: UNSURE (   8.99  )
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

This patch series add reset controller support for the Canaan Kendryte
K230 SoC.

Tested on CanMV-K230-V1.1 board. Some of the HW_DONE and SW_DONE reset
type was tested by reseting the submodule and checking the reset
register value[1]. The CPU reset type was tested by a temporary rproc
driver[2][3].

link: https://gist.github.com/pigmoral/cc45de673775575750ac7fe49d4456a2 [1]
link: https://github.com/pigmoral/linux/tree/k230/rproc-cpu0 [2]
link: https://github.com/pigmoral/linux/tree/k230/rproc-cpu1 [3]

---
Changes in v3:
- Update copyright/license in driver and bindings headers
- Rename HS/LS to HISYS/LOSYS in DT bindings
- Add reset-timing notes at the top of reset-k230.c
- Replace long udelay(200) to fsleep(200) for HW_DONE paths
- Remove rstc->dev, store device in rstc->rcdev.dev
- Link to v2: https://lore.kernel.org/r/20250420-k230-reset-v2-0-f1b4a016e438@pigmoral.tech

Changes in v2:
- Turn to_k230_rst from macro to inline function
- Use guard to replace spin_lock_irqsave and spin_unlock_irqrestore
- Remove assert and deassert operations for self-clearing reset types,
  only reserve the reset operation
- Add delay to accommodate the reset time
- Remove blank line inside read-modify-write operations
- Remove redundant default case in enum switch
- Update copyright dates and my email address
- Link to v1: https://lore.kernel.org/r/20240924-k230-reset-v1-0-d0cdc11989eb@outlook.com

---
Junhui Liu (2):
      dt-bindings: reset: add support for canaan,k230-rst
      reset: canaan: add reset driver for Kendryte K230

 .../devicetree/bindings/reset/canaan,k230-rst.yaml |  39 +++
 drivers/reset/Kconfig                              |   9 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-k230.c                         | 371 +++++++++++++++++++++
 include/dt-bindings/reset/canaan,k230-rst.h        |  90 +++++
 5 files changed, 510 insertions(+)
---
base-commit: 0d8d44db295ccad20052d6301ef49ff01fb8ae2d
change-id: 20250404-k230-reset-32987c6f0ed5

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
