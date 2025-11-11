Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FFECCFA1A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 11:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=67PAjUKMhXYd5sINE0Hqtly8Kyfn0xovwkl3AVtgyoM=; b=jd1s4SW7VRcb0R
	b9y/jsMUQZxnbjEeFAEGBXCw4/OXiJiV4sGIlA15Rp43g6OgE8Z9L0NpQzEOPIX+LdviZ2y3TY8M9
	BeX8r1Tsk4DlGA3SXmY18bKGql0HrwUYNEU4n5fIs1GGDgqjmZ5I8HKLZP+A5UHekLt1odU3wjWfo
	VWS7NeTOQdaNub3zz1FrPmdu1y27Tovno5FY5lmmILT89HUrfWI8aDUKeEjjBc6j/HWxu5bkDpq9t
	7x6xdvEf1R61NHCHtuq+kse86eLg/AN19hv4+FSjL3cxXzoXnDx0UBdYrtmqwi+deKr8zw8wVxtUo
	kYYXwNzFuEA/8xSxK6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImPT-000000073bJ-2Hjj;
	Tue, 11 Nov 2025 11:19:39 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImPQ-000000073aI-2IiP
	for linux-riscv@lists.infradead.org;
	Tue, 11 Nov 2025 11:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762859976; x=1794395976;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zy4IxmPtBkptPaMrQ2/mdRSxEEv1YrHvTsFXVxkdxq0=;
  b=gXQfhKz0DlT8OI46mjH2FkMgdTQ4QHJ4pcm6LBf/SZ4oXfnMWwkcSG3F
   O/4lrKPPVJkQPGHWoY8/AwNKP9sMaGX2Uz1A0fXZc4opDPtj4I0FJQWRK
   J+hNxDHSTYzUdqynUVTjW1iH8VT3miil9hanytVPsxuhYtjFKfg8qQsQz
   6ivoLRAk0ERoo/9CJouNDJYccf+BpnDT8bH3qTALoILEEv5t+XCQRA8OH
   67t827wlx/r+vwmfypuo7CuTKYLNMtCkr8qJS+G2y5KWasUev556HBzp0
   t+j2go2PER/D0f60PbSHPYJT+NS2If0uOBs8hKJbUb4VP2cDYZOi/qaFt
   g==;
X-CSE-ConnectionGUID: 72eA9aMhR6uDAdhL9Rse5Q==
X-CSE-MsgGUID: +YvhP5F+QUmE38N+uOyD5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82317375"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="82317375"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 03:19:34 -0800
X-CSE-ConnectionGUID: BkraQmrLRc6DtboMi12Axw==
X-CSE-MsgGUID: /913gT0+SZyyILECWidl0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="193053094"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 11 Nov 2025 03:19:32 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 786BB96; Tue, 11 Nov 2025 12:19:31 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Cc: Yixun Lan <dlan@gentoo.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/2] mfd: simple-mfd-i2c: a couple of cleanups
Date: Tue, 11 Nov 2025 12:18:34 +0100
Message-ID: <20251111111930.796837-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_031936_621575_64A58CB4 
X-CRM114-Status: UNSURE (   5.12  )
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

Here is just a couple of ad-hoc cleanups. No behaviour changes.

Andy Shevchenko (2):
  mfd: simple-mfd-i2c: Make ID table style consistent
  mfd: simple-mfd-i2c: don't use "proxy" headers

 drivers/mfd/simple-mfd-i2c.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
