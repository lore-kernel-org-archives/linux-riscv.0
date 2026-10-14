Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE9ECC6B1A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 09:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vt7qW5g/3cmOvphon67Hf5s0jorH0/B9ezaIwVMcO8U=; b=wU5uVAhfxBg/Iz
	zSLUcES5cUZ/bidgpQzb/c0OBmhbvZgnagKon0jB3CQQtaW5R7PCQs9gt3+/o+X5xlCaT4QlhLoSL
	HwATdzNyGI4QmETSd9HnRGumycLmH6p0algyi1N88blcyCZqdIWGuYy/lmcDOERCwSMRgQ68gs7qm
	VX+dPjU4AMTKnHItN+E0aiISEW1UjlCZE4RVrIWxHWriYd8GGsNuLT9vu2pD1FmP/6PdlIh72xFPr
	Uha9aSj0UmjJxgc4GATNwaTwwBob/9Jtq3uIf7FhYPM29869sSPP6S7Wh1byRAZ3CwNaozTT27fDM
	GkZqtvTQM4JzIQscC3UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGurv-0000000ExwD-3Dg1;
	Wed, 14 Oct 2026 09:01:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuru-0000000Exvi-2dyR;
	Wed, 14 Oct 2026 09:01:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eSj2Ehj3rTJ7XqMU1hdnsqqWovY4bdv9LbzLlMxB5Ss=; b=rDUKrNgNakwpzukyYCVTcz5bK8
	jIgebTpGd/EiuW+zHAN3BVyEDors9GuHW9T+hdTMWu/lvHlD7fcjgzxgp20REiyddXoYZDe6hvRwh
	gYAHn4/tDlYM7GeJL4pEvrR4CUKfJ6BXCz2NPFv1gfZni45KJzn3AcN2mOBUZ/VPSE4huIUB7xcwB
	aCasNf6lgrNpawqDSiwCVOLJHn/VBt1NXRaB2zeS+0/n04j8hybQ5Tn6z+B+/3lW5bgjB+kWcvQsK
	WkNdnmuYh5Cfz2SwvECxL8t9vtxem68uZpt5+hbuq8Z9UBele5EmJBTLVo+P+UZA7QYV3j2gyseLo
	UNw1xyMA==;
Received: from m16.mail.163.com ([117.135.210.4])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGurq-0000000GXFx-3nPu;
	Wed, 14 Oct 2026 09:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=eSj2Ehj3rTJ7XqMU1hdnsqqWovY4bdv9LbzLlMxB5Ss=;
	b=Hg2LdJYyqwbd6mR/mqBidrUAZruGbSJSyyLgJXS1TOjdWDkfUeQ3ZNfYOA/kvm
	mlCyU5bvP8p4GhTGimxXNRz6gKlZjhTqi/RZPgFADPYTTGMkYeqyviAb4E8GRx2f
	pT+PmXiKFF7pB/KvHwBCiuU8mJK6uUX19EQvJRZ9kXO7Y=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBXtj_ERM9qyf14Eg--.14109S2;
	Wed, 14 Oct 2026 17:00:53 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: anup@brainfault.org
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	nutty.liu@hotmail.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	hppiscas@163.com
Subject: Re: [PATCH v2 0/2] RISC-V: KVM: Validate AIA MMIO ranges against GPA width
Date: Wed, 14 Oct 2026 17:00:50 +0800
Message-ID: <caplitmus-rv.reply.20261014.aia-status.3387a76a787b44fca8fd288ba84ec964@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1789872556.git.hppiscas@163.com>
References: <cover.1789872556.git.hppiscas@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wBXtj_ERM9qyf14Eg--.14109S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUesqXDUUUU
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7gXQmWrPRMUpaAAA3H
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_100147_548234_68C101CD 
X-CRM114-Status: UNSURE (   4.92  )
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

Hi Anup,

A brief follow-up on this v2 series. Patch 1 preserves the required
address checks and limits initialization revalidation to APLIC, as
discussed. Patch 2 keeps the reviewed GPA-width freeze unchanged.

Is anything else needed before the series can be picked up?

Thanks,
Pengpeng


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
