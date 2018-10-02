Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319BCC004D2
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 09:00:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01FE520878
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 09:00:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PLWBlpGJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ooz3iAVk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01FE520878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=r69IS1RRgLBoEM7JLy4fD8TExr4WlvpC+DBwLPyxbqg=; b=PLWBlpGJOT3TYvGI2ptVROGpQN
	LqK6ByoEu/4Hrp8jD410wEdvUsNadtNQqWIkm9b6o6OAJP3Ylbv1nZeEkZNMo4SjxiBPiZ/mt1buj
	DFhRVkcy28ZO9f2W8snHE1K4Qz7gtHXmXJoNo/gTFPAgVxdMjrd4uXwDb0+75m1xRLxx5t8pm1DJC
	ZcN/3r4NcI0xTcpfu2kAJny0sJNbhul+AQtsSrLAmPWsnx6p6sB1f84lHHPhE8+V/DIvRCyh0QtId
	z5PCVRzCxLZZKXSVNtbGkrvwHG+qc5DoqpwrvtIC1HAAPJLSnnKn9kdptZyODPS4PNuB2cV/PlKWa
	xzGhX9LQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7GXa-0005T6-ND; Tue, 02 Oct 2018 09:00:26 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7GWm-0003mc-8L
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 08:59:54 +0000
Received: by mail-pl1-x644.google.com with SMTP id b5-v6so654076plr.5
 for <linux-riscv@lists.infradead.org>; Tue, 02 Oct 2018 01:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NPRdNy7+UDI8uqkv9kQ0+VObvpSXNliiTqy6LJMFPos=;
 b=Ooz3iAVk3RAx1KDVHXjS2lU5F9KGr4+cX22P09QWMXUeA6vJgXXwcMA+TlxWxUKFMo
 kLCP5WdPeaT9MRx/RMVJjntB7iiIqcFDwrVDcqnd/5UqoC6BoCOb+BRW8bacrh4nLf1j
 d4eBAQpx499zXpHqDBtcvrJho/Wt/aA1MRYEWBRy/uvgteI5AJGy229zU132VMscC738
 /RXVgpyeRCFzsvqTeiJ3VHDGpYoobK5mdZAtOC/PxorMAQp05j00POr8akKRc4PtoOZq
 z/s/exXu8F/vKYDIGWbJwtmXYqDEsVFcK+TS1wYp7BRw4wLjRKiDEo5hKC+FK1HH1ZCe
 h4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NPRdNy7+UDI8uqkv9kQ0+VObvpSXNliiTqy6LJMFPos=;
 b=fOqn6z5cKxsgxKroItDFYJjaSZ7kKF0eyTcfptOPTsq/GJ7OqHAwJs/m++eNNiymmG
 CjFIOGHOna+PQtyZmefuUDDqvXUw4U/Oxt0S8GLsoOzSJon8MmQuxDGN+6DQm88+Pqnz
 aK2WETGvTeQNrNSdL/aBi9dFiTorqBB+8J/GASPbs1ZdzxDw/j9tFFwOa1Q5q5zLBPZa
 DHU4G3kFhxuLC4hSa30orhndWUii6khPFGzWJQd4M0+DQ9LVEVNPimXmYPx0ZC+IeC5x
 n6quYewWHem/icu63gMJvW4AkFLWAuLZ4Z+RemySDZWn1sfbIT4EU1GGQfIDCPiAXrtM
 QsRQ==
X-Gm-Message-State: ABuFfogc2p9Pj9rjeT2lCL0XoO3raoVRHFup4/y8Qp5SMGKWPUhc2b0j
 dOwI1w1hd0vgMcFgXUVHUF4=
X-Google-Smtp-Source: ACcGV63Gmx0dog9/qAPm4grpnTa1QbA1K7f3y5OVOM6VMM3ksM1mgw9hGxppuCtDw8wQzcxfQJrtIA==
X-Received: by 2002:a63:2323:: with SMTP id
 j35-v6mr13725885pgj.337.1538470765554; 
 Tue, 02 Oct 2018 01:59:25 -0700 (PDT)
Received: from app09.andestech.com (59-120-53-16.HINET-IP.hinet.net.
 [59.120.53.16])
 by smtp.gmail.com with ESMTPSA id 62-v6sm5057927pgc.58.2018.10.02.01.59.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Oct 2018 01:59:25 -0700 (PDT)
From: Zong Li <zongbox@gmail.com>
To: palmer@sifive.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v3 2/5] RISC-V: Use swiotlb on RV64 only
Date: Tue,  2 Oct 2018 16:52:28 +0800
Message-Id:
 <a2ae9d4b7cd1d97cafe8161ec28f46e4a7968776.1538470103.git.zongbox@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538470103.git.zongbox@gmail.com>
References: <cover.1538470103.git.zongbox@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_015936_343073_2ADE5117 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: hch@infradead.org, zong@andestech.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zong Li <zongbox@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002085228.gp_bSHpPjrGoyATTbnpNUylWNwE4KaNS9iJShUzb5_Y@z>

Only RV64 supports swiotlb. On RV32, it don't select the SWIOTLB.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/kernel/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index aee6031..6de6584 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -227,7 +227,10 @@ void __init setup_arch(char **cmdline_p)
 	setup_bootmem();
 	paging_init();
 	unflatten_device_tree();
+
+#ifdef CONFIG_SWIOTLB
 	swiotlb_init(1);
+#endif
 
 #ifdef CONFIG_SMP
 	setup_smp();
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
