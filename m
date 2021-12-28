Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BA5C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 17:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=G/q0P8NVWfGPDy6A7/B25iZlDsW2l24D4d/WAAaY3E8=; b=zfTV+jbiDFZVKR
	O12pFvijYVJTIlLqGYSymbAuiCjNhyj5TKPmc2rOuqPpcDlFeyyfP1z3J8ZjXeTZI14qWYxGUcNQA
	IXREWOyg1lUAXlv8gxYszEMlph4YU9umco3g1c36p/a06VamRrUbZVU+8AsGfkyzmD3c5Tum6ZEdH
	zcrt1IJNcox7rpwdcXT5ZizJGjgDp0LfyjZqRaX6WOP0ZggCCVVHl0oXMvUNf4k2HjngTe2RNUf1z
	vSslx4/aKgBbL78lw75wRhe1+AGgiR+Ip1A//DCZmrbW5YC3NHLh/k07J+PUf2mfxv3oWPfYu4ddV
	1Y2lRJzSkwdsLzSguAZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2GH1-001dh4-SH; Tue, 28 Dec 2021 17:28:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2GGz-001dga-0H
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 17:28:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 756C161221;
 Tue, 28 Dec 2021 17:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8C2C36AE8;
 Tue, 28 Dec 2021 17:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640712507;
 bh=dXA+jtJKXsZeuGL+gqW27tuo78x2G9m366Sa3KzPs/Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=crA/K81U+X4as89k12VFJhq7l5G6mmRiyHJCr7rvQuKaJSWdRD8HsUWMtEiR6YiT9
 xkh3fc1SixiPjDrMU7N3s05mIn5FkXwJyvfvz2HzU6vrRz2riOGV87mq/O3z4d8tQl
 l3wzHW2xFwKfv/dalFrjV7NW+fNDw/8hVQWXM7ZxJJ/MA9xQMMsO/9gsZW7o3NqZJ4
 IikED5UaPWdt+nNRLG32gAEABqEKOfGQmWnJ51QmGxTBRsSymGbPiYQxhpnJTOsMHR
 ZQBcfSywIaDJPWsFdgoWCxTk5qfXOwl/2CtDSh3spa9fUbjDU36CMRuAVLEtAj2MBM
 dc88VkjPVXadA==
Date: Tue, 28 Dec 2021 11:28:25 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org
Subject: Re: [RFC 28/32] PCI: make quirk using inw() depend on HAS_IOPORT
Message-ID: <20211228172825.GA1604151@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5112a787b635d5d2fc80a7f126c28176ad151098.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_092829_119330_1D9022EA 
X-CRM114-Status: GOOD (  21.19  )
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

On Tue, Dec 28, 2021 at 05:52:05PM +0100, Niklas Schnelle wrote:
> On Tue, 2021-12-28 at 10:35 -0600, Bjorn Helgaas wrote:
> > On Tue, Dec 28, 2021 at 04:25:25PM +0100, Niklas Schnelle wrote:
> > > On Mon, 2021-12-27 at 16:33 -0600, Bjorn Helgaas wrote:

> > > > BTW, git complains about some whitespace errors in other patches:
> > > > 
> > > >   Applying: char: impi, tpm: depend on HAS_IOPORT
> > > >   .git/rebase-apply/patch:92: trailing whitespace.
> > > > 	    If you have a TPM security chip from Atmel say Yes and it
> > > >   .git/rebase-apply/patch:93: trailing whitespace.
> > > > 	    will be accessible from within Linux.  To compile this driver
> > > >   warning: 2 lines add whitespace errors.
> > > >   Applying: video: handle HAS_IOPORT dependencies
> > > >   .git/rebase-apply/patch:23: trailing whitespace.
> > > > 
> > > >   warning: 1 line adds whitespace errors.
> > > 
> > > ... But I just tried fetching the patches with b4 on top of
> > > v5.16-rc7 and the resulting tree passes "./scripts/checkpatch.pl
> > > --git v5.16-rc7..HEAD" and has an empty diff to my branch. What
> > > tool did you use to check?
> > 
> > "git am" is what complained.  Here's what I did:
> > 
> >   $ git checkout -b wip/niklas v5.16-rc1
> 
> Ah this seems to be because my patches are against v5.16-rc7. I
> noted that in the cover letter but I guess that is easy to miss and
> might not match expectations.

I get the same complaints when applying to v5.16-rc7:

  $ git checkout -b wip/niklas3 v5.16-rc7
  $ b4 am -om/ 20211227164317.4146918-1-schnelle@linux.ibm.com
  $ git am m/20211227_schnelle_kconfig_introduce_has_ioport_and_legacy_pci_options.mbx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
