Return-Path: <SRS0=4geo=M4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBDDC43214
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 08:14:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65310610FF
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 08:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65310610FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mS9zg8PQU5qGNQIVDPlQzkZNFRcwJfCPRUjcU4G00c=; b=OCiUM/RUQ6pKgS
	H6iIG2ScPdJ5idbT/le4TRUvk5b5ByIrwZfO7JX3QDGyJt3gnW9G6IkwxekELrI8Gc7uPmNo7Q4go
	ah/CfQNYKSRjM0Kx/vCRpvrgjo9QMZDQDg7aTPWOU9bOmFV/lHtG25ITx/ZYL+0dYrMn2kUudXqKi
	5CH3DmnxQ5GLPb0ygt3A9S9DImJzSBzt5A6lg3F9UEt8c3T59ju2IL8h03BFgkDfPxVpLqUzHPYc4
	uzojjVFR6+4j/CaVEiZ0q7rpOO/wK9nnPKROkxTdR5dj2O/m15cOCHIa+PsTFO9J/VN8DFALpOo9T
	5la8YeG/hVF7/9A1TLKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBYVd-008cKw-Dz; Thu, 05 Aug 2021 08:13:45 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBYVZ-008cEe-D5
 for linux-riscv@lists.infradead.org; Thu, 05 Aug 2021 08:13:43 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4GgLwC2HM5z1qy54;
 Thu,  5 Aug 2021 10:13:31 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4GgLwC0JMPz1qvtY;
 Thu,  5 Aug 2021 10:13:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id xPOGeJl5EZxV; Thu,  5 Aug 2021 10:13:29 +0200 (CEST)
X-Auth-Info: Kw+0VKHwCc7/D60xsxiPGmSjDWShc6pKBsWCauRJElVomF3qtN3els56nsBMTkNT
Received: from igel.home (ppp-46-244-179-131.dynamic.mnet-online.de
 [46.244.179.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  5 Aug 2021 10:13:29 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 929B52C02D9; Thu,  5 Aug 2021 10:13:28 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Drew Fustini <drew@pdp7.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,  atishp@atishpatra.org,
 drew@beagleboard.org,  bmeng.cn@gmail.com,  robh+dt@kernel.org,  Paul
 Walmsley <paul.walmsley@sifive.com>,  michael.zhu@starfivetech.com,
 tekkamanninja@gmail.com,  jack.zhu@starfivetech.com,
 leyfoon.tan@starfivetech.com,  geert@linux-m68k.org,  kernel@esmil.dk,
 devicetree@vger.kernel.org,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: riscv: add starfive jh7100 bindings
References: <CAOnJCUL9uU5G1LOgfYPz9Ny77yFYaP5sgtdxG3_w=Zcsi+f96Q@mail.gmail.com>
 <mhng-c9300c9e-6877-492f-a290-7c51066d3920@palmerdabbelt-glaptop>
 <20210805023024.GA12312@x1>
X-Yow: I HAVE to buy a new ``DODGE MISER'' and two dozen JORDACHE
 JEANS because my viewscreen is ``USER-FRIENDLY''!!
Date: Thu, 05 Aug 2021 10:13:28 +0200
In-Reply-To: <20210805023024.GA12312@x1> (Drew Fustini's message of "Wed, 4
 Aug 2021 19:30:24 -0700")
Message-ID: <87fsvotil3.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_011341_627843_2E0C63E3 
X-CRM114-Status: GOOD (  10.00  )
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

On Aug 04 2021, Drew Fustini wrote:

> The arch_sync_dma RFC from Atish [1] is key to the board running
> mainline.

It still has issues, though.

https://github.com/starfive-tech/linux/issues/1#issuecomment-879910372

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
