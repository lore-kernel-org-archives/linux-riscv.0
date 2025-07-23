Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24C9C83F17
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 05:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xwbpJivsJDke4ZRMv4dvm7AHcHIUJCZAwxtJIy6UPV0=; b=DQrNf1c+/FwBrm
	mb7Ps3RAmn/kneTtJlE0YCsZnzASNzOtUH9r55IVMcFkZUkmSAzO5dy6Ox+Sm4PupXXGUpBr9cDy2
	wfkZR7aWLxuDm5PF3prOmPEgdVGZMhrxR0HqxeOEBIAzXMUIRSjNYt4YWrr2+tKJuDQ4QpJbcE9hQ
	qMHctMuWC2KZid2g6X1kMoXJ9FiRCqnl1d7BPav4NPl+YLkucwthngzxFeWoDMfwa23+BCm9cIOeB
	mJgZtUK9r4eko9ssAOa/MWhIO8Ltu8Xmlk1tprLo2h+ffUFD1ZK4Gr72oxKM16Wxep+n2HTdoGcyu
	xjJGyj14fyd5Sz4jKGlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueSAr-000000044Pq-2H2O;
	Wed, 23 Jul 2025 05:37:53 +0000
Received: from smtpd7.iitb.ac.in ([103.21.126.62] helo=smtp1.iitb.ac.in)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueSAn-000000044PS-3W3n
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 05:37:51 +0000
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 7B5481014A3C
	for <linux-riscv@lists.infradead.org>; Wed, 23 Jul 2025 11:07:47 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 7B5481014A3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1753249067; bh=jgmU0mVrM9TEWK9SDqyK12S6GaRiPg9G1If9CLN/p8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nuvd4NNkx9+OaWJx8MshqRM6HGFPCey7VmVboKOkbDftyBkdZPud0RFn8SnWFzEtt
	 dupzPgNxoowLXB5IZhR6ulEonRR2v0VyilSdbojQeZP33hmNQfROUlRvE8x2Wetwd7
	 TWuB1VNhN351k1gOh0+VwWFzwZ53Rl3ryenCN72Y=
Received: (qmail 15488 invoked by uid 510); 23 Jul 2025 11:07:47 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.944097 secs; 23 Jul 2025 11:07:47 +0530
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 23 Jul 2025 11:07:43 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id 4BA853414F2;
	Wed, 23 Jul 2025 11:07:42 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 034231E81366;
	Wed, 23 Jul 2025 11:07:42 +0530 (IST)
Date: Wed, 23 Jul 2025 11:07:36 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: Haylen Chu <heylenay@4d2.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, dlan@gentoo.org,
	elder@riscstar.com, inochiama@outlook.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heylenay@outlook.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, unicornxdotw@foxmail.com,
	jszhang@kernel.org, zhangmeng.kevin@linux.spacemit.com,
	akhileshpatilvnit@gmail.com, skhan@linuxfoundation.org
Subject: Re: [PATCH] clk: spacemit: ccu_pll: fix error return value in
 recalc_rate callback
Message-ID: <aIB1IPa9HBDh+Vns@bhairav-test.ee.iitb.ac.in>
References: <aH6P3lChCXhi3pe4@bhairav-test.ee.iitb.ac.in>
 <aH7kjkC_YSEi7dFz@ketchup>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aH7kjkC_YSEi7dFz@ketchup>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_223750_371119_62225081 
X-CRM114-Status: GOOD (  16.02  )
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

On Tue, Jul 22, 2025 at 01:08:30AM +0000, Haylen Chu wrote:
> On Tue, Jul 22, 2025 at 12:37:10AM +0530, Akhilesh Patil wrote:
> > Return 0 instead of -EINVAL if function ccu_pll_recalc_rate() fails to
> > get correct rate entry. Follow .recalc_rate callback documentation
> > as mentioned in include/linux/clk-provider.h for error return value.
> 
> Nice catch, thanks.
> 
> > Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> 
> Here misses a Fixes tag. With this added,
> 
> Reviewed-by: Haylen Chu <heylenay@4d2.org>
> 
Thanks Haylen and Alex for the review. Sent V2 patch with Fixes tag.

> > ---
> >  drivers/clk/spacemit/ccu_pll.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
> > index 4427dcfbbb97..45f540073a65 100644
> > --- a/drivers/clk/spacemit/ccu_pll.c
> > +++ b/drivers/clk/spacemit/ccu_pll.c
> > @@ -122,7 +122,7 @@ static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
> >  
> >  	WARN_ON_ONCE(!entry);
> >  
> > -	return entry ? entry->rate : -EINVAL;
> > +	return entry ? entry->rate : 0;
> >  }
> >  
> >  static long ccu_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> > -- 
> > 2.34.1
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
