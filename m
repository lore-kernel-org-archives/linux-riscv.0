Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D78FCEDDB7
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 02:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2HAOGfr4mmdpxt432C1oKUERkRS88m2mnU0HWEYsSQ=; b=lMTp0QpmUR6SX0
	8w/9PzT4kpB+lXFcmkwlqFJYFxPgOZXV05gktsHePkWzBoDrxFQ8m+hhHrWztBlAHK/S0FpK9B+XN
	93+TErUZWBhJvxEB2eG20U3IGP+PnfQVPZyJ8e1GWKxl2TcyJshJEPm6+586kkIfK/xiusC1DrKn4
	4zbxzHvxAbia6HnAc7/5F4fTbN/o6flm+WCIIh+xbBY7vfhEC05xjdXvIkVXD2TIGNMTWucHI52bK
	iKY8mS5wrt7R4pQMbMMhMBIL2F7PPJL522WCp6X0xwBb0QMrwhw3dvpvQO/g1mrijzEsmHaGlVziu
	60hPsld3U5Jq3TqclTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syiZO-0000000BGQL-3peU;
	Thu, 10 Oct 2024 02:06:26 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syiZK-0000000BGOs-2qME
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 02:06:25 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XPCmC43s3z26gbb;
	Thu, 10 Oct 2024 10:06:19 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id F17B5140120;
	Thu, 10 Oct 2024 10:06:14 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 10 Oct 2024 10:06:14 +0800
Message-ID: <7e29e022-eae6-4a93-f7f1-841febab0988@huawei.com>
Date: Thu, 10 Oct 2024 10:06:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] net/9p/usbg: Fix build error
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
CC: <ericvh@kernel.org>, <lucho@ionkov.net>, <asmadeus@codewreck.org>,
	<linux_oss@crudebyte.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <m.grzeschik@pengutronix.de>,
	<v9fs@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20240930081520.2371424-1-ruanjinjie@huawei.com>
 <2ff5834d-cb88-39f5-168d-8e179f152757@huawei.com>
 <2024100910-distrust-cornhusk-a8bd@gregkh>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <2024100910-distrust-cornhusk-a8bd@gregkh>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemh500013.china.huawei.com (7.202.181.146)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_190623_248931_867A1093 
X-CRM114-Status: UNSURE (   9.90  )
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



On 2024/10/9 15:55, Greg KH wrote:
> On Wed, Oct 09, 2024 at 03:49:22PM +0800, Jinjie Ruan wrote:
>> Ping.
>>
>> On 2024/9/30 16:15, Jinjie Ruan wrote:
>>> When CONFIG_NET_9P_USBG=y but CONFIG_USB_LIBCOMPOSITE=m and
>>> CONFIG_CONFIGFS_FS=m, the following build error occurs:
>>>
>>> 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_free_func':
>>> 	trans_usbg.c:(.text+0x124): undefined reference to `usb_free_all_descriptors'
>>> 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_rx_complete':
>>> 	trans_usbg.c:(.text+0x2d8): undefined reference to `usb_interface_id'
>>> 	riscv64-unknown-linux-gnu-ld: trans_usbg.c:(.text+0x2f6): undefined reference to `usb_string_id'
>>> 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_func_bind':
>>> 	trans_usbg.c:(.text+0x31c): undefined reference to `usb_ep_autoconfig'
>>> 	riscv64-unknown-linux-gnu-ld: trans_usbg.c:(.text+0x336): undefined reference to `usb_ep_autoconfig'
>>> 	riscv64-unknown-linux-gnu-ld: trans_usbg.c:(.text+0x378): undefined reference to `usb_assign_descriptors'
>>> 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `f_usb9pfs_opts_buflen_store':
>>> 	trans_usbg.c:(.text+0x49e): undefined reference to `usb_put_function_instance'
>>> 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_alloc_instance':
>>> 	trans_usbg.c:(.text+0x5fe): undefined reference to `config_group_init_type_name'
>>> 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_alloc':
>>> 	trans_usbg.c:(.text+0x7aa): undefined reference to `config_ep_by_speed'
>>> 	riscv64-unknown-linux-gnu-ld: trans_usbg.c:(.text+0x7ea): undefined reference to `config_ep_by_speed'
>>> 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_set_alt':
>>> 	trans_usbg.c:(.text+0x828): undefined reference to `alloc_ep_req'
>>> 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_modexit':
>>> 	trans_usbg.c:(.exit.text+0x10): undefined reference to `usb_function_unregister'
>>> 	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_modinit':
>>> 	trans_usbg.c:(.init.text+0x1e): undefined reference to `usb_function_register'
>>>
>>> Select the config for NET_9P_USBG to fix it.
>>>
>>> Fixes: a3be076dc174 ("net/9p/usbg: Add new usb gadget function transport")
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> ---
>>>  net/9p/Kconfig | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/net/9p/Kconfig b/net/9p/Kconfig
>>> index 63f988f0c9e8..ee967fd25312 100644
>>> --- a/net/9p/Kconfig
>>> +++ b/net/9p/Kconfig
>>> @@ -43,6 +43,8 @@ config NET_9P_XEN
>>>  config NET_9P_USBG
>>>  	bool "9P USB Gadget Transport"
>>>  	depends on USB_GADGET=y || USB_GADGET=NET_9P
>>> +	select CONFIGFS_FS
>>> +	select USB_LIBCOMPOSITE
>>>  	help
>>>  	  This builds support for a transport for 9pfs over
>>>  	  usb gadget.
> 
> Ah, I can take this through the USB tree as it fixes a bug that came in
> through there.

Hi, Greg
Thank you very much!

> 
> thanks,
> 
> greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
