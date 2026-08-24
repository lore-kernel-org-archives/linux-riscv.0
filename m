Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75C3C5DF94
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 15:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I0LYsPkcQ0aAP2mhb7o3T6YQsDRk/wQhfYxaUUuVwjk=; b=aQeUYP81woMLnJ
	R4cmwK8EqYx7PgEhxdTD/KlgasiT/iIWNx9zHzrMG6utykTB3zjWNOqOe2gbBqk1vhm/E9EXNlHdH
	cyhYnmV+T56oIplhv2Ytv3rMAMgT6DdeWOQtrwiQxTx6bvTZgDr9GHxn/uwbMAc1dn0ipRVmeBtg7
	1EddMB3ZojyzpQujakPy3Io9wuu58IvdXxJXESzkbHbZexudIxyCn5TCNvgJK82KWlP/RkXFDm9Aj
	Ifjk9qVQXJTj5SS5MJZCqTQVwvCopv2pdtIZAUhS1pIK/uvNkeEiFKThhqZxLjYMhfWSFuKBEHKMV
	6MCr1mLioXqowDqFHh7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWa0-0000000GvMi-1fMA;
	Mon, 24 Aug 2026 15:27:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWZx-0000000GvLV-1vOa;
	Mon, 24 Aug 2026 15:27:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D0F3C40708;
	Mon, 24 Aug 2026 15:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00BFB1F000E9;
	Mon, 24 Aug 2026 15:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787585236;
	bh=hWqZ6E/rpLHflNJIRN+si29gzxrcJ8/c9XXZU6wdsnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gy+J1A/kIndBp1Kh3XXNb3phBhcrivN6jLnEuqv15VGWu8qbHER4jx1CzzwtNm4rV
	 go4PHDbRk+M2eFHzHPgAsxNVtW7yjHmQaOZ/DviZNSnKlDDVFoZHZDO7tMcmdLt0lO
	 6bvAWbE+IC1lRSs1nI9aGKzUU4OIlC12e8FMnZZ0EOfGKjZTwvQUl+Wp+/uKwcU8Xh
	 2jEu2uDHuefqj8kqdUpktxFWlNxfdvsMq38Vk7xxXNlSNo4hImNWmzaOmXcQS4RDUj
	 kUpZUgvhvsS2I0FmGTnY+1i+1Cxu20YEoeK13Ck2kB5bJZG9S+NFb3snlKbeSNu/dt
	 nNVvGL7nwc2Iw==
Date: Mon, 24 Aug 2026 16:27:14 +0100
From: Simon Horman <horms@kernel.org>
To: Rui Qi <qirui.001@bytedance.com>
Cc: kexec@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/2] kexec-tools: Fix split crash kernel reservations
Message-ID: <20260824152714.GA102316@horms.kernel.org>
References: <20260818123504.12022-4-qirui.001@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260818123504.12022-4-qirui.001@bytedance.com>
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

On Tue, Aug 18, 2026 at 08:35:05PM +0800, Rui Qi wrote:
> Hi,
> 
> This series fixes two kexec-tools issues seen with split crash kernel
> reservations.
> 
> The first patch makes --print-ckr-size prefer
> /sys/kernel/kexec_crash_size. This restores the option's original
> user-visible contract: report the same crash kernel reserved size and
> unit as the kernel sysfs attribute when that attribute is available.
> The existing arch load-range based calculation is kept as a fallback for
> older kernels.
> 
> The second patch fixes the RISC-V kexec_load crash path. RISC-V records
> all Crash kernel ranges from /proc/iomem, but it currently writes only
> the selected load range to linux,usable-memory-range. On systems with
> high/low crash kernel reservations, that prevents the crash kernel from
> seeing the low reservation after boot.
> 
> Keep placing the crash image segments in the selected load range, but
> pass all crash kernel ranges to the crash kernel through
> linux,usable-memory-range. This follows the split-reservation handoff
> model already used by arm64 kexec-tools, where
> linux,usable-memory-range = <BASE1 SIZE1 BASE2 SIZE2> advertises both
> high and low crash kernel ranges to the crash dump kernel.
> 
> Tested on riscv64 with:
> 
>   /proc/iomem:
>     f7e00000-ffdfffff       : Crash kernel  (128 MiB low)
>     1f88c00000-1ff6bfffff   : Crash kernel  (1760 MiB high)
> 
>   /sys/kernel/kexec_crash_size:
>     1979711488
> 
> With the patched kexec binary:
> 
>   kexec --print-ckr-size
>     1979711488
> 
>   kexec -c -p ... followed by a panic completed kdump successfully.
>   The crash kernel reported both ranges as System RAM in /proc/iomem:
> 
>     f7e00000-ffdfffff       : System RAM
>     1f88c00000-1ff6bfffff   : System RAM
> 
> The vmcore was saved successfully.
> 
> Rui Qi (2):
>   kexec: Print crash kernel reserved size from sysfs
>   RISC-V: Pass all crash kernel ranges to crash kernel

Thanks, applied.

- RISC-V: Pass all crash kernel ranges to crash kernel
  https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=6b8b27fbe5cc
- kexec: Print crash kernel reserved size from sysfs
  https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=97061549e25f


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
