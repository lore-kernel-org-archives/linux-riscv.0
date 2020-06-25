Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B6AC433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 09:51:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD90021556
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 09:51:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0YzSAFyR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="HzTLooZi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD90021556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZxTccCf+VScykIt3vnwp4Af0iDmbnSY8fPjXHtGFmcQ=; b=0YzSAFyRfJLBZet321BzCbIhk
	wFIsWv0XkmgRDoFb0BKZUzQHmosAfjFYifXgiAXn18gOmY6E3j6kZMV+XMJHadxFU1Wi8DYTDl4Y0
	4Kj32EodNpAlxioXzrwI5k1gpu41fyy5BbnUE9f0I3xs2ZIJfA1wIF1npqW5T4QNKpZ+nZ8Boxv9L
	cYjSHHCU3w9kCloM/g7iCRxAWsbCOT4bOHD1dtSh9CxJLDvDk++oDElGxn4pYpWzpkGD9/dHnAuWY
	DzD/W4MMgdo0skji8ehQ9YDFr5InuXBnaRafmg6I/PvwW9RjteQ3Nbpc9F/cC843sLzMw+Xi3iKEr
	l13Xb8rdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jol0d-0002ug-KL; Fri, 26 Jun 2020 09:50:59 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jojoT-0002Se-8Y; Fri, 26 Jun 2020 08:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593160470; x=1624696470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aWD4YBmJs4KzatxYQf8rnaaoWvjExyC78q596yR2/no=;
 b=HzTLooZitFsTrdzdW2aAWFGw5xMfP0mrAQNpV2SdYQ1nCCg7gYuJbSWb
 +4i6a3CGfMzf7Q/fNGN3kBCiJfdv/tsZXP+74dy+z4GOX7r2JEmwOVwMR
 MkyuVr7MrtBnRS7maBHrEkKAOeW/vhgbbfsCb12OXDQrUl4YtuASGdqGt
 ryiYysbeIHl5ukpxvajXWEQrW5AXzJbYSgCeqYuB2BSPbLSam/dZnlzNE
 3u3Vd3Ty+QUMnrdkjhwWbu1XB4MDEFpMlboEunc72lRLbpK1WVrh11hey
 fEn3noxMre8nvoGIwhRA2oj26okqv8pMaXtskWvVisx+xYn0b/5lPdkbt Q==;
IronPort-SDR: bJsD+CzqMESINk3b4x1j5OPYNP8JjwzdPwmVCd2BObJhad/GwF1QDTWcUIIPDf4/+HOg8G9oVl
 5uyXDAh6x57X8pJWatTFklxONQzuFWguVI5ZTey03wenQaZvR4tHflLvRjEQcY/JdHhR29VAm/
 KwqN9KMDHSH4WWrO08qMCr3D45spV/4P77hGLnJXQDhIH4Ghv9+gycU+QfbKyukFpS8tMzXPOe
 9uUDlxOAM6W01bjhbV92STKnAqJMk/ONMyzIdlXkiW6ASaBICt9bslaUV7C/rlmlHhgSPV806e
 +fU=
X-IronPort-AV: E=Sophos;i="5.75,280,1589212800"; d="scan'208";a="243966127"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jun 2020 07:46:01 +0800
IronPort-SDR: AlMM0FgY2Zd7NKokD8xe6mDr194+ZDAjGHjvJShWgLGSDnDt3bXIKfoqlLADQRFUiw0+emu/F1
 TMz6IuF5o260oJTeDI4fhu+V5wyuOKh78=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 16:34:28 -0700
IronPort-SDR: qzucKY1oxxKLbrAVAstjJ6LHkYhYSEJngCI+ItcjpIHTI3dmgOGrYo+V24ODpy0uGkhcgytR3B
 fUSIjAQFVOTQ==
WDCIronportException: Internal
Received: from 2349pbt5e4f.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.78])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Jun 2020 16:45:28 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 10/11] efi: Rename arm-init to efi-init common for all arch
Date: Thu, 25 Jun 2020 16:45:15 -0700
Message-Id: <20200625234516.31406-11-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200625234516.31406-1-atish.patra@wdc.com>
References: <20200625234516.31406-1-atish.patra@wdc.com>
MIME-Version: 1.0
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
Cc: linux-efi@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

arm-init is responsible for setting up efi runtime and doesn't actually
do any ARM specific stuff. RISC-V can use the same source code as it is.

Rename it to efi-init so that RISC-V can use it.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 drivers/firmware/efi/{arm-init.c => efi-init.c} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename drivers/firmware/efi/{arm-init.c => efi-init.c} (100%)

diff --git a/drivers/firmware/efi/arm-init.c b/drivers/firmware/efi/efi-init.c
similarity index 100%
rename from drivers/firmware/efi/arm-init.c
rename to drivers/firmware/efi/efi-init.c
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
