Return-Path: <SRS0=iBqs=JN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2120C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 18:52:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CF756137D
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 18:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CF756137D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ql4MTFAoldhxEJk7vWeG5DaUnIsfeRUVxwooMLhV54w=; b=oEZG+hSMSa5FrH6du/ts7fQRq
	1it+KmjUgQzOSf0g8rNkb6Lehz5PRM+7rEKUgqfl8bihXm62KuUC5fNyTKdDbkrdHDPnllqyZnyBU
	zuU6YxOOnIq0ZrsIKAKwcSYTMKFbGinVhY0KKsGqZnn25c2WNc2pT8VDYODICmPVY1NPc6Px8qeAX
	naUBqoLuYWgRZwOeap9DbuKtABSE4bUzQecuu9nS7KqxdWIiJg5UxhEUm8NLwDZZg1slyvmKVptiw
	kSqTx8ZvOsEHGuLw50VCt/+wbQHxXwO+/y9eLvbd82eNBBVg+jHK4+6hXjY5b+T1nzbunYHoNNR0r
	OXjGll5XA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXTZH-0038j1-SU; Fri, 16 Apr 2021 18:51:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTZE-0038im-SJ
 for linux-riscv@desiato.infradead.org; Fri, 16 Apr 2021 18:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2r2vkwG9UCNB7xrSeMaXDYuTdlG3jHjzPkkxswC7vmg=; b=1qC7UP0vNjQmS70KLD7kLK9BFb
 PmyaO68neyHWZzCkUjwIybBw/Zg4NvLOcEEDDAfmOvX4m/vAACCr7T1DUxsWtnSsQHqq6g/mhIERK
 2i51UQwHAsd/AFOIvRGC8u2Nk5P2wGhtsJxlgPe+xXhUxtxYN542m+c4HTJMsh2raEJ/ML6hc2WPd
 Ae8pJxObPb7VvDG/uxiydy5QK2pLQ6vO9teB8+Ha1akcZrG9Itc6pbmlRWgZXcDI/I8wIJ1IcGsjO
 7R/jPS5A1XTYdOYceIYTvZVTxCdhvcWh6eSq4qoCrTYnN+No537rJthklb4e5PaXNsUlzUp0AMdri
 KXQ7cAMA==;
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXTZ9-009dc1-AZ
 for linux-riscv@lists.infradead.org; Fri, 16 Apr 2021 18:51:47 +0000
Received: by mail-oi1-x22e.google.com with SMTP id n184so2811952oia.12
 for <linux-riscv@lists.infradead.org>; Fri, 16 Apr 2021 11:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2r2vkwG9UCNB7xrSeMaXDYuTdlG3jHjzPkkxswC7vmg=;
 b=lcF00QwLC8PK7GTMRhPSub3JPTJ1qNCRqaoSkaih+zPeslAq7Ez+xOVPJCaYARn/9h
 XHrGmLWD6OZrRMoi2WQSve0KlJyB3BPniNNxHPTudpnkvj9c8UJf2GW6Y2GEvyKBSsgc
 JltwUxOpXH0FK0i0q2ScMVocYe4sBtWOoQYapC/U67iphGwTEv/lZwF2tbIKuRPVWoC3
 hvc+SY8EFbsgAB9LWqY2WsfVhP03OYzL5pp+/QNiKegArHNkr0szL90g59fR0iHETA4R
 r9Q0+Tbcvb8uePaTFUgeOpsPJRrijUVhHveDagf9Vf/F7DAHV98Xkows9dL4YF8DBixd
 qDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=2r2vkwG9UCNB7xrSeMaXDYuTdlG3jHjzPkkxswC7vmg=;
 b=Sw3Zu2D6tCkRl/FI8hntAKNEY02a4Vhflue3xZMNKDVJhlfFkjr9yJeJICiEm4mt3d
 krMtkJxyxi6SHcIIus9iYJibbp2881DAgsCC9phJ0OyWMyVbHu8wiEpFKPAf/IulbOcB
 nnV53El+e3ARi8cINIBbRcKIl2W9W0lnN5tpYBWv/SvWnleWZ15wB40fAb3oK6/dpPF2
 yx+QCwj/1ux1VL1VsBdcEOKP02/kiTpSGg4ESsd8vydDhtcHczm8rj66R0Repi8O4c3V
 WS3fZqm47CZ3Bcrl0Eo2XuokqbqeVlr/9rRr5cRwG+r78gP3A17elTrR+vpPxrz0QLhA
 BiWw==
