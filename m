Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792ADC4320E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 06:59:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36F4660E76
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 06:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 36F4660E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VGENGdZmkgEzC59gHMHzCs179YbtusZXQymRxqx6EHk=; b=fnR1+AabHGvRum
	U6vzw5UOBZ7naT/jorSMr0yxDGtfC93jlc4cepsi2SfKaPnAT/IIiQygBbnlzmGqwCb7nxzVVKyCW
	fZl3bNXjmhnoDmNV9R3TN1LeE1o7UyAWr3mQtB8uJFEzYzlHt1Rz8J4WN9Dd/JgtOwMNESD2OBObV
	kj738f3TGadtg3WYXOJAiVkLivqrDs2LkZviWufYKvuAYldUZ+i6nm8pgBfxm4MtcWgsirFij8DxX
	TLbiwBagB5nCV1M8/2LzLDczaVKaNj2QLro7eyPSwiffQ5FG+f4SxzUkFCydsnKiOsiZrrp3FpmcS
	QeTQ3ZFsMg1/SqAiaJBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE4gg-008oNM-V4; Thu, 12 Aug 2021 06:59:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4gT-008oIv-80; Thu, 12 Aug 2021 06:59:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F24AA601FD;
 Thu, 12 Aug 2021 06:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628751560;
 bh=YFMZTccB6r2mQUHMX3e0DwUnA6yRsuYhah5UQoES2qE=;
 h=From:To:Cc:Subject:Date:From;
 b=gqDKL6oFAWPfl+qrvP4ICkIiJuTj0zB5TnIo9v2jyftPMcesd9mebeUTOENH/WF4R
 PBfqCrnjEHgRHt0O1dyCISfhSxmredSB9XxmW1Ns603miZy037IV2h2edGI81ldDzY
 NqgDtvGktsfZul6wLbLg1Tgj9dX32EjsY3bdIRoj49WsQpGFdC5ZMg6zFcqteaJDkt
 0uruPXpJRVzqwUCwDkAf6p3Y7H3f580IbJRG6NdyUWhatq3Gxbuq0XxYssVS/sjhOA
 hChRFrKVbGxFTcFqXajSbSnyBDOxjDPh7zY8Sk+z4WzAiR3GMcSU98BQ+MjV7C6G/L
 np4VR2Z/7QAFw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andy Lutomirski <luto@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>, Len Brown <lenb@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 kvmarm@lists.cs.columbia.edu, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org
Subject: [PATCH v4 0/2] memblock: make memblock_find_in_range method private
Date: Thu, 12 Aug 2021 09:59:05 +0300
Message-Id: <20210812065907.20046-1-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_235921_409771_3EBABD1E 
X-CRM114-Status: GOOD (  13.68  )
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

From: Mike Rapoport <rppt@linux.ibm.com>

Hi,

This is v4 of "memblock: make memblock_find_in_range method private" patch
that essentially replaces memblock_find_in_range() + memblock_reserve()
calls with equivalent calls to memblock_phys_alloc() and prevents usage of
memblock_find_in_range() outside memblock itself.

The patch uncovered an issue with top down memory mapping on x86 and this
version has a preparation patch that addresses this issue.

Guenter, I didn't add your Tested-by because the patch that addresses the
crashes differs from the one you've tested.

v4: 
* Add patch that prevents the crashes reported by Guenter Roeck on x86/i386
  on QEMU with 256M or 512M of memory and EFI boot enabled.
* Add Acked-by and Reviewed-by, thanks everybidy!

v3: https://lore.kernel.org/lkml/20210803064218.6611-1-rppt@kernel.org
* simplify check for exact crash kerenl allocation on arm, per Rob
* make crash_max unsigned long long on arm64, per Rob

v2: https://lore.kernel.org/lkml/20210802063737.22733-1-rppt@kernel.org
* don't change error message in arm::reserve_crashkernel(), per Russell

v1: https://lore.kernel.org/lkml/20210730104039.7047-1-rppt@kernel.org

Mike Rapoport (2):
  x86/mm: memory_map_top_down: remove spurious reservation of upper 2M
  memblock: make memblock_find_in_range method private

 arch/arm/kernel/setup.c           | 20 +++++---------
 arch/arm64/kvm/hyp/reserved_mem.c |  9 +++----
 arch/arm64/mm/init.c              | 36 ++++++++-----------------
 arch/mips/kernel/setup.c          | 14 +++++-----
 arch/riscv/mm/init.c              | 44 ++++++++++---------------------
 arch/s390/kernel/setup.c          | 10 ++++---
 arch/x86/kernel/aperture_64.c     |  5 ++--
 arch/x86/mm/init.c                | 27 +++++++------------
 arch/x86/mm/numa.c                |  5 ++--
 arch/x86/mm/numa_emulation.c      |  5 ++--
 arch/x86/realmode/init.c          |  2 +-
 drivers/acpi/tables.c             |  5 ++--
 drivers/base/arch_numa.c          |  5 +---
 drivers/of/of_reserved_mem.c      | 12 ++++++---
 include/linux/memblock.h          |  2 --
 mm/memblock.c                     |  2 +-
 16 files changed, 76 insertions(+), 127 deletions(-)


base-commit: ff1176468d368232b684f75e82563369208bc371
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
