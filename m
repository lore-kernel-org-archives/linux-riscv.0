Return-Path: <SRS0=pf/r=FU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6514C4361B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 03:22:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F31A23122
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 03:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F31A23122
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1gb4INv7V52wnSL0vGBsewn4KimmycTVqH6V+W5kpvA=; b=r8SX4AAyxf0t5xGS7xGhbtXJx
	IVoM4nQRrUwzKDM7SeCbTA+egxAP6FK8CYc5YnNCZbNW3vPmN/ylwjPxxwddsTJUj6MfZiDQmqbos
	UGy3uYS2oR6aXBMlQKcctIlIckBd4Lu9PVMpSLFHwJIZEomcAwwQ7kvhfnBH0Y1h92DJTvPHWpvOw
	m1yRpGZpyDcVpLG9DQH9eWl83HN7Z7b/UG/m0uMSOyCLPzWknRcek2CsoCrLMX8oHb7q/ghv0z040
	HuESxS0lD8kbJgZVjXamT5sl5DncZz7hEyr9sVKfOnzGlJhSTl9TqzFS0VfTjHHacze6AI2Lr6Lci
	TS6zC6y6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpNO7-0007oT-Ay; Wed, 16 Dec 2020 03:22:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpNO5-0007nw-9v
 for linux-riscv@lists.infradead.org; Wed, 16 Dec 2020 03:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608088920;
 bh=zXOu3Dsa7PjAV8LCk/8JtIkNMtPqZuJsgeUbq9ntAms=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=VHDiWkyzJG4AhGEdOpncZIfbEIH/5U1BsuFpYicphwvUt5qjm2OrLC5UQ1DdcAths
 JAMSvRaXgBVwEIV+cbu9Rk7wPINeZTHrbdW7ppqZXdLjyflvonplP5bXlOKeGwOQCX
 4t5xNVgSAJSobcmG4yOjaOt/BvFLkJDuaKorNe0aJNCLdmWwN6Z+TmbRKu+CBM3BUg
 Q8/2LgcioL/3inLo9UdzhQzwPR5AZ3+lviNbRtlMJpF5Hrf/AfLiA893nBhO7ueqH3
 q2yMpGMA/qSjRwuE0FntOmf3TwmX/acDBZ/8FoMRioVYvB21g/+RuUCIpq99xrJ2uM
 myEVxtqUjOM5w==
MIME-Version: 1.0
In-Reply-To: <20201126030043.67390-1-zong.li@sifive.com>
References: <20201126030043.67390-1-zong.li@sifive.com>
Subject: Re: [PATCH] dt-bindings: fu740: prci: add YAML documentation for the
 FU740 PRCI
From: Stephen Boyd <sboyd@kernel.org>
To: Zong Li <zong.li@sifive.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 robh+dt@kernel.org
Date: Tue, 15 Dec 2020 19:21:58 -0800
Message-ID: <160808891852.1580929.2514120348145455057@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_222201_456298_5BBDAFEF 
X-CRM114-Status: UNSURE (   4.60  )
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
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Zong Li (2020-11-25 19:00:43)
> Add YAML DT binding documentation for the SiFive FU740 PRCI. The
> link of unmatched board as follow, the U740-C000 manual would be present
> in the same page later.
> 
>     https://www.sifive.com/boards/hifive-unmatched
> 
> Passes dt_binding_check.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
