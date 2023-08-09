Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB499C001B0
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 23:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CEoXoKEPs3WoBxPX7hvBvQlbnhxr8g+llYyQLNQNmJc=; b=D9sTopajVgK5mX
	2yFAunGrDA+2Pr9/750kG+WekklYg7U5qI1+O3GPco4oGvPYCcR2zrLE0Vfl2LzRNDP+dbkPSTK2p
	JsvqwqkSo9HCSzCUKmmVmveKCOBXog24uHjwxCo414XEpDYahgNl4LJKx6CIvXtNm8di39Gvq0Af/
	kjYICI9LVaYsui4UrJu2zRxNu5VNpAiQpbbYpmsdxVDDAZa44iKeqDq/uB2BbqNzUFD5riIIdv88d
	MyeGvvkCugU3IQ94NiMfI5MUbGVrOh14l3Cf7Knftd6ra7gzC02DdC5bTugQJbg8FrLayroh5CHoI
	sc/RNUTH7CJ2tdpdQY9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTsXa-0063dl-32;
	Wed, 09 Aug 2023 23:24:34 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTsXW-0063YI-08
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 23:24:32 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-686d8c8fc65so262207b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 16:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691623467; x=1692228267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tar+fwRF9EwexnZBlGXBQ+bino7OPSUOa9FVKEDgW8=;
        b=qdQX3WNwo4sWt4WkjKnJ08HLG31URbRoXVf7H5AnZ3n4OTaa437cOko2jjYggYBNx3
         Uqtl8hjdOaQ5sFdI1pNdsg5WlvudRipmfEHH3jC3kSBPVvsl7sDCBIi9hJH3htjd+Scj
         +x4lyW8BfGjDQRdW6mPcEQh967lWkyY2MfrU8iYYuoqSur4+c4vzP8UjeTWZVpmWsXTi
         GrPLP1dKdTJl7/hWM1px5eML9DIPSblOF40Phwg5YuT2IX5LPipDqccZemKALDv8ntos
         VpDwK38TgYbp1DMAPUyfGhk2yDGhNkoAIbI8xAeXULhQkWloI08NyYlwSj+DJ7tiDJ+v
         bzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691623467; x=1692228267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tar+fwRF9EwexnZBlGXBQ+bino7OPSUOa9FVKEDgW8=;
        b=UzlrMknU9HFAz36Qt9g8jLqwNXPh3iAOEPfYRwOd71rsiFqB3gGAS/neiGcFD/HylQ
         nU0cmXyaWE0wfNnaaE78/BBVSJXx2WE2th5o0oyiUoTpsyx3bDfVLxFwIIUKyGFfemVU
         6mEU1JuWZc0s670YrnBJHMMRC0hEnYZD4jdIQ4bvmX9VYRbzF4MbK0lXYOvm+HcmQXjy
         HE2Ud0tKe0yaVvwtKfBcAdKZm2lRon6m53LR9zIfVGPdpok6MB+MmitQ2P0ftbKL966E
         bgorEgTfFBLZK1m60qWaWMzA4wLVXDZCTymg7ItHHcauLotuyZW7aGVmKfmh9SPdJx8I
         RvQg==
X-Gm-Message-State: AOJu0YyRZOZG+7cmd5fO3LIJqq2jsa3ZoyxTbYAvE9lx2xff0B5WB0I4
	ZfpcuyScEZtbf/ZGwsdJrK8gsdai/R7cEsjot10=
X-Google-Smtp-Source: AGHT+IHPggFTtnxabsF/jkLvnF3G7KP5USE4CizFGjoAWFxir/OOf3x64PmOQQ970Z2IhxBU3MEknw==
X-Received: by 2002:a05:6a20:12c2:b0:131:4808:d5a1 with SMTP id v2-20020a056a2012c200b001314808d5a1mr781717pzg.28.1691623467045;
        Wed, 09 Aug 2023 16:24:27 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id l18-20020a170902d35200b001b54d064a4bsm82765plk.259.2023.08.09.16.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 16:24:26 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
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
Subject: [PATCH v10 4/4] RISC-V: mm: Document mmap changes
Date: Wed,  9 Aug 2023 16:22:04 -0700
Message-ID: <20230809232218.849726-5-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809232218.849726-1-charlie@rivosinc.com>
References: <20230809232218.849726-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_162430_085690_1D9AD316 
X-CRM114-Status: GOOD (  12.36  )
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
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/riscv/vm-layout.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
index 5462c84f4723..69ff6da1dbf8 100644
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
+a hint address to mmap. A hint address passed to mmap will cause the largest
+address space that fits entirely into the hint to be used, unless there is no
+space left in the address space. If there is no space available in the requested
+address space, an address in the next smallest available address space will be
+returned.
+
+For example, in order to obtain 48-bit VA space, a hint address greater than
+:code:`1 << 47` must be provided. Note that this is 47 due to sv48 userspace
+ending at :code:`1 << 47` and the addresses beyond this are reserved for the
+kernel. Similarly, to obtain 57-bit VA space addresses, a hint address greater
+than or equal to :code:`1 << 56` must be provided.
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
