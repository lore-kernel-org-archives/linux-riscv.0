Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DFFC10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 14:19:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67DE220675
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 14:19:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OLOLLLnT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FBq8bKtw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67DE220675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CeRhJGH53b1mdMd66GLvMp+66uK/i7iR40Ub82mYtm8=; b=OLOLLLnT7Mjpeh
	Qhaymbkb5cYlo02aq90ayuzHdVmn5a5BYQFuJrHAuwMWWrqsB0bECmBCztjdyqcNzQqM1PY5oO7MO
	nuoDLX3ENpsHivgWefrZQ2XzoLnJdMzrpkN/3u36CxFf+4gKmhrRJ3QlS5ANsy9ooDlz+EVB4oxBw
	oNh4C3bDECRsggHoQ68eyGxvqgSjrJ9JfSfqLSICxc7y/pVtUAWm1j2R7zcdwWFvBt00wuKzKCOKz
	CmiLIsl8rKbjVDp39fwE1WdlpToB7aAKOiM4UPCDMPEYXjMcEPhhJ7CxcdnWO/nVFH/4SdncD44H+
	Nvyj0FtSva8Lt2PBp4bA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH7t7-0001iE-9k; Thu, 18 Apr 2019 14:19:41 +0000
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH7t1-0001aC-03
 for linux-riscv@lists.infradead.org; Thu, 18 Apr 2019 14:19:36 +0000
Received: by mail-vk1-xa41.google.com with SMTP id h127so481291vkd.12
 for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2019 07:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8eV2vUS51UMgePfSSxCuXJhq0Gtq0aUu2F6TTcKETz0=;
 b=FBq8bKtw8jKgNvkAesGOL5wEhVUfIvOVZLawNU9Os5filzXur33S5KXLGi3G59zEmJ
 MNxbw1dkanZJyl6+Bh/X7hbbi4DCuJUT+N82rjvvIQb1baWE98HINAsh1KYITkSEbQsv
 WkyhKK/r8PDat9cP9eHISsDMRa0TxCyHkKPk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8eV2vUS51UMgePfSSxCuXJhq0Gtq0aUu2F6TTcKETz0=;
 b=BMxyKE/eEhwTDgoFyjnYiA5Tb95Ns718PN/9Yp+Zouu9rlgSGL2ZXOI9UUBxp+/P5e
 0DbeX31dETPuRz/wMsXoZ+NzBnXrombJGgbztVppaUGnmJKqubzicC4V1WqiQ+Vs/dsS
 hWl++YTugAYd3tcBV28rOTrMwISQI2v7yBg8ayAeptuYXbo1k42lzajJqK1u9vJ0jDfz
 KPVK4eI0ZYlDbozQXzkqDbPhcCtj+2l6mHwRWtrNA0s5i1Swlmo23LHMRhm11b07zTT+
 LiAHTn5O+Ah7wdunRFRS35EGpLQYfR4fKftT2IMHNX1qOrN7O5Tyh3Eoi6pywFmErgqI
 Ms0g==
X-Gm-Message-State: APjAAAWhlON3BLKwuPKgkijfYXkxJqV2wMKiA4/Pg3cbV4KO+HV36uc7
 zwGD5ObadVZQyUX/VoCkW6m/sylaUVk=
X-Google-Smtp-Source: APXvYqyOYaEFiiWqu1a5kFMGBU1bzRk/VyBXVm8az5aZCksdZj5Nfsiq3polmx3Iybp/OAxRXHPR9Q==
X-Received: by 2002:a1f:ab8d:: with SMTP id u135mr48870472vke.80.1555597172328; 
 Thu, 18 Apr 2019 07:19:32 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com.
 [209.85.221.176])
 by smtp.gmail.com with ESMTPSA id l200sm739579vkl.25.2019.04.18.07.19.30
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Apr 2019 07:19:31 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id h71so494148vkf.5
 for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2019 07:19:30 -0700 (PDT)
X-Received: by 2002:a1f:2e07:: with SMTP id u7mr50481033vku.44.1555597170338; 
 Thu, 18 Apr 2019 07:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-5-alex@ghiti.fr>
 <CAGXu5j+NV7nfQ044kvsqqSrWpuXH5J6aZEbvg7YpxyBFjdAHyw@mail.gmail.com>
 <fd2b02b3-5872-ccf6-9f52-53f692fba02d@ghiti.fr>
In-Reply-To: <fd2b02b3-5872-ccf6-9f52-53f692fba02d@ghiti.fr>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 18 Apr 2019 09:19:18 -0500
X-Gmail-Original-Message-ID: <CAGXu5j+NkQ+nwRShuKeHMwuy6++3x0QMS9djE=wUzUUtAkVf3g@mail.gmail.com>
Message-ID: <CAGXu5j+NkQ+nwRShuKeHMwuy6++3x0QMS9djE=wUzUUtAkVf3g@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] arm64,
 mm: Move generic mmap layout functions to mm
To: Alex Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_071935_039247_02617239 
X-CRM114-Status: GOOD (  14.60  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Linux-MM <linux-mm@kvack.org>,
 Paul Burton <paul.burton@mips.com>, linux-riscv@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, James Hogan <jhogan@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 18, 2019 at 12:55 AM Alex Ghiti <alex@ghiti.fr> wrote:
> Regarding the help text, I agree that it does not seem to be frequent to
> place
> comment above config like that, I'll let Christoph and you decide what's
> best. And I'll
> add the possibility for the arch to define its own STACK_RND_MASK.

Yeah, I think it's very helpful to spell out the requirements for new
architectures with these kinds of features in the help text (see
SECCOMP_FILTER for example).

> > I think CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT should select
> > CONFIG_ARCH_HAS_ELF_RANDOMIZE. It would mean moving
>
>
> I don't think we should link those 2 features together: an architecture
> may want
> topdown mmap and don't care about randomization right ?

Given that the mmap randomization and stack randomization are already
coming along for the ride, it seems weird to make brk randomization an
optional feature (especially since all the of the architectures you're
converting include it). I'd also like these kinds of security features
to be available by default. So, I think one patch to adjust the MIPS
brk randomization entropy and then you can just include it in this
move.

> Actually, I had to add those ifdefs for mmap_rnd_compat_bits, not
> is_compat_task.

Oh! In that case, use CONFIG_HAVE_ARCH_MMAP_RND_BITS. :) Actually,
what would be maybe cleaner would be to add mmap_rnd_bits_min/max
consts set to 0 for the non-CONFIG_HAVE_ARCH_MMAP_RND_BITS case at the
top of mm/mmap.c.

I really like this clean-up! I think we can move x86 to it too without
too much pain. :)

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
