Return-Path: <SRS0=uA0y=O3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3550C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Oct 2021 08:10:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADB17610CC
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Oct 2021 08:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADB17610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b51BgrZuodqb/9fqZRH4tfsXxQf7glslt4c16L616rM=; b=eTnEhbN8LEdJne
	Z12hzv+NVvnEZknSiQtbi5KU8pr841vJsHANZOuns9DQHvajRNHuDlBg9tGTMMZB6Fy/rT0tPvYGx
	vsfP+roadVLhAeNyqW0Ru3zPuiUW7YZiQAP/aoJlSrYumkdQ5r0P4RLR7IbGP3rVv/eyrA82w9Pf5
	dbmtpyDRHM0w/rWGuR1LlYso2o1bDmwc5++KrICIjyhtmoAsCoi3yFaR9Dv2bZIAjZBdaIwiceLTT
	Dbmdr/nSC26Oqtp6h/t+20lmJzIqIsTW+ZDbbxfmVINgKzrEGsKmCJr8lvU+E62JQ0ro32uQQBcxE
	Wt5JGy+SWCIdafxxB+lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYOTM-00GWIn-4N; Thu, 07 Oct 2021 08:09:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYORk-00GVZk-S4; Thu, 07 Oct 2021 08:08:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A63A161354;
 Thu,  7 Oct 2021 08:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633594088;
 bh=dm9/vpPW4I/oLlWZ3sN+YDm0nseIyiNdiq2BmTSzlNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G8wrvs97fHfdiL5l1GNqfBsj5WSvMC2CgUNRkAD9lWilsADRiRDh393GWk3HUn3Ts
 vM8d9uccvuv8G5TMLMWf1winBoFuEDY3PrhNdg3gcjr+GBL7pd3oBmM1mAkTUFkoSI
 w8Z+IjERciMgdML4PF+krqxXeBNo08oiouFvkZn2vMvUYgTzZTKdT5c69xX8qW1K+h
 b2l74TEajI8beXDoYksoK4Cx+j/QDC47jIPwSUGr87wY62bC9610e0qQsUW+K3OPGm
 u1cEgxGh9gh5goTfjXOtts91pNmMR0FxKVGHPwbVS74rMsnljpa216ovjPWLt40afS
 ETw3OdvPPVNwg==
Date: Thu, 7 Oct 2021 09:07:59 +0100
From: Will Deacon <will@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, x86@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 04/12] arm64: Use of_get_cpu_hwid()
Message-ID: <20211007080758.GA31467@willie-the-truck>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-5-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211006164332.1981454-5-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_010808_971232_EF8CFBE8 
X-CRM114-Status: GOOD (  13.94  )
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

On Wed, Oct 06, 2021 at 11:43:24AM -0500, Rob Herring wrote:
> Replace the open coded parsing of CPU nodes' 'reg' property with
> of_get_cpu_hwid().
> 
> This change drops an error message for missing 'reg' property, but that
> should not be necessary as the DT tools will ensure 'reg' is present.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/arm64/kernel/smp.c | 31 ++-----------------------------
>  1 file changed, 2 insertions(+), 29 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

It's a shame INVALID_HWID can't be removed too, but looks like it's still
used in a couple of places.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
