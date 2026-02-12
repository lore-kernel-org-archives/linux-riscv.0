Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767F2E9E31B
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 01:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7+M1CGpCTlqlvzT0kXaXqI2IhX/zpGCrh8mbXOz0JhE=; b=mGPY3dacceFemO
	muneT+PutqZoNhogmG4WZdCysJWCviSyy0nr/1AEbm4LLcsb3EEdyA1wnehoc4hsZgh8IDz8pvHvH
	BDu00IS1O/9WyThDqzINQh4+0ozuFwZp1b/bEEPH19A8gByu8EmiOcMT7gRmjasHjN4piT6GagPL+
	V2CcIF6uYCYFxrm7xHpuS3WBONlEW+I0/KBcAIf05OVhcO+exW7+lOvyVnf9faON3jB1/rcQZp2O6
	FRXg/uiseMUEf62gFWWFq2S67Q8pec6yghFoHbP7GSF2a6A68uuwysc9P7a9mdPOcH24xN/KJWYkA
	/NgkkiHb+dJUcNySnGmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqLfn-00000001HA2-2rZj;
	Thu, 12 Feb 2026 01:39:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqLfl-00000001H9T-1uaZ;
	Thu, 12 Feb 2026 01:39:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 152C442DC9;
	Thu, 12 Feb 2026 01:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BAAC4CEF7;
	Thu, 12 Feb 2026 01:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770860351;
	bh=VquqpyhQ3deWhyTUCGHSr6ncunPr+ICzU4ZIHWgQYwg=;
	h=From:Subject:Date:To:Cc:From;
	b=uK9F4SZzzSpQKeIVDnYVJuKurEkLX9hUsup3ysAgntoPA+Y/VEY0QQDmKFPkUcTIC
	 jHnwoUk2HuACPhO149g5DgLK5QXzu2e76QcmQs/vCVwFUjMNKHHPdNw1VqJ2LEvUP6
	 N3nBZZr/mU+xLUGJMdsrhYmh/cS7VQ/GLtZmXRIT/K15kut07ADcCrIr/rCOy1dEPj
	 cCEgRSW8YnseNYRysMeeNqqXnLg3ckCHKIsNM2yRgIqGRvRyiRWfAesnfJrGbMxtou
	 YKp9MUErv5BOvxEtNBkFkJy9/LlfjrQyWjlBwD9IoPvpOp5hPKOJTp4Rs0X/67AO2q
	 7uv8wf1gmsOug==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/3] phy: spacemit: Add USB2 PHY support for K3 SoC
Date: Thu, 12 Feb 2026 09:38:53 +0800
Message-Id: <20260212-11-k3-usb2-phy-v1-0-43578592405d@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC0vjWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMTXUND3Wxj3dLiJCPdgoxK3WQTM2ODJEtLgyTDNCWgpoKi1LTMCrC
 B0bG1tQAhkvsqYAAAAA==
X-Change-ID: 20260124-11-k3-usb2-phy-c4630b990b1f
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=842; i=dlan@kernel.org;
 h=from:subject:message-id; bh=VquqpyhQ3deWhyTUCGHSr6ncunPr+ICzU4ZIHWgQYwg=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpjS8wp+DyNoUIZxHuDikotY3ugiavkMetpWVa0
 RB4OsKk1hmJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaY0vMBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2FwhAAiqE60ONiABOR54DBDtyV3drNY6A/zVY7zaPeWEgM+uSAD9n6EmYdN
 qyZQdPHHmxsKvFzq/xxhWKyUx8QOgeLbiGplsMVTdP9khtzZDztkNlEbc40NAaDx9m4TC4SKfjH
 MK3vBBK9bpDq7bh/GpZCWfztDNDYBC1CGqzA1fT5COJUdWwQ+ma8RMBwix+6whxu+/vz51AVODj
 HzXJkJY/IUA7XJ2Xob6enh93N9UBVX1p6083DcqIa/YrCs71B15F3JL3vsn3KOMEIaLvjQqIAQ7
 JtAozTCAjJ0t5tm039fOMhZktLqYOP8NP8zO+frDomMipX7zykJRlULT7rmqpEcgDqWe0Eim9Yt
 lgy4rSEsjHioGewU4b15u9cEQy6xi90tNfzutaA6g5sEsr7+7tZDmwxSCrSLJIdxeGn1w4a+wEr
 l+Mu7JRt1dcedO+gwHk0WITcoCXOh1EAaoNOsqWWPzGwwCz8vWikIdWLnOtxOY3wiQ7MypJYnZg
 f1XL7EKAvbRbUC5LShT7HGwm32ctwbs0qahn5XBhdZTI+cMYsMIm0nW7f3qrK+64G29o7pAOo/+
 tTpv6K/UuV184hEC56emkv/854670YORtk3TuW5G9pk7UCvcYDztukvrpa0iSn6QLPF3QfYLe9r
 oqLFg3XUi/qs3uk5/OpAh+0wUcL1jk=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_173913_540479_B9E76790 
X-CRM114-Status: UNSURE (   5.94  )
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

The series trys to add USB2 PHY support for SpacemiT K3 SoC,
while patch [2/3] implement a disconnect function which is
needed during next connection.

No DTS part has been inclueded in this series, instead I plan
to submit while adding USB host support.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (3):
      dt-bindings: phy: spacemit: k3: add USB2 PHY support
      phy: k1-usb: add disconnect function support
      phy: k1-usb: k3: add USB2 PHY support

 .../devicetree/bindings/phy/spacemit,usb2-phy.yaml |  6 ++-
 drivers/phy/spacemit/phy-k1-usb2.c                 | 52 +++++++++++++++++++++-
 2 files changed, 55 insertions(+), 3 deletions(-)
---
base-commit: dd39930f3d9c1d74a40b79d368e1f3d1555e919c
change-id: 20260124-11-k3-usb2-phy-c4630b990b1f

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
