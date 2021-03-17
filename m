Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36D2C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 16:27:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED12E64F26
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 16:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED12E64F26
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vMFrc3l0rx260TtE5uN2TFgepM3umk3V9c0IRV5CiqM=; b=aFvlXyMtIlA3+hjzJB9GE4tvU
	EAvmD6LP1RTycjsXJ7o2TUndrMDM3Hgdzun1mem0qp05/FaDofWrYJl5NBZnYCvabggLBujoPec0L
	oUYIcgSlBypdEfYcHcw/1xfsCuoMCzHydlJYCcoef0vtf5Hxminfqr3/zdf9nQ+E7oP/Pcl3vv99h
	nvnzZ8b6yAm+gUwemfRTUTPwpJH9aNxwix/HiJvGbXD1y38ym3Pe63pUr7vUKeU2djr4aiD1Iesjy
	9UEigPxQQ4o0WoSCJjbQgieJAofY3XTFsaOg+tUMs4m3YjA2SxnUw/vcKMQxuWFCRImP0kC9oWU3m
	CorEcsM3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMZ0c-003YYT-Nk; Wed, 17 Mar 2021 16:26:58 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMZ0Z-003YY9-03
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 16:26:56 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4F0wXX6rD2z1qsk3;
 Wed, 17 Mar 2021 17:26:52 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4F0wXX3vJcz1r1M6;
 Wed, 17 Mar 2021 17:26:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id YctD_oGOxMZg; Wed, 17 Mar 2021 17:26:51 +0100 (CET)
X-Auth-Info: BJPL6qEHkuCb/9sVqThKDNGIxTNx8BWVAwSlhxULn3r36wRUu7V3tpRzX+a9DVs/
Received: from igel.home (ppp-46-244-172-178.dynamic.mnet-online.de
 [46.244.172.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 17 Mar 2021 17:26:51 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id B287B2C30DD; Wed, 17 Mar 2021 17:26:49 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: <Claudiu.Beznea@microchip.com>
Cc: <linux-riscv@lists.infradead.org>,  <ckeepax@opensource.cirrus.com>,
 <andrew@lunn.ch>,  <w@1wt.eu>,  <Nicolas.Ferre@microchip.com>,
 <daniel@0x0f.com>,  <alexandre.belloni@bootlin.com>,
 <pthombar@cadence.com>,  <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: macb broken on HiFive Unleashed
References: <87tupl30kl.fsf@igel.home>
 <04a7e801-9a55-c926-34ad-3a7665077a4e@microchip.com>
X-Yow: Do I hear th' SPINNING of various WHIRRING, ROUND, and WARM
 WHIRLOMATICS?!
Date: Wed, 17 Mar 2021 17:26:49 +0100
In-Reply-To: <04a7e801-9a55-c926-34ad-3a7665077a4e@microchip.com> (Claudiu
 Beznea's message of "Tue, 9 Mar 2021 08:55:10 +0000")
Message-ID: <87o8fhoieu.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_162655_172712_AB072872 
X-CRM114-Status: UNSURE (   6.61  )
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

It turned out to be a broken clock driver.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
