Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB08C7EE2F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 07:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zj1pDy2Ui2ykD3qjgfL75rSrXtrJdLxnYyEcbF867as=; b=jqZ3A5Jq1X2/uw
	FBIrYQOHbDvWENGO6+OFgf1G7WjYZ6fQQWK2cIwZleJ3RUqhwE2OA8ssolZxITE0VAblGSy8zmSHb
	RYBmJ4g+0yyPz42zXF+Xz/zIG5CZwIEH8dbJ0rQfijEkB9pu5eDodBpMFqwVEmL70/VBTGGDCQEhL
	WuAXByygtmypb6Kk9Bz2EtMc43cOViOqdzYOaOv8oXhETryqqWAqNlpgDP/kNJcy2yn4KEzrmt6jr
	SgfKuUU58+H9P7jcz4KkK15q/R6tOE90gGtH/S55J6dRuKCMcBVsjQAkIPaHfsB4EFKqMw5cZi7TX
	EFiIE88/L9lL4+oItRhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7WyP-00C8J8-1K;
	Fri, 09 Jun 2023 07:55:53 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7WyL-00C8Gy-2P
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jun 2023 07:55:51 +0000
X-QQ-mid: bizesmtp75t1686297192tngrrsv3
Received: from localhost.localdomain ( [58.240.82.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Jun 2023 15:53:11 +0800 (CST)
X-QQ-SSF: 01200000000000908000000A0000000
X-QQ-FEAT: 3M0okmaRx3ggkGfYbCwXKFcJVxYo7gx8Sd8QId2cLz94QTT20Ue9kVFXfH7mk
	XRXlTwTPdy4vaDs5QViLJiCIfTnjIdM9r0mNkM/Lo3tRdqRvMoViq+uW6suj/6O70CZSodZ
	yBkndruclxcfHizm+Fcgr3DrJVwpcAoftfoXGn+7GgsyQkty+8LJ4UE1s3/3RBGpPMOHVeK
	ATBQplGoG5mPSJPc3SB14N13nmWOdlD/iBdWVzvi5FYQ2rgb/sK7huHvdmi2+iOBgjNj3p+
	efTBedwnRLQ+FO9VOscQFfyuQWNvAHv9gArJiuKQYS+RslHMEsQxfCrZNFCY3pvsv1MQX35
	Zk6sV93P4gpMhJFjQp1Zd3fFu6+4uY89VJEcQV3S3Cg0AvEvqQ8ahkzsyLvhQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10720794791275635707
From: Song Shuai <songshuaishuai@tinylab.org>
To: catalin.marinas@arm.com,
	will@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	songshuaishuai@tinylab.org,
	steven.price@arm.com,
	vincenzo.frascino@arm.com,
	leyfoon.tan@starfivetech.com,
	mason.huo@starfivetech.com,
	jeeheng.sia@starfivetech.com,
	conor.dooley@microchip.com,
	ajones@ventanamicro.com
Cc: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH V2 3/4] riscv: hibernate: remove WARN_ON in save_processor_state
Date: Fri,  9 Jun 2023 15:50:48 +0800
Message-Id: <20230609075049.2651723-4-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230609075049.2651723-1-songshuaishuai@tinylab.org>
References: <20230609075049.2651723-1-songshuaishuai@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_005550_103961_EC1F58E1 
X-CRM114-Status: UNSURE (   7.72  )
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

During hibernation or restoration, freeze_secondary_cpus
checks num_online_cpus via BUG_ON, and the subsequent
save_processor_state also does the checking with WARN_ON.

In the case of CONFIG_PM_SLEEP_SMP=n, freeze_secondary_cpus
is not defined, but the sole possible condition to disable
CONFIG_PM_SLEEP_SMP is !SMP where num_online_cpus is always 1.
We also don't have to check it in save_processor_state.

So remove the unnecessary checking in save_processor_state.

Fixes: c0317210012e ("RISC-V: Add arch functions to support hibernation/suspend-to-disk")
Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
 arch/riscv/kernel/hibernate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/hibernate.c b/arch/riscv/kernel/hibernate.c
index 395f835f067c..86f1c9ab6b0b 100644
--- a/arch/riscv/kernel/hibernate.c
+++ b/arch/riscv/kernel/hibernate.c
@@ -119,7 +119,6 @@ int pfn_is_nosave(unsigned long pfn)
 
 void notrace save_processor_state(void)
 {
-	WARN_ON(num_online_cpus() != 1);
 }
 
 void notrace restore_processor_state(void)
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
