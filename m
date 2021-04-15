Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8330DC433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 06:15:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A0761469
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 06:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07A0761469
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+L/03/DfcZO4tJCMMOFc8e7RcR5o7hC3RkxFhwD9Ofw=; b=a42wNJCFXLSYYeblg+1lGIXbQR
	oArUVvbdWEE1XDgeiUhXX3oBhMR8bvnKBb7IWy4n3mC080PyB/j8mHiUF6KrhPVUN2yFjQWAPK99K
	LZksB61sa3ao8pT0wnDebP4h44ujYdVD+yLOYXpRPllwG7bSa8yBv7xaO5uXsmPhXhOSxMByUgFbD
	yrzJijbr9VA5rVEK8WQT6yLFFN3s9jEx1olAXBMap7UXnbRU0Fb5ewzOEKWxkMCSBPapwpEFdOacO
	4V8XUf9DSUxKo4uY2YN0n2cAICygONTdmsEIoq4x4WMZjZReiaTRZyqB3NCd8R4EkVCy6i0Z2VXAO
	iUCUh9Gw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWvHq-00F1vc-Pb; Thu, 15 Apr 2021 06:15:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWvHX-00F1tJ-Fe
 for linux-riscv@desiato.infradead.org; Thu, 15 Apr 2021 06:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=tiLDYJ7A1d8II3I0Aii/VhaJwAZCRC8cDdWNEMERsDY=; b=3XNCGnddOPvhV43ZbjCGLNeYeU
 6ZNv2/V+xa3P+R/0n4NTAq92kM3ja8JgcJ2MGB+64tFuylMonxTVMUzifzry8uFhxRjkyQZmn9V9b
 8DMwNDBtw0zzDjVXPOF4nqJ9AeB6AjJOvlgLul2ZezsIpS2hw8+tS8A9HPQWiK2oC53DphkP0NVfo
 cfRdaM9fRky9teslBCkV0lPRvXqXICkJMVULkVJSYJS2YXVIeyInBzeo8Lfdz6U0+XPavfWlNHA9Z
 gbvaxOA+hJqwvDwEGWpYcYDt2wCRYaccyu8k36svR1ex7c6PzBcpYybnLhLRLXdKAE+X4bDFcHoG1
 wYnPd7QQ==;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWvHV-008Iy4-2s
 for linux-riscv@lists.infradead.org; Thu, 15 Apr 2021 06:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618467313; x=1650003313;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZOmJ1HqCf9egE/XxHkdLJPfyCM24LA6jlc8zeJf9vT4=;
 b=HeBnwm/B53Qus1BZ+LXElWC7HKXI4mNOwSj60ONj1PCfD13k5RLY7uo0
 xIEZxzEshhkyOuZX1tqrbkXObDCepJ27HT4I8OOMSbv9U4Dbu+fcb8oZY
 GxmHIax+q0iOhNC9cl3/RXD8BGo6JAkg1nTWwCB1puYxWaDdPTcQUf53D
 OsH5MEY9+wo9vvshCUdVJ9eGa8C2Hp7V0pbPFsop9AQjX6sSMJnByHIV+
 021QUsyMcthH26uE/fkrMzWTpzMlmPj2vwGLU8GxiB6ZA8IOlVkx2pxKt
 6vuQL0A9hS3EkvNqBzZwf8px6M2ITB9+sDt6+PYISMVkCBtEQye+OMbYG g==;
IronPort-SDR: JPsMrsEjx4ra68C4U6ABs3rnYAZ3PzccS+lInPXxQ9Ka2QOHdFodJvA8+GKWgK5Gxe57B6d0jv
 9LG+tpr5x91RZk5FtJr9ukk8WIECQdWTC5Jk5UdXKEEUUI7ffCeQu61rCDNnfy1jgW4UgkfEI2
 ZT2a2Hk0XymgFpcp/6QnWtVvXPhNaxG2l9QOU0LuZOFB09ejRWwCDHRNedN+2a+/PjNbJMgy/w
 krtHFIb5/mC+cfircDGPKP8lhkx+U5NLQCR4Ghr5jTNHZOi43u2FUi/zz79HNVNo7pvA30lALP
 pQs=
X-IronPort-AV: E=Sophos;i="5.82,223,1613404800"; d="scan'208";a="169391938"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2021 14:15:10 +0800
IronPort-SDR: OumxZsYtoLgbBRDSseBBzi/6iMqa1DlWCRztjn7fcddKEkrU6VQ0WORbcz6OnQwIlP3wv/l7I+
 9/HkGaeL3K8P1lX7qu4zk23oyaUK02/lZE6n2my5F8JtdNCmIa6MxjOpIJqfkrSNnMf0Xh22j7
 l4wTd5etxN6Alb1/Zy7HvzFF6QKaCze5ORE9QJlG+OWb+Cs6NDWWRDjtRZXGfOPk3zpTc48Fve
 62nDrE9PnDrXdKfr405E55Gqm68ZN65bUmiwhB6tArmBQ6kWXHYozkdyAhWYdkOSk4Be+nlJ5j
 AA0doAtCNnx0kYac1Gu4N+Wh
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 22:56:07 -0700
IronPort-SDR: Csvnbia9pjF09SDOg/oS/8DooyPcMedsr9AbUQ3utxVRxlKWGhkFVhoL6e7YdQIr/JJlu73RH1
 LPAxw5IeZiLdJMrtp7W/qMAIT/HpgXy1HOmI/Vb5+h94Q/nHAlAkYiBI7OupdtQAS9Ts/dAzm0
 9vp/3ptZmgTeObIs1JTThvE2QE8ZUA5x1KHrQpqMxaDuFLdxXlqtK2iRLUfkzFKmdnSdykVHCT
 WVW58HNTBUu4TLac1kBuY4+TTlydrfRN/OhOLxv/XL6CQz2V/IY4rs/YOS5+SYxMJC5uelqzvP
 1zA=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.118])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Apr 2021 23:15:09 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: uclinux-dev@uclinux.org, ugerg@linux-m68k.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Anup Patel <anup.patel@wdc.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH v3 0/2] Fix binfmt_flat loader for RISC-V
Date: Thu, 15 Apr 2021 15:15:00 +0900
Message-Id: <20210415061502.7248-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_231513_175846_D3CD707E 
X-CRM114-Status: GOOD (  12.44  )
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

RISC-V NOMMU flat binaries cannot tolerate a gap between the text and
data section as the toolchain fully resolves at compile time the PC
relative global pointer (__global_pointer$ value loaded in gp register).
Without a relocation entry provided, the flat bin loader cannot fix the
value if a gap is introduced and executables fail to run.

This series fixes this problem by allowing an architecture to request
the flat loader to suppress the gap between the text and data sections.
The first patch fixes binfmt_flat flat_load_file() using the new
configuration option CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP. The second
patch enables this option for RISCV NOMMU builds.

These patches do not change the binfmt_flat loader behavior for other
architectures.

Changes from v2:
* Updated distribution list
* Added Palmer ack-by tag

Changes from v1:
* Replace FLAT_TEXT_DATA_NO_GAP macro with
  CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP config option (patch 1).
* Remove the addition of riscv/include/asm/flat.h and set
  CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP for RISCV and !MMU

Damien Le Moal (2):
  binfmt_flat: allow not offsetting data start
  riscv: Disable text-data gap in flat binaries

 arch/riscv/Kconfig |  1 +
 fs/Kconfig.binfmt  |  3 +++
 fs/binfmt_flat.c   | 21 +++++++++++++++------
 3 files changed, 19 insertions(+), 6 deletions(-)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
