Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB625C4708D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 18:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ddQ3zONyIOB0Ngc7ZZZOVydFtnaHhIsJSPLdsIzRmVg=; b=AHYovjDLEdynjt
	U9cvqtbFgRzHr03aW6f21oo4ENHyCg9VUPXN5CqZvjLlRQiANz0C2sGg61u8PZbo5VnGYAcreSL8g
	jhN7JUejT2i/UGMrbyms/fV6nF1gqqoB92pu900Mk7gp8YwcML1shNFZBNhPQC4oAp5ysZHMQahnh
	1ZQuGPY2kQVaHWKytmupVltsyXAjf+F72ldesLhEKkfVW/Fs1wuim9Jj74V7uGJ4HjuJ8gYQuF5Uf
	ceyp7OllUhxh2gkGUcPzWrOBUWXTBs/9IFaEeCw8onc6TYwL11EZj8IsdIfaPPoGEVXerNIBsO+7D
	+F6PbfqdIxGszbOLERkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD8YX-00Axd4-5K; Wed, 04 Jan 2023 18:32:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD8Xy-00AxUk-G9; Wed, 04 Jan 2023 18:31:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 215671682;
	Wed,  4 Jan 2023 10:32:11 -0800 (PST)
Received: from pierre123.arm.com (unknown [10.57.44.105])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B7A963F663;
	Wed,  4 Jan 2023 10:31:25 -0800 (PST)
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Pierre Gondois <pierre.gondois@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
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
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v4 2/6] cacheinfo: Return error code in init_of_cache_level()
Date: Wed,  4 Jan 2023 19:30:25 +0100
Message-Id: <20230104183033.755668-3-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104183033.755668-1-pierre.gondois@arm.com>
References: <20230104183033.755668-1-pierre.gondois@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_103136_333424_EC61930B 
X-CRM114-Status: GOOD (  10.47  )
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
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 drivers/base/cacheinfo.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 5ae58e32a77f..3e965ef6ee42 100644
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
