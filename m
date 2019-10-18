Return-Path: <SRS0=JNhR=YL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16F4CA9EC8
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2019 03:09:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F1252070B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2019 03:09:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GtMR9swA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="rRoeANGs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F1252070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6iK7CL03FoI/PzdGWWV8V7PIORP/YJ4ovz2+4InQdTM=; b=GtMR9swAsIyobd
	6tj69LTkAmweWLlyiSgn9iOZ17cxqehlRjGR/i4TGT1v9sb+bZZ8EOdj4pz4ak3RN8WFBzE/qRYrE
	wcu/oJDcST+Mszs1AWjXSVNRb0s9N7KsjzO1vCh2s+npMHa5N+q7nS7l2gRApt0nfSxem72VgkWD4
	ipBZ5RqkSuv/vGF7NKRMdwsUzNMLT287Cbt0tCuDu7P3FLBwEghhCJkV4jeUamAHc5TOSGaKLW+AL
	0ua2QhAPq7z+Z1V0WYtIHO1emJx9cLWXaYgZd5kDInGmPccnBKKSAvbq0yp4zdORpqxKjH2H8tfeY
	F9YmkwQgLdiEURmhtMjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLIdS-0006py-GQ; Fri, 18 Oct 2019 03:09:02 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLIdP-0006pd-GA
 for linux-riscv@lists.infradead.org; Fri, 18 Oct 2019 03:09:01 +0000
Received: by mail-wm1-x343.google.com with SMTP id p7so4529275wmp.4
 for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2019 20:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bUJLiWvB08iFLxWpJBCXj620abxUzMl2/mW6lq36/Xs=;
 b=rRoeANGsJLnSZrG5kRjo8/KXrHiJxoVnXcihkW4lnkRzzXtMfnMdyATHmpj3F6cSw0
 C+CFQ86vc7DCbYuL7k+lL55VwPISMoshItEXPffvA8xKWAwDSeJvs8lM/aGxxOoyDA0G
 xQBmef4H9PQuimhjHxXrFeNtkvFTkoP5AuYU2Yqo+ElVWGUi6aZ8W8K6puS5Y5pI9/uV
 j/nbluVD2cLJ2uq2jmiFKAlIaAjYSe/mZbaL7GL5QKHKON/Aa8eb5//LlEOJqBGD1AWf
 K6LUg1fNHAWy6K6Qy/xP+eqoeljlnpltqgWcfJ23LkZtF6ZlsA9XXUXxrNtbMaF+LfQf
 /VDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bUJLiWvB08iFLxWpJBCXj620abxUzMl2/mW6lq36/Xs=;
 b=byZOyD2A625L2FgmC14AzFHDg5C85vHVpFxc7cktEQEaPSUFd98QhsjWJ6klKGayXF
 /7N13NwYgRmS7MUA2YulUDi19MoVSaWt3FN/URs2WvE9Bp6FxvaUnVM4Fs708IQXWHKV
 zI4EYZ6BDM6zhfRI02t1QmX9GOxVCUoEVQdbhI6c04uKVqX0GNOgYkwnQxQ3gqK+O7kc
 jvsHinziFtMcvyW6U1WPrHmsj4Cc85aaljd6uU9p/uwqezqI/jQ/xA/JiTkc1r9Mwea3
 uqICc/8jJ6/kwZh/o8Iq/JLi3m3pXRn9L3tOmWn4z/C18wXE6QmokWTe+Ve4XajWiD12
 bhmQ==
X-Gm-Message-State: APjAAAXWN9NoXHQj05yZPwlHE27CgKpsJr5Tsi8CVeAIyw52vh8/6OYh
 WR8JTnjVPQ+50BbWe9KNjQfvCiBalx5DvOGrSS0/0Q==
X-Google-Smtp-Source: APXvYqxM0KahMGBxIxTv+KeVzUN9KXIJyXEf4oKMa/uoCQ1jReXlmJOheGaVaL4ufWKZW6jVK6rQl/xrP3+BPhfN5o8=
X-Received: by 2002:a7b:c775:: with SMTP id x21mr5621790wmk.52.1571368137819; 
 Thu, 17 Oct 2019 20:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20191017173743.5430-1-hch@lst.de>
In-Reply-To: <20191017173743.5430-1-hch@lst.de>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 18 Oct 2019 08:38:47 +0530
Message-ID: <CAAhSdy1dvFzEh_WZ8aDNyCKi968Dwxm+ru6D0DF08QoOq3JjLA@mail.gmail.com>
Subject: Re: RISC-V nommu support v5
To: Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_200859_541214_FEE4EFC4 
X-CRM114-Status: GOOD (  16.39  )
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Christoph Hellwig <hch@lst.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Paul/Palmer,

On Thu, Oct 17, 2019 at 11:07 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi all,
>
> below is a series to support nommu mode on RISC-V.  For now this series
> just works under qemu with the qemu-virt platform, but Damien has also
> been able to get kernel based on this tree with additional driver hacks
> to work on the Kendryte KD210, but that will take a while to cleanup
> an upstream.
>
> A git tree is available here:
>
>     git://git.infradead.org/users/hch/riscv.git riscv-nommu.5
>
> Gitweb:
>
>     http://git.infradead.org/users/hch/riscv.git/shortlog/refs/heads/riscv-nommu.5
>
> I've also pushed out a builtroot branch that can build a RISC-V nommu
> root filesystem here:
>
>    git://git.infradead.org/users/hch/buildroot.git riscv-nommu.2
>
> Gitweb:
>
>    http://git.infradead.org/users/hch/buildroot.git/shortlog/refs/heads/riscv-nommu.2

It will be really cool to have this series for Linux-5.4-rcX.

Best Regards,
Anup

>
>
> Changes since v4:
>  - rebased to 5.4-rc + latest riscv fixes
>  - clean up do_trap_break
>  - fix an SR_XPIE issue (Paul Walmsley)
>  - use the symbolic PAGE_OFFSET value in the flat loader
>    (Aurabindo Jayamohanan)
>
> Changes since v3:
>  - improve a few commit message
>  - cleanup riscv_cpuid_to_hartid_mask
>  - cleanup the timer handling
>  - cleanup the IPI handling a little more
>  - renamed CONFIG_M_MODE to CONFIG_RISCV_M_MODE
>  - split out CONFIG_RISCV_SBI to make some of the ifdefs more obbious
>  - use IS_ENABLED wherever possible instead of if ifdefs to make the
>    code more readable
>
> Changes since v2:
>  - rebased to 5.3-rc
>  - remove the EFI image header for nommu builds
>  - set ARCH_SLAB_MINALIGN to ensure stack alignment in the flat binary
>    loader
>  - minor comment improvement
>  - use #defines for more CSRs
>
> Changes since v1:
>  - fixes so that a kernel with this series still work on builds with an
>    IOMMU
>  - small clint cleanups
>  - the binfmt_flat base and buildroot now don't put arguments on the stack
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
