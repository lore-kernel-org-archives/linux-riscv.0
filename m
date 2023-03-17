Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478F8C74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 14:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lReijWhkQU51FShwvamASejHk8WPtzjq3f5pwZtWbX4=; b=sNzFno81r+gd4y
	UgMdG8f2nIntGeLfk0ySbm5xXqyzTSvC8WBPqci6UlEiwlowfIC9RKqOKG3jiVPoKCPMaNDV0nFJI
	jTz1ZOBeyLo/12MVnhJ1EpRxy8yHsLvXYGS8Uu7wq713sysR8k7UWkdU52MK7dwJuNXzfHn3Y0ah6
	es37flj5ddZs1feG09TSSk32DSc1jQlZ7r+d0XFkYSDros6hqzM4FXIBsbSFPIXUBtZdmRxcYhaK2
	AVnrdfSqp0t4cnFOsbR3EvQAmHdOjWfneP1jG1erZkW/AyIXrVEPhpaY/2LGtVDAfQ6zQl4TGolN6
	isfnHM8wngG+BBcaUm9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdBVR-002VqJ-1X;
	Fri, 17 Mar 2023 14:56:33 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdBVO-002VoX-0u
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 14:56:32 +0000
Received: by mail-pl1-x636.google.com with SMTP id v21so5532451ple.9
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 07:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679064987;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQHsigL4cQeMNE4+tPguPwfbc2xlhbaQJTlCbEWAZT4=;
        b=zKHIK6ocR2nVQtQTWI4jJliZiBKjnCjGE89AeVrr1muLN7dWHQSQGuU6p1OCBDl/3u
         0FMLH2W73H0tmATOEHg8BTkNp7ZcUoKlpujkPpFOI9c7y/MFHl2YxTND1rbq5B0lLgVT
         4mvMXpG45F0vnzyZnYOrwUpenqa6nAqnqrkZyv5kD9Kp/sGvW7ccCAd6/c7am9NRlLCn
         iphYmwxGSqROWtSBdf/gSKGh0nM2NtyhIvpW7Kieiey8W09iXtWFLoGB9wp9kAQhDwaY
         39FSE35+/lZCdiXrYI72kyG8BIhed6dxrQ2h8dPLrshaBdbAzbMWvwcA+RYxU8KkQvy7
         pdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679064987;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQHsigL4cQeMNE4+tPguPwfbc2xlhbaQJTlCbEWAZT4=;
        b=2GLxlfy8zRZCfBLmMxrpNGiv9PA4WhLlecw5dvI+Qn3adEIuE52yHmEd7doCtBNqYf
         oYWr9a3M4gycPXdyQk9h7CojqMmqiVyoQ6SqlvuoQOFsbvxXTvBVPlghbvhlYl8fkQxn
         HiKoCJG6l1Ual97Su1FLkkGwNHV3RJC0GOBz4Jlu6H+Z1b+Bi7B9T0u/b0WyCAUGwVeO
         +e1QqWHfKPUeINO4Ul8mUoBRu4KSmwWrjGaRwuthDjj0MqikxvRfqKURB4H69TXeGu9N
         kqYjdyHxO7X4I1jj9tIpSH2QvYHbwBHJZtSb0KLLaz2qAKClbl6VnE5T45H3X+QNT8t4
         uxTQ==
X-Gm-Message-State: AO0yUKW22CEINQi2ugvNckuLT6r87tp81FmXZwPJ18LP6I47DqYfdNQb
	EelRJQIsp8oydE/mp/F4XSdNzbX8fQdzxeUpaTA=
X-Google-Smtp-Source: AK7set+ZrtvKJ9Fu+LSwEV8uEmI/ZaXcoD479/0/hN9DRyDvUSOtMTW9YZWta19/mwLcDjC8K+GF8g==
X-Received: by 2002:a17:90b:3a91:b0:237:24eb:99d8 with SMTP id om17-20020a17090b3a9100b0023724eb99d8mr9222625pjb.19.1679064987283;
        Fri, 17 Mar 2023 07:56:27 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id f11-20020a63510b000000b0050be183459bsm1577727pgb.34.2023.03.17.07.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 07:56:26 -0700 (PDT)
Date: Fri, 17 Mar 2023 07:56:26 -0700 (PDT)
X-Google-Original-Date: Fri, 17 Mar 2023 07:56:23 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.3-rc3
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-70404d20-e840-40df-a6d9-0d67003e3ca3@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_075630_548193_1195E7C7 
X-CRM114-Status: UNSURE (   5.40  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 2a8db5ec4a28a0fce822d10224db9471a44b6925:

  RISC-V: Don't check text_mutex during stop_machine (2023-03-09 14:58:51 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-rc3

for you to fetch changes up to 47dd902aaee9b9341808a3a994793199e7eddb88:

  RISC-V: mm: Support huge page in vmalloc_fault() (2023-03-14 19:15:34 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.3-rc3

* A pair of fixes to the ASID allocator to avoid leaking stale mappings
  between tasks.
* A fix to the vmalloc fault handler to tolerate huge pages.

----------------------------------------------------------------
Dylan Jhong (1):
      RISC-V: mm: Support huge page in vmalloc_fault()

Guo Ren (1):
      riscv: asid: Fixup stale TLB entry cause application crash

Palmer Dabbelt (1):
      Merge patch series "riscv: asid: switch to alternative way to fix stale TLB entries"

Sergey Matyukevich (1):
      Revert "riscv: mm: notify remote harts about mmu cache updates"

 arch/riscv/include/asm/mmu.h      |  2 --
 arch/riscv/include/asm/tlbflush.h | 18 ------------------
 arch/riscv/mm/context.c           | 40 +++++++++++++++++++--------------------
 arch/riscv/mm/fault.c             |  5 +++++
 arch/riscv/mm/tlbflush.c          | 28 ++++++++++++++++-----------
 5 files changed, 42 insertions(+), 51 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
