Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFAD3C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 12:35:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EA3460724
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 12:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EA3460724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N/sj5h+ZSSlcHj3WbjA5ClECM35sNWaBD7G5BhXEHhs=; b=vaYdfhBfbJz/dg
	0knipmuYkZ86te9B4GE0xIq4CvCCz097K17PEmmrNSpQl3cdpLJKYDZr5TWBK53uzGHIRKNrjJs9J
	cd/laACPo12erDCyxZKj848kkmPZQwm0ocviK4d3DrlEpzFPKbJbzZswdHNgevnsd9yR0CrwLZbJA
	yjox90SIBxKJDa+Ao7e8+n2JYwYfM7NyEBypBOcE9d88HmKpe8n24ErgRxpzcHGtF2oDeGz6TT89/
	0PjEtsWN9T+tupiQYKO+g0aoxFBwgd4GzLaOzJyYoTa+wZPHEsfpDxZOTr6XeMyRnt9GspmQOh7sG
	PidZTsdR4LL8LtNiu5fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE9vP-00A2pm-Dx; Thu, 12 Aug 2021 12:35:07 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE9vJ-00A2mj-Mo
 for linux-riscv@lists.infradead.org; Thu, 12 Aug 2021 12:35:06 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 298CA40C98
 for <linux-riscv@lists.infradead.org>; Thu, 12 Aug 2021 12:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628771689;
 bh=fXksQPpDuH6T7x4BT558ZGGix2k0x0Rejn/yRv3oga8=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=IIhG2uAXgGCTKLClJVk//cM5thqXj+TdlzM2/jqpIYBYA1N791/3SJ2bnhMEN/zbW
 tjvF1ja4XkFs8xhGqhVwHwKt1t9WREiv7gTJaurgDysK1HueEF9TCAa3uDnU1b3kG2
 f0d2M6EV5DxSVFoR3Y0fdFV9B2BUmyLnGbjaUhgEdbfYljrCcltdx/+3ZjhULjo5hD
 oTVVLSj+T+/9YG0YU8bHXBuxGJVHvzi6c0vLJxicDswgdgn4lF3zI84JvV/w1ELHs0
 PCgB1yqQxOt8H0Zq+ZvmKkYMhCOLANJPKGB8s6kIXg6dylq9R33KKQCEe19fWFtYAY
 HSHE0fPBmsRJA==
Received: by mail-wr1-f70.google.com with SMTP id
 d10-20020a056000114ab02901537f048363so1784725wrx.8
 for <linux-riscv@lists.infradead.org>; Thu, 12 Aug 2021 05:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fXksQPpDuH6T7x4BT558ZGGix2k0x0Rejn/yRv3oga8=;
 b=qZKFbUEilHkQhTU4zYRtca2slNOKhlGEo4sO/IFnJqHF6HNPMSRU8Y2YSW8DORzX0r
 AFZjgNmNp73oDBGAP9befnncaI3mEY4Do2rbGPT8LVyvgqB559LzfgTTsdNQ/jJ89jCe
 22F3o4TcE7TSqZIaFbU4NoFkoPxEPWyou+yMMjAA14tFEudgaZMkSmUGd2oU9I3J2rSJ
 UB1QSDeFs3kC8iupbryE9Yj4V2IXAAK17QY4+EbgiZSPdf+Off/MAn/JHGQVtnuRSLko
 vYErVjzspV03Y2W2BrW3JyeDYqHmlXUelSXfU2KLWIRIKIoMVBoNufrp7vVrNMA+f3W3
 kZUA==
X-Gm-Message-State: AOAM531qt4/gyxiwDHwMVFvhRbIiTRMQkuqCrEavJmWiVh97FCBdE1Ve
 qUfwGYzEBCkXQvpfyrveVh8Of5aHKZ9qJ9zG/qOxeD35JZ6xsWWzMcjHqbClJk2tuUaF2ablcMC
 tU8igP5HlZOpdlx5dR5BAOSAbEIWz+bwZiwbaAeca7kK82w==
