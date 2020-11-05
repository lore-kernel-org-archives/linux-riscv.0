Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414F2C388F7
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 21:47:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBE6720728
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 21:47:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QPaZ1jaf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xc5b+MQE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBE6720728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1Anm5kVwy8ZtAjbf2vVed/cJJmaBuRE8rwjvXeNFpew=; b=QPaZ1jaf5DjTVDmzNQ9fSt9nP
	mV7kVoycBROMRzjfsF/VQe5gpI570V4+XElcVVxlaJORCMAD/2eHc+QeDPZsu0ajpbcG1dhEeKaAX
	OXQEAb5FGDHr8/VgzKfcTv9fQjprH3zJFaXy9GPhCFhCnEMVFvyZieaG0cH9Rv9kySt2T0tYJFJE9
	Q2xAudEN/HfchRJJMxhh8Zb8Et/+TRkwKd2NpwdMP9+Cl9n1+1fUYA/sgGgU2vgCSwfYomOQTGxBe
	C2wMRmu3NPAa0t+xPULa8NWnyAYnaSu5MmvrDL3+s+1bYpx0SlfcHhv7hYIVLi4XPmSMx6Q5ervpm
	MIltI2E9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kan6j-00082O-I4; Thu, 05 Nov 2020 21:47:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kan6f-00081G-0p; Thu, 05 Nov 2020 21:47:45 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 55BEB20728;
 Thu,  5 Nov 2020 21:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604612864;
 bh=znG1McHlXKsc+T0O+cMefkqwbjAjnXOe7uh3LT84mrQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xc5b+MQEFC+wBRMULK1bywdHPkKN8s3nE0edSny2zmi5tirdNSLojIF2u7KIE4Woe
 PasIVscW5Whn+WS3PkGWt8EFpGUW5JONvmlnV9s5PGlkB6CXIZ/I0EtdIQrKKIXsP8
 0JsDfOgVR7xoQbOVAhVWqngbN+HLqG/10tesNOAw=
Date: Thu, 5 Nov 2020 21:47:38 +0000
From: Will Deacon <will@kernel.org>
To: Youling Tang <tangyouling@loongson.cn>
Subject: Re: [PATCH] arm64: Change the location of DISCARDS
Message-ID: <20201105214738.GB8600@willie-the-truck>
References: <1604486932-18889-1-git-send-email-tangyouling@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604486932-18889-1-git-send-email-tangyouling@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_164745_144434_40422E0F 
X-CRM114-Status: GOOD (  12.97  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, ardb@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 04, 2020 at 06:48:52PM +0800, Youling Tang wrote:
> In the include/asm-generic/vmlinux.lds.h file, the "must be the last"
> comment indicates that DISCARDS should be placed in the last position
> of SECTIONS, like x86, mips, riscv, etc.
> 
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> ---
>  arch/arm64/kernel/vmlinux.lds.S | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)

Why does this section need to be last?

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
