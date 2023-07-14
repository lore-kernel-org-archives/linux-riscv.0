Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAE3C001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 00:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V92l50CiJ1sCsWj2ocpiZzebp5KggDSlkWw9gI22KWw=; b=WeyrhMHYgH2uLU
	T94ckHPbOGcHuxXsupbJ25kbiC6evhzaFFS1qixJrr3bhekINFeJBPby3Ye0R2yFIctr1on1c2VAv
	ZloTWAVlJF+1feeqx6DvWKhz+C/lN2p1Jt+bxfUZ0FVgPXg7RrCsQoHHownPG3D08TI1KUCr6U/8p
	uNZ2DbtdCItFwxM9jhh3o2TJpcmLbge3k9xoQU69b7b0TnIz2V2doEjMV89o/DwsWkFh7eISj8x7T
	acejNV/Nwvwhggxm5fLVwXe4tADh9/gxQDul24N9bjfpyST0G9lkiPgznMOagR3QW0b4C6jvmCYoH
	IUCmq0D3cCHSXxYs0FYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK6Sm-004cYD-1u;
	Fri, 14 Jul 2023 00:15:12 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK6Sk-004cWh-0X
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 00:15:11 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-666eb03457cso937823b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 17:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689293709; x=1689898509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iY0BqE22+vH8ihdQ5F+U3lQTo4OY0Ve5Zo6wbRWfHfc=;
        b=xExIMHzLTtkjN2LFQngS3OX4jDs1xLdIX7r/tiDx0kppQfQRkPMYGwyfuGwrBTa86a
         XoaNrcUcmG5pmtq3t+bqbkNwiHPqfObctew9lUGCvXVSRZ5ZMzwxuDl5bh0kXZqCOeN/
         2KOkMuhJYkV6QfPobPU9mX56qewrBddlJ17DJjsRmikAwwn6WVy6MHjfUpM665kqgqnx
         8Vd77tSJfClsrB+dbBunC3han9WPucnmhgEbe2AxB1x5RWqedcL/TQmo7JAbJuXl1Q+J
         +JuGlcjr4IzBotD3ZK9zOhKx+93UelIHVMWCiiWjS83cS6p52MDULRTAs1+X2jnehbH9
         5cQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689293709; x=1689898509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iY0BqE22+vH8ihdQ5F+U3lQTo4OY0Ve5Zo6wbRWfHfc=;
        b=BdLcrOklEyE3TceXF96julUErJ25fspE9HsoWKq2IrLzq1JoBXLzphkiTvcbRlMRtJ
         x63FnNg0WacDveD/45S4C0/lmsruZxo8clTm/vP17oZ7DqdMtrAIZJPdY1ertdD75rFP
         wd9lq5zaEPz4lhJEV0iXF3znjWWZ2nxK/ZA79xXXJMz5TzEqxbfINmGzi0qlQlzsBuLU
         D96ICXNitXujqMT3A2LOLOJZs+hKactUMxDul1Clkuhu1balw7xv85gpnuirAX3m5r+Y
         WQaZq2IZ/CpfW9Nof28hnCvGgqrqryTgWPAFR55vHxtjCki9JA4zr2OoMhKT6ujJCD9/
         ZhHQ==
X-Gm-Message-State: ABy/qLb7K6Wf0FhcryyWhUDrRgNvpSXs3cs6D0AfVXMrOxhxdR3uJg/Y
	KSvKlkGRC14pHTfo634wd2RRYg==
X-Google-Smtp-Source: APBJJlE/NehJK/yZ31QQ51ruFcoOUZ8Dr5gN8omHKM50vUTZXpJ3oVnR2nhUcvBJtDwEUljTcHiqAg==
X-Received: by 2002:a05:6a00:2d84:b0:666:8cbb:6e0f with SMTP id fb4-20020a056a002d8400b006668cbb6e0fmr3042793pfb.3.1689293708687;
        Thu, 13 Jul 2023 17:15:08 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id x25-20020aa793b9000000b00673e652985esm5938107pff.44.2023.07.13.17.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 17:15:08 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: charlie@rivosinc.com,
	conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@rivosinc.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	konstantin@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	mick@ics.forth.gr,
	jrtc27@jrtc27.com,
	rdunlap@infradead.org,
	alexghiti@rivosinc.com
Subject: [PATCH v5 4/4] RISC-V: mm: Document mmap changes
Date: Thu, 13 Jul 2023 17:14:03 -0700
Message-ID: <20230714001430.75798-5-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714001430.75798-1-charlie@rivosinc.com>
References: <20230714001430.75798-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_171510_208874_A93D3B35 
X-CRM114-Status: GOOD (  11.66  )
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

The behavior of mmap is modified with this patch series, so explain the
changes to the mmap hint address behavior.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/riscv/vm-layout.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
index 5462c84f4723..892412b91300 100644
--- a/Documentation/riscv/vm-layout.rst
+++ b/Documentation/riscv/vm-layout.rst
@@ -133,3 +133,25 @@ RISC-V Linux Kernel SV57
    ffffffff00000000 |  -4     GB | ffffffff7fffffff |    2 GB | modules, BPF
    ffffffff80000000 |  -2     GB | ffffffffffffffff |    2 GB | kernel
   __________________|____________|__________________|_________|____________________________________________________________
+
+
+Userspace VAs
+--------------------
+To maintain compatibility with software that relies on the VA space with a
+maximum of 48 bits the kernel will, by default, return virtual addresses to
+userspace from a 48-bit range (sv48). This default behavior is achieved by
+passing 0 into the hint address parameter of mmap. On CPUs with an address space
+smaller than sv48, the CPU maximum supported address space will be the default.
+
+Software can "opt-in" to receiving VAs from another VA space by providing
+a hint address to mmap. A call to mmap is guaranteed to return an address
+that will not override the unset left-aligned bits in the hint address,
+unless there is no space left in the address space. If there is no space
+available in the requested address space, an address in the next smallest
+available address space will be returned.
+
+For example, in order to obtain 48-bit VA space, a hint address greater than
+:code:`1 << 38` must be provided. Note that this is 38 due to sv39 userspace
+ending at :code:`1 << 38` and the addresses beyond this are reserved for the
+kernel. Similarly, to obtain 57-bit VA space addresses, a hint address greater
+than or equal to :code:`1 << 47` must be provided.
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
