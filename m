Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09924CA5FA7
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 19:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1mjL5E7z4wdKqd25tP9hxDsoSFDQi/7Izdo/iIbetA=; b=AhyydifJswsQiE
	wndF3ARpENCvZ1Vc2eDAnhxpD+angMMIXKhaoDGN5ie6FdGDXIJdimwN1lsTOI8YdW4FbMh95bWXe
	hSF9bWxXcYgLjyGkI6Mv0HniKfvLq1vKiNRQ0nqDtKoqD44b2ETgFONShOgwA6BoBdFm2OBDwRlpx
	09YkrxZKDkc7KiAJF5oAFTWUt5y8Ve97hCKb9hgmdXYuoU2HgwyrafC9yV7HJ46t1qxLiL/7bjMFb
	3IBSykc0OoPc8aKIu+AADCDeTaHPht7cAnFicq/Z0T7k46tC3lmiP8drqrjuI/A8/6+VPXQsDHp+x
	/Nc6ahAJ0bLn7ZH7GrPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdyF-00000004RSn-1Xif;
	Tue, 29 Sep 2026 19:58:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdyD-00000004RSg-1p7v
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 19:58:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D4F9F60235;
	Tue, 29 Sep 2026 19:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683301F000FF;
	Tue, 29 Sep 2026 19:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790711912;
	bh=FM08SSqsWSOZJWtV+yNcCq2za0yCimEnBoqDGB1eG60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MD8JS7rUltqIokKYj4s9NMk3Cw71hV8LHF0JdqABhcsGjIZOQMNizD0pmlplj4qQf
	 uezCHmwJmrp3KKwtkEdcP8mhilJQuzmWMaktNjxSxnva1Nk+07kZ2kbFPllXEfHg5T
	 ccAdRFxzUKCnrfboj8FpXsZiFbHn3BeOGSgu3uWn4qXiTcxMak+Crv+64pXOMifXUs
	 tSC0V5lUA/Jor0235C/iyi83lx/m0koI1TgVDw1cCfVFoupkR4tJsy/VMPaifxBHdB
	 YWlLq5R1VD5RLEoHobWJhABApSpeEo0BvRSE9B0RDZM8Bb+yztDCA96EONxPXRhdpH
	 uoqezxorutw6w==
Date: Tue, 29 Sep 2026 12:58:31 -0700
From: Drew Fustini <fustini@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: tenstorrent: use regmap_assign_bits() for
 conditional set/clear
Message-ID: <arwYZ3rU1fNTFTld@x1>
References: <20260924083439.461769-1-peng.fan@oss.nxp.com>
 <arV1rOMRG6D9erK8@thelio>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <arV1rOMRG6D9erK8@thelio>
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

On Thu, Sep 24, 2026 at 12:10:36PM -0700, Drew Fustini wrote:
> On Thu, Sep 24, 2026 at 04:34:38PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> > 
> > Replace if/else blocks using regmap_set_bits()/regmap_clear_bits() with
> > the simpler regmap_assign_bits() call.
> > 
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/clk/tenstorrent/atlantis-prcm.c | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/clk/tenstorrent/atlantis-prcm.c b/drivers/clk/tenstorrent/atlantis-prcm.c
> > index 6d4386eeb7dae..854b9c48816f2 100644
> > --- a/drivers/clk/tenstorrent/atlantis-prcm.c
> > +++ b/drivers/clk/tenstorrent/atlantis-prcm.c
> > @@ -205,14 +205,9 @@ static int atlantis_clk_gate_endisable(struct clk_hw *hw, int enable)
> >  {
> >  	struct atlantis_clk_gate *gate = hw_to_atlantis_clk_gate(hw);
> >  
> > -	if (enable)
> > -		return regmap_set_bits(gate->common.regmap,
> > -				       gate->config.reg_offset,
> > -				       gate->config.enable);
> > -	else
> > -		return regmap_clear_bits(gate->common.regmap,
> > -					 gate->config.reg_offset,
> > -					 gate->config.enable);
> > +	return regmap_assign_bits(gate->common.regmap,
> > +				  gate->config.reg_offset,
> > +				  gate->config.enable, enable);
> >  }
> >  
> >  static int atlantis_clk_gate_enable(struct clk_hw *hw)
> > -- 
> > 2.50.1
> 
> Reviewed-by: Drew Fustini (Tenstorrent) <fustini@kernel.org>
> 
> I will apply this to tenstorrent-clk-for-next.

Applied to tenstorrent-clk-for-next:

  d5e56ca6c53b clk: tenstorrent: use regmap_assign_bits() for conditional set/clear

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
