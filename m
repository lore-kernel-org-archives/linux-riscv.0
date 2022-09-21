Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B924ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1cRtUxlDf1ZHqBhzTdi4qRImYY+Q+XjICprUqCjBUVs=; b=4dmGazTjqz/FZU
	N/LG8Zq7zcRIjWP9jSVyQUjuqmWTPnXxj1Lo102FM/YaUFFX/heRoXih8xLd0gWrV3bBN1DEFolgx
	JeldTSQrcXwW7MFi4AfAluSgDDAUMc93cC6Hdsydj8fOx8TzWr0oatJxYIk6BOTAZu9Pc6OwXopqE
	ieoLbRb5Oc786HhRO5nRYv2H2HHV0WW5tFCNU3UBBTLnTrjypWrD5CYb37+ijCwYN1R7DSZMcz0EK
	Wf4jhTB/TuwYpl/fd7ujnFyhX+BOTWcN9B2GjIOsSbUtI0nS9U7u3tT5D9VBptJ4MOjpMe7efOZKs
	t0R9J/1snkDr6lBofUFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7Lw-00CjPG-MP; Wed, 21 Sep 2022 21:33:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7Lt-00CjOc-Np; Wed, 21 Sep 2022 21:33:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 09B3BB82965;
	Wed, 21 Sep 2022 21:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D539DC433C1;
	Wed, 21 Sep 2022 21:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663796030;
	bh=/o/C8WBjZU0WtQ0lZ7PQqvBy0u0PM9V+gpKwcGhMpdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=muhOV/8U1MntF0rfcYR+7I7EiBzki5VmmYk9z5mvm6+JKMbPsQQtUS9ZvR2ZKcbqw
	 x704QFWHe/Fod/KyotBkc78uI8vxyh/4MhMK4A/cCCdrwM0wDhglJB1MSIEeVm8P64
	 LmFnz5zeT5hhaeQG6nnm7WXK2IcBI84HRa5GmdQXKCicV7ZjdUDQwIJJtKGLKFM7Uf
	 Pc0UozbcVhiUnMkMP7yZR6yWZLhehX2I2N75BOKf7kmQU6vv5vcyANSHCTRHzZAP6M
	 SpPmAa6wXXjLeV4/jBSTm7BM0aR5cAA0pNlK75haWSIm/zhV9z3RZtffcaaxLHnHRY
	 F2W+LYmEtWh0g==
Date: Wed, 21 Sep 2022 22:33:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Chris Stillson <stillson@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	kvm-riscv@lists.infradead.org, Guo Ren <ren_guo@c-sky.com>,
	Guo Ren <guoren@linux.alibaba.com>,
	Anup Patel <anup@brainfault.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH 02/17] riscv: Extending cpufeature.c to detect V-extension
Message-ID: <YyuDOr5dMospSNzF@spud>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
 <20220921194629.1480202-3-stillson@rivosinc.com>
 <YytwBzdgCSWSPRNB@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YytwBzdgCSWSPRNB@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_143353_959490_2EDCCED7 
X-CRM114-Status: GOOD (  18.31  )
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

On Wed, Sep 21, 2022 at 09:11:56PM +0100, Conor Dooley wrote:
> On Wed, Sep 21, 2022 at 12:46:14PM -0700, Chris Stillson wrote:
> 
> Hey Chris,
> 
> Looks like this only partially made it to the list. The cover letter is
> missing as are a bunch of the patches in the middle, see:
> https://lore.kernel.org/linux-riscv/20220921194629.1480202-3-stillson@rivosinc.com/T/#t

nvm, rest of it seems to have finally made it through now.

> Also, when you run format-patch to generate the patches, please add the
> `-v` flag with a number so that the patchset gets the version number
> added to it.
> 
> Ohh, and Palmer's non-rivos email looks wrong?

Rest still applies though & rerolling as v12 would be nice so that the
tools don't get confused about which version is which since you've now
sent a pair of v1s.

Your SoB is still missing from the individual patches too.

Getting there though, this one is at least threaded & the patches are
not whitespace damaged/line wrapped anymore AFAICT.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
