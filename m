Return-Path: <SRS0=TiPD=6R=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACE1C28CBC
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  3 May 2020 20:21:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAAED20721
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  3 May 2020 20:21:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q3H9CLs0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAAED20721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nsh6EKpQINmia27MrpH8VhYxId2n8tGLLWeCO/ILe2A=; b=Q3H9CLs0m/AYPWL/vd9dltFVA
	5cCoXF+Zyd0kZqgSPO3uNArJ4/RIVDNSNp0xiPech9443rTQS9ecaV6gHkQJjJJAhbkqs+9oE8w6Y
	u/r01NsaLa64BKoy6iDuYfjtkaI2nTOaldyCcVjqoSJh60iDqXYSVM7qHXXi9USssCIb7tlX2JeMb
	GTfi2IVVt4p9hO6M/74iEPzZledFm/xTceq/eJ2MS1Oka8/jI3yp7/ovn8mx7bDfphIcmeMnzmpl3
	zivrEw16my2WFV91sLp9FU0TgRS7Dj5BrMlOm1+iPLjS9aCX/W8Hn4M4cdXGTnuxgEs8/DVoI9u2x
	JJAHrBgBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVL6n-00084j-5L; Sun, 03 May 2020 20:21:05 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVL6k-00083g-1x
 for linux-riscv@lists.infradead.org; Sun, 03 May 2020 20:21:03 +0000
