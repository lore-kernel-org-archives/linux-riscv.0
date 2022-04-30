Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EF6C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Apr 2022 03:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S4VLK7b58ptqdTyd/8dBgDTGJdD+cM1OeY3NZy9LJEQ=; b=TIJFdAEkCXEc/j
	BmDUB/Q5nXQoq1hiP9g08igl71PNYQJlJnzyVUQYZdGc4kaUwfIPurl4bWpTmiCitrlPg8i/P6xT/
	LoIKBkJw0/kLmeeR4Pk4NtImSwOMgwv+YtI2JVE/PudRxvdVQdKUXaVp3Qes95Q6YWRHGYeFpXSQr
	puOTReHRBZJXOl4TTZU4Vdni4AjODrVb+qMOo13tl2An3/3GfEbv64y9+ShS6L1jJc6L+pWYQ4ZvP
	SR9B8y4kalOap2lnDu9A/jUhb4Y9yYyQlmAhM6WQ2awX+sGM8ClG/9OlQ0PeOvtnOUgtMNWpYh0Gt
	76aCbpwCMk0ToQjXfYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkdLY-00DRJ7-T5; Sat, 30 Apr 2022 03:00:36 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkdLV-00DRIe-WF
 for linux-riscv@lists.infradead.org; Sat, 30 Apr 2022 03:00:35 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B7E9A5C01A3;
 Fri, 29 Apr 2022 23:00:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 29 Apr 2022 23:00:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1651287626; x=1651374026; bh=38PyJ9IXOsmeJwIX/t9APweLF
 uKK/8sAQNU4GM49vF4=; b=Vab6SpPtfFDV9UL6GGmFaO1dP+RAzxAKK7BQcLqWR
 Cd7NggAtpIH3XV9las76MrSegnnBQin5qhFbAX6CPFU27NgxeoJRxIz1sLz8T+Nm
 uIyff5DaL3DoNTw1PH05BoB/+ksJi3ugmpmXCfXovvsYChYy891vdjIuXHJzVPPV
 ciwinWbvKRv/2IeF9pW9Xu8n0QyR7pYvMqZsNnZP4wfBDWjMyy2OCeR3o5NvbJqP
 1E1XjPYhFzx3QeC2SAgGtBj6koRL4VR5z4M+e/iWOKQAVUuzrdYog/gb5lLRVo6T
 mfhvOo4m71ffSvP6qitrQZqweMFsKiywnjEXu4ErP6O3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1651287626; x=1651374026; bh=3
 8PyJ9IXOsmeJwIX/t9APweLFuKK/8sAQNU4GM49vF4=; b=LylEPbIgUsBgdDDjB
 J7ECMakOTVFI/31K77vaBo4vMv2tJk0hoMsPOGRQDuL7N2ZB21lJSJ8/U95PP1yS
 uyNZZl8K+uCMN66bcdxrWU84+ZqziuaMCs80juCcnd2TEhD0lAxLnVzx7EMUK83R
 8XAu9UtNBjnItDPsZfu4F3eZHBgjElwjn6hXnByCyribIJKLcgQ8vMMzzpbfGtm7
 H4f9xcBKji+otyE6hoSvxNgWFfqSY9i89xINgVQW9nIdL0730zE7FMTkNlNfvmL4
 L7h7eyrLfUWknRUGdeX7FzRAM2Ms3TYKLn5GFuNr/69GjBzXi8srnfOBaMcBL/Gn
 mM2jg==
X-ME-Sender: <xms:SqZsYq1xNI7Aubz0X1IWM9ScaH_2x0zYJLmXxpsbXcrWYxIaiKE0lg>
 <xme:SqZsYtHw58PbbDoh05VYgAscFBLBbmvMxpGm3yXXeVx65z-iLroQrNjbAlfjwLgKF
 5MRAKFgSkxyA8A5HQ>
X-ME-Received: <xmr:SqZsYi6nKQL0vY757ZmtNkmSYi9t-3eB5Tn25VL48dZuWpek5YeyyonjGeB_z6eOTwfu0oTYg3tAFXCI6yh739yuWWB0THCbuKhPQNS6lJMF8pTX4dENRM8EQvI6Wn5wbnIpBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtgdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
 jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
 htthgvrhhnpeekveelhfejueelleetvdejvdeffeetgeelheeujeffhefgffefkeehhffh
 keekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:SqZsYr3uOp_vQgOKzHLrFW4BRX16kkHhTRwkQug7amFu1LVTpVCGTQ>
 <xmx:SqZsYtE4Ffd_3nrpc7CulqxgYtBFxglBt-F3ntlmBQ1vT3rAgUvO8Q>
 <xmx:SqZsYk-Tp2Qzfw08egIX7fy6ONlN7ErgDCATAuQoPoarwfA5El11mg>
 <xmx:SqZsYmOzMOfNeNRdvlertHi7iy_yroxpe6rJeJ2T94NXoY2HDICLZg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Apr 2022 23:00:25 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Greentime Hu <greentime.hu@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Fix irq_work when SMP is disabled
Date: Fri, 29 Apr 2022 22:00:23 -0500
Message-Id: <20220430030025.58405-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_200034_150130_3B089BAD 
X-CRM114-Status: GOOD (  10.27  )
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

irq_work is triggered via an IPI, but the IPI infrastructure is not
included in uniprocessor kernels. As a result, irq_work never runs.
Fall back to the tick-based irq_work implementation on uniprocessor
configurations.

Fixes: 298447928bb1 ("riscv: Support irq_work via self IPIs")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
This was found while bringing up cpufreq on D1. Switching cpufreq
governors was hanging on irq_work_sync().

 arch/riscv/include/asm/irq_work.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/irq_work.h b/arch/riscv/include/asm/irq_work.h
index d6c277992f76..b53891964ae0 100644
--- a/arch/riscv/include/asm/irq_work.h
+++ b/arch/riscv/include/asm/irq_work.h
@@ -4,7 +4,7 @@
 
 static inline bool arch_irq_work_has_interrupt(void)
 {
-	return true;
+	return IS_ENABLED(CONFIG_SMP);
 }
 extern void arch_irq_work_raise(void);
 #endif /* _ASM_RISCV_IRQ_WORK_H */
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
