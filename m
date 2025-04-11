Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58C4C369A2
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 07:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UiOoYq/4/QkQ8pf01b4pahb1csBLPBWB8oEoWbYBocY=; b=poR8ekyQWrmC+q
	QDa8EUQcccTpxuIM9ZXzLI3EX55wp4czoSd8bS5VSpGT5lxqkOMRoRwQxYQ4udzWpuO4XcqHEZ8me
	8BjCwJ4bEbJT1P0n/5FZio8Hl9D/v+KjWy5/IRtSmhh4iifXnz0fON2FP7dYZYLEG1aLHBNnNc7GL
	FqzNwQZsCY7b4Dfbx6L0C5b1F053D9332E+yuIWuWE+O/qKV8GYJ1L6RWfdSqqqbnwTWN1PZmWc6U
	Q70i6w4oBFagAvVwCf35k2qJCkP0n2SbBZ70kikkgG2TklNuJJK4i0zkJUbqFZYuhWfCGt0VTLv7M
	RyPCaXdZFMCRBcwq+FFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38qa-0000000CsKL-36GQ;
	Fri, 11 Apr 2025 07:30:44 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38my-0000000Cr8N-3qWi
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 07:27:02 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3018e2d042bso1178502a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 00:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744356419; x=1744961219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vGU0BWR52BomYHqM8E+XMcmBlKB/OaTdF3+KtqlI85g=;
        b=MCTiM6QwTXzCQYD796WfvCQc9djsV9cRZjgAXx/DZinnday+IJypmroVLoEy47+fg8
         wWmVHi4pwicWXicYcJ+tZdHSrYPuv7qkvF4HcrpIq0NRGj74kTEiv4zamDvkTWsGtNbi
         pElY7CZpfcm3oEzOS7hRgbRNd2G0CT0NJhBNh4YoddOU2Ht4V9awcNPsJfBdA1lqzK2l
         v6PM9NKkR+pMOxPpLEhFLJKU9jOSlM7hr6EMpEhCujAAW84SowCBsrMK9Pefj2m3flT1
         Ys7rRe8Qbuwm9RUlLZxXKMFTV30BTC3zEZwq/OhrWKJzlMhBHA+BhTqfzGgHUW98FN5a
         6mpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744356419; x=1744961219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGU0BWR52BomYHqM8E+XMcmBlKB/OaTdF3+KtqlI85g=;
        b=uIu97Eb6yQGuGPw3xuPGcvzj7wnsiXVoYPPd1P+XrA0BnN1rwGsg2f6YSfLt+//uua
         OzHRNvMXDkrvdjflVOvqhRaITuAUTevBFWbOJyfafzSBsGVI8ZVStZyP+gMXkAiV9/mb
         /jIeP17aP7Aab5gQ9fspKnihLD+CpZjv6EqUcXQDCNj4HErgbyQ1GiH8CIveIxTPF57F
         YMiBS3qGOrh+3fyinIRfdpBh5kDLV6KicFMe2AGv5+4ouhXkDUWG+wMlegdYpYdaBujD
         n6Q/w1blPE6n1j2PWkngq4qIN0m3pSdEuSG3Bm1yysta6jhU10AEZBv/Ny/ju5dGEHv/
         wmQw==
X-Gm-Message-State: AOJu0Ywwk/BM/RDMh94GFCNrACRobzNcYvjbZH3IGwTS77LP/1jLOL1y
	BNQQFbYz30sWLqlNHwJnERxdXPN3TFoCx5VN++dzhUzTB6YiuwMpyy9dpZOEuxA=
X-Gm-Gg: ASbGncvYj3oZTGQ7gmF3XC69RfyzNbsy2YhuUo4diELwTzCXL5fB9e5p1SjRfnQGwuR
	M3M+yuhv+CMxy1pqneoqy8AKFQt5molSE90Lnnc2mzbEBEfk3PJbdHdlQnFWhXPaiXC8wMYXYMR
	eJdvTHbMG/JN3XGCGk1i/tAKQvGDJIZwm1VWrofIvQ2Xq0mhzsjMk/IACC6DKvmcsolAFcYVehG
	GvlXnbi6MRcR5JFIwY7QvmrKYCwQeWlkOkTSZXT+7BYjoNB9qYZkt+5/HwCbRHhOMQfRmCRtNlP
	/t5zDuIz0D+TJC6kH0P6rZ/bjFG9nnT7SQ2zL6XA4wkAcAwIAwAeDo1VrhdPca9S20fj5Evcfmi
	BGgDqFs81vnCA
X-Google-Smtp-Source: AGHT+IGHWHeQo2R6RInraQwLZWCl25okBDKhcWO3jXSiWRFgrc31SRGIvaMkKaqaxywnFToViY39+w==
X-Received: by 2002:a17:90b:2246:b0:2fa:228d:5af2 with SMTP id 98e67ed59e1d1-3082367cc9amr3204474a91.15.1744356419636;
        Fri, 11 Apr 2025 00:26:59 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b654adsm42523585ad.1.2025.04.11.00.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 00:26:59 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	evan@rivosinc.com,
	nylon.chen@sifive.com,
	cleger@rivosinc.com,
	zhangchunyan@iscas.ac.cn,
	samuel.holland@sifive.com,
	zong.li@sifive.com
Subject: [PATCH 0/2] riscv: misaligned: Add ZCB handling and fix sleeping function
Date: Fri, 11 Apr 2025 15:38:48 +0800
Message-Id: <20250411073850.3699180-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_002700_966160_D2C79ADE 
X-CRM114-Status: UNSURE (   5.07  )
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

1. Adds support for ZCB compressed instructions (C.LHU, C.LH, C.SH).

2. Fixes a bug where copy_from/to_user() calls in non-sleepable contexts
triggered attempts to sleep.

Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Nylon Chen nylon.chen@sifive.com

Nylon Chen (2):
  riscv: misaligned: Add handling for ZCB instructions
  riscv: misaligned: fix sleeping function called during misaligned
    access handling

 arch/riscv/kernel/traps_misaligned.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
