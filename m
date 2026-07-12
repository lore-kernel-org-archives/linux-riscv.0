Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0C7C44501
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 05:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8rJ0uEjleBB698K3JZKueAUkFxriokYSpYHBPlgYTvE=; b=CPu2T9rYPKMJBr
	Y02u8mn4n6LoUZ+FJpH/xDDZssXvDWgxQ/NGOWl3BpHAfuDx013ZQJXeV1WGZZFB919jDud8QxlZw
	jURNwEMK+dHCuqto+1Er+jUQlGBhJeQVmhHfzXfIY/U7M81X7vaJJWXkLwlzv8OSFBqi4IQWD14CJ
	GEI6NffWrhS4Dbu3IT/Ldg6g6XmR8wtw9PhWxvH3NYGuVypMplxtSFRs6Kv6FGOXU9dp5Az33ZDCg
	+0JGm85KNdWklYMXWHe1qS9x0F//td0iX4AELhRe/BxJIjWPWVWnSETx8h9NZe+wQ/hqv5d4XneqA
	uUjnQ22my0rxpG+FoMoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wimxB-00000007Aqa-1EC2;
	Sun, 12 Jul 2026 05:42:13 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wimx8-00000007AqF-0lpJ
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 05:42:11 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-842338c18e0so1675285b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 11 Jul 2026 22:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783834929; x=1784439729; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FaLvu9plWauuInWbH6Nm3IcDF3YBj3kM6gVC9OQY//0=;
        b=kI3KFHlCKTLWuAK+ZwYCeyTpMPHVq689lpcHKZ/DW8mOyEZewNuB1dL/T07CXNF2Mb
         CdU0180ZLu449jzhogCeAZbDJACFhjt1ubHV1K213YJJfB2MMO1isyXXd7Q+Dye764Vl
         KPlsTWHTmB5PcBDI0naYDhPgucskcW4smgIODyriH2eb30DIgANjOx/P5AnErm+3TKFn
         h6joHuRjuTEb/JA7O9NY58RR9eCTwwxYE8jEOjCsxlJubFIBj6k36m6PmXO9COiI+u4x
         QmhKHlyNoHHdWs+lYWAiFzeqU7V31o+luiyk0zXPK/PniRbneR7SPyeT0WW875gKVpcF
         UO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783834929; x=1784439729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FaLvu9plWauuInWbH6Nm3IcDF3YBj3kM6gVC9OQY//0=;
        b=cPqCtH3+5NFs3WVbeyFatsqFpIRZQGOIq8BYC473HX5WiI+hVdvWBdIPPwkDyHKncs
         6XsXMS7xz9U+FEeB2RAYOOl7bDsC4NGlBOHlyp3wc6X3PHwcS7sKVfFjl/fbtytfdDU9
         WhNDdeJG5A+nqdum6H8SxeiZ1fK2uA8yg5VnOwByglEHwWmLMQcf0i1pQIZgeebyUEQ+
         6Yr4eh2AlbL4fITNtyrnaQSaCPZNazlNHhP9dJNPudciiw3DZGOJBt+y2THDY2ll9wBa
         nktBDPYTWhm3rTELHzdZBKYc56sHjhNOZauOsUFJwoqWTEmU/86I917vI7kK1NznLpfl
         mJRQ==
X-Forwarded-Encrypted: i=1; AHgh+Roi6eLTodS49OSh9ogL/ULHyfTKUMndNPTIgt6IY1p52r7ECJ4m8HsvyX6kBu9Xpem64lrl+G5/z8DIUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsiPDzzpfTN0YDkcIXqXgrzCcOScVL0tRSdjFZkvLOuI0gFPRf
	d5te6qUka6HFPaEEZj86fh+uDIzoI8q1QZB+JolB9jSk8JBktZHW1XC+
X-Gm-Gg: AfdE7cmOyocRI7iWmku3by1kEtp4SwIimttAuXWKglC2S1v8iReOptdzKPZeq4ARova
	fN2COtOFrxspWwF9ap2ilDU+/trjEqGQu+qJ8SljGyQq79By0mP4AhjAWmd4K6cPCQU5tjx+z3+
	/FPSSSrEb3UyKA2wxep2TGh5jNsrC6fGYs1xB+7KYTh5cTRieyAmZDzIv3x6/JhlTsjKEV+iwbM
	gwAi10RRoAOoYl4tqhQ7RPf8KQIS10jRqJfj0qTO4Gtoh7xIQq8tdG4ZSNN/iDqi6OeAFX3v0Rf
	1mTanulLjaua2hf+CJZ8oBaDLPuwV25GEtMa9iSUFZp7deX+n2y6NhBZNIGQz9uT4W95mahda/h
	uvp6l+fwBRaU16KZWraYbddtWK9cgefa51GF05ypx2XWG8ImJWvFapCkT0FPEHjf1
