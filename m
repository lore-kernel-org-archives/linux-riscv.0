Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5F1C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jan 2022 10:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GQ6GVCvk6FpJtOtOmuHydvstolGDHtAcaOKcugAkNxw=; b=zaZXL4sCUY7gca
	YY+YVZYCRwBULuXsZVvT3Cl00+WeuyYD6ZHTVjdCKy2i5oWNk8RnA4WKLCS+gJzxUeb7iZmpTxd5J
	6JLIk+YVM/YMw2GCjlLkrMKmLx03YveH8g5qTE657YvTpc7ayDhzLm4GAxkvWAsLv01aAix96sexD
	jUUv45l/2aqXpHojxfllr6KN0JgnSCBEpBp1rKIt/reulsDKcwvn0oa3jumE/F9b6OfzkM037okm6
	/uWqhPmbiW2AlFG8yf6p/P1xPiUtlR0Qwky9C/kJSFPe3R7E0h6g2oHT+fxdMw5UK3KKKCqdVREmv
	n3DkRF2cZMtMmT8jd1ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5PvV-00HL1e-6v; Thu, 06 Jan 2022 10:23:21 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5PvS-00HL0m-Bt
 for linux-riscv@lists.infradead.org; Thu, 06 Jan 2022 10:23:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8011411D4;
 Thu,  6 Jan 2022 02:23:15 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.10.56])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E38C3F774;
 Thu,  6 Jan 2022 02:23:12 -0800 (PST)
Date: Thu, 6 Jan 2022 10:23:06 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: jszhang3@mail.ustc.edu.cn, tglx@linutronix.de,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 bjorn@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, john.fastabend@gmail.com, kpsingh@kernel.org,
 masahiroy@kernel.org, michal.lkml@markovi.net,
 ndesaulniers@google.com, wangkefeng.wang@huawei.com,
 tongtiangen@huawei.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 09/12] riscv: extable: add `type` and `data` fields
Message-ID: <YdbAgybzS2Uw9/qC@FVFF77S0Q05N>
References: <20211118152155.GB9977@lakrids.cambridge.arm.com>
 <mhng-84ef2902-21c8-4cde-9d02-aa89f913a981@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-84ef2902-21c8-4cde-9d02-aa89f913a981@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_022318_483451_15B63395 
X-CRM114-Status: GOOD (  22.32  )
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

On Wed, Jan 05, 2022 at 07:21:26PM -0800, Palmer Dabbelt wrote:
> On Thu, 18 Nov 2021 07:21:55 PST (-0800), mark.rutland@arm.com wrote:
> > On Thu, Nov 18, 2021 at 07:42:49PM +0800, Jisheng Zhang wrote:
> > > On Thu, 18 Nov 2021 19:26:05 +0800 Jisheng Zhang wrote:
> > > Hi Mark, Thomas,
> > > 
> > > x86 and arm64 version of sort_relative_table routine are the same, I want to
> > > unify them, and then use the common function for riscv, but I'm not sure
> > > which name is better. Could you please suggest?
> > 
> > I sent a patch last week which unifies them as
> > sort_relative_table_with_data():
> > 
> >   https://lore.kernel.org/linux-arm-kernel/20211108114220.32796-1-mark.rutland@arm.com/
> > 
> > Thomas, are you happy with that patch?
> > 
> > With your ack it could go via the riscv tree for v5.17 as a preparatory
> > cleanup in this series.
> > 
> > Maybe we could get it in as a cleanup for v5.16-rc{2,3} ?
> 
> I don't see anything on that thread, and looks like last time I had to touch
> sorttable I just took it via the RISC-V tree.  I went ahead and put Mark's
> patch, along with this patch set, on my for-next. 

FWIW, that sounds good to me. Thanks for picking that up!

> I had to fix up a few minor issues, so LMK if anything went off the rails.

I assume that was just for this patch set, as I couldn't spot any change to my
patch in the riscv for-next branch.

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
