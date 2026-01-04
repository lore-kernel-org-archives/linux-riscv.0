Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85685C2A06A
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 01:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ohvVFDtfmv0TlOqxlLaMU0fByckeSJGF6BIhQae3D4=; b=1DF6J3PT84fia6
	0Wndi49qfDQfHftQqZJ5hvumq4sHxJKNCHe9VXlWpcsN/zvuqWfly6bEq8X8O2PaA96QJ9G63S+wd
	k0w5fWg5vVAq7G4JRhWkYr8tAfU8Ie809A2RQAqo2mqzxoAuvPpDBuz6NuC69orzL+oZ6Eo1VKicA
	NAKfn5WFduz6Qni9yTEyQdJex8EO0ShozStc3Z9POVWMQ5j9vy/qCeagWxV8xmMsTfrHdRKdYCFQK
	DDSbpAg4D5AFR2lmVM9HFkfYBmDa/ZR9Eh92EVEv8O6zYsrpH8b6YMq4MlYiypBA2rOuCd/f14zk3
	1k7gVy6sQpiHb6zI99Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcD4A-00000009wOl-1NT5;
	Sun, 04 Jan 2026 01:37:58 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcD46-00000009wNu-3jb4;
	Sun, 04 Jan 2026 01:37:57 +0000
Received: from duge-virtual-machine (unknown [223.160.207.26])
	by APP-03 (Coremail) with SMTP id rQCowAAXFbxDxFlp5eBIAw--.15S2;
	Sun, 04 Jan 2026 09:37:09 +0800 (CST)
Date: Sun, 4 Jan 2026 09:37:07 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Vinod Koul <vkoul@kernel.org>
Cc: conor@kernel.org, gregkh@linuxfoundation.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	neil.armstrong@linaro.org, krzk+dt@kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/5] phy: usb: Add driver for Canaan K230 USB 2.0 PHY
Message-ID: <aVnEQ4+coOd397Hk@duge-virtual-machine>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230023725.15966-5-jiayu.riscv@isrc.iscas.ac.cn>
 <aVZQ4YVXGryHz0ds@vaman>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aVZQ4YVXGryHz0ds@vaman>
X-CM-TRANSID: rQCowAAXFbxDxFlp5eBIAw--.15S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFykWr1xAryUKFy5uw1ftFb_yoW8WFWxpa
	95Ja1UtFs7WF40vFsF9w18Ja4SqFZ3GwnI9w15CrWvqas0qrW0kFy3CFs8Z3Z7WF1kZr10
	yrW8ta48uFn8uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUqiFxDUUUU
X-Originating-IP: [223.160.207.26]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_173755_299361_80CFA6D9 
X-CRM114-Status: GOOD (  13.65  )
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

On Thu, Jan 01, 2026 at 04:18:01PM +0530, Vinod Koul wrote:
> On 30-12-25, 10:37, Jiayu Du wrote:
> > Add driver for the USB 2.0 PHY in Canaan K230 SoC, which supports PHY
> > initialization, power management and USB mode switching.
> > 
> > Add Kconfig/Makefile under drivers/phy/canaan/.
> > 
> > Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
...
> > +#define TEST_CTL3_OFFSET	0x0C
> 
> Lowercase hex values please.. do you need a test register :-)

Sorry, I will convert the hex to lowercase.

In the TRM manual, the registers are named TEST_CTL and they are
used to describe the otg0 phy port control. The TRM manual is here[1].
The description of this register is located on page 1015.

Therefore, I have retained the names as stated in the TRM manual.

Link:
https://kendryte-download.canaan-creative.com/developer/k230/HDK/K230%E7%A1%AC%E4%BB%B6%E6%96%87%E6%A1%A3/K230_Technical_Reference_Manual_V0.3.1_20241118.pdf
[1]

> > +	FIELD_PREP(USB_CTL0_PLLPTUNE_MASK, 0xC) | \
> 
> lower hex here and rest

I will fix it in v2.

> 
> > +	ret = regmap_update_bits(phy->regmap, phy->reg_test_offset +
> > +				 TEST_CTL3_OFFSET, val, val);
> 
> so we are writing to a test register..?

As I mentioned above, this is actually otg0 phy port control
register.

> > +	int ret;
> > +	u32 offset;
> > +	struct regmap *regmap;
> > +	struct phy *generic_phy;
> > +	struct k230_usb_phy *phy;
> > +	struct phy_provider *provider;
> > +	struct device *dev = &pdev->dev;
> 
> reverse christmas  tree order would look better...

I will fix it in v2.

> > +
> > +
> 
> why two lines...?

I will fix it in v2.

> 
> > +MODULE_LICENSE("GPL");
> > -- 
> > 2.52.0
> 
> -- 
> ~Vinod

Regards,
Jiayu Du


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
