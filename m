Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD6FC61D97
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 23:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s3Z0ILJqRx9EGka9BTPFwvbi5WOvGGIolN2MJCiKiu8=; b=aJIgmCzTPPBWgq
	2F3iJ0VXXnHFWXcXXapdjvJ6L4JsH9dFgKmTDMonxNmJoMiBthr4SuXaYddq4weEBXjbO91hW2ic2
	HQo9du03wlXbanA0ymSl6RPD7UbbatzimqW2FdfTJTsZTuX9KUlidp4ye5qwDpykmm9GRqDVs7ZAu
	CIJP684GphHk0ohs19cB/xKAsTn2Dc8aObTvkS0JfVGV5oD8lGFq3Ag8nhbCbqYcbW+bH7vl7r9sl
	0P81hmfNTGLbuJbJ5K0/qlZOLVzDzycbrInY/8YIdEj+Nnh053X2DBsFuqAIRG92ocWJQEi1LLd8E
	y+PjEsl5HSYy5fMno/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5aT0-000HqN-1O;
	Tue, 21 Nov 2023 23:47:42 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5aSy-000HpA-04
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 23:47:41 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2839c113cbcso3499098a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 15:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700610458; x=1701215258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RixJBuqv66m88vK7HkxjwRMyXd1r/8nDIzSWxCduqJc=;
        b=m61U9Y7N4pH3iXVMsEEUsguZvNLhTBSeGqKj8EOQqgo75jCptfjIcJfvnHwp8QvJSs
         IwQcTGtGHs5d7Yl42e1Bg76hwyT8BH+JXcXgTiHqLWGpw2/6gTPSzZTdO2IYsHopUH39
         R5RAg40JkXcC+4JNenm68vosDv3eDc6CIwKXOM2HESFwwaChMBT9L9Y4ZZw9DpS/3Gqt
         vMfJtEaMw2zBfAWjfecoZkdo1bmpxt6zjydRLevf3uWTSqAhrFLLhuhUHvIrZLWudww6
         sSMgFTMjKN+It8MZEp9AfcfolbcE8GF7CbgVHvahaJnQ1tlIcSm+nWvt7lxR2PwDW4jP
         7KIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700610458; x=1701215258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RixJBuqv66m88vK7HkxjwRMyXd1r/8nDIzSWxCduqJc=;
        b=Cjv0SlK/G+Q6Rp0GolW/bkpRYLW722J4TPLVuRgwLzDazhp/ZIAt8dDE9HcHxwF8B9
         x6k8GcY9mvC0kAAYMkOxOIcaURn6cIl9LeybAVnaEe3wVjl/cV4OelFBcmDcToywf5c4
         GfYSpR+FVMKdk7l8jUf74GPXiTKr5IFv4vCribygzFDskyQIFfEfbb/9OfjpXZVUiSX9
         int4LItxOolDaSBbxuoWjQ2Sg6VNgnBuUdzZcba+/0hHxPdFVpXwRV0q03V8tqkYrISa
         xsFzm7HDADPigLfiw47sPXkZeuo51WOANh3hNjduI9Nx7BqR46pmgPnqxAbWVTm+yeHq
         b1JA==
X-Gm-Message-State: AOJu0Yw5VtJ8FNPkOE03TTS6OM2qPUpYVcEd4j6PFBqQTXbobxTYgufh
	DhQTIoxSwEaaWaLVFhQdWxjfBQ==
X-Google-Smtp-Source: AGHT+IHDkKs2xL45lFuDTJl1d3rsMKOJR5oPBJPpnDfEO73BUkwb+Y+0oJNhE0wtOzaTaMxFMtL3Lw==
X-Received: by 2002:a17:90b:1c05:b0:285:3444:94e1 with SMTP id oc5-20020a17090b1c0500b00285344494e1mr739281pjb.35.1700610458055;
        Tue, 21 Nov 2023 15:47:38 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id f8-20020a17090ace0800b002802d9d4e96sm82234pju.54.2023.11.21.15.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 15:47:37 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 0/3] riscv: CPU operations cleanup
Date: Tue, 21 Nov 2023 15:47:23 -0800
Message-ID: <20231121234736.3489608-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_154740_060134_C3D2B1B2 
X-CRM114-Status: UNSURE (   7.65  )
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

This series cleans up some duplicated and dead code around the RISC-V
CPU operations, that was copied from arm64 but is not needed here. The
result is a bit of memory savings and removal of a few SBI calls during
boot, with no functional change.


Samuel Holland (3):
  riscv: Deduplicate code in setup_smp()
  riscv: Remove unused members from struct cpu_operations
  riscv: Use the same CPU operations for all CPUs

 arch/riscv/include/asm/cpu_ops.h     | 14 ++--------
 arch/riscv/kernel/cpu-hotplug.c      | 19 +++++---------
 arch/riscv/kernel/cpu_ops.c          | 14 ++++------
 arch/riscv/kernel/cpu_ops_sbi.c      | 19 --------------
 arch/riscv/kernel/cpu_ops_spinwait.c | 11 --------
 arch/riscv/kernel/head.S             |  1 -
 arch/riscv/kernel/setup.c            |  1 -
 arch/riscv/kernel/smp.c              |  2 +-
 arch/riscv/kernel/smpboot.c          | 38 ++++++++--------------------
 9 files changed, 24 insertions(+), 95 deletions(-)

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
