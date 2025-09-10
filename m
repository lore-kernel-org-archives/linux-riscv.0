Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535DACA101F
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 14:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=iwmsaoMPMMxzLg0D/r0eWvHehIiCAXfaf9YPc/B9/z4=; b=sW0VCfpDuNDu8b
	3bnHoEoK9UIt/mE99ylW1nlHZKqM0hAfcnfncJjP6/azkmi0m+nNaENNbsgp55dVN3DkX6QlxY9oA
	oDp4qzU4BHQCfzSSNowOSNP8jNhLN7D1I22cvRUlXHpYGQV3NrzOVyPgXPasrHLu4j8l+Ehc+CHb4
	XFQNHLWGsVesUgOD5LTa0dRv8VauMvp7jyDs5QttqPeGA3ouRnnglVC+TJmoEQi8zbfpNFT+2oIEI
	jupNYbitbOQLOft7kShFuSxoKT3ixUxfrQQO2j/r4FlrclXzXdvxM4uKDasWCCmQJAzR1aAWMf+z6
	vXi999jcicZ8nDWc1txw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLuU-0000000EkeQ-3nb3;
	Wed, 10 Sep 2025 14:34:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLuS-0000000EkdH-03Jq
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 14:34:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4BF344B97;
	Wed, 10 Sep 2025 14:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC15C4CEEB;
	Wed, 10 Sep 2025 14:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757514895;
	bh=xjYSrTXZn2L7+z07HiLOzSt4wzGMOD/saMQb5WcdX3g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=mZTfNxdGDMJd16WavKni+yoqXTP+Gqz+lZsuuz8ArGJqWcu6LJwJRCqTuoIUbslaE
	 JnpLpbgvTq1pjFCqt0go3f9iie1Zra0iWRO/JZ7oPMJWklYQvadpBCMljKdoIPsF5c
	 j4s0+KMvmJlXyTpdssMKAkAr3mMGnu4RTTG8kAUragSTGUiB7jOyzuOHIjbIf2+3T4
	 ZKrWUFvMSZOAM6TjiMJMzdXFl/xMZ8XFHSTRSoWUuCIOY7Fklzhx3ztXMrHL3UFBcn
	 LGLe3ccIU7axC27rvLrRU3mgxEA4Td88GFTAgYWVGy/xI5Rki/AskwMkkhpwKGA2uj
	 MqUIlPR9qXMaQ==
Date: Wed, 10 Sep 2025 09:34:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: kwilczynski@kernel.org, u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, arnd@arndb.de,
	bwawrzyn@cisco.com, bhelgaas@google.com, unicorn_wang@outlook.com,
	conor+dt@kernel.org, 18255117159@163.com, inochiama@gmail.com,
	kishon@kernel.org, krzk+dt@kernel.org, lpieralisi@kernel.org,
	mani@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	robh@kernel.org, s-vadapalli@ti.com, tglx@linutronix.de,
	thomas.richard@bootlin.com, sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev, rabenda.cn@gmail.com, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
Subject: Re: [PATCH v2 3/7] PCI: sg2042: Add Sophgo SG2042 PCIe driver
Message-ID: <20250910143453.GA1533730@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <162d064228261ccd0bf9313a20288e510912effd.1757467895.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_073456_071392_13608DF0 
X-CRM114-Status: UNSURE (   8.29  )
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

On Wed, Sep 10, 2025 at 10:08:39AM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add support for PCIe controller in SG2042 SoC. The controller
> uses the Cadence PCIe core programmed by pcie-cadence*.c. The
> PCIe controller will work in host mode only, supporting data
> rate(gen4) and lanes(x16 or x8).

Strictly speaking, "gen4" is a spec revision, not a data rate.
Include the GT/s rate instead or in addition.  We can fix this when
merging if there's no other reason to repost (I assume you mean 16
GT/s).  Will also add spaces before the open "(".

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
