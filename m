Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1796BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 14:57:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4C15610F8
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 14:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4C15610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7hGHkyMnrX1zW7GHOkZn5fM2vZv3b3DPDX8G+8OC5E=; b=NGAMh8EleezSnp
	7gnPSSF+OfoFXIaVsH8dPguUmRf+/oV3evW4VqberxZoDZ79ORKhZHQgMOb3KSmqtNTj1gEXlFIi6
	g/R+ifqNiLNJZoamjTdYq2HBs8lkkHOMNfeQKDBi2Y7xrSA52jrqAWVrjssVaTSGYs0QBcFWBqSIs
	kE//lRUyws3/E18rdbnBtlLj1ju+FJxSRwG2z0ko8AgkJychoIbdbEn++g7VXzif/0EHkCMR/s2YR
	VFKzFAyxplsvK+azC/ywa/7sTDn0YVcMZ4ODqXrd7Bru0VPHZAyxOViY7wwWiogIhEMQ3B0Jqxv0U
	Oj6WY3jlVsT1q4zNGa4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg6qk-008JZ8-B1; Thu, 28 Oct 2021 14:57:50 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg6qG-008J9t-7Y
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 14:57:22 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Hg7sT2FS0z8ttS;
 Thu, 28 Oct 2021 22:55:41 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 28 Oct 2021 22:57:04 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Thu, 28 Oct 2021 22:57:03 +0800
Message-ID: <3555118a-914f-8c21-d5c9-7f3d969d357e@huawei.com>
Date: Thu, 28 Oct 2021 22:57:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: riscv: delay.c:77:17: error: implicit declaration of function
 'cpu_relax' [-Werror=implicit-function-declaration]
Content-Language: en-US
To: Naresh Kamboju <naresh.kamboju@linaro.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 <lkft-triage@lists.linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, "Stephen
 Rothwell" <sfr@canb.auug.org.au>, Kefeng Wang <wangkefeng.wang@huawei.com>
References: <CA+G9fYs6X5ce1BhynpivZLU7MvPq+vkrJCM7oSJf8GJBApCqZg@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <CA+G9fYs6X5ce1BhynpivZLU7MvPq+vkrJCM7oSJf8GJBApCqZg@mail.gmail.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_075720_655260_2B514956 
X-CRM114-Status: UNSURE (   7.23  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

 From c83a7b83ff96ba77a7c26090ccdd42aa7722788f Mon Sep 17 00:00:00 2001
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Date: Thu, 28 Oct 2021 23:03:13 +0800
Subject: [PATCH] riscv: Fix implicit declaration of function 'cpu_relax'

Including <asm/processor.h> to fix the implicit declaration of function
'cpu_relax'.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
After  "include/linux/delay.h: replace kernel.h with the necessary 
inclusions", we need this include.

  arch/riscv/lib/delay.c | 2 ++
  1 file changed, 2 insertions(+)

diff --git a/arch/riscv/lib/delay.c b/arch/riscv/lib/delay.c
index f51c9a03bca1..8148dcdee894 100644
--- a/arch/riscv/lib/delay.c
+++ b/arch/riscv/lib/delay.c
@@ -8,6 +8,8 @@
  #include <linux/timex.h>
  #include <linux/export.h>

+#include <asm/processor.h>
+
  /*
   * This is copies from arch/arm/include/asm/delay.h
   *
-- 
2.26.2



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
