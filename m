Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745F3CD4F50
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 18:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Yfpf31tW0Me5PBEodzd7jm0mqOfu9eQgWquMJcUpn0=; b=AJ3TBFnxx5s67w
	p//vUkOQcklPzQiBGFpIrQm7nOtFAG65m/XQ4gFeWG2E60OsYy6KaN1rN+3zIe2EXz6UVMZj6Qcja
	i0WQtwgHLmlS02v10cgVik1xMtOhf8azpuRIwunxNUqZHyKlJ65JQXpqgVEqlOXGYrS1jPNDRSA+1
	l9aNZ4IDcDh51Gb9W+cpmSx5pjzNnN9Oyg6Gxastfqk5GSiQpe/h6FacHgEeFT/J6FLrGKrsmEreT
	8HeHKf8oTkjQt+qASBGdMd9KHglRtDG11+dj7B0yariq5X/Tqs+8gstKQteLq7bSL94HkYbDprLng
	gGdnP2Ce2Lt/18LJsLMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2ny-0000000Ga48-2umg;
	Mon, 18 May 2026 18:35:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2nx-0000000Ga3u-09SB
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 18:35:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F23B60120;
	Mon, 18 May 2026 18:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D9AC2BCB7;
	Mon, 18 May 2026 18:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1779129303;
	bh=BBgdSEmquIQtG+Vd4wr31W7UJ/hyuPfdXKhRmNVBIjQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QkgeDcvYx/sBQZg0QJXxqsoGkJ/P/vbR4j0IO1OkYDDt7xuWVngrwN1HfDrrWcAlK
	 mQ1W/DHxp9TMTTHoxBA+9exvTLN4SMYGwAaCA8FD044WZl7IafDyg01QOye9i2iunN
	 VIqN+TIBMnXkesp51AJU7oKDIcS697b6GM0eRCqk=
Date: Mon, 18 May 2026 11:35:02 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Charlie Jenkins
 <thecharlesjenkins@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Ard Biesheuvel <ardb@kernel.org>,
 linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH v10 0/8] lib and lib/cmdline enhancements
Message-Id: <20260518113502.11a2f420d48f79bb7de31c67@linux-foundation.org>
In-Reply-To: <20260513134407.884033-1-dmantipov@yandex.ru>
References: <20260513134407.884033-1-dmantipov@yandex.ru>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Wed, 13 May 2026 16:43:59 +0300 Dmitry Antipov <dmantipov@yandex.ru> wrote:

> This series is a merge of the recently posted [1] and [2]. The first
> one is intended to adjust '_parse_integer_limit()' and 'memparse()' to
> not ignore overflows, extend string to 64-bit integer conversion tests,
> add KUnit-based test for 'memparse()' and fix kernel-doc glitches found
> in lib/cmdline.c. The second one was originated from RISCV-specific
> build fixes needed to integrate the former and now aims to provide
> platform-specific double-word shifts and corresponding KUnit test.
> 
> This series was briefly tested on X86, RISCV32, ARM, and MIPS using QEMU.
> 
> Getting feedback from RISC-V core maintainers would be very helpful.
> 
> Special thanks to Andy Shevchenko, Charlie Jenkins, and Andrew Morton.

Thanks, I've added this to mm.git's mm-nonmm-unstable (and hence to
linux-next) for testing.

AI review asked a few questions - please check these out and decide if
any updates are desirable.

	https://sashiko.dev/#/patchset/20260513134407.884033-1-dmantipov@yandex.ru

Also, please cc linux-kernel on patchsets?  I'm not subscribed to
linux-riscv or linux-efi so my "check lkml archive to see if I missed
any emails" trick doesn't work.  linux-kernel's main purpose nowadays
seems to be "the place to archive patchsets".


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
