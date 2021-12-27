Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6643EC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 02:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QG3rMEAUhSFAkFjlMtPTkbe/emv5qeXZDqFWeMS7j7s=; b=UxTWzZrzlewOze
	JlCGRsqcr1W1wPmb44DFWts9++ysXzBZmfEZO7PFDH28bmlL3WxMe7wFoCXhDxjPFApmOO0sao8Qt
	fJINVKVg0aFTwKyIthpvve3NFiCXirEAYcwciC67fC6Ytj+7GFNeU2+P1tHxqj1HhWwtIzdClc8mM
	hBx8rzDT6LXRUli9HhoSSs6AzzUupVfpPGM79Fc4eZRtIHBHVblZjy0WkN7iO6fXKsM6ThRoyBuPH
	8t1ueeHj/aeN19dOExp7ShGCQSXJlIzBjn9UnTFxuruMzML4o1trukMc1bqyKyvX1LXLHwpVH4B8Q
	R5LVngOe6ixAv1sZ2nPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1fl6-00G2qd-Nh; Mon, 27 Dec 2021 02:29:08 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1fl3-00G2q8-9p
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 02:29:06 +0000
Received: by mail-wr1-x435.google.com with SMTP id q16so29719650wrg.7
 for <linux-riscv@lists.infradead.org>; Sun, 26 Dec 2021 18:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=bOhEvVozhHM6YldXriruHfBFw2hklkJ8aXUAF0+xVPg=;
 b=XoIoCzWCYSPvm4fY4M3T73vMITkswDgMyGplM+rbY6W6VkBBfPVdETLchyI2PCRrF0
 xbvSb/rgdUlEDXwDPcHcrOJ5Ob49nn81tZ/qnfjjH3tf0btwcV4Z3wIsyvqNiyAG6syh
 6OwGpi28YXtGyrkvuxqHEs5NFuM1nYrlAqhALE8XU24+1NqeT2WgiioMcASaTvF3k/EF
 9pHla7ja7tr0wIPCKUDiU9ICMOuLGzA0Em7b0B/0FoTGbdkPSGCPnHKiCCNRoY2eNqJ9
 Rp4wFGjLj7Up5L0Oo1ioaay6r6u1/K+k+WEYVSdR3svV8nKekHAazev9o/04eXai88lk
 6swQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=bOhEvVozhHM6YldXriruHfBFw2hklkJ8aXUAF0+xVPg=;
 b=TaRx5eTIgGlxqdzRDNkLmL0M7MPpsnBfSg9pEndM7AHtxUuXahNvgbYvrvMpPA1P17
 xF6skY/p7qaAt32Ra4yfcKZGSL2rQ+cKrce0KfQ0L20eGxpxhUH62LIBK8vCDaqGKy4Y
 knEYdRjb/AMpPer/DpzBmgi5pDaXubnKMmZYy0deu96Wb85JIkwhldGkmMU24t8LKFcO
 EaP2OI4rvBS3ZRxN61jVHSLzordR9wx9xIWpI7ygUlmMu7S/qB392RHhgMOHxw+4+mEL
 v28J3S+EH49PDRCPpK7xXqGBr98UhycS0KP37YpzRY3BhjlTsuH8RFV8tKo/MoCUj9yi
 a8/Q==
X-Gm-Message-State: AOAM531d7nV/v8loZ8rMybnICdDhEOxUCm3v9XcVdL+b5IV0/l+A3oei
 IuWjulqfjWG0+T09BJv/AuqEPQ==
