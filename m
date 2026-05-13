Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DF2CD4F39
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 10:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RmyYtRt+Ll+8QE/VTaHMhCzdnNyYkZyC6+eHB017JNs=; b=zcbHa2nNRBY1IX
	vMNMKtL4kEpCfvz5RTfgK6KikWmxCrcFGFad3p6f/c6pPd+t73ZgW9gs66VUEDbiXDlDaJDHwyjA4
	3lMA4qB5EKLHDpCKHoeKeSLjkncVfSLUKqtFIOW7OMyZV+MSvZsZHX33NjdcQCqLCIPZK1RZgcY9R
	Qla6laKJmM2QGUYhxxD4PWGTyLZ5MpkG9XzBouRis+Zovq/CG3Li69P6XwSzx8xlP5h+Lb24KMIyL
	JqQ6bdHa2b0V3fOcVfbvaztXmvMNVjZ8PzC2MR4vkOBKHFUlMyHhFjO6hguo3vi7Wzc2QVYTg1CR+
	f4qbsRLZFkzxYgEKxzsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6vx-00000002Cjz-0YkF;
	Wed, 13 May 2026 10:35:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6vu-00000002Cio-3cw2
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 10:35:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D88643F2A;
	Wed, 13 May 2026 10:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15BFC2BCB7;
	Wed, 13 May 2026 10:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778668518;
	bh=8S+r3vi1jr7i6VhYB4ksbZTc+cZK5iU9FX8rEbFmZyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eVvk8vYzhESNW7SI3UycernAMZQJh4mtp/eJZC26stwL+421inzivWuTQHXnzQrpk
	 eN2lQWrbyfOCdXIMmJIX6aeY5LYmJQ8B4JuB2qzz+ycqDQXT+lrGumNW0qfk7qutQa
	 b4GWRvbnBk+Wfuu/NinjCaFfXc2GnMNMBaTkE4e0=
Date: Wed, 13 May 2026 12:01:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: liu.qingtao2@zte.com.cn
Cc: krzk@kernel.org, jirislaby@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, marex@nabladev.com,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, rdunlap@infradead.org, geert+renesas@glider.be,
	quic_zongjian@quicinc.com, arturs.artamonovs@analog.com,
	robert.marko@sartura.hr, hvilleneuve@dimonoff.com,
	thierry.bultel.yh@bp.renesas.com, julianbraha@gmail.com,
	flavra@baylibre.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	liu.wenhong35@zte.com.cn, liu.fei16@zte.com.cn,
	dai.hualiang@zte.com.cn, deng.weixian@zte.com.cn,
	jia.yunxiang@zte.com.cn, he.yilin@zte.com.cn, bai.lu5@zte.com.cn,
	yang.susheng@zte.com.cn, shen.lin1@zte.com.cn, zuo.jiang@zte.com.cn,
	hu.shengming@zte.com.cn, gao.rui@zte.com.cn, tan.hu@zte.com.cn
Subject: Re: [PATCH v2 0/2] Add ZTE LRX UART driver
Message-ID: <2026051341-cattle-multiple-3845@gregkh>
References: <202605130852.64D8qMgL084414@mse-fl1.zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202605130852.64D8qMgL084414@mse-fl1.zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_033518_928827_D2EFE96A 
X-CRM114-Status: UNSURE (   7.98  )
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

On Wed, May 13, 2026 at 04:46:42PM +0800, liu.qingtao2@zte.com.cn wrote:
> >From 9eba3be2e9b4d5c77956258e3c5db95049c3a895 Mon Sep 17 00:00:00 2001
> From: Wenhong Liu
> Date: Mon, 12 May 2026 10:15:55 +0800
> Subject: [PATCH v2 0/2] Add ZTE LRX UART driver

Again, why is this here?

Just use 'git send-email' to send patches out please.  Your patches here
are not threaded together at all and our tooling can not pick them up
:(

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
