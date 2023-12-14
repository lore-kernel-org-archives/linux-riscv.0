Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAFDC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 00:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=riK54xKHb2a6WJe7U31MwVx+BX++E5NxIpbbiU+ab84=; b=tyBYtp7MYNql+L
	JGC0wWgV49e4Ldzw1SHvNHoVFYXhjIyG3uM2Q254yEfE0bSgxZU4J953b73C3O25is8rH6z5v5z49
	0tPr9W28nkdwg8bhrzZUcTpC26tCrLj21xQs5vnfyOON/9IBxAH9yhWGTUijJN7tQe/g+hUmhaT+4
	/8f4GqLDDdWk3En42OsYYLtxsNWIeG387hfwmvsY94qKv2hFYetiUfFxu+SzpmmWX9XBvj674JJJQ
	8lV8azNbnfZ6o4TFmwpfSkTKPy4EL+8Dka/3x7L6JDTUoCQPMLZBiCvXjYeG+tkp55nTdbTkIcrxB
	xRmzY8EewiZQvlJKaBzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDZO9-00GKDP-18;
	Thu, 14 Dec 2023 00:15:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDZO6-00GKCo-0d
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 00:15:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 54219B81F96;
	Thu, 14 Dec 2023 00:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E27C433C8;
	Thu, 14 Dec 2023 00:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702512933;
	bh=aPg6Z+wmckOVQuqjd9R9p5MP1fl4PYkCvzrh/X3o2+k=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=EIV1xiGGnPi1KfF5ik21wZVX0IVcX548EChGqvxvF9o6FIUKK4MV9ZyhMVdJQc2dK
	 0ZIUlL4wy5i5AIwq3ng72t1/RNH1W28daEV+1XAWfXuDHHIAS3gRj8i29VRlZth4bS
	 rRURKTNF7v/1EzyN3jyivB6fjHeRogUxJ/7sNY62IDZP6faka+jHt48CL8i1Q8Ttf6
	 DaZJbKuUP4qqbgtuE9FmNk9m22O6QwI6vgiwX9ReHJozTm21H5FySsoyEwpihZWvOV
	 k4Q8J6KzEo6D4OZPA4NejxsU5h2WLHBd8uaGhSh+ZTKlocBC8eAO4td9O057RB+u82
	 l7SBX5pOyz2tg==
Message-ID: <1b4b88035d7524ad3d6de7c6084e3f07.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231212-unnerving-rule-1052a5b7253e@wendy>
References: <cover.1701997033.git.unicorn_wang@outlook.com> <d1aa4f76f360ebd7b790a4786641f1b0188dbba8.1701997033.git.unicorn_wang@outlook.com> <20231208-opposite-stand-fc92fbaaed9c@spud> <MA0P287MB0332A937E4DF0044594B19CCFE8EA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM> <20231212-unnerving-rule-1052a5b7253e@wendy>
Subject: Re: [PATCH v6 3/4] clk: sophgo: Add SG2042 clock generator driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu, chao.wei@sophgo.com, krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org, jszhang@kernel.org, inochiama@outlook.com, samuel.holland@sifive.com
To: Chen Wang <unicorn_wang@outlook.com>, Conor Dooley <conor.dooley@microchip.com>
Date: Wed, 13 Dec 2023 16:15:31 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_161538_528130_49BA999A 
X-CRM114-Status: GOOD (  39.28  )
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