X-Google-Smtp-Source: ABdhPJwqzX+wn7fueplWnROokfjMQchC3UHOG/zKLlnPZj61VkZ2EQle1lIluZZcEB73WdGst5H9xg==
X-Received: by 2002:a05:6000:15c4:: with SMTP id
 y4mr11112209wry.166.1640572143101; 
 Sun, 26 Dec 2021 18:29:03 -0800 (PST)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141])
 by smtp.gmail.com with ESMTPSA id g5sm14158063wru.48.2021.12.26.18.29.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 Dec 2021 18:29:02 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 00/13] riscv: compat: Add COMPAT mode support for rv64
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAJF2gTQ04utyOc9=q9Tu92togGuyygKgq3tWwfPBCuyTfLh2SQ@mail.gmail.com>
Date: Mon, 27 Dec 2021 02:29:02 +0000
Cc: Arnd Bergmann <arnd@arndb.de>, Jisheng Zhang <jszhang3@mail.ustc.edu.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>,
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>,
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 =?utf-8?B?IldlaSBXdSAo5ZC05LyfKSI=?= <lazyparser@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Message-Id: <AA7091EA-C3AF-47CE-B0C5-E2ECE4133D09@jrtc27.com>
References: <20211221163532.2636028-1-guoren@kernel.org>
 <CAK8P3a37+0=CCE7283VQ4QZ1tZqcU+A2POUGXtvdM46ZMHx-gw@mail.gmail.com>
 <CAJF2gTRAxX0qEcNmw+5N=3jZcJw9YF75oRjT7Y5FUMUkHoSz4Q@mail.gmail.com>
 <20211226162223.795f9417@xhacker>
 <CAJF2gTRHND1F_-5+Euzy-UdRRdg2oAXDY4dt8_5p9JxsHDSe6Q@mail.gmail.com>
 <CAK8P3a08kawHpz6RsLZsvNNn0_WKaFWRU-7M4fJ3e7i7J+GQcA@mail.gmail.com>
 <CAJF2gTQ04utyOc9=q9Tu92togGuyygKgq3tWwfPBCuyTfLh2SQ@mail.gmail.com>
To: Guo Ren <guoren@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_182905_430095_83A2676A 
X-CRM114-Status: GOOD (  15.92  )
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

On 27 Dec 2021, at 01:16, Guo Ren <guoren@kernel.org> wrote:
> 
> On Mon, Dec 27, 2021 at 4:31 AM Arnd Bergmann <arnd@arndb.de> wrote:
>> 
>> On Sun, Dec 26, 2021 at 7:38 AM Guo Ren <guoren@kernel.org> wrote:
>>> On Sun, Dec 26, 2021 at 4:36 PM Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:
>>>> On Wed, 22 Dec 2021 20:59:30 +0800 Guo Ren <guoren@kernel.org> wrote:
>>>>> On Wed, Dec 22, 2021 at 2:10 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>>> 
>>>> What about adding RV64 ILP32 support instead? This don't need HW side
>>>> modifications so can benefit all RV64.
>>> 
>>> ILP32 is another topic in C Language Data Type Models and it couldn't
>>> replace the standard rv32 ecosystem.
>>> COMPAT is a common framework in Linux (7 arches have been supported),
>>> so let rv64 support COMPAT mode is considerable.
>>> 
>>> Customers would choose ILP32 / RV32-compat by themself and that
>>> depends on which one has a better ecosystem.
>> 
>> From a kernel perspective, supporting both is not much more work than
>> supporting either of them. We had the same debate for Arm64, and ended
>> up never merging the ILP32 patches despite them being well written
>> and maintainable, to limit the number of supported user space ABIs
>> as well as the possible attack vectors when there is an exploitable
>> bug that is specific to an ABI.
>> 
>> arm64 does support big-endian mode, which is a similar niche, but it
>> can't easily be removed after it's already supported. Supporting normal
>> compat mode is the easiest here because it doesn't add another user
>> space ABI, but I'd strongly recommend not to add any other ones.
> 
> @Palmer Dabbelt How do you think about supporting ILP32 & COMPAT both
> in rv64? And let users vote by foot which is better.

As psABI TG co-chair I really do not want an ILP32 RV64 to exist if it
can at all be avoided. Every single attempt at an ILP32 ABI for a
64-bit architecture has failed to take off in the past, so I struggle
to see why RV64 will be any different. So, in my opinion, there is a
relatively high barrier to entry for it to be an official frozen ABI,
and without it being that I doubt upstreams will want to go near it, be
it Linux, GCC, binutils or GCC, but they can speak for themselves if
they feel otherwise.

Also, with every year that goes by, ILP32 becomes more and more limited
in what you can use it for, due to increased memory footprints...

Jess


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
