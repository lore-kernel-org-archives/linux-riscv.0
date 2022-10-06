Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0304C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 19:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BYNoS8JS02Afj/R4MYT/WuEUP/ZA+n/m2GiyROBhtf0=; b=cKTn8vnZcaTcPw
	ohzSCicMAbuKdDmdTHUzD7B+vlaZOfYqSIcwYTeQ1v1VxHe3pZkhTAwuAWoZuUSuOz+Ef/CcVRJxb
	zzZzFXcpDJ0JPpm3b0iVr1zYj9M1u2X0iYd8hOn5jF65yove1TlEcZg7pTo66clFmDD7fEKTd8tOH
	f5dGAXw9RG/Okz9b5z9Vcxjfap3PEOzwqjjt8xzCGMWAwK00u6z6WpceSKEs0PXAmbfqi91wA3F9l
	dWjo/f5kB4GorGJJy0mQvj0KAID2HqOe5XUq+Cjx0BzdYgF/wtXnpmoCiDywKaLKSKZ6OUvTZbmgf
	QUFdkZut7nttpIHQYAiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWqK-004q7C-PA; Thu, 06 Oct 2022 19:47:40 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWqI-004q5Z-BY
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 19:47:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 21B82B8214A;
	Thu,  6 Oct 2022 19:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C6FC433C1;
	Thu,  6 Oct 2022 19:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665085653;
	bh=rg634hCELZv0EHg0+EDr2qPHfLTzL3xsvvAoKzKFzp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bTIz4390qk6j/JMy8yzjZDUnnS8dA7rup9GW5NWnU4ArrPLLQqg5xAso+SlpE+NR9
	 eyPUwCp90ipddCLnxrUwNG1EhUxza/1S+S41oyh5GJPTwbC/ltfCItkd8BvZ+6RpFB
	 vSf5ixgdJn3lrelojRTpQ36KYwSHFHFMA2ieBoCOU4bvJVu++dBlx1IinWqGNEotsE
	 /50mGdpwyDIc4nSJ31z5Jc1xgNV10qVK40VVWXauOZIs4xgolul48gSU+8zVWPEJUK
	 dqQs6eXr7LF32X8hR1kxRGbN42szdiLxN2frdUbPTK8u4JJpxZxNAXqiHWMQDWvOqz
	 h6rm46mffEsqg==
Date: Thu, 6 Oct 2022 20:47:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Qinglin Pan <panqinglin2020@iscas.ac.cn>
Cc: Andrew Jones <ajones@ventanamicro.com>, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, jeff@riscv.org, xuyinan@ict.ac.cn
Subject: Re: [PATCH v6 1/4] riscv: mm: modify pte format for Svnapot
Message-ID: <Yz8w0dozxbyz311O@spud>
References: <20221005112926.3043280-1-panqinglin2020@iscas.ac.cn>
 <20221005112926.3043280-2-panqinglin2020@iscas.ac.cn>
 <20221005141700.yu7mf23ru4bkf43z@kamzik>
 <071c426e-16be-2720-41c4-cede59e2d82b@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <071c426e-16be-2720-41c4-cede59e2d82b@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_124738_614097_7DE3511B 
X-CRM114-Status: GOOD (  20.85  )
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

On Wed, Oct 05, 2022 at 10:46:36PM +0800, Qinglin Pan wrote:
> On 10/5/22 10:17 PM, Andrew Jones wrote:
> > On Wed, Oct 05, 2022 at 07:29:23PM +0800, panqinglin2020@iscas.ac.cn wrote:
> > > From: Qinglin Pan <panqinglin2020@iscas.ac.cn>

> > > diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> > > index dc42375c2357..1cd0ffbfbdaa 100644
> > > --- a/arch/riscv/include/asm/pgtable-64.h
> > > +++ b/arch/riscv/include/asm/pgtable-64.h
> > > @@ -74,6 +74,19 @@ typedef struct {
> > >    */
> > >   #define _PAGE_PFN_MASK  GENMASK(53, 10)
> > > +/*
> > > + * [63] Svnapot definitions:
> > > + * 0 Svnapot disabled
> > > + * 1 Svnapot enabled
> > > + */
> > > +#define _PAGE_NAPOT_SHIFT	63
> > > +#define _PAGE_NAPOT		BIT(_PAGE_NAPOT_SHIFT)
> > > +#define NAPOT_CONT64KB_ORDER	4UL
> > > +#define NAPOT_CONT64KB_SHIFT	(NAPOT_CONT64KB_ORDER + PAGE_SHIFT)
> > > +#define NAPOT_CONT64KB_SIZE	BIT(NAPOT_CONT64KB_SHIFT)
> > > +#define NAPOT_CONT64KB_MASK	(NAPOT_CONT64KB_SIZE - 1UL)
> > > +#define NAPOT_64KB_PTE_NUM	BIT(NAPOT_CONT64KB_ORDER)
> > 
> > I still wonder if we shouldn't future-proof a bit with something like
> > 
> > /*
> >   * Only 64KB (order 4) napot ptes supported.
> >   */
> > #define napot_cont_order(pte)	4
> > 
> > #define napot_cont_shift(order)	((order) + PAGE_SHIFT)
> > #define napot_cont_size(order)	BIT(napot_cont_shift(order))
> > #define napot_cont_mask(order)	BIT(napot_cont_size(order) - 1)
> > #define napot_pte_num(order)	BIT(order)
> 
> Maybe we can declare legal napot order in a enum, and use the enum with
> these macros you have mentioned above. I will try to do this in the v8
> patchset.

I'm in a bit of a "keep it simple" camp for these things, I had to run
through this last time to make sure to myself that it made sense. I
think Drew's version is easier to follow despite (or due to?) the
"future-proofing". Whatever you do, a comment wouldn't go amiss I think.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
