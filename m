Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A32CD4F21
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 20:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=9t48G0vVPb4szJv6MazQp17XRZyNwToVcJK6ZVrAT+c=; b=Vy6XqIPvNrez3d
	xGzEpo2IpnNAlpgHZy5QjpxpGV7w0N2OxFXmf4AwWtQjCRWJVx4WThrskGGqqA6ZkF9q+neD01t27
	Gxx9PKDSwLf5j8pULFxZoCoHCFaV+loKSK+E04DFArmj6z3s4TEX59ayEjYHOlrMnWA+1ZOuHLveH
	gSCctJUO1kX1sQV6NYYvTrMsc0MJzfCOVI3W9fg1yPAepn0uwQ9UH9n1Nafo1GE+fKrd3iLl1OVST
	ASlZxF+c9Dr/PTW4/9/IfpCo+2pNEgKrW8QhOLu3a56JEnr9ow6U6JbRpX/VAFHQEgjQQVAkgogky
	2XUu1+rkmpJGfq7QHdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNGFr-00000003iY5-0bqz;
	Wed, 13 May 2026 20:32:31 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Kj-00000001oGg-2f8O
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 08:52:51 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4gFnKL53nsz51Sdp;
	Wed, 13 May 2026 16:52:38 +0800 (CST)
Received: (from root@localhost)
	by mse-fl2.zte.com.cn id 64D8qdE5044241;
	Wed, 13 May 2026 16:52:39 +0800 (+08)
	(envelope-from liu.qingtao2@zte.com.cn)
Message-Id: <202605130852.64D8qdE5044241@mse-fl2.zte.com.cn>
Received: from njy2app01.zte.com.cn ([10.40.12.136])
	by mse-fl2.zte.com.cn with SMTP id 64D8iPxu027365;
	Wed, 13 May 2026 16:44:25 +0800 (+08)
	(envelope-from liu.qingtao2@zte.com.cn)
Received: from mapi (njb2app07[null])
	by mapi (Zmail) with MAPI id mid204;
	Wed, 13 May 2026 16:44:27 +0800 (CST)
X-Zmail-TransId: 2aff6a0439eb2c1-f7422
X-Mailer: Zmail v1.0
References: 20260213093334.9217-1-qtliu@mail.ustc.edu.cn,20260213093334.9217-3-qtliu@mail.ustc.edu.cn,2026031201-dense-unrefined-7bf5@gregkh,202605061057582963JK3yxV44CRPCHHVos6kc@zte.com.cn
Date: Wed, 13 May 2026 16:44:27 +0800 (CST)
Mime-Version: 1.0
From: <liu.qingtao2@zte.com.cn>
To: <gregkh@linuxfoundation.org>
Cc: <krzk@kernel.org>, <jirislaby@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <marex@nabladev.com>,
        <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <rdunlap@infradead.org>, <geert+renesas@glider.be>,
        <quic_zongjian@quicinc.com>, <arturs.artamonovs@analog.com>,
        <robert.marko@sartura.hr>, <hvilleneuve@dimonoff.com>,
        <thierry.bultel.yh@bp.renesas.com>, <julianbraha@gmail.com>,
        <flavra@baylibre.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <liu.wenhong35@zte.com.cn>, <dai.hualiang@zte.com.cn>,
        <deng.weixian@zte.com.cn>, <jia.yunxiang@zte.com.cn>,
        <bai.lu5@zte.com.cn>, <yang.susheng@zte.com.cn>,
        <shen.lin1@zte.com.cn>, <zuo.jiang@zte.com.cn>,
        <hu.shengming@zte.com.cn>, <gao.rui@zte.com.cn>, <tan.hu@zte.com.cn>,
        <liu.qingtao2@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MSAyLzJdIExSVyBVQVJUOiBzZXJpYWw6IGFkZCBkcml2ZXIgZm9yIHRoZSBMUlcgVUFSVA==?=
X-MAIL: mse-fl2.zte.com.cn 64D8qdE5044241
X-MSS: AUDITRELEASE@mse-fl2.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: liu.qingtao2@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Wed, 13 May 2026 16:52:38 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A043BD6.001/4gFnKL53nsz51Sdp
X-Bad-Reply: References but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_015249_821800_013C62E1 
X-CRM114-Status: GOOD (  14.40  )
X-Mailman-Approved-At: Wed, 13 May 2026 13:32:29 -0700
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

> On Fri, Feb 13, 2026 at 05:33:34PM +0800, LiuQingtao wrote:
> > From: Wenhong Liu <liu.wenhong35@zte.com.cn>
> >
> > This commit introduces a serial driver for the LRW UART controller
> >
> > Key features implemented:
> > - Support for FIFO mode (16-byte depth)
> > - Baud rate configuration
> > - Standard asynchronous communication formats:
> >   * Data bits: 5, 6, 7, 8, 9 bits
> >   * Parity: odd, even, fixed, none
> >   * Stop bits: 1 or 2 bits
> > - Hardware flow control (RTS/CTS)
> > - Multiple interrupt reporting mechanisms
> >
> > Signed-off-by: Wenhong Liu <liu.wenhong35@zte.com.cn>
> > Signed-off-by: Qingtao Liu <liu.qingtao2@zte.com.cn>
> > ---
> >  MAINTAINERS                      |    3 +
> >  drivers/tty/serial/Kconfig       |   33 +
> >  drivers/tty/serial/Makefile      |    1 +
> >  drivers/tty/serial/lrw_uart.c    | 2822 ++++++++++++++++++++++++++++++
>
> This really is a totally new uart?  No relation to any existing devices
> at all?  Why would that be created?
>
> Anyway, this doesn't seem to build properly, how was it tested?

Yes, it`s a new uart for lrx SoC. The lrx SoC with its related docs will be released soon.

The uart TX & RX test environment:
1.Kernel: linux-next, commit 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0(Tue May 5 14:57:23 2026 +0200),
with CONFIG_SERIAL_LRX_UART and SERIAL_LRX_UART_CONSOLE selected.
2.GCC: 14.1.0.
3.SoC: lrx SoC.


> > --- a/include/uapi/linux/serial_core.h
> > +++ b/include/uapi/linux/serial_core.h
> > @@ -231,6 +231,9 @@
> >  /* Sunplus UART */
> >  #define PORT_SUNPLUS    123
> >  
> > +/* LRW UART */
> > +#define PORT_LRW    124
>
> Why is this id needed?
>
> thanks,
>
> greg k-h

Thanks for notice. This id is not needed actually.
According to https://lore.kernel.org/all/20231008001804.889727-1-jcmvbkbc@gmail.com/, the specific type
of the port is not important to the userspace.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
