Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675F5C742A7
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 09:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESdcOpwIYKgmwj7h8jzhH+EgJalb3vzPBj2htFzBmRU=; b=LbeD3egLMV+8YG
	+XI9DIU0NeOQGjYqVFQtxWdi/hiHI7fPqjgKkqs2tePykQnSf/vMCRWtXuy1Jv+uggSfip2cqhacs
	mg0h2+j3H2U3xEJALsc43GFBYb6SUxXCC99xWzfhE4h6xLNmG33kA5F/dn9CFEJjPtwrB/enyO4qN
	XBzK+BPm9yLCD2kKW63oQrghskUJHXgxar6hgQe6bvlc7HDieQ9TEeHJZe2eYZZpjKCmRQJ86Jx0E
	TSWjdtp2IS12WqFXfo5NIh/+hu3jN0H08mLUN4UMGw2e3hF8Fp313JAHvfc/yBHc3AGj833IYEXkD
	uAUrdbGfCae06o9nBDwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZpoS-0047NN-DS; Wed, 08 Mar 2023 09:10:20 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZpoP-0047KA-Gw
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 09:10:19 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 1348C1C0002;
	Wed,  8 Mar 2023 09:10:08 +0000 (UTC)
Message-ID: <45046a6b-78cd-c2a0-6463-0bc40594164c@ghiti.fr>
Date: Wed, 8 Mar 2023 10:10:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: RISC-V Linux kernel not booting up with KASAN enabled
Content-Language: en-US
To: Chathura Rajapaksha <chathura.abeyrathne.lk@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>
Cc: linux-riscv@lists.infradead.org, kasan-dev@googlegroups.com
References: <CAD7mqryyz0PGHotBxvME7Ff4V0zLS+OcL8=9z4TakaKagPBdLw@mail.gmail.com>
 <789371c4-47fd-3de5-d6c0-bb36b2864796@ghiti.fr>
 <CAD7mqrzv-jr_o2U3Kz7vTgcsOYPKgwHW-L=ARAucAPPJgs4HCw@mail.gmail.com>
 <CAD7mqryDQCYyJ1gAmtMm8SASMWAQ4i103ptTb0f6Oda=tPY2=A@mail.gmail.com>
 <067b7dda-8d3d-a26c-a0b1-bd6472a4b04d@ghiti.fr>
 <CACT4Y+avaVT4sBOioxm8N+iH26udKwAogRhjMwGWcp4zzC8JdA@mail.gmail.com>
 <CAD7mqrxY_BLP3fS0BnZNaGK+4j2cFjPYyWKehh7oe1f95Ca7iA@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAD7mqrxY_BLP3fS0BnZNaGK+4j2cFjPYyWKehh7oe1f95Ca7iA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_011017_725604_EC6AFAD8 
X-CRM114-Status: GOOD (  11.13  )
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


On 3/7/23 03:57, Chathura Rajapaksha wrote:
> Thanks, Dmitry and Alex. Let me know if you need anything else from me.
> Please let me know if you have a fix for this bug, I will be happy to verify.
>
> Best regards,
> Chath
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


I'm about to propose a patch for this issue, if you can test it, that 
would be nice,

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
