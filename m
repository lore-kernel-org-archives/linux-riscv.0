Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AA0C63777
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 12:21:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78EA022241
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 12:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78EA022241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u++GRZJ3NHu68MCA0jm2r9bpROgJxtn0wGKoOIK4ykQ=; b=ArSTW6odTLX359adNdww2xRRZo
	pSqytIt47NMZv67GbmAdCCqlfGfwIWh5cJTovPhSOwVc5n+nBr1FB0GNZNyAHGcqD02X9zMrDXe5w
	EFjbAptjFxbKXwk2to0fLNylrZUelDsGXC4u//6rEIuTUXTv1QSDrgLrQO9ge3WhgkeIjgLn931t8
	caPNA+sGklmQ/a7OmFL8vkGcn95KmxiDjyTGMt5dJxCfhsueOuL0qfQ4+/yBesR0q4LYKWphjQfmW
	9H7nJk+x+EwqTajeCV/YzGB5wl1ZIfMZM+CwpyOb1+Ahwt8mwLZMb89pQM/6XJUEO5nWlclcidkbs
	+foMhXbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kknc6-0001w6-Vd; Thu, 03 Dec 2020 12:21:35 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kknbu-0001nJ-KJ; Thu, 03 Dec 2020 12:21:32 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cmw0N6bBrzLyy0;
 Thu,  3 Dec 2020 20:20:36 +0800 (CST)
Received: from huawei.com (10.174.186.236) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 3 Dec 2020
 20:21:02 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <anup.patel@wdc.com>, <atish.patra@wdc.com>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <pbonzini@redhat.com>
Subject: [PATCH RFC 0/3] Implement guest time scaling in RISC-V KVM
Date: Thu, 3 Dec 2020 20:18:36 +0800
Message-ID: <20201203121839.308-1-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.186.236]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_072131_911066_30185D7D 
X-CRM114-Status: UNSURE (   5.25  )
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

This series implements guest time scaling based on RDTIME instruction
emulation so that we can allow migrating Guest/VM across Hosts with
different time frequency.

Why not through para-virt. From arm's experience[1], para-virt implementation
doesn't really solve the problem for the following two main reasons:
- RDTIME not only be used in linux, but also in firmware and userspace.
- It is difficult to be compatible with nested virtualization.

[1] https://lore.kernel.org/patchwork/cover/1288153/

Yifei Jiang (3):
  RISC-V: KVM: Change the method of calculating cycles to nanoseconds
  RISC-V: KVM: Support dynamic time frequency from userspace
  RISC-V: KVM: Implement guest time scaling

 arch/riscv/include/asm/csr.h            |  3 ++
 arch/riscv/include/asm/kvm_vcpu_timer.h | 13 +++++--
 arch/riscv/kvm/vcpu_exit.c              | 35 +++++++++++++++++
 arch/riscv/kvm/vcpu_timer.c             | 51 ++++++++++++++++++++++---
 4 files changed, 93 insertions(+), 9 deletions(-)

-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
