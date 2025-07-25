Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDF1C83F26
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 02:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=lDgHXjD62AatH9PondzKl+khrCNSRdkqE/9Gl4eywxs=; b=kvM
	KTW92XIZkM0VoSrLiHOjfVuEUv1IyGB1fsqwjoMkmfh88cUfOPhDUr95gSt4e/5tXOCPDf2/z4ona
	TVoImIhpfk7d32pjkr6j72b8eT/aSt1UuyQgzbs/xS7PeGBhhf5X40mBE5wR2FALVbdjHl++ENPLW
	iODiYOXOXe7Rlm+kUOtWeRorWZDnKgW9vUi5bgyb8Ng2lDXkhO8GDvrgHWpVbqQitjiyvT8Ay4pvq
	/5NdAONeGT1cu9uFONAZoOWSW+zAAMT18ODTJraON8+FAOvFRmIo1BCzSfP1DkVqBH/nivVu64a62
	Z7h/K4LLC0vUC00mR3NVBgMSUp8Vvhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf8QW-00000008vAQ-1XXx;
	Fri, 25 Jul 2025 02:44:52 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf8QT-00000008v9x-2aC1
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 02:44:51 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bpBzT2rZZz8Xs6y;
	Fri, 25 Jul 2025 10:44:37 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 56P2iOXW045879;
	Fri, 25 Jul 2025 10:44:24 +0800 (+08)
	(envelope-from liu.xuemei1@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 25 Jul 2025 10:44:25 +0800 (CST)
Date: Fri, 25 Jul 2025 10:44:25 +0800 (CST)
X-Zmail-TransId: 2afa6882ef89ffffffff99d-eb6b4
X-Mailer: Zmail v1.0
Message-ID: <20250725104425229ArF_W-F7CmscLJKs0yoiQ@zte.com.cn>
Mime-Version: 1.0
From: <liu.xuemei1@zte.com.cn>
To: <paul.walmsley@sifive.com>
Cc: <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <spersvold@gmail.com>, <sudeep.holla@arm.com>, <mikisabate@gmail.com>,
        <robh@kernel.org>, <liu.xuemei1@zte.com.cn>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?wqBbUEFUQ0hdIHJpc2N2OiBjYWNoZWluZm86IGluaXQgY2FjaGUgbGV2ZWxzIHZpYSBmZXRjaF9jYWNoZV9pbmZvIHdoZW4KCiBTTVAgZGlzYWJsZWQ=?=
X-MAIL: mse-fl1.zte.com.cn 56P2iOXW045879
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: liu.xuemei1@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Fri, 25 Jul 2025 10:44:37 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6882EF95.000/4bpBzT2rZZz8Xs6y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_194449_811687_CFE5F548 
X-CRM114-Status: UNSURE (   8.81  )
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

From: Jessica Liu <liu.xuemei1@zte.com.cn>

As described in commit 1845d381f280 ("riscv: cacheinfo: Add back
init_cache_level() function"), when CONFIG_SMP is undefined, the cache
hierarchy detection needs to be performed through the init_cache_level(),
whereas when CONFIG_SMP is defined, this detection is handled during the
init_cpu_topology() process.

Furthermore, while commit 66381d36771e ("RISC-V: Select ACPI PPTT drivers")
enables cache information retrieval through the ACPI PPTT table, the
init_of_cache_level() called within init_cache_level() cannot support cache
hierarchy detection through ACPI PPTT. Therefore, when CONFIG_SMP is
undefined, we directly invoke the fetch_cache_info function to initialize
the cache levels.

Signed-off-by: Jessica Liu <liu.xuemei1@zte.com.cn>
---
 arch/riscv/kernel/cacheinfo.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 26b085dbdd07..f81ca963d177 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -73,7 +73,11 @@ static void ci_leaf_init(struct cacheinfo *this_leaf,

 int init_cache_level(unsigned int cpu)
 {
-	return init_of_cache_level(cpu);
+#ifdef CONFIG_SMP
+	return 0;
+#endif
+
+	return fetch_cache_info(cpu);
 }

 int populate_cache_leaves(unsigned int cpu)
-- 
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
