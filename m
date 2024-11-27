Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35426D6ACFD
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 18:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lGJV8v39eSl1B0IihMBCQQJrpXtbSGpSZATWzfBVDas=; b=Bti1KkpUduE8GV
	4pBI5O37atBKtOq5acVhL58II3Ns5gXveawwtkMDV+tdQTQlwqdWLUzylw8MmwGh8DiudaAIatBNd
	YYm4c6N//9ZlSRzPBWykroV4z2olKCL3zm2jqmTL/HtCsUNMKM66mubeS2Gl3EtVtIVBuiKjSOhZr
	VPVwiyQ1W4kH5PGXtFUrDaZ7My2IIUkJsyJpzghkoV2IjAi+9BMw9RtLzCvpFmMrqWK5TFRFZ89Af
	uwE4DCFsqSyJc2IpYrinCWmgpFWcvd94sOW4I4swPP32l61DNyBWNhuF64D73RxLqlI866rLfWeS+
	7sqbCFVAnQHpWT/vUOUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGMuF-0000000DqNG-2L7c;
	Wed, 27 Nov 2024 18:36:55 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLrl-0000000Dka3-1BKW
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 17:30:18 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso4788464a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 09:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732728616; x=1733333416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbG7sBq4g0QTtfrKwDeWenWGnth2OE1nZlbtmRTgTgY=;
        b=kEfI91GajQCLiJxkWk3ZE0TW0w4cd56lm7PxiKmyY6ddMiRZsGEYQzjGxPib44OICv
         Np8WXFCRjInRqNzM/bGODog731yubxk9wK5lXlsSMdT4tndDz/kd826SNk8v/YAmkMoq
         g/jj+vxComKQjCqaZ9O95kba2tqYwQ/McVRkz0fHkodi34h2gIHgd752FTUwM25bIUz8
         Ipn8VirbN8jcsuFm5EJTTDeQCa8nFkmvYzcJvQyB9lL99cAX2stXKFYuuBanrrkVClwU
         wVpQlaIjoftBSKyM7gixGwtxkSuaqNqYBomD+9j5qWq62W5DCAryRCRCFrlJ/qDciFhs
         mq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732728616; x=1733333416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbG7sBq4g0QTtfrKwDeWenWGnth2OE1nZlbtmRTgTgY=;
        b=KilMsLo7MkJFa3E6+WZtX/vrFtFT2d2UrohoKaaKSChKevcgWfiXqtccBaDkH8RHLt
         DTXs3TjOnCpIJfeHoQ7hF3+I/+ESx97O/ybN/zLMohcZnsxKSlCp2GcsPvqJeATiz2Wt
         TyvPiALCq6n/yE4K+CAt0tLs9NHoB+JqGe6i1efEurz/U0kSXmze651gPwP3sPXgYWKq
         TCsR1dgftifpZA56IOJ7PGsMelIap2YNLoXKYX7/mjtLU12PKkYXwcesoctYTYDorWq6
         AQkMhNsdJUTITYejFYXY/ow+RSHk2MA0LGAxNbFunpTE+0S7DnSaMeP5UFkd6GZHw75M
         xu+w==
X-Forwarded-Encrypted: i=1; AJvYcCUAmaqfQZEu4m5xfldMroY+PnPDMROkybbEx7tX3zFdybgYY5xE3t+kcLWX6A5+2aIwVr5mFcuF4KqcQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzW2y1FMYumKwko19HbkJ8qA5B9hpR+1OebZKcUBPn6irrX+ykB
	++5abik+ixwfcnSqS5fBXbL6/WKnty8Bap8tiRA5F0Q5kI+JM1NI
X-Gm-Gg: ASbGncuRN0HoRqdq7UxWLZzZA+mUvmhxUXtSUotwr/RTMtuep5luzVuUp3WxOPmpk7B
	uMvyaDPvoryvF+fHJ0cAGafqVRYvI1vlyaU9rstubC4n1Bw/1zVma0usFxd0F5c0KjYq5UQ8Ml4
	RvNW+TuKwJlPpzr3nvA+y+cYqo1sFFNROACInlTYYq56qxIM9muCHan+JqVuboWq4fqQWj8pvyR
	sC5I9rwBH/VspN6PCiBQzyWuhvRnccN7QEBEI6WexQmyyh90QAyY59Zntv6rQGcYxY/StR1MFo5
	JtDQYwqRU2gNiYI16KL/Y8xgb8yr
X-Google-Smtp-Source: AGHT+IGTKYhqvbNwHQrWIr6lxxlwHTKRDAW2bOpNEEsjIU38gWo2Z6YtRqdQ+jNZ7IFsVssJEcCwIg==
X-Received: by 2002:a05:6a21:3997:b0:1e0:ce11:b0ce with SMTP id adf61e73a8af0-1e0e0b90f7bmr8440657637.35.1732728616138;
        Wed, 27 Nov 2024 09:30:16 -0800 (PST)
Received: from localhost.localdomain (1-171-29-17.dynamic-ip.hinet.net. [1.171.29.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1e3fdbsm9359582a12.30.2024.11.27.09.30.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 Nov 2024 09:30:15 -0800 (PST)
From: Andy Chiu <andybnac@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Andy Chiu <andybnac@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bjorn@rivosinc.com,
	puranjay12@gmail.com,
	alexghiti@rivosinc.com,
	yongxuan.wang@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	tommy.wu@sifive.com,
	eric.lin@sifive.com,
	viccent.chen@sifive.com,
	zong.li@sifive.com,
	samuel.holland@sifive.com
Subject: [PATCH v3 6/7] riscv: add a data fence for CMODX in the kernel mode
Date: Thu, 28 Nov 2024 01:29:07 +0800
Message-Id: <20241127172908.17149-7-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241127172908.17149-1-andybnac@gmail.com>
References: <20241127172908.17149-1-andybnac@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_093017_882488_85D4DF85 
X-CRM114-Status: GOOD (  13.17  )
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

RISC-V spec explicitly calls out that a local fence.i is not enough for
the code modification to be visble from a remote hart. In fact, it
states:

To make a store to instruction memory visible to all RISC-V harts, the
writing hart also has to execute a data FENCE before requesting that all
remote RISC-V harts execute a FENCE.I.

Thus, add a fence here to order data writes before making the IPI.

Signed-off-by: Andy Chiu <andybnac@gmail.com>
---
 arch/riscv/mm/cacheflush.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index b81672729887..b2e4b81763f8 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -24,7 +24,20 @@ void flush_icache_all(void)
 
 	if (num_online_cpus() < 2)
 		return;
-	else if (riscv_use_sbi_for_rfence())
+
+	/*
+	 * Make sure all previous writes to the D$ are ordered before making
+	 * the IPI. The RISC-V spec states that a hart must execute a data fence
+	 * before triggering a remote fence.i in order to make the modification
+	 * visable for remote harts.
+	 *
+	 * IPIs on RISC-V are triggered by MMIO writes to either CLINT or
+	 * S-IMSIC, so the fence ensures previous data writes "happen before"
+	 * the MMIO.
+	 */
+	RISCV_FENCE(w, o);
+
+	if (riscv_use_sbi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
-- 
2.39.3 (Apple Git-145)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
