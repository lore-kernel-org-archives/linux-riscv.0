Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167DBC4829E
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 12:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GEaMNWT/JZ5nq+VDH61zkFFWD3qgZMd96v2ngL47SL8=; b=hNA3wW+hCWS5KX
	SGny3BroV0W8W6T1wATPpBTsNM/AHe55rX3UKWbI6dSo+o7qWwa+BSppcaeodd7AMLyy5nEHr7XXx
	1VcqsIgTfXNlBDUpoOHdU/qsgsyiY+aC+ChJFk5OG4gvg/Si9yizkxMMQepQKYpgKhauo/TGZ+kYG
	/VRJ5Dfr9UCQgOwReWLINjPAgQty8JpiNG1cd+Sy8is8MFbuJ6e5PWxmMDo6cRQAw0qEX3o91O7AI
	h/k0KJf13OdratMF2MoEHfu+JSFic5v8kJ6FDs4iIdxTDuvxpA4RZwr+YOZBfEfjIaSvGNZ8z9QsF
	a3+GDkNTWald/FZG60sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rab7M-0000000GHHg-3Dh9;
	Thu, 15 Feb 2024 12:45:32 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rab7J-0000000GHFm-02le
	for linux-riscv@lists.infradead.org;
	Thu, 15 Feb 2024 12:45:31 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rab7B-0003jZ-Iz; Thu, 15 Feb 2024 13:45:21 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rab77-000t5u-9s; Thu, 15 Feb 2024 13:45:17 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rab77-0007iB-0k;
	Thu, 15 Feb 2024 13:45:17 +0100
Message-ID: <8981ec7d30444d2127ee97f5c804f8837ae5c6ce.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/4] reset: simple: add support for Sophgo SG2042
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 chao.wei@sophgo.com,  conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com,  paul.walmsley@sifive.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,  haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com, guoren@kernel.org,  jszhang@kernel.org,
 inochiama@outlook.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Date: Thu, 15 Feb 2024 13:45:17 +0100
In-Reply-To: <1cfd7b3ba447942784c4f7aa595e962399e9f617.1706577450.git.unicorn_wang@outlook.com>
References: <cover.1706577450.git.unicorn_wang@outlook.com>
	 <1cfd7b3ba447942784c4f7aa595e962399e9f617.1706577450.git.unicorn_wang@outlook.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_044529_161176_F52A8380 
X-CRM114-Status: UNSURE (   5.09  )
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

On Di, 2024-01-30 at 09:50 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Reuse reset-simple driver for the Sophgo SG2042 reset generator.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
