Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344F1CD4851
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 06:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yvbLXaP4LJtDQ7dzD0yz6ROlLjbYS3PemxIgVIlJEOM=; b=CG5AHY131f5afc
	0/vB+yL4Tf9OA2tqk8QZP9Y5673KZlru1rDI8i640BQSbRdzFUA3WtMxZoVUYPrxli8elsC0Q1zrL
	HxqpqeyBmgZ7U5y7NUfD8roaNXzwFjqOfBS8tvXR0+pKaCxSKDP22wg1ynZfGoHW0csckUMZQncoZ
	onwxGYeJdqQy45ERzyjocpYJh19BWhYRAbMH+WdRJ1uZFpX79054vU+BMCXqo6NsD7ljlrrKFD8Pl
	7S297Du0p2StvW7OZOEhaPqGhgdeBo3+rIpDIu9ptfqb/icqrl6NAUQJvJdo9Byy0++4CEZKiApTK
	OO7lCF0Gq+FD9izRoK6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDlM-00000000IZm-0d53;
	Tue, 19 May 2026 06:17:08 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDlJ-00000000IYz-0wsg
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 06:17:06 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-836ed29d1e5so1280842b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 23:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779171424; x=1779776224; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4dJkPtRJlrakoxNtYsMbmeYzTOO5LSMpVcjFeyWMwk=;
        b=ECvIIkqABi3BHDmG1EBAbgcrve5lhF6s+X5H7dH/4SGLnWwJhKd6nrYDmf8VuBIFuR
         5DOTb3jNclfbqIBVTquT8Kc5xMkoXocXdQcfa7017iHtF+C8S2jQBYIhpbiTJo34tMD4
         sfGFcrrs6dDsQ/UGmFO9Ay+CyUA8vPPbwEZFiaqGPQu/tjof6miGhWw32WKI6Lx2CfyC
         ChOwa5seYpdSRDvw1RfoCvBQaGYoH41dUc5vC4d0Gv1nzix6sGrQeesUTxboTLt6B8R7
         oAo9RokJQsYzaj+N5rxtv6+OAK+mneGt2nrmpGON3evGkknbOCtTo4v7UUzMvK3SHNzL
         HHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779171424; x=1779776224;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4dJkPtRJlrakoxNtYsMbmeYzTOO5LSMpVcjFeyWMwk=;
        b=qfvEN3Zspriik2hMJKDMPfpN+Ihc/JkevDC7VJ51PebnX/RFeDAe4ND7RaJd2f0h3V
         trvh40kbqnMqsdmGP+CHT7Clz80/ab8/L4KBXgps8OAec/GN4OBR1Tw+0Gy5uCRAxjpR
         RmZ7aYXe+xeh8uB3bl+qLZB2pnwQcT7ovP2o5cSI4h3MBsPcorD5rFrPIwOr5Akw4Oi/
         6qW26RGvKMoeo+/vNKk+JjkG/fIvm8lxifAvLtsjMFrkFFYUf2QXmjNu86PNRz4REmJu
         EpH0Xq/QmRrCuzoKW5foOzxuak3+ijEd8P/1nPYP83JiLmfJU7OqHWeiG5vFRZBepBPq
         wpKw==
X-Forwarded-Encrypted: i=1; AFNElJ8fU14IA0quXM82ZjHQ5Oj9iAU2p6Vth4Ch3lDgUkBgTbCPSvCtcQxdrpBD66lI2svrCD/ZqcolxmRveg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFHk+3wAv1NCYMvrRUCtTr7VYEF9kF3jw6JUHU0XXIFvBatj6/
	Dg9lyqTICMtoSTzkub2RQ3t9wZVrrgS7XpwHscBH584iIvQ2WF/8nYEd
X-Gm-Gg: Acq92OELgl2NmkcFJsrOUtwMmiZj32hDxSAMlJ2X/aHo7uioomAWKr67xc0vRl80yDm
	/URHeGvJNcLJ89n0xAvIHfYeZQfg+vakDFnmxezkAmfaT/Hk1h+mjlhvxxuaJrnHC+ieicC0yJj
	llykdiEmWxrod7AJE3vWzIKlWx0iQa4sIGuf+6Hbg6Dq18Gx2+9cD7qieyiNYVJMn6jrw8DqVwv
	nnAjhXrUo924e8RqZz+k8mm//MoFeN+YrU9koEUMvQ2ubv7SzcfpnlXDx2+NWmCqAiLRRQzPCP+
	R1lKFjING725yazd1aZp7JIFucOij0N8ul6s8NsTFK++7+nLkGAEc+wveScQeHkxrxNwKOZ+tDK
	m4mc0xCrJMr5+wW2Av4jJVqJFG0xyqxSCdv84MhEkLzJYcCuVEzQSOP1aDi8EEdyy9FYKrBtvLz
	Pn7vaV6KWNfgot7sGfbuONrGBOtpmLWhFzSphkN+Zy
