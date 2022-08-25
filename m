Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B77C04AA5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Aug 2022 02:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5xTOGfeD7AJFcSAPSNcj297396BckoQ3dwK1SuUIIAo=; b=fEJ2YbCVDXBjNP
	8laj46Kkrsqs6etTHCv9SGAyBegVFSntgcVOscoH/WSyHxPdEG6REaLAxT+ZsxDP19G7TO7Spvt3T
	4gmBTnKrcQ2nSQ5e/a5la0zi6TBazPpC9unrpfrn2A/sALOCYc5/Okj4rQRzc5FtuMFNLk3KDaThX
	tKmDP7rTSp5YorYP/u872GJHdS/80o4OzJSAUwJN4PPny7VuTP0n9LN5lYbJnVUYhQ/m9QS3j8nED
	vs8J0OnHiCm8fUnSutES+sXde5+zmglYVzU4ZdyTDDDx+yP2FxCsUGzFnHVl+lG6u66sOZaafK/2S
	qnbcDRpBxLRr97JShrKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR2En-004Aou-5H; Thu, 25 Aug 2022 02:04:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR2Ek-004AnV-US
	for linux-riscv@lists.infradead.org; Thu, 25 Aug 2022 02:04:52 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oR2Ee-00072W-FB; Thu, 25 Aug 2022 04:04:44 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Atish Patra <atishp@atishpatra.org>, Anup Patel <apatel@ventanamicro.com>
Cc: anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, philipp.tomsich@vrull.eu, cmuellner@linux.com
Subject: Re: [PATCH] drivers/perf: riscv_pmu_sbi: add support for PMU variant on T-Head C9xx cores
Date: Thu, 25 Aug 2022 04:04:43 +0200
Message-ID: <13084187.uLZWGnKmhe@phil>
In-Reply-To: <CAK9=C2U3OvUZmYTJ-C0wkSp8ViPA1+Nj2L6pd4CHTCuzaVtDJg@mail.gmail.com>
References: <20220817111348.745527-1-heiko@sntech.de> <CAOnJCUJu1fr2qxOkX4Sz-kLhB64xkcjAbBAeTkp214ZHAa0btA@mail.gmail.com> <CAK9=C2U3OvUZmYTJ-C0wkSp8ViPA1+Nj2L6pd4CHTCuzaVtDJg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_190451_008054_6B484144 
X-CRM114-Status: GOOD (  33.42  )
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

Am Donnerstag, 18. August 2022, 10:24:33 CEST schrieb Anup Patel:
> On Thu, Aug 18, 2022 at 1:03 AM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Wed, Aug 17, 2022 at 4:13 AM Heiko Stuebner <heiko@sntech.de> wrote:
> > >
> > > With the T-HEAD C9XX cores being designed before or during the ratification
> > > to the SSCOFPMF extension, they implement functionality very similar but
> > > not equal to it. So add some adaptions to allow the C9XX to still handle
> > > its PMU through the regular SBI PMU interface instead of defining new
> > > interfaces or drivers.
> > >
> >
> > IMO, vendor specific workarounds in the generic implementation is not
> > a good idea.
> > If we have to support it, I think we should just put the IRQ number in
> > the DT and parse from the DT.
> > The initial sscofpmf series was based on the DT. It was removed later
> > as there was no need for it at that time.
> > We can always revive it.
> >
> > Regarding the CSR number difference and static key enablement, can we
> > use code patching techniques here as well ?
> > At least all the T-HEAD C9XX core erratas are in one place.
> >
> > The alternate would be just to say T-HEAD C9XX support SSCOFPMF but
> > with erratas. I don't prefer this approach
> > but it keeps the vendor specific checks out of the generic code.
> 
> Whether to have a DT node (or not) was already discussed and concluded
> in the past.
> 
> We don't need a DT node just to get the IRQ number. The T-HEAD custom
> IRQ number can be derived based on mvendorid.

Yeah, I remember reading that discussion and thus went with the mvendorid
way in this patch.

> Also, all these T-HEAD specific changes in SBI PMU driver should be
> implemented as erratas using ALTERNATIVE() macros.

(1) "All these T-HEAD specific changes ..."
Actually the only T-HEAD-specific change is reading that different CSR
for the overflow information, the rest only makes the irq-number variable

(2) ALTERNATIVE macros are working on assembler instructions, so are you
sugesting to replace the generic csr_read() for the overflow-csr with a
custom copy like

#define sbi_pmu_read_overflow(void)						\
({								\
	register unsigned long __v;				\
	ALT_THEAD_PMU_OVERFLOW(__v); \
	__v;							\
})

and then in errata_list.h

#define ALT_THEAD_PMU_OVERFLOW(__ovl) \
__asm__ __volatile__ (alternative(
	"csrr %0, " __ASM_STR(CSR_SSCOUNTOVF),	\
	"csrr %0, " __ASM_STR(THEAD_C9XX_CSR_SCOUNTEROF), THEAD_VENDOR_ID, \
		ERRATA_THEAD_PMU, CONFIG_ERRATA_THEAD_PMU) \
			      : "=r" (__ovl) :			\
			      : "memory");

I'm not yet seeing what you're gaining by going with this approach:
- that the overflow-csr is the same bitwise but only at a different
  address is specific to the c9xx, other deviants might implement things
  completely different
- you're not getting rid of the thead mention
- and we're now duplicating the generic csr-read code

Is this the preferred way or what am I overlooking?

Thanks
Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