X-Received: by 2002:adf:f08e:: with SMTP id n14mr3655711wro.427.1628771688824; 
 Thu, 12 Aug 2021 05:34:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyF/ZR5C1BtBNd4kJJCPmKateoDi+EtUFQPs23ytvlz7wdG1g2X3iPF4mV40XLyvZ9KL1CdDg==
X-Received: by 2002:adf:f08e:: with SMTP id n14mr3655691wro.427.1628771688574; 
 Thu, 12 Aug 2021 05:34:48 -0700 (PDT)
Received: from localhost ([2a01:4b00:85fd:d700:1220:9591:5798:fefe])
 by smtp.gmail.com with ESMTPSA id 129sm2646812wmz.26.2021.08.12.05.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 05:34:48 -0700 (PDT)
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
To: linux-kernel@vger.kernel.org
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Pierce Andjelkovic <pierceandjelkovic@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: prevent sbi_send_cpumask_ipi race with ftrace
Date: Thu, 12 Aug 2021 13:34:33 +0100
Message-Id: <20210812123433.27871-1-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_053501_953581_FEA223B6 
X-CRM114-Status: GOOD (  13.64  )
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

From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>

ftrace will patch instructions in sbi_send_cpumask_ipi, which is going to
be used by flush_icache_range, leading to potential races and crashes like
this:

[    0.000000] ftrace: allocating 38893 entries in 152 pages
[    0.000000] Oops - illegal instruction [#1]
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.11.0-1014-generic #14-Ubuntu
[    0.000000] epc: ffffffe00000920e ra : ffffffe000009384 sp : ffffffe001803d30
[    0.000000]  gp : ffffffe001a14240 tp : ffffffe00180f440 t0 : ffffffe07fe38000
[    0.000000]  t1 : ffffffe0019cd338 t2 : 0000000000000000 s0 : ffffffe001803d70
[    0.000000]  s1 : 0000000000000000 a0 : ffffffe0000095aa a1 : 0000000000000001
[    0.000000]  a2 : 0000000000000002 a3 : 0000000000000000 a4 : 0000000000000000
[    0.000000]  a5 : 0000000000000000 a6 : 0000000000000004 a7 : 0000000052464e43
[    0.000000]  s2 : 0000000000000002 s3 : 0000000000000001 s4 : 0000000000000000
[    0.000000]  s5 : 0000000000000000 s6 : 0000000000000000 s7 : 0000000000000000
[    0.000000]  s8 : ffffffe001a170c0 s9 : 0000000000000001 s10: 0000000000000001
[    0.000000]  s11: 00000000fffcc5d0 t3 : 0000000000000068 t4 : 000000000000000b
[    0.000000]  t5 : ffffffe0019cd3e0 t6 : ffffffe001803cd8
[    0.000000] status: 0000000200000100 badaddr: 000000000513f187 cause: 0000000000000002
[    0.000000] ---[ end trace f67eb9af4d8d492b ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---

Where ffffffe00000920e lies in the middle of sbi_send_cpumask_ipi.

Reproduced on Unmatched board using Ubuntu kernels. See
https://people.canonical.com/~xnox/lp1934548/ for sample images,
kernels, debug symbols.

BugLink: https://bugs.launchpad.net/bugs/1934548
Reported-by: Pierce Andjelkovic <pierceandjelkovic@gmail.com>
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
cc: Paul Walmsley <paul.walmsley@sifive.com>
cc: linux-riscv@lists.infradead.org
cc: stable@vger.kernel.org
---
 arch/riscv/kernel/sbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 7402a417f38e..158199865c68 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -562,7 +562,7 @@ long sbi_get_mimpid(void)
 	return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
 }
 
-static void sbi_send_cpumask_ipi(const struct cpumask *target)
+static void notrace sbi_send_cpumask_ipi(const struct cpumask *target)
 {
 	struct cpumask hartid_mask;
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
