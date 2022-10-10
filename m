Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DF0C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1OFKI0q2zn5dOW/tFhnDf51MzorX1ROvHPMHyKlv1r8=; b=k8U+19a0mBR7My
	Ar6/4rOKhf8wIBFaBmnid5ZdTifqRyougOH5Q3cobC/vkk8V8IX3X7CmhLT8i+AI32NRkO42CX17N
	t87/CNfIwmtqHwczoIidSqodyaEiigBxbYq5+UcUYba/0++ewsVLOU9ThmVlxw1QEIu4YwXBqwd5c
	ZJulqzzEQfCF+hCk30wTE58UJ9hwYdaoN9TTCQMYWMmWKsichMw3+I2+UTcDrCniJEXf6Qi9ZDHZK
	3DLWuKoALtEM5Cudde5I/KDnJ+V1Io/zW2dlCU0faLkilrxlyJCuaTjDZArjpBQdDGb4pQns/lUZc
	lz7pAatXY1pNYqIOoz+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohsJY-000u60-5k; Mon, 10 Oct 2022 12:55:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohsJ9-000trf-6b
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 12:55:00 +0000
Received: from p5b1274fa.dip0.t-ipconnect.de ([91.18.116.250] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ohsJ1-0001uf-PC; Mon, 10 Oct 2022 14:54:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Anup Patel <apatel@ventanamicro.com>
Cc: atishp@atishpatra.org, anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Conor.Dooley@microchip.com, ajones@ventanamicro.com
Subject: Re: [PATCH v5 1/2] RISC-V: Cache SBI vendor values
Date: Mon, 10 Oct 2022 14:54:50 +0200
Message-ID: <7864901.lvqk35OSZv@phil>
In-Reply-To: <CAK9=C2VHPBgL208ZHb78Nab1dQjfF6tZuKTRRT5V=vnvfODEGw@mail.gmail.com>
References: <20221010122726.2405153-1-heiko@sntech.de> <20221010122726.2405153-2-heiko@sntech.de> <CAK9=C2VHPBgL208ZHb78Nab1dQjfF6tZuKTRRT5V=vnvfODEGw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_055459_286467_5C6C76F7 
X-CRM114-Status: GOOD (  22.66  )
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

Am Montag, 10. Oktober 2022, 14:45:45 CEST schrieb Anup Patel:
> On Mon, Oct 10, 2022 at 5:57 PM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > sbi_get_mvendorid(), sbi_get_marchid() and sbi_get_mimpid() might get
> > called multiple times, though the values of these CSRs should not change
> > during the runtime of a specific machine.
> >
> > So cache the values in the functions and prevent multiple ecalls
> > to read these values.
> >
> > As Andrew Jones noted, at least marchid and mimpid may be negative
> > values when viewed as a long, so we use a separate static bool to
> > indiciate the cached status.
> >
> > Suggested-by: Atish Patra <atishp@atishpatra.org>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  arch/riscv/kernel/sbi.c | 30 +++++++++++++++++++++++++++---
> >  1 file changed, 27 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> > index 775d3322b422..cc618aaa9d11 100644
> > --- a/arch/riscv/kernel/sbi.c
> > +++ b/arch/riscv/kernel/sbi.c
> > @@ -625,17 +625,41 @@ static inline long sbi_get_firmware_version(void)
> >
> >  long sbi_get_mvendorid(void)
> >  {
> > -       return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
> > +       static long id;
> > +       static bool cached;
> > +
> > +       if (!cached) {
> > +               id = __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
> > +               cached = true;
> > +       }
> > +
> > +       return id;
> >  }
> >
> >  long sbi_get_marchid(void)
> >  {
> > -       return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
> > +       static long id;
> > +       static bool cached;
> 
> This breaks for heterogeneous SMP systems (similar to big.LITTLE)
> where HARTs will have different marchid even though they belong to
> same CPU Vendor.
> 
> Due to the above rationale, the patch adding marchid, mvendorid, and
> mimpid in /proc/cpuinfo caches these values on a per-CPU basis.

For people reading along, I think you mean
https://lore.kernel.org/r/20220727043829.151794-1-apatel@ventanamicro.com

For my understanding, was there a reason in the past for doing the caching
only for cpuinfo and not for every invocation of the ecalls?


Thanks
Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
