Return-Path: <SRS0=SHZ6=F3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248E9C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 16:33:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4DC0222BB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 16:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4DC0222BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JqU1p5N54FZKh7zh4hDBiVF5/lcosqxAom1ucsy+aks=; b=JsaSn69tlXdNF5P3OeFuNQUyw6
	4+YTb5A5ZGZJSk9QWh3xBZGQvvC+nB7qp8cG8Ev6EY7l6B6M0JmHiHH9XpyonU3pn6HgNNb+hFWeT
	4/S7AX3yzym/r54BYSoH4+KU3ceyIgnyA3wx+8FNdQPMfe72z/jZFVmLeKBDQMpUCox1Bb78K3C0I
	ishFjNPiFPte2pYx4c+/rTEp9Hg7NJaBUKFiObLiem0wfWy7LJ5+4MLxya76v29i3p4creSsVOD6b
	e086svMAa9H0CviQTlZP4aelSTm/B5xrxivN5uCeZKtWdf2gZxHZlojS7CSHfkq7GhK63HAAQ8ir/
	+jAAJmnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks74u-0007Op-AB; Wed, 23 Dec 2020 16:33:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks74r-0007Ni-UI
 for linux-riscv@lists.infradead.org; Wed, 23 Dec 2020 16:33:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1608741209; x=1640277209;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=dYPZGNkeNLwFNM7ZbWk1HhdOD7XnxcZHTcC7mnA/goY=;
 b=rtki0BKNmM46F2S5cSqxFXU7ZWCZmMCiu9D638yuVCwRH1fHNDhVQA7S
 5/c+hI7YFL1tfUHURAMjfcUGdxci16rdc580V2xn+KjAIdi8/VRVnjvzz
 L6+hA8N1AxNc/KQGtnrUO+m2xu6GVXYU2XJrnjlZwIL0WehLWQfArlN19
 QrSAxNgOvTxTbpKrVZ3pIwUglkuoQ7iyWKpsE88GFk3cdBqhn/9J7R5Iw
 tlaefFm43JU7bKEawn6zsNTb9ecCZYfnnYSS7uwg0l+ZJOvl3R0iI97ow
 vHRkI/uIauh25I4A5l3uM77CKvqF36W4bvNqdceCFWHVFSvFdtkqSzAT6 g==;
IronPort-SDR: yiJ1k/dFWF2ugYZs1v2M4r/mbI03gkCvf+kyQoYRDQe9B5ebnoq8xhJ/rYEP3RHJ02Di4iKNEN
 ZD9GlDS7CS9nr7xP13uvMntA19eAUgakpnGpZNIrfV8aybOrJrp561sFLUziIxM1/8sbnb5dQx
 yezdo3nHRQ1dcaWRwt/ivWxYWBcvLhNLGR6eL7WtExBvG2ZomQpPwkrOSD9U7WDlMNubGKPEwl
 ArNxa1Zn73ZDjTfzmV1EaJwJruzgj4tZ16ARYZBzORyc5UbMEqEQRogstTmd1YqNWWYRjhtpIX
 CB8=
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="103833490"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Dec 2020 09:33:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 23 Dec 2020 09:33:28 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Wed, 23 Dec 2020 09:33:25 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v3 5/5] MAINTAINERS: add maintainers for polarfire soc mailbox
 driver
Date: Wed, 23 Dec 2020 16:33:25 +0000
Message-ID: <20201223163325.29270-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_113330_175951_7D1E8912 
X-CRM114-Status: UNSURE (   9.06  )
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
Cc: cyril.jean@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, anup.patel@wdc.com, j.neuschaefer@gmx.net,
 atish.patra@wdc.com, Conor Dooley <conor.dooley@microchip.com>,
 lewis.hanly@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Add the mailbox driver to the existing MAINTAINERS entry for the polarfire soc

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5da634ea3adb..1e9b08ae1266 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15016,6 +15016,7 @@ M:     Lewis Hanly <lewis.hanly@microchip.com>
 M:     Cyril Jean <cyril.jean@microchip.com>
 L:     linux-riscv@lists.infradead.org
 S:     Supported
+F:	drivers/mailbox/mailbox-mpfs.c
 F:     drivers/soc/microchip/
 F:     include/soc/microchip/mpfs.h
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
