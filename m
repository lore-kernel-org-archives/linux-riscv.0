Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCE2E7545C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 15:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3DvAGWImOI1iClldaBhrZkO+IHZcosd5PEjBUsZCNKM=; b=ZG4NDuqQX9iG5W
	7TJH79qP3I8/pn3k4bJzpZQN8fR0voKOiNGoDJj1zXtJ91Zq5XJYV/txx/It1CdnnR/TajWxsOrcY
	8KIb2losVxTT2SbtAW05pTRAKV/c4TTLRGntKjyQMhPMkwJt74J4Pe2P5ISU7E8h/d0w94A9fsZ6s
	tUbP0711o1tlXPQJx2f/q3VbK1p3IlRi+w9exd05fM7gUZFsYU045XtvKLH7RFDxDyeDRAyR9aGcg
	vajonO9nNb1Qtuz8g2yfS4wy5wgCorKxE1bom7Q3el/kWYQLEUVF32ENzoHJ0uh/y0IIou33Se9vY
	nLeV4rGstnEEKlb3JtRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRCJ-0000000HAGX-1xnF;
	Wed, 24 Dec 2025 15:54:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRCF-0000000HAEB-1w7c;
	Wed, 24 Dec 2025 15:54:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28E3443931;
	Wed, 24 Dec 2025 15:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD0EC116D0;
	Wed, 24 Dec 2025 15:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766591683;
	bh=gBgZUdgdaIOopU8i+Mbp/KWtjXuza0duQmAUavj0oUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PW0H7t/M7DdJTQMer8paEQT9Htxa0aWSnBgQcv7MiEF+eXbwF1rY94nI1UYrdMzHw
	 vaZtUX9Y7e5EllK3uIsziDjWO92kbF3tLPVZQhUXXJ+lTGcUj1w5dEwL2s/GajD5sd
	 MMS4NCaHMURQW0EzPYED6wNXu4E0WkJVEx+KzzZQ=
Date: Wed, 24 Dec 2025 16:54:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
	aou@eecs.berkeley.edu, bagasdotme@gmail.com,
	catalin.marinas@arm.com, conor+dt@kernel.org, corbet@lwn.net,
	dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org, dev@kael-k.io, haren@linux.ibm.com,
	heiko@sntech.de, jose@osyx.tech, kever.yang@rock-chips.com,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux@armlinux.org.uk, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, maddy@linux.ibm.com,
	mani@kernel.org, nathan@kernel.org, neil.armstrong@linaro.org,
	palmer@dabbelt.com, pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
	will@kernel.org
Subject: Re: [PATCH 2/5] virt: add Bao IPC shared memory driver
Message-ID: <2025122401-drainer-pedigree-45ae@gregkh>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20251224135217.25350-3-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251224135217.25350-3-joaopeixoto@osyx.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_075444_351968_16272B56 
X-CRM114-Status: UNSURE (   6.00  )
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

On Wed, Dec 24, 2025 at 01:52:14PM +0000, joaopeixoto@osyx.tech wrote:
> +struct class *cl;

Why not just use the misc device api instead?  No need for a full class
for just one char device, right?  Or even if you have multiple ones,
again, no need for a whole class.  That should make the code much
simpler overall.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
