Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0BFC636C8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 15:01:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9622610CC
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 15:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9622610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QhyJUj/xzQtyrcbLU331f5XGBUHwqLuOSJPsq39zcmI=; b=PQSqrWsnVKSkfMjOIjRvo4mm/p
	ztZsoTBoBcU/vgsfK5hJpGIUXHIQ+iED0zI2SBKpV65ghmwVIN9BsQ7h0+H8Gas/xyHIRB9SyOv/r
	3eJehotAANTZmJSO1m441dyBi4luQdfmgrnyKxJSlaMWNml8yn+3sPXm+uTJG35gnc/GVFc8YolEJ
	uX77qKWPAwpkAN1b52HJimO1rT1TKq8nOXC747UlYGPpdeoBZlJrl3fOdRRZEa3lG0JCGz33FtlMC
	iq0KnctQR4mVjhCSxgLHjWZLdzaO8MdRijS2oLcErUMHHdRG7kklxmck3GtiboLRdVA7mY0w12uqQ
	4SfTBSDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5rFA-00DK01-4O; Tue, 20 Jul 2021 15:01:12 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5rEY-00DJdl-3F
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 15:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1626793223;
 bh=7JdJAmzmrGsuzFEq70IzT5ECb4hmPKilGvqx9UcNLYo=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=bAhOVEhG7GKzvSNt5PDL8oJBFKJfDQd9g4CJn7FAFGSvFgMW+WtlVpVF4rYvDwsfo
 UlmqdMkTFygT/gO44r5Mg385cAc6fenQqxfKUgYBCxijX5meXFVk55dYSbIKq3tykC
 shOV9MKQrVex/8a0ElxMTnnWoMShPMySl16Czr9U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.189] ([88.152.144.157]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6llE-1m22132BbC-008Gby; Tue, 20
 Jul 2021 17:00:23 +0200
Subject: Re: [PATCH 1/1] RISC-V: load initrd wherever it fits into memory
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Ard Biesheuvel <ardb@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 linux-efi <linux-efi@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Andreas Schwab <schwab@linux-m68k.org>, Atish Patra <atishp@atishpatra.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
References: <20210629134018.62859-1-xypron.glpk@gmx.de>
 <877di3mfbe.fsf@igel.home>
 <CAOnJCUJhYZbAL9dMReJt0=y9V33Ed1DaBCXGCdwxH8iUU3bcRg@mail.gmail.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <42271be6-9586-d387-0419-22e2fcc0d8a3@gmx.de>
Date: Tue, 20 Jul 2021 17:00:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOnJCUJhYZbAL9dMReJt0=y9V33Ed1DaBCXGCdwxH8iUU3bcRg@mail.gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:PTG1MiKwTZILCTDhV5MyL3ndWlpPj7Z5tndcB4DWFM92M+/DX1/
 2c4zaVsku/vu5nmN3zCIFC+GnmtR6+aFPf/QQBznbJ0f5qtEJgv8YPnucRjzP9ZR6uvlwj7
 es4CgIN6LYh1MUIpFw++QRb/Z8lQ574PyHCyQ8oZaMLXyPcgLVmNAzV8VbwAb/cInySmTn3
 sfX0AhdmuDJ75894uh3nA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3tg4y7hCivo=:DCeEs/VENqXKNCQNfmAAJy
 nyGUjn2rcQ07VJlz7UA7n8iTKj1cmGWG6uHFA+KE+kikCFkE6N6udjhRs+wzmmbfDH90cBKvj
 +fdEdveFsmvij344/q08yDXS9UMcJXprSgrBwzFuhA38bZw0lt3/TY2GMiL+96ObxM+sVl7Ie
 /gT5QYSUSSuQOzkv3PDovRxBRPhCcFCiQarRA9I6w7z0++NVNBqaQxH5n98kOhi1i/F3DR/PD
 lCxLSIMJWZINJ0t6eKh2YaQ1Kc4QeBp7sz6bCxq3pDWmXqT7hzbjRTXF3bLFRqOf3dV94ePtK
 oaY8g1b3Y2pWI3sVixo8rY0unSflY/7T5/XUmTQrNpeF10QTDOfiPa35ypNESV8C2RYifu/dx
 pJIkSSAMtc7KaKPUXHwKyxmfyfE9G6Y5on/zui2zpIp/VuyV8ubgkp9GiUGFFw1c/EU4KWrUU
 U0uqOOdU6pWcT4sLeB95HMXu8iJTmLh91WPRyeXq9ou5bPNvMbkw9sXQHh2ggVahwJl6af7HF
 ufCiTZfoq0om42tJNClBbXUF0OCpEpnAPg0nbiesmxYZa5K2Wt2L6LPzC5wj4heiDYMv2NPUN
 dv2nkAqKAusXgwyHmmLoD3InntmIPJ1hXUU3O9WihHocXTsITC63h8GSBikf8sOimvuxOM4pJ
 R2bYnk1t4SrQREKX/ZBpCTlAO48yzGIZgNJUoK0FtiiO9LH910uz7ZRVm1gBuvxinKrgYz3NN
 NwVnucnHZ+9kec8u939KZfg0DFO4M1jg0v5sWGGh4EQPojsm9pMbfBDUYrJaAG96hkOKTYB84
 Mm4Jnf7NBi02YoKgNJnirCX0D8Upk7+BuATBs9WIXV6S7iKRMn/ONHaiYoeZw6r63AOSDlOAF
 RbijP1aFYlH2NdH4abgzhfrfLa7oFIz7tJLFWXZ4v0mwEJjBbxm9xaiHLruNFc2IsElE3AqpZ
 DYqeRlUCC+0w3GXIKmWpElcVzY0TBM2qjrhjJAWtBNkwNUfDd1hkXJBLa0AdU7M4H3wNTbYB3
 1gtVAMmF6+3CuZ0rA2RyWItro3SFKXa04HJqus5eDsvW129g+4IX5Y/9x/qSXKdERyfKefxvr
 ANRbJE2qEebdZ2UYd+ldBzzywCcNjR0gipc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_080034_511331_16E6F507 
X-CRM114-Status: GOOD (  14.01  )
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



On 7/9/21 7:14 PM, Atish Patra wrote:
> On Tue, Jul 6, 2021 at 12:07 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>>
>> On Jun 29 2021, Heinrich Schuchardt wrote:
>>
>>> Requiring that initrd is loaded below RAM start + 256 MiB led to failure
>>> to boot SUSE Linux with GRUB on QEMU, cf.
>>> https://lists.gnu.org/archive/html/grub-devel/2021-06/msg00037.html
>>>
>>> Remove the constraint.
>>>
>>> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
>>> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>>
>> With that patch the image in
>> http://download.opensuse.org/ports/riscv/tumbleweed/iso/ work again.
>>
>
> Thanks.
> @palmer: Can you take this one in this cycle ?

@Palmer, Paul, Albert
Ard suggested to move this patch through linux-riscv. Could you please
review the patch available at

https://lore.kernel.org/linux-riscv/20210629134018.62859-1-xypron.glpk@gmx.de/

The patch is necessary to boot on QEMU with GRUB with large initrd.

Best regards

Heinrich

>
>> Andreas.
>>
>> --
>> Andreas Schwab, schwab@linux-m68k.org
>> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
>> "And now for something completely different."
>
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
