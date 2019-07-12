Return-Path: <SRS0=eLsP=VJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE31C742A5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2019 02:24:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91EBE21019
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2019 02:24:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FV1Pm1wl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91EBE21019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSYdEXACPFxDO2GvnPgEVRuw3c35ISiRGs0FDyOLT5M=; b=FV1Pm1wlt93tnm
	jCoZy7xIelv73GNkmHep0QIHiQI8lZOli7B1YDNE8Chjr9iIGBkiSGdZGwxs5bZhfq0S7GpN4CJ0E
	GWMlxCf+pcDvHnUPZjKOjiI9fxVxetLYmcpyL0IfHHiU9Xx2yPq83zNqwZWB8lvyTXC6fy8Oqwyf+
	9MaGZObPyIu6cX3taWyJZZW80npma0IVGW/1vt9D60eCjAtGPeL91Wv/5hCb0aWJJbXWTyFCjrFwT
	4VNGM+epTalnzGgmBDaFS4DmutNLKbw16OCe9xzVSeqUcOUiVeiZTsoRx7N/C7ffzWc/gJjWK0mh4
	repnZYmldxuDt0yVa/Pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hllEW-0001Qy-O4; Fri, 12 Jul 2019 02:24:24 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hllAq-0007Re-6N; Fri, 12 Jul 2019 02:20:39 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R991e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=alex.shi@linux.alibaba.com; NM=1;
 PH=DS; RN=20; SR=0; TI=SMTPD_---0TWfK5gC_1562898032; 
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com
 fp:SMTPD_---0TWfK5gC_1562898032) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 12 Jul 2019 10:20:32 +0800
From: Alex Shi <alex.shi@linux.alibaba.com>
To: linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 06/12] Documentation/mips: repointer docs to
 Documentation/arch/
Date: Fri, 12 Jul 2019 10:20:12 +0800
Message-Id: <20190712022018.27989-6-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
References: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190711_192036_430806_44CF715E 
X-CRM114-Status: UNSURE (   7.07  )
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
Cc: linux-s390@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, kvm@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-riscv@lists.infradead.org, Alex Shi <alex.shi@linux.alibaba.com>,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Since we move Documentation/mips docs to Documentation/arch/mips
dir, redirect the doc pointer to them.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: linux-kernel@vger.kernel.org
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2c1e65c236db..03a8c687f87f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10554,7 +10554,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
 Q:	http://patchwork.linux-mips.org/project/linux-mips/list/
 S:	Supported
 F:	Documentation/devicetree/bindings/mips/
-F:	Documentation/mips/
+F:	Documentation/arch/mips/
 F:	arch/mips/
 F:	drivers/platform/mips/
 
-- 
2.19.1.856.g8858448bb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
