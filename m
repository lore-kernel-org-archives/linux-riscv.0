Return-Path: <SRS0=vaJP=W6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A04AC3A5A7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2019 09:32:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A29022DCC
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2019 09:32:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u2owD/9Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A29022DCC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WpRSSZtAXdUhHDvukNAUuwQL/tjRRMt3ogJF7T3w54A=; b=u2owD/9Yyn2F8+
	RRPxHGTcwWEjAlfp8k8JPkxlEuPbkWCq0kIgSzeFARV+hPB+ZCJqnshwFuMmX49l7ktTBwkzmk0O7
	BC43HdKYqkjOzdtb0bcH88+yHmBkDQeRwy/tsmYeiUGR0ncBPm6SvnfocUQHKe53BMcQo0f5gPGtM
	xXyPy/5SfDqmi0zsWAxyh+Is1msomv7wdUnH+mzyMv/07NPkPDMm55hQXuJUmYJLznjRlt6j16V5o
	/97yasXhy+GRqQlZ0EUa+orDs+bjdkpH3aCsRfWhBD76FeEyMyG9rf2IX6AhzrXFpiec8cpiO7U/4
	aCaGzhKgHOZq63hb2bcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i55B5-0004GF-2E; Tue, 03 Sep 2019 09:32:43 +0000
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i55B3-0004Ft-Bn; Tue, 03 Sep 2019 09:32:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: RISC-V nommu support v4
Date: Tue,  3 Sep 2019 11:32:19 +0200
Message-Id: <20190903093239.21278-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi all,

below is a series to support nommu mode on RISC-V.  For now this series
just works under qemu with the qemu-virt platform, but Damien has also
been able to get kernel based on this tree with additional driver hacks
to work on the Kendryte KD210, but that will take a while to cleanup
an upstream.

A git tree is available here:

    git://git.infradead.org/users/hch/riscv.git riscv-nommu.4

Gitweb:

    http://git.infradead.org/users/hch/riscv.git/shortlog/refs/heads/riscv-nommu.4

I've also pushed out a builtroot branch that can build a RISC-V nommu
root filesystem here:

   git://git.infradead.org/users/hch/buildroot.git riscv-nommu.2

Gitweb:

   http://git.infradead.org/users/hch/buildroot.git/shortlog/refs/heads/riscv-nommu.2


Changes since v3:
 - improve a few commit message
 - cleanup riscv_cpuid_to_hartid_mask
 - cleanup the timer handling
 - cleanup the IPI handling a little more
 - renamed CONFIG_M_MODE to CONFIG_RISCV_M_MODE
 - split out CONFIG_RISCV_SBI to make some of the ifdefs more obbious
 - use IS_ENABLED wherever possible instead of if ifdefs to make the
   code more readable

Changes since v2:
 - rebased to 5.3-rc
 - remove the EFI image header for nommu builds
 - set ARCH_SLAB_MINALIGN to ensure stack alignment in the flat binary
   loader
 - minor comment improvement
 - use #defines for more CSRs

Changes since v1:
 - fixes so that a kernel with this series still work on builds with an
   IOMMU
 - small clint cleanups
 - the binfmt_flat base and buildroot now don't put arguments on the stack

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
