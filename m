Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33324C7EE25
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JKO4Di5dxI7KL2vb0UZ9l4mCxSSQUBiw+KqHdAga4E0=; b=fLgCJTbl6AMQUK
	DzBiZPWgaSwqIfQ0g4Q7arCj11yPCqQ1n0TU1ueQtF6dVqj7+vLL4w9dN4cxDNm6zMfH5EUKQ5zwp
	QcApigvwf9GbmtyiVwgy6g94si4ecag1wH0F1j1ngA7dV/UMGF/ms1KcgDM4dMxqhQycEGfOVSJVF
	VDfMIA83sS5nQ1O0U6NCb3uGVlfEgqB+NcA6mPxWBdRA62CUSX0EWiOMhFSnD6WBJPMl5NSKDm0/F
	vjEjR/BfYjHf0WH8bArZ9vLnp7035Z1lVDu2Vx+GRosxJQIAGCgZmjMgxSt2d/hzyF8Ipdr0FQmQh
	3FLXUgubyiXAix+P7l4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7WwV-00C7SL-0F;
	Fri, 09 Jun 2023 07:53:55 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7WwR-00C7Q7-32
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jun 2023 07:53:53 +0000
X-QQ-mid: bizesmtp75t1686297177txpqd2r4
Received: from localhost.localdomain ( [58.240.82.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Jun 2023 15:52:55 +0800 (CST)
X-QQ-SSF: 01200000000000908000000A0000000
X-QQ-FEAT: +ynUkgUhZJmBFu75q0NPiJ6aTl945nO9gpI8bXNQ/ESzHgPsBD6fTZ5m1288J
	zUyIKDG/VCQPAvgJv00JVCR58ywZjCK6YjDdv0JYBuzp28QKvYJwqgFmgP0oldjR3hTAGFh
	PUgfCXEAj9hNkaK1ifnQvqZt2ZVmVlRKFE9S0CwxsXKkjf++zlB6yn+WLwkCpF6nmISkiYO
	l7FFfKrhTDo2/Gd5+cLEvSf5U2NFe/6FgXmSHV9azmKTFtTXoAbtfmPOnGUr+72hfELjQI2
	LQh2KPGArq0GVhIc115bdF+haP9LAbyfiuQuKkruJFA2zoeWVupU+Wjd++LJOVZKaeyn2/k
	fzwyP1B9I/hfqdM+s03OjYv6W3oVvNP2lpFAA22
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14437550590923538906
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
	leyfoon.tan@starfivetech.com,
	mason.huo@starfivetech.com,
	jeeheng.sia@starfivetech.com,
	conor.dooley@microchip.com,
	ajones@ventanamicro.com
Cc: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH V2 0/4] Remove WARN_ON in save_processor_state
Date: Fri,  9 Jun 2023 15:50:45 +0800
Message-Id: <20230609075049.2651723-1-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_005352_294957_19708647 
X-CRM114-Status: UNSURE (   4.77  )
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

In the case of CONFIG_PM_SLEEP_SMP=n, freeze_secondary_cpus
is not defined, but the sole possible condition to disable 
CONFIG_PM_SLEEP_SMP is !SMP where num_online_cpus is always 1.
We also don't have to check it in save_processor_state.

So remove the unnecessary checking in save_processor_state
for ARM,arm64,riscv,xtensa architechtures.

Changes since V1:
https://lore.kernel.org/linux-riscv/20230525025555.24104-1-songshuaishuai@tinylab.org/
- supplement the case of CONFIG_PM_SLEEP_SMP=n in commit message as Will suggests

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
