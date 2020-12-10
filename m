Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F66C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 02:16:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27BA523A7C
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 02:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27BA523A7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UDr3rs7fhFDwczIpQg4nKDNtmttuV71y12iP/R7flJo=; b=qfaby2iNRrjTWTxXVoSk+JMj0
	2J6bBpP+INFhdyF0/ZTGN7Ve4NRLaJOw9nYSFSc2qRvrA5zdlkEc2M+xZVyQ13FvlYc0NlAr1wd4b
	c9u88xCW0nzYHdLkq5Q3MypjFj2nJRUD7gEtWDQjNB3iOLrgVEdyuAHD9x1m1k/QOX0U674/AiVk/
	ij+xgphyzNvu7EcatXlWKRKMkiPJcuCVUG2R/NsyE+e+VrBGbMOWrnwv0+p4VmzgrVRGTxj01Iyv4
	jzQoNwZoVB9DiNZIMN/JD3uiONPvM+AafBYQ4AnA4du1EknKzRqW9hL5gpiUaPTANm42ZEIJLes7S
	1Dji9iILA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knBVh-00065n-Ds; Thu, 10 Dec 2020 02:16:49 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knBVg-00065L-1M
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 02:16:48 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1knBVY-00B9Ln-4U; Thu, 10 Dec 2020 03:16:40 +0100
Date: Thu, 10 Dec 2020 03:16:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v3 4/8] net: macb: unprepare clocks in case of failure
Message-ID: <20201210021640.GF2638572@lunn.ch>
References: <1607519019-19103-1-git-send-email-claudiu.beznea@microchip.com>
 <1607519019-19103-5-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607519019-19103-5-git-send-email-claudiu.beznea@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_211648_095831_D716023D 
X-CRM114-Status: UNSURE (   7.33  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, ndesaulniers@google.com,
 linux@armlinux.org.uk, linux-riscv@lists.infradead.org,
 nicolas.ferre@microchip.com, clang-built-linux@googlegroups.com,
 yash.shah@sifive.com, robh+dt@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, kuba@kernel.org, natechancellor@gmail.com,
 davem@davemloft.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 09, 2020 at 03:03:35PM +0200, Claudiu Beznea wrote:
> Unprepare clocks in case of any failure in fu540_c000_clk_init().
> 
> Fixes: c218ad559020 ("macb: Add support for SiFive FU540-C000")
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
