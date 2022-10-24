Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9065C38A2D
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 07:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjgBRg44YLWJEcVZosh5utr/tByKPvHkvUZp0ROaF8g=; b=eqLk6566Kie8hz
	+ihcPG/8kNP+YREPj+pFhl8Db0AElH28Yx4YHRkFvERSt7TIF/RMQOjukdajRVKFNyAusyBS1xIEM
	IGJ9/cAFNOzFvgRpXWmQlG48RKYNO+fO9x1j08IrH8BSSJtYU1gLTciabBG9+gl0YeMd9yu42ILF+
	YkR50SPIfA7CvLrQKjTqfiOwbCPezv+jEXvOvU5AvgmX3bna85AyIUn9R/gBTaYHeqM+cPVgxXH3v
	LgIS1amKgG4jb+jVokpGxniGC3LFwr0woTphDCkpm3A2lfLMfKOt2UOxiwlhA9AkAYLAdZu6BBjsK
	kmcw2+jIrTKteAPAJ3SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omri5-00HSHy-JC; Mon, 24 Oct 2022 07:17:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omri1-00HSG9-K4
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 07:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1666595836; x=1698131836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nb73UoFgyjfyVhuFTqq5IGjI1HULwHB56TZtGhoEnms=;
  b=VM1uhKN9KQ58LsDnLFzy1NxX/ZwV/ydJRxvo8sEmYjzAUmxpWJBUMAa5
   a9ZqZ73l1lym5weFXCfOCbe1UcbDIaxczS7tPThusMqnQbkTEa8koGFr2
   UPuaz79UjyqxSJRi+8R4cT0ZwM++oP/GibsCBUUFBMsDqBRsuM5y+Hbts
   IhlZGe1I9b1xasr66SH55DOC9IU+xLCgRUJyfQ6S4pvlKYWHYo0tEEoJn
   h1tXHzsZRulSXfFMQCP6JQOKjfmsATmJxo/USo2jcJmD/PNSr5eG+p6UC
   AVjbn34338LchSN3mUlogqsFP1xrwcthUJ6LLSJ0Q7dr7baf8+jpi1nIb
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,207,1661842800"; 
   d="scan'208";a="196715944"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Oct 2022 00:17:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 24 Oct 2022 00:17:11 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 24 Oct 2022 00:17:09 -0700
Date: Mon, 24 Oct 2022 08:16:53 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Anup
 Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 1/3] RISC-V: Improve use of isa2hwcap[]
Message-ID: <Y1Y75dyTeqVAIzNn@wendy>
References: <20221021105905.206385-1-ajones@ventanamicro.com>
 <20221021105905.206385-2-ajones@ventanamicro.com>
 <Y1WV1MmtTwvTlrcg@spud>
 <20221024064811.rtu4nsia23yuga7w@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221024064811.rtu4nsia23yuga7w@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_001717_688804_B4921523 
X-CRM114-Status: GOOD (  26.60  )
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

On Mon, Oct 24, 2022 at 08:48:11AM +0200, Andrew Jones wrote:
> On Sun, Oct 23, 2022 at 08:28:20PM +0100, Conor Dooley wrote:
> > On Fri, Oct 21, 2022 at 12:59:03PM +0200, Andrew Jones wrote:
> > > Improve isa2hwcap[] by removing it from static storage, as
> > > riscv_fill_hwcap() is only called once, and by reducing its size
> > > from 256 bytes to 26. The latter improvement is possible because
> > > isa2hwcap[] will never be indexed with capital letters and we can
> > > precompute the offsets from 'a'.
> > 
> > Hey Drew, couple questions for you - mostly due to naivety I think..
> > 
> > How do we know that isa2hwcap will never interact with capital letters?
> > It pulls the isa string from dt and the no-capitals enforcement comes
> > from there since one with capitals is invalid? I didn't dig particularly
> > deeply into the code, but is there a risk that we regress some user that
> > has a dt with capitals in the isa string? Or is that a "your dt was wrong
> > and you're out-of-tree so that's your problem" situation?
> 
> Our ISA string parser here in riscv_fill_hwcap() ignores non-capital
> letters, see arch/riscv/kernel/cpufeature.c lines 141, 165 and 196.

Ah, I missed the one on L165, that's a bit silly... Apologies!

> (Maybe we should be noisier about that in case there are DTs out there
> with capitals which aren't realizing they're being ignored.)

Possibly, but it's not this patch that has introduced the behaviour.
Checking very briefly though, looks like it was 2a31c54be097 ("RISC-V:
Minimal parser for "riscv, isa" strings") that introduced the checks
and that was not really all that long ago..

> 
> > 
> > Secondly, in the UAPI header, the COMPAT_HWCAP_ISA_FOO defines are
> > computed as I - A rather than i - a. Should those be changed too for the
> > sake of consistently using the lowercase everywhere, or do you think
> > that doesn't really matter?
> 
> I think I'd leave it since it doesn't change the math and I'm reluctant
> to churn UAPI.

Yeah, figured you'd be of that opinion.
Anyways, only "issue" I had was my own confusion so
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks...


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