X-Received: by 2002:a05:6a00:4487:b0:842:3a3b:d6e7 with SMTP id d2e1a72fcca58-8488965bcf6mr4272160b3a.23.1783834929207;
        Sat, 11 Jul 2026 22:42:09 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a15e36158sm691343b3a.47.2026.07.11.22.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:42:08 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:41:25 +0800
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
Message-ID: <alMmkHrfgWoN8RqS@inochi.infowork>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-3-inochiama@gmail.com>
 <ak9KzNFF26B0Kttz@ashevche-desk.local>
 <alBNXgMAwXPKwiJ2@inochi.infowork>
 <alCoTEDUY8AO9OzD@ashevche-desk.local>
 <alDNlfb0_T9g-ATO@inochi.infowork>
 <alI6ml4xQboFOgxG@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alI6ml4xQboFOgxG@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_224210_250975_AB89D75D 
X-CRM114-Status: GOOD (  46.24  )
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

On Sat, Jul 11, 2026 at 03:44:10PM +0300, Andy Shevchenko wrote:
> On Fri, Jul 10, 2026 at 06:55:10PM +0800, Inochi Amaoto wrote:
> > On Fri, Jul 10, 2026 at 11:07:40AM +0300, Andy Shevchenko wrote:
> > > On Fri, Jul 10, 2026 at 09:57:05AM +0800, Inochi Amaoto wrote:
> > > > On Thu, Jul 09, 2026 at 10:16:28AM +0300, Andy Shevchenko wrote:
> > > > > On Thu, Jul 09, 2026 at 12:00:22PM +0800, Inochi Amaoto wrote:
> 
> ...
> 
> > > > > > +	k1->phy_count = i;
> > > > > > +	if (k1->phy_count == 0)
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	return 0;
> > > > > 
> > > > > This doesn't seem correct to me, I would expect phy_count to be assigned only
> > > > > when it's valid. (Yes, perhaps 0 is the same as it was, but semantically it's
> > > > > different 0 in this case.)
> > > > 
> > > > I guess you think 0 is a valid number? I can not understand what you thing
> > > > Assign this to 0 if there is no phy is fine to me, which shows there is 0
> > > > vaild phy found.
> > > 
> > > Isn't it already 0? Semantically code is wrong in a flow (not in the result).
> > 
> > In fact it is already 0 here. But I am not understand why you thing is wrong.
> > Could you explain it in detail? (Maybe you think it is not good to return 
> > -EINVAL?)
> 
> You rewrite 0 by 0, but the fact of the rewriting is inaccuracy.
> We should not rewrite the default (whatever it is) with 0 count
> as semantically they are different cases. The rule of thumb, we
> don't assign values in case of errors, we leave them as is and
> it's user / caller responsibility to assign the default and handle
> errors properly. This is simple layering violation.
> 
> Your code should be
> 
> 	if (i == 0)
> 		return -EINVAL;
> 
> 	k1->phy_count = i;
> 	return 0;
> 

Good, I understand it. Thanks.


> > > > > See also above. Do we have some PHY API that just counts provided PHYs?
> > > > > If not, that what you should probably add first, before this patch.
> > > > 
> > > > I have not found any api for this. But the actual problem is, how the api
> > > > is designed. I have checked both the array bulk api for reset and clock,
> > > > it seems like it is much more than this patch...
> > > 
> > > Yeah, I looked at the phy-core and I think it will be hard to implement.
> > > So, the idea is then is to reallocate the pointer each time you get a new PHY.
> > > In this case the phy_count will reflect the actual memory consumption by phy.
> > 
> > Emmm, I think it is kind of buggy and not necessary. In most case
> > this array is not long actually, so allocate some pointer should be
> > fine and be an acceptable cost.
> 
> Then the counted_by will be incorrect as it may access valid memory, but
> unused by the driver.
> 

After some search I found a requirement in GCC patch:
https://gcc.gnu.org/pipermail/gcc-patches/2024-May/653123.html

It seems like the array can have more elements than the counter.
Some I guess the reallocation is not necessary and the counter
is still correct. Correct me if I am wrong.

> ...
> 
> > > > > > +	for (i = 0; i < k1->phy_count; i++)
> > > > > 
> > > > > 	for (unsigned int i = 0; i < k1->phy_count; i++)
> > > > > 
> > > > 
> > > > I agree with the unsigned int, but I guess this definition is not
> > > > allowed in linux.
> > > 
> > > It's allowed and it's encouraged even by Linus. As long as iterator is local,
> > > use this syntax sugar and reduce its scope. It hardens the code.
> > 
> > Could you give me a reference url to check,
> 
> Sure, there are two (one for integers and one for pointers)
> https://lore.kernel.org/lkml/CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com/
> https://lore.kernel.org/lkml/CAHk-=wgy8p4is8ApEQCT5NS7XFb+NXeo-TKz7jRRZVksLLBSrQ@mail.gmail.com/
> 
> > I have not found this on the coding-style.
> > https://www.kernel.org/doc/html/latest/process/coding-style.html
> 
> Feel free to update the documentation.
> 

Good to know thanks.

> > > > > > +		phy_exit(k1->phy[i]);
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
