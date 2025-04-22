Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA583C369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 11:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KjtV4mGBOagzOTB+1zU7H/RO7vNJsIfTPp9qHBn6v5s=; b=E86oz43oMMu/bH
	G1En1Y26UTM5u2IMDl+IngDMOhJTXw9em9Zyuf/W3a6sNIUHVVpAOEac5Dfs7wq0025r2NCEmEnPH
	fuZCoS/73MAvUMbqcU5V3cnnqWmpiYnHSFK5Pj6Op/AOIyugzvpgl01z5fO2g3ncZOEZQyhgwU9cl
	BepSF7s+VYVZsDahumKDE8rC4s9FNSRu93JzNlFG0FfeWshTZRJMB4Sag/P0AL7n9VNHAlKEJCC7H
	6LH5kDfUKx+QJ9vkwS28wrpC5iR8Kk8TahjIc49F3AHf8obRgHLE8fFFGS9eoc5G/Zv0gKacyRlFF
	fVMwdL5lTMH2bLfJQUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BgJ-00000006uuB-3IrG;
	Tue, 22 Apr 2025 11:20:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BDM-00000006pxP-1eQj
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 10:50:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 448E1A4B90B;
	Tue, 22 Apr 2025 10:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 883E8C4CEE9;
	Tue, 22 Apr 2025 10:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745319055;
	bh=MrCnwF7GdHkVudInO56SmjoTmH9xscxr0moc8/xmCsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zjV3s0mQzAED2/N1v4BwcnaDaVYf7m9YLTrcC+oo27o1aTa76+Db7y1pihHuRAjRZ
	 Fsa72hBqbtIH5G9TsKZkib6jncINU0cOVLSETRLjcJ2Eim/MkYUpigLT/L3130TG2h
	 iKG9saWN93SIy2/VBCiWw7oo6GC1d9hQ3qmOEhWY=
Date: Tue, 22 Apr 2025 12:50:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Ryo Takakura <ryotkkr98@gmail.com>, alex@ghiti.fr,
	aou@eecs.berkeley.edu, bigeasy@linutronix.de,
	conor.dooley@microchip.com, jirislaby@kernel.org,
	john.ogness@linutronix.de, palmer@dabbelt.com,
	paul.walmsley@sifive.com, pmladek@suse.com,
	samuel.holland@sifive.com, u.kleine-koenig@baylibre.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 1/2] serial: sifive: lock port in startup()/shutdown()
 callbacks
Message-ID: <2025042202-compare-entrap-0089@gregkh>
References: <20250405043833.397020-1-ryotkkr98@gmail.com>
 <20250405044338.397237-1-ryotkkr98@gmail.com>
 <2025040553-video-declared-7d54@gregkh>
 <397723b7-9f04-4cb1-b718-2396ea9d1b91@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <397723b7-9f04-4cb1-b718-2396ea9d1b91@suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_035056_504216_6465F480 
X-CRM114-Status: GOOD (  25.91  )
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

On Tue, Apr 22, 2025 at 12:20:42PM +0200, Vlastimil Babka wrote:
> On 4/5/25 09:35, Greg KH wrote:
> > On Sat, Apr 05, 2025 at 01:43:38PM +0900, Ryo Takakura wrote:
> >> startup()/shutdown() callbacks access SIFIVE_SERIAL_IE_OFFS.
> >> The register is also accessed from write() callback.
> >> 
> >> If console were printing and startup()/shutdown() callback
> >> gets called, its access to the register could be overwritten.
> >> 
> >> Add port->lock to startup()/shutdown() callbacks to make sure
> >> their access to SIFIVE_SERIAL_IE_OFFS is synchronized against
> >> write() callback.
> >> 
> >> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
> >> Cc: stable@vger.kernel.org
> > 
> > What commit id does this fix?
> 
> > Why does patch 1/2 need to go to stable, but patch 2/2 does not?  Please
> > do not mix changes like this in the same series, otherwise we have to
> > split them up manually when we apply them to the different branches,
> > right?
> 
> I admit it's surprising to see such a request as AFAIK it's normally done to
> mix stable fixes and new features in the same series (especially when the
> patches depend on each other), and ordering the fixes first and marking only
> them as stable should be sufficient. We do that all the time in -mm. I
> thought that stable works with stable marked commits primarily, not series?

Yes, but when picking which "branch" to apply a series to, what would
you do if you have some "fix some bugs, then add some new features" in a
single patch series?  The one to go to -final or the one for the next
-rc1?

I see a lot of bugfixes delayed until -rc1 because of this issue, and
it's really not a good idea at all.

> Also since the patches are AFAIU dependent on each other, sending them
> separately makes the mainline development process more difficult, as
> evidenced by the later revisions having to add notes in the diffstat area
> etc. This would go against the goal that stable process does not add extra
> burden to the mainline process, no?

If they are dependent on each other, that's the creator's issue, not the
maintainer's issue, no?  :)

Submit the bug fixes, get them merged, and then submit the new features.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
