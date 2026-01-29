Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC41FD358E0
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 08:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2X+ZmjfIRp4WQza5RrrbVbg7vZn3e+LU41ffLeEsG4=; b=kA+3epS4tmfuC6
	encW9pBPSgusREBiXNZB9X4p0VFFV/7gGqlSA8tRjRTuUcyXca9N62jPut8ULPj2QxRfAGItdwlys
	8w7vsL4qcaez8XjV/k/d4X9HPtdFcche0oyXRqtMvLRIi1JnRf3VwdHr9YMQjJoMjdzTsW2OKkv5v
	ImSm2YvhopEiqYvewRpPiCEUzlFXohUtggl9ql+tjB7WbDhUJLmu11a6lRA3Jvc/oiW5694ebljWk
	6+L0Dz5faDwlx6O+HTKyd7LlY8rVbyxAXM0rUfi9fw1Mo6ts1YmeadAQP65fIzJLE39eolJLkSmF2
	K5jqfaEsWI4PYDh29s0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNJy-0000000HSD0-0YYe;
	Thu, 29 Jan 2026 08:24:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNJx-0000000HSCs-0ax1
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 08:24:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B68E6001A;
	Thu, 29 Jan 2026 08:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500B5C4CEF7;
	Thu, 29 Jan 2026 08:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769675047;
	bh=R6TXWjTNCaE5AzthwywAMdfo2/yy5F8CD4Qfds49V5Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=W/h+6m4xplRhqbh/THpe2Hyw+CP6HV1Cw7NX2B3XGGpP3U6JZF9YFINP+tou5NOO7
	 AK5oAugshKrByUBZ1N3dj12OnVIQ+/boRH0VZ+VtBAWcTmtqA8K9RpuDTbHzcnJKHe
	 VzBXgkkWGGIOCFTqJzCy4qmG5B5IrmJktvmPnPH10Yh1oM7memKDl5/X2eEX1AzKdS
	 BYXGMo/LdkNY3D36+f6N5f4CoS+/nA0UErrdijnmRtk6Qx+2IOCs1isp+GwoanmWBt
	 GaNvd2ArZfmfAB5T8s1t/RglTIRbVtQa6iFO8z2UtGYeUF+YJeCdpGwVUbQmNGEk4V
	 Q1f4C1d5nGR9g==
Date: Thu, 29 Jan 2026 01:24:03 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
    stable@vger.kernel.org
Subject: Re: [PATCH] riscv: compat: fix COMPAT_UTS_MACHINE definition
In-Reply-To: <20260127190711.2264664-1-gaohan@iscas.ac.cn>
Message-ID: <a5dcb225-0e94-5cf9-450c-010fa8e53533@kernel.org>
References: <20260127190711.2264664-1-gaohan@iscas.ac.cn>
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

Hi,

On Wed, 28 Jan 2026, Han Gao wrote:

> The COMPAT_UTS_MACHINE for riscv was incorrectly defined as "riscv".
> Change it to "riscv32" to reflect the correct 32-bit compat name.
> 
> Fixes: 06d0e3723647 ("riscv: compat: Add basic compat data type implementation")
> Cc: stable@vger.kernel.org
> 

No blank lines between tags, please.

> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Thanks, queued for v6.19-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
