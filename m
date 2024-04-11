Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112FBCD1284
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 09:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfgvwW7UI2R3wm2H1P3dvP3FY64n8k10qHlCyPmdhgE=; b=U8YjLYp4+jcjay
	Nf+puSjRAc/vMNCnRPIlW5L4LidAUKzLByZVJkCh+W//wtTgjp2yXFnbQsownAZjSMmuZPKNxzO1W
	LR5WVCfNjT3XhPqhpBK5eH0NNiAhPe8QkVfP4X01SAfmezh6NHW3hDTwF0FP2+TEoNbl/9nhKWXlo
	Juk1dBIWolf/mt1ftEnU0YuhAxHLBYJ9oueQP2lr7Qb2duSppcJgxU3EjxoIik0OCoItcG3/0wAfW
	0yM6eZnYQ2lC9LjOt73w6sC9kOSKxi9nQi5he2Dp2nRac91mTDKm7ER207+aLYDkD+4ye7wF3NM/t
	Eb+NOmk/WUECfwFYMS+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruql8-0000000BKiR-1eD0;
	Thu, 11 Apr 2024 09:30:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruql5-0000000BKi0-0myL
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 09:30:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3789E113E;
	Thu, 11 Apr 2024 02:30:43 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7149F3F6C4;
	Thu, 11 Apr 2024 02:30:12 -0700 (PDT)
Date: Thu, 11 Apr 2024 10:30:10 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] ACPI: PPTT: Populate cacheinfo entirely with PPTT
Message-ID: <ZhetojJewygmTf6N@bogus>
References: <20240407123829.36474-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240407123829.36474-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_023015_296617_BE166678 
X-CRM114-Status: UNSURE (   6.57  )
X-CRM114-Notice: Please train this message.
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

On Sun, Apr 07, 2024 at 08:38:28PM +0800, Yunhui Cui wrote:
> When the type and level information of this_leaf cannot be obtained
> from arch, cacheinfo is completely filled in with the content of PPTT.
>

Which platform is this ? Is this arm64 based or something else like RISC-V
based ? That would help to understand some context here.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
