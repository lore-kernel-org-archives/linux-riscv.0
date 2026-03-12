Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916CC105A59F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 13:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ziXFSSyZzEsEf+otbNNQDsxtSOwI/vXL4GLh74rQK+I=; b=tg6QBCxD/ZwC4M
	6vEQ3fKzpf2PjHnlqiCc4Sgk8hUyX9Tj/mF+UdPZFIGo62hLJ5eaIKtX9BxAsabI0YB9njCKaixOY
	KLIjU4nLu+nsVrDaF2/arvvA2VYJYNnb9DL965alwnoQdvWVED0+sKm82VPDsfKAUrNKNGw+0QjOd
	UK61jjYkWEz560e4LYsttz6Raihpng69jI/ase18kTfABziSeI13SEfkozLy3DGy59/+00Mb30cyI
	cdTho58zG1g7WuOg8BV6GSZ5g54M6Dx1kTeFcg8asMf1QQ36G4IfPXrmhJ5jrhcBVFTUYMeHw8eVE
	brEpaeC0jOlj3NqAeOpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gMO-0000000E9Sq-1PCK;
	Thu, 12 Mar 2026 13:45:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gMM-0000000E9SY-1u5O
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 13:45:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B29160137;
	Thu, 12 Mar 2026 13:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BC7C4CEF7;
	Thu, 12 Mar 2026 13:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773323152;
	bh=T80KNNSV0km5WN2ooC4W3mCrtmJiZZqijD5j8dkhdAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eSO7C17Qi6Ic+1XO4k3X3C4s25h7w3l8zK6mz9mgTWGbT1/CGv3d2ttBNYlbG/Y5c
	 jtMvLwg90ZN2yOt9iga0QdfPb1FvhC2duGvWXuXp5FdSUWL6+2qdb4Yn+BzKE/f1n8
	 6loEBP32nvHRqCTKLsit/lhFMJfLEAEZwTRE+rZA=
Date: Thu, 12 Mar 2026 14:45:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: LiuQingtao <qtliu@mail.ustc.edu.cn>
Cc: jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, neil.armstrong@linaro.org,
	bjorn.andersson@oss.qualcomm.com, marex@nabladev.com, dev@kael-k.io,
	mani@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org,
	liu.wenhong35@zte.com.cn, liu.qingtao2@zte.com.cn,
	hu.yuye@zte.com.cn, dai.hualiang@zte.com.cn,
	deng.weixian@zte.com.cn, jia.yunxiang@zte.com.cn,
	bai.lu5@zte.com.cn, yang.susheng@zte.com.cn, shen.lin1@zte.com.cn,
	tan.hu@zte.com.cn, zuo.jiang@zte.com.cn
Subject: Re: [PATCH v1 2/2] LRW UART: serial: add driver for the LRW UART
Message-ID: <2026031201-dense-unrefined-7bf5@gregkh>
References: <20260213093334.9217-1-qtliu@mail.ustc.edu.cn>
 <20260213093334.9217-3-qtliu@mail.ustc.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260213093334.9217-3-qtliu@mail.ustc.edu.cn>
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

On Fri, Feb 13, 2026 at 05:33:34PM +0800, LiuQingtao wrote:
> From: Wenhong Liu <liu.wenhong35@zte.com.cn>
> 
> This commit introduces a serial driver for the LRW UART controller
> 
> Key features implemented:
> - Support for FIFO mode (16-byte depth)
> - Baud rate configuration
> - Standard asynchronous communication formats:
>   * Data bits: 5, 6, 7, 8, 9 bits
>   * Parity: odd, even, fixed, none
>   * Stop bits: 1 or 2 bits
> - Hardware flow control (RTS/CTS)
> - Multiple interrupt reporting mechanisms
> 
> Signed-off-by: Wenhong Liu <liu.wenhong35@zte.com.cn>
> Signed-off-by: Qingtao Liu <liu.qingtao2@zte.com.cn>
> ---
>  MAINTAINERS                      |    3 +
>  drivers/tty/serial/Kconfig       |   33 +
>  drivers/tty/serial/Makefile      |    1 +
>  drivers/tty/serial/lrw_uart.c    | 2822 ++++++++++++++++++++++++++++++

This really is a totally new uart?  No relation to any existing devices
at all?  Why would that be created?

Anyway, this doesn't seem to build properly, how was it tested?

> --- a/include/uapi/linux/serial_core.h
> +++ b/include/uapi/linux/serial_core.h
> @@ -231,6 +231,9 @@
>  /* Sunplus UART */
>  #define PORT_SUNPLUS	123
>  
> +/* LRW UART */
> +#define PORT_LRW	124

Why is this id needed?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
