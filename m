Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B3CC531D0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 12:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wqn9uRS8Hxg5DC5h1kBWJ6MvbG97Ap6DJuNmLRr7w8Q=; b=TkpqtuRColuZ2B
	k4x2se8K038uAZ0FWyu2V930FaGWuosi+5w9sUGzn7fsP0KEZrvMv+FfphQ/UsnWW3POHcbV0Fjz0
	5QFYwpL+m43aeJKpmwOo57e9+rJPz1IjMcmQd+pnsbn0HAgXrSRyymK/VVqY/o/m+mbXu0/ZpgGSp
	4o2J+etaeDhimY+Z9jatRMaDFgCPVOVkfJSSEg72yfQFgrJm3qtuwt2GxnvZM+P5KbiNc3QCuqmAw
	M2MDJEj5qHUUV6GE6z98dFdSaagav3INH2TrlSD76yNCNQNWfYn2dKXPKceN//QtBODZaxw+LXXVl
	8FmxXq9pP+CDOE2IhWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKTU-00000002hsx-0GkJ;
	Mon, 27 Jul 2026 12:30:28 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKTQ-00000002hr9-149c
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 12:30:26 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2cc80544c74so7915145ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 05:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785155423; x=1785760223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zZDUuhSz6sxGN/m5AK+s00UCMOMQBfNugawXzRdDcys=;
        b=oexyWWMQoQCSMIig0EHsL+CwQc+frScap4EX8Ijz72bWuZ4t5/Y9bmoXmlZxxrJ+El
         kMbgYGd8G0FaJqtCM+qEnmH3+/nxl4MkrQoSRqFc+TNebTbTwk8/L2uMJhzV+tkWxjhX
         0VHTSdtkefIhXng+PHJE/M2JaZpkCAJmZQr/McQVjZ8zI/Yw0tlV00yzfde+brtUsmer
         cIuF3tdbZP+SUNl2XruINgWYuadWCNOtFDTufZMNPFMb58ubKWc+S+6RirevePJclnvX
         6aDeRwFC4uB9UGWGskXwrH3xzXhak2dnxQ6ScMqBz94kHSUSq24fc3Kp8OjqpFZjJL2e
         Ud4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155423; x=1785760223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZDUuhSz6sxGN/m5AK+s00UCMOMQBfNugawXzRdDcys=;
        b=ae6f0YU27E2MuK6evw60AP8LUug84RjwnwjOW6MOMRi7s8wahaQrFDB5iMMXfAxq+s
         mypfME/6vCpLYweAXJEXfZENs5d0FvmoOl2+Go1EWYjJWF/u6v8taqEJ92j+MsgBbduU
         etlOlEMCikbY32IOFKRQ0x6TzU9678d8grHZWItEbfSa42QvB6bzLN47Dta5lTIepqiT
         JsMppaujrwM1vtSwNJqORZYmTeA7XzVMhq1sXSviZceXVPbGlj4aBqtXtRXFosylO35O
         /PqG7qBIGGI0cVPxSpxKuoIAilPR0+/3VixVj7iSE3fXQ1x4b30SZUo5hdRQAPQU+J2C
         J+kg==
X-Forwarded-Encrypted: i=1; AHgh+RrcEB7v6bz2wgU+eqO+f9t62PFuKxStvaQ39W+Djo1Dbten+qBrY0zOIEMZttC7ykQOmNLWWBRu1ySDGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnEr9tmhXw1O1V4uMGt1bqpDVl+CjLnYeCAi+G4HBmVqG2wpan
	MYuKnD30VnmaxKfj/UE5IN0G/h74EerRJ7agWjhs4GS2u5KEK6J1xAgW
X-Gm-Gg: AR+sD13pND/A6Qr3QXh5kGYkat2a8jNjRpnIjEdIQ/jnWZpao1hxbZIQcHgmqoiO+ar
	kmzoh1iE1Jo5/mgwR1QjqhcC1Dq1uItPvmgGF8cCmzoaM+42a6PV7jxJPY+7Fsyz7gApr0JHhY9
	nwt/4GwWD9/JDhMpicMyKRxZ1zM/f1Cf2emm4r8aPmMGmT0cZny39/M55hDRGLMaIbLdtrCwTFf
	epz9wwWNlMM5xgeTJ/KiLGKKpKPL+QjE64TMfCRAqwdkxX8gHU2ceaT0CCffLYo6sS62r+OUiQU
	gMFLdl+mil2Fjw1O8Xr9EXUmym+2XxyvIBd/3/0A0zdzDl13T0w64eMA7cO6dmT9O5ZwjsOm3Rl
	LHayYxFycoUIOBoNDdFvzaOziBX5hpjDQh7ZLmmUehVBHvLv3dS8CJ6xzBUott8Ea9YwrIi62ga
	rkxi2Qow==
X-Received: by 2002:a17:903:2446:b0:2c9:97a8:afef with SMTP id d9443c01a7336-2cfde8673a4mr76943665ad.40.1785155422902;
        Mon, 27 Jul 2026 05:30:22 -0700 (PDT)
Received: from wud.. ([218.194.32.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfe1ab9c71sm30679775ad.73.2026.07.27.05.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:30:22 -0700 (PDT)
From: "Dylan.Wu" <fredwudi0305@gmail.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	anup@brainfault.org
Cc: alex@ghiti.fr,
	atish.patra@linux.dev,
	zhouquan@iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dylan.Wu" <fredwudi0305@gmail.com>
Subject: [PATCH v2 0/3] riscv: ptdump: Refactor for KVM gstage ptdump support
Date: Mon, 27 Jul 2026 08:30:10 -0400
Message-Id: <20260727123013.118984-1-fredwudi0305@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_053024_299644_5D95CD6A 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is v2 of the series to add KVM gstage ptdump support for RISC-V.

Changes from v1 (https://lore.kernel.org/linux-riscv/20260701085030.124579-1-fredwudi0305@gmail.com/):
  - Split patch 1 into two patches as requested by Paul Walmsley:
    * Patch 1/3: Create ptdump.h header, move declarations there,
                 and export note_page()
    * Patch 2/3: Make attribute parsing use per-level bits configuration,
                 and rename local pg_level[] to kernel_pg_levels[]
  - Added CONFIG_PTDUMP_GSTAGE_DEBUGFS Kconfig option
  - Replaced custom walk logic with ptdump_walk_pgd() reuse
  - Removed incorrect copyright headers from arch/riscv/kvm/ptdump.c
  - Fixed Makefile ordering (alphabetical, under conditional Kconfig)

Dylan.Wu (3):
  riscv: ptdump: Create ptdump.h and move declarations
  riscv: ptdump: Use per-level attribute bits for parsing
  KVM: riscv: Register ptdump with debugfs on guest creation

 arch/riscv/include/asm/ptdump.h |  42 +++++
 arch/riscv/kvm/Kconfig          |  15 ++
 arch/riscv/kvm/Makefile         |   1 +
 arch/riscv/kvm/ptdump.c         | 276 ++++++++++++++++++++++++++++++++
 arch/riscv/mm/ptdump.c          | 106 +++++-------
 5 files changed, 376 insertions(+), 64 deletions(-)
 create mode 100644 arch/riscv/include/asm/ptdump.h
 create mode 100644 arch/riscv/kvm/ptdump.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
