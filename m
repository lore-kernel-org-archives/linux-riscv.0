Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E50FC982D6
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 02:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f1GcUYWRsto5uLzHwIb4ORMcRHYWTI4O8z5ZHQ1e12I=; b=zEjdr1+TavMTQc
	Z3Uut+mk486ZESGjLGs5Y1m33ZvSpE5bNHDu8dutp2RErc/qXB4KvCfOmiPGIfXAitXroDQsqZ1wW
	aaOAdPq4ikRbJ7Wx1S6SNLW2uwTXQyd8GjyXG3tXb/AB+Jzu3WYoFSXz0JzVTUEVh9pL2v3yeuA5R
	iUdQ2jKgCVl/QK3DC/AvJAf77W6bwDY/CZHn/0C811TCJ8d6VQFRaxCo8nBSuJHtA6qC/2HL2ZwZX
	DBzUqSmwvfZ+uOqr8XFw2ZqKqtyo1afcRQlIlSFnDU2XdmSkegTfyBdGSaNFWiHZEZiPFy98x4VqB
	sDs99eWZmTACnETXjqNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OWf-0000000DKsZ-2rBl;
	Fri, 18 Sep 2026 02:40:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OWe-0000000DKsG-16V8
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 02:40:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AF9A942A07;
	Fri, 18 Sep 2026 02:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DEA11F000FF;
	Fri, 18 Sep 2026 02:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789699231;
	bh=FvP9c+47Wnat9R6UeaiF9F4Zu92ZPfmKwYxC3QsujYA=;
	h=From:Subject:Date:To:Cc;
	b=lQqomUMhWAJTkQUAHVNWt2SQ2sG1XVLHDfpBihuNjfSFUJs/JvnWlLlMx9FEFRbLq
	 JBjsqLzeSpJ4JTiuiYZowgHKUnw8319rcnBAKNDz+kdiN+FbxQwdg28aIx+nLsUvAm
	 M2FlDqUmQGoSimChFWcr3Fuo6iK04u2VVkkkp9fMBiohgqr5CDOG0LAnzo9lSw1fFG
	 NQcbBGLeAO94hntL4Ba2QLtQv8eI7ClZ/L5xls0TQP/Kr3q2knKvaQXXIB3Ltq231f
	 6xM9Mhd6k97wl8d1aqn9PZ9RgJQEPfWPkqYpu+Ji7AM5ZrPLHmoOfRpJ2Gpwuju5qE
	 e8rjKrnlMM78Q==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/3] PM: spacemit: Add power domain support
Date: Fri, 18 Sep 2026 02:40:12 +0000
Message-Id: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTvJWIgVr2Jc2DLV0UibDhAS0
 rtTdfkW/2+gnIUVLs0GmRdRiWPF8dCAf97HB6MM1WDInKinHqnDd4vpgzqnFPOE5Dh0xGcbBgs
 1S5mDrL/l9fa3zu7Ffvp+oJQdYCdHKHQAAAA=
X-Change-ID: 20260909-04-k3-pm-support-0bef40e87fd7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395; i=dlan@kernel.org;
 h=from:subject:message-id; bh=3O+/WmoIsQzDrwJGBdKpLb03xqXIbSpp60sfODS9ckQ=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqrKSPaZFxU8QzhQ9Y2U7+D5syhEnOdw7Nngoji
 I2j6PagAeqJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaqykjxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2LvA/8Ds9YgZDS3nc2r4peu6+pIJIckVk5I8OxyX4FXIAKrgr9cAq7E6ReQ
 4vfQhPQ5Q64oxF+VHR9MEm+lBQXliGu6XtUtzM/ciBzFmMbaGUnqAfhb4C7tFlR/HBRHTBwpNfV
 T65CkzIR5B1v2GczgBkYd2TrzzUXjjUyMlauKE4fpewyeGddRa29oeT4OUV9UA6aaUvXrdc68+t
 IPaj1kYneXc2YurIXKRwN7FzlVECcus9+TxIRjFoC/cXDuT+WiMSDKwo3Jc58kh3cbOJ3jCr09r
 ixRgbCVr5MdexCJcRL6YQsCQjez53Y7we8twAxqayFrWQ0zvYugvtLxwObB+/VyDe8T6C+z4VsJ
 rwKxxq7+5FBbkGtWNjTbu3lJm46fonoT4rO98qpNsup9cg8BEV3cViBb6NKMfO9KhKIf4bV5JG4
 YnBQGv7RuPG0m/5yINbDvxKni8BrznyWGOBjr1ySFBbUpYMvF1nlG5wkiKh1ylpZzmnkE/RTmzQ
 l0tFvwAqUcL2nRf+hUm8Yucc1Lnl9d/LXb227TGcDhpouG8LoqmhucSkzwMczRtuTqygqe/XvQf
 3nCWAJbIgve1zJngREt/tWq5gLEFgU35IZbjutmaLiF67nKewBBZIdkelpa9xyqnmKRd6m1s29L
 vFUmDtTO/t5TihhUDxhlRTFbzmm17Q=
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

In this series, we try to add a Power Domain driver support for SpacemiT
K1/K3 SoCs, the driver implement the power-switch functionaly which support
power on/off, and it's based on Linux Generic PM Domain framework and
similiar to vendor K1's implementation, but unlike the K3's vendor
version which is more complicated.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (3):
      dt-bindings: power: spacemit: Add power domain controller
      pmdomain: spacemit: Add power domain driver
      dts: riscv: spacemit: Add power domain nodes

 .../bindings/power/spacemit,power-controller.yaml  |  43 ++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |   6 +
 arch/riscv/boot/dts/spacemit/k3.dtsi               |   6 +
 drivers/pmdomain/Kconfig                           |   1 +
 drivers/pmdomain/Makefile                          |   1 +
 drivers/pmdomain/spacemit/Kconfig                  |  15 +
 drivers/pmdomain/spacemit/Makefile                 |   1 +
 drivers/pmdomain/spacemit/pm_domains.c             | 448 +++++++++++++++++++++
 include/dt-bindings/power/spacemit,k1-power.h      |  14 +
 include/dt-bindings/power/spacemit,k3-power.h      |  12 +
 10 files changed, 547 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260909-04-k3-pm-support-0bef40e87fd7

Best regards,
--  
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
