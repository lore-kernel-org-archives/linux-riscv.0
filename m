Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3503DE668B3
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 10:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ws812lW4LqqNaQAQ1iGaT5PtFtfOzI+YqgIA04B1ywc=; b=eiSZaVX8d8yU0y
	hLH/Iysk4gujVGOYjVgMB7b4FUuNv/GdgaSdPiFWgMzT8Lv2lyz2idRXawPOVEU5atuUYD2KhYVPJ
	bBsp5yf2JcNGR2bzkesfQs5gMKtIQG/M8S8aULKrOBykGWEEKvSBWJAxXaQly4E+JEv08FACheJSI
	v40Iajom1ig7QNkrI+yjg5iVz4Ryl9vpHdstxNBaTwZnFNqlhZ0AIczQpcjtGB3RIiGc0A+EX2DEs
	MXD6bUd7AhzwZH+XvleufjG3G7lJzflV538aVWZ2SBbo48F1IY/6s5yLeeZPYEdjUpjrwuZyaLlOP
	u5HbVxo4LPTNodGQqG+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWtzw-0000000BUoY-3TQt;
	Sat, 20 Dec 2025 10:15:40 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWtzu-0000000BUo6-2GcG
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 10:15:39 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 83605340DD9;
	Sat, 20 Dec 2025 10:15:30 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH RFC 0/3] pinctrl: spacemit: add support for K3 SoC
Date: Sat, 20 Dec 2025 18:14:52 +0800
Message-Id: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAB13RmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyNTXQMj3Wxj3YLMvOSSohxdc2OL5KSUlKRUE8sUJaCegqLUtMwKsHn
 RSkFuzkqxtbUAdHHQYmQAAAA=
X-Change-ID: 20251125-02-k3-pinctrl-738cbddbe49d
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1342; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=CWrajBOGSouuszgbzBF2LrNrwqQq9PQ6TusWyaPtx+Y=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpRnc1IYiyHDAw0s9avPJXNC57Vz9j5yjYhkvmp
 r8H7jw7N8eJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUZ3NRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+39KxAAlGg9cKah8u40Gq/cIw9w78SLxP9OzFytJvedh837+XVanDD32avjW
 buvoT150qcLlm/XppSiVaYU11T2arSyhy6A1BtTCsHSm9SPXqoOqd31+Te248g+KAmnUwWylO/g
 M7e09nOx+a4qUns1z7C2J69egEtmyGIUPJrz0Ocz0V1ysKCHIlWK8ey8JAWdDbovR6iwXNBbmDO
 GsMivrpuazzpGhWbyuDtyjSfGfbkp+MYf3576jSQjSX3hIl4VuOk5dG/aS5vQxELJJh64mE/rdw
 UvkaV/cV1fC1OmGL1WluFO1zZu4okjFo6Gep2+WLAxnIGgl4vgntPhMHOn/YqnExjXtPIrs0QOi
 RJZsp421KshqtsT9h+E+5y/K4zQLr5NxvtFrtViBDn624xb4VDplHuAQnU26CERvbG6AYjA8E8j
 0EKDAgFCRstJOqiky4dDMQT9B3XIcMz1fnXKOzRqFuGUayEOXZnDhuSOrUAkppsQLm5ZViiCA6T
 H26tZGIcvkpDOfwEmGuksepw/OR+LXeETbSgZoX9Il57K+qsb/UTqHGjLnNgWSnt7B5HUVgr4VM
 8R9obMqh/nDaLNEbyQGgbnlWDXJq5E3DAQzEobe378ksmT+vqtPsh0Eblpo71gaW0+nl3yPx0Nr
 2/tucQGJXRLufw1NVj3xcAeP+rQj1g=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_021538_614124_F7267949 
X-CRM114-Status: UNSURE (   7.08  )
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

This series attempt to add pinctrl support for SpacemiT K3 SoC,

I'm marking this series as RFC for now, as the driver is verified on K1
SoC platform, but only tested on K3 FPGA, since K3 production SoC isn't ready.

The K3 pinctrl IP shares almost same logic with previous K1 SoC generation,
but has different register offset and pin configuration, I've introduced
a pin_to_offset() function to handle the difference of register offset.
for the drive strength and schmitter trigger settings, they are also changed.

The patch #1 try to add pin support which should handle pin mux, while patch #2
adjust drive strength and schmitter trigger settings accordingly for new SoC.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Yixun Lan (3):
      dt-bindings: pinctrl: spacemit: add K3 SoC support
      pinctrl: spacemit: k3: add initial pin support
      pinctrl: spacemit: k3: adjust drive strength and schmitter trigger

 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      |   4 +-
 drivers/pinctrl/spacemit/Kconfig                   |   4 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c              | 517 +++++++++++++++++++--
 3 files changed, 471 insertions(+), 54 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251125-02-k3-pinctrl-738cbddbe49d

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
