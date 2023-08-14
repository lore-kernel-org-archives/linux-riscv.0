Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46F3C04A6A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 04:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VR+bzXVjZL11r8v7bfpzDFSHuA36dvI2Ts5FmLGVR3s=; b=dWw58taBwkDJhG
	YsTmHsV1//PWcQSc2niAPo0BtkRTH9w7uEuYvIBtiCJiSgBTvGGMAL8DMDgLOiO23QZxtOzHqhYbI
	i1h0wPIMQt/evVn7BRhqwrIle09UrwHClDjr3UMydeNeALMXY+0XzKfxr6O647MeQGSgcEtjZyxZ6
	B1n7zscPbKhKkTcGtqZC2HUyWR+7ktyLyo7bicbktnMY1083lpEdDW/bSpARoKE2z9V6vqh06aetY
	d3QvCjCefs25ji8iX4lVxXFrTJHTn7wvEhlKeACWWlPSGY568lyEmAQgLl5nqZhvnk6qe4Dja/EaQ
	M0UQUGEo2yVQN98vsJuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVPXg-00G9Hg-1v;
	Mon, 14 Aug 2023 04:51:00 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVPXe-00G9Fw-02
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 04:50:59 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-589f7855c13so5440817b3.0
        for <linux-riscv@lists.infradead.org>; Sun, 13 Aug 2023 21:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691988644; x=1692593444;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=duz6+8wn42FUCtzg/PJHz01BVMFx3YE+aKb/7AhtaYs=;
        b=EjVYr5+aS9WYQky1Pi6sHnkw2sn3bSbM01Me/XMB7HqgGxIrmcXwMzFotkGgJgkHNj
         EZKF1JIUjW/Qrx/A9X5z/X3nV87RQCN9Mne5ojBbND5vwEKtsoOnE7a3hYSeq6t1o/ge
         0Iy3W7v8tI7eq8pcPGkHP4Quwgu5xATKayqFPPWFyd1nNVGQwCCYwWmeOxTekdDr/L2/
         4MYxQtRR7jHaIhgfNXup+cqDyBQaVeI44TeUm21undV1DFGM6W37arFaCdFqs3a5qk5K
         1iVwg5qSzSb30f8SAStvJPryr2NWeXTMkRqMai9eyEnd/jnliRPR1bfyplqJKGPuvOMs
         O2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691988644; x=1692593444;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=duz6+8wn42FUCtzg/PJHz01BVMFx3YE+aKb/7AhtaYs=;
        b=e0Z+HMEYpBqWKq/fJAzXghLgQ5eHAEHG3ZwP8RSD1FubWi5wtAxkrspywEoLXF1c5p
         uzVIHRTWiJZzRmolyxTgEyo1fnq3fsWiIouw5TGGm8vqKZxY/SkZS6NWlLjUJhcE4ZqB
         w3fuYekAH/GQPmW2At+46/qsRRAgc/6bz6luBNL8ZkgLL/3BX5Lz8uKUi7UIDcIX9tNt
         IRmFjiqjMFNUtXpegGpfh41B+DL61UGROKZP5HOy6lUsq1zvvvCFikgZltdtMNjo0Hxw
         S6itPbkWq9cYushrofKMEfF1QMhmk/bQogTXDjh7xcn0Z8Ut10cYQwZUPKJ+4mC4MkpG
         H9dw==
X-Gm-Message-State: AOJu0YyTX9lPmTd213xNWR448ZBP2kOJofd9wj8KBifYu6TE/tOd+6Y3
	LsJVlGsFwV2/T/2VQDqt5RCtCA==
X-Google-Smtp-Source: AGHT+IED4ZsvoV1zj8jRed9R+G4T2wyymC/Lbz9/7Br9GopJ/sjVrJGZaf5N8bNGOBtoA2l67siQSg==
X-Received: by 2002:a81:834b:0:b0:576:8a5a:87e5 with SMTP id t72-20020a81834b000000b005768a5a87e5mr9346734ywf.26.1691988644337;
        Sun, 13 Aug 2023 21:50:44 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id d6-20020a0ddb06000000b00583cf4ed41esm2568131ywe.2.2023.08.13.21.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 21:50:43 -0700 (PDT)
Date: Sun, 13 Aug 2023 21:50:34 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
cc: Mike Kravetz <mike.kravetz@oracle.com>, 
    Russell King <linux@armlinux.org.uk>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, linux-arm-kernel@lists.infradead.org, 
    linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: [PATCH 0/3] arch: include asm/cacheflush.h in asm/hugetlb.h
Message-ID: <6d2acfa4-7f44-d3b4-b0a8-5495c5985e4c@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_215058_047360_E5992645 
X-CRM114-Status: UNSURE (   7.06  )
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

Three architectures are using PG_dcache_clean in their asm/hugetlb.h,
but relying on accident to include the asm/cacheflush.h which defines it.

1/3 arm: include asm/cacheflush.h in asm/hugetlb.h
2/3 arm64: include asm/cacheflush.h in asm/hugetlb.h
3/3 riscv: include asm/cacheflush.h in asm/hugetlb.h

 arch/arm/include/asm/hugetlb.h   | 1 +
 arch/arm64/include/asm/hugetlb.h | 1 +
 arch/riscv/include/asm/hugetlb.h | 1 +
 3 files changed, 3 insertions(+)

Hugh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
