Return-Path: <SRS0=Rh5D=OG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D39EC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 13:01:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C9706124F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 13:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C9706124F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K7h+YxjnfRUDTuJ3IiRHTL7gIw1+bOiARnqwlFSa3XE=; b=ldAxUpE4vA5Uqr
	Ighl5MFu1H0CirTGQ1gD9YXW5sxIp2lz6iqklA2KJnmVQ8DWB/a+koLG/QnvfsrBVhiigrBHfLf8y
	VxypK3Fjj6Sz+nrk+kub6PlkXWjCT3yxJ4Aw8N3ahHl4w1EAk8cwvqhIKUD3xndiT1g2O7MimuODY
	Hrql15HUn4kHPb+zIIn/UgZcePqDAS3ZpEWlRhmlX4Fvbbyj28V4b7g5/m4HpnDWcvmVaKNn5pwsb
	xCRi25WA9Boj0ayh4lmBZV0V+Lwl4bmpeMO2pCiMf7iUMW2wpbJaz0awsC81wLgxA6uIfvdkAEEm2
	YEsrZunaCJdtgMfyOvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQr0O-00BCDY-AK; Thu, 16 Sep 2021 13:00:44 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQr03-00BCAq-3z
 for linux-riscv@lists.infradead.org; Thu, 16 Sep 2021 13:00:25 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H9HBX3jRxz8yXQ;
 Thu, 16 Sep 2021 20:55:48 +0800 (CST)
Received: from dggema756-chm.china.huawei.com (10.1.198.198) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Thu, 16 Sep 2021 21:00:15 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggema756-chm.china.huawei.com (10.1.198.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Thu, 16 Sep 2021 21:00:15 +0800
From: Chen Huang <chenhuang5@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Chen Huang <chenhuang5@huawei.com>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, Darius Rad <darius@bluespec.com>, Jisheng Zhang
 <jszhang3@mail.ustc.edu.cn>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] riscv: improve unaligned memory accesses
Date: Thu, 16 Sep 2021 13:08:53 +0000
Message-ID: <20210916130855.4054926-1-chenhuang5@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema756-chm.china.huawei.com (10.1.198.198)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_060023_439029_D6397E4A 
X-CRM114-Status: UNSURE (   6.47  )
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

The patchset improves RISCV unaligned memory accesses, selects
HAVE_EFFICIENT_UNALIGNED_ACCESS if CPU_HAS_NO_UNALIGNED not
enabled and supports DCACHE_WORD_ACCESS to improve the efficiency
of unaligned memory accesses.

If CPU don't support unaligned memory accesses for now, please
select CONFIG_CPU_HAS_NO_UNALIGNED. For I don't know which CPU
don't support unaligned memory accesses, I don't choose the
CONFIG for them.

Changes since v1:
 - As Darius Rad and Jisheng Zhang mentioned, some CPUs don't support
   unaligned memory accesses, add an option for CPUs to choose it or not.

Chen Huang (2):
  riscv: support HAVE_EFFICIENT_UNALIGNED_ACCESS
  riscv: Support DCACHE_WORD_ACCESS

 arch/riscv/Kconfig                      |  5 ++++
 arch/riscv/include/asm/word-at-a-time.h | 37 +++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
