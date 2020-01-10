Return-Path: <SRS0=xAtJ=27=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD53C33CA2
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2020 10:46:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D52220838
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2020 10:46:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F3sqAz3C";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MLzAPeFP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D52220838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=grRObLxQC1dul6+pRDryDJ7iJ01KOBHN6lMhZ8cccKs=; b=F3sqAz3CVAt4+8AJDM38CkaZp
	ZM4eT63X/T3fwmxCvJWYumVQwUpVxKWDLwl4zDeDDJq0k9oGw8xgHDhOfRnO6x/Gcvlr3/Fyz3W6W
	uD5kXvqCcLNJh3fGYWyVOHOWfJRVPWRRvtSWI5Hr0Mvo5tQdmtVx8xe6YBvvCRcwLx37vlocFflKc
	LWNOhi0fZA4tGx8q5r9UEb2pXKaTXSAdk8DS/xUn7dDdu+JBM4cZ0GieVKA3fbvhuic8pAjryGZba
	8c9WYERwJ/LK/et20738whBtI8rBEdXiXdzqR6r5jeMU/6VrkGLuyBmEb86P8883bzWai/ZjkVmQR
	1sJzYQjSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iproS-0007Po-Gm; Fri, 10 Jan 2020 10:46:44 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iproP-0007Ku-4d
 for linux-riscv@lists.infradead.org; Fri, 10 Jan 2020 10:46:42 +0000
Received: by mail-pj1-x1044.google.com with SMTP id m1so826948pjv.4
 for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2020 02:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
 :references; bh=grRObLxQC1dul6+pRDryDJ7iJ01KOBHN6lMhZ8cccKs=;
 b=MLzAPeFP7beVrC6x+pwPY1qQC2rVVqzuSTfjc8+bRTihlVcEg7ZwA3MfAslldQG9Cv
 ZyvVEsJl0cgjboyrzSLRjEvV25cTv82M+8Peu2lfgGfk88pKjVnLLx7b3fMJ+RUflfG5
 /YlKW84oVlryTB3jUcIXJaLF56I3ImJ8pkkIQZRjwpljmVY57b6+IHKaT1POBjTkCzjj
 hGBSSqt8We/IlAzqHbJtNpHnCatzdJayrLuLaLHyPz2ELD5jotdxWY3FvMXsN9rbre9h
 i5sj0ECT3wckyK6vKKOiGc8pdUYszh+TOmRBzg2AUEsojNI9t7flYq81e8yUFChvuoMN
 hSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=grRObLxQC1dul6+pRDryDJ7iJ01KOBHN6lMhZ8cccKs=;
 b=YkPzyREAheRht+Wa5mjurkpASzeB90202Li2LTjXIhEtJn5v3Akk4cOjzCOp8O2XOr
 VI8gkFeBAZYuzsUWb+XCeZ2QP2Yo+rznEDWlT8kSMj77hoxX5/OYsuVd0OvtGU8F9oRD
 mljVm6KbGusnIbJmi8kaLw8r47mdbyRZ3sgTXse3ku9AcZTEKgUiTIq/8XOizXZ3kIdY
 imyD22p4uVRViTRcShk+w3tYiqOGHRRs8nAJmesu+Sq+xxw79yllJAXtiYSXunfpXUpi
 kp98XShlJjzPIvU9PtkFwnEZj/fdsKFPn3WxOc7PnTiNYEM2lGKa032CpwGxGdrEoPIP
 PNfQ==
X-Gm-Message-State: APjAAAVUwEcj3Df7NPTyCB9mPJJP0mhkK4N90kaC31HkDVdjJdDQ6p+o
 3XBQ05NiGgbHn7PbfRdSWI32aQ==
X-Google-Smtp-Source: APXvYqw7cMaRzsdl58xecnTXyAQj6Du4Yfz9N/+tRgW6t5lhCN16jA9FuUWa+krZ2rl01UgmPMmWqw==
X-Received: by 2002:a17:90a:cc02:: with SMTP id
 b2mr3771167pju.137.1578653200591; 
 Fri, 10 Jan 2020 02:46:40 -0800 (PST)
Received: from greentime-VirtualBox.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id e10sm2590901pfj.7.2020.01.10.02.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 02:46:40 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, greentime@kernel.org, anup@brainfault.org,
 palmer@dabbelt.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com, gkulkarni@marvell.com,
 will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com,
 paul.walmsley@sifive.com, hch@lst.de
Subject: [RFC PATCH v2 2/4] riscv: Move unflatten_device_tree() to
 paging_init() because riscv_numa_init() needs the dt information.
Date: Fri, 10 Jan 2020 18:46:25 +0800
Message-Id: <57f7439888a99002285da8114d4a99baa676e865.1577694824.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1577694824.git.greentime.hu@sifive.com>
References: <cover.1577694824.git.greentime.hu@sifive.com>
In-Reply-To: <cover.1577694824.git.greentime.hu@sifive.com>
References: <cover.1577694824.git.greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_024641_178669_1CEB8459 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

It is moved to paging_init() is because that of_numa_init() will use
of_numa_parse_cpu_nodes() and of_numa_parse_memory_nodes(). We have to
unflatten_device_tree() first then we can call riscv_numa_init(), but
riscv_numa_init() shall be called before memblocks_present() because the
node information will be used in memblocks_present().

So the calling order will be looked like this.
unflatten_device_tree(); //To get dt information for memory and nodes
riscv_numa_init(); //It can use of_numa_parse_* and set the nodes information
memblocks_present(); //The node information can be used now

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/kernel/setup.c | 1 -
 arch/riscv/mm/init.c      | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 365ff8420bfe..bcd85f502fb2 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -67,7 +67,6 @@ void __init setup_arch(char **cmdline_p)
 
 	setup_bootmem();
 	paging_init();
-	unflatten_device_tree();
 	clint_init_boot_cpu();
 
 #ifdef CONFIG_SWIOTLB
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 69f6678db7f3..fbe69fe47806 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -491,6 +491,7 @@ static inline void setup_vm_final(void)
 void __init paging_init(void)
 {
 	setup_vm_final();
+	unflatten_device_tree();
 	memblocks_present();
 	sparse_init();
 	setup_zero_page();
-- 
2.17.1


