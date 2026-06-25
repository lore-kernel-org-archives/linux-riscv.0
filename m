Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45684CDE001
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 17:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qeLlALXWmG9MF8Cq4fTeUYIbK1epnys0nje0IBjnB8=; b=YMqSc0FljY+Sko
	xznzKpEXidfvA2xIv7m3RRW2BVBYDz7sZ3nKDe4PSeEbc7saw5u0RmXCRqnkaN+Wb/4yJ2xS0j0AA
	vMAn6Xa/rIRLp/dJaI30xqbSu3qLy1sVNASBm4OZpJTLxYwVxUsS8HCXD5XP/LNY82mUP994KPMzm
	jCjZ9jvX332xSaffiBRn8zNv+lThN72AycTaYI8bLxzv5pb0MB5+3ohet0tfew3gCTTOYV4mUf4Nv
	nUCIIHedDFMzJ0SE9s9fpTjW+KngtZowtKcvZ0vue1B0M8AjIjJNCTkAu2g+4n//7QZaZjKDFwSeJ
	3GJ/7ctI1vuCBM691Gkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcoFT-00000009eB7-3abt;
	Thu, 25 Jun 2026 17:52:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcoFT-00000009eB1-0T7F
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 17:52:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA4DA43D24;
	Thu, 25 Jun 2026 17:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C1E1F000E9;
	Thu, 25 Jun 2026 17:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782409942;
	bh=JU0P9IYNNvAPoItpTvJHJtYjPEJqeL7pK8Tyomn1UOQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Wq/w/ZI6K0nWiROJ/bxhRAEOG93VNpkW+CQBn+fSe8iCZF3P1/GCyPEI/1RAnTYkf
	 q5Udt8l62Zab3hFH7HY7CjSt3JLHgpAKh31z92w5RK+/3cBi+nI21IirmCfTBSMSdZ
	 CZE5+2V9SffoWZJVmDNi/HlUGBiAd0Gk2c6SWND8e8h+XLF4TEh4r6txsJC+SHsms4
	 NSjl07U34iYJSERsFkZwvOw8LPOy5ZjIC9gcJgA9t0weTSyeOeoMjhfIfb0sZkTmIe
	 8tQFR0YR9oFi2Uxxe1YbO2noIPvmcLC9753MQQg1O5UmM+Ghk5Sci1a1JaSaXoo2vl
	 kgQ+fsNAT3lPA==
Date: Thu, 25 Jun 2026 11:52:21 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
cc: linux-raid@vger.kernel.org, Song Liu <song@kernel.org>, 
    Yu Kuai <yukuai@fygo.io>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] raid6: fix raid6_recov_rvv symbol undeclared warning
In-Reply-To: <20260622135535.481534-1-ben.dooks@codethink.co.uk>
Message-ID: <0fda7943-d1ec-3bc6-d383-82b2aa9b4743@kernel.org>
References: <20260622135535.481534-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
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

On Mon, 22 Jun 2026, Ben Dooks wrote:

> The riscv recov_rvv.c should have included pq_arch.h for
> the definition of raid6_recov_rvv. Add the include to
> fix the following sparse warning:
> 
> lib/raid/raid6/riscv/recov_rvv.c:218:32: warning: symbol 'raid6_recov_rvv' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Thanks, queued for v7.2-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
