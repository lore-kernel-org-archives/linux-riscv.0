Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5E4C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 17:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0cM4AhSIyhg2MwJA8ITXdE68HIAubSMt+0M4O1jMGEA=; b=kroIZJEhnTB+FO
	kP8dG6iv1CQJ3r4WNuonR4zy5a23UHiMEkeFQhKiKa/mIqWh8mh8lNf4qqTSVN8axFye2bG5j6jDS
	8V4aMJr+A/mmMz3T5W1RbTLl1TfgNLLQc5xBZqvKHIMGlRCABMThW1YtkUdrsl30bjnsaPhy8m4YB
	JiC06h3MVTu3z6v/7Hu8wuqS6A1DwfOnrBSu99VeKSR522cruq+++3+DDcnQYn7N9ak006ezN+jpW
	D9r6S0RkBNJU0APa4RNA96wdnU10y0NTpGlUeN7MpJ1JMA18wg1+0S2BF/hYGg3dmuNaKYKXNXTdG
	S36XJ89dQ/o7/aRHn1LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxAQV-00GEEc-B5; Mon, 21 Nov 2022 17:17:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxALv-00GCDT-88; Mon, 21 Nov 2022 17:13:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E29712FC;
	Mon, 21 Nov 2022 09:13:08 -0800 (PST)
Received: from pierre123.arm.com (unknown [10.57.7.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EAB603F587;
	Mon, 21 Nov 2022 09:12:56 -0800 (PST)
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Ionela.Voinescu@arm.com,
	Rob.Herring@arm.com,
	Pierre Gondois <pierre.gondois@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Gavin Shan <gshan@redhat.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2 2/5] cacheinfo: Return error code in init_of_cache_level()
Date: Mon, 21 Nov 2022 18:12:10 +0100
Message-Id: <20221121171217.3581004-3-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221121171217.3581004-1-pierre.gondois@arm.com>
References: <20221121171217.3581004-1-pierre.gondois@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_091303_419947_8D1D34EC 
X-CRM114-Status: UNSURE (   9.62  )
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

Make init_of_cache_level() return an error code when the cache
information parsing fails to help detecting missing information.

init_of_cache_level() is only called for riscv. Returning an error
code instead of 0 will prevent detect_cache_attributes() to allocate
memory if an incomplete DT is parsed.

Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/cacheinfo.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index a4308b48dd3e..6f6cd120c4f1 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -246,11 +246,11 @@ int init_of_cache_level(unsigned int cpu)
 		of_node_put(prev);
 		prev = np;
 		if (!of_device_is_compatible(np, "cache"))
-			break;
+			goto err_out;
 		if (of_property_read_u32(np, "cache-level", &level))
-			break;
+			goto err_out;
 		if (level <= levels)
-			break;
+			goto err_out;
 		if (of_property_read_bool(np, "cache-size"))
 			++leaves;
 		if (of_property_read_bool(np, "i-cache-size"))
@@ -265,6 +265,10 @@ int init_of_cache_level(unsigned int cpu)
 	this_cpu_ci->num_leaves = leaves;
 
 	return 0;
+
+err_out:
+	of_node_put(np);
+	return -EINVAL;
 }
 
 #else
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
