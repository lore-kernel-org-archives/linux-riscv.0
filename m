Return-Path: <SRS0=p8lL=J3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7483C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 07:57:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AA8F6145A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 07:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AA8F6145A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t+fhQNVxBdjidBeaXMGJvM4xyRbBVkHNX9BnfDnY5S4=; b=bM2THqvHNeFQT6zOCUpV4xToDN
	hIK1gg2ehhd+Zm6ssPI8XulNBENgRppJvldxAqbiRuGeHgQI/06y8OBZ/4gNomAeD15sUfleDaEKX
	ZBcbjDn2sOMoHFk7N4jWPKziLkpR0hhtCWGoy6NMCaDfp3ZQZFvc7zc7aFqiFbxwEAK8wgZRXaVdB
	/DS/pbdPrm5mfiYQVMRD0k4XTnrzN89l0ek0nZaRBxs5sCj20f4NwHDOFeh/llZkMj0TlkV7M4hTQ
	0dUF6uzZHIMoTKjqMGAIC8oYAH1enMtayYBJyTZ+RkA4bzHsPc791gCjtuHATElFatskL9H7xUEDC
	ou4389/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcO18-007Sx9-Pc; Fri, 30 Apr 2021 07:56:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcO0y-007SvA-Sp
 for linux-riscv@desiato.infradead.org; Fri, 30 Apr 2021 07:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=jIQ1Se3rrKAme4NWP4S84j+6AqAbBin9ySOVSLX/Dfw=; b=j8GuMo6pQIDV0n24svg5Wi20zV
 DtAPD6oW6Pg5o64WwuOrrD87scFVqDNEJ8VYIRRI6cbwi77efmLgjYh+M0nrTnqx3UJ+wuROvxAza
 DcIP571vQljb184ZHhriOAyapzU3f+07kp4MLwc5SaZLTuDpq/G4w1QGvTX7TdH78mU012IrZgJ+2
 PgG9XKPJKrp5U1J2fi4WkbEF6+LBXsPvnEN6razQC5hOXsyP/zBjNs3oQkUz1FH9DTbhzGDuMRLKu
 sU17C70vcldKIiFfjduZcSVtbbPrbByZZ3XJitlXtD/crUNN8KujYkbZM/QCMIAIsf7BbTcTEPDjo
 qdrCqxjw==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcO0u-001DWT-Pn
 for linux-riscv@lists.infradead.org; Fri, 30 Apr 2021 07:56:43 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FWl4T1RwbzBtMY;
 Fri, 30 Apr 2021 15:54:01 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Fri, 30 Apr 2021
 15:56:21 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
Subject: [PATCH -next 0/4] THP supprt for RISCV
Date: Fri, 30 Apr 2021 16:28:46 +0800
Message-ID: <20210430082850.462609-1-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_005641_021906_92D1C71C 
X-CRM114-Status: UNSURE (   5.25  )
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

This series brings transparent huge pages to RISCV on 64-bit.

I have tested these testcases of vm selftest under qemu-riscv64:
khugepaged
split_huge_page_test
transhuge-stress

Nanyong Sun (4):
  riscv: mm: add _PAGE_LEAF macro
  riscv: mm: make pmd_bad() check leaf condition
  riscv: mm: add param stride for __sbi_tlb_flush_range
  riscv: mm: add THP support on 64-bit

 arch/riscv/Kconfig                    |   1 +
 arch/riscv/include/asm/pgtable-64.h   |   3 +-
 arch/riscv/include/asm/pgtable-bits.h |   5 +
 arch/riscv/include/asm/pgtable.h      | 164 +++++++++++++++++++++++++-
 arch/riscv/mm/tlbflush.c              |  17 ++-
 5 files changed, 178 insertions(+), 12 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
