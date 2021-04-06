Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61ABC433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 08:21:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 408BE6117A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 08:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 408BE6117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eSGwLxmMiPefNHAS9uv5wlFmheIqXEXYoP/dUKk/w00=; b=Yn6B+wZOTy2pM63i9k9+77LQPP
	NGDhq9iMeT8dLlH3n2WFGZQEpWKD0HMANb/tlfqlTYzkthbZ9/qsEEHOFGzJoDSuEMKxiB8sn7Y7H
	31TAQ2lF+7K7Zx4ZG+O0a+fE8J9PGY32UAI6xVhBFtR3+jkG084S6nhf5NbeBPDFelW+j+K8xBHnL
	O85Uaw9dHVKi1I94AJGf26P9O9SUtC8q3T+vqeUITgzhqsl+hKfy2BTA+BHqd0+WQaO7MqLksF0Mv
	fypj8O4x5TF5zpHoA191d7aoDD4/BumgMExu8CsgvUiflTGEjQHkrPpEfdNja5IPmjeLq0FLpUFUi
	JPHAkNPA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTgxL-001qpD-07; Tue, 06 Apr 2021 08:21:03 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTgxI-001qoA-0k
 for linux-riscv@lists.infradead.org; Tue, 06 Apr 2021 08:21:01 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FF0m30HJQzwRN0;
 Tue,  6 Apr 2021 16:18:43 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.179.202) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Tue, 6 Apr 2021 16:20:43 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Damien Le Moal <damien.lemoal@wdc.com>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, linux-gpio <linux-gpio@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v2 0/1] bus: bt1-apb: Remove duplicated header file inclusion
Date: Tue, 6 Apr 2021 16:20:33 +0800
Message-ID: <20210406082034.2371-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_092100_351006_011CA690 
X-CRM114-Status: UNSURE (   4.42  )
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
  bus: bt1-apb: Remove duplicated header file inclusion

 drivers/bus/bt1-apb.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

-- 
1.8.3



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
