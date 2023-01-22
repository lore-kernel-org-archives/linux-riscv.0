Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C96C38142
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jan 2023 19:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b79zHw3KJP2vMTgtgvhqKBxII8aMgS5dB6hCaw0H8lY=; b=xynbiAcqc22Yth
	XVPkRRUCJHLL5mMNYrsB9ufT0UeW3LUSLjBcdELAhL8Ab7EvWA8tiDhIHEzV//0YFvhxmACtqodh5
	SPo3+/c4X/kmmYZJGeDHA+RAhr4KoD88rqRtpv9vc9XpkRdzFUg2gogHwk2JJOuQUvfF/aEbSNiFg
	cweEsvQAiXWO4c/B0bQogv3eLbMoSAPzvxCI3i3ZL9Ie/Y/N7iRY1DJ6l96QpYeHO4C6a2kLFcvGh
	1EhkqslKyt67jKQNC85hKL9CyrixN9W3T266n/0H4kYKUBr/hVQELYPbHBLZbnwRiOsJFY4JsVQr7
	VSM0sgG1+RiMOo6nUHaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJfmd-00FiES-NX; Sun, 22 Jan 2023 19:13:39 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJfmX-00FiA2-T7
	for linux-riscv@lists.infradead.org; Sun, 22 Jan 2023 19:13:36 +0000
Received: by mail-ej1-x632.google.com with SMTP id tz11so25688496ejc.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jan 2023 11:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZMbhrj5QedYa/OIGPwnrsgmzUqSFJr5LjaeOKHEbdM=;
        b=f65VAkAnhbzl+wHiPMkwCFiC0OVWU3hHD6bslAOuXjelo+Ih/U8qSWo0+uvCYb7Efk
         fM43L6Yae/GVNitP1Dorp5fnsTKzp741SKWnqebRcRe12oPx2MMCtjBWIdw8M5WJP7xQ
         PgDR1SQW3T/iPlBdhXZQ/NpGMbF4Xafl3BiVJ1MrYATOO00hqB1L2P7GefxbWwF7n5C/
         ir5rIK//Zco9jXpbjWuusfjDcFi/A46MFQUO8KsrWNfUD/OMa7Ec5MXGyEUY53ExzW15
         BbGv0Unr5ouexYCSAuZ67uHmyFdqAwk3JjzSggYqAA0vCcJmUBnNBVwJxRPl9Lsggpn8
         IISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZMbhrj5QedYa/OIGPwnrsgmzUqSFJr5LjaeOKHEbdM=;
        b=T7XSnXMHbkoUkw6y6G98lXQOkp9BPv4+BqUOZfShP41FIyS4f/dSp/c7UnXRBAHWjV
         K8Q9hUzA/I+j9DoHUHnSxh4+1Q6/riIdao88cDjLaZrHUeNOmYkyYp0XkwnbJPwGkVxV
         684gB4/WPvpZgBrLx12TYEkS6pwD+qiSY23Dj1o7ZoKpN9sV+tP7L2D5CFnDk/YYmo1W
         nDRIVRtTHBuUqVqzDX3cg10AA5t6iRgEtYtUPa1m3l2wpV68A9v8WS7X/+cu7OuOt/HU
         M2+KF0dYrk1N/Czh99aZ+BuNg7bQLzQyEBdQUzoKG26xQn4nPReoYoGy4dUK6mT6XfTn
         p7Bg==
X-Gm-Message-State: AFqh2kpZJF5ayEiaVU68t7vtBX6rH4S6aSwcE5sAH0pcYnWKzUkEn7t8
	MJNjO+2mEnd+MWVj9YO/cKz9rXDVn53sdbrD
X-Google-Smtp-Source: AMrXdXv1Owxjl2ncVIugXe8RCNTH12umLFlzqyX/3GdAo7Ca48iqmvX8/kxXOhqgRjSWiQ4n7IRXHw==
X-Received: by 2002:a17:907:6a98:b0:855:2c8e:ad52 with SMTP id ri24-20020a1709076a9800b008552c8ead52mr14732373ejc.29.1674414811415;
        Sun, 22 Jan 2023 11:13:31 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id s12-20020a1709060c0c00b0086621d9d9b0sm14415580ejf.81.2023.01.22.11.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 11:13:31 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: 'Atish Patra ' <atishp@rivosinc.com>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Anup Patel ' <apatel@ventanamicro.com>
Subject: [PATCH v2 1/6] RISC-V: Factor out body of riscv_init_cbom_blocksize loop
Date: Sun, 22 Jan 2023 20:13:23 +0100
Message-Id: <20230122191328.1193885-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230122191328.1193885-1-ajones@ventanamicro.com>
References: <20230122191328.1193885-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_111333_966812_6E7E6C96 
X-CRM114-Status: GOOD (  10.32  )
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

Refactor riscv_init_cbom_blocksize() to prepare for it to be used
for both cbom block size and cboz block size.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/mm/cacheflush.c | 45 +++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 3cc07ed45aeb..eaf23fc14966 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -98,34 +98,39 @@ void flush_icache_pte(pte_t pte)
 unsigned int riscv_cbom_block_size;
 EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
 
+static void cbo_get_block_size(struct device_node *node,
+			       const char *name, u32 *block_size,
+			       unsigned long *first_hartid)
+{
+	unsigned long hartid;
+	u32 val;
+
+	if (riscv_of_processor_hartid(node, &hartid))
+		return;
+
+	if (of_property_read_u32(node, name, &val))
+		return;
+
+	if (!*block_size) {
+		*block_size = val;
+		*first_hartid = hartid;
+	} else if (*block_size != val) {
+		pr_warn("%s mismatched between harts %lu and %lu\n",
+			name, *first_hartid, hartid);
+	}
+}
+
 void riscv_init_cbom_blocksize(void)
 {
 	struct device_node *node;
 	unsigned long cbom_hartid;
-	u32 val, probed_block_size;
-	int ret;
+	u32 probed_block_size;
 
 	probed_block_size = 0;
 	for_each_of_cpu_node(node) {
-		unsigned long hartid;
-
-		ret = riscv_of_processor_hartid(node, &hartid);
-		if (ret)
-			continue;
-
 		/* set block-size for cbom extension if available */
-		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
-		if (ret)
-			continue;
-
-		if (!probed_block_size) {
-			probed_block_size = val;
-			cbom_hartid = hartid;
-		} else {
-			if (probed_block_size != val)
-				pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
-					cbom_hartid, hartid);
-		}
+		cbo_get_block_size(node, "riscv,cbom-block-size",
+				   &probed_block_size, &cbom_hartid);
 	}
 
 	if (probed_block_size)
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
