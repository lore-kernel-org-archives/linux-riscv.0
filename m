Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E69C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 01:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:Mime-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72VyD0IVv3gvJVmqjVUyOdwxXoX5QS5eEngV/C5XFoQ=; b=QJyxCVgMV7Sn0o
	bo/jvi2fM3cJlwasG3/x4hVeV1eJBeVj0nXi2U4oR79T0/ZXh5NdDXOnLO9bBf7jCADQbgcBISlQL
	bNDkPB+OBUFkkzmZI6UJ6yLJ5Lj5XPFJrV0OEJYfJmRk1TGMX6NT+r4J0gq3xyaaMIDjrOkuoniBT
	Rot1sdwNMVHziIcgg1zJZxIXk1DhzHuiitS7OasD2TLwddAwq0sl+WqlbPq/YEncpUHiP/47SVDw9
	4+GZruc+3t5gcZQTcPlvaE/BGEJEq+9bEJJhuMwa4S8n9vAvouF2ytQnXSvIkocORHE1LRCNBKzfh
	tLghM6Wq0dpPmsdS6DNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpKZJ-000an1-Nh; Tue, 23 Nov 2021 01:25:57 +0000
Received: from mail-sender-0.a4lg.com ([2401:2500:203:30b:4000:6bfe:4757:0])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpKZH-000amb-Ep
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 01:25:57 +0000
Message-ID: <9ce9a344-39df-727a-c572-8b6f1bd8a627@irq.a4lg.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1637630745;
 bh=Hpe96JrvMgy1jEexvuYwhwZry8pPuqZ8ZJIVuc4/In4=;
 h=Date:Mime-Version:Subject:To:References:Cc:From:In-Reply-To:
 Content-Type:Content-Transfer-Encoding;
 b=m+cp2QWsBr1u6aOe1w5uwTEib08JK78WLafp8XrdWmdlF2258+eraMNVsQ1D6LWZx
 A0kShTDw0FpWQ4TTzaUIcJEUnuRIO4A9xXiribrFAHR0ap4Py9+BBN4yZwUtncfh8w
 2kES0RpjBBJUA5HCZVCWe4DQ4FHUjusoMl+JJf10=
Date: Tue, 23 Nov 2021 10:25:43 +0900
Mime-Version: 1.0
Subject: Re: [RFC PATCH 1/3] riscv: Correctly print supported extensions
Content-Language: en-US
To: Andreas Schwab <schwab@linux-m68k.org>
References: <2d536b65-e6fd-873f-ed34-4aab7cca4771@irq.a4lg.com>
 <87k0h0pdvv.fsf@igel.home>
Cc: linux-riscv@lists.infradead.org
From: Tsukasa OI <research_trasio@irq.a4lg.com>
In-Reply-To: <87k0h0pdvv.fsf@igel.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_172555_860121_89095ED0 
X-CRM114-Status: UNSURE (   6.85  )
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

On 2021/11/22 21:35, Andreas Schwab wrote:
> On Nov 20 2021, Tsukasa OI wrote:
> 
>> This commit replaces BITS_PER_LONG with magic number 26.
>>
>> Current ISA pretty-printing code expects extension 'a' (bit 0) through
>> 'z' (bit 25).  Although bit 26 and higher is not currently used (thus never
>> cause an issue in practice), it will be an annoying problem if we start to
>> use those in the future.
> 
> Perhaps replace 26 by 'z' - 'a' + 1?

That's not bad. Possibly I can define:
#define NUM_ALPHA_EXTS ('z' - 'a' + 1)

I will submit RFC PATCH v2 by end of this week (I found several minor bugs in 
"riscv,isa" parser [patch 2,3] anyway) so I'll rewrite it.

Thanks!
Tsukasa,

> 
> Andreas.
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
