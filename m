Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C884BC3601E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 14:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AC7sE9Pe0utcGaHm3AJzQvs2bTH4zPrzvvAtLnIHSsw=; b=vSMTG1tDn3YfFo
	Ns1hHrXnfkFr3wDIq8D0GG8yjEFs3ZkoRXPuJPH+yGvq1tqaE8W0c55LhDfVcALmg+2HuadCeJnv+
	o7P3qcvYnoCkkRsHvk3jvZkBO9ahXJ41g1WFToK9uB+voE+3TD/BUGkLOJxqqvqhkxPKZAB+eRXaY
	xJbj8UbOa2Z60QfaA2UWfmg5aS6zdYRpv736d7SbtQlX90a3i/gZfg3lp5zr5bV51kt0GnE+U15Pc
	w9V5L+/svC96JkUgaGlRykIhSk/HtwmpBD7f5mRSjtw9Nj+1o8Lt0WYTW4ZJjSwUFLos2V/svZ6Ho
	koZtcQe7FgNTDG0m7fvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nQB-00000000inU-3GQe;
	Mon, 07 Apr 2025 14:25:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nJm-00000000h9H-0xa6
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 14:19:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 95EC15C5E47;
	Mon,  7 Apr 2025 14:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F14C4CEEC;
	Mon,  7 Apr 2025 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744035557;
	bh=GjGaoAAE9MKbGwuqWCzyfmhuFwEKdCeeIbdKCd9ibFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b+f1yaJ+ILi+Gv1CUx81xTjEJCIdg58gl4Q11D6u0Bro/5+2ufums6D6TJc3vMGGU
	 QPEvh6yz7Ks/PQxZyKeWD7cIk6m0OnabmzLwCAr9UkTCInEM3T9pXwy/2tr1DZCRHZ
	 ZlN90fBYh0ZDZjEKHPgnNkf3BAx3RP4m9mvuXryCXvnwquJebXpqZDxicgEG2ZBK5e
	 uxb2Fi/Uw4DwXcewGnzxm4Y0JZwaGWNVhJnIlj7bdC0x+nLxuSFjhUGl418K5c3bGM
	 nyBaWNN61q+Y99DGJEb+jgKoAasOhDw6geTW7Wby5AyTNvwzsNAZN9I34uWBQ/msDB
	 bvW3KiGeykEAQ==
Date: Mon, 7 Apr 2025 09:19:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: linux-riscv@lists.infradead.org, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, tim609@andestech.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-kernel@vger.kernel.org, tglx@linutronix.de,
	aou@eecs.berkeley.edu, daniel.lezcano@linaro.org,
	conor+dt@kernel.org, alex@ghiti.fr
Subject: Re: [PATCH 6/9] dt-bindings: cache: ax45mp-cache: allow variable
 cache-sets for Andes L2 cache
Message-ID: <174403555555.2295519.2830969748366451702.robh@kernel.org>
References: <20250407104937.315783-1-ben717@andestech.com>
 <20250407104937.315783-7-ben717@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407104937.315783-7-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_071918_314006_D5C0C01E 
X-CRM114-Status: UNSURE (   9.44  )
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


On Mon, 07 Apr 2025 18:49:34 +0800, Ben Zong-You Xie wrote:
> The current device tree binding for the Andes AX45MP L2 cache enforces
> a fixed number of cache-sets (1024). However, there are 2048 cache-sets in
> the QiLai SoC. This change allows both 1024 and 2048 as valid values for
> "cache-sets".
> 
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../devicetree/bindings/cache/andestech,ax45mp-cache.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
