Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCE0C36001
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 17:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lQ2YJBt/SOllktAM513qeMa8NNcl/QNGnQ8viY8rFZA=; b=hrbRGDRD+ApZ+Q
	zjDN0179sKrpmSWsEGu2nY0K+jC11Q1BwwKqv+owOzHNELXH+0QWhcjU/hA+dJ9fIIcpOBkZzk5Ot
	QPQi485c87UO7GmCsd2QPkzwmfM+qhhTwvk39ux8PX1jHp+yCtm05uhx3qI8Jc2Dtx0ZrDO+t6smD
	pM9+9nunCN8lrOM4c0GtqAmhg8dXXry2HEwzkNg+ERJmphhOMpR931gx07LvcNU7LccQHdfRyPAD8
	HNpL2DyLxrWGyEHUQcYNng/Mkt1bdMJvnEDyZDby1lVX9EXCnU08T4N4OOvOZcnyuycn4KSfG0Ku/
	2bSJCDWX1JzkyQINdKzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJjf-0000000CoFe-2v1Y;
	Thu, 20 Mar 2025 17:31:15 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJi2-0000000CnxZ-3xbO
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 17:29:36 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22359001f1aso27000915ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 10:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742491774; x=1743096574; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VOLJdCBk/78Wkkx/KXUXc/Jejf3oa/Cc0UGcw9XLKfM=;
        b=JQLklJOtVC5g1kH1xpQRal9yTag5sXgDcIQZ1DASQykmMSevmNmOZlUe8/fwnSC8mi
         7lh2UtLuqw1fNGdtVi2rhil7Z8xBuRyfw8wb0/8yqFdHKX0Bq6n66drsAGei1EdVQ00e
         pdwxeTvibHaibh3nPZ3UenbW4uYoHAa9HI/Fa2Z6E535Bln34o219bJImjUoxH14pP7K
         xAa3yHPhl7J/iGVGrPh0syWvjShaLc0I/nLUei8N/ntpESYADX+sNWzJlh1rfmXslbUP
         WUqH7myy0c1ogy5PsoPkrm5B8oXqcZUQZbFa1xc+YqWGWJkzrx7qPbx3cqiFVhuu9VnU
         REyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742491774; x=1743096574;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOLJdCBk/78Wkkx/KXUXc/Jejf3oa/Cc0UGcw9XLKfM=;
        b=oWzxj0C+cijcBIhLr4Qy5THhOrLD0B+GbfobpYip8dUhLGv03nTb8xdoCYyA7zHcgQ
         G3MHzdgJmbyrIH0Chr+ZMK0FIJOYCREb23Rvlfyk6jxJoUKnc12Zz0I4AQ2/TsS/jo0C
         RWqFtrRiUBaAMllYXi3EjJH9o+6z7lWr7g5cwxGcqsDDRaskReMt87yfP6hKSpFlWO0t
         vLLXlCkAAAWBR/e4NxO6kHUeszC3tkt6DiGSstSMsLU8Pd7OGxtq7O1fQVeEclwD20VE
         Hg+qo/53h+AQGttIjVi83qnCvvC1T1HVV+l+b5OVQ5TpQL84OK1MI6hzmbv7+D9h+jJ+
         x60Q==
X-Gm-Message-State: AOJu0Yzmu+9EBHsdEoiuuBB6lphWD/rN1lmEQXGC0L4lFvHJrLT/lN/5
	yBMzYnrrSrkJ4FWPracKz2O4D0qDtlwnn9OPIIawsLfSGo8s4PV1Ja1zLl4IRFg=
X-Gm-Gg: ASbGncuUdBHuVilQFuYqDi0bZnhRB9xlAoJ3v7LQH7UvzfP9fx3Gf/e4SxIjzAQlcyo
	DCsKJfA5RXacfDZf7aBiG7ZK2XsATQIO8T1bTavx5Gs1moLwCrWmcfubkDp9a53Nr9awRH31E7e
	F9a5UpAZ5drUe3GKbxAqZ1SB/2UeT/aHowTtDcbhnRq8Z0JdbXeEzI0azItapiF6myY8VWTeErR
	XyilTJxcr3VaNwkQSd3oqxbgHri1hUHB2D/W2pCKb3/GeKQoSRbqILHz0hEeHElseThX3uQjNuD
	T1heI1TAn9D+1L++R+VW2VRssUQEVyszRo7xNkpnCH7fc1jMq+eMeHL3yJeq
X-Google-Smtp-Source: AGHT+IFXuSVtt/SbthfzSQ7d/yin99emZxJRiizVTSUOUe3m9+sM1X8UQDxWeADHE07ExVrAEJGYsQ==
X-Received: by 2002:a17:902:e5ce:b0:224:8bf:6d81 with SMTP id d9443c01a7336-22780e1968dmr3057635ad.46.1742491773712;
        Thu, 20 Mar 2025 10:29:33 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f45994sm554075ad.81.2025.03.20.10.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 10:29:32 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v6 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
