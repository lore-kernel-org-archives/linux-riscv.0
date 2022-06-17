Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31543C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jun 2022 07:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5Cexz5s1ew20PVHYSs5Z6bWQf3ppGcvE133bDCRBaU=; b=IQADErrYO7TtuR
	/lT4w7TIG7jF1FYA92I/MOU4hEotIOA4sKO1j13aAaVbN9HfCAjW9xVeRSVtP97yZ8MpgOV867Mru
	o2ZH8K53xorkpu4rD8E5oB5QL8jJjWhZBTzNHA+JyDqHK8mW8zE4J/oiJrHadzEli4WXqbayn4mi/
	WJ4cr/saUlIynoQxmIkWgB4IH85qYUEZvdhfpkXKoAoLMyNx87lFjt5iC90Va3wKCMyPGyXxhofDC
	dtjhPBvp+lDEMMSalj3WEjkji0UTvcOhIDaCQrci4z5vfGObSEEB0syEHPlu9uUIxR9ekDHXpz9UR
	T85szVJKncUhzrXN1h/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26DO-005tQ5-PP; Fri, 17 Jun 2022 07:16:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26Au-005sJD-Q4
	for linux-riscv@lists.infradead.org; Fri, 17 Jun 2022 07:13:50 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o26Ag-0002uA-Uy; Fri, 17 Jun 2022 09:13:34 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com, guoren@kernel.org, mick@ics.forth.gr, samuel@sholland.org, cmuellner@linux.com, philipp.tomsich@vrull.eu, Christoph Hellwig <hch@lst.de>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2 0/5] riscv: some svpbmt fixes
Date: Fri, 17 Jun 2022 09:13:34 +0200
Message-ID: <37631570.10thIPus4b@diego>
In-Reply-To: <mhng-55ae586c-07b7-4e6e-b695-6df8608b87d5@palmer-ri-x1c9>
References: <mhng-55ae586c-07b7-4e6e-b695-6df8608b87d5@palmer-ri-x1c9>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_001348_902638_1E09E9E6 
X-CRM114-Status: GOOD (  18.53  )
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

Hi Palmer,

Am Freitag, 17. Juni 2022, 01:03:32 CEST schrieb Palmer Dabbelt:
> On Thu, 26 May 2022 13:56:41 PDT (-0700), heiko@sntech.de wrote:
> > Some additionals comments and notes from autobuilders received
> > after the series got applied, warranted some changes.
> >
> > So this is a small collection of cleanups for the svpbmt v10 series.
> >
> > changes in v2:
> > - add Guo's Review
> > - add patch dropping the use of function pointers in code
> >   that can run before relocation
> >
> > Heiko Stuebner (5):
> >   riscv: drop cpufeature_apply_feature tracking variable
> >   riscv: Improve description for RISCV_ISA_SVPBMT Kconfig symbol
> >   riscv: make patch-function pointer more generic in
> >     cpu_manufacturer_info struct
> >   riscv: fix dependency for t-head errata
> >   riscv: remove usage of function-pointers from cpufeatures and t-head
> >     errata
> >
> >  arch/riscv/Kconfig               |  9 ++++++--
> >  arch/riscv/Kconfig.erratas       |  1 +
> >  arch/riscv/errata/thead/errata.c | 38 ++++++++++----------------------
> >  arch/riscv/kernel/alternative.c  | 18 +++++++--------
> >  arch/riscv/kernel/cpufeature.c   | 37 +++++++++----------------------
> >  5 files changed, 40 insertions(+), 63 deletions(-)
> 
> IMO only three of these are actually fixes, the rest are cleanups.  I've 
> got ahead and put everything on a branch, with
> 
>     riscv: Improve description for RISCV_ISA_SVPBMT Kconfig symbol
>     riscv: drop cpufeature_apply_feature tracking variable
>     riscv: fix dependency for t-head errata
> 
> first.  Those are on fixes, the whole thing is in for-next.

thanks a lot.

For the fixes I think Nathan's "riscv: Fix ALT_THEAD_PMA's asm parameters" [0]
would also be quite important.

Heiko

[0] https://lore.kernel.org/r/20220518184529.454008-1-nathan@kernel.org



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
