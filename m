Return-Path: <SRS0=oCzz=N4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCC7C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Sep 2021 10:03:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4C4C60E94
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Sep 2021 10:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4C4C60E94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Wi+AYIyvB2muYiV+Z5tvBaKNd8WC1VnwY6f7sTh2HA=; b=bRSu8tP8UI1OXOV9R6ikMac9lF
	/VP+dwIILjJYbO7JScsSRLMDO8C12DgnvVyjkGoHck0O6pNbGUdw9Tqd/TQdS7oOfFWsqcr2jQ4ca
	2xwWMz39oThfEeDm7R4KAru2cGWppYNnEHAtFFrbgj7HUCgy8nFC/1TTUkv7jxNwusiHBB4ChdiJa
	u14R/QZlP6ZAvfiw2j+Y15UzdZyrpUYJu8ZBGm52InfraPcGWAgwcSoE2rVeauP2Q2Zz4/bfoZiul
	mP4oFGFuGhr57aW+KPnB99iNGL39PyhJ9uHFfCFtutgTDS4P7EKX6eg9/yh4nUrtvHJ8hOH6dPtFf
	PvuEp/Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNBT0-000SbX-SM; Mon, 06 Sep 2021 10:03:06 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNBSx-000SZL-TN
 for linux-riscv@lists.infradead.org; Mon, 06 Sep 2021 10:03:05 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=[192.168.0.18])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1mNBSt-0003VN-AX; Mon, 06 Sep 2021 11:02:59 +0100
Subject: Re: [GIT PULL] RISC-V Patches for the 5.15 Merge Window, Part 1
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org
References: <mhng-e13c978a-0771-4577-9adc-3a4b807fbfc2@palmerdabbelt-glaptop>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <062d99a1-4984-64f6-eedb-cc96f5980103@codethink.co.uk>
Date: Mon, 6 Sep 2021 11:06:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <mhng-e13c978a-0771-4577-9adc-3a4b807fbfc2@palmerdabbelt-glaptop>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_030304_004686_3A192E50 
X-CRM114-Status: GOOD (  10.42  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 05/09/2021 01:15, Palmer Dabbelt wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>    Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.15-mw0
> 
> for you to fetch changes up to c24a19674258dcc968a198d8e0d4717c8f27700c:
> 
>    riscv: add support for hugepage migration (2021-08-26 22:01:22 -0700)
> 
> ----------------------------------------------------------------

Did my build flags for assembly in modules get missed?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
