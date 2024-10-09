Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2D9CED61E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 07:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BPDPNIA78xL/bKMAieDSD4c1cssiVOddTS6FRAVV6Jk=; b=thyk01uc60TjpJ
	33JE84Nlr1+q3/wjcg/Lof6IQsw9D6+L+b+k6MIGXuyVjnTuYfDaof5/rji+qA/FUjPv7k7DOgNZZ
	MKGUvfhPkfb2EBGEmNQyOEMhQaZkAB2LcRaNd7zChmrg97NsOi0U8RqRPdwMHlL7MuzYJAqb1f/3u
	dGCIL65216XQ0Ywion07iHxwURjTGzx90tuoq48vjedWZnbNWaoLAl34ZD9ULp+JyA+5ggvPtlM01
	gXEeVQPohTrP43Ejoer7Go4Of8OSRHgiDrM98i+0vYleP8fTOIblhiLWImc6gbIsJa1/NUi6mIzgi
	f+qVDOL7GPDsx032+Mhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syRaN-00000008LFH-39jL;
	Wed, 09 Oct 2024 07:58:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syRXo-00000008KIy-1c2d
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 07:55:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BFDC3A439FD;
	Wed,  9 Oct 2024 07:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642BCC4CEC5;
	Wed,  9 Oct 2024 07:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728460539;
	bh=oCAOo8Bdc/kr0LgFyMUbMXb2BpaSFaCjRK7n2HuwAko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BZFuJ9JMTj8mUD7SeHthX8fQF227odujYoOWwGg7Q1zYWxuUDM4cYJUqwEhSeaZ45
	 2m+HA2sNJqbaEO4/1YOzWIXNl02EQEDapyEDdQlQ8iN+k5ii0kcJDYHQgolRayVH6U
	 vG+Ujlx3rpjgPVlKIL4wc2fAZYsel9nEQYwrzvmI=
Date: Wed, 9 Oct 2024 09:55:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: ericvh@kernel.org, lucho@ionkov.net, asmadeus@codewreck.org,
	linux_oss@crudebyte.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	m.grzeschik@pengutronix.de, v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] net/9p/usbg: Fix build error
Message-ID: <2024100910-distrust-cornhusk-a8bd@gregkh>
References: <20240930081520.2371424-1-ruanjinjie@huawei.com>
 <2ff5834d-cb88-39f5-168d-8e179f152757@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ff5834d-cb88-39f5-168d-8e179f152757@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_005540_622127_E1391C8E 
X-CRM114-Status: GOOD (  16.78  )
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

On Wed, Oct 09, 2024 at 03:49:22PM +0800, Jinjie Ruan wrote:
> Ping.
> 
> On 2024/9/30 16:15, Jinjie Ruan wrote:
> > When CONFIG_NET_9P_USBG=y but CONFIG_USB_LIBCOMPOSITE=m and
> > CONFIG_CONFIGFS_FS=m, the following build error occurs:
> > 
> > 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_free_func':
> > 	trans_usbg.c:(.text+0x124): undefined reference to `usb_free_all_descriptors'
> > 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_rx_complete':
> > 	trans_usbg.c:(.text+0x2d8): undefined reference to `usb_interface_id'
> > 	riscv64-unknown-linux-gnu-ld: trans_usbg.c:(.text+0x2f6): undefined reference to `usb_string_id'
> > 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_func_bind':
> > 	trans_usbg.c:(.text+0x31c): undefined reference to `usb_ep_autoconfig'
> > 	riscv64-unknown-linux-gnu-ld: trans_usbg.c:(.text+0x336): undefined reference to `usb_ep_autoconfig'
> > 	riscv64-unknown-linux-gnu-ld: trans_usbg.c:(.text+0x378): undefined reference to `usb_assign_descriptors'
> > 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `f_usb9pfs_opts_buflen_store':
> > 	trans_usbg.c:(.text+0x49e): undefined reference to `usb_put_function_instance'
> > 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_alloc_instance':
> > 	trans_usbg.c:(.text+0x5fe): undefined reference to `config_group_init_type_name'
> > 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_alloc':
> > 	trans_usbg.c:(.text+0x7aa): undefined reference to `config_ep_by_speed'
> > 	riscv64-unknown-linux-gnu-ld: trans_usbg.c:(.text+0x7ea): undefined reference to `config_ep_by_speed'
> > 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_set_alt':
> > 	trans_usbg.c:(.text+0x828): undefined reference to `alloc_ep_req'
> > 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_modexit':
> > 	trans_usbg.c:(.exit.text+0x10): undefined reference to `usb_function_unregister'
> > 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_modinit':
> > 	trans_usbg.c:(.init.text+0x1e): undefined reference to `usb_function_register'
> > 
> > Select the config for NET_9P_USBG to fix it.
> > 
> > Fixes: a3be076dc174 ("net/9p/usbg: Add new usb gadget function transport")
> > Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> > ---
> >  net/9p/Kconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/net/9p/Kconfig b/net/9p/Kconfig
> > index 63f988f0c9e8..ee967fd25312 100644
> > --- a/net/9p/Kconfig
> > +++ b/net/9p/Kconfig
> > @@ -43,6 +43,8 @@ config NET_9P_XEN
> >  config NET_9P_USBG
> >  	bool "9P USB Gadget Transport"
> >  	depends on USB_GADGET=y || USB_GADGET=NET_9P
> > +	select CONFIGFS_FS
> > +	select USB_LIBCOMPOSITE
> >  	help
> >  	  This builds support for a transport for 9pfs over
> >  	  usb gadget.

Ah, I can take this through the USB tree as it fixes a bug that came in
through there.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
