Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3405BC02181
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 08:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ubb5IK+UygqAqpKxXJslDuTRFQUNm5iHpTILRtwg57g=; b=UU/u2ew6ar33pA
	4aHBU+ZeGphKaXeUoZWxhZ0DmIutVK8yOVI75jkpqexKUfrd9dFx6oUngwQXXS5N1loNzWJw+/Coa
	u9AoZ3UCMmceBOtpSo3bSvDvFHYHFIQ08E72005voesLJIfrz2nO5OTt+AiQK1Ut4Bl0MHoIZMwpC
	lScBs3d8HLe5rey/9HpNguA3qE6VwEM3XEMTyV2T0dIGKzOHj68sSgCryoZGjtOBaz1U4P2/FlFuX
	9csTPAeorufSPxZkY/VhhXCw+MIJtmTNGhYiE3awBAkHjorz5VmGi4fDBAvSJlbscHS+p7n2CjeSp
	ScJzxwZjMvm+nktjCS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taWZF-00000009kPn-0Td6;
	Wed, 22 Jan 2025 08:58:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taWZC-00000009kPD-1qSh
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 08:58:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EA182A41D7E;
	Wed, 22 Jan 2025 08:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D67FC4CED6;
	Wed, 22 Jan 2025 08:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737536309;
	bh=U+gqE+iw4ptpcTIYB9W0f5foTJTvvTyEulF4He7RP2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tyzd1AZyxGRYzU0mkd2o7WtGL4XcE3ZFZAD/wX4z0rMobnewE9KyXk86+qzSc8PEm
	 pq75KvGvj5Xv71VC190HESNQrSRmU9wvpzDVoHxpIIDbXCnEACsUUhO2FQyda9DtU2
	 cwFslqw6I7sU+UTVFq2Z2/jyjEevrCSqllEA323c=
Date: Wed, 22 Jan 2025 09:58:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: guoren@kernel.org
Cc: palmer@dabbelt.com, conor@kernel.org, geert+renesas@glider.be,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	yoshihiro.shimoda.uh@renesas.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>, stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V2] usb: gadget: udc: renesas_usb3: Fix compiler warning
Message-ID: <2025012212-pug-unmasked-a23b@gregkh>
References: <20250122081231.47594-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250122081231.47594-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_005830_621628_C5703C89 
X-CRM114-Status: GOOD (  24.49  )
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
> Cc: stable@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501201409.BIQPtkeB-lkp@intel.com/
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  drivers/usb/gadget/udc/renesas_usb3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
> index fce5c41d9f29..89b304cf6d03 100644
> --- a/drivers/usb/gadget/udc/renesas_usb3.c
> +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> @@ -310,7 +310,7 @@ struct renesas_usb3_request {
>  	struct list_head	queue;
>  };
>  
> -#define USB3_EP_NAME_SIZE	8
> +#define USB3_EP_NAME_SIZE	16
>  struct renesas_usb3_ep {
>  	struct usb_ep ep;
>  	struct renesas_usb3 *usb3;
> -- 
> 2.40.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
