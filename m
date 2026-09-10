Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059A3C79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 12:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9vQy6HMW35Mvi9tdWT3GKbPD79zppU/uDMlnXyQt3E=; b=1cdOfcgzes2BAb
	hzEQfQ1fWnnUt0rhsmf87aSmKuyHnm7xM2VoeNh7RvgvhS6bZdlpf9dylhwMUAfxo1s8JXDOC8hg1
	EnkDCA2nSJYhl2OkxvxX9K3BlEPR3XyYj4SlohcwNLIjVoN05+l26xpcHeOVsyqLL4Tbdr2zqbJTm
	Z76DkJVDP7nR3N/fKs7mdu30hAEusRZeouwSyPPNRMnl4O015hBDLNW3t1kgPUjjrNSs7LSVkF7YB
	+z4EANvVB48wowdNgnFjAyflEiyobnslZDAhd766fuo3lE1X60Mx74snMU527qXE7qeFkiTqkflTA
	IJHH8NXEmg712qIy3EJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dok-0000000EKS3-0e9l;
	Thu, 10 Sep 2026 12:23:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4doi-0000000EKRo-2qra
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 12:23:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0FA26600C8;
	Thu, 10 Sep 2026 12:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E413E1F000FF;
	Thu, 10 Sep 2026 12:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789043027;
	bh=m1VhSVCtMgiBJf29Yc8esGBmlET73PXMwLnKd186wJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ktuQmeDThejQ3JxmUDBQrDaFgL6jaZfxdugefXOh8UQciZGravx0r+/2Ra517iLbp
	 VUCQ9jP7nzKTLYg574KrbCFJBy5wkf52oUeDIlKUiWxkVd0lvdCVGB1cOr7194KL7j
	 9qKJG0ijmM16ldzGs2lSoIaqmkBc8k5btkgoclv9uaXlthtglNCRo335sANvj7rvIP
	 VdsXADVnS/PXZLBV5ntpyixYZVOOalQShcWgoE3KzbQh4R9jHDjp21bOVdITOzcVkg
	 vIYC0Pbvf8fIzlY/7+Vkc/AkjstGTVuZPxq9X742HDCodJ97QWJDfetyLp7COC5O4s
	 UqBJgal6/ewfg==
Date: Thu, 10 Sep 2026 12:23:44 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: gsh517025@gmail.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
	conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	pjw@kernel.org, robh@kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable onboard eeprom for
 OrangePi
Message-ID: <20260910122344-GKB20735@kernel.org>
References: <4e8e6f90-9731-4416-8b1a-be1cef12bb72@gmail.com>
 <20260907063010.1882362-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260907063010.1882362-1-amadeus@jmu.edu.cn>
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

Hi Chukun,

On 14:30 Mon 07 Sep     , Chukun Pan wrote:
> Hi,
> 
> > -         mac-address {
> > +         mac_address: mac-address {
> 
> This requires removing the aliases for Ethernet.
> 
> > But I am not sure whether this wiring should be part of this patch.
> > Without such wiring, the kernel falls back to random MAC addresses
> > on this board.
> 
> Currently, U-Boot patches the MAC address using the Ethernet alias
> from the Device Tree. The vendor U-Boot reads the MAC address from
> the eeprom. I think the mainline U-Boot will add this feature, so
> we don't need to add this one?
> 
I think it would take long time for us to get there - to have a mainline
U-Boot which support parsing MAC address from eeprom. So, I have no
objection to the idea of adding mac info into the dts.. 

Just let me know if you guys want to do in another separate patch, so I could
take this patch first, or want to squash together and send an incremental
 version? P.S checked k1-bananapi-cm6 board which already done as suggested..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
