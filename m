Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FA0CD1280
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 20:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZyhgHH0KmfyfU7T80GpSa0R0I3bvobRFh/Pv8rSCQgw=; b=F+6ykDZZUEFMmk
	cftxpmwzOBClGQKwgSmt7iKbwIzjr01XessLOw2M8G7xQ27RCdyQWTQGSCUKY+L0+O5xeiV4UaRIt
	iLEm23u/PnND3SqywnMPqArRpOTHFCjwelwgKdfO/HOigtUigqb3iKd03uYHKA5o4RNSBmNiaXxx3
	5m91sSX80tZ1AwmwlpdjXWfWt6HGXLx0i+MW5NvO9DL5MKBGX4pnwbKMxUSz/jzyP7mnfGxQvV9KA
	eUHM92Efut19QcbkuLt6iUznJFS9JhwT2k4E7SxNqInNEeaXSYhGs9CbCmdchA88TUKA+TJ/amYma
	NLzsdoITKLJO0k01udbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpDRF-00000006MsC-2yWo;
	Tue, 26 Mar 2024 20:30:29 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpDRB-00000006MnZ-1Qb8
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 20:30:27 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-56b0af675deso7434956a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 13:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711485021; x=1712089821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nOTCu2adkZyU4SASR+8mux3MN1uFKsv8RRVIr1/qVQg=;
        b=2tCtgLHffY5FE5uXEfseiHFb9vP/atr8Fp/9e4yjCf8TY47ngxj4i+lEWyV5lFMFio
         wngbF1LUWHzpybbjC0xr6meBVPzHO6mCAjV7222N++KNY2czUlWTdKtuvqJybtPZCow1
         NOt77qzVVHbtB9n3GmBjr4Oyv2/0wyclSPx5Vy1pUB57qmJ2YkihFZnVmgFDVqpF/M3f
         tC3SUZdAd9Jy3Lp3/Sn56tp7CHSEVGDDiunPbiMdTTTIeU15LCC/gM/xa1+8i1uHXcr8
         LpIJvHyeIJv4oMWsyI1vcfS0yeyfphcbZ7HBJUiQVslW1aaNwc+x2trieOwuL7zwrNn3
         coqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711485021; x=1712089821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOTCu2adkZyU4SASR+8mux3MN1uFKsv8RRVIr1/qVQg=;
        b=izo2gxat8/u4cLeYuZsVsmGV7wC8lQFAEr2uVi4HdQX3o8Tsp7/BtzriGCL5kj80m1
         2YONkHBUO74kVPWRu2wxs3rhzKtyKGtGjtEsMs2lfs7OTNZyO0cFuXRt9s0Dhu1CkrcF
         6LapTcgDlgmDxUSEJO1lymG1dLZXEhmq+8DEg9UmiquhUb0waI1F+S16s//HmUB+g3Ws
         QNK4stdtCe5/O4ciED5eVkucY4iQKpG+aTDy6eHfgFKV5rWLzpsWH40e54eZ/nbIwVhM
         5I7v5OjdXOqC5iG+vFDQckUL5rnqrC4uy8xiZbQCAJGTkC0AwwOfup5Yd0A/fIh1YMWK
         XbiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW+/VER1bt5OU1JM/23718ubl4/iayDIpNCN1zwH1KEr/vfHEKpQLs2ZWhuduLZAsbSJq5Z7C0eENu8zemaro5sSO9c4Kapa/edc14SfMV
X-Gm-Message-State: AOJu0Ywg8Ho+GCJtYUVIG7OvycTyVPn2eGXnRJpG4BmB5U36IL7Kq2Eq
	f/GGEkgLyHwkR9xa27v7NTocTagNeZLYWP40io2WQiiTN+JgddPoBoveQZRrYiM=
X-Google-Smtp-Source: AGHT+IGDCCJfg1K3FXIiSSOOGO99uhfcCCRDK5S7YUKDQOK6yXvBo4CUydKRMP0dyp1U6ZRkE8pBPg==
X-Received: by 2002:aa7:c48a:0:b0:56c:6cb:e7ad with SMTP id m10-20020aa7c48a000000b0056c06cbe7admr7158412edq.9.1711485021311;
        Tue, 26 Mar 2024 13:30:21 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2a02:8440:5240:d2b3:9657:7432:d88d:84a9])
        by smtp.gmail.com with ESMTPSA id ij5-20020a056402158500b0056c09fda4e6sm3097694edb.54.2024.03.26.13.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:30:20 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Zong Li <zong.li@sifive.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 0/2] ftrace fixes
Date: Tue, 26 Mar 2024 21:30:15 +0100
Message-Id: <20240326203017.310422-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_133025_751479_9DF7B6D6 
X-CRM114-Status: UNSURE (   6.67  )
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

Both were reported recently as there are efforts ongoing to
reimplement ftrace on riscv and both are independent of this rework,
so here they are.

Alexandre Ghiti (2):
  riscv: Fix warning by declaring arch_cpu_idle() as noinstr
  riscv: Disable preemption when using patch_map()

 arch/riscv/kernel/patch.c   | 8 ++++++++
 arch/riscv/kernel/process.c | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
