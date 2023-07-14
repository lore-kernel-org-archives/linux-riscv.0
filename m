Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2200C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 16:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V92l50CiJ1sCsWj2ocpiZzebp5KggDSlkWw9gI22KWw=; b=UuHtCOa0eB4oGu
	cVHHcRsFi01LQqvP6Q7EP16vzkfcu6BP1RuZCbO2X18Si2CHCSVm/FlLvKKaOBw8WNNa4kFkTPWz7
	gnqzamIYXnOx673irEThTmF03oXfVVoWFP3QJjrCr+cPlJDWub2uSSp7zLdzF31VPaBOuPM2+b9bD
	BzClaiXlIH9JDAeVW/NVNomiia69vA1rtjwX2Lofv4hBEGPbsSJpEG5Ui+u2W7cXiB1Y+8vBfVsGY
	qxuqqc/mjLk/bTHbVBKO51X7jUEXR736sr6c4sFj88FTFNWdKmgcfWWgJeNpZYgZFpjBIxC8PHjYJ
	672BcSsT1xCse0ayWSGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKM5R-006hcZ-0i;
	Fri, 14 Jul 2023 16:56:09 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKM5L-006hVn-1U
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 16:56:06 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b9ecf0cb4cso13055885ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 09:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689353761; x=1689958561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iY0BqE22+vH8ihdQ5F+U3lQTo4OY0Ve5Zo6wbRWfHfc=;
        b=ECP+dufnQHsYRxuqgPOTnUSVvIo4ePBLAYzcr/uPu+86xHXRbq559fnQxM4loYgYii
         9q/1Ih5sS/4Nz4IV5XKxNs5M7eNK2wNCyxQPv1SoVXWcMmwbEpzI74Jdn1u5Cczfadul
         jSHTTTzLM34mcqiVS7oXLHnW//LVLHHdygX3s6M81zVFp+Lmjk+KCS/Jt+2NFtsSEwsS
         hM2QAfrxJ4G7EMIqqaMGTDm7wAokuRc+ct0d85q54+SDh5Xc1EJl+Md33rZrNOHTixiq
         BSKIqdZJu/lQ2SebCzY5jdSZwDdpY3w9ELYszKlZ96Lgs1OHBPPpkiA+q8wz6OTq9PHQ
         LbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689353761; x=1689958561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iY0BqE22+vH8ihdQ5F+U3lQTo4OY0Ve5Zo6wbRWfHfc=;
        b=CZM2Kxm0EHU4/GdO0+QnmyPlYfmYpgBkx+jHhTlEYMGTIIq7HWlRUBUKL+Ir7+kEOA
         qTHl7AQD6Z4zbMWOwsucZ5UJgPonxP5k5quxxtNepPFbe6V9FkBZt7Nd1UCUTfDbA5CN
         dg+EjFmug+1HdoeWsdc4+hSsr705yIDfQp+g+64VB2FZdty5AO5T6ZZnjznpZVSz8wU/
         XqkWF3yZ/BbNJtR1AYOphIU9hozJ9GC1roI9iadDirdyqLknd/rTOu933iVPnVrYgg3D
         D1Z8GtyVayklm21uzYDo0MCI+VuWkD4paKMlrs6IliGwm7lWU036c1girCZr6OOm9zx0
         kL1A==
X-Gm-Message-State: ABy/qLY2FgYunl35DVhmMs4c6NY5Q8UFtsVlhbXgqQcfDXs8DvEJ0rxf
	9SrU2hq/7u+HXggOR6xnN08LZV+yrMtksyZMe3I=
X-Google-Smtp-Source: APBJJlFsvoNdVZTC5wGAHNOb7OEsPFjJFgSI3IvikXJ3ahp3VMzgfUgYU2kfHESUML2FBAHGPHaiUA==
X-Received: by 2002:a17:903:1248:b0:1b3:d11c:23ca with SMTP id u8-20020a170903124800b001b3d11c23camr4729934plh.8.1689353761143;
        Fri, 14 Jul 2023 09:56:01 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id s8-20020a170902b18800b001b694140d96sm8008081plr.170.2023.07.14.09.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 09:56:00 -0700 (PDT)
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
Subject: [PATCH v6 4/4] RISC-V: mm: Document mmap changes
Date: Fri, 14 Jul 2023 09:54:52 -0700
Message-ID: <20230714165508.94561-5-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714165508.94561-1-charlie@rivosinc.com>
References: <20230714165508.94561-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_095603_527598_CE3128EB 
X-CRM114-Status: GOOD (  11.75  )
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
