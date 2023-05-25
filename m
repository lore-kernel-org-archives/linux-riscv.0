Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D54FC7EE2E
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 02:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjelpG7mleZucN8sWaCfMwl3nUCPbUsEje159kScQV4=; b=vAMmvTkt250627
	r6lFyMSN7SOyIrIsS1s7HvJidzdsixUwK4G+Y3mIVrujZHD1NvlvG01oMRUySA89+50s/0bYiTdY/
	NS6k62Rwz0oAbp6yoEmoDNy7m5d9Jcr5ZQAhxjqODRi01bRsJHkzyucciQYubrYlnOXlCZ6GhxyY7
	JGeSZXik7A0IktG4vQ35//V/C0KVZRhura/RJMe7eUd2H/gERlgixFB82am+Xbfw6nvRWdRPHpSzC
	/bs21LWW1ITznIhFq9dMYaWoh3ytCgOsb69lm1w3QCwFU73UUcxsvzAqxBvmVUbxaSN2177IN2f0D
	J1w5ot74foDsX949r1/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q21Au-00FJZm-3D;
	Thu, 25 May 2023 02:58:00 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q21An-00FJVK-02
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 02:57:55 +0000
X-QQ-mid: bizesmtp63t1684983436tc4md4by
Received: from localhost.localdomain ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 May 2023 10:57:13 +0800 (CST)
X-QQ-SSF: 01200000000000303000000A0000000
X-QQ-FEAT: jXjag1m6xl5ZXRPvlfx7FOzns583Qa4+KA3B6kg49g6czQo1AbT32d+KPrxfJ
	cmTlBr1DnsRyQbPDfKLGciMk4B+ylpOzsOX9RctduYLeEuAlmq3E4sKqYDVfFaw3cfqE12o
	gVQCC2bD77/rUkQERGv3c8q3Pdpmr/Re0hCdHFBb8aoXMeALLHzg1HGymZHQ4pyy9AiadRT
	GzJtw8hLQcWzaK8WWd4Jrebu8d3OZaVHCQWP3TEYqZ/NpQ/3Ca8xG5DZSdH3vd7cTEGx5tA
	68Lr6WidVIkVvna98ZlnltddOPkyhLIU7kqoI+O+w+yDmu5sv4ksyG2yTbgofNf3x1CuPZs
	wKRROMB8p3ftAGiD+3zDxXtcb7o7DR3omGM25n6AWxR9d/vzsFxxjG13oeWybHUksvhorRL
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13095273285713463459
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
	pcc@google.com,
	wangxiang@cdjrlc.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	jeeheng.sia@starfivetech.com,
	leyfoon.tan@starfivetech.com
Cc: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/4] riscv: hibernate: remove WARN_ON in save_processor_state
Date: Thu, 25 May 2023 10:55:54 +0800
Message-Id: <20230525025555.24104-4-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230525025555.24104-1-songshuaishuai@tinylab.org>
References: <20230525025555.24104-1-songshuaishuai@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_195753_350380_82CB1800 
X-CRM114-Status: UNSURE (   7.18  )
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

So remove the unnecessary checking in save_processor_state.

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
