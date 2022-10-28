Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC5BECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 22:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=InvWEEvD8tIE2kbwhgkoMmkM3bmS8EG78H13mULxnlA=; b=Wu+F9S+ldy+a9F
	LanU1XBLETuaSUA2BxPlVMrcv3UDmeIfTcGyN/x9NMQdfMG9Ri9vC1/J2yGP1AmgotRDdj9203Pu4
	CZHqRIw80gQpKU+fAktihmkdOwjMUvEilvMnW/hLyqN8xHLtG4sYEtbrNP7wZWKJYKvMZ+v/75xnr
	27oBJ2CaKP+isD2oLaBFhq2GLJTG8QgVRCNpE4TUIADKD4SGDh/vmxxfHK4OpnXJtITL5QEWbpSol
	RiTzldBR+zUzt2M2ktVNwkllWbd83oACgtKv8yJZfGbGabhBSPBr+pOrDNMAOBTkmn9phxruQHE+W
	3ZiBX+RxCR8TGCAfRcdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooYIG-003CvU-V1; Fri, 28 Oct 2022 22:57:40 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooYIE-003Cv3-9L
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 22:57:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C0BADB82D3B;
	Fri, 28 Oct 2022 22:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16695C433C1;
	Fri, 28 Oct 2022 22:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666997855;
	bh=+BV2t4GgwRbOB5h/5jzRUzd81/DfmzD3pGnqG7UMbmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jkb3nmGOOt8ph62u+0hOpOxsFNkwuX13YJft3XGsTKoiy8x2FlwFEZ8EkcPZno87+
	 7t4ahSiqVRnHSrvUEqhxVZlYR8BcTIEHHqFntycHbYvX+ZYr9PDltx10PqXPL0kCdE
	 Kd2HNLXhBGjicoEmHJuScEwsp5zdEvdTtfpuJHgkAdUF70glgy23C26Iu10Hl1+L4j
	 eSAjGc/KJlMEGau/sQXMAaRtHL3xWLvo0o8jHNwH3+dyNJBind4UzNHAtUHBW89DQb
	 QBlD0Oo0E12qgGtnD7I7d7KIP2+hiuG9kHJzBMPYRYAau5lxMFahnBw5Oe7d3lPDZg
	 ChyrlQAcEHAPg==
Date: Fri, 28 Oct 2022 15:57:33 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: twd2.me@gmail.com, linux-riscv@lists.infradead.org,
	ndesaulniers@google.com, llvm@lists.linux.dev
Subject: Re: [PATCH v2] RISC-V: build: Allow LTO to be selected
Message-ID: <Y1xeXUhnONoB0S6P@dev-arch.thelio-3990X>
References: <20220512205545.992288-1-twd2.me@gmail.com>
 <mhng-e9b5bd39-0929-487c-a761-6a3ff508d969@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-e9b5bd39-0929-487c-a761-6a3ff508d969@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_155738_489503_1DE3E109 
X-CRM114-Status: GOOD (  20.51  )
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

On Tue, Oct 04, 2022 at 06:57:10PM -0700, Palmer Dabbelt wrote:
> > Allow LTO to be selected for RISC-V, only when LLD >= 14, since there is an
> > issue [1] in prior LLD versions that prevents LLD to generate proper
> > machine code for RISC-V when writing `nop`s.
> > 
> > I have tested enabling LTO for `defconfig`. The LLD took ~2m21s and ~3GiB
> > on our Intel Xeon Gold 6140 server and produced an 18MiB Image. The image
> > can boot to shell using an archriscv rootfs on QEMU.
> > 
> > I have also tested it for `allyesconfig` without COMPILE_TEST, FTRACE,
> > KASAN, and GCOV. The LLD took ~7h03m and ~335GiB on the server,
> > successfully producing a 1.7GiB Image. Unfortunately, we cannot boot this
> > image because the `create_kernel_page_table()` -> `alloc_pmd_early()` ->
> > `BUG_ON()` logic limits the image to be < 1GiB. Maybe we can fix it in a
> > separate patch further.
> > 
> > [1] https://github.com/llvm/llvm-project/issues/50505, resolved by LLVM
> >     commit e63455d5e0e5 ("[MC] Use local MCSubtargetInfo in writeNops")
> > 
> > Tested-by: Wende Tan <twd2.me@gmail.com>
> > Signed-off-by: Wende Tan <twd2.me@gmail.com>
> 
> Sorry for missing this, the v2 never made it to my inbox.  Not sure exactly
> what happened, but an off-list ping made it through.  I've put this on
> for-next, I don't have any way to test it because I don't have clang setup
> yet.
> 

Did this get dropped by accident? I do not see it in your tree.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
