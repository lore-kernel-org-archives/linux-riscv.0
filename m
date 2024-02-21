Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB6CC48BF6
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 11:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LdVjCWRQYsBkFzHf5vr57YBDF0b/HPuFbVtOBh5c6M8=; b=gP36NV4iPzlLzc
	YdnoTkvtk21sReFBaByy07l0uwTwD2NtlugppMZSI7PVi3/lJ5cP5sOxw92P00mJTqRwlylXHQc69
	QKJZNrfp0S1yxjxHXtS3UHThPoE97+IPS8b5KSGvJOv5Zl2lJ1yqS+vJ44EtjEI239jxAE4pX1oG3
	/ggB4OR4nNuJZlAllL964lgKUnBMwu0HhMUzE+YVoFF93CVv5mDnkqcXbfzwmtpvFXKGCk/UCLxW1
	wP2O4A/P2my+cM6QPCgxt3QIHB32JJVPqtVMGDRiBvtVETYp68xZKmxSvHuDBhaSJG1e0Wun+7IMK
	zr1UGcogOCWzeD62iJfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rckZ3-00000000eNs-2AHK;
	Wed, 21 Feb 2024 11:15:01 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rckYy-00000000eKm-1Tbo
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 11:14:59 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rckYo-0006Z1-G5; Wed, 21 Feb 2024 12:14:46 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rckYl-0021lP-6U; Wed, 21 Feb 2024 12:14:43 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rckYl-0005JE-0O;
	Wed, 21 Feb 2024 12:14:43 +0100
Message-ID: <6aeef5bcc9ce007bdd3312f6b96ffb06655ae909.camel@pengutronix.de>
Subject: Re: [PATCH v3 0/4] riscv: sophgo: add reset support for SG2042
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 chao.wei@sophgo.com,  conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com,  paul.walmsley@sifive.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,  haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com, guoren@kernel.org,  jszhang@kernel.org,
 inochiama@outlook.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Date: Wed, 21 Feb 2024 12:14:43 +0100
In-Reply-To: <cover.1706577450.git.unicorn_wang@outlook.com>
References: <cover.1706577450.git.unicorn_wang@outlook.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_031456_557454_482F56F0 
X-CRM114-Status: UNSURE (   6.65  )
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

On Tue, 30 Jan 2024 09:49:08 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> This series adds reset controller support for Sophgo SG2042 using
> reset-simple driver.
> 
> Thanks,
> Chen
> 
> [...]

Applied patches 1-2 to reset/next, thanks!

[1/4] dt-bindings: reset: sophgo: support SG2042
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=41197eb5f993
[2/4] reset: simple: add support for Sophgo SG2042
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=a6166a4da5e4

regards
Philipp



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
