Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95654CA0EF2
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 15:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=//VHmCfr8cz1B7VVaJJWiQLbysUcEywrYvX6O6kPT94=; b=rpbJ2VganICMsy
	RJNtiFEP/IpRWceWalXiEYbPZfO7xEmqMLPW/HAdYvXcZV4y/lVqIX+aeospUjUiilVFc2zVONMB/
	Znym0bsS1eZL9lfwl6MnZD2JV3w00XzZE1RNfw0bJFwwPleZAV/Fl+ObuJfUabAeIFBSokXyP+jnM
	PU4bGWC9OYJGM1rVaYJIes5vuTtlbbSsXUT30U42qfKfftZfLfr7C6aOXlS+u3JBIU67sWSWBGn9w
	uOTYiPVz8v+syGqAIX7fiBYO/dxT+Dx6mjbsSxumhDA72cp0wd3qDYYe/beXKUIjYDiP14Z/OrS6G
	49pbrRgFyQ3bkiKN8HkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg5h5-003ktz-0R;
	Tue, 12 Sep 2023 15:52:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg5h1-003ktE-2g
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 15:52:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E20366137B;
	Tue, 12 Sep 2023 15:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EECC433B7;
	Tue, 12 Sep 2023 15:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694533964;
	bh=fqPeDI8Tt7B0BD4Ll8OcOc/JgS0VBc5dnAfvkG4MkHA=;
	h=From:To:Cc:Subject:Date:From;
	b=aLrIal6ZBzeZEM9eVXol0jhbD+o/w6bFN9FN/ICV1ES4EnPJ7tD5Y9I/X5WIuaWfR
	 0lopRtj467/JrGLuvj+KBwqHmb8epOKqfprax0FE6uhUn9nOWcvi6jngib9p3Ucr/n
	 VVfZojXeLLwiRyD+5d7fjpLxmYfP/KAMjpMa/8xmrj4cR0b4tH05SMW4d+KUe0mpqL
	 lh10N/RyoNZuGnVGvIvyAVaLdSz/fec+agf5+7sADsdNnrKAmnL2RhsEpmLkcNlkTc
	 y+20tJdpBECCdaVHPzUVGCxOxn6SkrL1Lcf8kZLrG6dABf4wUyePl2ePQeSuv0Qwbt
	 /w52sn23BGfLg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: don't probe unaligned access speed if already done
Date: Tue, 12 Sep 2023 23:40:40 +0800
Message-Id: <20230912154040.3306-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_085247_906906_B9A82769 
X-CRM114-Status: GOOD (  10.13  )
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

If misaligned_access_speed percpu var isn't so called "HWPROBE
MISALIGNED UNKNOWN", it means the probe has happened(this is possible
for example, hotplug off then hotplug on one cpu), and the percpu var
has been set, don't probe again in this case.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/cpufeature.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1cfbba65d11a..e12cd22755c7 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -568,6 +568,10 @@ void check_unaligned_access(int cpu)
 	void *src;
 	long speed = RISCV_HWPROBE_MISALIGNED_SLOW;
 
+	/* We are already set since the last check */
+	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_UNKNOWN)
+		return;
+
 	page = alloc_pages(GFP_NOWAIT, get_order(MISALIGNED_BUFFER_SIZE));
 	if (!page) {
 		pr_warn("Can't alloc pages to measure memcpy performance");
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
