Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED82C27C78
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 03:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:CC:To:Subject:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6YwpwtzIIorO+5b6k229tOJ4swfnEkdViNG1+bVM6WU=; b=bMFJsyHSFJNLsgG9R6MDo36exx
	HDq+wTG6r+zMecSjo8e0cdSIclg7UbrbyT0O0SnWIOzoMovWFRzxHjD20NLEZiNVgkrLa4FXhMWKR
	llIF84LuMJl56Su3rv7FF82GkSWRvwEewgjM8LNtW6t4d0N7DjfVgP8dD0e3ei9qsSpQW/kXwH9JT
	Y1BjqtZfzv6e6SNtxum/v1tC3u3vqZTAZv/ZCRc/zQfffWVok9iP/lLxUxLdT8d32mDFE7JvO4Crz
	1f3pBh5CO/HdGgDm/VIZgguOzNbFdasWiCwvSVDPbw962AQKF9Ciqc9n9berQtDnX9HBxLNBSGwQr
	o10RjS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHEGA-0000000AreL-13Pl;
	Wed, 12 Jun 2024 03:02:50 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHEG5-0000000Ardn-492d
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 03:02:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4VzVbm3Snxz1SC4h;
	Wed, 12 Jun 2024 10:58:28 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id B4A56140EEF;
	Wed, 12 Jun 2024 11:02:33 +0800 (CST)
Received: from [10.67.111.176] (10.67.111.176) by
 kwepemd500012.china.huawei.com (7.221.188.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 12 Jun 2024 11:02:33 +0800
Message-ID: <c740ef8f-1bb4-0c4a-4b88-77dab19f3e31@huawei.com>
Date: Wed, 12 Jun 2024 11:02:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
From: Li Zetao <lizetao1@huawei.com>
Subject: riscv: link error when supporting KCSAN
To: <linux-riscv@lists.infradead.org>
CC: <dvyukov@google.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
	<linux-kernel@vger.kernel.org>
X-Originating-IP: [10.67.111.176]
X-ClientProxiedBy: dggpeml100015.china.huawei.com (7.185.36.168) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_200246_438762_38DF8F7C 
X-CRM114-Status: UNSURE (   3.36  )
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

Hi all,

I'm developing support for KCSAN on riscv but getting the following link 
error:

riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L996':
core.c:(.text+0x2b62): undefined reference to `__atomic_exchange_1'
riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1015':
core.c:(.text+0x2c40): undefined reference to `__atomic_fetch_add_1'
riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1034':
core.c:(.text+0x2d1e): undefined reference to `__atomic_fetch_sub_1'
riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1053':
core.c:(.text+0x2dfc): undefined reference to `__atomic_fetch_and_1'
riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1071':
core.c:(.text+0x2eda): undefined reference to `__atomic_fetch_or_1'
riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1090':
core.c:(.text+0x2fb8): undefined reference to `__atomic_fetch_xor_1'
riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1109':
core.c:(.text+0x3096): undefined reference to `__atomic_fetch_nand_1'
riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1128':
core.c:(.text+0x3182): undefined reference to `__atomic_compare_exchange_1'
riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1147':
core.c:(.text+0x3274): undefined reference to `__atomic_compare_exchange_1'
riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1166':
core.c:(.text+0x3366): undefined reference to `__atomic_compare_exchange_1'
riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1220':
core.c:(.text+0x35ec): undefined reference to `__atomic_exchange_2'
riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1239':
core.c:(.text+0x36ce): undefined reference to `__atomic_fetch_add_2'
riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1258':
core.c:(.text+0x37b0): undefined reference to `__atomic_fetch_sub_2'
riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1277':
core.c:(.text+0x3892): undefined reference to `__atomic_fetch_and_2'
riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1296':
core.c:(.text+0x3974): undefined reference to `__atomic_fetch_or_2'
riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1315':
core.c:(.text+0x3a56): undefined reference to `__atomic_fetch_xor_2'
riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1334':
core.c:(.text+0x3b38): undefined reference to `__atomic_fetch_nand_2'
riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1353':
core.c:(.text+0x3c28): undefined reference to `__atomic_compare_exchange_2'
riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1372':
core.c:(.text+0x3d1e): undefined reference to `__atomic_compare_exchange_2'
riscv64-linux-gnu-ld: kernel/kcsan/core.o: in function `.L1391':
core.c:(.text+0x3e14): undefined reference to `__atomic_compare_exchange_2'
make[2]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 1
make[1]: *** [/home/l00517538/PrIntFuzz/third_party/linux/Makefile:1171: 
vmlinux] Error 2

The reason for the error is that riscv only supports 32-bit or 64-bit 
atomic operations.As far as I know, this error is solved through the 
no-outline-atomics option on arm64. How can I solve this problem on riscv?

Best regards,
Li Zetao

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
