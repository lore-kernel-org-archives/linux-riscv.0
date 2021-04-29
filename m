Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC33C43461
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 12:14:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC56761457
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 12:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC56761457
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dmvMR8eSd+N8hdBhv536aoaL/xgAvb70Lu0PhVyD9Qs=; b=A7fF9ckjYGn7LDM/6WBW24cHM
	mhXRxnQaCu94B++GUoDp/6d3hPm5keJPlJid1AO5r1EtSqq/lEmXfqAbdTXm+YT039b6eeZoIdbtY
	M8T903DFL6g09XisPTswdavLQ2jIEDbGExazHuUIWDntKdZjFgcT0gDYtEaZN9fjuDNxolDvnffri
	LC45WsiWhUwxeLWfXfaPBufXOU6h1RBhmZIUG5vAfUUiLI+WARjPBg6rlqGplevAXyIlbwUwfizXp
	+3tzF3E+AiSH8tD+OMQCnGWFBfqHwcXq4OXPWe+69aGy37I4Em+ocfjmU9C8CMFKtdzR2pcWUtveV
	iP7t+7TsA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc5YA-005bSY-BD; Thu, 29 Apr 2021 12:13:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc5Y6-005bSF-G6
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 12:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=3DyHQiZW6yWs3Iu0ELNQ2Mt8b8aNCM30kQlbO6d5Ei4=; b=YAOa/B8+bxGPqQFuNnxjmuf+29
 nsQSXKP+vY4xI4rnERwkmU4K+7i/U5bZOa4o+xkRVjRl9DxbgAl3jvI4VusWxSIsUh96kNoS92vmc
 7Kt5GJlcN7SbCeFqAatDQLvkw90oScWuyVa0vjAg0i6uXH6+Y7I3A1ca/CFYKdDOr9qokftVor5pD
 G7k7+rTtXKDiG33VRVzaooFTPz+DJIp+6zHS0QdRCTAiIbD/RAyHUa4S3Trk1S8gzxqVYWKqpGGnn
 xRuH5+fe5aSiTM1nYl5iwO9+vPHUz+bAss1IZqAMmTGSppOVdJIRrMctb8KLV0ecJImgzpeSNd7D5
 GzdDtr0g==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc5Y3-000c4q-Bt
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 12:13:41 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.100] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5142860008;
 Thu, 29 Apr 2021 12:13:31 +0000 (UTC)
Subject: Re: [PATCH] riscv: Disallow to build XIP_KERNEL with SOC_SIFIVE
To: Vitaly Wool <vitaly.wool@konsulko.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20210429084541.28083-1-alex@ghiti.fr>
 <CAM4kBBK=yQ=jXYw85Ti7Y3EyGd11aOYt7QnD4+fFFkDhvrwcxA@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <1a4a0a88-6ff5-66ad-6819-53dd96f76849@ghiti.fr>
Date: Thu, 29 Apr 2021 08:13:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAM4kBBK=yQ=jXYw85Ti7Y3EyGd11aOYt7QnD4+fFFkDhvrwcxA@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_051339_562379_C0322D01 
X-CRM114-Status: GOOD (  25.70  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le 4/29/21 =E0 5:11 AM, Vitaly Wool a =E9crit=A0:
> On Thu, Apr 29, 2021 at 10:47 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>>
>> RISCV_ERRATA_ALTERNATIVE patches text at runtime which is not possible w=
hen
>> the kernel is executed from the flash in XIP mode, and as the SIFIVE
>> errata must be fixed somehow, disallow to build a XIP kernel that
>> supports SIFIVE socs.
> =

> Could you please hold off this patch for a bit? I will try to come up
> with an alternative solution. It should be possible to define a
> special section within the RW area and place the functions that need
> such patching there.
> Not that I like that much but at least we'll keep the ability to use
> XIP on SiFive.

Ok, I'm wondering why I did not think of that...I'll give it a try just =

to punish myself.

Thanks Vitaly,

Alex

> =

> Best regards,
>     Vitaly
> =

>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>> ---
>>   arch/riscv/Kconfig.erratas | 2 +-
>>   arch/riscv/Kconfig.socs    | 1 +
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
>> index d5d03ae8d685..9537dbd67357 100644
>> --- a/arch/riscv/Kconfig.erratas
>> +++ b/arch/riscv/Kconfig.erratas
>> @@ -2,7 +2,7 @@ menu "CPU errata selection"
>>
>>   config RISCV_ERRATA_ALTERNATIVE
>>          bool "RISC-V alternative scheme"
>> -       default y
>> +       default y if !XIP_KERNEL
>>          help
>>            This Kconfig allows the kernel to automatically patch the
>>            errata required by the execution platform at run time. The
>> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
>> index 00c2b205654c..9cb38bc9d7cd 100644
>> --- a/arch/riscv/Kconfig.socs
>> +++ b/arch/riscv/Kconfig.socs
>> @@ -9,6 +9,7 @@ config SOC_MICROCHIP_POLARFIRE
>>
>>   config SOC_SIFIVE
>>          bool "SiFive SoCs"
>> +       depends on !XIP_KERNEL
>>          select SERIAL_SIFIVE if TTY
>>          select SERIAL_SIFIVE_CONSOLE if TTY
>>          select CLK_SIFIVE
>> --
>> 2.20.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
