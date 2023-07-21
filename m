Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F58DEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 02:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVa/6SJMDzoI0sjISXp+OXdj/A8AimPmwy+XvWV1o9E=; b=MM8RXh+cM8MB13
	Ol64S4XPwzgLspOZCniyXfcMCUIX2/VudjQcqn+Z5cretmJv+X8fXLQqz4+ovekL6Tdworo4UxMAy
	LX22uCtzcTGDmq0Vg8Je63e4/O8KQ97OWksYQW7X3IdrdiqwtmLgPWhsAd7vPqEthAT7vklT65RG6
	1h3eGPc7EyyBx8eFiMYnYq8rFp7gMKg1Ri9zCWa95kXmXBIM3Af2I3kSw9pvtQ4Q21d/27Bm7Agbl
	2EP9QzJlDY84u+1FNDVPJMD1X3kpGvo5bMasoxr9Pn1BWJI4F2hK7zGgX2XhZu6F7NoGVKkD/xYdT
	5rDKrlv9F5/xnQJrpfTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMfS7-00Caki-11;
	Fri, 21 Jul 2023 02:01:07 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMfS0-00CafZ-14
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 02:01:02 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 71D0824E2C2;
	Fri, 21 Jul 2023 10:00:29 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 10:00:29 +0800
Received: from [192.168.125.113] (113.72.147.86) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 10:00:28 +0800
Message-ID: <757fa8f2-4bab-07b3-13fd-aa983907bd77@starfivetech.com>
Date: Fri, 21 Jul 2023 10:00:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Jh7110 DTS Patches
To: Conor Dooley <conor@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <kernel@esmil.dk>
References: <20230720-product-cheese-9f0fe22cc485@spud>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230720-product-cheese-9f0fe22cc485@spud>
X-Originating-IP: [113.72.147.86]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_190100_512129_69641EA0 
X-CRM114-Status: GOOD (  11.94  )
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


On 2023/7/21 1:51, Conor Dooley wrote:
> Hey Walker,
> 
> I have picked up the patches that I can from the mailing list & they
> should appear in tomorrow's iteration of linux-next. Could you get your
> co-workers to resend whatever patches that depended on the syscons, PLLs
> or STG etc clocks?
> 
> Some were still on patchwork, eg the TDM audio, that I could not apply &
> will need to be rebased. In particular, it'd be nice to get the eMMC
> patches resent, as what I could find on patchwork was quite old.
> 
> You can see what I have applied here:
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=riscv-dt-for-next
> 
> Thanks,
> Conor.

Hi Conor,

I have notified my co-workers that are responsible for these modules to resend dts patch ASAP.
These patches are submitted together, there may be conflicts.
Could you please help solve it then ? 
Thanks!

Walker


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
