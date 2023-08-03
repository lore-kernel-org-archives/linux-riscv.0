Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1108AC001DE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 01:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgPfEJAp5YH3msLErh1Exx3plf8PfWRUWT/srEB3cvc=; b=Ni6o4DOAkglq1C
	o7PkKtyX883knS+npK5oUBURKUog/xnBFWqXJDEqdaQRLlhJWIK6SLIpLG3Wcs45cj9hCH4Kg00WS
	GOiOT/plRTuvDTi8JBkpuwa891ZP6ICL5ctnJ+9E1gYUiSY4IDS0BEjSH+WYbVnXeJbK5f6l+7nD7
	tTzOOw8jq5lTZpX5ZGOnm1SNhjsPWpAq/EczEtbSgUXMSHQydaH2B4qIyXbKcn9xvBLipor4oKHzg
	pxaRlW1VREh1A5OnqBm6xw2EoMk0UXBKkVlPay2J6zTg9RVasAQV7Y7vhBFvXjkGbuw021oub0x79
	1CjX3pc2J1K9LBzzy1Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRN8J-006MjQ-1N;
	Thu, 03 Aug 2023 01:28:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRN8G-006Mid-1m;
	Thu, 03 Aug 2023 01:28:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0573661069;
	Thu,  3 Aug 2023 01:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32DFAC433C7;
	Thu,  3 Aug 2023 01:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691026083;
	bh=NLXmCvj0HONdFVvPCgelwFypRcPiuWM25qgi6sGFxq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ojdCj92Qj87mLGvKr8BTpc2oJb5ytNXgz0H8mZwUusCF13yVXnqLaeWslHQltHc9s
	 iBG7nTqE0Vp0dpnSeUnRKQTbhv2X6W3DmbQ0txAqnafN8EAYOslWTpLYgk7qo68SOs
	 xaNGjDb6f/fEXv+JPbgUCMlj9T7W/HfavNcIjG1p3dZHBYFlCuwYlMjuXKyzfBpPlc
	 xhZzRmrixBlE2wUbiCnh35X9Ef2gCPLOoKXRGw+rJKDMLUqUuebLb3GYTCihiAUv0q
	 zRMzT2WTuym2LBuTPVs44gDYzrPNjNjSmEN34qkpBJ+e9oXVO8clqlNV2RsKaBhPfb
	 Ms2bGRe6Q0cHw==
Date: Wed, 2 Aug 2023 21:27:51 -0400
From: Guo Ren <guoren@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: Re: [RFC PATCH 02/14] RISC-V: Add SBI STA extension definitions
Message-ID: <ZMsCl9LaMvx38zMY@gmail.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-3-ajones@ventanamicro.com>
 <20230418-elliptic-headboard-6a18fcccdf07@spud>
 <bl7i54kgkzvxzhritql4vtzpymepx7hmtio7pjnbmipv3dxwgi@dtmqpnkdlwl5>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bl7i54kgkzvxzhritql4vtzpymepx7hmtio7pjnbmipv3dxwgi@dtmqpnkdlwl5>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_182804_681831_C4916093 
X-CRM114-Status: GOOD (  29.94  )
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

On Wed, Apr 19, 2023 at 10:15:54AM +0200, Andrew Jones wrote:
> On Tue, Apr 18, 2023 at 07:43:51PM +0100, Conor Dooley wrote:
> > On Mon, Apr 17, 2023 at 12:33:50PM +0200, Andrew Jones wrote:
> > > The SBI STA extension enables steal-time accounting. Add the
> > > definitions it specifies.
> > > 
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  arch/riscv/include/asm/sbi.h | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > > 
> > > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > > index 945b7be249c1..485b9ec20399 100644
> > > --- a/arch/riscv/include/asm/sbi.h
> > > +++ b/arch/riscv/include/asm/sbi.h
> > > @@ -30,6 +30,7 @@ enum sbi_ext_id {
> > >  	SBI_EXT_HSM = 0x48534D,
> > >  	SBI_EXT_SRST = 0x53525354,
> > >  	SBI_EXT_PMU = 0x504D55,
> > > +	SBI_EXT_STA = 0x535441,
> > 
> > What is the sort order of this? Matching the spec ordering, or just
> > append-at-the-end?
> 
> I don't believe there's an established order. I've been going for spec
> order, I think.
> 
> > 
> > Unrelated, but in checking that I saw that your SUSP stuff is in
> > master - you planning on resending that series?
> 
> I think I need to wait until it's been ratified.
Did you discuss the SBI_EXT_STA number of the SBI spec? Could you share
the link to me? Thx.

> 
> > 
> > Anyways, this does match the docs - but I'm quite hesitant to leave an
> > R-b when it's not merged yet.
> 
> I could take your R-b now, and then if the spec changes, I'd drop it
> when reposting the PoC after reworking it.
> 
> Thanks,
> drew
> 
> > 
> > Cheers,
> > Conor.
> > 
> > >  
> > >  	/* Experimentals extensions must lie within this range */
> > >  	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> > > @@ -236,6 +237,20 @@ enum sbi_pmu_ctr_type {
> > >  /* Flags defined for counter stop function */
> > >  #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
> > >  
> > > +/* SBI STA (steal-time accounting) extension */
> > > +enum sbi_ext_sta_fid {
> > > +	SBI_EXT_STA_SET_STEAL_TIME_SHMEM = 0,
> > > +};
> > > +
> > > +struct sbi_sta_struct {
> > > +	__le32 sequence;
> > > +	__le32 flags;
> > > +	__le64 steal;
> > > +	u8 preempted;
> > > +	u8 pad[47];
> > > +} __packed;
> > > +
> > > +/* SBI spec version fields */
> > >  #define SBI_SPEC_VERSION_DEFAULT	0x1
> > >  #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
> > >  #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
> > > -- 
> > > 2.39.2
> > > 
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
