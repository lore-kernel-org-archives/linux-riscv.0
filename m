Return-Path: <SRS0=7uwl=IU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022A8C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 14:26:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67EAC6196C
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 14:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67EAC6196C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fntyeXcLZH3WYwxeseXpdZxpkVZPFjKu6GA1KMrKKQ=; b=nopJjXzhTHvCEr8sz0346rpd8a
	2EtyRMfxPmjbpS8HaY1WQYASUO6kg/u87T7nbPvIJYy+l0fc9HAU7RsA3RWRZqvRsYym8O6Urby7B
	c3RAJ3AZFzrffUHotEd4JF0zK1yN5C205oLC3/dHgJpgt+ZUsg6svw3iwNXcRvweGQMk0XhYZemwK
	cG4o1IYNPb520YIaXUAMWWzc1CtOMe0wQ+7gktBVdlUzijGO9hWBN8lJYYifImDCM2G3TXpUBjQaB
	AEOZuzLgDHbnyK1GSbu/uQ9rFzzyeKu/zVUplufoTXkEGP/SHv8MC5fIi+4OYH/YucpTvC812HGeP
	3omFQr9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOLVq-00BnQ5-Tb; Mon, 22 Mar 2021 14:26:35 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOLVl-00BnOr-TV
 for linux-riscv@lists.infradead.org; Mon, 22 Mar 2021 14:26:32 +0000
Received: by mail-pj1-x102e.google.com with SMTP id s21so8558138pjq.1
 for <linux-riscv@lists.infradead.org>; Mon, 22 Mar 2021 07:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vwwkep+JFdfhGdWvP8YCStBBTCCs3Qt81YZpxC50gMc=;
 b=MbUqrvsbVF9ef57oqEdVdO38TaKek6U1nwLYk6nJ6V9FWSB8VFv1cAXBv/yuiB5Qo0
 77HjXgEZOOZvENHUKtukNsr0frAnNJoJVt5dfV7yHp0OPwrHzmdeqpMqfMcfcVkk52Lp
 W5SzyK5uo2hDkKuRBQfdK1760o418UpYjAAHZ7TxSMiTMji6puxHuiKfh8zCIukINa3X
 tI9fA3EIbUcVAyJiHRisrTYyIr96I5xR+gypfUPxAuIHCBMaCH+JeMLO4yjHz1JNSimI
 D+o8BqTL8PSVKYpOgY7Vt7jdZhXnx1kpX0N9UBBBuRwUdTlggke7DqGGU6fzO1cGdzRg
 eVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vwwkep+JFdfhGdWvP8YCStBBTCCs3Qt81YZpxC50gMc=;
 b=Ngp1x01UKaqoB4Xu1GBbiuzY76Eb10uRSRKhT3DeQHQWiHvaqiBW43W7qbBXdlQXhB
 KTzBtyV7wx4w/tr5IrXiIwnW8giuvD629ac2U92Jm/WZhHjqqLagzk7Hxjl8co/6p9+Z
 ksa5TTZ/FLtUoJjiBjAYo7gbQ15/3C8qiWG+KbvqGQTv0MHUddKhBoSkZ+kMxpKGb8Bn
 Mk12vll68rG8pIawUVwoUIYzomWjkGF5PHa6KXWaeZsYV5AK0hC7nB6HXYSlJnPQ/5Pb
 cqCpwI7lGyhtb6a6O9wyj38D2CmgQCnjZDjHfn7r7fy3xLVvN5MLx8XUV9UUXGPfGSRT
 KX/Q==
X-Gm-Message-State: AOAM531LOxaWLBXHL7pIScbMZIbKci4ypuQ8DA1ENtamQbPHgewrVY/y
 wcTJsg+u/56quO+4Z6ik3zcKY00DUdOMJRX6
X-Google-Smtp-Source: ABdhPJyKhp7TAP0XewwH49//pqClBAf1UZg2WIlExBA03RDYb9XTDLrtJw9pSmkF24ZrqFnYXjIU2A==
X-Received: by 2002:a17:90a:f2d4:: with SMTP id
 gt20mr13881575pjb.212.1616423188293; 
 Mon, 22 Mar 2021 07:26:28 -0700 (PDT)
Received: from localhost.localdomain (61-230-29-29.dynamic-ip.hinet.net.
 [61.230.29.29])
 by smtp.gmail.com with ESMTPSA id v18sm14261971pfn.117.2021.03.22.07.26.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Mar 2021 07:26:28 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Cc: Frank.Zhao@starfivetech.com, anup.patel@wdc.com, atish.patra@wdc.com,
 guoren@kernel.org, alankao@andestech.com, ruinland@andestech.com,
 david.abdurachmanov@sifive.com, Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v3 1/5] riscv: Add 3 SBI wrapper functions to get cpu
 manufacturer information
Date: Mon, 22 Mar 2021 22:26:02 +0800
Message-Id: <1616423166-13857-2-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616423166-13857-1-git-send-email-vincent.chen@sifive.com>
References: <1616423166-13857-1-git-send-email-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_142631_014689_1ED8901B 
X-CRM114-Status: GOOD (  10.28  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add 3 wrapper functions to get vendor id, architecture id and implement id
from M-mode

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/asm/sbi.h |  3 +++
 arch/riscv/kernel/sbi.c      | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 99895d9c3bdd..dd2329962ceb 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -97,6 +97,9 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 
 void sbi_console_putchar(int ch);
 int sbi_console_getchar(void);
+long sbi_get_mvendorid(void);
+long sbi_get_marchid(void);
+long sbi_get_mimpid(void);
 void sbi_set_timer(uint64_t stime_value);
 void sbi_shutdown(void);
 void sbi_clear_ipi(void);
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index f4a7db3d309e..ead7e3fec104 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -547,6 +547,21 @@ static inline long sbi_get_firmware_version(void)
 	return __sbi_base_ecall(SBI_EXT_BASE_GET_IMP_VERSION);
 }
 
+long sbi_get_mvendorid(void)
+{
+	return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
+}
+
+long sbi_get_marchid(void)
+{
+	return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
+}
+
+long sbi_get_mimpid(void)
+{
+	return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
+}
+
 static void sbi_send_cpumask_ipi(const struct cpumask *target)
 {
 	struct cpumask hartid_mask;
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
