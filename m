Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425A1C44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 09:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eK9W/a2DnKRe4C23Ifhp18E2nnQqavUtchDRz9Tz0nU=; b=nlqlqqf/WwSDEG
	VUiQZigZv7ZSLF3gcVU2vYOsYMEwJGcWHd3a207mI3Yxv7p7wGUjiskSdLeRRGQLMNqG/GnZahDBG
	WBsoQeFQet/+MZUiM6j6Ftsc4bfra/rGPAo7r6SffG3w6ZBaHjkLu9E6JBxYHDfpKrnocgBxI2xxY
	k/a0SXs+Oe2G6ZLcoTgyFmYGCHFgBb0mciHZg9Vkl88imwZGYRwgbumQqqcvLlcJWc0CsITlBXQ8w
	Kd9eWWEHBYyIeT9z78OqNx5MnlT1MpxHptAee9Qo391kwgPAey14lMf49iKPhhgQ9E5rAkem//DVs
	ECtGsPMcYq+vuafiVTaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vir8v-00000006kZZ-0aS7;
	Thu, 22 Jan 2026 09:38:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vir8t-00000006kZ9-3pId
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 09:38:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0174B600CB;
	Thu, 22 Jan 2026 09:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56991C116C6;
	Thu, 22 Jan 2026 09:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769074698;
	bh=EWgAvMz5SU18vwREMMzZWEEapD5INKu1KRD7ZdxGh6w=;
	h=From:Subject:Date:To:Cc:From;
	b=pyM9rVvAhHDtByBv2Oha4vhuJsRAOUMauVOR/OMgEcAQfuT6NzTUADMg1Qp+LM7ZI
	 1IazcLADEbfaWtqOLy28S2f1CBv0Y/iSra+mZ3ip7QGGEb+fEPl5rKRnK9ZJK1jkt0
	 5oEGQLa/GBdPSHRMvIlV9AiAmNNDDLlZr/oIvZ/R6jXaITi7QrRN3itUH+MGSlH1+a
	 LY4Ma9YYp7MqDtYS1lE+2JaaPLBbyFMVtGHAaYjQxd35EE7Suqh5ISDIvxQktV7LwG
	 IyPEo9I18TbZ/gxY7wyThKOEGlgaYVgqO6fLYBKxsRypbmNToDLAEqGJ0ToMODYMAb
	 LZisFdWcR8e0w==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH v2 0/2] mmc: spacemit: Add support for K3 SoC
Date: Thu, 22 Jan 2026 17:37:29 +0800
Message-Id: <20260122-07-k3-mmc-v2-0-3c3ffef25e94@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANnvcWkC/03MQQ7CIBCF4as0s3YMUAPGlfcwXVQ6tKQWmsEQT
 cPdxcaFy//l5dsgEXtKcGk2YMo++RhqqEMDdurDSOiH2qCE0kJKhcLg3OKyWNS2F1JpQ+f2BPW
 /Mjn/2q1bV3vy6Rn5vdNZftefouSfkmugc8ZYYe5ucPo6Ewd6HCOP0JVSPrbwJqyjAAAA
X-Change-ID: 20260112-07-k3-mmc-6ca01267e834
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Yixun Lan <dlan@kernel.org>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295; i=dlan@kernel.org;
 h=from:subject:message-id; bh=EWgAvMz5SU18vwREMMzZWEEapD5INKu1KRD7ZdxGh6w=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpce/+HinEMWPgByCb1BEgVBcsMFS+EUvwcnC8v
 l1uUlX4WLiJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaXHv/hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+22YA/6A50NF0MEca1IiK/og/EQsOKYCKWNcMud0+nfCq+qq8XZEg6vanipM
 4RzNH3O5z0dIyHqeCAZ+XVnTz8r6cIxoRKKHBLBYn/Ck0CIsLwlEN+9f3DMWeddwPY0WcsEt9cG
 QTXVDD9wk1uornaqw0j7Z7CAJJ8Mf/9enPXJVKa76uIrMvuIJDkMRfYyTg4IgWJfEo+ngMso1eF
 nEDKJBSGJs6JZiAjNhyPmeUL5J5TMG1GH5pymhYaNvkGAX3zRrKaKamm+uv3+ocWGc3F5Db8pW5
 H6PAfZpyXt1nrSWxAl/kRucGMHQx4texhY5zZOAsjCSwBX6YpYLHJ1bzEBDJUG2LuVjZv3Bk5XX
 6sBfCtZG47hl76dThzICc1ZXczPW61Se9gaWx+fVnCcGrpZSPTzbdgLaCTUjK7cxfa2rJmTZsPJ
 3/4UOshLgZrg3rrJqjaCR7Vax0scjaoyyaKY25zhfoGrXAP4r8B8OtdgkQyEmzhNL7MROThED3g
 /F8U3CwQzEg+gncEOE4PnwESYlHQF7lL/R5V83Dbsy8LK6Q5HnbUySAzj4MA0C2oADv9xWyRXQ5
 WYg5S37+RNK3gYvEo/3W/Vsf2TlgKNPmY1zYZxnY71OWx/165kpGMKHoNLQ3Prvd7ye8VAEuJ+B
 WNM3TvYd4lurJxs0sNP9B6vkaOH3Ac=
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

Enable SDHCI controller support on new SpacemiT K3 SoC, while as before
only the third controller and the eMMC device has been tested which using
vendor K3 evb board. This board has not acquired support in mainline
kernel, so I've omitted the DT part patches for now.

The new SDHCI controller almost reuse the same IP as old K1 generation,
while fixed the broken 64BIT DMA issue.

Hi Ulf,
 Any chance to queue this for v6.20? I know it's a little bit late,
but the patch itself is quite simple and we've tested on evb board.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Changes in v2:
- collect Rob's Ack
- drop uncessary blank line
- drop return check from of_device_get_match_data
- Link to v1: https://lore.kernel.org/r/20260121-07-k3-mmc-v1-0-ff77c07bfdf6@kernel.org

---
Yixun Lan (2):
      dt-bindings: mmc: spacemit,sdhci: add support for K3 SoC
      mmc: sdhci-of-k1: spacemit: Add support for K3 SoC

 .../devicetree/bindings/mmc/spacemit,sdhci.yaml       |  4 +++-
 drivers/mmc/host/sdhci-of-k1.c                        | 19 +++++++++++++++++--
 2 files changed, 20 insertions(+), 3 deletions(-)
---
base-commit: 6cefff068d030786d63fa50970d6581c354630b2
change-id: 20260112-07-k3-mmc-6ca01267e834

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
