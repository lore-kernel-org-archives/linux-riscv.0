Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB29C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 16:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CM9s3/iYlJ9Gq19/8jAdBNcvIR4aSeROkOIbeRGVW+E=; b=Whh0py6tgAbB5Z
	qyFDYkYdpQnX9fypk4Gcjj9zmFkOYhHL+fYdTSJYJ54YyAnpEyzdNm/sQksI9uAkITCJ6iin6wTOS
	RiYpcQVRHWzwR9ZYtrjE4lO8jE3ClWP54IXj8IQ7NZhGhqoQBQaOW6TKT63v67rb5+mDpv7TQsMbb
	In3zfF6E2RoQVxcowr1yKjAuA7DkybkCogyLAnlCtmq0BrLR5lYGo/IoUMvwk64z2J9ffLl42Kgdb
	KITWdExQpW0Eix6twRdK6yDfA9otXkcHgy/uTT6uRoz9XILzNtCjX9mkZ9xsNnYhox5F1guv+5YxE
	c+OcN6gVi0LiArnmlC0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rz6-001vH5-MA; Mon, 27 Jun 2022 16:53:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rx9-001u40-PC; Mon, 27 Jun 2022 16:51:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB0BD1758;
	Mon, 27 Jun 2022 09:51:11 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D85803F792;
	Mon, 27 Jun 2022 09:51:09 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Atish Patra <atishp@atishpatra.org>,
	Atish Patra <atishp@rivosinc.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>,
	Rob Herring <robh+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 07/19] cacheinfo: Use cache identifiers to check if the caches are shared if available
Date: Mon, 27 Jun 2022 17:50:35 +0100
Message-Id: <20220627165047.336669-8-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627165047.336669-1-sudeep.holla@arm.com>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_095111_923134_0CF359FA 
X-CRM114-Status: GOOD (  11.24  )
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

The cache identifiers is an optional property on most of the platforms.
The presence of one must be indicated by the CACHE_ID valid bit in the
attributes.

We can use the cache identifiers provided by the firmware to check if
any two cpus share the same cache instead of relying on the fw_token
generated and set in the OS.

Link: https://lore.kernel.org/r/20220621192034.3332546-8-sudeep.holla@arm.com
Tested-by: Ionela Voinescu <ionela.voinescu@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/cacheinfo.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 2aa9e8e341b7..167abfa6f37d 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -44,6 +44,10 @@ static inline bool cache_leaves_are_shared(struct cacheinfo *this_leaf,
 	if (!(IS_ENABLED(CONFIG_OF) || IS_ENABLED(CONFIG_ACPI)))
 		return !(this_leaf->level == 1);
 
+	if ((sib_leaf->attributes & CACHE_ID) &&
+	    (this_leaf->attributes & CACHE_ID))
+		return sib_leaf->id == this_leaf->id;
+
 	return sib_leaf->fw_token == this_leaf->fw_token;
 }
 
@@ -56,7 +60,8 @@ bool last_level_cache_is_valid(unsigned int cpu)
 
 	llc = per_cpu_cacheinfo_idx(cpu, cache_leaves(cpu) - 1);
 
-	return !!llc->fw_token;
+	return (llc->attributes & CACHE_ID) || !!llc->fw_token;
+
 }
 
 bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y)
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
