Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A32C77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 01:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZIcozhWBZ1ibMkK1bnyfEmja0MXJ2eLeYnUIxCxyas=; b=tBLTCjoijR+wK7
	ufFmOUVWFCDHmVNZn2eDw25oI3Enq7APdmgIyNlpAg4z9O2kf9ed616E959aUqteaSDU11xzu7CU3
	xwWckuBed+UwdSwkyFFheYvkxasQWUAHfsDX+97DC7S7qndrIcHRy6DSdeCs1gUQ0QEdMFeYc4EbO
	pzAjA6NaibC21CDFPZtRvMO47zHs/5PVwIGhKokSCkJjFQ6cKu/g8atRqMUdbgVQNoGPVJFGQ6pKu
	meiWY6i543eyTEko4n+Idh7kkajXaK8lyM6Eevt/QasSNDc8QvabOnAa+XRuotbzTUiayuvawXIfM
	vSiblPOo2Kntz8Zbcrcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwvKg-007SyP-1L;
	Thu, 11 May 2023 01:43:02 +0000
Received: from m12.mail.163.com ([220.181.12.196])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwvKd-007Sxq-37
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 01:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=NIad5
	o/gCF/UbBioYF/NhdVu7OxbA2d0uZxhfg7phII=; b=EqDt6WIJwLIN9EIlhPeEq
	su1mQn9rqyxiIKdCJ1yrMEap+ZOAmyDVKyFK4wWwgErhuOOEKhYDeFreqKP3oETK
	yBppZY6aZ6L+w80vuh+ZQsV6yGABJyBMTbkEIAVyhj8hAXvGHeCx/cpENUPbebV4
	VKedhJPIcr918o2Jzq9o8I=
Received: from zhangf-virtual-machine.localdomain (unknown [180.111.102.183])
	by zwqz-smtp-mta-g2-4 (Coremail) with SMTP id _____wCHxjYWSFxkD+YgBg--.56513S2;
	Thu, 11 May 2023 09:42:46 +0800 (CST)
From: zhangfei <zhang_fei_0403@163.com>
To: ajones@ventanamicro.com
Cc: aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	zhang_fei_0403@163.com,
	zhangfei@nj.iscas.ac.cn
Subject: Re: [PATCH] riscv: Optimize memset 
Date: Thu, 11 May 2023 09:42:43 +0800
Message-Id: <20230511014243.3336-1-zhang_fei_0403@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510-0adf0b2a2956ca1cd426a2d2@orel>
References: <20230510-0adf0b2a2956ca1cd426a2d2@orel>
MIME-Version: 1.0
X-CM-TRANSID: _____wCHxjYWSFxkD+YgBg--.56513S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFy7urW3XF4rWF1xXrWkJFb_yoW8Aw17pr
	95JF1DKF4qgwnakw429w4IqrWYk3Z5JF1rXFWUJ3srA3s0g34rtF93KF4Y9a9rGrnakay2
	vr45Xr1fXF1UZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEGYLDUUUUU=
X-Originating-IP: [180.111.102.183]
X-CM-SenderInfo: x2kd0w5bihxsiquqjqqrwthudrp/1tbiWxVsl2I0Z+m5pQABsw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_184300_358308_AD627D82 
X-CRM114-Status: GOOD (  15.89  )
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

From: zhangfei <zhangfei@nj.iscas.ac.cn>

On Wed, May 10, 2023 at 14:58:22PM +0200, Andrew Jones wrote:
> On Wed, May 10, 2023 at 11:52:43AM +0800, zhangfei wrote:
> > From: zhangfei <zhangfei@nj.iscas.ac.cn>
> > 
> > On Tue, May 09, 2023 11:16:33AM +0200, Andrew Jones wrote: 
> > > On Tue, May 09, 2023 at 10:22:07AM +0800, zhangfei wrote:
> > > > 
> > > > Hi,
> > > > 
> > > > I filled head and tail with minimal branching. Each conditional ensures that 
> > > > all the subsequently used offsets are well-defined and in the dest region.
> > > 
> > > I know. You trimmed my comment, so I'll quote myself, here
> > > 
> > > """
> > > After the check of a2 against 6 above we know that offsets 6(t0)
> > > and -7(a3) are safe. Are we trying to avoid too may redundant
> > > stores with these additional checks?
> > > """
> > > 
> > > So, again. Why the additional check against 8 above and, the one you
> > > trimmed, checking 10?
> > 
> > Hi,
> > 
> > These additional checks are to avoid too many redundant stores. 
> > 
> > Adding a check for more than 8 bytes is because after the loop 
> > segment '3' comes out, the remaining bytes are less than 8 bytes, 
> > which also avoids redundant stores.
> 
> So the benchmarks showed these additional checks were necessary to avoid
> making memset worse? Please add comments to the code explaining the
> purpose of the checks.

Hi,

As you mentioned, the lack of these additional tests can make memset worse. 
When I removed the checks for 8 and 10 above, the benchmarks showed that the 
memset changed to 0.21 bytes/ns at 8B. Although this is better than storing 
byte by byte, additional detections will bring a better improvement to 0.27 bytes/ns.

Due to the chaotic response in my previous email, I am sorry for this. I have 
reorganized patch v2 and sent it to you. Please reply under the latest patch.

Thanks,
Fei Zhang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
