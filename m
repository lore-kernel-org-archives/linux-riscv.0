Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A2CC43461
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 06:51:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F8BE20756
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 06:51:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r2XOIUhn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QjEmc6zX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F8BE20756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wnnvCVhPFzKP03MOf8QeNpHTJeiBivdeQBT0xH2iqEs=; b=r2XOIUhnDTEboVALyKwFbBgX5
	K6YUkPdxJK+h/0p47pEUVne+o/hhgWjzE7lZmN3dWi1IwyHPgMKXNdit9HuDNG4f4MgFvdhSNQvkz
	2RLKwpTg+lxIuAhjDjPMqomUdZuOhnDBZh7jGPKNgpq1YD5nM/f/AQq0cEbz6NW0QjReP/nwdIxvb
	FxmerNDToMbHCytw+RRFvm6WL7+ef2YYmR8iLzrKfi+oZtaX/t9Cbor3Gs7vhKVHIO92xx4Ssu6cZ
	q2DvSSXeFG9HZoUeXYgA0XdRECqQrHjthU3h4Gw4AoqhnRXi4tpW4pQHmMyZiZHgW7Hgb6Rl3nEFj
	EJAzfFCew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI4oZ-00042a-PD; Tue, 15 Sep 2020 06:51:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI4oX-00042A-N6
 for linux-riscv@merlin.infradead.org; Tue, 15 Sep 2020 06:51:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=z9q5JzGJ9bbdpQmFVTXpkgryVrOXueGpKooYCbdm3/8=; b=QjEmc6zXuT8yG9UICzZ8AmPM1q
 XJ98Svu1kbLcZnmX3qdlLjthEkalFWdOU5UfJn9LDLfP3L39Bm255ATzl4c+M1YMnZ3i6KEHv9EFq
 vnn8dMi7cn9w8lJSQunlqJJeoeZEG4hr+CcHxykq/4Y+8Cf29fUTyE51mMCayaIeEvVu8SUg4WjoS
 p0J0UZZojFaOBErmBql7zFVDMS4yKUw8zcbnPSkp59P0yaZxodZHNfAIdKQBPISiRFYGo92+PcV9g
 O3EY1UVcorjAeRt4OmyZUrr/pNoBLSXS5lWyZTLhnWJRnORwIgT79WRcFT3zluKBm0B4WM9Oq1Y81
 d1qBzzaQ==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kI4oU-0008IH-PU; Tue, 15 Sep 2020 06:51:38 +0000
Date: Tue, 15 Sep 2020 07:51:38 +0100
From: "hch@infradead.org" <hch@infradead.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Subject: Re: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Message-ID: <20200915065138.GA31702@infradead.org>
References: <20200914165628.445087-1-palmerdabbelt@google.com>
 <20200915054649.GA16371@infradead.org>
 <CY4PR04MB37512693510EE0C8E8B29F4CE7200@CY4PR04MB3751.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR04MB37512693510EE0C8E8B29F4CE7200@CY4PR04MB3751.namprd04.prod.outlook.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: "hch@infradead.org" <hch@infradead.org>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "kernel-team@android.com" <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 15, 2020 at 06:50:24AM +0000, Damien Le Moal wrote:
> On 2020/09/15 14:47, Christoph Hellwig wrote:
> > I won't have time to set up the K210, but this fixes the timer issues
> > on older Qemu versions that don't implement the time CSR.  Although I
> > also need to revert the binfmt_flat patch to actually get to userspace.
> 
> So revert is needed ? Digging in the flatbin format, I do not see why the offset
> you removed would be needed, and it does not seem to affect other arch anyway.
> So I am really suspecting a problem with riscv uclibcb or elf2flt, but can't
> quite yet figure out what may be wrong there.

I did not have time to find out if what we did in RISC-V nommu was
correct or wrong.  But to get my existing userspace to work I had to
revert the revert.  I'll try to find some time to dig into the binfmt
flat issue and elf2flt soon.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
