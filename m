Return-Path: <SRS0=FYRI=CF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18330C433E4
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2020 08:24:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEA4B20738
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2020 08:24:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3AYAYN98"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEA4B20738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+VRdrwqupKV1MkbMOhENtPy2Fkx/H7WBwq/1hDcu9+s=; b=3AYAYN98hKSkLi7adOc1zp9XaT
	CCeSUyx2dZHMh6ofsm1e3zVBNYXMDyXHQ9L9X5if1ioJd/5nGPY5RiWaoJdyUMon+imHjpmaSQnch
	elLCpKLIC25iAFtPJnr2s3jBWzrDPHnoXvFLwsMo8vzBAl2jbjVVZe4MiFn8ow08FQZsiJ0oz1wpk
	Wn4zQgMTuKLh35R7OdKaenY6ECB3YzSfmaqQXzcCndVY1y5gKh+94Z9UnOEKIkhXC3J3xhGwfgW7x
	+EBUbWsL5Vusqrb75adgllnubjqgcHw57PapTutsZ/tqOWfKMd8koUT3YKIuh1IjW9L+OihwNp1rJ
	g+A6K9xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBDCY-0001S8-2n; Thu, 27 Aug 2020 08:24:06 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBDCT-0001NH-04; Thu, 27 Aug 2020 08:24:03 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5C70C129FCFD88B23E96;
 Thu, 27 Aug 2020 16:23:48 +0800 (CST)
Received: from huawei.com (10.174.187.31) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 27 Aug 2020
 16:23:41 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
 <anup.patel@wdc.com>, <alistair.francis@wdc.com>, <atish.patra@wdc.com>,
 <deepa.kernel@gmail.com>
Subject: [PATCH RFC 0/2] Add log dirty support
Date: Thu, 27 Aug 2020 16:22:49 +0800
Message-ID: <20200827082251.1591-1-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.187.31]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_042402_647175_F8C96409 
X-CRM114-Status: UNSURE (   6.45  )
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
Cc: zhang.zhanghailiang@huawei.com, kvm@vger.kernel.org, yinyipeng1@huawei.com,
 victor.zhangxiaofeng@huawei.com, linux-kernel@vger.kernel.org,
 Yifei Jiang <jiangyifei@huawei.com>, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, wu.wubin@huawei.com, dengkai1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series supports log dirty for migration in RISC-V KVM. Two interfaces
are added for kvm_main.c, and some bugs are fixed.

We have implemented the vm migration in Qemu. So these patches have been
tested.

This series is implemented based on https://github.com/avpatel/linux/tree/riscv_kvm_v13.

Yifei Jiang (2):
  riscv/kvm: Fix use VSIP_VALID_MASK mask HIP register
  target/kvm: Add interfaces needed for log dirty

 arch/riscv/configs/defconfig |  1 +
 arch/riscv/kvm/Kconfig       |  1 +
 arch/riscv/kvm/mmu.c         | 43 ++++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c        |  2 +-
 arch/riscv/kvm/vm.c          |  6 -----
 5 files changed, 46 insertions(+), 7 deletions(-)

-- 
2.19.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
