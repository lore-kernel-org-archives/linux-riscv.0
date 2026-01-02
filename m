Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD7DE9410B
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 07:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HeZhN5q3yRByEM2FENdtsnn+TW8bjVWj5cji3GqeOJY=; b=Odqjh9USJu4gvO
	8gGYw6DuZJGcckWvgSgSPLXFSL8N4s2Qn3mz66TFQUwv/ZnD1Kx2fHKzy5e5nwuOzWo6NJArTL6qM
	taTBUkIuIYt7DMh0+C4T7f4Co+SdHxeVN/W6O7dksIMHurUaPG8Cq5CyNb7VLamh6HTmi36WjR8Eo
	Vsk2nVoblDtWFC5aAWtOWgcwsniC8piGdVtkUCVzCS8/mUxi4QISmQnS4hLaIzvlAfWMqxYCUhBZ6
	OsnAV5OyChmtdIQWaLAin5a03MxtNKwF6nkZ8AjGVWoUWVFPOlocrmsCu/1qNkBYZLw4t700m+Ngk
	VqZmeiDu06Ot4V2jI36w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbZ9w-00000007sFL-2tnp;
	Fri, 02 Jan 2026 07:01:16 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbZ9q-00000007sAU-31R0
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jan 2026 07:01:12 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 27798340B10;
	Fri, 02 Jan 2026 07:01:03 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v3 0/4] pinctrl: spacemit: add support for K3 SoC
Date: Fri, 02 Jan 2026 15:00:21 +0800
Message-Id: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAZtV2kC/13MQQ6DIBRF0a0YxqWBj6J21H00HaB8lLQBA4a0M
 e69aCetw/eSexYSMViM5FIsJGCy0XqXhzgVpB+VG5BanTcBBhXnUFEG9CHoZF0/hyetRdN3Wnd
 YtprkZgpo7Gv3bve8RxtnH947n/j2fiUAdpASp4waaUqFSjLVmeuAbvb+7MNANirBby6POeS84
 jWItkbZCP6Xr+v6AW5ZYaDqAAAA
X-Change-ID: 20251125-02-k3-pinctrl-738cbddbe49d
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=69PQLPKoqWb6cQvuGJn9afGQVIg+yBDRX1uUJsZpzgc=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpV20fvSmFcJ+gdXUQ4veXnZMfiCg7QkDEKvOt7
 aJw5npNG0KJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVdtHxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0iDhAAg+cH2Tsc5vxW94yBuFrbq89p0wqJJqP7Me0Ke20VAd6yjIUHG3fED
 eiA7XBPX3KlQ46Xruw24iP4l7MDesnUBmvHlF/kpgjNPMnSlcKdWml8P1qvp6ieVK09XUwku9Ni
 8mw1paUhjfmwuPzvwfuXciWwAwIziuHqWERRKgbPjdeA/5cH71cs1bwMV9rsXF42k1/4FYsnPrO
 EaM+85WDyq3QOgFGgLIwFpr2FJZdOV/QnFdjY1w4WSGrzaoVLv3PAHZ2He+bp6pR3Of/RSZJETs
 57/O41KcjDpHerO6I8KD8HdsESDcCJWCns+XuepxqFoo8+WkmybyZgeeMq1/hIrL89o7uW8VBrh
 kBPz5JzinAuS70hCo/1OZpAJuN0Z72tynamxtyPE2/Q9ontSHmJz2d+6YBIeNCNja0TLk/Up3d1
 RkaVi7NRoPQ9ceOFzEHIRTnlS0bM5+gqhmY5/iinSGVV8ChfUq8+kYcJlWCwmOxIQkELmsapstG
 /DwTnH4F7TG8YPwLo7E7vb8xe9kW7tIWvJo1zDoBpRyE+nYr5dIdk141Y1BQECLhHMzQCH2a+sy
 hqLSsdMrFE2OceEo0O6le8SC3z//qNfoAp9dpNrTXfFSjjt7yeVtx9lrQiHknYLVNIner4y0WNU
 RVmvCEUMkP2odenpPXURFla+wgmNsw=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_230110_813483_531BA81B 
X-CRM114-Status: UNSURE (   8.62  )
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

I've removed the RFC tag as the driver is tested on K3 SoC.

The K3 pinctrl IP shares almost same logic with previous K1 SoC generation,
but has different register offset and pin configuration, I've introduced
a pin_to_offset() function to handle the difference of register offset.
for the drive strength and schmitter trigger settings, they are also changed.

Patch #1 convert the dt-binding's drive-strength property from free text to
a more standard schema format, then patch #2 try to add pin support which
should handle pin mux, while patch #3 adjust drive strength and schmitter trigger
settings accordingly for new SoC.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v3:
- convert drive-strength to schema format
- Link to v2: https://lore.kernel.org/r/20251226-02-k3-pinctrl-v2-0-5172397e6831@gentoo.org

Changes in v2:
- RFC tag removed
- update dt-binding docs for drive strength
- fix wrong argument for drive strength
- Link to v1: https://lore.kernel.org/r/20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org

---
Yixun Lan (4):
      dt-bindings: pinctrl: spacemit: convert drive strength to schema format
      dt-bindings: pinctrl: spacemit: add K3 SoC support
      pinctrl: spacemit: k3: add initial pin support
      pinctrl: spacemit: k3: adjust drive strength and schmitter trigger

 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      |  22 +-
 drivers/pinctrl/spacemit/Kconfig                   |   4 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c              | 517 +++++++++++++++++++--
 3 files changed, 485 insertions(+), 58 deletions(-)
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
