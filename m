Return-Path: <SRS0=5ZKR=FJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F121BC4361A
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Dec 2020 14:32:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8D212312A
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Dec 2020 14:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8D212312A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D+vYb/1SKn0W9gWkNysoPdDgtOMAkcEYJpiF3FQYR60=; b=EhUbMnJgroJk/EHRncCDd2xMc
	1lLcXlNnLuvMpJPfUhenppSPgCj4wbOxAAsj9QlpMPKpEKMxKtuZc06PLwQWqDslI4puFAcwdLygz
	Fulj/vAIt+c7u2BgTl0NHECybqQ5OF8F2WNciEQKA9cEXtRnkS3yOjIUeqPGZQ48RL09q4H107g2A
	jSA0wK6QDQNeQATEC4RvvX4n3cGs0XYeQEfUXePp2Cn86efMaJYpyBSnDvEZY7wvl2c34yHcG9nPe
	O4oTMQdDMl7ghvgsepJw56u45zHwVRA99mbRiyzXz1tTqmZX21ataUkJrYTUahpCerS3JJAhf/sqH
	ogIwiFvng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klYbb-0000yh-40; Sat, 05 Dec 2020 14:32:11 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klYbZ-0000yP-NR
 for linux-riscv@lists.infradead.org; Sat, 05 Dec 2020 14:32:10 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1klYbR-00AMhO-FB; Sat, 05 Dec 2020 15:32:01 +0100
Date: Sat, 5 Dec 2020 15:32:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH 2/7] net: macb: add capability to not set the clock rate
Message-ID: <20201205143201.GE2420376@lunn.ch>
References: <1607085261-25255-1-git-send-email-claudiu.beznea@microchip.com>
 <1607085261-25255-3-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607085261-25255-3-git-send-email-claudiu.beznea@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_093209_789642_288902D3 
X-CRM114-Status: UNSURE (   9.86  )
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux@armlinux.org.uk,
 nicolas.ferre@microchip.com, yash.shah@sifive.com, robh+dt@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, kuba@kernel.org,
 linux-riscv@lists.infradead.org, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 04, 2020 at 02:34:16PM +0200, Claudiu Beznea wrote:
> SAMA7G5's ethernet IPs TX clock could be provided by its generic clock or
> by the external clock provided by the PHY. The internal IP logic divides
> properly this clock depending on the link speed. The patch adds a new
> capability so that macb_set_tx_clock() to not be called for IPs having
> this capability (the clock rate, in case of generic clock, is set at the
> boot time via device tree and the driver only enables it).
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
