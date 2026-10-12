Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85859CA9EC5
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 06:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:To:References:In-Reply-To:
	Mime-Version:Date:Cc:Subject:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3xDpvjNY4rk9ovUCY658SiUyPbKHEQJ02az5JLd6Jsg=; b=D6PoEF2KqzhLjl
	WGcLIhBHhNL8LKUxu7LJKcMZwVlXJuBtaOeIKxwAK8dmVPJq9Qv3lnkv3mDnXKK7Oe+fFshAc5w7v
	msadvX5CAuuxCibVNfzD1DOBH2T2QF7oKYkSVu7bzZEWPyCFOeLkqfXsR/dWVKATh/wGOadTYAD8v
	+8Irf76/owZ7YCT49NxecQWTdqEGW8NADYjSkF16ET5yw8krsFOg3zbJtP5EK9Fy/5FgqTKNEa4ET
	uCGu8eMh2U5YnIi6vhwpZD8gFb1uaYYX0vSFpnYdXcI9BDKeIMlTg1QP29G1b2lAcfQ7H1bTLZRXx
	o3lMuv2fln0BeHtLEI2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9kN-00000009l9R-1Kpg;
	Mon, 12 Oct 2026 06:42:55 +0000
Received: from va-2-26.ptr.blmpb.com ([209.127.231.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9kK-00000009l8z-031F
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 06:42:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1791787360; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Fm4gVb3q3IClBDIHIk90YPXdiwKvVaIDTRBxEU3UUjs=;
 b=aZuP31kyl+aObWNLK+0ZyJuS9aCWuqIvlWf5qE1rc/074b2Ryc9ldWnzaT/WP7voB/VUEY
 0oV5eZRO8Uf1a73vGA73lKxbuUPv5Ol01/prt18k7z/l9VanCAuCT2P5lI/vAfe8B9fjHr
 /JVosM+No7UN14bc+PDplpdD2pZ5BV5gxUOuWM+uHPnNZc3kNBz7QxZk3w0FG6AezjWtVF
 ZxSPvnu7RBq55hjsqGhOG4wTFB55Gt7Yaxa0mOZ7iFuiBSHsYKOEPDCk4fpP5GF4MCQTuo
 ZA7RiaVdV7XbfAtDQNyGn9x9GjwlJtxOlksMVNEffrr8oWG9mqwqaMN6bXgjJw==
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: Re: [PATCH v4 0/5] Add workarounds for Picoheart erratas
X-Lms-Return-Path: <lba+26acc815e+ad76a1+lists.infradead.org+yang.yicong@picoheart.com>
Received: from [10.192.33.16] ([114.94.228.66]) by smtp.feishu.cn with ESMTPS; Mon, 12 Oct 2026 14:42:37 +0800
User-Agent: Mozilla Thunderbird
Cc: <yang.yicong@picoheart.com>, <conor@kernel.org>, 
	<wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, <alex@ghiti.fr>, 
	<andrew.jones@oss.qualcomm.com>, <cleger@meta.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>
Date: Mon, 12 Oct 2026 14:42:34 +0800
Mime-Version: 1.0
In-Reply-To: <20260915083305.81913-1-yang.yicong@picoheart.com>
Content-Language: en-US
References: <20260915083305.81913-1-yang.yicong@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
Message-Id: <96d80aaf-5cf3-424e-848b-a98f97e94f92@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_234252_254807_4BA476A0 
X-CRM114-Status: GOOD (  11.92  )
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

a gentle ping for this patchset...

thanks.

On 9/15/26 4:33 PM, Yicong Yang wrote:
> This series add basic errata framework for Picoheart SoCs for handling
> upcoming Picoheart erratas. And add workarounds for the first two
> erratas on our hardware. Also do some fixups and refactor in support
> of the erratas.
> 
> Change since v3:
> - workaround CASQ by patching the system_support_cmpxhg128()
> Link: https://lore.kernel.org/linux-riscv/20260907072149.72031-1-yang.yicong@picoheart.com/
> 
> Change since v2:
> - rebase on 7.3-rc2
> - merge the MXR fix and get_insn extraction into one patch
> Link: https://lore.kernel.org/linux-riscv/20260728094627.94975-1-yang.yicong@picoheart.com/
> 
> Change since v1:
> - factor out a common get_insn for reading userspace instructions
> - fix the issue from reading instructions of a exec-only mapping
> - cleanups and code style refinements per comments
> Link: https://lore.kernel.org/linux-riscv/20260715084724.26578-1-yang.yicong@picoheart.com/
> 
> Yicong Yang (5):
>   riscv: Make get_insn public for instruction fault handling
>   riscv: insn: Support decoding of CBO instructions
>   riscv: errata: Add init framework for picoheart errata
>   riscv: errata: picoheart: Add workaround for cbo.clean errata
>   riscv: errata: picoheart: Add workaround for AMOCASQ errata
> 
>  arch/riscv/Kconfig.errata                    |  34 +++
>  arch/riscv/errata/Makefile                   |   1 +
>  arch/riscv/errata/picoheart/Makefile         |   5 +
>  arch/riscv/errata/picoheart/errata.c         | 242 +++++++++++++++++++
>  arch/riscv/include/asm/alternative.h         |   3 +
>  arch/riscv/include/asm/cmpxchg.h             |  21 +-
>  arch/riscv/include/asm/csr.h                 |   1 +
>  arch/riscv/include/asm/errata_list.h         |  25 +-
>  arch/riscv/include/asm/errata_list_vendors.h |   5 +
>  arch/riscv/include/asm/insn.h                |  63 ++++-
>  arch/riscv/include/asm/processor.h           |   2 +-
>  arch/riscv/include/asm/vendorid_list.h       |   1 +
>  arch/riscv/kernel/alternative.c              |   5 +
>  arch/riscv/kernel/asm-offsets.c              |   6 +-
>  arch/riscv/kernel/cpufeature.c               |   3 +
>  arch/riscv/kernel/entry.S                    |  14 +-
>  arch/riscv/kernel/traps.c                    |   4 +
>  arch/riscv/kernel/traps_misaligned.c         |  52 ----
>  arch/riscv/kernel/vector.c                   |   6 +-
>  19 files changed, 423 insertions(+), 70 deletions(-)
>  create mode 100644 arch/riscv/errata/picoheart/Makefile
>  create mode 100644 arch/riscv/errata/picoheart/errata.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
