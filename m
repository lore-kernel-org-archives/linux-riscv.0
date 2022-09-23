Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3975C6FA82
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 10:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=saEYWghX/j6UWDpZqT26OndBaGAxsRohPASK7Y082Yc=; b=Qyvb508G6tpkWo
	/RJvxQ38ixNuL1fvzSyzWwU3e3WtGj0aG229cCgvG+PAlPePRlL/IyBfh8nus9NrS0v5edKroqZMf
	jkiiiuwefymy9dxiwG6bGaZ2Rgwnq3kW97cI+OmU8b1QC3wjAmGnFnQh6dwABX5Usdho89Pnit4Ta
	Fyn+ank11sQlxY1OQ57YP4n8ivPbhCjKhAlntKSECPK7z4+9C1Ic0i2eM3vI5tZFzF0dHEGLiEXsF
	dtLlTylQtoF/Ozmj3USm3by2OZc0M1BXSdYfn/Dkt7dAemnvpMI4SzQmMGn9cuCqaDIj2JturgEAo
	rIDP4c2bYEN5Udq3E8NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obfWx-003YMs-8G; Fri, 23 Sep 2022 10:03:35 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obfWu-003YJP-Cl
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 10:03:33 +0000
Received: by mail-pj1-x1032.google.com with SMTP id o99-20020a17090a0a6c00b002039c4fce53so5271642pjo.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Sep 2022 03:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Igny7pTb9AijsoV7hvvN55djeYxG08/baILhy9iEypk=;
        b=VyNg8Ii30CtNaDjTaFtYwnCPGNizxdHazep/PeUMboCspqgfeSQKiTDgFqQ/vnSWap
         I6K+5rIOzf6oPLowz6qMKern4LAU+kuhCxl2cKsoDyaMK5RQBAdbOTcSQdsWjYs7fH/2
         r2ifcY+C7IcX/MgZHx2XCZCtc9FWTEhhD9cp8tcZNX4r65ktat7ezbP4J7S0MzKJVvaf
         blucuvgyjLxrT7LyKHphiuoB6HBLdMdch+R44ds3IpGA4zV+TntlFd5qfftF0ZD9gdu8
         mXzhYsqjs6u7tHiObI+Ezy69dAFTYIpvLcHuYzgtjtte3xIEMPQzbsx7Q0PMJsahI81Y
         M9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Igny7pTb9AijsoV7hvvN55djeYxG08/baILhy9iEypk=;
        b=BcNQoywi7nP4EHJwGobhIH3XC4AKNgqP8VChHhJgaBTz1l5vHDoUi515rQgEmp8f+b
         Aq8FcLMHeOohd9Id5yqWHlrRwluDZ3zlvzAhF9IgEdyVuaODCY4Z8l5pVkRQptad+bx/
         l4ELHI6414THzgcHnCl9Jh4516SqgZ5ocOojrgT6AbOYiBE507MSv4lzRHaRDlL+fGEV
         D5euQ1I/FdEgPbWu4ZQdOAET8rKnrUOfz4utV4UG9c8mzYxI/2uS7RIh3Wbu9E6QPVWS
         oce1r5Utf8GzZBbTwyquCnHR3f1JAg2BPSdzHXlZs1C4ETwmB3VEasc+2+gefn8Nl2OR
         C8bQ==
X-Gm-Message-State: ACrzQf3cVKyFVbfCbTj85MmBK9kG7ZbDWQKd/4UT/icBjPK9qIOoIDBM
	1DDxp68jp3KbaipsJOifSmk=
X-Google-Smtp-Source: AMsMyM422saiBMn/ttuHBBoJOpy7D9O9IJYmJtuUdgGr8ByYU4QCQaCJ++5PPH1JIak8CwDVtGUjpQ==
X-Received: by 2002:a17:90b:1a90:b0:202:ff17:4a80 with SMTP id ng16-20020a17090b1a9000b00202ff174a80mr20367969pjb.213.1663927407990;
        Fri, 23 Sep 2022 03:03:27 -0700 (PDT)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id l25-20020a635b59000000b0043395af24f6sm5374100pgm.25.2022.09.23.03.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 03:03:27 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: guoren@linux.alibaba.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: [PATCH RESEND] riscv : select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
Date: Fri, 23 Sep 2022 18:01:49 +0800
Message-Id: <20220923100149.2647325-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_030332_481178_40F1B2A9 
X-CRM114-Status: UNSURE (   8.14  )
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

riscv now uses -fpatchable-function-entry with dynamic ftrace after
the `afc76b8b8` commit, which means recordmcount shouldn't be called
to create the __mcount_loc section before the vmlinux linking.

We should select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY to tell
Makefile not to run recordmcount.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c22f58155948..25db8cea876a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -246,6 +246,7 @@ config ARCH_RV64I
 	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
+	select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY if DYNAMIC_FTRACE
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
 	select SWIOTLB if MMU
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
