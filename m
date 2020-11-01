Return-Path: <SRS0=HNWJ=EH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDC2C2D0A3
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2020 12:10:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24D532085B
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2020 12:10:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FfDGeeXt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jM+hx5F+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24D532085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5o1H4B4cmdStvsGepdHl+zxhZGjOb5xBifrjSR8GA3I=; b=FfDGeeXtti2XSQWBXntyF/Fj2
	u6+w3mxIHYdJ4XO3j7CVPdnYbnokRDEWlVUUWreP+SlRfvofpZJxC2BBTGqT4bfKVsu1rbG6njjjL
	oSPkSNiAWO+Y8GJPuntaK4dImn8kEF/4yByec0fP2Fbpx2QQ6qrs+T2DXB2ZOVy9jHeiuU4cUt+h0
	kLX7Y2bHnmnhDsbMjNqfFwxV2efkJPDGEfS0xGWvBXUb3o/FXxatEiNi2Kzuwjb0BiRXu5gtBuBsQ
	I5vSO5Ci+kY5btFhrKPsH5RCmm9h7VNaQne1xrQmv6BYjwAl7TIAIXZ4LH0KT1d1Mj0j24F/LgmbB
	hsop/2Egw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZCBy-0008Oc-ON; Sun, 01 Nov 2020 12:10:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZCBw-0008Mi-F7
 for linux-riscv@lists.infradead.org; Sun, 01 Nov 2020 12:10:37 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9CFD20870;
 Sun,  1 Nov 2020 12:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604232635;
 bh=pdVWHPmd4uAe+FndPjmn2EeHjCnqsqezsPeF6IRcpHI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jM+hx5F+dACiPf+stY33/c4R1RbxfpiZmRLl5ETIcdhq1ck3IjqpE5ib5dnMpfVqv
 XuZbpSCpRzgqRSKmpME9SWKp+kSFiJ8iDLbdzuqN9N3peEyigtCi5HKbpKsYXnxt6B
 qrnnMDK0GSgyN73Uu3PDhetD/t+/ZTy/yNuqkGAI=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kZCBt-006PeF-8R; Sun, 01 Nov 2020 12:10:33 +0000
From: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Greentime Hu <greentime.hu@sifive.com>, palmer@dabbelt.com,
 linux-kernel@vger.kernel.org, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 anup@brainfault.org
Subject: Re: [RFC PATCH] irqchip/sifive-plic: Fix getting wrong chip_data when
 interrupt is hierarchy
Date: Sun,  1 Nov 2020 12:10:27 +0000
Message-Id: <160423261831.76459.6853837344029171039.b4-ty@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029023738.127472-1-greentime.hu@sifive.com>
References: <20201029023738.127472-1-greentime.hu@sifive.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: tglx@linutronix.de, jason@lakedaemon.net,
 geert+renesas@glider.be, greentime.hu@sifive.com, palmer@dabbelt.com,
 linux-kernel@vger.kernel.org, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, anup@brainfault.org,
 uli+renesas@fpond.eu, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_071036_617060_2EEDEB7B 
X-CRM114-Status: GOOD (  12.29  )
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
Cc: linux-renesas-soc@vger.kernel.org, Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 29 Oct 2020 10:37:38 +0800, Greentime Hu wrote:
> This oops is caused by a wrong chip_data and it is because plic_irq_unmask
> uses irq_get_chip_data(irq_data->irq) to get the chip_data. However it may
> get another irq_data with the same irq_data->irq if it is hierarchy.
> 
> In this case, it will get irq_data of sifive_gpio_irqchip instead of
> plic_chip so that it will get a wrong chip_data and then the wrong lmask
> of it to cause this oops.
> 
> [...]

Applied to irq/irqchip-next, thanks!

[1/1] irqchip/sifive-plic: Fix chip_data access within a hierarchy
      commit: f9ac7bbd6e4540dcc6df621b9c9b6eb2e26ded1d

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
