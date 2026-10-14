Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014C0CC6B27
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 09:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UV4I3tHjX3VPag97hhysI0FddtVRW2Xy2OYf+v/2AfA=; b=YgXBud2MC0ufRY
	ZhxJuKK6wMWrzWaaQBGs6pKTqgqvETVZHrIHTPyDjYI1i73IK4yndrIMmxj4y6zC7BalI7ULNmI1I
	+gPfbPEsia5rQz41KgLRFd7FNz1pNJRX45eyNU5zFQ/gsjy+H58ezYBJKPwjg+lJ3NyEenBll0Iyf
	nJyj2m1COUqtM6qmC/yYfHVcF8PCTATPKbNzogVm5vypL5QPipnJ8LamdK0aTVjptpZ/FZ8G/9jrz
	TteyUJNSOOwW3X4F29C9AM1J7t84w/tTD8QKwQHtLCnWjtX6zhTDQahvhvWfoVzuWhtl5BMd4eP7R
	aN3MpkIAK1Pw1KMhfAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGurY-0000000Expf-2S4A;
	Wed, 14 Oct 2026 09:01:28 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGurV-0000000Exns-3EUQ
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 09:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=aZ70Bda2wR4tgUkkfG3mO3arhPKAoD3lBwt1ddMtEwQ=;
	b=Q+kttkgpQ0e2i8bIbagMwx/ukwEk2zKJGpJPqJmS2q7WUBuGsbhK/Q7zIBc3Ku
	x/bhbvkxuBr2ADoU4t6XEsRfnO9fUseTOrJSaT0fD0+eG4YsNXeEFIjViZKJ70r8
	cEhXiRpgj/jA42Aoo4IYoRyVK2lODSaePqn4odiWwls2I=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wBnBm+LRM9qglnrEQ--.9660S2;
	Wed, 14 Oct 2026 16:59:56 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: anup@brainfault.org,
	tglx@kernel.org
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu,
	bjorn@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	radu@rendec.net,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	hppiscas@163.com
Subject: Re: [PATCH v2] irqchip/riscv-imsic: Reject overlapping group index fields
Date: Wed, 14 Oct 2026 16:59:53 +0800
Message-ID: <caplitmus-rv.reply.20261014.imsic-status.85740c15051c433f9f475e9a23d95636@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <caplitmus-rv.v2.imsic.f2c0e5bdc627451c83deb0cf7eb8834a@163.com>
References: <caplitmus-rv.v2.imsic.f2c0e5bdc627451c83deb0cf7eb8834a@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wBnBm+LRM9qglnrEQ--.9660S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTR_rcTUUUUU
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7QzCi2rPRIweLQAA32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_020126_152032_E6CC707B 
X-CRM114-Status: UNSURE (   5.10  )
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

Hi Anup, Thomas,

Following up on the standalone v2, which received Anup's Reviewed-by.
It is limited to the lower-bound overlap check for a nonzero group
index field.

Could you please let me know whether it is queued or if anything else
is needed?

Thanks,
Pengpeng


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
