Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2AAC00A89
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 05:04:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE8A22083B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 05:04:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XCcHFPkS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pwjivZM1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="nZp7krDb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE8A22083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fML4VtJfZkOYiiMW8Sukq3GbmAXVlW5NFQu9B1PXQRY=; b=XCcHFPkS73D3ChM7vniUv1nCaa
	+PkXrZCrLCrjODLfyeQEmceT2DclfmawO9N+9iOztdE6+/i4kJulAEvpA7AeGe9OuXEAq0uhlSiKX
	U1xk0qAHBRNnr97CgdaYdeH0JIJ1x5y1Cb2j2A6rHo4iMTMaE7bB20yqfCkqOjGhkMMe3mskOHE8I
	Is4O7PQiC2BzzRnPy0lVNnakG8uuFtr0pJ3EznXjwTUjzwo+0oPiK9uR3nkVdoXYj+1FK/ULazowQ
	zkTAXa0FYULz6ZRVVr2G++Dj2gPvOpCehXMCfDVW1Je8prCR5Rpphmk/ys+9Ya4Z0ecykIsMIoH5j
	u4FeHMVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaXRO-0004Kn-Vd; Thu, 05 Nov 2020 05:04:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW3k-000145-EB
 for linux-riscv@merlin.infradead.org; Thu, 05 Nov 2020 03:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=BcenlrthpnO3r5HA2GRUekVFxEJb2DqGVgHDRp8gfBk=; b=pwjivZM1OEidcXPQazmHp6qNMn
 NoO5W29GCGqOwmrCT4mggA4nGPbgCjhuJjvgt210SINJjT9Voj1QoB+JU+Iyc7LqlRnqHimrhi9Qm
 p20T5j0NJa36EckzssTxfGsgcylVg3KXF/SY49cumaF85Yt85WODQoorh9AGn5woMGg+u/wbIwBmh
 6wg9vfJXvQWcudOsOx/I3iiZpSoPuSnXIvd4PxjZRMeUH+cpRZfvlHqk13p48sybkeqLgVpuz6Cyn
 g0vWtEWIPfVY2bt6owyycJ2+0C9PEXYwFErFV4HqsuQG+JiX0s1FhykpMJiowv+Tnw2ePxde6r2QH
 YY7UuviQ==;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaSmg-00012o-UP
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 00:05:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604535639; x=1636071639;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+Jbu9mlrWPt2lhI04EDYr8YcAwZ3WGSkZpcHFvGSqPg=;
 b=nZp7krDbxW41JPJ6/UxM/FENTv5tF9W5T8nnM96r64JoSmhyz2fT7QnX
 giE4VNs6oScLh92o76JwL92t1b13agevZM3Q4s4YVFKpUsSwovJ0Pe7Pc
 O9pt4zOqIPIPLXww3Ff8jjmdvAyCOc1rXVJ9GtN+2WiTlRUbf3Zojj2K/
 5v0Xrj6bURvl5vGY+5RIvVpxJph7wH7JE3pcr3moJb4+PDNKzzwKAO3km
 aK6SNBnBAZzSFOObwH5LOhCis/QBftlkcjshrr2bmXVgvckwJnFlZ09WZ
 2AG0OHz1nhlaBfDYOqeZAHRH5WivyWjMBvj47lJNbQR2K+1/VH5yHYqYE A==;
IronPort-SDR: uFa2hVAQijMiTtB+0w7hPmg8f+x05udmAknq2trFBcoFcLOCjtERnjYFlH9Hi/R2pHSRNOpqwa
 PHYfb+oxd0d7E3J7HKJiBO19X2bEFIyoZCRA8rIUv7tbAbOJ3ZxlG4ISV20Uau18vsyxiMeeYY
 eDlay9WtEALJd86YrYucWWuaZW4Hpt1T82BRZgTYY31238w6LHLbNV5B9odBRlpnT3OXim30q5
 6NbwAJC36V48VUb+w91TVUSkY+0MWcVpqw3l/o9CAjdfrkGn4WBlRTDwdIHG96TgDOwLngOIVs
 5fc=
