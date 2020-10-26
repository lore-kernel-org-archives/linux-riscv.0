Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43657C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 23:03:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4E8120708
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 23:03:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ovLwpSs/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="MHYWr0Bd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4E8120708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AJziJd8nrn+4T1R74dYUILG5k9fl3YhWaWURYPqxdUM=; b=ovLwpSs/SvXj5fGtLVtLDv6mdY
	5zndXisEH0sPPl6O9gIuxlO/FoFqRzZr5M+JTRlJROZjSIKFMrKqJ/qLDI/EvyI+R22wuBp7RvjJc
	ZgzaxNAiy/qGacZM24B3yppmc9p96O5QoM61nVQ1xHZ+gkrZXBTDx7pw3IxD5bQzAb8vontWTfRJb
	L4U2nVzwq9IoNJV2qJHs1Z1HFKp1jft7SzDh9JQCHE0eODX6J44NcWtJ5W8nev7654fB5Nf3NG7Gv
	1vsjb6ylJbboNsoul6rG1hi3m3P0oejV5ctLOBZsz65GaTcsCexEHCZVK4uJs1y+1hrXJW48bWRMJ
	Hqpl7ibg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXBWU-0004H7-0J; Mon, 26 Oct 2020 23:03:30 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXBWR-0004FU-3P
 for linux-riscv@lists.infradead.org; Mon, 26 Oct 2020 23:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603753407; x=1635289407;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yvlTyQ9O0XqzdAdjO0Pl2oB3b2ZTm/0cBZYL5R5guvA=;
 b=MHYWr0BdtZWuH7qPLcDFRoATuVG7vNR4zpNP3sI9ykq3483vcBLC50qB
 LmWhzc9VO2qZWSiS2bIUuc8cW1dkk8monY7qTdhUrkIscoloUkFHcwx+3
 NRh2JGgNRh7ezZCC3qGzRKk9meQkGXwTYHLEM3ZjMgX3/R9Vg//aljX7j
 ul3t0cL5DvnNjlXI46KyGiUeaJatWISvZQyEZGBiiw2cxzTJQk7wg+/fO
 J+kNAR6TDdrgpOIstbOEA3vYibqMJMkMu7OzI4aYri82fW9u9hOB4+sYJ
 zfB3vw/3FSsngB84pyafkSESy/b5vprEHGQJYlYkkA4Nr2+0WxozowWRh g==;
IronPort-SDR: 1vVURxmZnxGGCmR0wlMKD55TXAFccf+GDqzxJx6s/ZDnjGbAlPsXDatplHozRPzND5sTwMrmyJ
 MmpyzDMz8+q1+svdJKhkJh7N5clt1K+n0CAbQq/PSfXyJ2bm68d8M0YDCfheLKdgDZISAAzhnO
 m1DYhduwh2o6HMJN+5oH1hyP8nCcbzY7esX6ekNbOyX821ThMSXbf3zvYSx63Vwhm07K/m/2hV
 //hgzxPiuuVgIl7PIGilTejoVPMngMc0GnRncasTVTmHkAvz966X+pmo9U6BBj/MZtKEWd1Bt5
 jVY=
X-IronPort-AV: E=Sophos;i="5.77,421,1596470400"; d="scan'208";a="152152903"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 27 Oct 2020 07:03:23 +0800
IronPort-SDR: EciqxF4T9o3Ic4P/WGW4k2fEEeB81AXWJyKRvjeuSSi/aUhlG+tyIJJSsEDIpOL53ujenIXcdO
 NlwLjHZRzhleuhTYP8TOi67nAMWWVuD/Q7A1021vuIXTra5VxX8qAkuIPqGU8/zauKZmuJqQ9t
 15g4qKhrml83Ub9b5x8eDO8Q4hd58EuPuO8G5vflgKlu0P7CLLXT6ICTV/Ex2Qs3BJxAtjUTpi
 fM1vore29jwsL2BRESU2ERF/yaLIp0uxwRi3KBfWVIHC9yxnYrN4GPzps/Iem7k9Do3uR6MaOO
 c6CCDvLp58a049cdLLu8voV7
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 15:48:34 -0700
IronPort-SDR: G33XPMYKh2dkvNJCfiAdtlEDxk2ehe+0xdYyU9F4fsaIiIGgD/4rvWG4Q5v8MwQa2AK/Cxitdy
 QFgJV7wp6k3ZphxR0FRRJLRUp3D1WxxZtc5nA+xyCVgdDtHun68zTYWWR9H1R7Lzs8Ghv6IDDH
 K858azlRRPkH7DezKo35P/7GWU2UVwcdPoXCbF544m+VPG85dRm+gbmvSei9WMEei/iBmymhUW
 qqJAnOC3zJiPyHsr4TeLhzRQB312aIYClaiVNOjF9qHHfIxnMrMCn7d41C3Y0MZHrEGAz0tMc5
 8MM=
WDCIronportException: Internal
Received: from 8223p12.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.110])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Oct 2020 16:03:23 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] Improve kernel section protections
Date: Mon, 26 Oct 2020 16:02:48 -0700
Message-Id: <20201026230254.911912-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_190327_345582_8D733A40 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@suse.de>,
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

After applying this patch, here are the linear mapped sections.

---[ Linear mapping ]---
0xffffffe000000000-0xffffffe000800000    0x0000000080200000         8M PMD     D A . . X . R V
0xffffffe000800000-0xffffffe000c00000    0x0000000080a00000         4M PMD     D A . . . W R V
0xffffffe000c00000-0xffffffe001200000    0x0000000080e00000         6M PMD     D A . . . . R V
0xffffffe001200000-0xffffffe03fe00000    0x0000000081400000      1004M PMD     D A . . . W R V

Changes from v1->v2:
1. .init.text section is aligned with SECTION_ALIGN.
2. .init.text is moved to below of .text so that .head.text & .text are in
   one section.
3. We don't need Guo's fix for static object issue.
4. Rebased on 5.10-rc1.

Atish Patra (6):
RISC-V: Move __start_kernel to .head.text
RISC-V: Initialize SBI early
RISC-V: Enforce protections for kernel sections early
RISC-V: Align the .init.text section
RISC-V: Protect .init.text & .init.data
RISC-V: Move dynamic relocation section under __init

arch/riscv/include/asm/sections.h   |  2 +
arch/riscv/include/asm/set_memory.h |  4 ++
arch/riscv/kernel/head.S            |  1 -
arch/riscv/kernel/setup.c           | 18 +++++++--
arch/riscv/kernel/vmlinux.lds.S     | 63 +++++++++++++++++------------
arch/riscv/mm/init.c                | 19 +++++++--
arch/riscv/mm/pageattr.c            |  6 +++
7 files changed, 79 insertions(+), 34 deletions(-)

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
