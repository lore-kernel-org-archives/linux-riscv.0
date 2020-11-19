Return-Path: <SRS0=5I1x=EZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE48C388F9
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 10:48:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33EE92225B
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 10:48:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yKwwzvZE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33EE92225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TJozOe/MegZ/exu37jsGcEvD2P6qAEbOXeAVKfxD2cM=; b=yKwwzvZEHUXMCQZX3ZEKwEXpK
	37EVdGprrK0MB0w6f1unZMHJspQIuxh5hNuLXZckqvMh7imxq/0b00NqezI4lcTzPJYYm3r9X/7LW
	L4VfHq+ceJszMHlcyEvI7lVqUXIJigwox3KB89zr8AHKzSyDYHsW3Qyaf9hKgdnjuBLN7eHAxnBXZ
	TbtUCLpJuPIMyp/zSvPhM5MsUiqd0S8wMgpsimQKMt5fp/E9gafBxvxDMhVnr2x8P83qAyDfVtOoy
	w6HMtbPonsYSv7D6oc4/zevkYZ8X+jqjT6iLyOq5jzMA5IZfEu0I8xN5fXI2Mg+KjKhFbyjQXJMD3
	R2Rj7T7/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfhTi-0001Gd-Us; Thu, 19 Nov 2020 10:47:50 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfhTf-0001Fp-LP
 for linux-riscv@lists.infradead.org; Thu, 19 Nov 2020 10:47:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 620E31396;
 Thu, 19 Nov 2020 02:47:46 -0800 (PST)
Received: from red-moon.arm.com (unknown [10.57.62.135])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0E7D3F718;
 Thu, 19 Nov 2020 02:47:42 -0800 (PST)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Alex Dewar <alex.dewar90@gmail.com>
Subject: Re: [PATCH v2] PCI: keystone: Enable compile-testing on !ARM
Date: Thu, 19 Nov 2020 10:47:37 +0000
Message-Id: <160578283808.28676.5654476395812766238.b4-ty@arm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200906195128.279342-1-alex.dewar90@gmail.com>
References: <20200906194850.63glbnehjcuw356k@lenovo-laptop>
 <20200906195128.279342-1-alex.dewar90@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_054748_029593_342E5A73 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Dilip Kota <eswara.kota@linux.intel.com>, linux-pci@vger.kernel.org,
 Jonathan Chocron <jonnyc@amazon.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Vidya Sagar <vidyas@nvidia.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-riscv@lists.infradead.org,
 Thierry Reding <treding@nvidia.com>,
 Andrew Murray <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 6 Sep 2020 20:51:27 +0100, Alex Dewar wrote:
> Currently the Keystone driver can only be compile-tested on ARM, but
> this restriction seems unnecessary. Get rid of it to increase test
> coverage.
> 
> Build-tested with allyesconfig on x86, ppc, mips and riscv.

Applied to pci/keystone, thanks!

[1/1] PCI: keystone: Enable compile-testing on !ARM
      https://git.kernel.org/lpieralisi/pci/c/476b70b4d1

Thanks,
Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
