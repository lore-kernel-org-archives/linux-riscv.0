Return-Path: <SRS0=AX01=6O=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273E2C8300B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2020 09:53:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE87B2082E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2020 09:53:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sEgj0ebQ";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FNsMRJvc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE87B2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5b3mMRHvXQbzHGW+qWobb2z60I2edTthB81/8CnRyTY=; b=sEgj0ebQy9w68E
	zMCMB9xKzdUWam87jPPm+K76G1NkQt32iyMRYrh5kmeIM3Z20UYKaN/J2NwaCnygu4cdCckypRuOZ
	Hfy8hkjMqU4s5WRzRfKGjMIVhCuchkPcLaBJpJRZf6AZgi80qh4QaKKf20hxuQXq4LIy1hAaYuEYJ
	fzooUPfTR92su/8iyMtPdE4UW0MWkpTe/OS6LTDAUcN3blP71sjZQ2oMrZEftcJGgrnLlayVBijmi
	GE/iPJQb/WPbWcqJzwUPgXjAGnQVj1gLg8JkchhbJwx4UYk8OtIH1zP73Y1fcadvUTHjLxmJ9oALR
	dqtbr/t2a8+QdIwwdS7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU5sr-0005va-8r; Thu, 30 Apr 2020 09:53:33 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU5sn-0005uu-UE
 for linux-riscv@lists.infradead.org; Thu, 30 Apr 2020 09:53:31 +0000
Received: by mail-pf1-x444.google.com with SMTP id d184so2649409pfd.4
 for <linux-riscv@lists.infradead.org>; Thu, 30 Apr 2020 02:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5b3mMRHvXQbzHGW+qWobb2z60I2edTthB81/8CnRyTY=;
 b=FNsMRJvctW/IDfTOYQj2ig1bKzEgCq7adVIiDRyxR3g9R6bKngVEVS6C4dsVXlmUIg
 vUmXjcffoR5a+SZZWsGwH/bi3hYBRz1qQI3C9LY988QEnkjCbK98ITHxeJLIjRcpaBu/
 mu9lyGOJCdAeYwDU/4zKkaJYYUxOuwwbfBtiFCD7LQxknApn/q1i44jO94/jCmqqmbFQ
 K2TOCuc83POJeLBBim07HMywiC7a7TBFmA5jUA3uDKs1gtLg7mJn9HTvLW0yjBiYlZPw
 vpg+Xvp2TdcKwtNzuVHzn40qfbVA+rnkS2dbDde5IMcGLMda4HBVgqOP/6/NLORzNAd/
 qQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5b3mMRHvXQbzHGW+qWobb2z60I2edTthB81/8CnRyTY=;
 b=fylzjebI49xhaCRjBD5y296RbmHxeZnC3W1GOw+Q0pHUAgRiT45vvudxPU7gbFY6+F
 sMDThs7Ezk/36cyeCRg2+9bM0A8Ow8p7dDF6PcPfrIk0TMqvWov79i3ubfwVO9dIv0cN
 sNrTKgFeXKivTKsStu2Yk0BYiCTNEUJVujnjYrJJH3sn+NBABHdcA+YdjRU6C8YxnH+D
 AGVGGGsokxWUN4ZCL7/LBc9gCesreQJ7+ShBjPTl9e5O1j60MLjAnkBlaVsIM8q2p4U9
 S/T7S7VRwC5pX0sswq49OdfrFqn8ZBFPuZtU15C/7C9M6f+tWy5irUNRhdRAQj08lfaI
 av6w==
X-Gm-Message-State: AGi0PuYidCYnqWf8MbuqRaqAk4xbnonYm5wWG8Rs+giJd0yEsAZ2bedh
 iTggQXs9F4THGz56scURU0G2xA==
X-Google-Smtp-Source: APiQypIkjbayVsvLjWrGFWYn1ptLAshEvqSgyGsXfTy7kGchV4xlRb/GFZHnzZrdW8ybBdTQ56nSaQ==
X-Received: by 2002:aa7:9683:: with SMTP id f3mr2825239pfk.278.1588240409127; 
 Thu, 30 Apr 2020 02:53:29 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id t23sm1367108pji.32.2020.04.30.02.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 02:53:28 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: force __cpu_up_ variables to put in data section
Date: Thu, 30 Apr 2020 17:53:25 +0800
Message-Id: <20200430095325.111441-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_025330_007892_84A1E804 
X-CRM114-Status: UNSURE (   7.68  )
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
Cc: Zong Li <zong.li@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Put __cpu_up_stack_pointer and __cpu_up_task_pointer in data section.
Currently, these two variables are put in bss section, there is a
potential risk that secondary harts get the uninitialized value before
main hart finishing the bss clearing. In this case, all secondary
harts would go through the waiting loop and enable the MMU before
main hart set up the page table.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/kernel/cpu_ops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
index c4c33bf02369..0ec22354018c 100644
--- a/arch/riscv/kernel/cpu_ops.c
+++ b/arch/riscv/kernel/cpu_ops.c
@@ -15,8 +15,8 @@
 
 const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
 
-void *__cpu_up_stack_pointer[NR_CPUS];
-void *__cpu_up_task_pointer[NR_CPUS];
+void *__cpu_up_stack_pointer[NR_CPUS] __section(.data);
+void *__cpu_up_task_pointer[NR_CPUS] __section(.data);
 
 extern const struct cpu_operations cpu_ops_sbi;
 extern const struct cpu_operations cpu_ops_spinwait;
-- 
2.26.1


