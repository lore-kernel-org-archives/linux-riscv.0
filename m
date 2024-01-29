Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED43C47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 15:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+CKAK3D56Tg5BXmr8d0SYIJi5c7kU5DEqS8J8wV/Sw=; b=C3XV8miMmk5FtW
	aCNsjooeD9LhV4OY2cVrC0/a5bXCtv4vWZ7XzMdsGDkt28WNj1jGCy0DUf/xuycfdzOuJgk4h1CPp
	6oQMM0FG6Aw/od6441hiQ94WHuSig0n9sOIFHCYtt138/X6zQ84gSe5Dp+IeRuu6xjANEe+VL7Qsx
	RtnRICm/b02uDmc+GlFQW/sqqESUxfjFoxKCncgrcrPqxEs75BZAGK78Ie0iyGo9bXqN03BK/7LCJ
	PC3mW5oMXJb/Pytr79QMQ0zjFm0k+mR1ljEERCE4Yf5FOidiIs56ixC8Q45L8oA5ZSPCYvHj4lUZx
	HgXPD+uSBAmaYMtyJvDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTdB-0000000DI9e-06SB;
	Mon, 29 Jan 2024 15:33:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTd8-0000000DI8k-2CYQ;
	Mon, 29 Jan 2024 15:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CrHCTlFRqhVi35tK959UuBbKAaE+0blDjjqiPB7oOOk=; b=QPBMraaOzb39X/fTDTDp8vZn3U
	RyQNYMvVEuosY1G2SF9dOmBcU/EIjaw/4q1ZtewTtTqBR2ZTFc0HwNzLEMLV2PL1R+6KEJM2hgN8y
	y27brvTJVMBs3/Kx16Qyd0F6UgR6nO91iHksI1MULxx1Uv/MoCL4CJVPMswAs3vMX+z1pVQoWF9mP
	ciarx1HSr1oQZTuCJWBn/mylPek1/6qnmqyWafXtUnzD171hxxU3T2/IBjNv4sD9GCQi2Sz5aNUJ2
	NpFd5Kwem/2q2pdUrG702/gdn6SHY1d9fOFivlToOyVuVDMwEArwj3mFhJINI1ddPyf7tn0gTM/tU
	xrrJkCOA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40068)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rUTcv-0000bZ-0j;
	Mon, 29 Jan 2024 15:32:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rUTcp-0004f6-8p; Mon, 29 Jan 2024 15:32:43 +0000
Date: Mon, 29 Jan 2024 15:32:43 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>, vishnu@os.amperecomputing.com,
	miguel.luis@oracle.com
Subject: Re: [PATCH RFC v3 03/21] ACPI: processor: Register CPUs that are
 online, but not described in the DSDT
Message-ID: <ZbfFG5JLnAkGN1pk@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOg2-00Dvjk-RI@rmk-PC.armlinux.org.uk>
 <CAJZ5v0ju1JHgpjuFLHZVs4NZiARG6iBZN_wza6c2e0kDhZjK0w@mail.gmail.com>
 <ZaURtUvWQyjYfiiO@shell.armlinux.org.uk>
 <20240122160227.00002d83@Huawei.com>
 <CAJZ5v0hamuXJ_w-TSmVb=5jGide=Lb7sCjbzzNb_rFuPrvkgxQ@mail.gmail.com>
 <Za6mHRJVjb6M1mun@shell.armlinux.org.uk>
 <20240123092725.00004382@Huawei.com>
 <20240129130354.0000042b@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129130354.0000042b@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_073302_586057_265C8E17 
X-CRM114-Status: GOOD (  16.47  )
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

On Mon, Jan 29, 2024 at 01:03:54PM +0000, Jonathan Cameron wrote:
> I poked this on x86 - it only applies with hotplug enabled anyway so
> same result as doing the hotplug later - All possible Processor() entries
> already exist in DSDT. Hence this isn't the source of the mysterious
> broken configuration.
> 
> If anyone does poke this path, the old discussion between James
> and Salil provides some instructions (mostly the thread is about
> another issue).
> https://op-lists.linaro.org/archives/list/linaro-open-discussions@op-lists.linaro.org/thread/DNAGB2FB5ALVLV2BYWYOCLKGNF77PNXS/
> 
> Also on x86 a test involving smp 2,max-cpus=4 and adding cpu-id 3
> (so skipping 2) doesn't boot. (this is without Salil's QEMU patches).
> I guess there are some well known rules in there that I don't know about
> and QEMU isn't preventing people shooting themselves in the foot.
> 
> As I'm concerned, drop this patch.
> If there are platforms out there doing this wrong they'll surface once
> we get this into more test farms (so linux-next).  If we need this
> 'fix' we can apply it when we have a problem firmware to point at.

Now dropped.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
