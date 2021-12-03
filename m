Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411BCC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 16:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cQr7lnaYk71gsBHpQAH4vV/AfsB6MAdG5YL20lb5FA=; b=mRLVkPwC9xL5Sc
	ubPpSYV/VDk7+O1cBNe8fY2v9cGppO9N6vIXKO199bslKNGABegWNXZTGdOYr0I7vcZHfKsoIxTQb
	o+fPa23V6PXgvHHMWNkclUdicCmezmnS9Tk2GY6PyHqIpUjTAG59rCC6qXDSqWDHByKPXQpORCPHr
	asIE51q/+aNfIF45okU+Qqjn4ClmxJTquHldQcdYNmSbpulp7GuL0n10u86MJUoEUYSohzkWzPT0/
	IgxY4tZUYNfUH2D9XG4V6+UUQP2If9LMOawDnBYdNclfewCriFUDWw2glZrBkXLl3S7yV7fG8GBv2
	u0akEI/iBSyAtVpiZwgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtBMf-00GVfe-FD; Fri, 03 Dec 2021 16:24:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtBMQ-00GVYS-VP; Fri, 03 Dec 2021 16:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yxCeT5L2so0oF7Ya8/mfoSuB7Zz70/VlOA+sRUIel9E=; b=GcmFpX+vqxCz9FoYqjIYVeVAgT
 U8ZWQ99at6CzkVBZZpkNMpBZSswCrCfadF6o5Nbh4ZLBpdXZIf63ewf8F0gKqtU2MkAYYBLBGxoDF
 tmcZmU6jLZrANB8oUjFl20hUEIgBJV6XsJ0agi46AaAB4jGuYCe0CSGvoC5cnyIzQs/1DyCRixPc1
 dFBX/L0wv5g6R6zAvWCKahu0X4C1L+gCFVCiVSaXQ5PnvfAtkmdK62+M37k10ZrMEsx+cnbhkMWMg
 GrhcCCWbL0bVapyjn4z8cO7CpYGmbfUt4BPVlFgMlFRmO+oh2Uf+YD70fO1vcs/Doy6hxInK06boC
 lPO3JUdA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56034)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mtBLv-00022h-GM; Fri, 03 Dec 2021 16:24:03 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mtBLr-0001Zz-JM; Fri, 03 Dec 2021 16:23:59 +0000
Date: Fri, 3 Dec 2021 16:23:59 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 hpa@zytor.com, Eric Biederman <ebiederm@xmission.com>,
 Alexandre Ghiti <alex@ghiti.fr>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org
Subject: Re: [RFC PATCH 5/5] arm: use IS_ENABLED(CONFIG_KEXEC_CORE) instead
 of #ifdef
Message-ID: <YapEn6D7XLTxdIKz@shell.armlinux.org.uk>
References: <20211203051157.2160-1-jszhang@kernel.org>
 <20211203051157.2160-6-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211203051157.2160-6-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_082435_036927_56EDBB8B 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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

On Fri, Dec 03, 2021 at 01:11:57PM +0800, Jisheng Zhang wrote:
> Replace the conditional compilation using "#ifdef CONFIG_KEXEC_CORE"
> by a check for "IS_ENABLED(CONFIG_BLK_DEV_INITRD)", to simplify the
> code and increase compile coverage.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
