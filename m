Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF23CD54AC
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 09:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kgQlml2leYMSrO5KCpC8RPnX4A2/Qpr4R9r5sPqS0Uk=; b=SNROEpV4ueJ7oR
	6Kvw1Bv9iONoK/wGXpslTykPlO3Q+kvCamJRK9f4BvgxwR0Ru9f3ZwY69eMvsmMxoR2eby2sw1RLU
	bMlpRdpnkILN4yAsPZpb2uLbcF9A1+sj7YXI48/xu7XZ2E2oi9rXs2qhrQQtr/BnvHbm7kcbi/Mgd
	WjI0dhgbnwYAsZZXO+SeBCTpdlRhzUeNh35x1McjPBanePqtQUwDeNejBma7w0xFkvVWVcCxO6EIT
	eAGJU653Zt/9oRqVeKRxB+SHIMeRqMRcr/OBsOgr73Bwe1YA/3XH5EnpQvy4guly0aUB9HxrNwz0X
	P8Qq13Vu7FJO7wEC8DTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXSE-00HZ6j-2h;
	Tue, 19 Sep 2023 09:55:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXSB-00HZ5Z-0C;
	Tue, 19 Sep 2023 09:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BHDU/uL8LxSg62Q/u4osBO6lMbutGaWzvUBNKWgWQLM=; b=pLvrwD4msGWTwxI8101DXka/78
	DZEMxr08Dp8UAFTjZbVfC9lF+XzkCI4X73WOV7xA6bvQQrmxHHgrwHTsGvzqcv7QjmXFtuvJZPXrr
	e80aORF125Xth3z/Nr4XDOaFG+q7HzMK8hA9mFOhJ2ewEwudulmxbBQgiyQ9tA2CARLvEr8slMmQT
	YUuQGIbaP48KiRH0+Utzxhqxt65swdcVCy5eD+L+bwYLGmobeQZGiGQv/jhOEh64rD4JlvW02y4ae
	sOrAwSmaJ5sap4IFpnXyYAFAFVYzvkv73YnhzlE77IZrS/t1HHduvLPnImGQPMFj0YPU5O4QmE7ha
	489v0a7A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33864)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qiXS4-0001em-11;
	Tue, 19 Sep 2023 10:55:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qiXS3-0001P0-3I; Tue, 19 Sep 2023 10:55:27 +0100
Date: Tue, 19 Sep 2023 10:55:27 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gavin Shan <gshan@redhat.com>
Cc: James Morse <james.morse@arm.com>, linux-pm@vger.kernel.org,
	loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com
Subject: Re: [RFC PATCH v2 32/35] ACPI: add support to register CPUs based on
 the _STA enabled bit
Message-ID: <ZQlwD50FEZeeAMBQ@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-33-james.morse@arm.com>
 <ad068df5-d5b1-030a-af25-723cd5c3b854@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad068df5-d5b1-030a-af25-723cd5c3b854@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_025535_093788_EE4AD32B 
X-CRM114-Status: UNSURE (   9.07  )
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

On Tue, Sep 19, 2023 at 02:46:22PM +1000, Gavin Shan wrote:
> The message needs to be split up into multiple lines to make ./scripts/checkpatch.pl
> happy:
> 
> 	pr_err_once(FW_BUG "CPU %u is online, but described "
> 			   "as not present or disabled!\n", pr->id);

No. checkpatch is wrong on this point. Splitting the message like this
hurts debuggability, because the message can no longer be grepped for.

What James has done is perfectly fine.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
