Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FBFC10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 22:45:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5466521773
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 22:45:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kF2dp49m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="j9sVNtut"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5466521773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3zK+/KQK84jJ6QVXvAtXWaxyotnFtEusEuWHQVpeXgs=; b=kF2dp49maiWZHq
	yWuUTqPTvlJQc/C2ip0AEE0UOawMiEs9lxIuf5PUv2b6xW5G2JC9+yk+LLdB6sZ6SfIgKwClQUXNW
	34M7U/AIWqYkLAw/M3igpcnSnIcjW55yLj8QkywzqhoaqY3bVDFQujO2HrvSfyrNehw6/F/HIlwmi
	Up3YUYe7feKnOs6BTsJpRvzpOBhW1rZ+8Uydznr5AqcnHKPoxDG7gRGrHthltXOjpsGincDi92yyd
	Ht1R8tbHCPZHT63cL2olFO3h9Y3aiUIT4dMhgl4FyWM4jctSmQj0MvvTOwt16JzagFYEHl+D99YuR
	9ErKegtrdScHpaugVZew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hELy2-0003sq-Mk; Wed, 10 Apr 2019 22:45:18 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hELxz-0003nm-6G
 for linux-riscv@lists.infradead.org; Wed, 10 Apr 2019 22:45:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1554936315; x=1586472315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6727VdCc/EPDYJfj5RPHOjXG6b1yki4VRIhepLKeGtA=;
 b=j9sVNtutWqHEoRf42N4iIexIhY665z/BKKggnZm+Htn3RqRABe633m7U
 +kesjR3hGw3/7BwicgL8spLIfRPAqxuzSB6l4g1QgVTPmuNfDGcDxGTTa
 aMCjhhnwjekkVoAMU1QvYQW4ySeJVa5x2LsP3be522HjcESa1TMFp5IW4
 fYb3scGKrB1ZAIeq5Kz09KdUJ1xvqSGPq+oLvQ20nZf1hnehR4S+M3szR
 ner6T3a7Sq6TyrU0VX7eyEPOb9fDh4+FRGJeJzaPhZCWDNaQwPjCt3M7Z
 8BKbBcmwG3gK6kVBP1aQ0NFZnwzDBJuvbZiZBbqFbcAXA0+iPEgGQEmMc A==;
X-IronPort-AV: E=Sophos;i="5.60,335,1549900800"; d="scan'208";a="105470414"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Apr 2019 06:45:12 +0800
IronPort-SDR: rEs1PznXo7X+XTcB/AeGgADG4Eq3G0H4SZ5vgOaaKWPRN3+F2Pxw3zepj0ln97D6YsQc1niw7K
 vjaktCP++LEi2xUAG4PD293hg6iIYjmjMIic7/SGcWZJv+DVavFVVGC5GUqHeJtgyeLY2Ounju
 7e9jO7uFnNscptnKXGOJ964s8QcH+t3hpR7RTEpuTXWPSyGb5EMLaXMfAWbjv/IgvkQNCOI9r9
 cZYlTpvaqMzdHB4OwafV2bU4Y+d5gfHxsR3zVvtWCsaSRwuIEBjPudDopvowM8sIIW/LlVMf14
 noZ8WuS8weJrySpEck00IeZj
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 10 Apr 2019 15:24:14 -0700
IronPort-SDR: NXkg6ju7d4Lh0ulI2k5QJZZENFD98F/fotupJh0yskicrEHcAp7YRd9wiDnh/fw6OikcXYXkfg
 q+f8VoRlWmlLKJP0MfVLgB/+sjvP7k1boRWhHHyfXITa7MqmkOg23r/TolK8Cs3j3n6Hlv7k3F
 HVWJT7FqVhKCtpvV9oLxAiKoFIOvzrWotOeT8bkl71aLrcmCs73xEw1z3cWgX2NOBoJeg+IQRS
 3iEvqR83I9WJiZ1ZlhJDic+lfrExjNRVg0M2bDUH6jrPDhyba+Hc+KGrYeGx8jcWmjqq7HAg00
 e+c=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Apr 2019 15:45:11 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [3/3] RISC-V: Add DEBUG_TLBFLUSH option.
Date: Wed, 10 Apr 2019 15:44:49 -0700
Message-Id: <20190410224449.10877-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190410224449.10877-1-atish.patra@wdc.com>
References: <20190410224449.10877-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_154515_279774_2621CECA 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Gary Guo <gary@garyguo.net>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The TLB flush counters under vmstat seems to be very helpful while
debugging TLB flush performance in RISC-V.

Add the Kconfig option only for debug kernels.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/Kconfig.debug | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/Kconfig.debug b/arch/riscv/Kconfig.debug
index e69de29bb2d1..6a2d3762aeda 100644
--- a/arch/riscv/Kconfig.debug
+++ b/arch/riscv/Kconfig.debug
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config DEBUG_TLBFLUSH
+	bool "Save tlb flush statstics to vmstat"
+	depends on DEBUG_KERNEL
+	help
+
+	Add TLB flush statstics to vmstat. It is really helpful understand tlbflush
+	performance and behavior. It should be enabled only for debugging purpose.
+
+	If in doubt, say "N".
+
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
