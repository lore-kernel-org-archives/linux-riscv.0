Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B74AC369CB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 09:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yCZRqkJS843ScH1XG/f+U6uiX1QUXcchv0cR6SbTJEs=; b=zR8GLHDDE+aVZr
	c31AV7x4Q65fxBVoxLN7fF1bpD5UaTD/0U/Lwb/uHV6wosw9xQFpVkHppDYmcEcImv1WxjVMoYfAf
	sQxsq13LRJGsxefPKeQwX2wb43/BxUCgWo3cLH5eWKj2Z/7uTMt2fjjoOup7U+JvhT4yGoi1Z5KRq
	5qU2GaqflAXqWie3YEtfJAfhw2IMjHAxMXPlRNgWdOEQqTuDW+1KVp9Qwg9/XmlCgAsC3qI2Z6+mR
	w3jC6lDTCLAmtjwAtyIfGtai0eQDzr13R83UD248wSwwZEA0EM4Fj5GFAQ/hIhvq8JEVZt82Ic0pG
	+VbZLaO31ZRHuB6DnA/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79VR-00000006TC3-1GPz;
	Tue, 22 Apr 2025 09:01:29 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78xD-00000006Ik5-1PYH
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 08:26:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39c30d9085aso3535292f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 22 Apr 2025 01:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745310366; x=1745915166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V/cAgNjQa95gQP7B/B/snS+8c4HbJCPXR5Eh8cVo7zg=;
        b=VxrcMNrVEofzpNHvQpFetASnnP6Ghj6lWoLfJQjfc/li5ZJo6BO8m2CcZ6xzd/Twpv
         w7R4s7MBpXhB/nLZqWYZmpO+mw2Rpcvtp+i+CcyyeAJZpGrM+LSQhtXfG18lRG34zmv5
         niSUVCFtDgzobClOJ32/PXaHFqnY1+IXqzbZlXCjmx4ElXqXR2vn9EOeTRnE+rS8s+Wu
         0b2OG8CRYCDn5T9ES/dj2uNVFjnxwV/Jn0f86moHKtVQj2M7vKUqVZS4qU3/JEdIM5f3
         DtZOLrkEW18s3sdg6yyDLM3eVa5yAe7+bZbSxsnfbMeVqN6sL4cPZt9lRAk7uQZPB0TK
         /KGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310366; x=1745915166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/cAgNjQa95gQP7B/B/snS+8c4HbJCPXR5Eh8cVo7zg=;
        b=hXh3V0lNYKA57r+VNfhsah8vkmYrfL3dW8rSOd+4KbKMb4D4RCSZX1dyEtGpHzYlvw
         5uwECQrMxLnrvF0oFziiataTQI4vDqdnc0QSXTHsufV1TpRt5UbMIOIW5xG+BHcRurui
         vgaQp2Sv5EaHNcVFI+byCtXISaiGr1SI8tEfiKzxY19O1//5pW5SqKm3iXaHm5juNmC/
         Pngm4N/QwYPYirjdhTv1LLhCF0IKbs0Y26cxnXZw9AYunkfmbguu4bpEVTY5xwluAbgq
         lAZ2YiaHko7XzZ2/FT7eBQfhI7cfx/1N92Z9feCY5gZXoQo9Dkmm/ysUe6dmuMmWUTX5
         B2CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUI8rJ1tXwM/7fvxpD8dhPYqWC7fPtPvWqwRm9awm2AO4aRbBhwFsgKY5P/fukms6O5CGmSqqg1U467g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrnEYs9ZnLYvUOsMfh1uRpdBHdy2As9EF+e+bayqGBT80yoiaX
	JrQ57eNIp4u+NhcB+Wg4jLwjl+WLkj/s8k/+0HSE3jIvzfAaDkGuxXcLZ8kJpGc=
X-Gm-Gg: ASbGncv4zwagajpagexyqy4SfiIkrO2xirUzIZY+cDkZWqOsm5eh4ZrXjdfpgjhkTAW
	fXooyHhJBJSssN7PjgaQQiz4JVmqHI37xShe+n6ojgmIrf61srMAscaxiQyZwgFYhfAskiK6qxg
	bYkgQ4Hnh65BJQoiyWKQUZPNRBoK5XTy0415e7/WjUe/nUKRac6JRC9xVyCdHmWcphDrCdj/Ou0
	lJF82850v/+tkLOOpADf1z2LMO9rB7FByepaaxvBVLGnDPS6cddREBf1hP4JBic4B0Wv1KWZd7t
	u6KzQAZVc42eIrMViAfMeDffMTK9KqOAUUsxC0OOWsvMeCqveN45LIicASye
X-Google-Smtp-Source: AGHT+IE5rRNC75MFtRNKzdS288HbyuZMTD2nZQBhaznTRZ3kRoPBwHGrzOWpkgGI+7InsS8Jm3kQ6Q==
X-Received: by 2002:a05:6000:1846:b0:39a:cd84:a77a with SMTP id ffacd0b85a97d-39efbae005amr10068227f8f.37.1745310365805;
        Tue, 22 Apr 2025 01:26:05 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:9fbe:20e3:2fc3:8d19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43314fsm14735392f8f.39.2025.04.22.01.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:26:05 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 0/3] Move duplicated instructions macros into asm/insn.h
Date: Tue, 22 Apr 2025 10:25:42 +0200
Message-Id: <20250422082545.450453-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_012607_548146_CB554533 
X-CRM114-Status: UNSURE (   5.62  )
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

The instructions parsing macros were duplicated and one of them had different
implementations, which is error prone.

So let's consolidate those macros in asm/insn.h.

Alexandre Ghiti (3):
  riscv: Fix typo EXRACT -> EXTRACT
  riscv: Strengthen duplicate and inconsistent definition of RV_X()
  riscv: Move all duplicate insn parsing macros into asm/insn.h

 arch/riscv/include/asm/insn.h        | 205 ++++++++++++++++++++++++---
 arch/riscv/kernel/elf_kexec.c        |   2 +-
 arch/riscv/kernel/traps_misaligned.c | 137 +-----------------
 arch/riscv/kernel/vector.c           |   2 +-
 arch/riscv/kvm/vcpu_insn.c           | 128 +----------------
 5 files changed, 189 insertions(+), 285 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
