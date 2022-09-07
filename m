Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048C2C54EE9
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 16:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tF/8+5SIEWvNuKbk4y6sRJAQ+ftuCF0AMLb4XiHRI/k=; b=RHQwFYWRyusI3c
	jFAvKmlebBBDFQbb+VQz6AYYciZAtYb5uQG6ZGU0B+xiVbfGIZyC3v/B6NDbY4DNFdmJ4Wiegzglw
	LdFgXlZimX/TELltMwEfquwX49D9yXgLzoRfb6BOIKSCdE0HL4rPBpfeGz0+6iylLLnJha5Yc063y
	VQ70ZURuZLitkrhHEdkvJi+Gyp8nC3EDNRxIRiYyA/5pcuYprZIM8Kt4QukuJfxvxGxbz4VEsWe5X
	INVuFCebJ1a/WthC9zykSmUqIojnag6PjJ55qfZySFU962gCjE0RCgORxHmCBxWagym8wTF3BnTKw
	xKGu2sGSj9iHDHYmjoLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVy7n-007qwG-2F; Wed, 07 Sep 2022 16:42:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVy7Y-007qpb-Va; Wed, 07 Sep 2022 16:41:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 534916198D;
	Wed,  7 Sep 2022 16:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D931AC433C1;
	Wed,  7 Sep 2022 16:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662568906;
	bh=EZUj/XJnYo6nJbBgT4QYvk1/OrMCmJbS3YvtDagavKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jaUndbgDpgNBkROv0iMSNm5SZ/u9/UI+Cf7W5SthTUka5rvz5c5ySj1q+8mZHhDk0
	 FuVZLEf/tGN6TJNFoSIeXez0QsKwWs23l6o5a41SQhCibN2BaS2cpDtoiYZjoSy8+F
	 q3Wo47JBC5khwRD7SJKle4pQvn33bJAlH4LcruhE9cGiHiI2T8Ef84nVguz9dPlyRz
	 MvDKGMog1LvnodyNpBU+q24aFOQ5NeW5ncr9+hm717VX8iC+caMcsaw9nHJsF/zhg0
	 mELMI4WlHpE16unwj8+Blpn0m1G8HuBvtX1baLo3//mbjps8MNQ/PyBDvIr5F/C3JU
	 yBkHjGXuCNeZg==
Date: Wed, 7 Sep 2022 17:41:41 +0100
From: Will Deacon <will@kernel.org>
To: Conor.Dooley@microchip.com
Cc: sudeep.holla@arm.com, palmer@dabbelt.com, catalin.marinas@arm.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, atishp@atishpatra.org,
	Brice.Goglin@inria.fr, gregkh@linuxfoundation.org
Subject: Re: [GIT PULL] Fix RISC-V's arch-topology reporting
Message-ID: <20220907164140.GA30683@willie-the-truck>
References: <4849490e-b362-c13a-c2e4-82acc3268a3f@microchip.com>
 <afa3b7a8-3615-36bb-4850-b7966028f74c@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afa3b7a8-3615-36bb-4850-b7966028f74c@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_094149_077201_341A7CB8 
X-CRM114-Status: GOOD (  23.16  )
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

On Wed, Sep 07, 2022 at 04:39:31PM +0000, Conor.Dooley@microchip.com wrote:
> On 15/08/2022 23:14, Conor Dooley wrote:
> > Hey Will/Palmer/Sudeep,
> > 
> > Catalin suggested [0] dropping the CC: stable for the arm64 patch and
> > instead making it a specific prereq of the RISC-V patch & making a PR,
> > so here we are.. I was still up when -rc1 came out so pushed it last
> > night to get the test coverage, but LKP seems to not have reported a
> > build success since early on the 13th so not holding my horses! I built
> > it again for both ARMs and RISC-V myself.
> > 
> > I tagged it tonight, so it's on conor/linux.git as riscv-topo-on-6.0-rc1
> > with the prereq specified.
> > 
> > Not sure if you want to merge this too Sudeep or if that's up to Greg?
> 
> What's the story with this from an arm64 & topology PoV?
> Palmer merged this into riscv/for-next a couple weeks ago, so just
> wondering what the craic is on the other fronts.

If it's merged in the riscv tree, then I guess we don't need to do anything
on the arm64 side. It would be handy if it's on its own branch, however,
just in case we run into a conflict later on during the cycle.

Catalin -- this is the series we spoke about the other day touching the
topology code.

Cheers,

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
