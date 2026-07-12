Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50356C43458
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 10:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGeKfGnwE0ud1CC5yvQU9pUBJ0/fdArX7kpIhgKeibc=; b=AX+BBLiT1uIuBu
	OEiwdKDVwek4NN7l7UAgPsKrqiXrA+Vksl9rRLgwch4/I1dgWo8L3xQ7x4cyElV+f9DPcmWLhrj/t
	Bmut2tc0rMu+l5klj7bncrAJNnjN0Y2kjGCNQTnC3IZ1kTTRydrxEIl819B12Ndoo8QTG1mOqKhpm
	Gp8V5MziJTOp0COkJosPVXyVQul5Ewt7UOLZQYZtgflaZzvSrZl9AqonH1SsXU1KkcyiiKT/pvSsh
	eOdRfgLJGq/BxXeILZPaau6C1E5pVZNoQXPp1UcXGqChesyPOC1+WCosYwnpAmg+kWKVuO2eCKncH
	cU+Q+mFddX8Q/jx7l7sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wir3s-00000007KeB-2BGj;
	Sun, 12 Jul 2026 10:05:24 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wir3p-00000007Kdr-0Qil
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 10:05:22 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cc891373e0so22225335ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 12 Jul 2026 03:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783850720; x=1784455520; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vtBVbtAq8/J9WfLZAmtmwFvAK1PPs6W2XE0Zv0PL61A=;
        b=I7sOlwg0NvUCPMV14lGpAIoLsR5yp93j+XsnwLP3ObsRtPCKdU8auhKN0sF72gq4NB
         FT34+s7shhTt4H8AeQbYS66WM3QRv2YlP0+bszrzuUX6Pd39AOM3J/IzKsStpNJ1c+RR
         n0w36rSKVGOEaICdAqHWuI/UXY1wzyeUm+GpHJ1KyI0PDl+AKVmdoTV6b/8zlmT0h+YJ
         8AVSmtUBvRxUUhgkcNGc1QxjlWxwwwUau3VNF1m/uwne5CS3t1xBVvR5ngsfnbKY6LWV
         FE/d0rThpLBrDaNbQZLzGGXgBcGMnXVj2yM2muCLZ9dr66k+zVwggSi4WSF9aCDLLwph
         RiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783850720; x=1784455520;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vtBVbtAq8/J9WfLZAmtmwFvAK1PPs6W2XE0Zv0PL61A=;
        b=aNj4BnCe0O4CsrN3qEnnfUd97uS6ERjKZqlQXmHCSsvYqOVkLUMcmLADp991MhyUXw
         rMPx1Y7woa0XZa1w1I4qmkjL+WSF9wyQPjf7by1dU8TzP0vUhSFQ+EfyYnW11LheB1Cj
         LxY1OyoJXyjgiSD6tEhiPU7B/c7f1Axcx87wdL6y/O+WUez96yojSVSAGNUs9zLPy78F
         V0GCBGuoSqi202nfPCfjVgOZOkC4aLb3wcc+Q0tnKSoMYyXIyj0Rk8VZKFZspQV/rnaM
         78mTqcat7HhlSYHbadeqJYy3iwGqln4eRMtB7quPl/VlHJP6RmC/frs1rvv2/gTBPn/A
         XpnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7RCwBgGqzgP8bSGcxzr07mhXSxJRKabiAb5j+OGlGlch6VAxrWZoL/1iD48dTiJMQablCOV0Ush9FLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxewN413VB6bKlaC/p39BmAVdBxBVZprrB5+4RV4O75s8RxXT0z
	O+5ydpyzzBeWvMAu8lgqiwPm1SOGCwh21DRFSlBytKyT/DALrwhUhjVU
X-Gm-Gg: AfdE7clSfnjd8RYsV+E5a0sa/fRI1t0yIN9LPYmGy16cb4X1KmEG1Dblae4E/3Tlc0U
	9wH4KO92aU6mfPcm10EJc8RHv23GRU5S6rjlfBEbgQm9fRbHwLI2AYmbv/VQNQu5ikI3Nbr/1EH
	SqPKa5oRsGwTzf1ZhfE/j6tS4nMInmJS53MB+oa+q7M722H5mlT0OqGoUDlvOOkLe8Kf5Pie1xi
	AotNalayj5NGBk1MRO5rxlDPIQdl/ybEjKjpPlSKL7yUobYrUGY1aXBhd6mLUbPADDhSFoay+P2
	0t+lemIq0WzVJ/JzavuN5DhZBhOZmB2zoc7i570uIbbHo8UhyVy0m0el0wGVFQNebeWaKxz8+iC
	I6QzF3AwnUng9fzNA841JBAh71W0kTN6MLJPFan5BFTXOf9ogcTPTc3xqbQcfS4OS
