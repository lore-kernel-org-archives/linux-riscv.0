Return-Path: <SRS0=Fr2v=BH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E485C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 10:45:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3053C20786
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 10:45:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aG5LxpJ2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rFUcMCUj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3053C20786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v2+ek4NJeLQ+9Nf1ucE9m/CyTNUpUpQDIiSXbqiSmI4=; b=aG5LxpJ2jv10Gn1Kek2ub7Qar
	R/zRbfFt1toQnFdBsPDW5fZCZCzdpvDn4SCKQSWxzaUpFn22fynzii6oO17+8CDashM6rHPmccJaD
	xJC+O2SpWMFV5pgpqNM7SCn+5IIt4uf9FY/PLCq4bgVtTkkJMN4lycFJZS4SaPaKp5kKgzVdCv5h3
	S7dZ/DyqU2+8WU1AbKy72u8TuhsbKsL+ltYrQMvrdSkeOe4k1gQQBXn6ZwoVwoKt7/IpPW4PuYE4R
	cAapyRfE6oIUz2XC2OALt/w3NgZQJQj1tL0hX6rNGtqiDfbpBMHKKxAdNRfaEd8lSC9WEF02ym7Pj
	Pp6RruZ4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0N6L-0000N0-5s; Tue, 28 Jul 2020 10:44:53 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0N6D-0000HQ-DM; Tue, 28 Jul 2020 10:44:46 +0000
Received: by mail-ed1-x541.google.com with SMTP id c15so4788867edj.3;
 Tue, 28 Jul 2020 03:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3Jtd/NLDfEi5mS55S0K4WbnSIzqpGJbZScZKeEtsXAQ=;
 b=rFUcMCUj2AwdC69csGGjJVjr3K/8WS4HC4QuFwZtg451Qj4L37BpO16QBPnCSOnEqP
 0XLFh6CAcMNi+86g1xCyy/bqdVTYRHcM+S9kEIZb7EWJKKOmGB7fGMyBy9goHLKaJvij
 l3J//FegCgxfC20hSO+SeOOi0ojcNdANd874jllkW9bgWXdBSGjDZ+KKsJ5ItnWu5ElM
 TutsV7Y/UWKyR2rEXX1BEUlxaWMHKF0PMaSsOZWNK/0D0ZH9xxW9nIbDP8AygACtKk6q
 SuVbplxJKZehbky/ztC2U7bihOneNjqjj52Fn1yyk39lDMDQeAEZqoI3viUUxFXSv5vl
 9XJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=3Jtd/NLDfEi5mS55S0K4WbnSIzqpGJbZScZKeEtsXAQ=;
 b=Dq/LreK3rmzLx0Di8JRwWWoR+z/jkrcXLlWPc800mRPn4grp9vXv+na37uXfl25lIu
 EAPDTvHw3QE9rbr3d6ts6f0oCRR8LjtX4Pm/Jgrn0G9mJACSUl0kqgTetmZmXPUT4Ik0
 dRuAde7uECIe0ABNX0AK88r2njXwnV8P745jzCZHm/5QDGky5qujYtnpCAhuxMpSO5cy
 HodYa1WKp8rZbCgD8JUIDwr4xXq/XqOtyh2+ZnFGh32Wkixmt0J9OxqDSvy9Vh7CD9Tz
 Jp1Rx2XeuVytOAiWmmYvvpc/6Oby278TZjC/xj2GcK3yCSePJgVE5WLjZTABJOBp7jVF
 rKkA==
X-Gm-Message-State: AOAM533wYXtKQoYKZEaiLcx73gVwMEqlhbCCkga1d5RiCH1ssqwV50Cg
 NGpvVz1qU7F9zen2YCP1HtI=
X-Google-Smtp-Source: ABdhPJztizS2/FT37W5GVOnd6egL7RbIXP7ubjCB3LMqpraJ3F9fNNOV7TQhtwANWplTQvf13TbOQg==
X-Received: by 2002:aa7:dd15:: with SMTP id i21mr12013673edv.153.1595933084517; 
 Tue, 28 Jul 2020 03:44:44 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id cf10sm460841ejb.4.2020.07.28.03.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 03:44:43 -0700 (PDT)
Date: Tue, 28 Jul 2020 12:44:40 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 14/15] x86/numa: remove redundant iteration over
 memblock.reserved
Message-ID: <20200728104440.GA222284@gmail.com>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-15-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728051153.1590-15-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_064445_519811_13F3BD73 
X-CRM114-Status: GOOD (  14.82  )
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


* Mike Rapoport <rppt@kernel.org> wrote:

> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> numa_clear_kernel_node_hotplug() function first traverses numa_meminfo
> regions to set node ID in memblock.reserved and than traverses
> memblock.reserved to update reserved_nodemask to include node IDs that were
> set in the first loop.
> 
> Remove redundant traversal over memblock.reserved and update
> reserved_nodemask while iterating over numa_meminfo.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/x86/mm/numa.c | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)

I suspect you'd like to carry this in the -mm tree?

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
