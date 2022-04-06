Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E379C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Apr 2022 00:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GuaMQrG7jz2tGCXYnyzU9lA6CZB3FrA7odoaGSQgWiw=; b=uecriyZSb/uth+
	2hypaxHwvznPSNIoa/RTtvZIfRd5veqLRjr4g6tzsT56hbKFch+8gr9N5wtje9OFxw+TaNFMA8rP4
	Kf5hUJMI4tJcdVo7SkQNVPqCgGO2Sg+W2EZ8TmeaIarmUUB7ggzEYSy82iBHdFTeYR3T1BAvJt9Fu
	Tuo1cCWKahjdg+N70sYVHNgTdXEA7WYAu9b0n3/U9m/dqzyIkpLHJMC/8hB0JfRZzSs2viA6qKDy8
	CAx9+kHxg9tKPSryJbONTFoY3LOMnQlHNEwB3JOPjUs+iyw514Xf/m24NcdS/RTaUW2UMNacx2IrF
	CwMTMjdU3eunCu3/2g1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbtHX-0035lj-6W; Wed, 06 Apr 2022 00:12:19 +0000
Received: from gateway23.websitewelcome.com ([192.185.48.84])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbtHT-0035k2-Uk
 for linux-riscv@lists.infradead.org; Wed, 06 Apr 2022 00:12:17 +0000
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway23.websitewelcome.com (Postfix) with ESMTP id 4390310732
 for <linux-riscv@lists.infradead.org>; Tue,  5 Apr 2022 19:12:14 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
 by cmsmtp with SMTP
 id btHSnhWbT9AGSbtHSnIOCW; Tue, 05 Apr 2022 19:12:14 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V34eNda++WlmGe+ZWCeqNhmRnpIlO8Tl6u7MFmXbztQ=; b=EbiyndnK4uoLFl5VhRQPS09z1S
 /yRo1ynqYNlThAxczGu1FqKJTEXcc6AlPe6vEEB8L3UVFwZAS9dtqH7Jnyvy/mwSfokN2SkZGR/WH
 A9JnbadYt3+rk4viOgIydnS0VTdSrBCt1CQFKo+FlZTvhcxjmneFzuATMeBe2BP4IpqDXacIFqK3W
 lzKjDTRgLJaD+jht1thLujSL4f3L5cH29a1ZqfO6TsXeNhqkAMo1tfbdhxVkjzJ5Bs4XamjDKoC4G
 QJzf5JMTZ9GE9dR2FWF4iun9VTKFbPPCAGFbHWTKAHHkNrt0BqRy2St1XGwRQlzmHx6Xr01d9Jpev
 Ot3jyP4A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:54732)
 by bh-25.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@roeck-us.net>)
 id 1nbtHR-000mos-4N; Wed, 06 Apr 2022 00:12:13 +0000
Message-ID: <53e24114-fe48-91aa-1b76-78b12dfcdf4e@roeck-us.net>
Date: Tue, 5 Apr 2022 17:12:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 "moderated list:H8/300 ARCHITECTURE"
 <uclinux-h8-devel@lists.sourceforge.jp>,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <20220405212653.GA2482665@roeck-us.net>
 <CAK8P3a396EkfQtmkwo80eB9i7F37S=mvrHtCLXhGDhHBczYK3g@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC PULL] remove arch/h8300
In-Reply-To: <CAK8P3a396EkfQtmkwo80eB9i7F37S=mvrHtCLXhGDhHBczYK3g@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nbtHR-000mos-4N
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 [108.223.40.66]:54732
X-Source-Auth: linux@roeck-us.net
X-Email-Count: 1
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_171216_140396_5D43FFF2 
X-CRM114-Status: GOOD (  11.07  )
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

On 4/5/22 15:01, Arnd Bergmann wrote:
> On Tue, Apr 5, 2022 at 11:26 PM Guenter Roeck <linux@roeck-us.net> wrote:
>> On Mon, Apr 04, 2022 at 03:07:06PM +0200, Arnd Bergmann wrote:
>>>
>>> Should we garbage-collect some of the other nommu platforms where
>>> we're here? Some of them are just as stale:
>>>
>>> 1. xtensa nommu has does not compile in mainline and as far as I can
>>> tell never did
>>>     (there was https://github.com/jcmvbkbc/linux-xtensa/tree/xtensa-5.6-esp32,
>>> which
>>>     worked at some point, but I don't think there was enough interest
>>> to get in merged)
>>
>> Hmm, I build and test nommu_kc705_defconfig in my test system.
> 
> What toolchain do you use for this? Max already pointed out my mistake
> regarding xtensa, which I thought does not build at all, but just needs
> a toolchain specific to the cpu.
> 

Home-built using buildroot. I have three different xtensa toolchains
(de212, dc232b, and dc233c). The toolchain for kc705_nommu needs the
de212 overlay; I think Max pointed to to the information needed
to build the compiler. Buildroot has the "XTENSA_OVERLAY_FILE"
option to specify the compiler overlay file for the target.

Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