Quoting Conor Dooley (2023-12-12 00:37:39)
> On Tue, Dec 12, 2023 at 10:22:28AM +0800, Chen Wang wrote:
> 
> > On 2023/12/9 0:47, Conor Dooley wrote:
> > > On Fri, Dec 08, 2023 at 09:14:32AM +0800, Chen Wang wrote:
> 
> > > > +#define ENCODE_PLL_CTRL(fbdiv, p1, p2, refdiv) \
> > > > + (((fbdiv & 0xfff) << 16) | ((p2 & 0x7) << 12) | ((p1 & 0x7) << 8) | (refdiv & 0x3f))
> > > IMO this should be a function not a macro.
> 
> > Would like to listen why it should be a function instead of a macro? Any
> > experiences you can share with me?
> 
> Readability. A function, which could be inlined allows you to break this
> up and make it easier to read.
> 
> > > > +/*
> > > > + * Based on input rate/prate/fbdiv/refdiv, look up the postdiv1_2 table
> > > > + * to get the closest postdiiv combination.
> > > > + * @rate: FOUTPOSTDIV
> > > > + * @prate: parent rate, i.e. FREF
> > > > + * @fbdiv: FBDIV
> > > > + * @refdiv: REFDIV
> > > > + * @postdiv1: POSTDIV1, output
> > > > + * @postdiv2: POSTDIV2, output
> > > > + * See TRM:
> > > > + * FOUTPOSTDIV = FREF * FBDIV / REFDIV / (POSTDIV1 * POSTDIV2)
> > > > + * So we get following formula to get POSTDIV1 and POSTDIV2:
> > > > + * POSTDIV = (prate/REFDIV) x FBDIV/rate
> > > > + * above POSTDIV = POSTDIV1*POSTDIV2
> > > > + */
> > > > +static int __sg2042_pll_get_postdiv_1_2(
> > > > + unsigned long rate,
> > > > + unsigned long prate,
> > > > + unsigned int fbdiv,
> > > > + unsigned int refdiv,
> > > > + unsigned int *postdiv1,
> > > > + unsigned int *postdiv2)
> > > This is not the coding style btw.
> > Agree, will fix this.
> > > > +{
> > > > + int index = 0;
> > > > + int ret = 0;
> > > > + u64 tmp0;
> > > > +
> > > > + /* prate/REFDIV and result save to tmp0 */
> > > > + tmp0 = prate;
> > > > + do_div(tmp0, refdiv);
> > > > +
> > > > + /* ((prate/REFDIV) x FBDIV) and result save to tmp0 */
> > > > + tmp0 *= fbdiv;
> > > > +
> > > > + /* ((prate/REFDIV) x FBDIV)/rate and result save to tmp0 */
> > > > + do_div(tmp0, rate);
> > > > +
> > > > + /* tmp0 is POSTDIV1*POSTDIV2, now we calculate div1 and div2 value */
> > > > + if (tmp0 <= 7) {
> > > > +         /* (div1 * div2) <= 7, no need to use array search */
> > > > +         *postdiv1 = tmp0;
> > > > +         *postdiv2 = 1;

why not return 0 here?

> > > > + } else {

And then de-indent this?

> > > > +         /* (div1 * div2) > 7, use array search */
> > > > +         for (index = 0; index < ARRAY_SIZE(postdiv1_2); index++) {
> > > > +                 if (tmp0 > postdiv1_2[index][POSTDIV_RESULT_INDEX]) {
> > > > +                         continue;
> > > > +                 } else {
> > > > +                         /* found it */
> > > > +                         break;

This can also return?

> > > > +                 }
> > > > +         }
> > > > +         if (index < ARRAY_SIZE(postdiv1_2)) {

And this condition can be removed.

> > > > +                 *postdiv1 = postdiv1_2[index][1];
> > > > +                 *postdiv2 = postdiv1_2[index][0];
> > > > +         } else {

This can be the default after the loop.

> > > > +                 pr_debug("%s can not find in postdiv array!\n", __func__);
> > > > +                 ret = -EINVAL;


 /* tmp0 is POSTDIV1*POSTDIV2, now we calculate div1 and div2 value */
 if (tmp0 <= 7) {
         /* (div1 * div2) <= 7, no need to use array search */
         *postdiv1 = tmp0;
         *postdiv2 = 1;
	 return 0;
 }

 /* (div1 * div2) > 7, use array search */
 for (index = 0; index < ARRAY_SIZE(postdiv1_2); index++) {
	 if (tmp0 > postdiv1_2[index][POSTDIV_RESULT_INDEX]) {
		 continue;
	 } else {
		 *postdiv1 = postdiv1_2[index][1];
		 *postdiv2 = postdiv1_2[index][0];
		 return 0;
	 }
 }
 pr_debug("%s can not find in postdiv array!\n", __func__);
 return -EINVAL;

> > > Reading this function it makes me wonder if (and I am far from the best
> > > person to comment, someone like Stephen is vastly more qualified) you
> > > should model this as several "stages", each implemented by the
> > > "standard" clocks - like clk_divider etc. The code here is quite
> > > complicated IMO as it seems to be trying to implement several stages of
> > > division in one go.
> > 
> > The objective of __sg2042_pll_get_postdiv_1_2() is straightforward: based on
> > the formula defined by the TRM, with input rate/prate/fbdiv/refdiv, we can
> > get the possiblle combination of POSTDIV1 and POSTDIV2 by looking up the
> > table of postdiv1_2. We will later use it to setup the clock register.
> > 
> > Though the codes looks a bit complicated, but accually it is calculate with
> > the formula : POSTDIV = (prate/REFDIV) x FBDIV/rate, I just separate it into
> > several steps to make it easy to understand, I have listed the formula in
> > the comment on top of the function.
> 
> I understand what you are doing, I did something similar myself
> previously. My suggestion/question was about using the "standard" types
> of clock that the core provides to represent as many of the clocks in
> this driver as is feasible.

I would not twist the code to conform with the basic clk types. If
possible it would be good to use the helpers for these things, but I
wouldn't split up a clk that is a complex divider with multiple stages
of division into the basic types just to make it fit. I say this because
every clk takes more effort to maintain in the clk tree, it has a name,
pointers, etc. If you can keep that self contained and logically it is
really one clk, then go for it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
