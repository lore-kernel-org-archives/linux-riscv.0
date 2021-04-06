Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F2DC433ED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 09:15:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA4D46136A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 09:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA4D46136A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L4F1ztatNCxzLmV+i0OI+odVNpDZ9EeRcoWSFk+ALqI=; b=JbCknMu4uVJytScWUB+43G4UQM
	ev5acLsPpYthIfRY08Jy5EM+jhwjK4N5rDihW1SVpeHvtrc1juj+USMGH/uCItoLC6G2IK0arFney
	Sex7i0fBuQLGYF+GU3/3BDdmm/jddr0sVZ75te6TzzFadRvECOPXgI9F0fn6nb70em7WSwHl6YLoL
	8MASM/kW5OyZMnxZBvbP8kTTreIZDoRvDZ59JXOV/ypVhpBlcWXH1AGcLX7doG6y3gJl/ljfB3SDq
	2jlB0HBMKj2Blw0VjiAyS/t28rEqHtpVreQjdtZ8ZuOG9g7v5EhNiY/QTtU8/HpwM+6MgHz1XbWn9
	a5w986Vw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lThnt-001yNT-AE; Tue, 06 Apr 2021 09:15:21 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lThnl-001yMD-RD
 for linux-riscv@lists.infradead.org; Tue, 06 Apr 2021 09:15:16 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FF1yg442jz1BFt0;
 Tue,  6 Apr 2021 17:12:59 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.179.202) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Tue, 6 Apr 2021 17:14:58 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Damien Le Moal <damien.lemoal@wdc.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 linux-gpio <linux-gpio@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v2 0/1] pinctrl: Remove duplicated header file inclusion
Date: Tue, 6 Apr 2021 17:14:51 +0800
Message-ID: <20210406091452.2530-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_101514_179820_8C167507 
X-CRM114-Status: UNSURE (   4.39  )
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

v1 --> v2:
Arrange all included header files in alphabetical order.


Zhen Lei (1):
  pinctrl: Remove duplicated header file inclusion

 drivers/pinctrl/pinctrl-k210.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

-- 
1.8.3



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
