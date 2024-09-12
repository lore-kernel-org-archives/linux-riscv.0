Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC14EEE270
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 23:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1O2ACX8qp7wOoeT/D2igrXK7YXDDEObD1AB63bsN0Zc=; b=TPcKUHYs88/D3z
	k6bpE7qsMKOm0oSQeLToS+ceMFLsz9ESqH4FKliYqnpA6P+CspB/Crxr6iNYv1EvitcRm18kooZbk
	5zH3lxmqeYg6d2SIES0WhY9HdgF0gYEreOGgCbWl/vULuHLZ4s+GBU5FnJ8ep5QuHiz3Wq3cKnoBD
	EMQXDzqgD/vRi4Ir4XKTSwWNkxKtu1YH5OTKVcLi2Oo+67Z9Q2DiBcaUKGHDnyf7/9EV9aTEWU84R
	JCYQ71a8fS+be7MMLValzymrKtmn+dVhzqio9Z987Rx9gU1raXLUAY+O/H+jMvzy1Y+0TTkaSaDaC
	9D5JALEQZ3pvHUi5Ravg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot5g-0000000ESaB-3U3o;
	Thu, 12 Sep 2024 23:19:08 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot5Y-0000000ESSN-2guH
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:19:06 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2d89dbb60bdso1115151a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183140; x=1726787940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4D/20yGykkpsrImg7wGRo0iFbIK8mOpJga3H67yqrM=;
        b=uJ/uTTV5ujORFb72xXofDRWbeRluzGSwXTQSPM2o9QGbSwmbNgMEdXTiDuvg05wP8A
         cmxbqQzY3E/xxe98mFtYymk0knjXCSUrEEdfTu15+z1FMV9Ffqx8ihNDqX43U5tSeIGL
         n7uE+QOFFNtaIQIzWHA9dYWVA4hVG16hR0l9s1dLCOa7iBp/X0eCnpZCL/sM6OEbq/yZ
         RXfhKTRekAPg2uABd3SJeLNHs9OPhGcXhx+k0WOxCoLFqk6zmzt2pDrYxlFzoKQjkcBb
         imysZIG9fDJOZLvHKqA8vojMj9VdmTurvFW3xuN6W4Lt70XzcvXHcOlMcVoOcfqOuLsB
         +vmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183140; x=1726787940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4D/20yGykkpsrImg7wGRo0iFbIK8mOpJga3H67yqrM=;
        b=BPx240X9zogU7LhOUDcBBkXycZm0rcCJazFVzEVw2OOrV+M+leiG65m+2aOpEQRhwK
         vVE0aqap/m6tJ2yoIS4NCCox82BEbR/ZjQps85m4i7KqVGe5OszmCuYQwSPsnvG0RzJ7
         HEOAruFtPCjh81qadYVlwHvb6Jdq7RXET9GshrQ5LVgDqX8uBi2WO/b4NPzLZKd5cLR7
         rK2B2bILL2pdKe4JsY7EfSP0vPBADSjRUZZyKWinI1z5WwBlslL1JeMOCiZMDC87Hfg6
         I7SXX9I5Mxy3TFxFRt24ttk6L85eREltdrxZBlMtlEHY8mJFyKJROhq9v6QIclqsa0LJ
         HJfw==
X-Forwarded-Encrypted: i=1; AJvYcCW3DC4BiEnhNN4LrD3b4XvNIwTfyXgoAh1s54rw0p+EpWO/sD/B7oBycu1BcWLcYVEnZA9MbPDk+dYsvA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq/DpEjzrpVFc83HPbFMSE84GLF1cBCh9TU+rv6spv++2TWxQd
	4qQCvayaFSWWThshNWEZE7ySt2qRfcUiKRDiajmP7dBlxLjl07mGMOO1Y9/0cqU=
X-Google-Smtp-Source: AGHT+IEQ4DyvIPot4wX3TaeOhc9igc9k0ddrlo9rAO0eC0Cbq71JlaUH+P/ak8XpjpWlABFI12/jIA==
X-Received: by 2002:a17:90a:4b88:b0:2da:8c28:6561 with SMTP id 98e67ed59e1d1-2db9ffb41ccmr4730379a91.22.1726183139830;
        Thu, 12 Sep 2024 16:18:59 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:18:59 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 26/30] riscv/hwprobe: zicfilp / zicfiss enumeration in hwprobe
Date: Thu, 12 Sep 2024 16:16:45 -0700
Message-ID: <20240912231650.3740732-27-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_161900_942703_55535529 
X-CRM114-Status: UNSURE (   8.08  )
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
Cc: quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org, jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, greentime.hu@sifive.com, osalvador@suse.de, ajones@ventanamicro.com, revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, krzk+dt@kernel.org, vbabka@suse.cz, debug@rivosinc.com, brauner@kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 1e153cda57db..d5c5dec9ae6c 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -72,6 +72,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 49)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 50)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index cea0ca2bf2a2..98f72ad7124f 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -107,6 +107,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);
 		EXT_KEY(ZIHINTPAUSE);
-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
