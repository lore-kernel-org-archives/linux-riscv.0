Return-Path: <SRS0=OPVU=Y7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFC7C5DF60
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2019 11:07:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F2F72087E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2019 11:07:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cBMLcqit";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="h9nIY/55"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F2F72087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NPZhNY3WzCP5x9z+Ei390UamCKOczL7puwh1BO6cbk=; b=cBMLcqitZ6LhlX
	WQuYNoiq1JqeCclp4/AerE3AsEyccGoodpprsUP7NqUfeUpFp6qK0vu9LUVISXfawLbB5TskQ6P5L
	20FwFLg1GmvT5nlmEGakdB/U9juogpV5LxZl1Q83udOL2e36zGqFQw/BzZy69EwywbiyyajRcZBfr
	OF+1UzpkK4fynItHcgJEXH0Yd4FasfyJCWn0+Vf66xcG+ZVxYlB5bRjRKCXIdeHri6W46QruLuS85
	m219jzfR7zatMTrvZedpytDclXFm+ygny9vsDncRu0RBpTDef5rMAxZ51KDuyQjTKCFzoJujagDTW
	UNjKqrnHTFJQ3lZWSosA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSfdP-0005lz-JW; Thu, 07 Nov 2019 11:07:27 +0000
Received: from mail.skyhub.de ([5.9.137.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSfdM-0005lI-Jb
 for linux-riscv@lists.infradead.org; Thu, 07 Nov 2019 11:07:26 +0000
Received: from zn.tnic (p200300EC2F0EAD00D550E8D60855E7CD.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0e:ad00:d550:e8d6:855:e7cd])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0C8691EC0CA8;
 Thu,  7 Nov 2019 12:07:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1573124834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=ZMLD3a5M0MxniTpn02MzZp+4bP849vKFA4oIJpLz5+c=;
 b=h9nIY/55AsZe9BPwxfFxGH6gvG/Si/eLOqk+r8d5N/C6Nbo7MG3I+DkjY/R7m6OPSWtG+w
 QVT4mn8BLBojaFGdQLnwsTDh1TyPpB4Uwcw4jkSHc38ci0b/1wz9YjLchHXOBQWcZc0lYs
 QkQvReP5eJPOAKWoDkpJaFOxruWcvyY=
Date: Thu, 7 Nov 2019 12:07:08 +0100
From: Borislav Petkov <bp@alien8.de>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2] riscv: move sifive_l2_cache.c to drivers/soc
Message-ID: <20191107110707.GE19501@zn.tnic>
References: <20191107092039.32240-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191107092039.32240-1-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_030724_796286_86F4D8B1 
X-CRM114-Status: GOOD (  14.44  )
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
Cc: tony.luck@intel.com, yash.shah@sifive.com, rrichter@marvell.com,
 james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, mchehab@kernel.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 07, 2019 at 10:20:39AM +0100, Christoph Hellwig wrote:
> The sifive_l2_cache.c is in no way related to RISC-V architecture
> memory management.  It is a little stub driver working around the fact
> that the EDAC maintainers prefer their drivers to be structured in a
> certain way that doesn't fit the SiFive SOCs.
> 
> Move the file to drivers/soc and add a Kconfig option for it, as well
> as the whole drivers/soc boilerplate for CONFIG_SOC_SIFIVE.
> 
> Fixes: a967a289f169 ("RISC-V: sifive_l2_cache: Add L2 cache controller driver for SiFive SoCs")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
> 
> Changes since v2:
>  - don't allow modular builds
>  - remove the empty last line in the new Makefile
> 
>  MAINTAINERS                                            |  1 +
>  arch/riscv/mm/Makefile                                 |  1 -
>  drivers/edac/Kconfig                                   |  2 +-
>  drivers/soc/Kconfig                                    |  1 +
>  drivers/soc/Makefile                                   |  1 +
>  drivers/soc/sifive/Kconfig                             | 10 ++++++++++
>  drivers/soc/sifive/Makefile                            |  3 +++
>  .../riscv/mm => drivers/soc/sifive}/sifive_l2_cache.c  |  0
>  8 files changed, 17 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/soc/sifive/Kconfig
>  create mode 100644 drivers/soc/sifive/Makefile
>  rename {arch/riscv/mm => drivers/soc/sifive}/sifive_l2_cache.c (100%)

Reviewed-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
