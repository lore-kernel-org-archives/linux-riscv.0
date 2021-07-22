Return-Path: <SRS0=ruHO=MO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7291DC63793
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 09:02:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B698760FEA
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 09:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B698760FEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G9fkBoyJ+qNa8OHSyA0JB2ycCg5hy0vnaOJGHFCPQUk=; b=rsZqixQgKOK+0d
	t4NddkywcRlBVE7z4VQYZrknvC5utWQ57zCz8VOycFPL21GTympNdNZf640ZAruf+HlMWpL7HU8IH
	OwP960px/g59Khn6jn3o0jKQw3ev2Ae4Zn5KXzuwc2sUnDToDwAscjS/4ucF88AUzAD9K2kJPnKRU
	HD/k+N/P/n2RHstb0vlPVZURkASCRtkP2ZyuPwVKfXPkWyoE9UbOew6qT34G4zA0z61/ZpKs1nQch
	A0ArqVE2wrzpp4eQvbYHY8jGYVw30r4aiJogsn+DzlpnB2WmonUGQHBfJM0xP5xr1w9XQf4zriNI/
	jMedtJjCUrmhENrlccqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Ub7-000n4l-Ey; Thu, 22 Jul 2021 09:02:29 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Ub3-000n3P-8x
 for linux-riscv@lists.infradead.org; Thu, 22 Jul 2021 09:02:27 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4GVmfr5TrWz1sGKb;
 Thu, 22 Jul 2021 11:02:12 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4GVmfr45ZJz1qqkg;
 Thu, 22 Jul 2021 11:02:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id B3xsr2CvvLrS; Thu, 22 Jul 2021 11:02:11 +0200 (CEST)
X-Auth-Info: 5K2eEbDaqyAfIeaYUxnfMTLK7qDLkZsfKwuZYZ+up/2N3WzIN6C1Edq5vLWLBZlv
Received: from igel.home (ppp-46-244-188-81.dynamic.mnet-online.de
 [46.244.188.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 22 Jul 2021 11:02:11 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id D0B2C2C2647; Thu, 22 Jul 2021 11:02:10 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: tongtiangen@huawei.com,  jszhang3@mail.ustc.edu.cn,  Paul Walmsley
 <paul.walmsley@sifive.com>,  aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next v2] riscv: add VMAP_STACK overflow detection
References: <mhng-e14c3232-cc4d-4146-8c93-c60ec81ed272@palmerdabbelt-glaptop>
X-Yow: Yow!!  "Janitor trapped in sewer uses ESP to find decayed burger"!!
Date: Thu, 22 Jul 2021 11:02:10 +0200
In-Reply-To: <mhng-e14c3232-cc4d-4146-8c93-c60ec81ed272@palmerdabbelt-glaptop>
 (Palmer Dabbelt's message of "Wed, 21 Jul 2021 23:12:20 -0700 (PDT)")
Message-ID: <87k0lizppp.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_020225_506053_6440AF9E 
X-CRM114-Status: GOOD (  17.34  )
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

On Jul 21 2021, Palmer Dabbelt wrote:

> On Mon, 19 Jul 2021 00:23:06 PDT (-0700), schwab@linux-m68k.org wrote:
>> On Jul 19 2021, tongtiangen wrote:
>>
>>> On 2021/7/17 14:55, Andreas Schwab wrote:
>>>> Please use
>>>> https://download.opensuse.org/repositories/home:/Andreas_Schwab:/riscv:/jeos/images/openSUSE-Tumbleweed-RISC-V-JeOS-efi.riscv64.raw.xz
>>>> and run it in qemu with u-boot as kernel.
>>>>
>>>> Andreas.
>>>>
>>>
>>> Hi andreas:
>>> I used today's latest mainline code and .config provided by you, and I
>>> can't reproduce this panic.
>>
>> Did you test it like I said above?
>>
>> Andreas.
>
> I'm getting this on and off, with just 
> CONFIG_VMAP_STACK=y
>
> on top of defconfig, when running on QEMU.  It's not showing up right now:
> I'd thought it was an issue with that initrd patch, but it went away when
> I re-ran the tests so I'm guessing it's something non-deterministic.  I'll
> try to take a look if it comes back.

The crash happens reliably with the image above.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
