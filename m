Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB819C6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 13:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XG4iHWn26aVq9IFF6IF4l9RuW9H8zwPwhoGs6VHpPmc=; b=UsNi29jPNrSO6V
	pHfXEtbn4ZNb5LNtIDqZZ5rGEhYGyig+9Vs9gzfQ6cFvzl4EML9HjaS0q9Avl1oVagL/Sb+bPYNw3
	aTg2gQQSDJhdG5xpCyNf8LBpBRS27uJ5XcO6zeSaLQOz7uxFqKbo8JArFYXJu2+BMB39Kr1peWpn1
	Q6znGTBK9j3nY35lV2cBU3atQvKpioNIcvHvkddCAZdfoiGMFpgo1vXFZo/PhJilBgbn2ANJGvZuA
	Tr851XsUxjozgZro1SclDrJmXEMRYvLQE8FYNrYIfqXHVTISJC3HAzZZa9oQyO0czPL2/8F9hvMXe
	KFxO4Q6tUoblN+bbTJuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcnl4-00GXqr-0f;
	Thu, 16 Mar 2023 13:35:06 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcnl2-00GXpR-0B
	for linux-riscv@bombadil.infradead.org;
	Thu, 16 Mar 2023 13:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=yb0JNi6cRDb5cM5WC9CEwD00CUTLKwtDAX0RcxE9c8c=; b=b53vbKAYlfpWHOuuwMSqCT0iyn
	aAN+Mn+PW4aKqsLd9xa6oKnxk2ogtZPe4/xJ85OVipgFju0SSc0uPKPo6NK5tw2oGLhKqWKJs0JWN
	+vTxolh2zF1uGXxMQ1q/kMRHEC9l8GMdRuRsjQFiMkUNl8o86byGEBZQJ6KL2TEWouR3MFRb0TrNw
	GOT+c1mgjY2pKbgVIX5d/DFIw8yVg3HnoIJ2WALIdKUxBcZrq5X7iPyuxCMEOQ0iOh4r+FbgXuz3J
	uNnP+rexJlWV38LHA0X4UW6leVuAOWp/THFS9VrppGSIUsenV8wcfJyaA3QdAef/PcKNHepNeZuzq
	h9u6c0sw==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcnTt-002Roh-0V
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 13:17:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id k25-20020a7bc419000000b003ed23114fa7so3147703wmi.4
        for <linux-riscv@lists.infradead.org>; Thu, 16 Mar 2023 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678972636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yb0JNi6cRDb5cM5WC9CEwD00CUTLKwtDAX0RcxE9c8c=;
        b=2Ev7aL6Z6zhWHuGqPE5WRugL+grtCgf1Rw+DE5yPncJqWsJZHaCBhlqpfyHHzrwI1D
         IUpoT5Oj2+AxeGLsJn0E0MGbjKM4v8gxIxDStGUIXy02nc+EgqABDoYG/hOTYXCiYSOG
         iJXRweRTFhgYGpwr8xQprpP8UgTS76aclNF9Q88Vn0eLPUVtmLtJpd6cV7LoVTHbBvrh
         1q5XhWPVPnaXpKPzJ2vWiPfcyS8XnUsHIEUE5rYpgUMCG70N6PMSUo4+vx3GXuGIPvt/
         V4QCyObIV+J3zkqwYafQgaQwhM6mcbbbhcaBTGh3Ec5hqKIhtCwzq3Y8iM8EHnAJ0VUh
         gAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678972636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yb0JNi6cRDb5cM5WC9CEwD00CUTLKwtDAX0RcxE9c8c=;
        b=tsoIgo9H8XxeXozJjk6f6AHUPEcdOKEf2aRe6rHW2nv9iSAv/uwZcDv8HOwwYBDzTX
         fw/APg8UrUKbf81egQmRAk5QgqR8g9xVtoEQj1v/erjYeJu85J/+IeWxqHZ66+h0QNgO
         VOvWBpLMn8p7zPcefreEaXtVAh9Q9sNi7vPA69erqaaaSYwwRBA6j3CrCFBr/CvvCUlj
         oYWjMvMbjxU/Ua0SgDIQ0FdJBTVCVu8oxK5fMDt4GMgZdyS/Q6lfN5SF//nsXgfJHHwF
         /+6URGXgBjfAVnoEGe77I8JT95idOHVlRRfqcyyrbs6FI/rsylTH9BMxBHTiTIHAk3vq
         QMzQ==
