Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52821CF6497
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 08:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P30/ASHRXbogxM4gicTkhwC50g6kJu3c2UY0Vi7ZPJE=; b=uamOa75WmYEUVB
	XR6a0IBoKbkdiE07LNEdtklWW3FOMzS86wCgTHOYWjc9LZdS6yQStqUxRxatLMlh1WCNzqLGNaDn3
	qVi+1lOy/AMVv5UCCJD5ykrXOZRvcLG/ULtOLR4msSQOHOK3OxQtx6KJFYLndC10ZTDdZre6uObqI
	rusAzWIan5Q9M2DqCjN3vL34xT/hLnRSbMfOM0PzryepNucNqdhxJCHJMHdFaUufg4vF3HeNXtNZ6
	1QhVCB+Rgb22oo4pqVYCO5ZUbdKNphyycKzryRm+bzTUUxi0/xp8lynUUM2znVhP8SX5XjRfR/vhk
	AmMHFNFZw76/pjRaLvtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svBOz-0000000GGgC-0SvJ;
	Mon, 30 Sep 2024 08:05:05 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svBOv-0000000GGet-0Hrx
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 08:05:03 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XHDB04ZQLz20pSY;
	Mon, 30 Sep 2024 16:04:24 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 437471400CB;
	Mon, 30 Sep 2024 16:04:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Sep
 2024 16:04:50 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <ericvh@kernel.org>, <lucho@ionkov.net>, <asmadeus@codewreck.org>,
	<linux_oss@crudebyte.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <m.grzeschik@pengutronix.de>,
	<gregkh@linuxfoundation.org>, <v9fs@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] net/9p/usbg: Fix build error
Date: Mon, 30 Sep 2024 16:15:20 +0800
Message-ID: <20240930081520.2371424-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh500013.china.huawei.com (7.202.181.146)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_010501_397741_7E86EDEE 
X-CRM114-Status: UNSURE (   8.11  )
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

When CONFIG_NET_9P_USBG=y but CONFIG_USB_LIBCOMPOSITE=m and
CONFIG_CONFIGFS_FS=m, the following build error occurs:

	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_free_func':
	trans_usbg.c:(.text+0x124): undefined reference to `usb_free_all_descriptors'
	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_rx_complete':
	trans_usbg.c:(.text+0x2d8): undefined reference to `usb_interface_id'
	riscv64-unknown-linux-gnu-ld: trans_usbg.c:(.text+0x2f6): undefined reference to `usb_string_id'
	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_func_bind':
	trans_usbg.c:(.text+0x31c): undefined reference to `usb_ep_autoconfig'
	riscv64-unknown-linux-gnu-ld: trans_usbg.c:(.text+0x336): undefined reference to `usb_ep_autoconfig'
	riscv64-unknown-linux-gnu-ld: trans_usbg.c:(.text+0x378): undefined reference to `usb_assign_descriptors'
	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `f_usb9pfs_opts_buflen_store':
	trans_usbg.c:(.text+0x49e): undefined reference to `usb_put_function_instance'
	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_alloc_instance':
	trans_usbg.c:(.text+0x5fe): undefined reference to `config_group_init_type_name'
	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_alloc':
	trans_usbg.c:(.text+0x7aa): undefined reference to `config_ep_by_speed'
	riscv64-unknown-linux-gnu-ld: trans_usbg.c:(.text+0x7ea): undefined reference to `config_ep_by_speed'
	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_set_alt':
	trans_usbg.c:(.text+0x828): undefined reference to `alloc_ep_req'
	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_modexit':
	trans_usbg.c:(.exit.text+0x10): undefined reference to `usb_function_unregister'
	riscv64-unknown-linux-gnu-ld: net/9p/trans_usbg.o: in function `usb9pfs_modinit':
	trans_usbg.c:(.init.text+0x1e): undefined reference to `usb_function_register'

Select the config for NET_9P_USBG to fix it.

Fixes: a3be076dc174 ("net/9p/usbg: Add new usb gadget function transport")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 net/9p/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/9p/Kconfig b/net/9p/Kconfig
index 63f988f0c9e8..ee967fd25312 100644
--- a/net/9p/Kconfig
+++ b/net/9p/Kconfig
@@ -43,6 +43,8 @@ config NET_9P_XEN
 config NET_9P_USBG
 	bool "9P USB Gadget Transport"
 	depends on USB_GADGET=y || USB_GADGET=NET_9P
+	select CONFIGFS_FS
+	select USB_LIBCOMPOSITE
 	help
 	  This builds support for a transport for 9pfs over
 	  usb gadget.
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