X-Received: by 2002:a17:902:d987:b0:2cc:ae2b:b6d2 with SMTP id d9443c01a7336-2ce9eac1d98mr54983735ad.15.1783850720120;
        Sun, 12 Jul 2026 03:05:20 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf77e4sm83401535ad.22.2026.07.12.03.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:05:19 -0700 (PDT)
Date: Sun, 12 Jul 2026 18:04:35 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Bruel <christian.bruel@foss.st.com>, 
	Frank Li <Frank.Li@nxp.com>, Nam Cao <namcao@linutronix.de>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Alex Elder <elder@riscstar.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Message-ID: <alNjykt9ERnMXTZ7@inochi.infowork>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-3-inochiama@gmail.com>
 <ak9KzNFF26B0Kttz@ashevche-desk.local>
 <alBNXgMAwXPKwiJ2@inochi.infowork>
 <alCoTEDUY8AO9OzD@ashevche-desk.local>
 <alDNlfb0_T9g-ATO@inochi.infowork>
 <alI6ml4xQboFOgxG@ashevche-desk.local>
 <alMmkHrfgWoN8RqS@inochi.infowork>
 <alNf1OoBtscauPXV@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alNf1OoBtscauPXV@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_030521_149952_4138161A 
X-CRM114-Status: GOOD (  34.94  )
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

On Sun, Jul 12, 2026 at 12:35:16PM +0300, Andy Shevchenko wrote:
> On Sun, Jul 12, 2026 at 01:41:25PM +0800, Inochi Amaoto wrote:
> > On Sat, Jul 11, 2026 at 03:44:10PM +0300, Andy Shevchenko wrote:
> > > On Fri, Jul 10, 2026 at 06:55:10PM +0800, Inochi Amaoto wrote:
> > > > On Fri, Jul 10, 2026 at 11:07:40AM +0300, Andy Shevchenko wrote:
> > > > > On Fri, Jul 10, 2026 at 09:57:05AM +0800, Inochi Amaoto wrote:
> > > > > > On Thu, Jul 09, 2026 at 10:16:28AM +0300, Andy Shevchenko wrote:
> > > > > > > On Thu, Jul 09, 2026 at 12:00:22PM +0800, Inochi Amaoto wrote:
> 
> ...
> 
> > > Then the counted_by will be incorrect as it may access valid memory, but
> > > unused by the driver.
> > 
> > After some search I found a requirement in GCC patch:
> > https://gcc.gnu.org/pipermail/gcc-patches/2024-May/653123.html
> > 
> > It seems like the array can have more elements than the counter.
> > Some I guess the reallocation is not necessary and the counter
> > is still correct. Correct me if I am wrong.
> 
> There will be no problem from memory accesses point of view, but there are two
> disadvantages:
> - the waste of memory for unused items
> - the memory accesses beyond used items, which may lead to or show the subtle
>   issues in the code elsewhere
> 
> Better to be correct. It might help debugging as well in some other cases.
> 
For correct number, I guess using "fwnode_property_get_reference_args"
is a idea, it is kind of ugly, but it does provide some function for
use to get the phy numbers. It is more like "of_clk_get_parent_count"
and "reset_control_get_count" in the clk/reset subsystems. 

I think adding a function like the above one is a good start point for
the phy array/bulk. At least this phy function is implementable for me,
since it is quite simple and straightforward.

Regards,
Inochi

> ...
> 
> > > > > > > > +	for (i = 0; i < k1->phy_count; i++)
> > > > > > > 
> > > > > > > 	for (unsigned int i = 0; i < k1->phy_count; i++)
> > > > > > 
> > > > > > I agree with the unsigned int, but I guess this definition is not
> > > > > > allowed in linux.
> > > > > 
> > > > > It's allowed and it's encouraged even by Linus. As long as iterator is local,
> > > > > use this syntax sugar and reduce its scope. It hardens the code.
> > > > 
> > > > Could you give me a reference url to check,
> > > 
> > > Sure, there are two (one for integers and one for pointers)
> > > https://lore.kernel.org/lkml/CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com/
> > > https://lore.kernel.org/lkml/CAHk-=wgy8p4is8ApEQCT5NS7XFb+NXeo-TKz7jRRZVksLLBSrQ@mail.gmail.com/
> > > 
> > > > I have not found this on the coding-style.
> > > > https://www.kernel.org/doc/html/latest/process/coding-style.html
> > > 
> > > Feel free to update the documentation.
> > 
> > Good to know thanks.
> 
> Are you going to update documentation? I can review it.
> 
> > > > > > > > +		phy_exit(k1->phy[i]);
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
