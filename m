Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB2D60A6F5F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 07:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sV7hQWTV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aCUK7rBXht8mI/gSPZt2OWTk/TI7+TEkzHhcvET7B8w=; b=sV7hQWTVUQ8XnyPP73pgo8/Red
	fA+XOwTLbCBoFIcgbO1AfQVMrXupOgMoinHSBhn9OIFOeqmElUz74d9RwBP24+WfvXJksKuTPZz9z
	SASSx7KBw786Qqb6Q4h38XPMouYBvXBGeslPg36Iv6reQRhWwSqg0b7asHjpAuqoIF/2n6m4aTxFs
	ujdVmRjaYn0qufUI+mtXWa1nc7wKox82WMVw1+YXCtX7CUYaQweLQypOf6oqEN6LlXCO+/cVJAIvf
	PkGIQfhKh8hH1biDZWsYryLAR2xM4l1jlH9y6S4dKGhVjabmrj2TvKdkES+Gj1w3cFkNy9AysNPVK
	toNnx1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlTQ-0000000Bqg2-1YZV;
	Fri, 13 Nov 2026 07:13:24 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlTL-0000000BqdT-2VPQ
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 07:13:23 +0000
Received: from mail.andestech.com (atcpcs53.andestech.com [10.0.1.153])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CSaM059146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:28 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs53.andestech.com
 (10.0.1.153) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:28 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:28 +0800
From: Mina Hui-Min Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <conor@kernel.org>, <jic23@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <minachou@andestech.com>, <az70021@gmail.com>
Subject: [PATCH v2 06/19] cache: ax45mp_cache: rename ax45mp_cache.c to andes_llcache.c
Date: Fri, 13 Nov 2026 15:11:30 +0800
Message-ID: <20261113071143.1446167-7-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113071143.1446167-1-minachou@andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs53.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AD7CSaM059146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_231320_054044_276A0EEB 
X-CRM114-Status: UNSURE (   6.77  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rename to reflect the generic Andes naming. No functional change.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 drivers/cache/Makefile                            | 2 +-
 drivers/cache/{ax45mp_cache.c => andes_llcache.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/cache/{ax45mp_cache.c => andes_llcache.c} (100%)

diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
index 290aa238b2e2..7c342111ea51 100644
--- a/drivers/cache/Makefile
+++ b/drivers/cache/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_ANDES_LLCACHE)		+= ax45mp_cache.o
+obj-$(CONFIG_ANDES_LLCACHE)		+= andes_llcache.o
 obj-$(CONFIG_SIFIVE_CCACHE)		+= sifive_ccache.o
 obj-$(CONFIG_STARFIVE_STARLINK_CACHE)	+= starfive_starlink_cache.o
 
diff --git a/drivers/cache/ax45mp_cache.c b/drivers/cache/andes_llcache.c
similarity index 100%
rename from drivers/cache/ax45mp_cache.c
rename to drivers/cache/andes_llcache.c
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
