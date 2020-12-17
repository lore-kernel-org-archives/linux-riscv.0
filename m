Return-Path: <SRS0=FwEc=FV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 463E8C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 10:14:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C47732311F
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 10:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C47732311F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PZlrep0KCZ/UznMVKuEAR9hFl6vsevSKXZ1/SXmt6qM=; b=mjfJ99rVEyNFt3pQ/A+9xceP0
	4S4cIUJq9ZypJcgTX3CTtIsu7yGFgHkUK8T0ekw32SkjkzSbjHIkuIOkRXiXLXrWQzvesRm7CZxeK
	Do5uBk7pyslaNzV6IjrYeiFj0P6AmMIWwB+6S/0IiYvJu9WXqEnxfjLISpscZjNYp8BfQZkyz9UCT
	nYT4L2V9RUcKXPoxDOPqe+19xZRTAkZRCrXN5xCxQq7dohgfpViSJTJMszjtyyY6SLdZ3NYuU2JFN
	PBtU3LnHZ75Jn8JFQ1ilCkyCqqUSTLRsiOrfozWrP1O/xNcoksig1j3uwH0KD1d6bGXJrAOYVRS/W
	bphK0Sw7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpqIM-00084c-In; Thu, 17 Dec 2020 10:14:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpqID-00080j-IZ
 for linux-riscv@lists.infradead.org; Thu, 17 Dec 2020 10:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1608200033; x=1639736033;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=gEkW6RbrgOxi90YpOZkCKsJYSwuRnd4VKz5XMjUVr8U=;
 b=kPqRC1g5C0wkOGPYNECV9/DedC9cb9c0x63NhH2ZtBIYb0xN3yMzMcJv
 zP77zmebawW124xd3ncMRWu0noA+8GtK24r8EtnBj2lFxYs1qDmqJrmXs
 P36HMtbu4ufntmr1mZhosARqVpIw3dnoUJu4XYXFRnUDtzGufi8Sbdbn9
 mT3C796SGsxnl08A+X9gM1P6+pJZv39GWLGzEfVHfbOBsXj+ipOiZHbcZ
 eNkgLvvdihBrT5YWvIimEJVnAHKP3CSXrjVb9aolvmpfu8IXLPY/nQU5X
 S7NO3OgHEGaMusgntGWDe+sEwrcGTiqHeoaVcwqN4roYKmx9cSz517PLk A==;
IronPort-SDR: XEIhSz+1243SkrqAaquvhpaycDwjiYjytgf/0ojV8Ra+XGEh7Ub5SegTOh9PrYmkwiHPh9KbLn
 Pl790Ke1EUiS7vYmW3T9r81Eicw8r5rDDCK3xUTlaTjtHmW507fFjDS4WVjSvjas3p4LEpVUOh
 0Mjngbi1OqJbQkCcJgIPAmdYP3EQFre5wvdcTbEVE0zBzLA8GmtkGyvcxPbhCWJ0eI/LQYnuHV
 m9uYSCejclBipVOKhyxrDIW6kI2bbsPp13sNQI+b+9plwmnNJ5dh4/XqCtQdxDxDUPPMUCVhbO
 vyE=
X-IronPort-AV: E=Sophos;i="5.78,426,1599548400"; d="scan'208";a="97439396"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2020 03:13:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 17 Dec 2020 03:13:50 -0700
Received: from [10.171.246.74] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Thu, 17 Dec 2020 03:13:46 -0700
Subject: Re: [PATCH v3 0/8] net: macb: add support for sama7g5
To: Claudiu Beznea <claudiu.beznea@microchip.com>, <davem@davemloft.net>,
 <kuba@kernel.org>, <robh+dt@kernel.org>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <natechancellor@gmail.com>, 
 <ndesaulniers@google.com>
References: <1607519019-19103-1-git-send-email-claudiu.beznea@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <419c402d-b214-410d-24c4-45c1d2ba388d@microchip.com>
Date: Thu, 17 Dec 2020 11:13:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1607519019-19103-1-git-send-email-claudiu.beznea@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_051353_903947_9B8553DA 
X-CRM114-Status: GOOD (  17.00  )
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 yash.shah@sifive.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 09/12/2020 at 14:03, Claudiu Beznea wrote:
> Hi,
> 
> This series adds support for SAMA7G5 Ethernet interfaces: one 10/100Mbps
> and one 1Gbps interfaces.
> 
> Along with it I also included a fix to disable clocks for SiFive FU540-C000
> on failure path of fu540_c000_clk_init().
> 
> Thank you,
> Claudiu Beznea
> 
> Changed in v3:
> - use clk_bulk_disable_unprepare in patch 3/8
> - corrected clang compilation warning in patch 3/8
> - revert changes in macb_clk_init() in patch 3/8
> 
> Changes in v2:
> - introduced patch "net: macb: add function to disable all macb clocks" and
>    update patch "net: macb: unprepare clocks in case of failure" accordingly
> - collected tags
> 
> Claudiu Beznea (8):
>    net: macb: add userio bits as platform configuration
>    net: macb: add capability to not set the clock rate
>    net: macb: add function to disable all macb clocks
>    net: macb: unprepare clocks in case of failure
>    dt-bindings: add documentation for sama7g5 ethernet interface
>    dt-bindings: add documentation for sama7g5 gigabit ethernet interface
>    net: macb: add support for sama7g5 gem interface
>    net: macb: add support for sama7g5 emac interface

For the whole series:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Claudiu, best regards,
   Nicolas

>   Documentation/devicetree/bindings/net/macb.txt |   2 +
>   drivers/net/ethernet/cadence/macb.h            |  11 ++
>   drivers/net/ethernet/cadence/macb_main.c       | 134 ++++++++++++++++++-------
>   3 files changed, 111 insertions(+), 36 deletions(-)
> 


-- 
Nicolas Ferre

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