X-Gm-Message-State: AO0yUKU8TKu/eSh4Qlkny92wbdopp8EdmW2TB9CUU7V3AxsbY0ExPv4J
	vK6BrBoqhEt2w8dvIT7iW1fMVw==
X-Google-Smtp-Source: AK7set/fhVDeuPDPVeUXVE63TtFOQa0R+UvB04ejBiBb1VAkOz3jRjT1WOxKNz9X4Jff53YqrdofPA==
X-Received: by 2002:a7b:ca41:0:b0:3ea:f75d:4626 with SMTP id m1-20020a7bca41000000b003eaf75d4626mr21011181wml.38.1678972636633;
        Thu, 16 Mar 2023 06:17:16 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (238.174.185.81.rev.sfr.net. [81.185.174.238])
        by smtp.gmail.com with ESMTPSA id a6-20020a1cf006000000b003ed4f6c6234sm1963364wmb.23.2023.03.16.06.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 06:17:16 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v8 0/4] riscv: Use PUD/P4D/PGD pages for the linear mapping
Date: Thu, 16 Mar 2023 14:17:07 +0100
Message-Id: <20230316131711.1284451-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_131721_458860_7B12A91F 
X-CRM114-Status: GOOD (  16.61  )
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

This patchset intends to improve tlb utilization by using hugepages for
the linear mapping.

As reported by Anup in v6, when STRICT_KERNEL_RWX is enabled, we must
take care of isolating the kernel text and rodata so that they are not
mapped with a PUD mapping which would then assign wrong permissions to
the whole region: it is achieved by introducing a new memblock API.

Another patch makes use of this new API in arm64 which used some sort of
hack to solve this issue: it was built/boot tested successfully.

base-commit-tag: v6.3-rc1

v8:
- Fix rv32, as reported by Anup
- Do not modify memblock_isolate_range and fixes comment, as suggested by Mike
- Use the new memblock API for crash kernel too in arm64, as suggested by Andrew
- Fix arm64 double mapping (which to me did not work in v7), but ends up not
  being pretty at all, will wait for comments from arm64 reviewers, but
  this patch can easily be dropped if they do not want it.

v7:
- Fix Anup bug report by introducing memblock_isolate_memory which
  allows us to split the memblock mappings and then avoid to map the
  the PUD which contains the kernel as read only
- Add a patch to arm64 to use this newly introduced API

v6:
- quiet LLVM warning by casting phys_ram_base into an unsigned long

v5:
- Fix nommu builds by getting rid of riscv_pfn_base in patch 1, thanks
  Conor
- Add RB from Andrew

v4:
- Rebase on top of v6.2-rc3, as noted by Conor
- Add Acked-by Rob

v3:
- Change the comment about initrd_start VA conversion so that it fits
  ARM64 and RISCV64 (and others in the future if needed), as suggested
  by Rob

v2:
- Add a comment on why RISCV64 does not need to set initrd_start/end that
  early in the boot process, as asked by Rob

Alexandre Ghiti (4):
  riscv: Get rid of riscv_pfn_base variable
  mm: Introduce memblock_isolate_memory
  arm64: Make use of memblock_isolate_memory for the linear mapping
  riscv: Use PUD/P4D/PGD pages for the linear mapping

 arch/arm64/mm/mmu.c           | 25 +++++++++++------
 arch/riscv/include/asm/page.h | 19 +++++++++++--
 arch/riscv/mm/init.c          | 53 ++++++++++++++++++++++++++++-------
 arch/riscv/mm/physaddr.c      | 16 +++++++++++
 drivers/of/fdt.c              | 11 ++++----
 include/linux/memblock.h      |  1 +
 mm/memblock.c                 | 20 +++++++++++++
 7 files changed, 119 insertions(+), 26 deletions(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
