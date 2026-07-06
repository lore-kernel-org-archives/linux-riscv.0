Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295B8C43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 08:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qpPDe6dJY2FwPRI5rPxyGKN/bL1BSS1AbsmiKmJgx0I=; b=CerZGCBwnZNjC/
	IAhki1pwhXad60aCVylF4N4nfE2LbIf/VvcT7USMvFHKr1ifR9J8Rmty55dguoCrtv1Hr/vy5kWjV
	CZpI1GkwsdwKkkwU/CXXqZVTP6p0WKgx1FtefDmD8I22E7XxLeJCLvvyb6WD9ZCJGb+RIr4KT3abj
	HGrwIZ22zivDNqtOmyjlOMIR7I04+9vIxlrAbOxXeX8Bo3E+h8I2+TlEeWTj5fh4En4E9yeVN908b
	x8nKhDaKm7b8izMaeYDzfVVkE949iD7kgTVjpxLc/Y4kKpVRbaDSk/uniGvAY6y+ViY0aQMOkgkfw
	YgNJSU/SiaDdRi6U5OLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeys-0000000Bt0m-0zxW;
	Mon, 06 Jul 2026 08:47:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeyk-0000000Bsz3-2O0y;
	Mon, 06 Jul 2026 08:47:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5577A436AD;
	Mon,  6 Jul 2026 08:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABB91F00A3A;
	Mon,  6 Jul 2026 08:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783327622;
	bh=UGILdGIqq+1IKf9yow+nP7y57LK2rfH/A9Z6IA5aPb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=InZqhSUj695xT8151QVlSgvSGozgmRqrqPlRN2PvXVEEtO9zST/H3OxPkj30S6yaY
	 df8jJSnuAmgMXe/bdfXiQJlywBHbBAIEmuz43lTQYBf4lj4GfvWxUxP8aVPbmZA7D4
	 t3TUek+erMuQZ382Dqaef1EXQpDuxmOgtjFm/K1zidRcOrNexyxKmGElpl/Jq+mdh7
	 AdeYW/PKYBZdx8qDlmm4/BH4NFWcr4bumSVDkq4/n/Ua7VnnJIr5L0RgJhHGeaymYd
	 /9pOER+OfAX+MJMw3yhAkIXIkXy78z7fjvGEHJ8BW5CBIdhrlbcannRN6sBR1HP+xv
	 cSRaozu9sWEoA==
Date: Mon, 6 Jul 2026 10:46:55 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 1/7] ACPI: Add acpi_device_clear_dep() helper function
Message-ID: <aktrfyXrIeCL1eqp@lpieralisi>
References: <20260701-gic-v5-acpi-iwb-probe-deferral-v3-0-c5562cf0fe29@kernel.org>
 <20260701-gic-v5-acpi-iwb-probe-deferral-v3-1-c5562cf0fe29@kernel.org>
 <87jyrd6q0o.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87jyrd6q0o.wl-maz@kernel.org>
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
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Catalin Marinas <catalin.marinas@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, loongarch@lists.linux.dev, Hanjun Guo <guohanjun@huawei.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 02, 2026 at 10:27:35PM +0100, Marc Zyngier wrote:
> On Wed, 01 Jul 2026 15:38:49 +0100,
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > 
> > Code clearing device dependencies in ACPI in drivers through
> > 
> > acpi_dev_clear_dependencies()
> > 
> > requires annoying ifdeffery to make sure it is compiled out on
> > !CONFIG_ACPI configurations.
> > 
> > Implement a wrapper function to clear device dependencies that can be used
> > in device drivers without conditional compilation.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > ---
> >  include/linux/acpi.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> > index 10d6c6c11bdf..4f950f5386d7 100644
> > --- a/include/linux/acpi.h
> > +++ b/include/linux/acpi.h
> > @@ -94,6 +94,12 @@ static inline void acpi_preset_companion(struct device *dev,
> >  	ACPI_COMPANION_SET(dev, acpi_find_child_device(parent, addr, false));
> >  }
> >  
> > +static inline void acpi_device_clear_dep(struct device *dev)
> 
> uber nit: "clear_dep" is singular, while "clear_dependencies" is
> obviously plural. acpi_device_clear_deps() would look slightly
> clearer.

Hi Marc,

sure I will update it and respin a final version.

Thanks,
Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
