Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF004E6B261
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 02:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZjliVu0pemH/kw/nc8WuYRP5Ds/1eYIoUaoG5XbP3ds=; b=C5A4duwrWc2HLR
	ToC/o3HBSO55V0iWBYQtZH1S0A52Py+tRUDzq6y+cNwVXBW0zQAYDavijCCKVjCTbjLmdA9ZuD7r2
	WONP+0uOb6kqjOhu54Hddg9RD9P6nd+6fo8JkDWuxOKvdYsCe4gCbJB1iV0qWlMAKB+57ND7tABbr
	7J1ZchHl58qynlKGelPQ/2b9qqtQ7kvaSg191T+lJbA7L4GCwb2kytAvLSTMjqeu0I7CGxrHzWkoc
	eNypBS7SujHuJ0sLd9mgzU0kU9vFreXgO++VebQC2nO+vBy00G4pLXfOMukmkwpSaAVSzl7RAbBg1
	DByfPDznFUN8P6ai4+ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXs5p-0000000EQVC-3ObT;
	Tue, 23 Dec 2025 02:25:45 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXs5m-0000000EQUp-2Y83
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 02:25:43 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 08D4A340EA8;
	Tue, 23 Dec 2025 02:25:27 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/3] mmc: sdhci-of-k1: add reset support
Date: Tue, 23 Dec 2025 10:24:48 +0800
Message-Id: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHD9SWkC/32NQQrCMBBFr1Jm7UgmamNdeQ/porSTdBAayZSgl
 Nzd2AO4fA/++xsoJ2GFW7NB4iwqcalgDw2M87AERpkqgzX2QtYSGodPQp3mUTCx8orUdWYicuZ
 8clB3r8Re3nvz0VeeRdeYPvtFpp/9V8tVYuuuZvDODy27e+BljfEYU4C+lPIFBE0AXLMAAAA=
X-Change-ID: 20251221-07-k1-sdhci-reset-1990d1170437
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=Mwz4mD+tkwx1nsWURsMNV1z+XbY+V1uxN9xNzwtuJAA=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpSf2Kf7VnoThBSQORz8vGkFmgA549SBpTrrWq0
 nQufYgz/VGJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUn9ihsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0uiw//cM/o1Oen8fYzJ+hL1YTV6bg2t1KXr38twAHGcpmAoVVwngF2pTZ5C
 pPLfW4GHft0m1x7hlfpXkIbVBZFc9wCsXByi6kqB7B4UMYCZNCecWlzxhAO7U7TxQJFRaCpSK63
 1qmX0s8Bmpo0MhXU1BOj4CS3zGbxkkw5QlI8tOHlrI0YyMPj6Jx4pF6C29aAQbr+zNdW+jf3nTb
 1fq4pAhnxbG27+CBaw73vPiXorLYu3i3OCLupIehZgQkzGL6HE53+olJwZ2vZ3DDehKD6w/I2NG
 zUKrEYkiPns9Atd1nbMPCjmjGyjyB1G8Fqag9UshIerkFnthxt7OcnIQ922YHIxr1kH2fF6ha1B
 3B+uov6HAQQ76Qpx4cMMagNuE7CF+DHfE9q5u/jRGF8H4ZD0k+5WArmOGPzor4JfBJmhYnDXYfV
 J1k5vZREFIRJahSDMD75A4Jx6y1SFZG+iaNZmd6R20bKJokXypCVK8mztAXvUhAsmTJVoKhy9TQ
 Xxuy1lEyF6yLk3RizevghA3E8o5bGKCekTllz+8WD9LguRgW6ilggzqq92f/PE5YI6WwLUUW8Px
 o+bf8HSvM69EHsWKCvu48QUGndGRL6trqUDLOwBhtlAxQ50ZrxF6C39gnVOUnimuz/KmQbptCuA
 g8//1pFwJm7rbhjbIOOLs9LlhHbe3U=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_182542_701899_9A4375D9 
X-CRM114-Status: UNSURE (   6.42  )
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

This series try to add reset support explicitly to SpacemiT SDHCI controller.
Previous it works well for eMMC due to it's already initialized at brom or
bootloader phase.
  The controller has two reset lines, one connect to AXI bus which shared by
all controllers, while another one connect to individual controller separately.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v2:
- To not break DT ABI, make the reset line request optional
- Use devm_reset_control_get_optional() api
- Link to v1: https://lore.kernel.org/r/20251221-07-k1-sdhci-reset-v1-0-6780af7fa6e7@gentoo.org

---
Yixun Lan (3):
      dt-bindings: mmc: spacemit,sdhci: add reset support
      mmc: sdhci-of-k1: add reset support
      riscv: dts: spacemit: sdhci: add reset support

 .../devicetree/bindings/mmc/spacemit,sdhci.yaml      | 10 ++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi                 |  3 +++
 drivers/mmc/host/sdhci-of-k1.c                       | 20 ++++++++++++++++++++
 3 files changed, 33 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251221-07-k1-sdhci-reset-1990d1170437

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
