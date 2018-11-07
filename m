Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0797FC46464
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 20:55:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7E192086C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 20:55:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t4mfvC6F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lvPHIw/x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7E192086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=19tsOAO4by02/7VbiOatdoWBT8YLDD1v+aUwqO2hCSQ=; b=t4mfvC6FAizeaa
	B2/guYpW3/2Yd5JXd/z0P9tavGWHrglk0waqxyIN1DP8U92ZDxL+lr9+vAD8iKdQosnv+BYeaGLCK
	r4adpBC0MzJsJZumTTs3jolWctsnpwt5g9WdFyolFShRXjJHP2yaiHL2E+bHnmLW3LDR2LWHnXXKW
	Vrt/NFFtIh7fXXoQltmOKx/0v9+Wfsf0oDc939vJg4NEWejXCD5fvPWyyxOK9zNncirRMTlHiFQh3
	jQ3dGT16GsCYSPF7PaO+BLobZ/k33lrfCTyanOopmaTwrwsouUOyqJR7prKD0RyM5Vf+ih1P2bcoA
	moGnzst7TN/4n7uPFtnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKUqw-0007CR-4W; Wed, 07 Nov 2018 20:55:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKUql-0006su-Mo; Wed, 07 Nov 2018 20:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Subject:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R4Izts2P2Ifk2FxnuILJiJT1RAXIShGsS/Lf7lqM0fU=; b=lvPHIw/x/m22tE1opQj5XBANQ
 oy7T6e6/1eGwBoK3yXuyrVkl1obUosJhGcq5Pf2YuOpTaLrPaU/d0pV3MBkPJScr6Mxr0456QlPi/
 TZHNXHVoHG9fjMI0BuMUPRgmRN1+CpCvKWNsmW/ESvawcPflRGi6Js4JOcFa6pvrOVV4OvDluauhZ
 Z8MOhJF17gggZVoC7lWHAS8RbWC8W2+nPKccz4WHyLi3rhx5iSDQCTz6rHildoSikanuo/ZzOwC7E
 OH4ODw+VjwxkuNuz7H+aYCsDXw8hQT59ePqRZar30bb64n9wSnGFWQaeyFO7LeYY05z+fHUWX5PIK
 4UweHojWQ==;
Received: from ale.deltatee.com ([207.54.116.67])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKUqh-0002vf-IZ; Wed, 07 Nov 2018 20:54:54 +0000
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <gunthorp@deltatee.com>)
 id 1gKUqS-0005zG-Dt; Wed, 07 Nov 2018 13:54:37 -0700
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
 (envelope-from <gunthorp@deltatee.com>)
 id 1gKUqQ-00011F-4e; Wed, 07 Nov 2018 13:54:34 -0700
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Date: Wed,  7 Nov 2018 13:54:31 -0700
Message-Id: <20181107205433.3875-1-logang@deltatee.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sh@vger.kernel.org,
 akpm@linux-foundation.org, sbates@raithlin.com, palmer@sifive.com,
 aou@eecs.berkeley.edu, hch@lst.de, arnd@arndb.de, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v2 0/2] Introduce common code for risc-v sparsemem support
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_205451_765658_0CE76AF7 
X-CRM114-Status: GOOD (  11.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Palmer Dabbelt <palmer@sifive.com>, Stephen Bates <sbates@raithlin.com>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107205431.P3BdVXXx_NtxW-VC1pI2nf2j7BMuIu61ELlc78_IT-I@z>

These are the first two common patches in my series to introduce
sparsemem support to RISC-V. The full series was posted last cycle
here [1] and the latest version can be found here [2].

As recommended by Palmer, I'd like to get the changes to common code
merged and then I will pursue the cleanups in the individual arches (arm,
arm64, and sh) as well as add the new feature to riscv.

I would suggest we merge these two patches through Andrew's mm tree.

Thanks,

Logan

[1] https://lore.kernel.org/lkml/20181015175702.9036-1-logang@deltatee.com/T/#u
[2] https://github.com/sbates130272/linux-p2pmem.git riscv-sparsemem-v4

--

Changes in v2:
 * Added a comment documenting the awkwardly named memblocks_present()
   function, as suggested by Andrew.

--

Logan Gunthorpe (2):
  mm: Introduce common STRUCT_PAGE_MAX_SHIFT define
  mm/sparse: add common helper to mark all memblocks present

 arch/arm64/include/asm/memory.h |  9 ---------
 arch/arm64/mm/init.c            |  8 --------
 include/asm-generic/fixmap.h    |  1 +
 include/linux/mm_types.h        |  5 +++++
 include/linux/mmzone.h          |  6 ++++++
 mm/sparse.c                     | 16 ++++++++++++++++
 6 files changed, 28 insertions(+), 17 deletions(-)

--
2.19.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