Date: Thu, 20 Mar 2025 10:29:20 -0700
Message-Id: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHBQ3GcC/3XNwW6DMAzG8Vepch6TcWIgPe09pqkawVl9KKkSF
 K2rePcFLkMTHP+f5J+fKnEUTup8eqrIWZKEsUTzclLu+jl+cSVDaYWABgxgFSW5fAn3SW7ywxc
 ep/ioqNOd0QZBI6lyeo/s5Xtl3z9KXyVNIT7WL7le1gUkqPEAzHUFlWG2RGSdH+AtSg5JRvfqw
 k0tZsatow8cLE7rkKyxOBB0O47eOubA0cXpGut101s2ut9xzNZpDxyzOp3zbQs4OLvj0J+jgQ4
 cKk5D0PY0eK8d/3Pmef4Fp6eT/tsBAAA=
X-Change-ID: 20240402-riscv_optimize_entry-583843420325
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2797; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=a8buKjZuVTHhVCVaVyShn58mf2Nkd71JLIuuvN814fY=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qdgBKJN1WZ8kWL3/nEz5zO7lCjc+zutHMHZU2l6u0vG
 7RtqzfuKGVhEONikBVTZOG51sDceke/7Kho2QSYOaxMIEMYuDgFYCISixgZZq9pOhD26vCzr4fX
 7Xh18IZ18jWF6RcO7KtT52crW/8uKILhv48Sb/bb/DkPLzx66Fw1+/PuvBcdEu1ipRP14vr/m9y
 T4wYA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_102935_194213_4C29A190 
X-CRM114-Status: GOOD (  10.62  )
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

Similar to commit 221a164035fd ("entry: Move
syscall_enter_from_user_mode() to header file"), move
syscall_exit_to_user_mode() to the header file as well.

Testing was done with the byte-unixbench [1] syscall benchmark (which
calls getpid) and QEMU. On riscv I measured a 7.09246% improvement, on
x86 a 2.98843% improvement, on loongarch a 6.07954% improvement, and on
s390 a 11.1328% improvement.

The Intel bot also reported "kernel test robot noticed a 1.9%
improvement of stress-ng.seek.ops_per_sec" [2]

Since this is on QEMU, I know these numbers are not perfect, but they
show a trend of general improvement across all architectures that use
the generic entry code.

[1] https://github.com/kdlucas/byte-unixbench
[2] https://lore.kernel.org/linux-riscv/202502051555.85ae6844-lkp@intel.com/

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v6:
- Update commit message of patch 4 to contain performance numbers
- Link to v5: https://lore.kernel.org/r/20250305-riscv_optimize_entry-v5-0-6507b5dff3ce@rivosinc.com

Changes in v5:
- Rebase on 6.14-rc5
- Link to v4: https://lore.kernel.org/r/20250127-riscv_optimize_entry-v4-0-868cf7702dc9@rivosinc.com

Changes in v4:
- I had messed up warning for ct_state() on rebase, correct that issue
- Link to v3: https://lore.kernel.org/r/20250124-riscv_optimize_entry-v3-0-869f36b9e43b@rivosinc.com

Changes in v3:
- Fixup comment to properly reflect args (Alex)
- Fix prototypes for loongarch (Huacai)
- Link to v2: https://lore.kernel.org/r/20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com

Changes in v2:
- Fixup compilation issues for loongarch
- Fixup compilation issues with CONFIG_CONTEXT_TRACKING_USER
- Link to v1: https://lore.kernel.org/r/20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com

---
Charlie Jenkins (4):
      riscv: entry: Convert ret_from_fork() to C
      riscv: entry: Split ret_from_fork() into user and kernel
      LoongArch: entry: Migrate ret_from_fork() to C
      entry: Inline syscall_exit_to_user_mode()

 arch/loongarch/include/asm/asm-prototypes.h |  8 +++++
 arch/loongarch/kernel/entry.S               | 22 ++++++-------
 arch/loongarch/kernel/process.c             | 33 +++++++++++++++----
 arch/riscv/include/asm/asm-prototypes.h     |  2 ++
 arch/riscv/kernel/entry.S                   | 20 +++++++-----
 arch/riscv/kernel/process.c                 | 21 +++++++++++--
 include/linux/entry-common.h                | 43 +++++++++++++++++++++++--
 kernel/entry/common.c                       | 49 +----------------------------
 8 files changed, 119 insertions(+), 79 deletions(-)
---
base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
change-id: 20240402-riscv_optimize_entry-583843420325
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
