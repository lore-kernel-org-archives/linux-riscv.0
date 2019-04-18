Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EA0C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 12:50:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2E762183F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 12:50:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pvQB322p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="kBrtG7Dr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2E762183F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1pZKZVMP4b7he5uaztjalzh4qZoFko9krF8LP8F9L5I=; b=pvQB322pR0yQM+
	Xy3Cmbog6E77sGW+9TOzZ2zYrMPbACHnUB5MVg7Bnyf+sGgRHD7eV6kMAgXGmvlEDizWlVfyHjppa
	jYHE7pS0sPPe8whXi0s+bYbKSpvEXim8rGkFj158JwrN9+3X0PMPphTWtzV4XOMpvsiKC2T6K3NM4
	neBev3avE7gNkprp/zIVMugE+4g55oOS/jOPNp1aDK9Ricr5LuUr4UrpxiSFyMpkXcKBIIo5a4NGZ
	5gzLpBtwK9SqGZAGbLCMu8CQm2qxF8Oncs21t6UDZyF5Cp9ndpqdtNUR2fyVT2qe7BSdCfZR5kru6
	ySgOHwVbRthksXh6ylkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH6Ug-00067g-K9; Thu, 18 Apr 2019 12:50:22 +0000
Received: from mail.skyhub.de ([2a01:4f8:190:11c2::b:1457])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH6Uc-00060z-Tu
 for linux-riscv@lists.infradead.org; Thu, 18 Apr 2019 12:50:21 +0000
Received: from zn.tnic (p200300EC2F112E003868EF36058F9C84.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f11:2e00:3868:ef36:58f:9c84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E21341EC0380;
 Thu, 18 Apr 2019 14:50:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1555591817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=HNUlulpvxLgueM5KwBkwZM9kUDW+7A8qOVVjx5GX6Uc=;
 b=kBrtG7DrmDlg8mxIQUX5owKGGclTe/MBIAH9iD2NUhLnfRQd3qUywuC2WSVxNxdiSswvBJ
 wiOxluTdbEuF3tWsjegvWHRIV1vL3uwrPM2YU/U/uJ7TipAiuABJ2L8cSPdjA5YOSfhhaI
 DNJOA+eOM7DIpkSEnXwMo7qCr+VX3N4=
Date: Thu, 18 Apr 2019 14:50:15 +0200
From: Borislav Petkov <bp@alien8.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 3/3] edac: sifive: Add EDAC platform driver for SiFive SoCs
Message-ID: <20190418125015.GI27160@zn.tnic>
References: <1555328443-30874-1-git-send-email-yash.shah@sifive.com>
 <1555328443-30874-4-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1555328443-30874-4-git-send-email-yash.shah@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_055019_706784_A40E5B4F 
X-CRM114-Status: GOOD (  11.60  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 palmer@sifive.com, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 robh+dt@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, mchehab@kernel.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Apr 15, 2019 at 05:10:43PM +0530, Yash Shah wrote:
> This initial ver of EDAC driver supports:
> - ECC event monitoring and reporting through the EDAC framework for SiFive
>   L2 cache controller.
> 
> This driver registers for notifier events from the L2 cache controller
> driver (arch/riscv/mm/sifive_l2_cache.c) for L2 ECC events
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  arch/riscv/Kconfig         |   1 +
>  drivers/edac/Kconfig       |   6 +++
>  drivers/edac/Makefile      |   1 +
>  drivers/edac/sifive_edac.c | 121 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 129 insertions(+)
>  create mode 100644 drivers/edac/sifive_edac.c

Please add a MAINTAINERS entry like the other EDAC drivers do so that
you can get CCed on patches/bug reports.

The rest looks ok to me.

I'd still like for James to have a look too, when he gets to it.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
