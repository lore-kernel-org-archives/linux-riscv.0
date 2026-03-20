Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB21109317D
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 07:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p3ryHQQp1qY1YUa3dmh8kColEZ454QSc9NJmA5r12Ck=; b=ahbixGdes6L+Po
	U5aOrGur33rn7k4OSRPSpWP26ZSaNut5IwWU/3patr3LX1VKRVQ38sC5TIpJQQPrs6BBNSTftZiOJ
	FF6lfALBiIngB383G8TInyBIlECa3/fpOB5c9uUUjvF3Dc33jaIddbAxh5BZRR5fkOsSpZEldADbb
	VfMTd7EGt3kkRe/WAlCZ3q/cueCcDpZthyP5jSIy//lUhA7UNJKYcj91l0uaDX3NW5uiKRYhFWAoK
	X2Q+laZ44yuw46PJheWI2VEE3tljOt6bqqN5kqK2FueWsJP5hB4BINIvhPeGCahl49Vgyjj0jTfIW
	5f8e+aKmvaSl5Xy3OyLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3U5R-0000000CDi8-1SlX;
	Fri, 20 Mar 2026 07:16:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3U5P-0000000CDhf-3taX
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 07:16:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4532460130;
	Fri, 20 Mar 2026 07:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DEC9C4CEF7;
	Fri, 20 Mar 2026 07:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773990958;
	bh=zTJ7d5VKVBxYx9G690v21pJXq9vZUEBvG2Pesuk1GXs=;
	h=From:Subject:Date:To:Cc:From;
	b=RdG1rvtCuMkHgoidJUY9NR1ArsoOYkW0gbTXHlENyloo3JbjAiuX0MLW7tGNGtQa9
	 6mkYEVpZaV+zCHp8ylcOqyQdVRdA6fMYZGAShAW9NubKfCmzzTG++xUFHVolevxmm4
	 ZnSjXg+3W8pYH+rkTDg2GLQw8/3VrQ9n8q587DMKof5Bq65gkGW+HguTY0r8Ecjy75
	 VgOgCxZrdT+9+KhCEzX77W0WwMz3cUGHwBhJ8AtvrgIbLrOe+37DoT900XsNvhQX7e
	 fiUsSSvCYsJ9zR6pSn9U9Nvw4KBCo/6qrrJHr/EUNl6NrmQmsHaVMDrRHMvuvb0Gmk
	 AHnh+GnGnU+kA==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH v2 0/2] usb: spacemit: k3: Add USB2.0 support
Date: Fri, 20 Mar 2026 07:15:36 +0000
Message-Id: <20260320-02-k3-usb20-support-v2-0-308ea0e44038@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABj0vGkC/22NQQ6CMBBFr0Jm7Zh2EKSuvIdhgXaABkPJFIiG9
 O5WEncu30v++xsEFscBLtkGwqsLzo8J6JDBo2/GjtHZxECKSpVrQkU45LiEOykMyzR5mdE0ujJ
 5WRRsLKTlJNy611691Yl7F2Yv7/1k1V/7653/9laNCm1l2sKokhp7ug4sIz+PXjqoY4wf7XOid
 LcAAAA=
X-Change-ID: 20260312-02-k3-usb20-support-9a1893655e9d
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
 Junzhong Pan <junzhong.pan@spacemit.com>, 
 Inochi Amaoto <inochiama@gmail.com>, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1690; i=dlan@kernel.org;
 h=from:subject:message-id; bh=zTJ7d5VKVBxYx9G690v21pJXq9vZUEBvG2Pesuk1GXs=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpvPQgdaNu3Wa3jbP9tc8E4mFIqS1Z9+wxy0fb+
 pfbXdHleMqJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCabz0IBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+22zA/8Du+QshMhDvSF73PJ2xQzzcYyWaDWdOsRNSOBQQT0+XOff2NAyKsgm
 WZiXcs+DVp6R2/IX10Zp+agZvjKL2CLI1nvPf5moSAo3XreicjYxU0E5TbSg6qp2hXXc9dukh2U
 Nz82/6/iuFBA1ZOA1ADHgDYLXmq5U7VwarPp5vlLKCmvrHMTAKxHHevaJcsViLvZITnkOP6RzJo
 t51ZmY0jBv93PUy0wg8Ikz1pKSs2HyR+immJAsw9zT5yJTCY9W+XbFmgns/gDyLlUcDkNbYdalF
 EVPjcD35qtsS2t8R2yYKm6U6kgoApmEiMXoXqXJ0/kRn9pbBwbsckfiFqxdGLl612RYPstqUguK
 59QwSud86A3GzG/RlSGlKq9lH4SADz6885Lij1fWQ/l7YsIDKSN9GYfGSGs3bwnuPvdS7JLIni+
 MwNhv+Qjy0YNQhFXXVoQalRZvbPtVPvNYGE6HF2bb1Cf2uP3aKwUFe3909YA4EU8AcR3l+2SwYS
 LQry7auFnvJApWr60hST/D4O/C2AVoZrclIWPSpjT+MDeodinyXMQRxAzHRQbNWUafuG6g2HDgn
 rLwmRspLQFTAI8j0HH7A9iKjSBPCGHJ46qqvTO35S/2l5cese5giYKFnByUXCcwLiJ5Z+oq0PwU
 /aao8112dM0NPxo18jb4m0d9Tn8mJc=
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

There is one USB2.0 host in K3 SoC which actually use DWC3 IP but only 
provide USB2.0 functionality, and with only one USB2 PHY connected.

This series try to add USB2.0 support for SpacemiT K3 SoC, and will
enable it for Pico-ITX board in a separate patch. There is a run-time
dependency on USB phy[1], Hub[2] and reset[3] patches, but each series
should be quite independent, so I intend to not add prerequisite id
for the dependency here.

For people who interested, I've collected all patches and put a complete
branch here[4].

Link: https://lore.kernel.org/r/20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org [1]
Link: https://lore.kernel.org/r/20260317-03-usb-hub-fe1-v1-0-71ec3989f5be@kernel.org [2]
Link: https://lore.kernel.org/r/20260314-01-k3-reset-usb-pci-v2-1-9dc0976d524e@kernel.org [3]
Link: https://github.com/spacemit-com/linux/tree/WIP/k3/usb2 [4]

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Changes in v2:
- separate DT patch out, will send in another series
- document for K1 about why also work with one PHY
- collect tags
- Link to v1: https://lore.kernel.org/r/20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org

---
Yixun Lan (2):
      dt-bindings: usb: dwc3: spacemit: add support for K3 SoC
      usb: dwc3: dwc3-generic-plat: spacemit: add support for K3 SoC

 Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml | 6 +++++-
 drivers/usb/dwc3/dwc3-generic-plat.c                        | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)
---
base-commit: c4c6e209dcf903ada6ddb4a0baca01ce8459a379
change-id: 20260312-02-k3-usb20-support-9a1893655e9d

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
