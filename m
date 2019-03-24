Return-Path: <SRS0=PVrh=R3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EABC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 08:37:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DA7221741
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 08:37:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RznzXwJw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DA7221741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7FuqeSioyKtc6OooDMkc+3AC9rsK9zuG2wHaYS960k=; b=RznzXwJwX3f2xt
	JFEM4fUnZ3lkbO9tfd+LA6qlLIwEXzTNS729mvRgbtE1BL57ffnyvp1f4TzjkIDs3YhfJghIUIXR/
	/MQioyKmWqDM92DSumx9V9AMKEEgQVHDJIUXpmPY9XBLn+7cFjUxYgaIH8gYhGCRJxt67Fk4RGP+1
	1qz+NO3XU8lBDbjc6LlwoMBm8SuQnLUNTdLv6tppEFYyYLPuSYdBoxv0cFSChTCNJp0413wAsvoRt
	yAj3QvsaPO8Da9G3ZxvHpn21BfCSyUVYSI4CYq+B0BnG4i6aranuG5f9T+l59Y3OxYI+hPS73m2/V
	SIDEId1YvSxkB7HDUaCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7ydT-0008Lp-MU; Sun, 24 Mar 2019 08:37:43 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h7ydP-0008LW-UB; Sun, 24 Mar 2019 08:37:39 +0000
Date: Sun, 24 Mar 2019 01:37:39 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: 32bit kernel is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
Message-ID: <20190324083739.GA31909@infradead.org>
References: <CAAhSdy0mUboGJH_GJbsGFBwcukjttVQcTGfzwkaMFQb9ZVY4Mg@mail.gmail.com>
 <20190322104209.GB24367@rapoport-lnx>
 <20190322132556.GB19263@infradead.org>
 <CAAhSdy1VS8-3npcZUzjicnKGsjHcc6WH3Co6Hx2=GvttoatWcA@mail.gmail.com>
 <20190322134043.GA18818@infradead.org>
 <CAAhSdy2qbU1uhnVQvh0C_FOoKDy-Y0ZTUryAKD97xAXXGQSdCA@mail.gmail.com>
 <20190323172153.GA9085@infradead.org>
 <CAAhSdy07GsHXpG9MJZ4aiB5uG7D+9RA+17Nb1MrWdFg9ee6rUA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy07GsHXpG9MJZ4aiB5uG7D+9RA+17Nb1MrWdFg9ee6rUA@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Mar 24, 2019 at 07:12:07AM +0530, Anup Patel wrote:
> > Just curios - if you just move setup_vm and dependencies into a new
> > file that is compiled with -mcmodel=medany, just like setup.c,
> > what issues would we still have that require explicitly passing the
> > load address?
> 
> There are four cases here:
> 1. 64bit with cmodel=medany (default for 64bit system)
> 2. 64bit with cmodel=medlow
> 3. 32bit with cmodel=medany
> 4. 32bit with cmodel=medlow (default for 32bit system)
> 
> I had tried using cmodel=medany as default for both 64bit and 32bit system
> and it works fine because there is no issue with cmodel=medany but it is a very
> crude fix and things break again if someone explicitly selects cmodel=medlow
> using kconfig.

Well.  What I meant is to override the model just for the new file
containing setup_vm, just like we explicitly override the model for
setup.c in arch/riscv/kernel/Makefile:

CFLAGS_setup.o := -mcmodel=medany

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
