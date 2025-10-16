Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7ACFCCD183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 11:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUJnte7xLx4B5gwAz/5KmIZJc/OmJoh60rHOAOG2XeM=; b=wcqqg8TcyqHyFU
	Bj4YPQpcgewr4r3WwwBnZoyaHIkNoB5pmiBF1oInu26g/Ml27LtLkzy09prxqGuPHvmJFCZ4iJHfw
	NuIN9V5l6EPPJGW94T6aA9OmIb2ReB1s1felrge9c7et7gQ4qoVIMMpZtZ7xSmcr147hV0A7AHE+s
	fgBXe2BT5ChSNu4BdjqRCqgBc7CfuVuzzbOlaq3hEOI2NAkNmshSoxX0D+oyRL2XZhFpWUeyKvWAs
	u2Xu6GFaK6+I9wRnE26Jf7RsoysM6HpADjrgDpd09pGNd1Zjqp5U6kmrm5y2gU134VRQK/8LvexSi
	S64tHBBDr33Rru8Oo/uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MZC-00000004e3s-3EtI;
	Thu, 16 Oct 2025 11:54:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MZB-00000004e3Z-1Uqd
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 11:54:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ACAC960401;
	Thu, 16 Oct 2025 11:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52F2C4CEF1;
	Thu, 16 Oct 2025 11:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760615684;
	bh=R5K6gjYxckr64q8GAE7CkGg327Su9eLC9K5LHFsyno4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKORyzMlz37CnwE/AsPa7TwOC82iW7gFC91EMw9bX4VbuD2PeuD7xg9o0/pf5fTz7
	 OGW8CAYomuUH5B4T7iM1o+0+BaZcM98k3lJ1NGpdUAs7BdM81EKxvSlKLMoICxpvuY
	 Md+7EiDsto58hPRlFC4JbWi2lBGZS3qmQotx5yek7DU4DpK5j3zwx3VJYUD6gbNsjM
	 p8neDUHULHRzrrBBXiYod3mtCsujy+L2mzYjzRydSbupn2ul4bHfRRMNaEiUUeU/qj
	 aLbFDv+f8gfSfEl88WfSQtPCl05LKVTW/TGSJqdlM85Ag2tSykCRgUtKaDYQmA3k9c
	 x0fPQh1zX//PA==
Date: Thu, 16 Oct 2025 13:54:35 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Randolph Lin <randolph@andestech.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alex@ghiti.fr,
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
	ben717@andestech.com, inochiama@gmail.com,
	thippeswamy.havalige@amd.com, namcao@linutronix.de,
	shradha.t@samsung.com, pjw@kernel.org, randolph.sklin@gmail.com,
	tim609@andestech.com, Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v6 1/5] PCI: dwc: Allow adjusting the number of ob/ib
 windows in glue driver
Message-ID: <aPDc-yclubiHbUcD@ryzen>
References: <20251003023527.3284787-1-randolph@andestech.com>
 <20251003023527.3284787-2-randolph@andestech.com>
 <aO4bWRqX_4rXud25@ryzen>
 <aPDTJKwmpxolGEyj@swlinux02>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aPDTJKwmpxolGEyj@swlinux02>
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

Hello Randolph,

On Thu, Oct 16, 2025 at 07:12:36PM +0800, Randolph Lin wrote:
> > 
> > Could we please get a better explaination than "satisfy platform-specific
> > constraints" ?
> > 
> 
> Due to this SoC design, only iATU regions with mapped addresses within the
> 32-bits address range need to be programmed. However, this SoC has a design
> limitation in which the maximum region size supported by a single iATU
> entry is restricted to 4 GB, as it is based on a 32-bits address region.
> 
> For most EP devices, we can only define one entry in the "ranges" property
> of the devicetree that maps an address within the 32-bit range,
> as shown below:
> 	ranges = <0x02000000 0x0 0x10000000 0x0 0x10000000 0x0 0xf0000000>;
> 
> For EP devices that require 64-bits address mapping (e.g., GPUs), BAR
> resources cannot be assigned.
> To support such devices, an additional entry for 64-bits address mapping is
> required, as shown below:
> 	ranges = <0x02000000 0x0 0x10000000 0x0 0x10000000 0x0 0xf0000000>,
> 		 <0x43000000 0x1 0x00000000 0x1 0x00000000 0x7 0x00000000>;
> 
> In the current common implementation, all ranges entries are programmed to
> the iATU. However, the size of entry for 64-bit address mapping exceeds the
> maximum region size that a single iATU entry can support. As a result, an
> error is reported during iATU programming, showing that the size of 64-bit
> address entry exceeds the region limit.

Note that each iATU can map up to IATU_LIMIT_ADDR_OFF_OUTBOUND_i +
IATU_UPPR_LIMIT_ADDR_OFF_OUTBOUND_i.

Some DWC controllers have this at 4G, others have this at 8G.

Samuel has submitted a patch to use multiple iATUs to support
a window size larger than the iATU limit of a single iATU:
https://lore.kernel.org/linux-pci/aPDObXsvMoz1OYso@ryzen/T/#m11c3d95215982411d0bbd36940e70122b70ae820

Perhaps this patch could be of use for you too?


Kind regards,
Niklas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
