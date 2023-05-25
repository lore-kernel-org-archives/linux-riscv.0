Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEEFC77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 02:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YzJCBng6vHyk3USi+hju+rEemKuuWSog4Ev/erUbdYk=; b=ndjJlIqd6nxjau
	7sbHJW1GgkIXURYbI3pS/86TMmSz7cQc2pTFj1rctUaLwG/Q1c9cLuvpZsmsb9a0S8xg9hW0b9G60
	MqnmvHhcsSISzPKZd76UTKTPv34uVzQ1h+ffvW0Q8Ofngwcgk0WdaUwuRLgO0JxVESkSD2EFXwWgJ
	sDdL8/ca+G4ShbZZuL+X8A9Gzt6EWJQdGeinK3/OCIudNTKem/YdlKM4T107Zy77UBbiU71tI0qJq
	20fNGeKitG3Mce60CkWO90bH/y3CUO5Q93vpjioaDWAuPJuGCcVXspi2I7pHRGTNwAa2cOfNRP9xM
	v7Mx9Ztvj1B0LT86yuBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q21Au-00FJZP-0T;
	Thu, 25 May 2023 02:58:00 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q21Am-00FJVH-24
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 02:57:54 +0000
X-QQ-mid: bizesmtp63t1684983419t85lva7q
Received: from localhost.localdomain ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 May 2023 10:56:57 +0800 (CST)
X-QQ-SSF: 01200000000000303000000A0000000
X-QQ-FEAT: 6m2HWuPn8APBKt63b3ah3TllQMoQddj48JDVm4Iepq5vRZSuXhWkDmIyJiEkQ
	MMvn40T53r5LmKlVQsPdr7bAyetskT7oogCcohGJNvN7UewCTkHFngfiLwsab7GI7lkPqoL
	hUOlodi0YIdrXuTQoCL2ILEPmt9iEG19lXfRne5e00JAyBeo/LRJVJK11hYEmya4nTQXBeh
	wj3H4AoK/LJVOpUmO4+6EMM+p22e9We1hFNY4tMXwU/U1dN+3DTmK0EOBfo5m1dvTT2Jkex
	CH+oS9ZeiuMRrxsyOK8JZr0YuD8zCH3Y92kgw/8TnFCP9w7Nl3QIj3OvbR+CgWtZcG3NKp8
	TUruhAgK+guXxTnDBFbCZ4wFEx43f1gw7hB8RcF
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14888827228828076966
From: Song Shuai <songshuaishuai@tinylab.org>
To: catalin.marinas@arm.com,
	will@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	songshuaishuai@tinylab.org,
	steven.price@arm.com,
	vincenzo.frascino@arm.com,
	pcc@google.com,
	wangxiang@cdjrlc.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	jeeheng.sia@starfivetech.com,
	leyfoon.tan@starfivetech.com
Cc: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/4] Remove WARN_ON in save_processor_state
Date: Thu, 25 May 2023 10:55:51 +0800
Message-Id: <20230525025555.24104-1-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_195752_980971_44F724C7 
X-CRM114-Status: UNSURE (   4.36  )
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

During hibernation or restoration, freeze_secondary_cpus
checks num_online_cpus via BUG_ON, and the subsequent
save_processor_state also does the checking with WARN_ON.

So remove the unnecessary checking in save_processor_state
for ARM,arm64,riscv,xtensa architechtures.


Song Shuai (4):
  ARM: hibernate: remove WARN_ON in save_processor_state
  arm64: hibernate: remove WARN_ON in save_processor_state
  riscv: hibernate: remove WARN_ON in save_processor_state
  xtensa: hibernate: remove WARN_ON in save_processor_state

 arch/arm/kernel/hibernate.c    | 1 -
 arch/arm64/kernel/hibernate.c  | 1 -
 arch/riscv/kernel/hibernate.c  | 1 -
 arch/xtensa/kernel/hibernate.c | 1 -
 4 files changed, 4 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
