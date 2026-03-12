Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38045FED2FE
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 10:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nmzc9x7KPiWT4y0F7jLDeZI6Id8n8ome5TEfXYk5t04=; b=XRJk/SYeYEe9GX
	9rK6OGDQnleVVCbgJ1pTrNLkB/LDALDsXJ9lAF0NnGnyf7/tQx40zepvJ9iAXwm0HOIjjEnAUzUcH
	PLCBmTe2ryc/hlnjDGj759sRg+1fgZKTc4ymAZXw9bc2jkVuKqDZ+AtPUV/0odC/IYTIDc5bD3ogQ
	sTSkYY+4cpJASluzcF6jXx8zGEgsdVH90a81rJy2xYLFTtbQkdianEhqcfhJ2z0JE48HA5pXAFm2p
	GbFyeFs4Vre4aHdUvUvh04sQ/86BCSMBhQpwI7QGL4AoZhKcjwpylU2f5KiiKJPF/t/cdcdf0Jq9F
	a/riclwp29SJvpn14mkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dNG-0000000DsBU-1G9H;
	Thu, 12 Mar 2026 10:34:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dND-0000000DsAe-49FI
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 10:34:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C13B943480;
	Thu, 12 Mar 2026 10:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9F8C116C6;
	Thu, 12 Mar 2026 10:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773311673;
	bh=eG47Dl2Bc/ZA8mrG8zkkaZ4+w/bWA/2Y9BE8NMR8OPI=;
	h=From:Subject:Date:To:Cc:From;
	b=fHNhatLJTnSPpLPEekFiBI3St6bu+fFOm3/7cDd66ySD42QhhnN4YZdv6dEFwU9Hx
	 XNtescUwb/hSLSRKzkaOjnItIN03HwLX+zs1o6RhxKEOipWQV8lFNq7Cj2+A9sQQRB
	 IudIxKtIdUyRrg6Vwfk1D7RkbFthP68TMweD6SFmcaFS0CGiQgQQSicKJjQ7lfQpq7
	 hRZLp9cVGpbEt6/1bcnf9Ll88Qg3GhZeqImsnIGiaLDPWqd4kOR10/tx7a3TDZdc9B
	 24Owm+ZkTbnDBi8XimTz5ReuWJN8l6AnvshE7TPHP5gQNixc2fW2WkaKEl2eo4rrIU
	 sOVkXaJgQHFWg==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/2] reset: spacemit: k3: Decouple the composite reset
Date: Thu, 12 Mar 2026 10:34:18 +0000
Message-Id: <20260312-01-k3-reset-usb-pci-v1-0-022b24b7340f@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKqWsmkC/x3MMQqAMAxA0atIZgNpxQpeRRyqTTUIKo2KIN7d4
 viG/x9QTsIKbfFA4ktUtjXDlAWMs18nRgnZYMk6qoxFMrhUmFj5wFMH3EfBEIh89E3tjIdc7om
 j3P+169/3AyL/eWxlAAAA
X-Change-ID: 20260312-01-k3-reset-usb-pci-dd00afa7561a
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Junzhong Pan <junzhong.pan@spacemit.com>, 
 Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=dlan@kernel.org;
 h=from:subject:message-id; bh=eG47Dl2Bc/ZA8mrG8zkkaZ4+w/bWA/2Y9BE8NMR8OPI=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpspatpujL2boqdEZkli7eEVCVnQvbqf8bRpgAZ
 R7LuZFjpbuJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCabKWrRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2sjQ/+MZkAD1W11hl4KKJoVbLZ/GRv2XFAwZM9VxPIjzqUPyGgXBBnjnxvv
 q6gHrI4gcXqIYn+LBExtZawet/TFNSuN2pdMZVOqGWJ5IE6ddL5Hs4e4FeT4JGBTZNIwnhHhzEt
 U9lWCXi2vcyZ2Gj+ecgBI+5PeU0L8aRZyjw2InWWnmkLLDOW9ZAV+CehkGA+IBf6mh28NLzIaGk
 o5F5t9BeJ36YWJYtsqRZ8GrlxcK4xWDA7kmxT0d/lXjJbJvSeEKrgno6jcxU52v+zvIhtIgkJBy
 6ssZ8QuqqrK9Nm2yZCsLWiaeVI/tGA3LUhNyygJpngx/KyFBIBu3l6ZMFRSvi+nfNUGanaID2nI
 9SId0bzDzMtPFCk+RiypcwJ1epr/o1MWCBhwPvpnptkIkbc87b+yrL85R93dsayR2ylwljX1GJI
 w66d4J6HlJOZtNCkGHXOo1E+x8nkl5anzi1yK3Pl6GRi8mODHVlKq2xw0W6FqewjNT5XWqWcwQz
 0XQf2HLihEftIcUOQKhCkXheiIB5IiLx4Nl/zJD/B/JUoclWmBZovsBg6t2Cnr7Yb1FrfMJnJQb
 2WVDA//FmZxvNOguPh5bypHvPltR9ZPRnY7gz2k5KcJXVZlUv/WzH7HHJ095UNezhh1/O1X6ct+
 163NjyYRhdAvubLJda3QwqLorIm9QI=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_033436_102542_CB044F5E 
X-CRM114-Status: UNSURE (   6.51  )
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

Previously, the reset of The USB and PCIe was submited as a composite
reset, try to decouple them in this series.

The motivation behind is that it will will make the result more aligned
with the hardware which describe them as different reset lines, and also
match with the K3 dwc3 DT binding which request different reset, 
K1 and K3 SoC share same topology of the reset line design.

See the reset part info in binding doc
Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml

I've not added a Fixes tag here, as previous old reset ID has not been
used in any DTS, so it shouldn't cause any problem. I also mark
previous old reset ID as deprecated for now (let me know if it's ok).

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (2):
      dt-bindings: soc: spacemit: k3: Decouple composite reset lines
      reset: spacemit: k3: Add individual reset lines for USB, PCIe

 drivers/reset/spacemit/reset-spacemit-k3.c     | 50 +++++++++++++++-----------
 include/dt-bindings/reset/spacemit,k3-resets.h | 42 ++++++++++++++++------
 2 files changed, 62 insertions(+), 30 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260312-01-k3-reset-usb-pci-dd00afa7561a

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
