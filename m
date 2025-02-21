Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C56C021B6
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 16:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HD4vpfl+jAy2gmxs0+nsHpk7BYZXC2wfUlaGCiEcJ00=; b=VbFvrJRHWNBJci
	th1Y3I8k9+tQld9K+pFPKAglXeCYl9qJh08OauRJ97clyXRX/5VM1ihX5/R3GCJ8o+PlCGjrpITFK
	SDV5PV9BwIwnFt584V7JuNQxVsgzCf5zjJFhX57uhrNn7zhtrLbcT48YTfGWNnMwOAYz5kdApWUvk
	pSPcDWj8jRtyRBMPWEjZbMF7GxwBKwLf5a1MSKQu65DC9Fkn1GCpqAqtnH+JG3ZqGi8kY/NdQtncN
	2s5ygaO9z8bepx8kTifNzTZRDvv57p0fFow+abp58/Lrja520BEEhBI7CY7zwtfbG+FYmXyO/Icjm
	JOeSBp9KrG492JBJxv/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVcg-000000066iO-2Ny0;
	Fri, 21 Feb 2025 16:11:30 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUSv-00000005tr8-1rQI
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 14:57:22 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38f31f7732dso1452127f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 06:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740149840; x=1740754640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RoC2FL5as/gzDPsPktuw00do1BQmGVd/xU0hU5pjN2k=;
        b=jB1S/W5SZOOL6aaVNvPFbULZb4qE3jk0INXTQoexYocOVinlJFfnSC6YVO85BW9TU3
         r/O8wbl6ABANOAOBDaGkRczNm+/Gtm58lPh3xF0VIfFkbNU1NgtpZGMkjjf+pz8nAMpT
         P+yT1Xx00FORVr1TQgr8KHrEFdxxTgmq3jF6SOPmQbcE+ay5q1Mcn5MqtiE5jd6YZYmh
         oLNIq/uNu4c+TF/NyYK2ZvH4MTb9rWx9p1te3DASYqb2PF7PFPBkuz2q8li2gdlbg7nW
         xaPx5oYvaJA/ifGRfRdDy4PrLDaR4b/6VrAJ2hRGbn+jBq2DUDZ42qXLgzVqzzQPK6lt
         RUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740149840; x=1740754640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoC2FL5as/gzDPsPktuw00do1BQmGVd/xU0hU5pjN2k=;
        b=gkp68KqbJBN4uEAfPugk5aFDcgbnx6wEdU8cVV3WbucM8cXAmos+kOEAmzs6MgbHtR
         esSa9aknul2TbkhbQuEoHPDcdfb9SUdUiX5h155oUy1axu7/tFr1Icl+zZf9cXdH5vJq
         oH/ODSa5hRHhH5PxTuRSIwDvabf8s6xCm3gJAs1cuRoJoaAar2hnagnI3nuOkOV3pnzC
         x5RajJtdNNq5kYzF9VD1tVWvG6Qi1Te9fUE1VG3hziN19t107Y+gCs8iQ591s2XRlFsc
         dyqD4PUlTTKnEnfC2fLEse3sLxkdH6iPs0myBu2paQwOhRcryhz7c8ZfiEnLxg9ZnXNH
         15Hw==
X-Gm-Message-State: AOJu0Ywb4ojMwsiXdM+9WTqmIviUZyso9gZpsi3WT189cTEu8r89yKcU
	YX12Igcu8yVrwatDtQuGyNrt2fmYdKhriOQBWhooFWXQQ1j4LT2P1cvE4jOUAibOjBLMB+bYJbI
	X
X-Gm-Gg: ASbGncvVSz0zd7n47PkYl3p0aphdYuYC4l49JccQ59XMK95bWQSmF00ZlUGmxT8mfgv
	1jva2ygGEh9+rtrdD6m5dlBfLGxGbDVEozBfgtaIy7dz+Sj6DL+yW0f4PTf+eAZCnWI7A41vcKw
	LM+uF6bt7toDElYNwDoFmyoK+YtcYbuJYZTId6hGh/Ky5TCGpaskINEdd0XFntsvHgxAFrpA0UO
	qPrmpbzKJKtwA2r/8HsQVa7x9FmLzMIVtBZeITRki6sLE4V7xffbmiQnXbyK4iHRgommEUNYs5/
	9wD9hAFYPlY3mQ==
X-Google-Smtp-Source: AGHT+IG5zeZfNQajaoHNUMrIzD97HRkcbEBCj3VNxO98/Xx2UMd8yWsZFWsFod/9hBsiiQ/8Th2zug==
X-Received: by 2002:a05:6000:2ac:b0:38f:221c:2c8e with SMTP id ffacd0b85a97d-38f6f3c506fmr3115700f8f.6.1740149839671;
        Fri, 21 Feb 2025 06:57:19 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258fc7ecsm23332438f8f.49.2025.02.21.06.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:57:19 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net
Subject: [PATCH v2 0/8] riscv: Unaligned access speed probing fixes and skipping
Date: Fri, 21 Feb 2025 15:57:19 +0100
Message-ID: <20250221145718.115076-10-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_065721_484042_F5D9417F 
X-CRM114-Status: GOOD (  15.47  )
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

The first six patches of this series are fixes and cleanups of the
unaligned access speed probing code. The next patch introduces a
kernel command line option that allows the probing to be skipped.
This command line option is a different approach than Jesse's [1].
[1] takes a cpu-list for a particular speed, supporting heterogeneous
platforms. With this approach, the kernel command line should only
be used for homogeneous platforms. [1] also only allowed 'fast' and
'slow' to be selected. This parameter also supports 'unsupported',
which could be useful for testing code paths gated on that. The final
patch adds the documentation.

(I'd be happy to split the fixes from the new skip support if we want to
discuss the skip support independently, but I want to base on the fixes
and I'm not sure if patchwork supports Based-on: $MESSAGE_ID/$LORE_URL
or not at the moment, so I'm just posting together for now in order to
be able to check for my patchwork green lights!)

[1] https://lore.kernel.org/linux-riscv/20240805173816.3722002-1-jesse@rivosinc.com/

Thanks,
drew


Andrew Jones (8):
  riscv: Annotate unaligned access init functions
  riscv: Fix riscv_online_cpu_vec
  riscv: Fix check_unaligned_access_all_cpus
  riscv: Change check_unaligned_access_speed_all_cpus to void
  riscv: Fix set up of cpu hotplug callbacks
  riscv: Fix set up of vector cpu hotplug callback
  riscv: Add parameter for skipping access speed tests
  Documentation/kernel-parameters: Add riscv unaligned speed parameters

 .../admin-guide/kernel-parameters.txt         |  16 ++
 arch/riscv/include/asm/cpufeature.h           |   4 +-
 arch/riscv/kernel/traps_misaligned.c          |  14 +-
 arch/riscv/kernel/unaligned_access_speed.c    | 212 +++++++++++-------
 4 files changed, 154 insertions(+), 92 deletions(-)

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
