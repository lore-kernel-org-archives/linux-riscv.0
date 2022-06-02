Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0351FC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 16:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Wmp/obW7WBS9dKeYiMQDxYBP6DvmojIijWGEyI1M7sg=; b=sEz4vkGiKkXuaf
	Qej44JTTEv4++fPhirecVKh+Nt6H2oN659BUQsTmsXVLxNatu2uiWzQhQNXlmVfERGq1UhmJPbsGt
	CFEoaT3qlOio2l4+RPfDIctODzDsBt2DnRDys+DGDuysrkNFsaub4RBNJsrjhoetvCB/fEPOcUmoY
	q4kGTZslJWgdlqw1T3DqWAwrqnMIzfjZQqpNssztOEQ7ng8bHb3aWbaNhZwhEkArL76huCXz/6bEM
	6Ggu5pn9r4egkHNLZNHNdTEgI03KQumSceWzHX+tPtCUlt6R+P7MSil0wpPjXYceOhUjio6ODh8EA
	cydRPR72da7+gH6RClYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwnjq-003mfY-SH; Thu, 02 Jun 2022 16:31:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwnjo-003mer-2o
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 16:31:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 875FE6158E;
	Thu,  2 Jun 2022 16:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19E4C385A5;
	Thu,  2 Jun 2022 16:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654187515;
	bh=o1/UE/2FwTyImP8FROwobph4vczO7LLicB4FbxHXr7A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=UIKsVABSlpXDB38aEPeRquKYp3dPPsOF/LCpsU11H05idiT3aYRnCWYsJ9R2kXDYQ
	 GIGb5zSnPtzMFEzZh67z/LoxnFkh2c6O3zp6OKHdQTo9lesDvCLaS4GsPalSO16ydv
	 7o02kQ8JYdNsVzJFx8/Rrh9akGcttUELkYanUqXV2e6jRfjeFQKTV112XBc8sB7055
	 ZeWBU8QVHDmS9mtJpQrD5yKc+qlyPHxfgYq6mjrVWLg5fSX4KOp/4QK6gcC9b6qt29
	 LhQ4quilGSjD4w8nh5IoOA9Djd79noUc9lNoUf1QypERewVzw0PBeix7p6rc6oYDmg
	 +mDBbvJKjsO8g==
Date: Thu, 2 Jun 2022 11:31:52 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Conor.Dooley@microchip.com
Cc: palmer@rivosinc.com, gregkh@linuxfoundation.org, arnd@arndb.de,
	akpm@linux-foundation.org, sboyd@kernel.org,
	linux-pci@vger.kernel.org, mturquette@baylibre.com,
	paul.walmsley@sifive.com, kw@linux.com, linux-clk@vger.kernel.org,
	aou@eecs.berkeley.edu, lorenzo.pieralisi@arm.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Daire.McNamara@microchip.com, Lewis.Hanly@microchip.com,
	Cyril.Jean@microchip.com, robh@kernel.org
Subject: Re: [PATCH v4 1/1] MAINTAINERS: add polarfire rng, pci and clock
 drivers
Message-ID: <20220602163152.GA22276@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fffa1761-9636-f6bc-fff3-54b6a60f5c8d@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_093156_199829_07253E78 
X-CRM114-Status: GOOD (  14.01  )
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

On Thu, Jun 02, 2022 at 04:39:08AM +0000, Conor.Dooley@microchip.com wrote:
> On 02/06/2022 02:55, Palmer Dabbelt wrote:

> > I'm adding a bunch of subsystem maintainers just to check again.  I
> > don't have any problem with it, just not really a RISC-V thing and don't
> > wan to make a mess.  I've stashed it over at palmer/pcsoc-maintainers
> > for now.
> > 
> > Sorry if I'm being overly pedantic about this one...
> 
> I don't mind. Maybe this should go via Andrew next cycle or w/e?
> There's obviously no hurry etc

My turn to be overly pedantic :)  IMHO there's no benefit in delaying
MAINTAINERS updates.  There's zero risk, and delaying only means
people will miss out on bug reports and other things they should learn
about.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
