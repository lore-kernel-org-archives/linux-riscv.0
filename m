Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5783CD4F25
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 20:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=W/zZDIVXc5u8Xk00LO7VA/2uqEl+IRwLpAgij07fjFk=; b=dWWDPn80lgMegN
	ffIH+KVFovA1COia+TQB9+Du4gdru740lTrMDYE4YUELUn/PReN+MD4Q6TLA8aANm64WDr8jYqApt
	bD3MH0ELPSh7JynyZg5UnYj0gczlAlpMg6MbMC5N7NuiAXB/vYH/3rMG2QwEGMUoCVAtGglFt3CsB
	BFq6RmNm2yKInJxo6lRbJiL6vkq7sL7c1SU1hm9poXd1hvSIQE7aSuaefX/hL2lvJokyj2aEdaUYk
	0F1AhJcoqzhfL3ujOFYqDpra0Uan41gXcfEHThWJNAOSZG6YL7AO6r3feivV1ctG3ktke3M8vRIBe
	yCS98RdrkUyO+9uv81IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNGFr-00000003iYF-24Gi;
	Wed, 13 May 2026 20:32:31 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5Ku-00000001oLC-3yPZ
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 08:53:02 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gFnKl0490z5B1K3;
	Wed, 13 May 2026 16:52:59 +0800 (CST)
Received: (from root@localhost)
	by mse-fl2.zte.com.cn id 64D8qugc044740;
	Wed, 13 May 2026 16:52:56 +0800 (+08)
	(envelope-from liu.qingtao2@zte.com.cn)
Message-Id: <202605130852.64D8qugc044740@mse-fl2.zte.com.cn>
Received: from njy2app03.zte.com.cn ([10.40.13.14])
	by mse-fl1.zte.com.cn with SMTP id 64D8hsld067319;
	Wed, 13 May 2026 16:43:54 +0800 (+08)
	(envelope-from liu.qingtao2@zte.com.cn)
Received: from mapi (njy2app01[null])
	by mapi (Zmail) with MAPI id mid204;
	Wed, 13 May 2026 16:43:57 +0800 (CST)
X-Zmail-TransId: 2af96a0439cd9b7-06b0a
X-Mailer: Zmail v1.0
References: 20260213093334.9217-1-qtliu@mail.ustc.edu.cn,20260213093334.9217-3-qtliu@mail.ustc.edu.cn,3387b1bd-c945-4b9d-915a-baf9412f656f@kernel.org,20260428233949705AHdTSCRS2r_rFbGYOwDb5@zte.com.cn,20260430171826967JqSqSGvBgq68Xq-SNewYu@zte.com.cn
Date: Wed, 13 May 2026 16:43:57 +0800 (CST)
Mime-Version: 1.0
From: <liu.qingtao2@zte.com.cn>
To: <krzk@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>, <robh@kernel.org>,
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
X-MAIL: mse-fl2.zte.com.cn 64D8qugc044740
X-MSS: AUDITRELEASE@mse-fl2.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: liu.qingtao2@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Wed, 13 May 2026 16:52:59 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A043BEA.002/4gFnKl0490z5B1K3
X-Bad-Reply: References but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_015301_304053_1CF8C066 
X-CRM114-Status: GOOD (  22.31  )
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

> On 13/02/2026 10:33, LiuQingtao wrote:
> > From: Wenhong Liu <liu.wenhong35@zte.com.cn>
> >
> > This commit introduces a serial driver for the LRW UART controller
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

Thanks. I change subject to "Add support for the ZTE LRX UART controller with the following features"
in the following patches.

> >
> > Key features implemented:
> > - Support for FIFO mode (16-byte depth)
> > - Baud rate configuration
> > - Standard asynchronous communication formats:
> > * Data bits: 5, 6, 7, 8, 9 bits
> > * Parity: odd, even, fixed, none
> > * Stop bits: 1 or 2 bits
> > - Hardware flow control (RTS/CTS)
> > - Multiple interrupt reporting mechanisms
> >
> > Signed-off-by: Wenhong Liu <liu.wenhong35@zte.com.cn>
> > Signed-off-by: Qingtao Liu <liu.qingtao2@zte.com.cn>
> Mismatched DCO/SoB.
> Run checkpatch on your code.

Thanks for your notice. This patch is co-developed by Qingtao Liu.
SoB will be modified in v2 patches:

Co-developed-by: Qingtao Liu <liu.qingtao2@zte.com.cn>
Signed-off-by: Qingtao Liu <liu.qingtao2@zte.com.cn>
Signed-off-by: Wenhong Liu <liu.wenhong35@zte.com.cn>

> > ---
> > MAINTAINERS | 3 +
> > drivers/tty/serial/Kconfig | 33 +
> > drivers/tty/serial/Makefile | 1 +
> > drivers/tty/serial/lrw_uart.c | 2822 ++++++++++++++++++++++++++++++
> > include/uapi/linux/serial_core.h | 3 +
> > 5 files changed, 2862 insertions(+)
> > create mode 100644 drivers/tty/serial/lrw_uart.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ad6acbe24544..a97fbd205f75 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15041,6 +15041,9 @@ R: Qingtao Liu <liu.qingtao2@zte.com.cn>
> > L: linux-serial@vger.kernel.org
> > S: Maintained
> > F: Documentation/devicetree/bindings/serial/lrw,lrw-uart.yaml
> > +F: drivers/tty/serial/Kconfig
> > +F: drivers/tty/serial/Makefile
>
> Why do you claim you maintain these files?
>

Oh sorry, now i only added these files in v2 patch.
+F: Documentation/devicetree/bindings/serial/zte,lrx-uart.yaml
+F: drivers/tty/serial/lrx_uart.c


> > +F: drivers/tty/serial/lrw_uart.c
> >
> ....
> > +
> > +static int lrw_uart_probe(struct platform_device *pdev)
> > +{
> > + struct lrw_uart_port *sup;
> > + struct resource *r;
> > + int portnr, ret;
> > + unsigned int clk;
> > + unsigned int baudrate;
> > +
> > + /*
> > + * Check the mandatory baud rate parameter in the DT node early
> > + * so that we can easily exit with the error.
> > + */
> > + if (pdev->dev.of_node) {
> > + struct device_node *np = pdev->dev.of_node;
> > +
> > + ret = of_property_read_u32(np, "current-speed", &baudrate);
>
> Test your code/DTS - there is no such property allowed and you would see
> warnings on DTS.
>
> Best regards,
> Krzysztof

Oh, i've lost this property in dt-bindings. It will be added in the
v2 patches and no more warnings.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
