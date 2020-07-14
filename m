Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E7BC433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 01:21:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5912521924
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 01:21:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qev+jH/7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Tdeet8Ev"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5912521924
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LVlXg24u4un4eBCVg8+/b/jNAoyEFRkUdA/ij19AoaY=; b=qev+jH/7LvQordXVRbUM4GjyJp
	C5h4liLGvPgAK2ZEkO9bJ5kTFAe7dDvXsk3FXiAMpeaEA75nh/w6bM5sxm0KivDHn/lsA/dDDbeds
	PlyukQ+F91io2q9Do7ZvtGFZj8PJpfMXhAZY7RKS4RISKLOk9Ke0kxX0PuS1iDfdBM4vPJXNbBlXS
	DJzWEuzWjTecMTuwyN5x3v+m2DuidnvmkFnlhTn18PyGi6ZnhD6HqXsQyHb433PSNYiKLwU44ALbs
	NEf0DvvnGV6miY5vaCkfDMxpO5IVwTcDaC1dkf2uPk10VtfdXpG3w3G2NpguekaByDYnziOp90YEz
	xkyEo/Zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv9dS-0005Zm-1u; Tue, 14 Jul 2020 01:21:30 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv9dP-0005Ym-9n
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 01:21:28 +0000
Received: by mail-pl1-x644.google.com with SMTP id 72so6322071ple.0
 for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2020 18:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=VmDhhDgTu8bitXq1iZew/NUmGohT7Wuy/FvS0rrJGXQ=;
 b=Tdeet8EvRDaTtWDzWgQvTn4KEIgIGAvIZYhUzYee7Pk6WWtSWxASEsDha/qBdBFBn9
 mE/hoaavMp/IyycuDvogQZnqv0Xw99qL8ejowqrdusZCMkHl3IeKnZnH2WpRzz+9vhiB
 TJH8ZVm0b7FvlJXUklAZc90qpub8JPZFgoOgSOvtX8WdI5n9QXngkYC8zy4vPtDDirJb
 yPnYt92eAjWtbgywHQHEbR6rXYiyHQX3wLaZAXOq8dQWvKlGF3lOdYvHgxzS8szlCtFL
 v17XdsrPEq5RWa/uVVR8JdDG28QThJmRXOJWPYYQiJLi97vtp3TzmEqfiIsbm27182fN
 hx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=VmDhhDgTu8bitXq1iZew/NUmGohT7Wuy/FvS0rrJGXQ=;
 b=lU3ZDU1k10WMApLIModSpLcuNFEj/zJdviX3lR7Keb/VVkpkmfZXl1bTlmudu62GHx
 FA98n9lBqMRV2Tlk8VvicjsMof1V8qomd0NEp45tdhT8tSyoFPQzH7FDhEDJfH4YEVmn
 bII7J+MkPcSmFlpyWz4L2bHopowLz66GXDHdagR4/9X0Y2lzp7hmVLYx6y4zSoRIDuep
 KQ0vyMYxurW8wzxI8cknRueYcB5NdRQYSk6We5kFtxMGZuhiAW4n2Re5w2rC4tf1VdJA
 ijTWMPw4zP54ivSHIwf6e1XXxMRjL9uE5yT66dUf74taG8R8n7GOx/8H/76R/el7W2Jr
 bs9g==
X-Gm-Message-State: AOAM533YROPCrg7sedLd0DEYz3KsIc1TnalUN5l/lfMfK28GNaPfBUan
 J1V6ZlkrDtKAW0DDYa9fSpveLmp8gWs=
X-Google-Smtp-Source: ABdhPJxWsth4zPvtSfnuToBEPBCUNhjgzKz8npOCTMDqjy+lKxmJJGV2UjSLFLTSrhDjNwy6C7MLpw==
X-Received: by 2002:a17:90a:9bc5:: with SMTP id
 b5mr2140055pjw.76.1594689683937; 
 Mon, 13 Jul 2020 18:21:23 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id lx2sm715779pjb.16.2020.07.13.18.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 18:21:23 -0700 (PDT)
Subject: [PATCH] RISC-V: Double the stack size on rv64
Date: Mon, 13 Jul 2020 18:19:23 -0700
Message-Id: <20200714011922.138617-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.27.0.389.gc38d7665816-goog
MIME-Version: 1.0
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: colin.king@canonical.com, schwab@suse.de, david.abdurachmanov@gmail.com,
 dvyukov@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_212127_424505_B4FCA27B 
X-CRM114-Status: GOOD (  11.09  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This was suggested in the syzkaller thread as a fix for a bunch of issues.  It
seems in line with what other architectures are doing, and while I haven't
personally figured out how to reproduce the issues they seem believable enough
to just change it.

Fixes: 7db91e57a0ac ("RISC-V: Task implementation")
Cc: stable@vger.kernel.org
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
I've put this on fixes as I don't see a patch from anyone on that thread, and
it seems straight-forward enough to just do it.  If there's any issues I'm
happy to listen, otherwise this is going up later this week.
---
 arch/riscv/include/asm/thread_info.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 1dd12a0cbb2b..2026076b1d30 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -12,7 +12,11 @@
 #include <linux/const.h>
 
 /* thread information allocation */
+#if defined(CONFIG_32BIT)
 #define THREAD_SIZE_ORDER	(1)
+#elif defined(CONFIG_64BIT)
+#define THREAD_SIZE_ORDER   (2)
+#endif
 #define THREAD_SIZE		(PAGE_SIZE << THREAD_SIZE_ORDER)
 
 #ifndef __ASSEMBLY__
-- 
2.27.0.389.gc38d7665816-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
