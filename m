Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50F0D44C54
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 14:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9rGcsV7tIJ8wgXTQgLJ81cOism7hyeT3WNRX8UieDPM=; b=QlZpuIvqiw+gCP
	H5GSTxeLKgXszh2Sb8dtEm+jtHuWUDIs97iBQBenp4Bz7+aSH+OL96tBxuJvjxCcc9ul8VQdgvz9T
	SDKPQy1LqruHKTHlSVz2hlwyiZTxXutb6/GHHGN7P8uCgsjTv5Yz0xlcrCXR0PNGKNI+DsFNZO/A8
	y5e6ze2U4SYdI1Wgut+egETGSOxApMB8ucpYWzAEuE8Hpta2BIoAcOVdjIROt9VjEEU9jigXEqQHY
	yQE8WILveEg6u8u0giWhag+OrAnp10SFC0z/JdepSPj7kj92vmwONkkhzvRELkhGIiUrZ7/R64J0N
	XbdlZb8ZKaZECljjQsIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOS7-0000000CUdP-0a1Y;
	Thu, 15 Jan 2026 14:35:59 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOS2-0000000CUcS-1Q3a;
	Thu, 15 Jan 2026 14:35:57 +0000
Received: from duge-virtual-machine (unknown [183.192.221.134])
	by APP-05 (Coremail) with SMTP id zQCowAAXqw4f+2hpvPUXBQ--.42438S2;
	Thu, 15 Jan 2026 22:35:13 +0800 (CST)
Date: Thu, 15 Jan 2026 22:35:11 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Vinod Koul <vkoul@kernel.org>
Cc: conor@kernel.org, neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, 18771902331@163.com, cyy@cyyself.name,
	TroyMitchell988@gmail.com, kingxukai@zohomail.com,
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, gaohan@iscas.ac.cn
Subject: Re: [PATCH v2 3/4] phy: usb: Add driver for Canaan K230 USB 2.0 PHY
Message-ID: <aWj7HyeDQU6ytGz3@duge-virtual-machine>
References: <20260115064223.21926-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260115064223.21926-4-jiayu.riscv@isrc.iscas.ac.cn>
 <aWjYHK1cTj8Dbz2B@vaman>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWjYHK1cTj8Dbz2B@vaman>
X-CM-TRANSID: zQCowAAXqw4f+2hpvPUXBQ--.42438S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF45Kry8Jw1UAw1xCrW5GFg_yoW8WFy7pF
	Z5XF1jqF43Jr97WrWSvF4kGr1Svws5Kw1UCryak3yrWwnIvr4xCayjg3y5Zwn5ZFZ5AFyI
	9r1jqFyxCFZIkrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07bIBTOUUUUU=
X-Originating-IP: [183.192.221.134]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_063554_746004_21334940 
X-CRM114-Status: GOOD (  10.69  )
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

On Thu, Jan 15, 2026 at 05:35:48PM +0530, Vinod Koul wrote:
> On 15-01-26, 14:42, Jiayu Du wrote:
> 
> > +static struct phy *k230_usb_phy_xlate(struct device *dev,
> > +				      const struct of_phandle_args *args)
> > +{
> > +	struct k230_usb_phy_global *global = dev_get_drvdata(dev);
> > +	struct k230_usb_phy_instance *phy_inst;
> > +	struct phy *phy;
> > +
> > +	if (args->args[0] >= MAX_PHYS)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	phy_inst = devm_kzalloc(dev, sizeof(*phy_inst), GFP_KERNEL);
> > +	if (!phy_inst)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	phy_inst->global = global;
> > +	phy_inst->index = args->args[0];
> > +
> > +	phy = devm_phy_create(dev, NULL, &k230_usb_phy_ops);
> > +	if (IS_ERR(phy))
> > +		return ERR_PTR(PTR_ERR(phy));
> > +
> > +	phy_set_drvdata(phy, phy_inst);
> 
> This seems wrong place, why is this not done in the driver probe?

You are right, creating phy instances in the xlate function is not
the right place. I will move the allocation and devm_phy_creat to
the probe phase to create both instances.

> > +	global->reg_test_offset[0] = 0x70;
> > +	global->reg_ctl_offset[0] = 0xb0;
> > +	global->reg_test_offset[1] = 0x90;
> > +	global->reg_ctl_offset[1] = 0xb8;
> 
> Where are these magic values coming from?

These offsets are from K230 Technical Reference Manual section 12.6.4.2.
The TRM is here[1]. I will define them as macros with descriptive names.

Link:
https://kendryte-download.canaan-creative.com/developer/k230/HDK/K230%E7%A1%AC%E4%BB%B6%E6%96%87%E6%A1%A3/K230_Technical_Reference_Manual_V0.3.1_20241118.pdf[1]

I will send v2 with these changes soon.

Regards,
Jiayu Du


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
