Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE86C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 13:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czsd1bRAqpdVWY09qfIJxY7QR10OfG59EOGO4ptiFic=; b=diGspPIh8QOMs/
	7/ESoVPAg0UrqT0DKZLnXNuSwHSosMf1+PERhsxg7rtD0DO2bgI7nqadLOtOZRgE73DqFbY2fp+r1
	QrLvdx5T227JjftJ/RsJEG/wqQ6HSgxfDPAcRPIvgnhqgPTLcc3F1Ac2yuJcMKUOdbgGtQfBGqwlK
	ON9fNRbdXuJJHUUyDmSUQTSQzriI82FUba42fl99SFTrxKTyVrXeL5ag53ijTU59eJk32+SVybrhj
	evV+gGx0zGKmYYwGZRfgMQKG20kthitLfXtXPU0WPJhBBIQ2ek8AONDA1ziZF3t9K3UZNkr2+/V+J
	iKW6ZgfWxOv/7zqL4sxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jyt-007n7D-Nh; Thu, 01 Dec 2022 13:52:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jyq-007n5O-9g
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 13:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669902721; x=1701438721;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bav08OV3LsnmXxf0ohUY0Zv4EUZl+WnAgOolhM8CEvc=;
  b=sirPEEvwg1JAcqt5pAQV+0V64HcCTTwklJIRqhdOX5l0jhDm22KWg6F8
   SWYtHs+EXkhXjgl8bWNcak8wA/T3dhmU/WLwCWk+8JSi4VnS8R6ZUxE9+
   k3BeA/wutpY8+Se28OauL/AS5B8V1xCngmrOApRorKWJENUmK4DAFQEpX
   bWMknS9MY2MLIRAFanQITXvWYZelPz59qij4gx9BJ5D9Q5pmRct1mIMbP
   /RRxd5C0GVAORHrFXRECw8Y/GDgk3ZoZYpD8dTAdM3IWhwR2ruwhg9Wn4
   vny1mPWVK6TYBmhJg3tA5OFugltZm+1Ivg2gMZsj3Jyhqo/SEvDy3xUcY
   g==;
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; 
   d="scan'208";a="186069167"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Dec 2022 06:51:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 1 Dec 2022 06:51:52 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Thu, 1 Dec 2022 06:51:50 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>, <linux-doc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Documentation: riscv: note that counter access is part of the uABI
Date: Thu, 1 Dec 2022 13:51:10 +0000
Message-ID: <20221201135110.3855965-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <Y4XvnHIPw8ZuBZEk@wendy>
References: <Y4XvnHIPw8ZuBZEk@wendy>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_055200_420266_87808341 
X-CRM114-Status: UNSURE (   6.91  )
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

Commit 5a5294fbe020 ("RISC-V: Re-enable counter access from userspace")
fixed userspace access to CYCLE, TIME & INSTRET counters and left a nice
comment in-place about why they must not be restricted. Since we now
have a uABI doc in RISC-V land, add a section documenting it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Based on an, as yet, unsent v2 of my other uABI changes. I don't expect
it to be applicable, just getting a patch into patchwork while I don't
forget about this.
---
 Documentation/riscv/uabi.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
index 8d2651e42fda..638ddce56700 100644
--- a/Documentation/riscv/uabi.rst
+++ b/Documentation/riscv/uabi.rst
@@ -3,6 +3,13 @@
 RISC-V Linux User ABI
 =====================
 
+Counter access
+--------------
+
+Access to the CYCLE, TIME and INSTRET counters, now controlled by the SBI PMU
+extension, were part of the ISA when the uABI was frozen & so remain accessible
+from userspace.
+
 ISA string ordering in /proc/cpuinfo
 ------------------------------------
 

base-commit: 13ee7ef407cfcf63f4f047460ac5bb6ba5a3447d
prerequisite-patch-id: d17a9ffb6fcf99eb683728da98cd50e18cd28fe8
prerequisite-patch-id: 0df4127e3f4a0c02a235fea00bcb69cd94fabb38
prerequisite-patch-id: 171724b870ba212b714ebbded480269accd83733
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
