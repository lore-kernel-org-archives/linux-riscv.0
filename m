Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AF9C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 03:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sRjx21cbi6/i1qOCk8hKU1p1sYjU38B1AzAYS5CFGf0=; b=VIIahhyUqHgKm4
	q20QVTDaZA1pmxEqlDKX63ea5FjzoEtHW4RI1fz3UbA6XOn/J5gWAEpApR9GOcCQ4LmjA/SQLSAFu
	EgAaINnOwJU/bLnFrMhPRYdXfrZoSWTU7WUJPDT3/8dERdWT5HOYD7hBIlUR0fn24q0fZm0xllFpo
	a00H8Bpjw10ahsmENosgyHuKBXsoZeU3zTOxQXiFv/1Iqqi4ag09EWVsbwAyb0lf7ew/4g6uZy2Wr
	HQ3x9qSp/64semf1oefkiBVu817QoWNfU41XkIjZW/8GfoAKOf4vi5I8qZW2MeQzDgw4yoQm3Dciy
	2ZfpMtz9TWne+sUiZwBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNQfF-00Aoh1-SG; Mon, 15 Aug 2022 03:21:17 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNQf9-00AoZk-21
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 03:21:12 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4M5fbd6rq0zkWKC;
	Mon, 15 Aug 2022 11:17:33 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 15 Aug 2022 11:20:51 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 15 Aug 2022 11:20:50 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <Conor.Dooley@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tong
 Tiangen" <tongtiangen@huawei.com>, <wangkefeng.wang@huawei.com>, Guohanjun
	<guohanjun@huawei.com>
Subject: [PATCH -next v2 0/2]riscv: some refactorings realted to uaccess and extable
Date: Mon, 15 Aug 2022 03:20:23 +0000
Message-ID: <20220815032025.2685516-1-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_202111_324601_E5106F73 
X-CRM114-Status: UNSURE (   5.14  )
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

This patchset do some refactorings related to riscv's uaccess and extable,
mainly for the usage of __get/put_user_nocheck() which not distinguish user
access and kernel access.

v1 -> v2: 
  According to Conor's suggestion, split into two logically independent
  patches.

Tong Tiangen (2):
  riscv: uaccess: rename __get/put_user_nocheck to __get/put_mem_nocheck
  riscv: extable: add new extable type EX_TYPE_KACCESS_ERR_ZERO support

 arch/riscv/include/asm/asm-extable.h |  12 ++
 arch/riscv/include/asm/uaccess.h     | 162 +++++++++++++--------------
 arch/riscv/mm/extable.c              |   1 +
 3 files changed, 94 insertions(+), 81 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
