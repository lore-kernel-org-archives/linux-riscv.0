Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8E5C001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 10:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+ucHQouDEKrIhOLT2VIblpsXSTS8IXZxrAzrGptSKE=; b=HBkmO84KahoXPNSBuI/aiNwZDC
	/06Tvn58qEZaTivxx2mt+YufOtHqx1RbzMXc3DtgR8VARStsmTwAKFjd2L72wTgQVkYcubgTuvsRb
	Fm1bXwLqUfFfV9aZyKViJdpEs32U1ybQIig6akb8mSkKYX5l/Xi7pAi+ofA5i9W8ALs+XrXIhCXLv
	Fho4JzOdd6YtG2lKAe8W79dXVuS+Kma7Tcxfd1iI6NPTprZ6irK8UB7gEuSFJRRHZqhTkL2flv7Bu
	7cH7/VJgD4sU0W3NOLXLwk6S/pj1dxYq6FjB7+UCLax+15mr1PRJ95zKe13uBvE44aC/XEMWZ/EAd
	7i3XSz0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPKpU-002z3R-2A;
	Fri, 28 Jul 2023 10:36:16 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPKpS-002z2N-0T
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 10:36:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7471240003;
	Fri, 28 Jul 2023 10:36:06 +0000 (UTC)
Message-ID: <fc8bf20a-487c-c097-ce81-097095327a4f@ghiti.fr>
Date: Fri, 28 Jul 2023 12:36:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: How to deal with openSBI reserved regions?
To: Petr Tesarik <petrtesarik@huaweicloud.com>,
 linux-riscv@lists.infradead.org
References: <76ff0f51-d6c1-580d-f943-061e93073306@huaweicloud.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <76ff0f51-d6c1-580d-f943-061e93073306@huaweicloud.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_033614_342555_E51DB063 
X-CRM114-Status: GOOD (  18.89  )
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

Hi Petr,


On 28/07/2023 12:02, Petr Tesarik wrote:
> Hi all,
>
> I have recently looked into enabling crash kernel and kdump on riscv64.
> I can start a new kernel after crash, but I ran into an issue when
> reading /proc/vmcore there.
>
> I am testing this inside a QEMU VM and I boot my system in S-Mode using
> U-Boot with mbedded openSBI firmware. The problem here is that openSBI
> occupies the first 128 pages of RAM, but they are shown as "System RAM"
> in /proc/iomem. The kexec_file_load(2) system call uses
> walk_system_ram_res() to build a memory map of the currently running
> kernel. This is then passed to the crash kernel through ELF core headers
> as a LOAD segment. When reading the corresponding part of /proc/iomem,
> the crash kernel tries to map these pages, but they can be accessed only
> from M-Mode. Any attempt to access them from the Linux kernel fails with
> a PMP violation. Consequently, -EFAULT is returned to user space.
>
> Now, the openSBI area is represented in the Device Tree with a
> reserved-memory node () which overlaps a memory node. Technically, the
> firmware region is indeed RAM, but how should it be excluded from
> /proc/iomem?
>
> Should this be fixed in the kernel?
>
> Or, is the provided DTB incorrect?
> Should the memory node exclude the firmware area?


Which version of openSBI are you using? We fixed something similar in 
1.3 by reintroducing the "nomap" property to the regions occupied by 
openSBI, I'd say it should be enough, let me know if it's not!

Thanks,

Alex


>
> Petr T
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
