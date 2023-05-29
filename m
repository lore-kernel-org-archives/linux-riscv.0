Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233E5C77B7A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 10:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=caC0CmzkKCtl8PMpgVo+mLOLMiGIk/aGvwMWabcOtAw=; b=WfVXepedtdnEwu
	1Fq5dXATFsFf9s9Th8rcuvE4xuIyKCIDaepOp4EMTzSqgX95kWMesGj53W1G4gEX+RQkNIsQ39h0Z
	YEPOqM9blI9REhHAwEg/jllSCIQnHqBFMtUh1WH34ZfzICG1fnaRwg03o7vY2rOgEy1lIcrBtfriF
	tp5BbmA7rQ/DenRMLe4S6CS5Um/uO+oj2qSKmhNtA4BZR1ab4cBARPbePAXfw2jiRevNmb/ddCbx5
	dfyf+2zXkykj264d5AwqL2cJWqYCqhjzNnUaKgW6T7DoIaqAI5GT3dt3OB+rpWVlfXomSaGrkY9Gx
	WSAArEYljr1eBPujQnkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Zuz-00A0Y0-0c;
	Mon, 29 May 2023 10:16:01 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Zuv-00A0R7-2g
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 10:15:59 +0000
X-QQ-mid: bizesmtp84t1685355326tejjficc
Received: from localhost.localdomain ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 May 2023 18:15:25 +0800 (CST)
X-QQ-SSF: 01200000000000304000000A0000000
X-QQ-FEAT: q+EIYT+FhZoX3l1jn5qzJL6M/L6SLyhFd6WSXwZbekqfsXe4BK/504CJqpwHH
	IpLCLDhljGvBZdLZQPpV4TuS3K5Vgydh9hUyyHE0in0H2h0iDbvPLIkYWfRod6+709bClut
	7U7WCHCspLZe5UE0Dl+RkckTmtarCPxWRO811vkH37tuNSukWQoGDh2WWWjWomL+kDVNe7P
	UXXyDvH6Tq63uzsMcZ2gyJmRn/TzefecAQfO+7CCaDf3YMX91crBfA4WwrHtAud+w/3rAIZ
	N4zYz1wsO1AXf6LltY5zPRq/VaJlJJGeALqkXPZTX2aTsjVodht05cMO8z65Ldp+fck1Q3g
	hC2ZTZYZJ3TUd/n3mJ3pfG7R7FUU9hGTlYYgAsT
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13277533693592484538
From: Song Shuai <songshuaishuai@tinylab.org>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor@kernel.org,
	suagrfillet@gmail.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <songshuaishuai@tinylab.org>
Subject: [PATCH] riscv: Enable ARCH_SUSPEND_POSSIBLE for s2idle
Date: Mon, 29 May 2023 18:15:24 +0800
Message-Id: <20230529101524.322076-1-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_031558_187401_AD62C074 
X-CRM114-Status: UNSURE (   7.07  )
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

With this configuration opened, the basic platform-independent s2idle is
provided by the sole "s2idle" string in `/sys/power/mem_sleep`.

At the end of s2idle, harts will hit the `wfi` instruction or enter the
SUSPENDED state through the sbi_cpuidle driver. The interrupt of possible
wakeup devices will be kept to wake the system up.

And platform-specific sleep states can be provided by future ACPI and
SBI SUSP extension support.

Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
 arch/riscv/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 348c0fa1fc8c..4bb818035585 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -805,6 +805,9 @@ config ARCH_HIBERNATION_POSSIBLE
 config ARCH_HIBERNATION_HEADER
 	def_bool HIBERNATION
 
+config ARCH_SUSPEND_POSSIBLE
+	def_bool y
+
 endmenu # "Power management options"
 
 menu "CPU Power Management"
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
