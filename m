Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC925C02195
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 15:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=403kRKJ7YtR6a+zAlwxoQRjSPh8zXoThEX2TAb6h7BY=; b=jmpMf4zGAp3pXw
	y+QZ+7FTB7djosXo3h7CRZjOZ8lKaN5sN/4i20SI8N+NrpCde5IlSPNPCZVeUY5uSPou+VHaCzhYv
	m6kFPuVNjf+IwU3sNFCm2knQ2eCl36bDx2gOfzTYMzZjSizzFNP+YFZsoewBXgdMZCGTK0xJ72pLH
	h2IISjD9leKRaLxznX8PJCCaCthD6FjaCZ/Hw3SLDh5GtDlvA5yUYJHDtkCa0zRg+Tbenjx2W6F9o
	TPgjDFSr9Q6ZsgQ3dIS2FyIPZzP9T52Calyh54TdLi0TVG7hGf2IHqGrH8tHQx4BdHXhVPDpJlJ/B
	CgoRTrupVP/OK6Hg1oaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teyc4-0000000FuNh-3NWS;
	Mon, 03 Feb 2025 15:43:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teyZP-0000000Fu0d-2ybZ
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 15:41:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AE767A41502;
	Mon,  3 Feb 2025 15:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F0F4C4CED2;
	Mon,  3 Feb 2025 15:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738597266;
	bh=t+e9M1T7gZCHqn15b4A9fYXOSiUPiS6xvK01k5AQCmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r3XnTynnOTgsMtTNZO+Y1s25XmD2mIHCFryVo7nwyZI3zyudiqt6et+qxVlGT1B3r
	 pLYigZcxI3ih+eNjJ8EpjVzU1RPmO/yjtmjv1XJcDcwKrbHtRWX9ZZcA8Bc0LZhyeO
	 WZUUX39QMbBMfXqpEs6rdmznsK9cTbI85PX26Ma0=
Date: Mon, 3 Feb 2025 16:41:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: guoren@kernel.org
Cc: palmer@dabbelt.com, conor@kernel.org, geert+renesas@glider.be,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	yoshihiro.shimoda.uh@renesas.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>, stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V2] usb: gadget: udc: renesas_usb3: Fix compiler warning
Message-ID: <2025020324-siding-custodian-b21d@gregkh>
References: <20250122081231.47594-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250122081231.47594-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_074107_810545_812F3044 
X-CRM114-Status: UNSURE (   8.94  )
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

On Wed, Jan 22, 2025 at 03:12:31AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> drivers/usb/gadget/udc/renesas_usb3.c: In function 'renesas_usb3_probe':
> drivers/usb/gadget/udc/renesas_usb3.c:2638:73: warning: '%d'
> directive output may be truncated writing between 1 and 11 bytes into a
> region of size 6 [-Wformat-truncation=]
> 2638 |   snprintf(usb3_ep->ep_name, sizeof(usb3_ep->ep_name), "ep%d", i);
>                                     ^~~~~~~~~~~~~~~~~~~~~~~~     ^~   ^
> 
> Fixes: 746bfe63bba3 ("usb: gadget: renesas_usb3: add support for Renesas
> USB3.0 peripheral controller")

Please don't wrap lines here.

> Cc: stable@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501201409.BIQPtkeB-lkp@intel.com/
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>

No need to sign off twice on a commit, I'll just drop the last one as
that doesn't match the From: line here.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