X-Gm-Message-State: AOAM532HN0avViKhu4KjhoGWdqt/8YNRrMktn+FBOe971q0EUIabyK/E
 tV0FzaZDrWyhWboeEyWbQ7c=
X-Google-Smtp-Source: ABdhPJz9hVqfsgFcDqumj8Y7g+QmwdbvvK8f4T/Tz19SDlxLNY4HtR0EBBFy/mHjKN7ulNYRmXaO0Q==
X-Received: by 2002:a05:6808:1444:: with SMTP id
 x4mr7654073oiv.142.1618599101889; 
 Fri, 16 Apr 2021 11:51:41 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id y25sm1608634otj.64.2021.04.16.11.51.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Apr 2021 11:51:40 -0700 (PDT)
Date: Fri, 16 Apr 2021 11:51:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-arch@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 1/3] riscv: Move kernel mapping outside of linear
 mapping
Message-ID: <20210416185139.GA42339@roeck-us.net>
References: <20210409061500.14673-1-alex@ghiti.fr>
 <20210409061500.14673-2-alex@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210409061500.14673-2-alex@ghiti.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_115143_432435_E5B3C90B 
X-CRM114-Status: GOOD (  23.14  )
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

On Fri, Apr 09, 2021 at 02:14:58AM -0400, Alexandre Ghiti wrote:
> This is a preparatory patch for relocatable kernel and sv48 support.
> 
> The kernel used to be linked at PAGE_OFFSET address therefore we could use
> the linear mapping for the kernel mapping. But the relocated kernel base
> address will be different from PAGE_OFFSET and since in the linear mapping,
> two different virtual addresses cannot point to the same physical address,
> the kernel mapping needs to lie outside the linear mapping so that we don't
> have to copy it at the same physical offset.
> 
> The kernel mapping is moved to the last 2GB of the address space, BPF
> is now always after the kernel and modules use the 2GB memory range right
> before the kernel, so BPF and modules regions do not overlap. KASLR
> implementation will simply have to move the kernel in the last 2GB range
> and just take care of leaving enough space for BPF.
> 
> In addition, by moving the kernel to the end of the address space, both
> sv39 and sv48 kernels will be exactly the same without needing to be
> relocated at runtime.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

In next-20210416, when booting a riscv32 image in qemu, this patch results in:

[    0.000000] Linux version 5.12.0-rc7-next-20210416 (groeck@desktop) (riscv32-linux-gcc (GCC) 10.3.0, GNU ld (GNU Binutils) 2.36.1) #1 SMP Fri Apr 16 10:38:09 PDT 2021
[    0.000000] OF: fdt: Ignoring memory block 0x80000000 - 0xa0000000
[    0.000000] Machine model: riscv-virtio,qemu
[    0.000000] earlycon: uart8250 at MMIO 0x10000000 (options '115200')
[    0.000000] printk: bootconsole [uart8250] enabled
[    0.000000] efi: UEFI not found.
[    0.000000] Kernel panic - not syncing: init_resources: Failed to allocate 160 bytes
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.12.0-rc7-next-20210416 #1
[    0.000000] Hardware name: riscv-virtio,qemu (DT)
[    0.000000] Call Trace:
[    0.000000] [<80005292>] walk_stackframe+0x0/0xce
[    0.000000] [<809f4db8>] dump_backtrace+0x38/0x46
[    0.000000] [<809f4dd4>] show_stack+0xe/0x16
[    0.000000] [<809ff1d0>] dump_stack+0x92/0xc6
[    0.000000] [<809f4fee>] panic+0x10a/0x2d8
[    0.000000] [<80c02b24>] setup_arch+0x2a0/0x4ea
[    0.000000] [<80c006b0>] start_kernel+0x90/0x628
[    0.000000] ---[ end Kernel panic - not syncing: init_resources: Failed to allocate 160 bytes ]---

Reverting it fixes the problem. I understand that the version in -next is
different to this version of the patch, but I also tried v4 and it still
crashes with the same error message.

Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
