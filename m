Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BE5C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Feb 2022 19:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R+J+/t+9pCq8LeYSdwze3C5jH0Btlqkc09SWDq+hTac=; b=SfS43cqz34+mi4
	E2Yo1g2fM5SdfOwucUa82ofB/LWbjs2B1N9simjU3B+6XS0hvNXD3PPawsPaBj+/z3F3aAkL9gRMg
	vEuQAfajg29kJWv67FSMo58WgkeDml0GgYHVtlNO4i+B+QPfhkWiFu0sd74E+RNhRCzUZ9z4SfqHW
	Btwd5EWSLT+Mi9o3mVbD5LxO0RAogeTUq30ZPE6/X/3FnbM8z2LVTThpjMKxR1tTQzH94Wg5QG/gw
	UqlTU/ibhpN8Xx3cLBqs1iHX65nmqyOuH3Xd3JwJxBlCpnBUkfUImJzzGOGIPkOwYYA4mG8lQFCVp
	1oUNrD9wdUlHySrREtFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIbah-008a0I-9T; Fri, 11 Feb 2022 19:28:23 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIbae-008Zzb-HW
 for linux-riscv@lists.infradead.org; Fri, 11 Feb 2022 19:28:22 +0000
Received: by mail-pf1-x42f.google.com with SMTP id y8so15253659pfa.11
 for <linux-riscv@lists.infradead.org>; Fri, 11 Feb 2022 11:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:cc:from:to:message-id;
 bh=Uv12JWSqyaA89KyaqlTkaZWGZ+lpLktvAFt4Fx/FGy4=;
 b=XMPGoR676J2pTU7mUJtm+AGAF9HwKBRg5ENRwhQXbntkSFzSKcIiFc/2N7a5heSYlP
 dpPFFpEzlejBb7tuUDNuogz37CnMkeuwkYnrQ5w3lo92lBSyNLKaJrPfgX/g5gxxBMoG
 76Y2NoJAt63TLlWvjvHVk3iMq7sOSbnRbvLs6BDrFs2AV+mRiZvACptBhuq5kUj/+b6y
 033j9VsxzvE4jLXnG8zXeKa8u5O3ePXFfv1UdpRct0Np7rJ28DvXIFkRGEWvAMFpcjRp
 hNRoiUVSpBcVW04KxWfFTwlVEpp67Z0uwVzL4PKQbW5tIQWa6TnsGXpsWOVZRj7w0HVK
 tOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=Uv12JWSqyaA89KyaqlTkaZWGZ+lpLktvAFt4Fx/FGy4=;
 b=oE0PxLgMTY/06iFHU8UHsrB/EC7TjjaYELZduUckWzcJ6EnENeITN+W2MzCPlbFOvp
 1/JcipPtiKTlUgXqB5iah/B5ayy0iMO2pBeXb1GpKcdr3sQ30GFaBfQTAaIPnDDZJnna
 wpm1Y7hrgojI7K5vcYqk8RJgyTYdYGJZvMm/2XcWhZJXQIxnnYfy6uyWTJneYJU01F6A
 yy0zdG99mWsvkCDPE8JekL5lGWKEnDbd/3x0qZIJGoBYkSs10FghDu/0BNMUl3ZvQlQF
 7OBBKnnKlzrZbnBfSsnc38y4XrJSneeLmdTFeKu5Edn87/FRxFsd2h/jDm1t03i5TZ2u
 iYmw==
X-Gm-Message-State: AOAM5336nZ76hZaK1bGwcgSmkxNCno2RJ6qkgCZws2QwyPFoHj2TKzA3
 uaMCeyJaA0LBFsigJ3SDxVRzEOpBuwWnhA==
X-Google-Smtp-Source: ABdhPJwY5u/v8sJev3tj+JnELKIaldF+H+FmT39ZaDKMGxg4aQx4gvAmGVPrCRWJovBPS13WXF3KxA==
X-Received: by 2002:a62:8442:: with SMTP id k63mr3157755pfd.54.1644607697834; 
 Fri, 11 Feb 2022 11:28:17 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j10sm27936704pfu.93.2022.02.11.11.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 11:28:17 -0800 (PST)
Date: Fri, 11 Feb 2022 11:28:17 -0800 (PST)
X-Google-Original-Date: Fri, 11 Feb 2022 11:27:40 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 5.17-rc4
CC: linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-9ae96702-cb8f-4e96-b126-0ae9b4f5a7af@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_112820_674803_D75AE075 
X-CRM114-Status: UNSURE (   9.04  )
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

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.17-rc4

for you to fetch changes up to 6df2a016c0c8a3d0933ef33dd192ea6606b115e3:

  riscv: fix build with binutils 2.38 (2022-02-10 09:17:01 -0800)

----------------------------------------------------------------
RISC-V Fixes for 5.17-rc4

* A fix to avoid undefined behavior when stack backtracing, which
  manifests in GCC as incorrect stack addresses.
* A few fixes for the XIP kernels.
* A fix to tracking NUMA state on CPU hotplug.
* Support for the recently relesaed binutils-2.38, which changed the
  default ISA version to one without CSRs or fence.i in I.

----------------------------------------------------------------
Aurelien Jarno (1):
      riscv: fix build with binutils 2.38

Changbin Du (1):
      riscv: eliminate unreliable __builtin_frame_address(1)

Jisheng Zhang (1):
      riscv: extable: fix err reg writing in dedicated uaccess handler

Myrtle Shah (1):
      riscv: Fix XIP_FIXUP_FLASH_OFFSET

Palmer Dabbelt (2):
      riscv/mm: Add XIP_FIXUP for phys_ram_base
      riscv/mm: Add XIP_FIXUP for riscv_pfn_base

Pingfan Liu (1):
      riscv: cpu-hotplug: clear cpu from numa map when teardown

 arch/riscv/Makefile             |  6 ++++++
 arch/riscv/kernel/cpu-hotplug.c |  2 ++
 arch/riscv/kernel/head.S        | 11 +++++------
 arch/riscv/kernel/stacktrace.c  |  9 +++++----
 arch/riscv/mm/extable.c         |  6 +++---
 arch/riscv/mm/init.c            |  2 ++
 6 files changed, 23 insertions(+), 13 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
