Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6454CE79AE
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 07:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=toqn3YVL5XPgUT2wKX/IB2pMfJnoTZeoWdLFr9TbWQM=; b=K7wv5JoITlnK/h
	bX4Fte1YgRk3VCV3Qby9Yp5suE+mw5rqL+g+fckXDBVOcQ07MoIlETjSplqebV9fQOg3rMw2LOTz3
	UsWuWlWJsfw1uDWBuNAaWRqUafqwSplBgs71Ifl2EPvje9PGgXvNTSwrmMo0XuVwlzeYxmPa4/W6D
	U+pgAl4ZZ2e20jdvS/e33nA9i1oaz8AJ09TaAO20d+0U2L0iZfdYi0KF0/9yF13MtLn4QFGBC//jT
	6CUqxVujcXfrrlX0r0Nzm/NWtPhf0tGxMMg/FWd+kvUk9jyDV6VmUyic0yOzJpdBKzPMx5MGeHChj
	jnysQ10s3Mn47lSFS0Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiroM-0029lZ-0b;
	Wed, 20 Sep 2023 07:39:50 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiroJ-0029k7-0I
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 07:39:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695195587; x=1726731587;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hcN5dyOX2piu1MHW4eheSWMp4q3vJNBIWWMTg8pcyZs=;
  b=NFRI0OAbYucPJjrsOY/fpQKb4TdR65JafaQfk5gCjvv9BQ1mtJP9Emco
   d1SD6TDIcp0P9j9WF+wSfnNf0k4KsPgwLj8Xr5Xrvx+f4uta2z+lcV4r/
   hJSgtMcinDpEL3QKeqV7h/PN4fDuqBaX7tsxm9j/ByO0k4CgUR6uDg+uO
   BMbUSvL838Ttmc2H6MQkmFAs3eU9YBdop8F68V3OtnjHcCS7qywstm33e
   bvqLCV/02RBCsoJhCumo3m3gWRcxMcaGfC59BRzAMr2XXiHbh+ceSbTaL
   vqEg53EUsvC28o+E4MKiymwmp0aW9pPhreEQObCkWNXF0ADPvyr08Mae1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="446622589"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="446622589"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 00:39:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="816791812"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="816791812"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by fmsmga004.fm.intel.com with ESMTP; 20 Sep 2023 00:39:39 -0700
From: Xiao Wang <xiao.w.wang@intel.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org
Cc: anup@brainfault.org,
	haicheng.li@intel.com,
	ajones@ventanamicro.com,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH v2 0/2] riscv: Optimize bitops with Zbb extension
Date: Wed, 20 Sep 2023 15:46:51 +0800
Message-Id: <20230920074653.2509631-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_003947_261965_02183012 
X-CRM114-Status: UNSURE (   9.81  )
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

Bitops optimization with specialized instructions is common practice in
popular ISAs, this patch set uses RISC-V Zbb extension to optimize four
bitops: __ffs, __fls, ffs and fls.

The first patch rearranges the content in hwcap.h cpufeature.h, it helps
to avoid a cyclic header including issue for patch 2.

The second patch leverages the alternative mechanism to dynamically apply
this optimization.

The series has following dependency:
https://lore.kernel.org/linux-riscv/20230918131518.56803-8-ajones@ventanamicro.com/

Thanks,
Xiao

v2:
- Remove the "EFI_" prefix from macro name "EFI_NO_ALTERNATIVE" to make it
  generic. (Ard)
- patch-1 is added, it's based on "RISC-V: Enable cbo.zero in usermode". (Andrew)

Xiao Wang (2):
  riscv: Rearrange hwcap.h and cpufeature.h
  riscv: Optimize bitops with Zbb extension

 arch/riscv/include/asm/bitops.h       | 266 +++++++++++++++++++++++++-
 arch/riscv/include/asm/cpufeature.h   |  83 ++++++++
 arch/riscv/include/asm/hwcap.h        |  91 ---------
 arch/riscv/include/asm/pgtable.h      |   1 +
 arch/riscv/include/asm/switch_to.h    |   2 +-
 arch/riscv/include/asm/vector.h       |   2 +-
 drivers/firmware/efi/libstub/Makefile |   2 +-
 7 files changed, 350 insertions(+), 97 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