X-Received: by 2002:aa7:8882:0:b0:82a:6f69:7f72 with SMTP id d2e1a72fcca58-83f33f0fddcmr18309030b3a.47.1779171424126;
        Mon, 18 May 2026 23:17:04 -0700 (PDT)
Received: from [10.240.146.115] ([2.27.148.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7f202sm16112266b3a.43.2026.05.18.23.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:17:03 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Subject: [PATCH 0/3] spi: enable the SpacemiT K3 SoC QSPI
Date: Tue, 19 May 2026 14:15:54 +0800
Message-Id: <20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7bkGtPPSV6BC21hKoaUgQ/j3pO
 AwzL2RKTBkm8UKiwpmDb6A6AfZY/U7IW2PQUhs5KoNnj5FtQL4fvHJkLAodyaFJbYfRQStjIsf
 Pf52XWj8cBcVXZQAAAA==
X-Change-ID: 20260516-k3-pico-itx-qspi-v1-fe040512c45f
To: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Zhengyu He <hezhy472013@gmail.com>, Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1315; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=IRf66rMUn0EauExfU5hPO+7wssB+4ZO7/x8sY0FiJIk=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqDABSfcnC9ZjpkklceVU1Dc84Db35p/VpVrwwE
 QDGds/SgceJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCagwAUgAKCRDN9pw2gLgN
 2HqzD/0VAmqmljFG81AwhK9sHmx+W7G0+tQQEk/jObuf+VKS7IU2TNYECbcuBa/u6SMRj0B5R4v
 mas/Bvw0fsXZ8tUPIoblkQNY6illXhaf4Ptj+k/atW51oI7U/6A3o3Fm+3mypFodkn1bLzNoKXH
 SOuiD+fKWCg6LqOMKhkIGSwQ59akev0vQCKY3UV0u0fzC13IdjEFyVfadZ6pw1z8tYVQkPTmt0Y
 ryg3W44kH75nsUbpIEPp3gl35SpGNrK6eVAwUJn8rFryxFcIXiiyhNhvOQ6Szn5PtJrAcRJ/Vur
 fJwYIceLo3QSBxv9yFttP8SjD7Et9BFN2V9bC8htLx39j5Q53pqJWpfbW0/Ul1QuG+PNm92dbPD
 tliQeDh3FbQgvfX8HPO7Ca1c0AVh7+HolFliXHliJK13cDsN3rGTsljCdqtLJBjJ+wHtNsUk6/i
 qIFs2XgDOjBepZq2zwwndBURVG6gYRI7MBiqWPnraOjZgcJ083gVbxwiOXLlpf7unGoWDZ4C/ks
 INTULC98JS7VaoVJqBUGys8eIetJoB52S20S/JpxLCikDKkFXXh6hePzehXnIAYB0Hg1TxmIRvE
 295eKmyvRMfiX7X//ERs8MSS9yCA/sg222P5Haf5mgRz+O1AAsRCVwi6Y54Pn3fWg5QSV5Lqzrd
 PiBjAzVbs7knGjw==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_231705_271091_8434ABF3 
X-CRM114-Status: GOOD (  11.98  )
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

This series adds support for the SpacemiT K3 SoC QSPI and enables
the SPI NOR flash on the K3 Pico-ITX board.

The K3 QSPI controller can be supported by the existing fsl-qspi
driver with K3-specific device type data.  The changes are:
  - Documenting the SpacemiT K3 QSPI compatible
  - Adding SpacemiT K3 device type data to the fsl-qspi driver
  - Enabling the QSPI controller and SPI NOR flash on K3 Pico-ITX

This series is available here:
  https://github.com/imguoguo/linux/tree/k3-pico-itx-qspi-v1

Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
Zhengyu He (3):
      spi: dt-bindings: fsl-qspi: support SpacemiT K3
      spi: fsl-qspi: add SpacemiT K3 support
      riscv: dts: spacemit: add QSPI support for K3 Pico-ITX

 .../devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml  |  5 +-
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       | 58 ++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       | 21 ++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 16 ++++++
 drivers/spi/spi-fsl-qspi.c                         |  1 +
 5 files changed, 100 insertions(+), 1 deletion(-)
---
base-commit: 6916d5703ddf9a38f1f6c2cc793381a24ee914c6
change-id: 20260516-k3-pico-itx-qspi-v1-fe040512c45f

Best regards,
-- 
Zhengyu He <hezhy472013@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
