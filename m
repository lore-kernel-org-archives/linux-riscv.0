Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F350FCA5FFC
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 16:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uGEicRQh9YJ4ZRTCAy8ulNfHoemhHzNubr/8EfrW0s4=; b=zBnhkQztEV6VGD
	wCM1r7BiSlro4NvUkmjiTg5bXps+btA+DzVp61zaQmcr/SjGZ6IsHw28otpXK5gKcMtVK0z+p04uj
	+T0fiUe2Nka42MMCYUAI33pHzR07bGTXvOI94UYqQ8JGsNakNnW5T64/ZZNcDXUUaG7UM3YwwMW8O
	m7oBuZ3UEs3OoLjY8V1+aBHsbDKQilNu6EmclifamGucGw/BfikWA7/QB/J8BEqNM8R3uk9g/r0tz
	78YBKsM8jd1jQAx8eIorrNbXbIohaQKdGvoZFIYzz2/hOI4F0z10IBCvagvrMsmhIijwCdUjXg+Ks
	oX8L7KDNloZi8a7zuhZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDlzj-0000000GsSb-28fJ;
	Mon, 05 Oct 2026 16:56:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDlzg-0000000GsSV-2D4v
	for linux-riscv@lists.infradead.org;
	Mon, 05 Oct 2026 16:56:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F2F5E4008C;
	Mon,  5 Oct 2026 16:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF681F000FF;
	Mon,  5 Oct 2026 16:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791219411;
	bh=VntT4RkPFOQ0dJ5Ht0LsaK5Uv30Dq1nWSggbDQYoUaM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=iEKGslQ95+amOYKHJGOgxAgYFmHfRthoQ0afvbazzErDzUFLzICGr5Rx4IgRfonmI
	 Ag3lw5lvThEh+HdoqJdfQ9gbLLYC38dVxsw8MnisgsrYQlDjj7UkFscHsDkPAOsvhE
	 huxXPXd77Jp+kGS+OYybVP6KwbA1+kv+91euw3ElwAGpBc88xPwtijxD4TzXMoTyX1
	 J/QAFJfvXgZwjLUWA7RX2Usad1X6+UMVogfEfjccq2zYYcl4z1e0az97v4bldfRerT
	 NrKhkG9WXoF5cj8VMnLo7aAQNY+Wct2K2ks0LLjyncYmO1CM2I4OpkYRcrZvAVUr+A
	 lyYbVPbpHXBww==
Date: Mon, 5 Oct 2026 10:56:45 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: sun.wenhan@zte.com.cn
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    jianjun.wang@linux.alibaba.com, liu.qingtao2@zte.com.cn, 
    lv.yating@zte.com.cn, guo.chang2@zte.com.cn, deng.weixian@zte.com.cn, 
    hu.yuye@zte.com.cn
Subject: Re: [PATCH] riscv: align pcie bus assign logic with ARM64
In-Reply-To: <20260929173053186td0a5D4tn7cNBN-R8JyEp@zte.com.cn>
Message-ID: <fd6c0052-5592-45b0-809c-83ea2cf8af64@kernel.org>
References: 202609220934.68M9Y2eC015972@mse-db.zte.com.cn,c8bd7448-e9f3-72fc-9c91-db0c2525a3a1@kernel.org <20260929173053186td0a5D4tn7cNBN-R8JyEp@zte.com.cn>
MIME-Version: 1.0
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

Hi,

Thanks for updating the patch.  A few comments:

On Tue, 29 Sep 2026, sun.wenhan@zte.com.cn wrote:

> RISC-V currently relies on the asm-generic default of
> pcibios_assign_all_busses() returning 1, so the kernel always
> re-assigns all PCI bus numbers and ignores the bus numbers already
> set up by the firmware. This has two downsides.
> 
> As UEFI 2.8 has brought mature firmware support to RISC-V servers,
> the OS can trust and inherit the PCI bus enumeration done by the
> BIOS, skipping a redundant re-enumeration at boot and improving the
> boot time.
> 
> The unconditional re-assignment also causes bus numbering conflicts
> during PCI rescan. When a root port that is not the last one in the
> hierarchy is removed and the bus is rescanned, the kernel fails
> with:
> 
>     pci_bus 0000:01: busn_res: can not insert [bus 01-ff] under
>     [bus 00-ff] (conflicts with (null) [bus 02])
> 
> Define pcibios_assign_all_busses() the same way as ARM64, so that
> RISC-V also preserves the bus numbers assigned by the firmware by
> default instead of always re-assigning them. This keeps RISC-V
> consistent with the other major architectures.
> 
> Signed-off-by: sun wenhan <sun.wenhan@zte.com.cn>

- Please start your subject line with "[PATCH v2]" etc. when sending 
  updated versions of patches.  Please see
  https://www.kernel.org/doc/html/latest/process/submitting-patches.html#subject-line

- Some tools break when the name in your E-mail is an E-mail address.  I 
  fixed this up to match the same in your Signed-off-by:, but please fix 
  this for future patches.

Queued for v7.4, thanks.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
