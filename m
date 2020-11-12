Return-Path: <SRS0=fdZL=ES=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DACDC2D0A3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 13:17:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 920D12085B
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 13:17:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G0M7gKfW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 920D12085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MdqPXvUhHn2AZ7+lm+oiqsJpYPCWNXez79pwpI+8pgc=; b=G0M7gKfWgSFyH0w0Z1uw7gSUz
	YIDPluw937orY7RcoRG/nqS/fToIm20H4vEfCNPsflmUufIVZUC0/1j0JLp90dinIlejYMC+9vCEf
	FVFP6kNv8cfGMpbmI8ZEUwbQvmhXt2cAz0VCK6kBhEDyyYgEVN2q1fI7mkpPgfIrf63rMR7mb55Tj
	jMDGz/DpCSZlsXHLhhGhwWY4nb90rYvVYznzMZx/TPvR8C8KD/tP+jeApmxTqvX4PT+kWYt6vD2vp
	zBAD4ag1E8Gmr3WN5wj0mlltiTz3lYZYQivfJAjNVE0wEtPrDJrX09gmX3OXUh1BEqVXrGgjLMo69
	KtxSjVpNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdCU2-0001mp-U6; Thu, 12 Nov 2020 13:17:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdCTz-0001m3-6t; Thu, 12 Nov 2020 13:17:48 +0000
Received: from gaia (unknown [2.26.170.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 518D12085B;
 Thu, 12 Nov 2020 13:17:43 +0000 (UTC)
Date: Thu, 12 Nov 2020 13:17:40 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64: Change the location of DISCARDS
Message-ID: <20201112131740.GN29613@gaia>
References: <1604486932-18889-1-git-send-email-tangyouling@loongson.cn>
 <20201105214738.GB8600@willie-the-truck>
 <759a51ad-8b2e-24bd-52f5-99769ff5557c@loongson.cn>
 <20201106090737.GA9496@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106090737.GA9496@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_081747_380230_F41B1C3A 
X-CRM114-Status: GOOD (  16.12  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, tangyouling <tangyouling@loongson.cn>,
 ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 06, 2020 at 09:07:38AM +0000, Will Deacon wrote:
> On Fri, Nov 06, 2020 at 09:06:42AM +0800, tangyouling wrote:
> > In the include/asm-generic/vmlinux.lds.h:978, the description is as follows:
> > DISCARDS must be the last of output section definitions so that such archs
> > put those in earlier section definitions.
> 
> Sure, I see that text, but I don't get why it matters. It would be nice to
> have some rationale as to what could go wrong if they aren't at the end,
> so we can improve that comment and avoid the inevitable regression in the
> future when things get shuffled around.

Maybe on other architectures or some old toolchains made a difference in
the resulting binary image size. It doesn't seem to be the case for
arm64.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
