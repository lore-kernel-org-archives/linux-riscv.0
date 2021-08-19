Return-Path: <SRS0=mZrj=NK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1694C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 01:28:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F74B610A3
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 01:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F74B610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iB5NmvQYu1BYx+AkikMdqnFcjnpgoAEODTL6CoxefuQ=; b=fEkv+BO3w+3/kie730AacCs7xf
	bQcoiLBHhCYdcpxZV9E8dG6aRX+sbKcYLM3+VByi0Xw2kSdUC8W84GzS8irrJ9bHG5y8gA3GVJYjh
	I79VJ6OywXOE9e1AGHgvk0dMgpPBUbu40WoaVEdhPCfMJF+wYQdqDhu8wLJ/aqRiHSKdsWpsDUgwy
	J02nv1Ulr9NLAYmyl3+L3C71i1++3oibJ76Hna8mg1SUmmHCtRz2G8bleFCC9Mlq9oqQKE9FLSrBF
	CAlpTLcaQYeaOjtnE0CurdBl9bPWZqeQUzeqZ5tTZG/IGefiX+0rwh/xG6xHOORWZSsp3rqNvXDyZ
	1YnPUJPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGWqH-006urF-68; Thu, 19 Aug 2021 01:27:37 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGWpy-006uqf-1C
 for linux-riscv@lists.infradead.org; Thu, 19 Aug 2021 01:27:21 +0000
Received: by mail-pg1-x530.google.com with SMTP id w8so4286876pgf.5
 for <linux-riscv@lists.infradead.org>; Wed, 18 Aug 2021 18:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=2KRI4VVv3R72yyMPB6ZDBrVdl3IUiUV8qMUuKx+Ed58=;
 b=yo4iDE/EULUTJScOtgw7cmPaS7eRdjFXztFrS+UO7LR3YXCM4FA6bzXxbrk9rrVUzT
 14SRgp03mRqtRs+64D+tkhHr0lp5T0cZQSPdMU98M2OYa85SWZrShBVmnT5rxAWs/J+K
 Q5uMqE1yITvWsI2/CJEaZg+OZgg/uHNjS1IzzG9yq5jiBPbm8P3HeFecJX3BCHdPhVrp
 97HpEyG5m9x+FfX9vrUgLKfl2d9M8v7duoxrPhBAERVztqHUvHmJwkt+Z7Oi78wmQHKt
 YbvMBSXkxm6gjtAbggKJQgUPXp1aE39isQ45nkUzEwJL6X5WL0POTZvNkhIZlBotd1a1
 J9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=2KRI4VVv3R72yyMPB6ZDBrVdl3IUiUV8qMUuKx+Ed58=;
 b=SW/M3f9HGNgtipIVDS8RSvxWicbwjq/3oZY2fGYOJMgSNHFVQY8sojGF0UFQUkDBv4
 qRrmWPaR0UbphegWTs+C2a25Q3ekQFYyUFt0i4Z9bP2gQAe4uzt1vHD190w5lprX3fuq
 6Zhxlufl52HU0dNTOdTRSkiY5xaQYB3BLxBqh0e6uvWn9rsY5pKsOxuTUtCCoTorCbzJ
 Vi62cUUYk5rFjMpUOmb6xC3bA8peHMsb+9HfLigISgW2jCOlesDxy30fwUaVCcgmpV9t
 4JQJHLs8N7ROZWOvE5tQS5lW1zB2+qxYBlmFylq10urvrQgwZ0aITRbf91ERI2QEeANX
 kDpQ==
X-Gm-Message-State: AOAM530Sjnwf/+8x48aje6JM62QbJa2oET4eV+7R6r7t8u9e9PDk2Fcc
 d7aiFXVx7RJhzBgrbPkF2lzXoQ==
X-Google-Smtp-Source: ABdhPJzu/KDqOzErdl1r7L5pycgclc1gNqLLn4Q81fBwqS98biyV+kZyjz91p/ECWWKpc6B3SKPxWg==
X-Received: by 2002:a65:6818:: with SMTP id l24mr11849661pgt.150.1629336436599; 
 Wed, 18 Aug 2021 18:27:16 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w11sm1176432pgk.34.2021.08.18.18.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 18:27:16 -0700 (PDT)
Date: Wed, 18 Aug 2021 18:27:16 -0700 (PDT)
X-Google-Original-Date: Wed, 18 Aug 2021 18:15:58 PDT (-0700)
Subject: RISC-V MC at Plumbers
CC: Atish Patra <Atish.Patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-76681b3c-605a-4887-99c6-cc367c0e9887@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_182718_187759_2A843099 
X-CRM114-Status: UNSURE (   8.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Looks like our first attempt at sending a message bounced, so this never 
got properly announced.  We've got Microconference at Plumbers again 
this year, the CFP is still open.

https://www.linuxplumbersconf.org/blog/2021/index.php/2021/07/26/risc-v-microconference-accepted-into-2021-linux-plumbers-conference/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