X-IronPort-AV: E=Sophos;i="5.77,451,1596470400"; d="scan'208";a="255394924"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 05 Nov 2020 08:19:26 +0800
IronPort-SDR: AhQ5RxsJeHSW58vHrCoxcHtZQBAid5obCswSih+1PaK2lvvZSpK47Yx7+NHdYGmMJOx7L6GhUN
 lk6AyBZ9FGG6kYPVPE8icvsBGqLQo+RD2BHugTR0qa79WWbGSGsrgm8KbK/eKpf8TVATU0hykT
 rDPferLGAiTOxIUvRKeWHruykajFKiDkbD6ucpBu+MAmucE3MVyOlOvnxRlh1+Dwiym3wj1av8
 NvXCewJUy1Kcjgng9FqYbacrfQhh2IMyEtdDw+sORCP3wWhI0JjOVkQHi8gECoLvcFCMPPlAlY
 xS3EcohZfAHt8mpzWL3cTzUd
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 15:51:06 -0800
IronPort-SDR: jpIGTmzFazPZ0xjmhFi/wus5jV/kNztNLCqrZRgxI/wQvzDR7evQnf4B1FeEhOl2YY1/2ICEL5
 T5a46wNcWPxWHm/TLZ2bHJ4BjT6j3Hp3VoGhOv2O5ev8WmZtMzSbnqqrZM3VO1tSCtdlI3942q
 VfnUlEjwPjPVu0HIqYKGBXk1vQFufffA4x3Zb0mlhUwBlhnZmY9eJ9YGN8VwwBS9SGGEPoPHkx
 jKDSXNxrN8pjw+QAMysS/M3tsZVNWuDhRxNZbFbVg2eLXzg5spCwNL54a8+vB+whDuMoisy89o
 lkY=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.117])
 by uls-op-cesaip02.wdc.com with ESMTP; 04 Nov 2020 16:04:59 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] Improve kernel section protections
Date: Wed,  4 Nov 2020 16:04:34 -0800
Message-Id: <20201105000439.1491243-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_000547_520871_CCF93BC8 
X-CRM114-Status: UNSURE (   7.33  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Guo Ren <ren_guo@c-sky.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Miguel Ojeda <ojeda@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michel Lespinasse <walken@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series aims at improving kernel permissions by doing following things.

1. Protect kernel sections early instead of after /init.
2. Protect .init.text & .init.data sections with appropriate permissions.
3. Move dynamic relocation section to _init.
4. Moved .init sections after .text. This is what most of the other archs
   are also doing.

After applying this patch, here are the linear mapped sections with non-uefi boot.

---[ Linear mapping ]---
0xffffffe000000000-0xffffffe000800000    0x0000000080200000         8M PMD     D A . . X . R V
0xffffffe000800000-0xffffffe000c00000    0x0000000080a00000         4M PMD     D A . . . W R V
0xffffffe000c00000-0xffffffe001200000    0x0000000080e00000         6M PMD     D A . . . . R V
0xffffffe001200000-0xffffffe03fe00000    0x0000000081400000      1004M PMD     D A . . . W R V

Linear mapping with uefi boot.

---[ Linear mapping ]---
0xffffffe000000000-0xffffffe000800000    0x0000000080200000         8M PTE     D A . . X . R V
0xffffffe000800000-0xffffffe000c00000    0x0000000080a00000         4M PTE     D A . . . W R V
0xffffffe000c00000-0xffffffe001200000    0x0000000080e00000         6M PTE     D A . . . . R V
0xffffffe001200000-0xffffffe03e534000    0x0000000081400000   1002704K PTE     D A . . . W R V
0xffffffe03e538000-0xffffffe03e539000    0x00000000be738000         4K PTE     D A . . . W R V
0xffffffe03e53a000-0xffffffe03e53c000    0x00000000be73a000         8K PTE     D A . . . W R V
0xffffffe03e540000-0xffffffe03e541000    0x00000000be740000         4K PTE     D A . . . W R V
0xffffffe03e545000-0xffffffe03e546000    0x00000000be745000         4K PTE     D A . . . W R V
0xffffffe03e549000-0xffffffe03e54a000    0x00000000be749000         4K PTE     D A . . . W R V
0xffffffe03e54b000-0xffffffe03fd6d000    0x00000000be74b000     24712K PTE     D A . . . W R V
0xffffffe03fd6e000-0xffffffe03fdee000    0x00000000bff6e000       512K PTE     D A . . . W R V


Changes from v2->v3:
1. Added few extra comments to clarify rodata permissions.
2. Changed the name of the functions set_memory_default to set_memory_rw_nx.
3. Squashed patch 3&5 together as they depend on each other to allow
   bisectability.
4. Removed redundant arguments in protect_kernel_text_data.

Changes from v1->v2:
1. .init.text section is aligned with SECTION_ALIGN.
2. .init.text is moved to below of .text so that .head.text & .text are in
   one section.
3. We don't need Guo's fix for static object issue.
4. Rebased on 5.10-rc1.

Atish Patra (5):
RISC-V: Move __start_kernel to .head.text
RISC-V: Initialize SBI early
RISC-V: Align the .init.text section
RISC-V: Protect all kernel sections including init early
RISC-V: Move dynamic relocation section under __init

arch/riscv/include/asm/sections.h   |  2 +
arch/riscv/include/asm/set_memory.h |  4 ++
arch/riscv/kernel/head.S            |  1 -
arch/riscv/kernel/setup.c           | 19 +++++++--
arch/riscv/kernel/vmlinux.lds.S     | 63 +++++++++++++++++------------
arch/riscv/mm/init.c                | 21 +++++++---
arch/riscv/mm/pageattr.c            |  6 +++
7 files changed, 80 insertions(+), 36 deletions(-)

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
