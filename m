Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07AFC678D4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 07:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rodkt1ICiDLUf9/19x4BcxgPPcPZJF755jiJoY3rlSM=; b=VCnf7jaAirL2ddu6ykzqEkLtXw
	zP7aloW3LIIlaK2U2axMZNJYIMLzmw8Nitnq6hZ1w1F/zvFqrjR/TtiAp3xp6uUpoDfMtKWVDdAOD
	3laJHi/n+GvG9Fj8A/B0GZtLgIE5tsRBxtKJWqOZQXWj91OTA4kMcWmpLErB8YpgswXMzQwWgKdam
	Nq3oceJmcO+qq1yUWP7MJoFIs21kUlPkpU0kQkQs1O64dPFkD5lND0A8MwAPek/z0PIH423uVqUdO
	kogIlqQKv2rE6XtDEc3n46OOhAFcY47hBwtLnZ4BEHyuyFby7SwKoVEYbS3n65/d+QxFfUskymhRs
	Yd9A2UOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXdiS-001BaT-PN; Thu, 02 Mar 2023 07:51:04 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXdiO-001BYT-KI
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 07:51:03 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 1592C40009;
	Thu,  2 Mar 2023 07:50:56 +0000 (UTC)
Message-ID: <789371c4-47fd-3de5-d6c0-bb36b2864796@ghiti.fr>
Date: Thu, 2 Mar 2023 08:50:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: RISC-V Linux kernel not booting up with KASAN enabled
Content-Language: en-US
To: Chathura Rajapaksha <chathura.abeyrathne.lk@gmail.com>,
 linux-riscv@lists.infradead.org
References: <CAD7mqryyz0PGHotBxvME7Ff4V0zLS+OcL8=9z4TakaKagPBdLw@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAD7mqryyz0PGHotBxvME7Ff4V0zLS+OcL8=9z4TakaKagPBdLw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_235100_847550_B78FCCA3 
X-CRM114-Status: GOOD (  15.25  )
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

Hi Chatura,

On 3/2/23 04:13, Chathura Rajapaksha wrote:
> Hi All,
>
> I observed that RISC-V Linux hangs when I enable KASAN.
> Without KASAN it works fine with QEMU.
> I am using the commit ae3419fbac845b4d3f3a9fae4cc80c68d82cdf6e
>
> When KASAN is enabled, QEMU hangs after OpenSBI prints.
>
> I noticed a similar issue was reported before in
> https://lore.kernel.org/lkml/CACT4Y+ZmuOpyf_0vHTT4t3wkmJuW8Ezvcg7v6yDVd8YOViS=GA@mail.gmail.com/t/
> But I believe I have the patch mentioned in that thread.


I proposed a series that will be included in 6.3 regarding KASAN issues 
here: https://patchwork.kernel.org/project/linux-riscv/list/?series=718458

Can you give it a try and tell me if it works better?

Thanks,

Alex


>
> My kernel config:
> https://drive.google.com/file/d/1j9nU7f9MxCc_i-UHUCTvo7o6nDrcUz0w/view?usp=sharing
>
> Best regards,
> Chath
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
