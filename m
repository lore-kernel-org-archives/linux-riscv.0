Return-Path: <SRS0=fXqm=NY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6461EC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 02:04:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FBEE2243E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 02:04:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o4hM5UzY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="PJcGYpju"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FBEE2243E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ru+Ds7vgcIc5huGjPCbiyH14wQQ6wasEoXFvi18I56g=; b=o4hM5UzYfsYrFs
	uAqE4Tvk2bkxrK3kyrMTftoVwov/Ld5d0giIcjBVivr441n1T0Kj4UC0cdDjgAoW657AQq0SAogCL
	hNPZeRtJ+0dT4vECj3chHu54YZ5zXjgVYd7mm/7d4/lYFLjhgygZuSOknfqmtH75j9FxNjmNbA12o
	UC/+APMp4RzDnnjHSW4Q96GBtasH1c19C/T4n5+PRYJR9llRDIi1KGdL4rN/ObzObHeiRUXWLnU7E
	tWqSwbDYbsrzN5r5Wdttx2I70QD/UPjGflod9LQ3zwUCzB8LBbjAmXLWLPHCmmDcWb+hmP/tKx/OR
	qByvkteeNddFsqjF+ZpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMO3d-00065y-2d; Tue, 13 Nov 2018 02:04:01 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMO3Y-0005rn-Ve
 for linux-riscv@lists.infradead.org; Tue, 13 Nov 2018 02:03:58 +0000
Received: by mail-pf1-x443.google.com with SMTP id s9-v6so5195744pfm.13
 for <linux-riscv@lists.infradead.org>; Mon, 12 Nov 2018 18:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:cc:from:to;
 bh=z1/UIs3s95nj4fpqBhO0b+gijTrwfsBw2mC/yrzV+uw=;
 b=PJcGYpjuiJEgki1sUH6Ps/OxW+uKZsZpdT8/5VFUfLtccEhdI4hEe7LQ4gJ/344Sje
 velnDB2Ci9clB3U8RmC6LUpwODoM9pOCDZuMGCQx2VSuoAwKNu3kCdG4cbG7HtQ2ybid
 vBfpuBSVXWNOMFOyhYdSCoaLmlQsBHLXU/acI20NUSC3IDI0e2lFUr0zksycuTao/O2I
 U0Z5TlMeSGKZS6RYv49+zvJGhFTH7V44wph+Pa4LM6I+ANjViJLl38AkocErnYfTKqyI
 fifq0V+oFxf1bQL6mNp+LG53CAJ6j1Vnd4w5qAQVnJYCzX1Qc1VvxxJOsrqZE0/p8GOM
 yhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :cc:from:to;
 bh=z1/UIs3s95nj4fpqBhO0b+gijTrwfsBw2mC/yrzV+uw=;
 b=GK2NW1oPbe8DfpnLLiLEzSG2IChO5AAHPGZ4Jz+qkj4j3KS4giWF+sTcmCtdtKVwTz
 5LtXgTJHh6iTV5Chi8LctmJqoVNIuqo2aq5tdFCRZofy/nE6gTT/yWXJCRQAuPrl805M
 GC5ovb3XgXrhxDRU8XbXwIfb3mD8XdFAPoWLZwap2Jd6TrBhQgIbgrgP3N6iw1BjCIPF
 BL7HaQuxizAZQsZFSnXsLrx0hP/bweZFM3WV9o6oNoV07+iGgWb/P5zWZkIrqOCfBGCQ
 W5g7/4gw3btcPUBKTA224YvYkJ22dgvs2+O86ChDq2hIhO1qO7rele3P2UMdGC6C+FKC
 xAVQ==
X-Gm-Message-State: AGRZ1gLIWK9X2JQbFeXDAFfTaefzBfAk5t8i9111rQrJu7kAYtqg10e2
 ydQiAe/Uu76VhKEMWXIr0uxq+A==
X-Google-Smtp-Source: AJdET5ct8ctnBfDREcAnPKrFHawmpructpZQJT2RsxPhQnRrzxVtPOBTDDjCdJ6kSMH5pN66S4Z/hw==
X-Received: by 2002:a65:560e:: with SMTP id l14mr3024951pgs.168.1542074629519; 
 Mon, 12 Nov 2018 18:03:49 -0800 (PST)
Received: from localhost ([216.9.110.13])
 by smtp.gmail.com with ESMTPSA id d3sm16479347pgl.64.2018.11.12.18.03.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Nov 2018 18:03:48 -0800 (PST)
Subject: [PATCH 7/7] doc: Indicate that RISC-V support pte_special
Date: Mon, 12 Nov 2018 18:01:13 -0800
Message-Id: <20181113020113.29640-8-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181113020113.29640-1-palmer@sifive.com>
References: <20181113020113.29640-1-palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181112_180357_017946_D2079566 
X-CRM114-Status: GOOD (  10.08  )
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
Cc: andrea.parri@amarulasolutions.com, aou@eecs.berkeley.edu,
 keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>, corbet@lwn.net,
 yamada.masahiro@socionext.com, jhogan@kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 jglisse@redhat.com, linux-doc@vger.kernel.org, dhowells@redhat.com,
 jcmvbkbc@gmail.com, rmk+kernel@armlinux.org.uk, mathieu.desnoyers@efficios.com,
 ren_guo@c-sky.com, david.abdurachmanov@gmail.com,
 linux-riscv@lists.infradead.org, mingo@kernel.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181113020113.gOnMVhpCuHm9ZOn5fXqY54b6S7Mi7_NB2Z4gvgGC5BE@z>

This was suggested by features-refresh.sh

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 Documentation/features/vm/pte_special/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/vm/pte_special/arch-support.txt b/Documentation/features/vm/pte_special/arch-support.txt
index 2dc5df6a1cf5..3d492a34c8ee 100644
--- a/Documentation/features/vm/pte_special/arch-support.txt
+++ b/Documentation/features/vm/pte_special/arch-support.txt
@@ -23,7 +23,7 @@
     |    openrisc: | TODO |
     |      parisc: | TODO |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: |  ok  |
     |       sparc: |  ok  |
-- 
2.18.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