Received: from mail-qv1-f53.google.com ([209.85.219.53]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mbj7g-1isQml026I-00dEgY for <linux-riscv@lists.infradead.org>; Sun, 03
 May 2020 22:20:57 +0200
Received: by mail-qv1-f53.google.com with SMTP id y19so7403896qvv.4
 for <linux-riscv@lists.infradead.org>; Sun, 03 May 2020 13:20:56 -0700 (PDT)
X-Gm-Message-State: AGi0Pub+S+UuvGsrbvOUm68vbSP/JEFwO+VZ5oi4/YqoUMQ7H5A9Mrhj
 W5Yff/2m9xF5SnYUR6i+F9ffpDQK71DdDYkLVGo=
X-Google-Smtp-Source: APiQypLk7U5qj8IyY5ZoBu+vmsz3bREidAulTKk3TW1OMmy/wtqeo7wuf7xbabnaAj5tb8Mg2vFK5pPHO+l/RMNUPXI=
X-Received: by 2002:a0c:eb11:: with SMTP id j17mr13526842qvp.197.1588537255801; 
 Sun, 03 May 2020 13:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200331093241.3728-1-tesheng@andestech.com>
 <CAK8P3a3LokurC0n9XiwtPQh9ZgQcswMKY4b+TEsQh1VgYDNeWA@mail.gmail.com>
 <20200408035118.GA1451@andestech.com>
 <CAK8P3a1JS3_2fWrhNTZx0eTWjJa-GTb4AscTPqydpSP5EB15Yw@mail.gmail.com>
 <20200414151748.GA5624@afzalpc>
 <CAK8P3a0JW9x-Wk9Ec3+zLjPHbWAvPQx8MF-xe-PnWUgEjRAuTg@mail.gmail.com>
 <20200415135407.GA6553@afzalpc> <20200503145017.GA5074@afzalpc>
In-Reply-To: <20200503145017.GA5074@afzalpc>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 3 May 2020 22:20:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3OC5UO72rTDWi6+XgmExJmkATEjscq8hns8Bng06OpcQ@mail.gmail.com>
Message-ID: <CAK8P3a3OC5UO72rTDWi6+XgmExJmkATEjscq8hns8Bng06OpcQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Highmem support for 32-bit RISC-V
To: afzal mohammed <afzal.mohd.ma@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:MNnkxG6Kbv4YEV4c4uK6wKIiqBoKL8ocToboWH0K3li2ojSmb1B
 wYgjyUAqTSKWRC0X+AGXMCk86LKSwdZQq0ezc9EaXH0kLJLnGGT871TGTx0NczRAD4xZgSW
 2cwHUyulUbI/9jFZvk/mZEQlFDLHRmsxrPOtRfoHcmfgDoRQMyfGXejn6NDOJmTwSoQ9ZsX
 FiU4MqXprkKlQEOpu5ycA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:asL7FVcP1GU=:KTo7JQhLAI2eD+RdJ7FAs5
 pQDT7drGr/Ggd9iJlBkUI6gNWFgV3lbsZ/KrGk7GsJPaBcSSy9wDGdKEB7pFb3sThZDKFxbX4
 ULFWZTzqwvSsPObqUpgwyBXdNyJ56YLhZh9yDyTPcITGBY6LkCnR4x3XLrgNn8VEv9huA2ipV
 FjZ95D16faWm3HAS6DHqvu0/XesKVahfO7HLw2OJS+b2I4qJX5bU8DG/wdGk8gEPSb5kAvySu
 yTXTxO+nkfHMz7y6/r2XCoas+lp4IDBVJquzE8VaE/F1W1JbTNWpeYsF78MEI5UBWQK9cWyrz
 jhhYWkMFJo82HbjO6bkyE7ULnlV8RV/M926C56Sut0jtq/dUFth7ufV76vBG2OG/+v475et+g
 hA9byytEkRP/f8JErEHx5ZzvVY3tV4FZmuObjLkqSHwsS58KZn1fxJz78sNsuEgLPnc5ZODTQ
 OgQClSsDN/TCWkWpzMNrLR7Y/vdrltmbUFWEuGV5sU/aOuCRFsigBbYN9uYjyKK8ZyqYoLPKb
 CqF7Zm9JjR3yxzSP5UkE13/7aH6tOvgD70w6QwBwMjpbY0dHHk3UOUnwfLyCDjdS8pImN1Aj8
 qR6vuFntB5RViHtp4jea1Ps7yeJErlLJQXiRp9j9eiuY5/z0FZr/KLC3w0hV5K3tsXDpkcsLy
 dNdPJATR7ZU3R96Ltac0U3EFTbcWsvVYexJHaCWn4pjCkvC60GT52XXYKJQ6hJT69NA0T7rLS
 db4AX2jhiBAlpdZAjU8oDlnlq7vUOfYpNA5hu/EJ5lP52lAAGBGhZLZDWSFUdHQjWOJigd6cw
 /zaGGjPaoJr2ul+33y3VOII0PfLLB14i38gpPpxY0Fm1ZsLkkU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_132102_396632_9FB9FDF1 
X-CRM114-Status: GOOD (  15.06  )
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
Cc: zong.li@sifive.com, Alan Kao <alankao@andestech.com>, atish.patra@wdc.com,
 Albert Ou <aou@eecs.berkeley.edu>, Gary Guo <gary@garyguo.net>,
 linux-riscv@lists.infradead.org, Steven Price <steven.price@arm.com>,
 alex@ghiti.fr, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, Borislav Petkov <bp@suse.de>,
 Eric Lin <tesheng@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 yash.shah@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, May 3, 2020 at 4:50 PM afzal mohammed <afzal.mohd.ma@gmail.com> wrote:
>
> Hi Arnd,
>
> > On Tue, Apr 14, 2020 at 09:29:46PM +0200, Arnd Bergmann wrote:
>
> > > Another thing to try early is to move the vmlinux virtual address
> > > from the linear mapping into vmalloc space. This does not require
> > > LPAE either, but it only works on relatively modern platforms that
> > > don't have conflicting fixed mappings there.
>
> i have started by attempting to move static kernel mapping from lowmem
> to vmalloc space. At boot the execution so far has went past assembly
> & reached C, to be specific, arm_memblock_init [in setup_arch()],
> currently debugging the hang that happens after that point.

Ah, good start. Which SoC platform are you running this on? Just making
sure that this won't conflict with static mappings later.

One problem I see immediately in arm_memblock_init() is that it uses
__pa() to convert from virtual address in the linear map to physical,
but now you actually pass an address that is in vmalloc rather than
the linear map. There are certainly more problems like this to come.

> To make things easier in the beginning, ARM_PATCH_PHYS_VIRT is disabled &
> platform specific PHYS_OFFSET is fed, this is planned to be fixed once
> it boots.
>
> [ i will probably start a new thread or hopefully RFC on LAKML ]

Ok, makes sense.

     Arnd

