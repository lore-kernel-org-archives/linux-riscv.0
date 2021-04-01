Return-Path: <SRS0=bkE6=I6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB970C433ED
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 01:38:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FC1E60FE9
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 01:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FC1E60FE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xjml6e12Jdi9ysm+49zjeJ/w9yX0BNwYfqO6U/IE0vQ=; b=mayPYMAdHBAR7k
	QqGOqjHLm4VycH1xJxBZ3sTvNh1mMGU8aYisPOIDT4Nh7Ih5dLolracZ001dJl+B6xBJ93+taa/RP
	vs5tu08aiz8w9iDKmxnL2s7qD2j2MbuqHf38vUMA/PEUcA5m4gdkuQi2msJmT13lqKuFMgdUmyhuv
	59HxnlD+n8v+Kx/um7bdjfFFYZVpXl/RLl1vkUR2BFWY4ffE0mGQfy5O2mrXmyo7fTnDP7cyohWWF
	Tyok4BaILOontdsortm6yQoM9wldhd7NiLBwzCsgkro/vPHkMxqaiOt5reOzWBYl8841ZMlXF4i06
	VwT3Qs6Zq5WSUcF346Vw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRmI0-0087vL-K2; Thu, 01 Apr 2021 01:38:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRmHw-0087uy-Q2
 for linux-riscv@lists.infradead.org; Thu, 01 Apr 2021 01:38:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 35DEF61001;
 Thu,  1 Apr 2021 01:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617241103;
 bh=lXPrmLD8cR13af0zzzzRyCkEh9/F2LOtjr4TPKAihQs=;
 h=In-Reply-To:References:Subject:From:To:Date:From;
 b=r0YN/a+crPqLnr9k3CcPd18eCft+dH+aFjTQw+bB1hAk8yooWEG22xb511q2/z8nl
 rmWlrMwEFb/Ndd0BxBdLQelYlaDLtTWNhfC1LPfAKYwxOBL6Xn44dUD8rugmbfbADu
 udLSYfBDbawC9QLg61U3wJcF6T9iXx8KNfUfX2+1BKdi5lrJy+3/CGp9p5Annu73nf
 q51hNsYQGadMTZSayypg5fjojDLbB6Z6+ya8DzL5uKFdSU7sWYHxww08AxUmrPAza9
 WqIeitQ7nNkNBIZ62d8UugpefyNHcMUfOxo76tIVxYJN9fgwlzPt1N7UE5WCObX+ZK
 sC3apKlqudenQ==
MIME-Version: 1.0
In-Reply-To: <20210331092605.105909-2-greentime.hu@sifive.com>
References: <20210331092605.105909-1-greentime.hu@sifive.com>
 <20210331092605.105909-2-greentime.hu@sifive.com>
Subject: Re: [PATCH v3 1/6] clk: sifive: Add pcie_aux clock in prci driver for
 PCIe driver
From: Stephen Boyd <sboyd@kernel.org>
To: alex.dewar90@gmail.com, aou@eecs.berkeley.edu, bhelgaas@google.com,
 devicetree@vger.kernel.org, erik.danie@sifive.com, greentime.hu@sifive.com,
 hayashi.kunihiko@socionext.com, helgaas@kernel.org, hes@sifive.com,
 jh80.chung@samsung.com, khilman@baylibre.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, lorenzo.pieralisi@arm.com,
 mturquette@baylibre.com, p.zabel@pengutronix.de, paul.walmsley@sifive.com,
 robh+dt@kernel.org, vidyas@nvidia.com, zong.li@sifive.com
Date: Wed, 31 Mar 2021 18:38:21 -0700
Message-ID: <161724110197.2260335.12311143415074941643@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_023825_218813_6EBC7E51 
X-CRM114-Status: UNSURE (   4.66  )
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

Quoting Greentime Hu (2021-03-31 02:26:00)
> We add pcie_aux clock in this patch so that pcie driver can use
> clk_prepare_enable() and clk_disable_unprepare() to enable and disable
> pcie_aux clock.
> 
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---

With robot fix

Acked-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
