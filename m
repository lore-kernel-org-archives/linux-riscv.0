Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F150D2ECF9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 06:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xM394bXdvWfqwfDnHLBO5dn2WzjkCDADarL1K3CzpQo=; b=KpU3o8ut4skPY7
	VknqfUkBgU8a/vnl67WpVWAKcJ+VUTZYPIF5ZcttqYcVSz/IvRcoX0fvjOFDclN3X7ZVDaOR+PoRl
	lIR+/19QyH+DigLDrKckmC1Hpg6QGWKQCJ55LfkHJFzN2EJt7V+SI22xiS+/z9095g84HoLQSrRg0
	zKIwzakYcazzd+TLjuo6qXbHdb0QVO/bsMwNXByzcMK1hSESdhJN5tcteYhwRRy0nFBSCjJB2cBFi
	WzQBMRZLJWkrUmfmPqcVW+nEL7SWLsDki78p7iSC9o+C998H+KlGC8v3yK2B3mIvbgGYR/ooBHPVw
	huSoPHckIIFDXF/9ABtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi4q2-00000003FIc-0grz;
	Tue, 20 Jan 2026 06:03:38 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi4py-00000003FID-0RpH
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 06:03:36 +0000
Received: from duge-virtual-machine (unknown [223.160.206.31])
	by APP-05 (Coremail) with SMTP id zQCowABn+w6sGm9psVe6BQ--.38261S2;
	Tue, 20 Jan 2026 14:03:26 +0800 (CST)
Date: Tue, 20 Jan 2026 14:03:24 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: linusw@kernel.org
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn, me@ziyao.cc
Subject: Re: [PATCH v2] pinctrl: canaan: k230: Fix NULL pointer dereference
 when parsing devicetree
Message-ID: <aW8arOPzmpigRW+a@duge-virtual-machine>
References: <20251228154947.194684-1-jiayu.riscv@isrc.iscas.ac.cn>
 <aWiLFFnk9aAiMMJI@duge-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWiLFFnk9aAiMMJI@duge-virtual-machine>
X-CM-TRANSID: zQCowABn+w6sGm9psVe6BQ--.38261S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw1UWr1rZryDZF4xGFWDXFb_yoW5Jw13pF
	4fJa98Kr4UJr48W34jva1UZFya9an2y34fCw17t3s5K3Z8tryDJ3W5WrWUZ398Crs8CF1f
	tr45tFya9r4DXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU2VbyDUUUU
X-Originating-IP: [223.160.206.31]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_220334_564358_9F2711F9 
X-CRM114-Status: GOOD (  24.39  )
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

On Thu, Jan 15, 2026 at 02:38:14PM +0800, Jiayu Du wrote:
> On Sun, Dec 28, 2025 at 11:49:47PM +0800, Jiayu Du wrote:
> > When probing the k230 pinctrl driver, the kernel triggers a NULL pointer
> > dereference. The crash trace showed:
> > [    0.732084] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000068
> > [    0.740737] ...
> > [    0.776296] epc : k230_pinctrl_probe+0x1be/0x4fc
> > 
> > In k230_pinctrl_parse_functions(), we attempt to retrieve the device
> > pointer via info->pctl_dev->dev, but info->pctl_dev is only initialized
> > after k230_pinctrl_parse_dt() completes.
> > 
> > At the time of DT parsing, info->pctl_dev is still NULL, leading to
> > the invalid dereference of info->pctl_dev->dev.
> > 
> > Use the already available device pointer from platform_device
> > instead of accessing through uninitialized pctl_dev.
> > 
> > Fixes: d94a32ac688f ("pinctrl: canaan: k230: Fix order of DT parse and pinctrl register")
> > Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> > ---
> >  drivers/pinctrl/pinctrl-k230.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/pinctrl-k230.c b/drivers/pinctrl/pinctrl-k230.c
> > index d716f23d837f..20f7c0f70eb7 100644
> > --- a/drivers/pinctrl/pinctrl-k230.c
> > +++ b/drivers/pinctrl/pinctrl-k230.c
> > @@ -65,6 +65,7 @@ struct k230_pmx_func {
> >  };
> >  
> >  struct k230_pinctrl {
> > +	struct device		*dev;
> >  	struct pinctrl_desc	pctl;
> >  	struct pinctrl_dev	*pctl_dev;
> >  	struct regmap		*regmap_base;
> > @@ -470,7 +471,7 @@ static int k230_pinctrl_parse_groups(struct device_node *np,
> >  				     struct k230_pinctrl *info,
> >  				     unsigned int index)
> >  {
> > -	struct device *dev = info->pctl_dev->dev;
> > +	struct device *dev = info->dev;
> >  	const __be32 *list;
> >  	int size, i, ret;
> >  
> > @@ -511,7 +512,7 @@ static int k230_pinctrl_parse_functions(struct device_node *np,
> >  					struct k230_pinctrl *info,
> >  					unsigned int index)
> >  {
> > -	struct device *dev = info->pctl_dev->dev;
> > +	struct device *dev = info->dev;
> >  	struct k230_pmx_func *func;
> >  	struct k230_pin_group *grp;
> >  	static unsigned int idx, i;
> > @@ -596,6 +597,8 @@ static int k230_pinctrl_probe(struct platform_device *pdev)
> >  	if (!info)
> >  		return -ENOMEM;
> >  
> > +	info->dev = dev;
> > +
> >  	pctl = &info->pctl;
> >  
> >  	pctl->name	= "k230-pinctrl";
> > -- 
> > 2.52.0
> > 
Hi Linus, sorry for bothering again. Could you please take a look at
this patch? Thanks for your time.

Regards,
Jiayu Du
 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
