Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510A9CF34BC
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 17:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Q0HpgclUVQtxn9pWNijlJ1pVGzoCECgR8MwqHXgIJ4=; b=vzdLPsP4bE/hzExghH6TXn1UJd
	p8kV+XaLW4jixGbPgphmapgFMBjlbNKzaEoLCbIXmnukiZsyAUDwjbLzXj68sXDz9lPENbCw/Cpsw
	Kq7O2cQs0KlWTJBuqiq6kY1QfmBABDLa244fCLz5P9KUtn70LrK2zifBaNOtENILhhuvmzamskay5
	xtnrRWRHhdnrBU8EQrBsckNNHrKz2CEoL+oetkA9nVl+XTqUu8KdE/shmcwc+k549q4Gv4ZCGmdaO
	tjiPHtdMj0GMPnqbzh5xAYsciQSFzYUioKctcSr10qfnC3Lxy6qliStVxvPLeFD1j6pGpy/8qsXWD
	ZpEgJVTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swPmH-00000009zru-0ZEx;
	Thu, 03 Oct 2024 17:38:13 +0000
Received: from relay2.mymailcheap.com ([151.80.165.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swPmD-00000009zrS-23w5
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 17:38:11 +0000
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id 8B27E3E8AF;
	Thu,  3 Oct 2024 19:38:02 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 21CBF4075C;
	Thu,  3 Oct 2024 17:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1727977081; bh=m1yB8Ze6iYF0CL9QqSRczwMHRy9+goP0hLkrZu9n4fs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=DHKUDIWoEo7ugj+8L+DxuHRpikcCzpQjB//Za1NVRBeCs5LFQ5kxzmfW8jlvxDwA3
	 3x0YUynVY9tjk7Gip6YHnahmgMTXGVZqy4IxoqJVZVFct7Art1SsuuqwiTOpXkIhxl
	 sEWNaqthSgGvF1h1t99sVIIfhGKAhVpQO06ea9+w=
Received: from [198.18.0.1] (unknown [58.32.43.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 93CAB42EDC;
	Thu,  3 Oct 2024 17:37:58 +0000 (UTC)
Message-ID: <d1383f52-b1b3-4967-8bd1-abb42fedba4f@aosc.io>
Date: Fri, 4 Oct 2024 01:37:56 +0800
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH] net/9p/usbg: Fix build error
To: Jinjie Ruan <ruanjinjie@huawei.com>, ericvh@kernel.org, lucho@ionkov.net,
 asmadeus@codewreck.org, linux_oss@crudebyte.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, m.grzeschik@pengutronix.de,
 gregkh@linuxfoundation.org, v9fs@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20240930081520.2371424-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Kexy Biscuit <kexybiscuit@aosc.io>
In-Reply-To: <20240930081520.2371424-1-ruanjinjie@huawei.com>
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Queue-Id: 21CBF4075C
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.09 / 10.00];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_103809_728542_9C01A5D8 
X-CRM114-Status: GOOD (  13.72  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 9/30/2024 4:15 PM, Jinjie Ruan wrote:
> When CONFIG_NET_9P_USBG=y but CONFIG_USB_LIBCOMPOSITE=m and
> CONFIG_CONFIGFS_FS=m, the following build error occurs:
> 
> 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_free_func':
> 	trans_usbg.c:(.text+0x124): undefined reference to `usb_free_all_descriptors'
> 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_rx_complete':
> 	trans_usbg.c:(.text+0x2d8): undefined reference to `usb_interface_id'
> 	riscv64-unknown-linux-gnu-ld: trans_usbg.c:(.text+0x2f6): undefined reference to `usb_string_id'
> 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_func_bind':
> 	trans_usbg.c:(.text+0x31c): undefined reference to `usb_ep_autoconfig'
> 	riscv64-unknown-linux-gnu-ld: trans_usbg.c:(.text+0x336): undefined reference to `usb_ep_autoconfig'
> 	riscv64-unknown-linux-gnu-ld: trans_usbg.c:(.text+0x378): undefined reference to `usb_assign_descriptors'
> 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `f_usb9pfs_opts_buflen_store':
> 	trans_usbg.c:(.text+0x49e): undefined reference to `usb_put_function_instance'
> 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_alloc_instance':
> 	trans_usbg.c:(.text+0x5fe): undefined reference to `config_group_init_type_name'
> 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_alloc':
> 	trans_usbg.c:(.text+0x7aa): undefined reference to `config_ep_by_speed'
> 	riscv64-unknown-linux-gnu-ld: trans_usbg.c:(.text+0x7ea): undefined reference to `config_ep_by_speed'
> 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_set_alt':
> 	trans_usbg.c:(.text+0x828): undefined reference to `alloc_ep_req'
> 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_modexit':
> 	trans_usbg.c:(.exit.text+0x10): undefined reference to `usb_function_unregister'
> 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_modinit':
> 	trans_usbg.c:(.init.text+0x1e): undefined reference to `usb_function_register'
> 
> Select the config for NET_9P_USBG to fix it.
> 
> Fixes: a3be076dc174 ("net/9p/usbg: Add new usb gadget function transport")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   net/9p/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/net/9p/Kconfig b/net/9p/Kconfig
> index 63f988f0c9e8..ee967fd25312 100644
> --- a/net/9p/Kconfig
> +++ b/net/9p/Kconfig
> @@ -43,6 +43,8 @@ config NET_9P_XEN
>   config NET_9P_USBG
>   	bool "9P USB Gadget Transport"
>   	depends on USB_GADGET=y || USB_GADGET=NET_9P
> +	select CONFIGFS_FS
> +	select USB_LIBCOMPOSITE
>   	help
>   	  This builds support for a transport for 9pfs over
>   	  usb gadget.

Fixed building on arm64.

Tested-by: Kexy Biscuit <kexybiscuit@aosc.io>

https://buildit.aosc.io/jobs/43382

-- 
Best Regards,
Kexy Biscuit

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
