Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD90C04FDF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 01:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CEoXoKEPs3WoBxPX7hvBvQlbnhxr8g+llYyQLNQNmJc=; b=jVhCmOP0aJj2K8
	53MeMm8QX0d4+OGiv6rgXdbAY2lVpviKO7ABoRS1Bruj1pCAYQ5+4CyTmImIqwc06Ec1vcwhtPwIe
	7bfIeGMBfu2Gxjs/C6XXRHhIT2cIGZCpYJGug+ot0KejApgCsGtUDXBUyPvC4nYxiSu3u4jQW60/v
	mleW6pV2Q8Ef2+tTBVImxRyt0fG2l16VlMWmwGML6FSCiA7U9agl3jYZbHpW3j1mqvrbEsjaTbPqO
	xG6f0ztCDc3VFOSeFT+v5q1b7+VAe4M7DptkVdn29ShPypEePA0MKaMkrHdNy/w6Jo7hYDqVaM7WE
	aoIwVE4O4I8xZ8TuXi6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYNy-003q8K-2X;
	Wed, 09 Aug 2023 01:53:18 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYNt-003q3I-15
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 01:53:15 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bc1c1c68e2so40592695ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 18:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691545992; x=1692150792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tar+fwRF9EwexnZBlGXBQ+bino7OPSUOa9FVKEDgW8=;
        b=FPpY5cIUXnip2ZGbpSphNOYtcmoz+9UqNCzoKTIuGrXSltzFcKRrlt8IZVpkHLRqCx
         OnkTugPfEWDKKQRJ75G2J1aJXt6PH8fts5QVkJJs8njOPLx6pNBBDKHzo/kPhqxS0sx3
         1HU8/tEpAVmLFR+F4zwPNJwDwa/GS5jdzeVtMhkd3NlduxYlQA9dfzjF/ys4sjj6OEtk
         sjDMhjLy6jjBKzFs07exQfX4lKo012NsKC4Zu68gj0Uv/D7Nb/c/EwcN8oQMkTg6va+w
         mYmQCyjU8OGyh+PyGz8lSNWVUIf8yU596h/YkYk7J+SNhMSNxobFIMZoGtxQE5T5cv3X
         /BDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691545992; x=1692150792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tar+fwRF9EwexnZBlGXBQ+bino7OPSUOa9FVKEDgW8=;
        b=UIsbikPixaESgBOg9jeupSsvBWxsNGTolDJ3RM1YpxCxSrx3GbCRCmGOBTDwOAk6A8
         s/nz9ABcaUwHoamhtzm/siWTGDI99cdkFu0bbCQhKnrh3mGWGa5A89EVPmHFeyU0WAb3
         i7LE4sIssYfUnEHM655vrSxxp4AKIWwdbWH/1bCoczFVBfBqWWwrYGuVzFhPHYJfbBbU
         89PXUL3HYiFa0/oEruU3MiN5kvoyeXJgEFdG9V1V8hvI1GHRqfkpR3tFh592zE8FkPil
         0gSddeHBJ2QXH/T6qNh4FUEqIbQLSC9IoNZXwTbVKdMZMkhdsaO7Mft5iCJ8ch746SAb
         V7lg==
X-Gm-Message-State: AOJu0Ywm9LM1iCFGYQdDalscGw/5WR7PW6ul7YsUDYKvExDFuEzLNf0p
	eEBdoUIuXEyjxXUEMCxk1i6ompKriClpLIRZdtI=
X-Google-Smtp-Source: AGHT+IGZcbmVCa5ZDQZDqMBC5RXy8ZlAEnBSQVfL2GCWuQwF+OUfXTklfpU8ydkeXzNNensTQj2vcA==
X-Received: by 2002:a17:903:1207:b0:1b8:6850:c3c4 with SMTP id l7-20020a170903120700b001b86850c3c4mr1594061plh.22.1691545992539;
        Tue, 08 Aug 2023 18:53:12 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id bj7-20020a170902850700b001b87bedcc6fsm9657591plb.93.2023.08.08.18.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 18:53:12 -0700 (PDT)
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
Subject: [PATCH v9 4/4] RISC-V: mm: Document mmap changes
Date: Tue,  8 Aug 2023 18:51:10 -0700
Message-Id: <20230809015110.3290774-5-charlie@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230809015110.3290774-1-charlie@rivosinc.com>
References: <20230809015110.3290774-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_185313_404166_9104A3E0 
X-CRM114-Status: GOOD (  12.46  )
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
