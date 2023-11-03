Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A113C0018A
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 11:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWbIIxwObs1ZQLzQyOA1Uf/6SqXdKdIpDpWo3eeThMw=; b=yxLp2jVnCHkT4c
	nDOm/Z1CPNnvQpAoxjqcozl/Nzna271ln3HXZeVKSPGzBecpQhhJpBcbcJzBVaFPuHL22jcYyZK+z
	J5pF/gWXocMbmcSCexoXz9YWcllNsY4u1fULcPZn1n89oKYT7ChlGEvEV7m6a9WSZsUgfbFjMoFvK
	6/1KJpf6ilGPQQAjGj0EkhSQzcyM1I3g7VJ25JBlDe/afAOFUkTHA1cVfZzta63TG69XJYceHU5s7
	6CA0qPPPO1QW5IfHgRO/IfjU9KcaVc9pAPn9eoe8+oMLfA4ovVqdhg4KDVEWAgTPfB08yxXi+7N/c
	rj6QHBbJjAVn35ItqQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qysUz-00BLLG-1D;
	Fri, 03 Nov 2023 11:38:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qysUt-00BLJg-2h;
	Fri, 03 Nov 2023 11:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=plA7feRLjmw4qX8KHH4SK8cHKzi6R1RnGQsSzHXmiyI=; b=r8gKUdsct6x4xUzkDbnVrAliys
	rU49OJZGVR/coPFqdct2gl3oH8umMdcw78VUvbESCMCAkfM1BwnJZ3Ph0C45+elImNUCpr60BqSsH
	539nSH/dnv/1zwwWt2HOm3bEUk+vWS0Wb0jqiMy4Iz2c2QcWlv6e8NnvBAxX4OSyrSuJI8JjcPM/6
	faPhoJ57lVoPb/s24YOWGJeMJ4E24vPer/AYqlbG6QT/lZTSodAEzGt7NWfZhoMB/ItsbabE7KPyC
	ZlxVdQBM2mEMWzCRZUQscCv1BgID5FJi8m5rOU62HUGCiIGYAfh1CjAzm/rE0HQbqLaN9Yvdsxlth
	T8Ya2edg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33780)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qysUl-0005UH-1j;
	Fri, 03 Nov 2023 11:37:47 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qysUi-0008MP-VI; Fri, 03 Nov 2023 11:37:44 +0000
Date: Fri, 3 Nov 2023 11:37:44 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: James Morse <james.morse@arm.com>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com
Subject: Re: [RFC PATCH v2 15/35] ACPI: processor: Add support for processors
 described as container packages
Message-ID: <ZUTbiO2/SSFcTPAV@shell.armlinux.org.uk>
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-16-james.morse@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230913163823.7880-16-james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_043755_876414_07A5F692 
X-CRM114-Status: GOOD (  10.93  )
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

On Wed, Sep 13, 2023 at 04:38:03PM +0000, James Morse wrote:
> ACPI has two ways of describing processors in the DSDT. Either as a device
> object with HID ACPI0007, or as a type 'C' package inside a Processor
> Container.

I'm struggling with the reference to a "type 'C' package inside a
Processor Container".

ACPI 6.0, which introduced the Processor Container, says: "This optional
device is a container object that acts much like a bus node in a
namespace. It may contain child objects that are either processor devices
or other processor containers"

For "Processor device":

"For more information on the declaration of the processor device object,
see Section 19.6.30, "Device (Declare Device Package).""

which leads one to the Device() object, not the Processor() object.
It also states:

"A Device definition for a processor is declared using the ACPI0007
hardware identifier (HID)."

My understanding from this is that Processor() is not allowed to be
used within a Processor Container, only Device()s with _HID of
ACPI0007 are permitted.

In light of this, please could you clarify your first sentence, as it
seems to be contrary to what is stated in ACPI 6.x specs. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
